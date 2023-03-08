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
Go the folder where you want to have the code and use the following command to download
```
wget --header="Accept:application/vnd.github.v3.raw" -O - https://api.github.com/repos/jorisros/ServerMaintenance/tarball/main | tar xz && mv jorisros-ServerMaintenance-* maintenance-script
```
Go into the dictory ``cd maintenance-script`` and change the environment variables
```
cp .env_example .env
```
Then update the content of the ``.env`` file and run the following command
```
./repository_backup.sh
```

It is also possible to backup by arguments instead of from the ``.env`` file. Then the variables are overwritten what is been set in the ``.env``. You can call it by giving as the following command.
```
./repository_backup.sh jorisros nginxparser main
```
The token must be set by an environment variable.