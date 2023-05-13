module.exports = {
  '**/*.{tsx,jsx,ts,js,mjs,cjs}': 'eslint --cache --fix',
  '**/*.{css,scss}': 'stylelint',
  '*': 'prettier --cache --ignore-unknown --write',
};
