NAME        = m_lib.a
INCLUDES    = includes/
SRC_DIR     = src/
OBJ_DIR     = obj/

LIBFT_DIR   = $(INCLUDES)src/libft/
LIBFT       = $(LIBFT_DIR)libft.a

FTPRINTF = $(INCLUDES)src/ft_printf/
FTPRINTF_DIR = $(FTPRINTF)ft_printf.a

CC          = gcc
CFLAGS      = -Wall -Wextra -Werror -g3
AR          = ar rc
RANLIB      = ranlib
RM          = rm -rf

SRC_FILES  += m_error m_free_array m_print_tab m_strdup_tab m_strlen_tab m_str_toupper m_str_tolower

SRC         = $(addprefix $(SRC_DIR), $(addsuffix .c, $(SRC_FILES)))
OBJ         = $(addprefix $(OBJ_DIR), $(addsuffix .o, $(SRC_FILES)))

OBJ_CACHE   = .cache_exists

###

all: $(LIBFT) $(FTPRINTF) $(NAME)

$(LIBFT):
		@make -C $(LIBFT_DIR)

$(FTPRINTF):
		@make -C $(FTPRINTF_DIR)

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
		@make clean -C $(LIBFT_DIR)
		@make clean -C $(FTPRINTF_DIR)
		$(RM) $(OBJ_DIR)
		$(RM) $(OBJ_CACHE)
		@echo "m_lib object files cleaned."

fclean: clean
		$(RM) $(NAME)
		@echo "m_lib archive files cleaned."

re: fclean all
		@echo "Cleaned and rebuilt everything for m_lib."

.PHONY: all clean fclean re

.SILENT:
