const express = require('express');
const { exec } = require('child_process');
const app = express();

app.use(express.json());

app.post('/deploy', (req, res) => {
    console.log('Webhook received');

    exec('/var/www/phpapp/deploy.sh', (err, stdout, stderr) => {
        if (err) {
            console.error(err);
            return res.status(500).send('Deployment failed');
        }
        console.log(stdout);
        res.send('Deployment successful');
    });
});

app.listen(3001, () => console.log('Webhook listener running on port 3001'));
