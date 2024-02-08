NAME        = m_lib.a
INCLUDES    = includes/
SRC_DIR     = src/
OBJ_DIR     = obj/

LIBFT_DIR   = $(INCLUDES)src/libft/
LIBFT       = $(LIBFT_DIR)libft.a

FT_PRINTF_DIR = $(INCLUDES)src/ft_printf/
FT_PRINTF     = $(FT_PRINTF_DIR)ft_printf.a

FT_GNL_DIR = $(INCLUDES)src/ft_gnl/
FT_GNL     = $(FT_GNL_DIR)ft_gnl.a

CC          = gcc
CFLAGS      = -Wall -Wextra -Werror -g3
AR          = ar rc
RANLIB      = ranlib
RM          = rm -rf

SRC_FILES   += m_error m_free_tab m_print_tab m_strdup_tab m_strlen_tab m_str_toupper m_str_tolower

SRC         = $(addprefix $(SRC_DIR), $(addsuffix .c, $(SRC_FILES)))
OBJ         = $(addprefix $(OBJ_DIR), $(addsuffix .o, $(SRC_FILES)))

OBJ_CACHE   = .cache_exists

all: $(LIBFT) $(FT_PRINTF) $(FT_GNL) $(NAME)

$(LIBFT):
	@make -C $(LIBFT_DIR)

$(FT_PRINTF):
	@make -C $(FT_PRINTF_DIR)

$(FT_GNL):
	@make -C $(FT_GNL_DIR)

$(NAME): $(OBJ) | $(OBJ_CACHE)
	$(AR) $(NAME) $(OBJ)
	$(RANLIB) $(NAME)
	@echo "\033[0;32m$(shell echo $(NAME) | tr '[:lower:]' '[:upper:]') : Archive created\033[0m"

$(OBJ_DIR)%.o: $(SRC_DIR)%.c | $(OBJ_CACHE)
	@echo "Compiling $<"
	@$(CC) $(CFLAGS) -I$(INCLUDES) -c $< -o $@

$(OBJ_CACHE):
	@mkdir -p $(OBJ_DIR)

clean:
	@make clean -C $(LIBFT_DIR)
	@make clean -C $(FT_PRINTF_DIR)
	@make clean -C $(FT_GNL_DIR)
	$(RM) $(OBJ_DIR)
	$(RM) $(OBJ_CACHE)
	@echo "m_lib object files cleaned."

fclean: clean
	@make fclean -C $(LIBFT_DIR)
	@make fclean -C $(FT_PRINTF_DIR)
	@make clean -C $(FT_GNL_DIR)
	$(RM) $(NAME)
	@echo "m_lib archive files cleaned."

re: fclean all
	@echo "Cleaned and rebuilt everything for m_lib."

.PHONY: all clean fclean re

.SILENT:
