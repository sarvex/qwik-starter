# Qwik City App ⚡️

- [Qwik Docs](https://qwik.builder.io/)
- [Discord](https://qwik.builder.io/chat)
- [Qwik GitHub](https://github.com/BuilderIO/qwik)
- [@QwikDev](https://twitter.com/QwikDev)
- [Vite](https://vitejs.dev/)

---

## Project Structure

This project is using Qwik with [QwikCity](https://qwik.builder.io/qwikcity/overview/). QwikCity is just an extra set of tools on top of Qwik to make it easier to build a full site, including directory-based routing, layouts, and more.

Inside your project, you'll see the following directory structure:

```shell
├── public/
│   └── ...
└── src/
    ├── components/
    │   └── ...
    └── routes/
        └── ...
```

- `src/routes`: Provides the directory based routing, which can include a hierarchy of `layout.tsx` layout files, and an `index.tsx` file as the page. Additionally, `index.ts` files are endpoints. Please see the [routing docs](https://qwik.builder.io/qwikcity/routing/overview/) for more info.

- `src/components`: Recommended directory for components.

- `public`: Any static assets, like images, can be placed in the public directory. Please see the [Vite public directory](https://vitejs.dev/guide/assets.html#the-public-directory) for more info.

## Add Integrations and deployment

Use the `pnpm qwik add` command to add additional integrations. Some examples of integrations include: Cloudflare, Netlify or Express server, and the [Static Site Generator (SSG)](https://qwik.builder.io/qwikcity/guides/static-site-generation/).

```shell
pnpm qwik add # or `yarn qwik add`
```

## Development

Development mode uses [Vite's development server](https://vitejs.dev/). During development, the `dev` command will server-side render (SSR) the output.

```shell
npm start # or `yarn start`
```

> Note: during dev mode, Vite may request a significant number of `.js` files. This does not represent a Qwik production build.

## Preview

The preview command will create a production build of the client modules, a production build of `src/entry.preview.tsx`, and run a local server. The preview server is only for convenience to locally preview a production build, and it should not be used as a production server.

```shell
pnpm preview # or `yarn preview`
```

## Production

The production build will generate client and server modules by running both client and server build commands. Additionally, the build command will use Typescript to run a type check on the source code.

```shell
pnpm build # or `yarn build`
```

## Builder.io + Qwik

An example of using [Builder.io's](https://www.builder.io) drag-and-drop headless CMS with Qwik.

See [src/routes[...index]/index.tsx](src/routes[...index]/index.tsx) for the integration code.

### How to use

Create a free [Builder.io account](https://builder.io/signup) (only takes a couple minutes), and paste your [public API key](https://www.builder.io/c/docs/using-your-api-key) into `.env`

```diff
- BUILDER_PUBLIC_API_KEY=YOUR_API_KEY
+ BUILDER_PUBLIC_API_KEY=abc123
```

Then run the development server:

```bash
pnpm dev
```

Now, go set your [preview URL](https://www.builder.io/c/docs/guides/preview-url) to `http://localhost:5173/`

1. Go to [https://builder.io/models](builder.io/models)
2. Choose the `page` model
3. Set the preview URL to `http://localhost:5173/` and click `save` in the top right

Now, let's create a page in Builder.io and see it live in Qwik!

1. Go to [https://builder.io/content](builder.io/content)
2. Click `+ New` and choose `Page`
3. Give it a name and click `Create`

Now, try out the visual editor! You can find a custom Qwik components
in the `Custom Components` section of the insert tab.

You may also limit visual editing to only your custom components with [components-only mode](https://www.builder.io/c/docs/guides/components-only-mode).

### Next Steps

See our full integration guides [here](https://www.builder.io/c/docs/developers)

Also, when you push your integration to production, go back and update your preview URL to your production URL so now anyone on your team can visually create content in your Qwik app!

Also, to integrate structured data, see [this guide](https://www.builder.io/c/docs/integrate-cms-data)

## Vercel Edge

This starter site is configured to deploy to [Vercel Edge Functions](https://vercel.com/docs/concepts/functions/edge-functions), which means it will be rendered at an edge location near to your users.

## Installation

The adaptor will add a new `vite.config.ts` within the `adapters/` directory, and a new entry file will be created, such as:

```shell
└── adapters/
    └── vercel-edge/
        └── vite.config.ts
└── src/
    └── entry.vercel-edge.tsx
```

Additionally, within the `package.json`, the `build.server` script will be updated with the Vercel Edge build.

## Production build

To build the application for production, use the `build` command, this command will automatically run `pnpm build.server` and `pnpm build.client`:

```shell
pnpm build
```

[Read the full guide here](https://github.com/BuilderIO/qwik/blob/main/starters/adapters/vercel-edge/README.md)

## Dev deploy

To deploy the application for development:

```shell
pnpm deploy
```

Notice that you might need a [Vercel account](https://docs.Vercel.com/get-started/) in order to complete this step!

## Production deploy

The project is ready to be deployed to Vercel. However, you will need to create a git repository and push the code to it.

You can [deploy your site to Vercel](https://vercel.com/docs/concepts/deployments/overview) either via a Git provider integration or through the Vercel CLI.
