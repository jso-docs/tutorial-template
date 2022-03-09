using Dates, Emporium, GitHub

files_to_keep_updated = [
  ".github/workflows/CompatHelper.yml",
  ".github/workflows/Deploy.yml",
  ".editorconfig",
  ".gitignore",
  "getdeps.sh",
]

clone_dir = "cloned-repos"

# Clone all jso-docs repos
auth = GitHub.authenticate(ENV["GITHUB_AUTH"])
user = GitHub.whoami(auth = auth).login
Emporium.clone_organization_repos(
  "jso-docs",
  clone_dir,
  auth = auth,
  dry_run = false,
  exclude = ["jso-docs.github.io", "tutorial-template"],
)

# Copy all files_to_keep_updated
path = pwd()
for file in files_to_keep_updated
  Emporium.run_on_folders(
    (; kwargs...) -> begin
      cp(joinpath(path, file), file, force=true)
      run(`git add $file`)
    end,
    clone_dir,
  )
end

# Change the preview deploy branch
Emporium.run_on_folders(
  (; basename = "", kwargs...) -> begin
    new_deploy = replace(read(".github/workflows/Deploy.yml", String), "tutorial-template" => basename)
    open(".github/workflows/Deploy.yml", "w") do io
      write(io, new_deploy)
    end
    run(`git add .github/workflows/Deploy.yml`)
  end,
  clone_dir,
)

# Branch and commit
branch = Dates.format(now(), "Y-mm-dd-") * bytes2hex(rand(UInt8, 4))
Emporium.run_on_folders(
  (; basename = "", dirname = "", kwargs...) -> begin
    if Emporium.git_has_to_commit()
      run(`git checkout -b $branch`)
      run(`git commit -am ":wrench: Updating files to keep up with template"`)
      run(`git push -u origin $branch`)
      Emporium.create_pull_request(
        "jso-docs/$basename",
        "Updating files to keep up with template",
        "This semi-automated pull request is updating files to keep up with the jso-docs/tutorial-template.\n\ncc @$user",
        branch,
        auth = auth,
        dry_run = false,
        base = "main",
      )
    else
      println("Nothing to do for $basename")
    end
  end,
  clone_dir,
)

# # Clean up
run(`rm -rf $clone_dir`)