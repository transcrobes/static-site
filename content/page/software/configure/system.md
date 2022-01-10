---
title: System Actions
comments: false
---

{{< notice warning >}}
Whenever a new version is deployed you will need to first refresh the browser page (refresh button, F5, etc.) and **then close the browser**. Transcrobes makes heavy use of "service workers", which need all browser tabs to be closed before taking effect. On Android, you may also need to clear the browser from memory, as Google is very aggressive in caching and this sometimes means it won't perform the refresh. While they don't happen very often, we are working to minimise these issues!
{{< /notice >}}

The Transcrobes user interface is developed using standard web technologies where possible/available. The main web application is based on a (mainly) <a target="_blank" href="https://web.dev/progressive-web-apps/">offline-first, Progressive Web Application</a> architecture. 

In simple terms, that means it downloads as much as possible when you are connected to the internet, and then regularly checks to see whether there are updates. If you aren't connected, then most things should still work however. The reason everyone doesn't write sites/web applications like this is because it gets complicated quickly! Below are some "quick fix" actions you can take if you notice any glitches in The Matrix.

# Quick fix buttons

| Name | Task Type | Time taken | Comments |
|----------|-------------|------|------|
| Refresh Caches | Delete all cached resources | instant | Delete all cached resources (javascript, images, content files, etc.). These get reloaded automatically later |
| Reload DB | Ensure DB synchronisation | almost instant | Sometimes synchronisation with the server can get stuck. This will force the database to ensure it is up-to-date |
| Reinstall DB | Recreate local database | ~10-20 minutes | While this should never be necessary, support may ask you to perform this action to debug an issue. This will delete all the resources in your browser and re-download everything from the server. This is basically the same as installing in a new browser profile. |


