addEventListener("fetch", event => {
  event.respondWith(handleRequest(event.request));
});

async function handleRequest(request) {
  const url = new URL(request.url);

  return await fetch(`${S3_BUCKET_PREFIX}${url.pathname}`);
}
