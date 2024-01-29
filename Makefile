NAME        = m_lib.a
INCLUDES    = includes/
SRC_DIR     = src/
OBJ_DIR     = obj/

CC          = gcc
CFLAGS      = -Wall -Wextra -Werror -g3
AR          = ar rc
RANLIB      = ranlib
RM          = rm -rf

SRC_FILES  += m_error

SRC         = $(addprefix $(SRC_DIR), $(addsuffix .c, $(SRC_FILES)))
OBJ         = $(addprefix $(OBJ_DIR), $(addsuffix .o, $(SRC_FILES)))

OBJ_CACHE   = .cache_exists

###

all: $(NAME)

$(NAME): $(OBJ) | $(OBJ_CACHE)
		$(AR) $(NAME) $(OBJ)
		$(RANLIB) $(NAME)
		@echo "\033[0;32m$(shell echo $(NAME) | tr '[:lower:]' '[:upper:]') : Archive created\033[0m"

$(OBJ_DIR)%.o: $(SRC_DIR)%.c | $(OBJ_CACHE)
		@echo "Compiling $<"
		@$(CC) $(CFLAGS) -I$(INCLUDES) -c $< -o $@

$(OBJ_CACHE):
		@mkdir -p $(OBJ_DIR)
					@mkdir -p $(OBJ_DIR)

clean:
		$(RM) $(OBJ_DIR)
		$(RM) $(OBJ_CACHE)
		@echo "m_lib object files cleaned!"

fclean: clean
		$(RM) $(NAME)
		@echo "m_lib archive files cleaned!"

re: fclean all
		@echo "Cleaned and rebuilt everything for m_lib!"

.PHONY: all clean fclean re

.SILENT:
