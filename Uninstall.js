#!/usr/bin/env -S deno run --allow-write --allow-env


import { desktop_entry } from './Helper/Paths.js'


const { log } = console;
const { remove } = Deno;


await remove(folder,{ recursive : true });
await remove(desktop_entry);