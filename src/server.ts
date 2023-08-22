import express from 'express'
import pino from 'pino'
import pinoElastic from 'pino-elasticsearch'

const streamToElastic = pinoElastic({
  index: 'an-index',
  node: 'http://localhost:9200',
  esVersion: 7,
  flushBytes: 1000
})

const logger = pino({ level: 'info' }, streamToElastic)

const app = express()

app.get('/', (req, res) => {
    logger.info('hello world')
    res.send('Hello World')
})

app.listen(3000, () => `Server listan on 3000`)