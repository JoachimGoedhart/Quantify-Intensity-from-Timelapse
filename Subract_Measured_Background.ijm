// "Subtract_Measured_Background"

  // For each image in a stack, this macro subtracts the 
  // background level calculated from the current selection. 
  // Note that the selection may be a composite (discontinuous) 
  // selection that was created by holding down the shift key.
  macro "Subtract Measured Background" {
      if (selectionType==-1)
         exit("This macro requires an area selection");
      for (i=1; i<=nSlices; i++) {
          setSlice(i);
          getStatistics(area, mean);
          run("Select None");
          run("Subtract...", "value="+mean);
          run("Restore Selection");
      }
  }


