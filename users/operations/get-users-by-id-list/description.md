This API allows you to pass a list of user ids and get back the user metadata for each one. It is implemented as a POST so that the ids can be specified in the body instead of the url. This allows you to specify up to 1000 user ids.

This API will only return metadata for users that are in the same organization as the caller.

### Authentication

Requires `Authorization` header with valid Bearer token for scope `itwin-platform`.

For more documentation on authorization and how to get access token visit [OAUTH2 Authorization](https://developer.bentley.com/apis/overview/authorization/) page.

### Rate limits

All iTwin Platform API operations have a rate limit. For more documentation on that visit [Rate limits and quotas](https://developer.bentley.com/apis/overview/rate-limits/) page.
