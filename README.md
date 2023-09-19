# from original code
# RailsConf 2019

We refactored this application in a [RailsConf talk](https://www.youtube.com/watch?v=LhX5COR8WXc). If you're interested in following along or practicing yourself, check out the video along with:

* The [slides](https://slides.com/jamesdabbs/refactoring-live-primitive-obsession#/)
* Our [starting point](https://github.com/jamesdabbs/greatbook/tree/rc/initial)
* The [commit log](https://github.com/jamesdabbs/greatbook/compare/rc/initial...rc/complete) for the changes we made along the way


# Changes in This Fork
* ## Migration from Schema

```bash
rails db:schema:load
```

* ## Docker Support
This fork includes a Docker container configuration. If you wish to run the application inside Docker, execute:
```bash
docker-compose up

```
* ## Webpacker Removal

Webpacker was removed because it was causing issues, particularly on Mac M1 environments. It has been partially replaced with Turbolinks. Although Turbolinks doesn't fully replicate Webpacker's capabilities, the primary focus of this repository is on refactoring rather than UI. Therefore, the application should be functional for its intended purpose.






