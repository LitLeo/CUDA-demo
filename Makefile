ALGNAMES := Common Solution
			
INCFILES := $(addsuffix .h, $(ALGNAMES))
OBJFILES := kernel.o $(addsuffix .o, $(ALGNAMES))

EXEFILE  := exec

NVCCCMD  := nvcc
NVCCFLAG := -arch=sm_35
NVLDFLAG := -lnppi

world: $(EXEFILE)

$(EXEFILE): $(OBJFILES)
	$(NVCCCMD) $(OBJFILES) -o $(EXEFILE) $(NVLDFLAG)

$(OBJFILES): %.o:%.cu $(INCFILES)
	$(NVCCCMD) -G -g -c $(filter %.cu, $<) -o $@ $(NVCCFLAG)

clean:
	rm -rf $(OBJFILES) $(EXEFILE)
