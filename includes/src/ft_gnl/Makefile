NAME        = ft_gnl.a
INCLUDES    = ./../../
OBJ_DIR     = obj/
SRC_DIR     = src/

CC          = gcc
CFLAGS      = -Wall -Wextra -Werror -g3
AR          = ar rc
RANLIB      = ranlib
RM          = rm -rf

SRC_FILES   += get_next_line get_next_line_utils

SRC         = $(addprefix $(SRC_DIR), $(addsuffix .c, $(SRC_FILES)))
OBJ         = $(addprefix $(OBJ_DIR), $(addsuffix .o, $(SRC_FILES)))

OBJ_CACHE   = .cache_exists

###

all: $(NAME)

$(NAME): $(OBJ) | $(OBJ_CACHE)
		$(AR) $(NAME) $(OBJ)
		$(RANLIB) $(NAME)
		@echo "\033[0;32m$(shell echo $(NAME) | tr '[:lower:]' '[:upper:]') : Archive created\033[0m"

$(OBJ_DIR)%.o : $(SRC_DIR)%.c | $(OBJ_CACHE)
		@mkdir -p $(@D)
		@echo "Compiling $<"
		@$(CC) $(CFLAGS) -I$(INCLUDES) -c $< -o $@

$(OBJ_CACHE):
		@mkdir -p $(OBJ_DIR)
		@touch $(OBJ_CACHE)

clean:
		$(RM) $(OBJ_DIR)
		$(RM) $(OBJ_CACHE)
		@echo "ft_gnl object files cleaned."

fclean: clean
		$(RM) $(NAME)
		@echo "ft_gnl archive files cleaned."

re: fclean all
		@echo "Cleaned and rebuilt everything for ft_gnl."

.PHONY: all clean fclean re

.SILENT:
