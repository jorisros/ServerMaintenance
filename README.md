# Backup scripts

## Backup github repository
To create an backup of an Github repository there is the script ``reposity_backup.sh``.

This has script has the following parameters

| Variable | Description | Example |
|----------|-------------|---------|
| GITHUB_TOKEN        | When want to backup an repository that is private. Then create an personal token.   |   |
| GITHUB_ORGANISATION | User or organisation | jorisros |
| GITHUB_REPO_NAME    | Name of the repository | BoilerPlateBundle |
| GITHUB_BRANCH       | The branch that will be downloaded | main |
| GITHUB_DESTINATION  | The location where files will be stored locally | ./ |

The example variables create an backup of the following repository: https://github.com/jorisros/BoilerPlateBundle

For more documentation about personal tokens see following url: https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token

### Usage
```
cp .env_example .env
```
Then update the content of the ``.env`` file and run the following command
```
./repository_backup.sh
```