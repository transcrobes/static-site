---
title: k3s
comments: false
---

# Who should install Transcrobes on k3s?

[`k3s`](https://k3s.io) is a curl-to-Kubernetes install, intended to make setting up a [Kubernetes](https://kubernetes.io) cluster on a single physical machine or VM easy and relatively painless for development or non-critical CI tasks. It was not initially intended to be used for production but is very handy in edge scenarios, and turned out to be very stable.

That said, if you don't have access to a Kubernetes cluster you can set up k3s on a single machine of a set of machines (with auto-failover multi-master), so it is a perfect way to get started with Transcrobes. The maintainer is using Transcrobes on k3s for his own language learning and for the primary project experiment, so at least it will always be well tested!

# Prerequisites

- A recent Linux distribution on a virtual or physical machine

- A (free) Azure Cloud account with the [Translator Text API](https://azure.microsoft.com/en-us/services/cognitive-services/translator-text-api/) enabled. Transcrobes (currently) uses the Azure (Bing) translation API for machine translation. You do need a credit card for this but your credit card will *NOT* be charged unless you *EXPLICITLY* activate charging. You don't need to do this to benefit from the 2 million characters Azure allows you to lookup/translate/transliterate per month for free. It's a great service and worry-free - it will stop translating rather than start charging your card unless charging is activated. When did Microsoft go and get so awesome?!? :-). Set up a Translator Text API token and write that down somewhere.

- Familiarity with running commands on the Linux command line. Only very basic knowledge of Kubernetes is assumed or required.

- (Optional, sort of) A public IP pointing to the machine with ports 80 and 443 open. One publically resolvable domain pointing to this IP (CNAME or A records).

If you decide to run k3s on a machine that does other things, you should be aware that other sofware can interfere with it and can cause hard-to-diagnose issues, it is therefore strongly discouraged.

If you don't have a public IP pointing to your machine, you will need to manually install SSL certificates into the browsers you will be using for testing (or use something like Let's Encrypt's DNS). Transcrobes is designed to be used everywhere (like on mobile devices on the metro on your way to work!), so for it to actually be useful you'll need a public IP. You can test without one but functionality will be limited and setup a pain.

# Installing microk8s for Transcrobes

Transcrobes has been tested extensively on k3s 1.20.0+. Some earlier versions may work but no effort has been made to ensure it works properly on them.

k3s has its own `ctr` (containerd) and `kubectl`, and this document assumes you do not have a separate ones installed. At the very least you should disable docker while you are using microk8s to avoid interaction issues. If you don't know how both these applications work under the hood, it is easiest to simply uninstall the non-microk8s versions, at least while you are testing Transcrobes. If you have a web server listening on port 80, you will also have extra steps to perform, and you will have to disable it when setting up Transcrobes.

You need to have `snapd` installed on the machine. Full instructions for various distributions can be found [on the Snapcraft site](https://docs.snapcraft.io/installing-snapd/6735). On recent Ubuntu installations that is as simple as:

```
sudo apt install snapd
```

Once installed, you can install microk8s:

```
sudo snap install microk8s --classic
```

In order to allow for easier copy/pasting, you should add an alias for `kubectl`
```
sudo snap alias microk8s.kubectl kubectl
```
Now enable the two microk8s-bundled services we'll be using
```
sudo microk8s.enable storage dns
```

# Install Helm

Transcrobes is packaged as a [Kubernetes Helm](https://helm.sh/) chart, so you need to install that into microk8s first. microk8s packages a whole lot of dross that it doesn't need to - this is a problem because they are *always* behind upstream when integrating updates, so use the snap version, not the microk8s packaged version! First install the command line client
```
sudo snap install helm --classic
```
`helm` 2 required installing stuff into the cluster, `helm` 3 doesn't, so we're done setting up.

# Optional, sort of, install `cert-manager`

Transcrobes takes the pain out of provisioning and updating SSL certificates by leveraging the Kubernetes application `cert-manager`. If you really don't have a public IP or open ports then you will have several manual steps to set up a certificate. We'll update with instructions on that here soon. Otherwise

```
kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v0.14.0/cert-manager.crds.yaml
kubectl create namespace cert-manager
helm install cert-manager jetstack/cert-manager --namespace cert-manager --version v0.14.0
```

# Install Transcrobes
## Sanity check

Before installing Transcrobes, you should ensure all the prerequsite services are installed and running properly
```
kubectl get pods --all-namespaces
```
Should give you something very similar to
```
NAMESPACE      NAME                                                READY   STATUS    RESTARTS   AGE
cert-manager   cert-manager-75f6cdcb64-9fxwt                       1/1     Running   1          3h1m
cert-manager   cert-manager-cainjector-79788689f9-qssdq            1/1     Running   6          3h1m
cert-manager   cert-manager-webhook-5b6c798c9-rt7z4                1/1     Running   0          3h1m
kube-system    coredns-588fd544bf-75rqt                            1/1     Running   0          3h3m
kube-system    hostpath-provisioner-75fdc8fccd-hsrrp               1/1     Running   0          3h3m
```
The GUIDs at the end of the application (pod) names will be different but you should definitely see `Running` in the `STATUS` column and `1/1` in the `READY` column for all 5 lines. You will not have a `cert-manager` line if you are not going to install cert-manager and let Transcrobes automatically manage SSL certificates.

## Install the chart repository

Now you have the required services installed, we can finally install Transcrobes. First add the Transcrobes chart repository

```
helm repo add transcrobes https://charts.transcrob.es
```

## Install Transcrobes

Now actually install Transcrobes. Helm calls an installation into a cluster a "release", and that term is used below to mean "your installation of Transcrobes in microk8s" - you are "releasing" a version of the application.
```
helm install releaseName transcrobes/transcrobes
```
Note: You can call your release anything - `releaseName` is used in the examples here.

Helm will then take care of downloading and installing the various components into microk8s/Kubernetes. It could take a while, depending on your internet connection, as there are some large (docker) image files that need to be downloaded.

Check the status with
```
kubectl get pods
```
You should eventually end up with something very similar (except GUIDs) to the following, so wait until you do. If you don't, then jump on one of the lists and ask for help:
```

NAME                                                        READY   STATUS    RESTARTS   AGE
releaseName-nginxingress-controller-df88695f8-vxktr         1/1     Running   0          134m
releaseName-nginxingress-default-backend-75fc4c85c4-k9dvq   1/1     Running   0          134m
releaseName-transcrobes-corenlp-zh-55f68b5f79-nzrk4         1/1     Running   0          134m
releaseName-transcrobes-transcrobes-7d684cd8cd-4gb6q        1/1     Running   0          95m
tcr-postgres-0                                              1/1     Running   0          134m
```
Again, the important columns are `READY` and `STATUS`. `STATUS` should be `Running` and you should have the same number to the left of the slash (healthy containers) as to the right (total number of containers) for each pod in the `Ready` column.

Notes

If something goes wrong, then by far the easiest way to move forward is to completely purge the Helm release and start again.

```
helm delete releaseName
```

You can now try the release again with the install command. The (useful) data for Transcrobes is all in the database, and even a "complete" purge will NOT destroy the database permanent storage - you need to do that manually. There are sometimes issues with `postgresql` persisting a wonky postgres password, so in order to avoid hard-to-diagnose issues, you are better doing

```
kubectl delete pvc data-tcr-postgres-0
```

## Sidebar - kubectl aliases
kubectl is an awesome tool for managing Kubernetes clusters. It allows you to do pretty much everything. But you need to have some serious json-parsing-foo in order to do many things, and the commands can be very long and difficult to grasp. You can add aliases for pretty much everything though, and the following validation and activation sections assume the following aliases.
```
alias tpn.tcr='kubectl get pod -l component=transcrobes -o jsonpath="{.items[0].metadata.name}"'
alias tpn.nlp='kubectl get pod -l component=corenlp -o jsonpath="{.items[0].metadata.name}"'
alias tpn.pgs='kubectl get pod -l app=postgresql -o jsonpath="{.items[0].metadata.name}"'

alias tip.tcr='kubectl get svc -l component=transcrobes -o jsonpath="{.items[0].spec.clusterIP}"'
alias tip.nlp='kubectl get svc -l component=corenlp -o jsonpath="{.items[0].spec.clusterIP}"'
alias tip.pgs='kubectl get svc -l app=postgresql -o jsonpath="{.items[0].spec.clusterIP}"'
```
These aliases consist of two parts - a prefix `tpn` for Transcrobes Pod Name or `tip` for Transcrobes (service) IP, and a suffix for each application - `tcr` for Transcrobes Core, `ank` for Ankrobes Server, `nlp` for Standford's CoreNLP and `pgs` for PostgreSQL.

Put this in a file and source it manually
```
source whereYouPutIt.sh
```
Or simply add these to your `.bashrc`, `.bash_aliases`, or whatever is sourced when you log on to the machine you are installing on. Don't forget to manually `source` that file before proceeding!

## Setting up the database and adding a user

Transcrobes Core is a Django application, which you need to initialise
```
kubectl exec $(tpn.tcr) -- ./runmanage.sh migrate
```

This should give you output similar to the following. There may be additional lines corresponding to updates if you execute this later but as long as it reports success, the process has finished correctly.
```
Operations to perform:
  Apply all migrations: admin, auth, contenttypes, enrich, sessions
Running migrations:
  Applying contenttypes.0001_initial... OK
  Applying auth.0001_initial... OK
  Applying admin.0001_initial... OK
  Applying admin.0002_logentry_remove_auto_add... OK
  Applying admin.0003_logentry_add_action_flag_choices... OK
  Applying contenttypes.0002_remove_content_type_name... OK
  Applying auth.0002_alter_permission_name_max_length... OK
  Applying auth.0003_alter_user_email_max_length... OK
  Applying auth.0004_alter_user_username_opts... OK
  Applying auth.0005_alter_user_last_login_null... OK
  Applying auth.0006_require_contenttypes_0002... OK
  Applying auth.0007_alter_validators_add_error_messages... OK
  Applying auth.0008_alter_user_username_max_length... OK
  Applying auth.0009_alter_user_last_name_max_length... OK
  Applying enrich.0001_initial... OK
  Applying enrich.0002_auto_20180910_0724... OK
  Applying enrich.0003_bingapitransliteration... OK
  Applying enrich.0004_auto_20181008_0214... OK
  Applying sessions.0001_initial... OK
```
Each actual end-user of the application needs a user. A helper script for creating the user and initialising various database structures is available in the Transcrobes Core pod. Simply connect with the following
```
kubectl exec -it $(tpn.tcr) -- sh
```
And then

```
./adduser.sh your-username
```

You can add the user password directly on the command line via the `-p` or `--password` switches, or you will be prompted for a password if none is provided.

## Activating the release

The Transcrobes Helm chart has default values but they are obviously not usable out of the box, given you have an API token and two (sub-)domains that you need to configure to actually use Transcrobes.

Helm has two ways of overriding the default values, either via command line parameters or in an overrides file. In order to keep the instructions simple, we will only use the overrides file here. Check out [the Helm docs](https://helm.sh/) for more information.

Download the sample file and modify it according to your actual values
```
curl https://gitlab.com/transcrobes/charts/raw/master/sample-overrides.yaml > overrides.yaml
```

```
## Don't uncomment the ingress lines until AFTER you have validated
## you can get certificates from letsencrypt-staging!
transcrobes:
  bingSubscriptionKey: yourAPIToken
  hosts: ['transcrobes.example.com']
  #ingress:
  #  tls:
  #    issuer: letsencrypt-prod

## Only uncomment if you need to modify the incoming port
#nginxingress:
#  controller:
#    service:
#      nodePorts:
#        https: yourPortNumber

```
Do *NOT* uncomment the commented lines yet!

This allows you to run the following, which you should do after replacing the values with your own
```
helm upgrade releaseName transcrobes/transcrobes -f overrides.yaml
```

NOTE:
The following section contains over-simplifications so drastic they aren't strictly accurate - if you know better then you'll know what is intended!

By default, the Transcrobes chart makes the applications available on port `32443` of the public (or NATed) IP of the machine because, by default, Kubernetes/microk8s only lets you use ports 30000-32767. It's possible to make the applications available on the standard ports (80 / 443) but it's a little dangerous, particularly if you are running other stuff on the machine. If you don't have control over which ports you get then this can be changed by uncommenting in the example file, after updating with the port you need
```
#nginxingress:
#  controller:
#    service:
#      nodePorts:
#        https: yourPortNumber
```
Your admin may be able to map the incoming port on the external firewal to a different port on your machine - just ask them to map to 32443, if they can, to avoid further work. Note that if the port is not in the 32000-32767 range, you will need to add the following
```
--service-node-port-range=yourPortsStart-yourPortsFinish
```
\- where `yourPortsStart` and `yourPortsFinish` correspond to the range of ports you have pointing to your machine - to the end of the following file
```
/var/snap/microk8s/current/args/kube-apiserver
```
And restart microk8s
```
sudo microk8s.stop
sudo microk8s.start
```

You can update the overrides file as often as you wish. Simply run
```
helm upgrade releaseName transcrobes/transcrobes -f overrides.yaml
```
To apply the changes. Helm is intelligent enough to only update what has changed so, for example, you won't be restarting any of the applications if you only make a change to one of the proxies.

### Validating the release

You should now be able to access the application on the port configured, execute:

```
curl -k https://transcrobes.example.com:32443/hello
```
Which should return
```
Hello, World!
```
To validate Transcrobes Core.

If you are not going to set up proper SSL certificates then you are done. Follow up in the [installing clients](/page/install/clients/overview) section to start using Transcrobes on actual devices.

### Setting up Let's Encrypt certificates

The Transcrobes helm chart provides automated [Let's Encrypt](https://letsencrypt.org/) (free) certificate setup and renewal via [cert-manager](https://docs.cert-manager.io/en/latest/). Somewhat unfortunately for us, Let's Encrypt will only do automated HTTP validation on port 80, or 443 if you have an existing certificate (which we obviously don't).

If any of the steps here seem too complicated, you also have the option of manually doing Let's Encrypt DNS validation and manually provisioning the certificate. You are also not obliged to use a Let's Encrypt certificate - any valid SSL certificate is Ok. We will update these instructions soon with help on setting up a certificate manually.

cert-manager works by checking the validity of the certificates it manages every now and then and when it's time to renew, it will attempt to update.

If your public IP can have port 80 open and pointing to your machine, then a script is available to temporarily redirect port 80 to the port that cert-manager is expecting the validation request to come to from. If you have a web server listening on port 80, you will need to deactivate that, or set up cert-manager to listen on specific ports and redirect requests to your Transcrobes domains to that port via the web server. The details of this are out of scope for this document but ask on one of the lists if you need help.

Assuming your machine can be accessed on its public IP on port 80, download the script
```
curl https://gitlab.com/transcrobes/charts/raw/master/microk8s-port80.sh > microk8s-port80.sh
```
And set it up to run every few (1-3 is probably a good value) minutes as a `root` cron job/systemd timer. The script requires `socat` and `jq`, which can be installed on Ubuntu with
```
sudo apt install socat jq
```
The script assumes that the public (or NATed) IP address is on the `eth0` device but you can override this by providing the device as a parameter to the script, for example
```
bash microk8s-port80.sh enp0s3
```
The script runs and queries Kubernetes to see whether cert-manager is waiting for a validation request. If it is, it will redirect port 80 to the port that cert-manager is listening on, and then stop redirecting when cert-manager has finished the provisioning or update. If cert-manager is not expecting a validation request, the script will exit (with success) immediately.

Once the script is set up (or you are manually running it in a terminal in a loop), you can go ahead and activate the letsencrypt issuers

```
kubectl apply -f https://gitlab.com/transcrobes/charts/raw/master/transcrobes/utils/letsencrypt-staging-cluster-issuer.yaml
kubectl apply -f https://gitlab.com/transcrobes/charts/raw/master/transcrobes/utils/letsencrypt-prod-cluster-issuer.yaml
```
After you execute this, at some point over the next few minutes cert-manager will wake up, realise there is a domain it needs to provision/update, and start working. If the port redirect script is running, then port 80 will get redirected until cert-manager has finished. You can check whether cert-manager issuer is running by executing
```
kubectl get pods | grep issuer
```
If that command returns something, then an issuer is working. You know that cert-manager has finished when the above command returns nothing. If it can't succeed for any reason, it will stay working until it does. Make sure it has actually appeared and then disappeared before assuming it's finished! The script has pretty detailed logging so check the output of the script to be sure.

Assuming cert-manager finishes successfully, you can proceed to actually get a valid, production certificate. Let's Encrypt has rather strict limits on its production server, so make sure you have no working issuers for the staging server before proceeding. In order to get production certificates, simply uncomment the `ingress` section in the overrides.yaml file, like the following
```
## Don't uncomment the ingress lines until AFTER you have validated you can get certificates from letsencrypt-staging
transcrobes:
  bingSubscriptionKey: yourAPIToken
  hosts: ['transcrobes.example.com']
  ingress:
    tls:
      issuer: letsencrypt-prod

## Only uncomment if you need to modify the incoming port
#nginxingress:
#  controller:
#    service:
#      nodePorts:
#        https: yourPortNumber
```

And run as before
```
helm upgrade releaseName transcrobes/transcrobes --install -f overrides.yaml
```

When the issuer has finished you should check the certificates. Just open a browser and put in (with your domain and port) - `https://ankrobes.example.com:32443`. If you get `Anki Sync Server`, your Ankrobes Server is working. Transcrobes can be checked with `https://transcrobes.example.com:32443/hello`. It should return `Hello, World!` with no certificate error. If both those work, congratulations, you have finished!

Now you too can follow up with the [installing clients](/page/install/clients/overview) section to start using Transcrobes on actual devices. You will now be able to use the Transcrobes client applications on any internet-connected device.

## Problems
Let us know on the lists if you encounter any issues, or you think these instructions aren't clear or have an error.
