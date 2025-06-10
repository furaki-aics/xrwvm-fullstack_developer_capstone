import babelParser from '@babel/eslint-parser';
import js from '@eslint/js';
import globals from 'globals';

export default [
  js.configs.recommended,
  {
    files: ['**/*.js', '**/*.jsx'],
    ignores: [
      '**/node_modules/**',
      '**/dist/**',
      '**/build/**',
      '**/*.min.js',
      '**/db.sqlite3',
      '**/djangoenv/**',
      '**/__pycache__/**',
      '**/*.py',
      '**/*.pyc'
    ],
    languageOptions: {
      ecmaVersion: 2022,
      sourceType: 'module',
      parser: babelParser,
      parserOptions: {
        requireConfigFile: false,
        babelOptions: {
          presets: ['@babel/preset-react']
        }
      },
      globals: {
        ...globals.node,
        ...globals.es6,
        ...globals.browser
      }
    },
    rules: {
      'indent': ['error', 2],
      'linebreak-style': ['error', 'unix'],
      'quotes': ['error', 'single'],
      'semi': ['error', 'always'],
      'no-unused-vars': 'warn',
      'no-console': 'warn',
      'prefer-const': 'error'
    }
  }
];
