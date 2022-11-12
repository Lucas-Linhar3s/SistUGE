# SistUGE


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <meta
    name="description"
    content="SwaggerUI"
  />
  <title>Projeto UGE</title>
  <link rel="stylesheet" href="https://unpkg.com/swagger-ui-dist@4.5.0/swagger-ui.css" />
</head>
<body>
<div id="swagger-ui"></div>
<script src="https://unpkg.com/swagger-ui-dist@4.5.0/swagger-ui-bundle.js" crossorigin></script>

<script>
  window.onload = () => {
    window.ui = SwaggerUIBundle({
      dom_id: '#swagger-ui',
      docExpansion: 'list',
      deepLinking: true,
      url: "swagger.yaml",
      syntaxHighlight: {
        activate: true,
        theme: 'agate',
      },
      persistAuthorization: false,
    });
  };
</script>
</body>
</html>
