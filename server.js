const Koa = require('koa');
const app = new Koa();
var router = require('koa-router')();
console.log('STARTED SERVER!')


router.get('/', ctx => {
    ctx.body = "All fine and dandy"
    console.log("All fine here, go to /error to demo an error")
})

router.get('/error', ctx => {
    ctx.body = "This will throw an error in the logs"
    conosl.log("Oups, typo!")
})

app
    .use(router.routes())
    .use(router.allowedMethods());

app.listen(80);