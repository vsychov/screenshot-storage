const s3BucketPrefix =
  "https://s3.eu-west-1.amazonaws.com/my-bucket-name"; //TODO: move to env

addEventListener("fetch", event => {
  event.respondWith(handleRequest(event.request));
});

async function handleRequest(request) {
  const url = new URL(request.url);

  return await fetch(`${s3BucketPrefix}${url.pathname}`);
}
