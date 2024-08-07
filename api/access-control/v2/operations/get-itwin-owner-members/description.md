---

Retrieves a list of iTwin owner members. iTwin Owners are users which have full control over the iTwin. Each owner is granted all permissions on the iTwin, allowing them to perform any action on the iTwin they own.

### Missing Users

When members are removed from the Bentley Identity Management System, they are not automatically removed from the iTwin. Therefore, it is possible to have a situation where the user is no longer valid, yet they are still a member of the iTwin. When this happens, the user member will be returned from this API endpoint with the follow values:
```
{
    "id": <memberId>,
    "email": null,
    "givenName": null,
    "surname": null,
    "organization": null,
    ...
}
```
You should account for this in your software if you do not want to show these users.

#### Cleanup

The Access Control API will perform a once-a-week cleanup to remove these "Missing Users". You can rely on this automated clean-up if this timeline is sufficient.

If not, you can use the [Remove iTwin Owner Member](https://developer.bentley.com/apis/access-control/operations/remove-iTwin-owner-member/) API (use the memberId) to remove the owner member from the iTwin.

{!Authorization.md!}

### Authorization

The calling user must be a member of the iTwin. Organization Administrator can also retrieve iTwin owner members for any iTwin in their Organization.

{!OrganizationAdministrator.md!}

---
