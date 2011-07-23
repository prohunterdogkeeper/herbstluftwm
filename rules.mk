
# colors
COLOR_ACTION  = "\e[1;33m"
COLOR_FILE    = "\e[1;32m"
COLOR_BRACKET = "\e[0;34m"
COLOR_NORMAL  = "\e[0m"
define colorecho
	@echo -e $(COLOR_BRACKET)"  ["$(COLOR_ACTION)$1$(COLOR_BRACKET)"]  " $(COLOR_FILE)$2$(COLOR_BRACKET)... $(COLOR_NORMAL)
endef


all: $(TARGET)

rb: clean all

$(TARGET): $(OBJ)
	$(call colorecho,LD,$(TARGET))
	@$(LD) -o $@ $(LDFLAGS)  $(OBJ)

$(SRCDIR)/%.o: $(SRCDIR)/%.c $(HEADER)
	$(call colorecho,CC,$<)
	@$(CC) -c $(CFLAGS) -o $@ $<


clean:
	$(call colorecho,RM,$(TARGET))
	@rm -f $(TARGET)
	$(call colorecho,RM,$(OBJ))
	@rm -f $(OBJ)

info:
	@echo Some Info:
	@echo Compiling with: $(CC) -c $(CFLAGS) -o OUT INPUT
	@echo Linking with: $(LD) -o OUT $(LDFLAGS) INPUT

.PHONY: all clean rb info
