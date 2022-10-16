/** @type {import('tailwindcss').Config} */
const { colors } = require('tailwindcss/defaultTheme')

module.exports = {
    content: [
        "./resources/**/*.blade.php",
        "./resources/**/*.js",
        "./resources/**/*.vue",
        "./lariele/**/*.blade.php",
        "./node_modules/flowbite/**/*.js"
    ],
    theme: {
        extend: {
            colors: {
                success: 'var(--color-success)',
            }
        },
    },
    plugins: [
        require('flowbite/plugin')
    ],
}
