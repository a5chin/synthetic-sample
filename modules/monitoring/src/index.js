const functions = require('@google-cloud/functions-framework');
const fetch = require('node-fetch');
const { runSyntheticHandler } = require('@google-cloud/synthetics-sdk-api');
const assert = require('node:assert');
const { GoogleAuth } = require('google-auth-library');
const dotenv = require('dotenv').config();


functions.http('SyntheticFunction', runSyntheticHandler(async () => {
  const auth = new GoogleAuth();
  const cloudRunUrl = process.env.BASE_URL;
  const reqUrl = new URL("/healthz", cloudRunUrl);
  const client = await auth.getIdTokenClient(reqUrl);
  const resp = client.request({url: reqUrl});
  const status = (await resp).status
  return await assert.equal(status, 200);
}));
