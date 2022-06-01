#!/usr/bin/env -S deno run --allow-read --allow-write --allow-env


import { desktop_entry } from './Helper/Paths.js'
import { entry } from './Helper/Entry.js'

const { writeTextFile } = Deno;
const { log } = console;


// log(entry);


export default async function(){
    await writeTextFile(desktop_entry,entry);    
}

