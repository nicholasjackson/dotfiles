# dotfiles
Various configuration dotfiles for Vim, etc

## Go Requirements
1. Install vimgo  and Go
2. Run `vim -c "GoInstallBinaries" -c "qa"i`


## React Requirements
Install eslint, babel-eslint (for ES6 support), and eslint-plugin-react:

npm install -g eslint
npm install -g babel-eslint
npm install -g eslint-plugin-react

Create a config like this in your project's .eslintrc, or do so globally by placing it in ~/.eslintrc:

`
{
    "parser": "babel-eslint",
    "env": {
        "browser": true,
        "node": true
    },
    "settings": {
        "ecmascript": 6,
        "jsx": true
    },
    "plugins": [
        "react"
    ],
    "rules": {
        "strict": 0,
        "quotes": 0,
        "no-unused-vars": 0,
        "camelcase": 0,
        "no-underscore-dangle": 0
    }
}
`
