const express = require('express');
const app = express();
app.use(express.json());

app.get('/', (req, res) => res.send('Music Education Scheduler API'));

app.listen(3001, () => console.log('Backend running on port 3001'));
