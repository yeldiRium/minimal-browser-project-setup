# Minimal Browser Project Setup

A very minimal (although extensive looking) project setup for developing and
shipping browser applications without any framework.

There is intentionally no setup for tests so you can decide what to use for that
yourself.

## Careful

The versions of installed dependencies in this setup might be outdated. Always
run `npm outdated` and update dependencies if needed before shipping anything
built on this.

## Development

Set up your local environment:

```bash
nvm use 12 # if you use nvm to manage your node environments
npm install

docker-compose build dev
```

Run the application locally in development mode:

```bash
docker-compose up dev
```

This will run the [webpack-dev-server](https://github.com/webpack/webpack-dev-server)
in a docker container serving your application. If you make changes to your code,
the server will reload automatically.

If you want to run the application on your computer without docker, run:

```bash
npm run serve
```

### Linting

[ESLint](https://eslint.org/) and [Prettier](https://prettier.io/) are [preinstalled](https://prettier.io/docs/en/integrating-with-linters.html) and use the default configuration.

## Shipping

When you want to ship this application, all you need to do is build the `Dockerfile`,
push the resulting image to some registry and deploy the result in any container
orchestration environment.
