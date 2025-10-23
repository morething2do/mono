import adapter from '@sveltejs/adapter-static';
import { vitePreprocess } from '@sveltejs/vite-plugin-svelte';

/** @type {import('@sveltejs/kit').Config} */
const config = {
    preprocess: vitePreprocess(),

    kit: {
        adapter: adapter({
            pages: '.svelte-kit/output/client',
            assets: '.svelte-kit/output/client',
            fallback: 'index.html',
            precompress: false,
            strict: false
        })
    }
};

export default config;
