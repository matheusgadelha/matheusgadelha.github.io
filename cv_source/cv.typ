
#import "@preview/basic-resume:0.2.9": *

// Personal Information
#let name = "Matheus Gadelha"
#let location = "Seattle, WA, United States"
#let email = "gadelha@adobe.com"
#let personal-site = "mgadelha.me"
#let phone = "+1 413 404 8505"
#let accent-color = "#900000"

#show: resume.with(
  author: name,
  location: location,
  email: email,
  personal-site: personal-site,
  phone: phone,
  accent-color: accent-color,
  font: "Linux Libertine",
  paper: "us-letter",
  author-position: center,
  personal-info-position: center,
)

== Education

#edu(
  institution: "University of Massachusetts - Amherst",
  location: "Amherst, MA",
  dates: dates-helper(start-date: "2015", end-date: "2021"),
  degree: "Ph.D., Computer Science",
)

#edu(
  institution: "Federal University of Rio Grande do Norte",
  location: "Natal, RN, Brazil",
  dates: dates-helper(start-date: "2008", end-date: "2014"),
  degree: "B.Sc., M.Sc. Computer Science",
)

== Research Experience

#work(
  company: "Adobe Research",
  title: "Senior Research Scientist",
  dates: dates-helper(start-date: "2021", end-date: "Present"),
  location: "",
)

#work(
  company: "Google Perception",
  title: "Research Intern and Student Researcher",
  dates: dates-helper(start-date: "Summer 2020", end-date: "Spring 2021"),
  location: "",
)

#work(
  company: "Adobe Research",
  title: "Research Scientist Intern",
  dates: dates-helper(start-date: "Summer 2019", end-date: ""),
  location: "",
)

#work(
  company: "Amazon Web Services",
  title: "Applied Scientist Intern",
  dates: dates-helper(start-date: "Summer 2018", end-date: ""),
  location: "",
)

#work(
  company: "CICS, University of Massachusetts - Amherst",
  title: "Research Assistant",
  dates: dates-helper(start-date: "Fall 2015", end-date: "2021"),
  location: "",
)
- Deep Learning for 3D Computer Vision.

#work(
  company: "DIMAp, Federal University of Rio Grande do Norte",
  title: "Research Assistant",
  dates: dates-helper(start-date: "2012", end-date: "2014"),
  location: "",
)
- Keypoint descriptors; realistic augmented reality

== Software

#project(
  name: "Adobe Illustrator - Mockup",
  role: "",
  dates: "",
  url: "",
)
- Applying 2D vector art to photographs in a 3D-aware manner.

#project(
  name: "Adobe Project Neo - 3D to Image",
  role: "",
  dates: "",
  url: "",
)
- Controlling text-to-image generation with 3D scenes.

#project(
  name: "Adobe Substance 3D Viewer - 3D to Image",
  role: "",
  dates: "",
  url: "",
)
- Controlling text-to-image generation with 3D scenes.

#project(
  name: "Adobe Substance Stager - 3D to Image",
  role: "",
  dates: "",
  url: "",
)
- Controlling text-to-image generation with 3D scenes.

== Papers

#let my-name = [*Matheus Gadelha*]
#let paper(title, authors, venue) = {
  text(fill: rgb(accent-color))[#title] + [ \ ] + authors + [ \ ] + text(style: "italic")[#venue]
}

// Conference Macros
#let arxiv = "ArXiv"
#let iclr(year) = [International Conference on Learning Representations (ICLR), #year]
#let threedv(year) = [International Conference on 3D Vision (3DV), #year]
#let neurips(year) = [Advances in Neural Information Processing Systems (NeurIPS), #year]
#let iccv(year) = [International Conference on Computer Vision (ICCV), #year]
#let siggraph(year) = [ACM SIGGRAPH, #year]
#let cvpr(year) = [Computer Vision and Pattern Recognition (CVPR), #year]
#let siggraph_asia(year) = [ACM SIGGRAPH Asia, #year]
#let tvcg(year) = [Transactions on Visualization and Computer Graphics (TVCG), #year]
#let eccv_workshop(year) = [European Conference on Computer Vision (ECCV) Workshop, #year]
#let sgp(year) = [Symposium on Geometry Processing (SGP), #year]
#let aivr(year) = [IEEE International Conference on Artificial Intelligence and Virtual Reality (AIVR), #year]
#let eccv(year) = [European Conference on Computer Vision (ECCV), #year]
#let ijcv = [International Journal of Computer Vision (IJCV)]
#let bmvc(year) = [British Machine Vision Conference (BMVC), #year]
#let icpr(year) = [International Conference on Pattern Recognition (ICPR), #year]

// Using enum for a numbered list, styled appropriately
#set enum(numbering: "1.", tight: true)

+ #paper(
    "3D Space as a Scratchpad for Editable Text-to-Image Generation",
    [Oindrila Saha, Vojtech Krs, Radomir Mech, Subhransu Maji, #my-name\*, Kevin Blackburn-Matzen\*],
    arxiv
  )

+ #paper(
    "Residual Primitive Fitting of 3D Shapes with SuperFrusta",
    [Aditya Ganeshan, #my-name, Thibault Groueix, Zhiqin Chen, Siddhartha Chaudhuri, Vladimir Kim, Wang Yifan, Daniel Ritchie],
    arxiv
  )

+ #paper(
    "MeshSplatting: Differentiable Rendering with Opaque Meshes",
    [Jan Held, Sanghyun Son, Renaud Vandeghen, Daniel Rebain, #my-name, Yi Zhou, Anthony Cioppa, Ming C. Lin, Marc Van Droogenbroeck, Andrea Tagliasacchi],
    arxiv
  )

+ #paper(
    "SIGMA-Gen: Structure and Identity Guided Multi-subject Assembly for Image Generation",
    [Oindrila Saha, Vojtech Krs, Radomir Mech, Subhransu Maji, Kevin Blackburn-Matzen\*, #my-name\*],
    iclr(2026)
  )

+ #paper(
    "Seeing Through Clutter: Structured 3D Scene Reconstruction via Iterative Object Removal",
    [Rio Aguina-Kang, Kevin Blackburn-Matzen, Thibault Groueix, Vladimir Kim, #my-name],
    threedv(2026)
  )

+ #paper(
    "Frame In-N-Out: Unbounded Controllable Image-to-Video Generation",
    [Boyang Wang, Xuweiyi Chen, #my-name, Zezhou Cheng],
    neurips(2025)
  )

+ #paper(
    "Reusing Computation in Text-to-Image Diffusion for Efficient Generation of Image Sets",
    [Dale Decatur, Thibault Groueix, Wang Yifan, Rana Hanocka, Vladimir Kim, #my-name],
    iccv(2025)
  )

+ #paper(
    "DMesh++: An Efficient Differentiable Mesh for Complex Shapes",
    [Sanghyun Son, #my-name, Yang Zhou, Matthew Fisher, Zexiang Xu, Ming C. Lin, Yi Zhou],
    iccv(2025)
  )

+ #paper(
    "3D-Fixup: Advancing Photo Editing with 3D Priors",
    [Yen-Chi Cheng, Krishna Kumar Singh, Jae Shin Yoon, Alex Schwing, Liangyan Gui, #my-name, Paul Guerrero, Nanxuan Zhao],
    siggraph(2025)
  )

+ #paper(
    "PreciseCam: Precise Camera Control for Text-to-Image Generation",
    [Edurne Bernal-Berdun, Ana Serrano, Belen Masia, #my-name, Yannick Hold-Geoffroy, Xin Sun, Diego Gutierrez],
    cvpr(2025)
  )

+ #paper(
    "Motion Modes: What Could Happen Next?",
    [Karran Pandey, #my-name, Yannick Hold-Geoffroy, Karan Singh, Niloy J. Mitra, Paul Guerrero],
    cvpr(2025)
  )

+ #paper(
    "Instant3dit: Multiview Inpainting for Fast Editing of 3D Objects",
    [Amir Barda, #my-name, Vladimir Kim, Noam Aigerman, Amit Haim Bermano, Thibault Groueix],
    cvpr(2025)
  )

+ #paper(
    "Text-guided Controllable Mesh Refinement for Interactive 3D Modeling",
    [Yun-Chun Chen, Selena Ling Ling, Zhiqin Chen, Vova Kim, #my-name, Alec Jacobson],
    siggraph_asia(2024)
  )

+ #paper(
    "DMesh: A Differentiable Representation for General Meshes",
    [Sanghyun Son, #my-name, Yang Zhou, Zexiang Xu, Ming C. Lin, Yi Zhou],
    neurips(2024)
  )

+ #paper(
    "GEM3D: Generative Medial Abstractions for 3D Shape Synthesis",
    [Dmitry Petrov, Pradyumn Goyal, Vikas Thamizharasan, Vova Kim, #my-name, Melinos Averkiou, Siddhartha Chaudhuri, Evangelos Kalogerakis],
    siggraph(2024)
  )

+ #paper(
    "Learning Continuous 3D Words for Text-to-Image Generation",
    [Ta-Ying Cheng, #my-name, Thibault Groueix, Matthew Fisher, Radomir Mech, Andrew Markham, Niki Trigoni],
    cvpr(2024)
  )

+ #paper(
    "Generative Rendering: Controllable 4D-Guided Video Generation with 2D Diffusion Models",
    [Shengqu Cai, Duygu Ceylan, #my-name, Chun-Hao Huang, Tuanfeng Y. Wang, Gordon Wetzstein],
    cvpr(2024)
  )

+ #paper(
    "Diffusion Handles: Enabling 3D Edits for Diffusion Models by Lifting Activations to 3D",
    [Karran Pandey, Paul Guerrero, #my-name, Yannick Hold-Geoffroy, Karan Singh, Niloy Mitra],
    cvpr(2024)
  )

+ #paper(
    "3DMiner: Discovering Shapes from Large-Scale Unannotated Image Datasets",
    [Ta-Ying Cheng, #my-name, Soren Pirk, Thibault Groueix, Radomir Mech, Andrew Markham, Niki Trigoni],
    iccv(2023)
  )

+ #paper(
    "ANISE: Assembly-based Neural Implicit Surface rEconstruction",
    [Dmitry Petrov, #my-name, Radomir Mech, Evangelos Kalogerakis],
    tvcg(2023)
  )

+ #paper(
    "Recovering Detail in 3D Shapes Using Disparity Maps",
    [Marissa Ramirez de Chanlatte, #my-name, Thibault Groueix, Radomir Mech],
    eccv_workshop(2022)
  )

+ #paper(
    "PrimFit: Learning to Fit Primitives Improves Few Shot Learning on Point Clouds",
    [Gopal Sharma, Bidya Dash, #my-name, Aruni RoyChowdhury, Marios Loizou, Evangelos Kalogerakis, Liangliang Cao, Erik Learned-Miller, Rui Wang and Subhransu Maji],
    sgp(2022)
  )

+ #paper(
    "PlanarRecon: Real-time 3D Plane Detection and Reconstruction from Posed Monocular Videos",
    [Yiming Xie, #my-name, Fengting Yang, Xiaowei Zhou, Huaizu Jiang],
    cvpr(2022)
  )

+ #paper(
    "Trace Match & Merge: Long-Term Field-Of-View Prediction for AR Applications",
    [Adam Viola\*, Sahil Sharma\*, Pankaj Bishnoi\*, #my-name, Stefano Petrangeli, Haoliang Wang, Viswanathan Swaminathan. #text(fill: rgb(accent-color))[*Best paper candidate*].],
    aivr(2021)
  )

+ #paper(
    "Deep Manifold Prior",
    [#my-name, Rui Wang, Subhransu Maji. #text(fill: rgb(accent-color))[*Best poster honorable mention at NECV*].],
    [arXiv: 2004.04242]
  )

+ #paper(
    "Label-Efficient Learning on Point Clouds using Approximate Convex Decompositions",
    [#my-name\*, Aruni RoyChowdhury\*, Gopal Sharma, Evangelos Kalogerakis, Liangliang Cao, Erik Learned-Miller, Rui Wang, Subhransu Maji],
    eccv(2020)
  )

+ #paper(
    "Learning Generative Models of Shape Handles",
    [#my-name, Giorgio Gori, Duygu Ceylan, Radomir Mech, Nathan Carr, Tamy Boubekeur, Subhransu Maji, Rui Wang],
    cvpr(2020)
  )

+ #paper(
    "Inferring 3D Shapes from Image Collections using Adversarial Networks",
    [#my-name, Aartika Rai, Subhransu Maji, Rui Wang],
    ijcv
  )

+ #paper(
    "Shape Reconstruction using Differentiable Projections and Deep Priors",
    [#my-name, Rui Wang, Subhransu Maji],
    iccv(2019)
  )

+ #paper(
    "A Bayesian Perspective on the Deep ImagePrior",
    [Zezhou Cheng, #my-name, Daniel Sheldon, Subhransu Maji. #text(fill: rgb(accent-color))[*Best poster at NECV*].],
    cvpr(2019)
  )

+ #paper(
    "Multiresolution Tree Networks for 3D Point Cloud Processing",
    [#my-name, Rui Wang, Subhransu Maji],
    eccv(2018)
  )

+ #paper(
    "A Deeper Look at 3D Shape Classifiers",
    [Jong Chyi-Su, #my-name, Rui Wang, Subhransu Maji],
    [Second Workshop on 3D Reconstruction Meets Semantics (ECCV), 2018]
  )

+ #paper(
    "Unsupervised 3D Shape Induction from 2D Views of Multiple Objects",
    [#my-name, Subhransu Maji, Rui Wang],
    threedv(2017)
  )

+ #paper(
    "3D Shape Reconstruction from Sketches via Multi-view Convolutional Networks",
    [Zhaoliang Lun, #my-name, Evangelos Kalogerakis, Subhransu Maji, Rui Wang],
    [International Conference on 3D Vision (3DV - _Oral_), 2017]
  )

+ #paper(
    "Shape Generation using Spatially Partitioned Point Clouds",
    [#my-name, Subhransu Maji, Rui Wang],
    bmvc(2017)
  )

+ #paper(
    "DRINK: Discrete Robust INvariant Keypoints",
    [#my-name, Bruno Motta],
    icpr(2014)
  )


== Service

- Area Chair at CVPR 2025, 2026
- Area Chair at WACV 2024, 2025
- Reviewer for ICCV 2019, 2021, 2023, 2025
- Reviewer for CVPR 2018, 2019, 2020, 2021, 2022, 2023, 2024
- Reviewer for LatinX Workshop at CVPR, 2022
- Reviewer for TPAMI 2018, 2021, 2023
- Reviewer for ECCV 2018, 2020, 2022
- Reviewer for Computer and Graphics Journal 2018, 2024
- Reviewer for SIGGRAPH 2023, 2024, 2025
- Reviewer for SIGGRAPH Asia 2018, 2022, 2024
- Reviewer for Pacific Graphics 2019
- Reviewer for Computer Graphics and Applications 2021, 2022
- Reviewer for IJCV 2022, 2024
- Graduate Student Representative at CICS -- UMass Amherst, 2019-2020

== Teaching Experience

#work(
  title: "Teaching Assistant",
  company: "University of Massachusetts Amherst",
  dates: "",
  location: "Amherst, MA",
)
- Spring 2018 - Undergraduate Computer Vision
- Fall 2018 - Graduate Computer Vision
- Spring 2019 - Introduction to Computer Graphics

#work(
  title: "Temporary Lecturer",
  company: "Federal University of Rio Grande do Norte",
  dates: dates-helper(start-date: "2014", end-date: "2015"),
  location: "Natal, RN, Brazil",
)
- Introduction to Algorithms and Numerical Analysis
