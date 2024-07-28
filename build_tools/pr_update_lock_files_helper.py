from pathlib import Path

import click


@click.command()
@click.option(
    "--select-build",
    default="",
    help=(
        "Regex to filter the builds we want to update environment and lock files. By"
        " default all the builds are selected."
    ),
)
@click.option(
    "--skip-build",
    default=None,
    help="Regex to skip some builds from the builds selected by --select-build",
)
@click.option(
    "--select-tag",
    default=None,
    help=(
        "Tag to filter the builds, e.g. 'main-ci' or 'scipy-dev'. "
        "This is an additional filtering on top of --select-build."
    ),
)
@click.option(
    "-v",
    "--verbose",
    is_flag=True,
    help="Print commands executed by the script",
)
@click.option(
    "-vv",
    "--very-verbose",
    is_flag=True,
    help="Print output of commands executed by the script",
)
def main(select_build, skip_build, select_tag, verbose, very_verbose):
    target_path = Path(".").parent / "files" / "update-lock-files.txt"
    with target_path.open("a", encoding="utf-8") as f:
        f.write(f"{select_build=}, {skip_build=}, {select_tag=}\n")


if __name__ == "__main__":
    main()
