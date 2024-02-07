NAME        = ft_printf.a
INCLUDES    = ./../../
OBJ_DIR     = obj/
SRC_DIR		= src/

CC          = gcc
CFLAGS      = -Wall -Wextra -Werror -g3
AR          = ar rc
RANLIB      = ranlib
RM          = rm -rf

UTILS_DIR  = $(SRC_DIR)utils/
UTILS      = ft_printf_function ft_printf_function2 ft_printf_utils ft_printf_utils2

SRC_FILES  += ft_printf
SRC_FILES  += $(addprefix $(UTILS_DIR), $(UTILS))

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
		@echo "ft_printf object files cleaned."

fclean: clean
		$(RM) $(NAME)
		@echo "ft_printf archive files cleaned."

re: fclean all
		@echo "Cleaned and rebuilt everything for ft_printf."

.PHONY: all clean fclean re

.SILENT:
