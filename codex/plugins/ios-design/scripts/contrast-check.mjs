#!/usr/bin/env node
import fs from "node:fs";

const file = process.argv[2];
if (!file) {
  console.error("Usage: contrast-check.mjs <tokens.json>");
  process.exit(2);
}

const payload = JSON.parse(fs.readFileSync(file, "utf8"));
const pairs = payload.pairs;
if (!Array.isArray(pairs)) {
  console.error("tokens.json must contain a pairs array");
  process.exit(2);
}

function hexToRgb(hex) {
  const normalized = hex.replace(/^#/, "");
  if (!/^[0-9a-fA-F]{6}$/.test(normalized)) {
    throw new Error(`Invalid hex color: ${hex}`);
  }
  const value = Number.parseInt(normalized, 16);
  return [
    (value >> 16) & 255,
    (value >> 8) & 255,
    value & 255,
  ].map((component) => component / 255);
}

function linearize(channel) {
  return channel <= 0.03928
    ? channel / 12.92
    : ((channel + 0.055) / 1.055) ** 2.4;
}

function luminance(hex) {
  const [r, g, b] = hexToRgb(hex).map(linearize);
  return 0.2126 * r + 0.7152 * g + 0.0722 * b;
}

function contrast(a, b) {
  const lighter = Math.max(luminance(a), luminance(b));
  const darker = Math.min(luminance(a), luminance(b));
  return (lighter + 0.05) / (darker + 0.05);
}

let failed = false;
for (const pair of pairs) {
  const name = pair.name ?? `${pair.foreground} on ${pair.background}`;
  const minimum = Number(pair.minimum ?? 4.5);
  const ratio = contrast(pair.foreground, pair.background);
  const pass = ratio >= minimum;
  console.log(`${pass ? "PASS" : "FAIL"} ${name}: ${ratio.toFixed(2)} (min ${minimum})`);
  if (!pass) {
    failed = true;
  }
}

process.exit(failed ? 1 : 0);
