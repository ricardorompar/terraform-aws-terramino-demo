# /**** **** **** **** **** **** **** **** **** **** **** ****
#  Add LARS to the ADMIN team - workshops+lars@hashicorp.com
# **** **** **** **** **** **** **** **** **** **** **** ****/

resource "tfe_team_members" "admins" {
  team_id   = data.tfe_team.admins.id
  usernames = ["demo-lars"]
}

# /**** **** **** **** **** **** **** **** **** **** **** ****
#  Add AISHA to the DEVELOPERS team - workshops+aisha@hashicorp.com
# **** **** **** **** **** **** **** **** **** **** **** ****/

resource "tfe_team_members" "developers" {
  team_id   = data.tfe_team.developers.id
  usernames = ["demo-aisha"]
}

# /**** **** **** **** **** **** **** **** **** **** **** ****
#  Add HIRO to the MANAGERS - workshops+hiro@hashicorp.com
# **** **** **** **** **** **** **** **** **** **** **** ****/

resource "tfe_team_members" "managers" {
  team_id   = data.tfe_team.managers.id
  usernames = ["demo-hiro"]
}
