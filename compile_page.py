import markdown
from typing import List
import os
import argparse

import re


def parse_experience(experience_md: str) -> List[str]:
    pattern = r":::job\s*(.*?)\s*:::"
    matches = re.findall(pattern, experience_md, re.DOTALL | re.MULTILINE)

    experiences = []

    for match in matches:
        md = markdown.markdown(match)
        # for every img tag in md string, make max-width 150px
        md = re.sub(r"<img", "<img class='float-left'", md)

        # wrap md in article tag
        md = f"<article>{md}</article>"

        experiences.append(md)

    return experiences


def parse_techtransfer(techtransfers_md: str) -> List[str]:
    pattern = r":::tech\s*(.*?)\s*:::"
    matches = re.findall(pattern, techtransfers_md, re.DOTALL | re.MULTILINE)

    techtransfers = []

    for match in matches:
        # select venue by finding [[[venue]]] in match and then remove it
        venue_pattern = r"\[\[\[(.*?)\]\]\]"
        venue_match = re.search(venue_pattern, match)
        venue_tag = ""
        if venue_match:
            venue_name = venue_match.group(1)
            venue_tag = f"<header>{venue_name}</header>"
            match = re.sub(venue_pattern, "", match)

        # select project page link by finding [[Project Page](link)] and then remove it
        # IMPORTANT: [[Project Page]... is a string, not something we will capture!
        project_link_pattern = r"\[\[Project Page\]\((.*?)\)\]"
        project_link_match = re.search(project_link_pattern, match)
        project_link = ""
        project_tag = ""
        if project_link_match:
            project_link = project_link_match.group(1)
            match = re.sub(project_link_pattern, "", match)
            project_tag = f'<a href={project_link}><i class="fa-solid fa-globe"></i></a>'

        # select project page link by finding [[Pre-print](link)] and then remove it
        # IMPORTANT: [[Pre-print]... is a string, not something we will capture!
        preprint_link_pattern = r"\[\[Pre-print\]\((.*?)\)\]"
        preprint_link_match = re.search(preprint_link_pattern, match)
        preprint_link = ""
        preprint_tag = ""
        if preprint_link_match:
            preprint_link = preprint_link_match.group(1)
            match = re.sub(preprint_link_pattern, "", match)
            preprint_tag = f'<a href={preprint_link}><i class="fa-solid fa-file-pdf"></i></a>'

        md = markdown.markdown(match)
        # for every img tag in md string, make max-width 150px
        md = re.sub(r"<img", "<img class='float-left'", md)

        linktag = f'<footer>{preprint_tag} &nbsp;&nbsp;&nbsp; {project_tag}</footer>'

        # wrap md in article tag
        md = f"<article>\n" f"{venue_tag}\n" f"{md}\n" f"{linktag}\n" f"</article>\n\n"

        techtransfers.append(md)

    return techtransfers



def parse_papers(papers_md: str) -> List[str]:
    pattern = r":::paper\s*(.*?)\s*:::"
    matches = re.findall(pattern, papers_md, re.DOTALL | re.MULTILINE)

    papers = []

    for match in matches:
        # select venue by finding [[[venue]]] in match and then remove it
        venue_pattern = r"\[\[\[(.*?)\]\]\]"
        venue_match = re.search(venue_pattern, match)
        venue_tag = ""
        if venue_match:
            venue_name = venue_match.group(1)
            venue_tag = f"<header>{venue_name}</header>"
            match = re.sub(venue_pattern, "", match)

        # select project page link by finding [[Project Page](link)] and then remove it
        # IMPORTANT: [[Project Page]... is a string, not something we will capture!
        project_link_pattern = r"\[\[Project Page\]\((.*?)\)\]"
        project_link_match = re.search(project_link_pattern, match)
        project_link = ""
        project_tag = ""
        if project_link_match:
            project_link = project_link_match.group(1)
            match = re.sub(project_link_pattern, "", match)
            project_tag = f'<a href={project_link}><i class="fa-solid fa-globe"></i></a>'

        # select project page link by finding [[Pre-print](link)] and then remove it
        # IMPORTANT: [[Pre-print]... is a string, not something we will capture!
        preprint_link_pattern = r"\[\[Pre-print\]\((.*?)\)\]"
        preprint_link_match = re.search(preprint_link_pattern, match)
        preprint_link = ""
        preprint_tag = ""
        if preprint_link_match:
            preprint_link = preprint_link_match.group(1)
            match = re.sub(preprint_link_pattern, "", match)
            preprint_tag = f'<a href={preprint_link}><i class="fa-solid fa-file-pdf"></i></a>'

        md = markdown.markdown(match)
        # for every img tag in md string, make max-width 150px
        md = re.sub(r"<img", "<img class='float-left'", md)

        linktag = f'<footer>{preprint_tag} &nbsp;&nbsp;&nbsp; {project_tag}</footer>'

        # wrap md in article tag
        md = f"<article>\n" f"{venue_tag}\n" f"{md}\n" f"{linktag}\n" f"</article>\n\n"

        papers.append(md)

    return papers


def parse_interns(interns_md: str) -> List[str]:
    pattern = r":::intern\s*(.*?)\s*:::"
    matches = re.findall(pattern, interns_md, re.DOTALL | re.MULTILINE)

    interns = []

    for match in matches:
        lines = match.strip().splitlines()
        main_lines = [l for l in lines if not l.strip().startswith("now at")]
        now_at_lines = [l.strip()[len("now at"):].strip() for l in lines if l.strip().startswith("now at")]

        main_md = markdown.markdown(" ".join(main_lines).strip())
        main_md = re.sub(r"^<p>(.*)</p>$", r"\1", main_md, flags=re.DOTALL)

        if now_at_lines:
            now_at_md = markdown.markdown(now_at_lines[0])
            now_at_md = re.sub(r"^<p>(.*)</p>$", r"\1", now_at_md, flags=re.DOTALL)
            interns.append(f"<li>{main_md}<br><small>now at {now_at_md}</small></li>")
        else:
            interns.append(f"<li>{main_md}</li>")

    return interns


arg_parser = argparse.ArgumentParser(
    description="Compile webpage contents into html file"
)
arg_parser.add_argument("template", type=str, help="Template file to use")

presentation_md = os.path.join("content", "presentation.md")
tt_preamble_md = os.path.join("content", "tt_preamble.md")
experience_md = os.path.join("content", "experience.md")
techtransfer_md = os.path.join("content", "techtransfer.md")
papers_md = os.path.join("content", "papers.md")
service_md = os.path.join("content", "service.md")
interns_md = os.path.join("content", "interns.md")

if __name__ == "__main__":
    args = arg_parser.parse_args()

    with open(args.template, "r") as f:
        template = f.read()

    with open(presentation_md, "r") as f:
        presentation = f.read()

    with open(tt_preamble_md, "r") as f:
        tt_preamble = f.read()

    with open(experience_md, "r") as f:
        experience = f.read()

    with open(techtransfer_md, "r") as f:
        techtransfer = f.read()

    with open(papers_md, "r") as f:
        papers = f.read()

    with open(service_md, "r") as f:
        service = f.read()

    with open(interns_md, "r") as f:
        interns = f.read()

    presentation_html = markdown.markdown(presentation)
    tt_preable_html = markdown.markdown(tt_preamble)
    service_html = markdown.markdown(service)

    experience_html_list = parse_experience(experience)
    experience_html = "\n".join(experience_html_list)

    techtransfer_html_list = parse_techtransfer(techtransfer)
    techtransfer_html_column1 = "\n".join(techtransfer_html_list[0::2])
    techtransfer_html_column2 = "\n".join(techtransfer_html_list[1::2])

    papers_html_list = parse_papers(papers)
    papers_html = "\n".join(papers_html_list)

    interns_html_list = parse_interns(interns)
    interns_html_column1 = "\n".join(interns_html_list[0::3])
    interns_html_column2 = "\n".join(interns_html_list[1::3])
    interns_html_column3 = "\n".join(interns_html_list[2::3])

    with open("index.html", "w") as f:
        f.write(
            template.format(
                presentation=presentation_html,
                tt_preamble=tt_preable_html,
                experience=experience_html,
                papers=papers_html,
                techtransfers_column1=techtransfer_html_column1,
                techtransfers_column2=techtransfer_html_column2,
                service=service_html,
                interns_column1=interns_html_column1,
                interns_column2=interns_html_column2,
                interns_column3=interns_html_column3,
            )
        )
