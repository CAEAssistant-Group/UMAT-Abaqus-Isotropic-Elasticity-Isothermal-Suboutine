# UMAT-Abaqus-Suboutine
 When the standard material models in the Abaqus library don't meet the material behavior equation requirements, tools like VUMAT/UMAT Abaqus subroutines provide a solution. These tools allow you to define custom material behaviors tailored to your specific needs.

In this project, we utilized the UMAT Abaqus subroutine to analyze two different problems.

The first problem, as shown in the figure, involves a 3D anisotropic isothermal beam. We solved it once using Abaqus's built-in material model and again using the UMAT Abaqus subroutine, comparing the stress patterns. The results matched exactly.

https://github.com/CAEAssistant-Group/UMAT-Abaqus-Suboutine/blob/main/Screenshots/Iso.jpg

In the second problem, we examined the behavior of a composite in 2D space using the UMAT Abaqus Subroutine. The Tsai-Hill criterion was also calculated as a state variable, and its contour was plotted. For verification, we analyzed the same problem using Abaqus's built-in material model, plotting both the stress contour and the Tsai-Hill failure criterion contour. Once again, the results from Abaqus's material model aligned perfectly with the UMAT Abaqus subroutine results.

Additionally, we’ve made all modeling files and a free training video on UMAT and related workshops available on our website for download.

There’s also a free PDF offering a comprehensive explanation of the UMAT subroutine and workshops, which we highly recommend.

By the way, our website includes other workshops on the UMAT subroutine, along with numerous other useful tutorials.
