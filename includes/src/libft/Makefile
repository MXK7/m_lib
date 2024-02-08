NAME        = libft.a
INCLUDES    = ./../../
OBJ_DIR     = obj/
SRC_DIR     = src/

CC          = gcc
CFLAGS      = -Wall -Wextra -Werror -g3
AR          = ar rc
RANLIB      = ranlib
RM          = rm -rf

FT_IS_DIR    = ft_is/
FT_IS    	 = ft_isprint ft_isalpha ft_isascii ft_isdigit

FT_MEM_DIR   = ft_mem/
FT_MEM   	 = ft_memcpy ft_memcpy ft_memmove ft_memcmp ft_memset ft_memchr ft_calloc ft_bzero

FT_PUT_DIR   = ft_put/
FT_PUT   	 = ft_putnbr_fd ft_putendl_fd ft_putstr_fd ft_putchar_fd

FT_TO_DIR    = ft_to/
FT_TO    	 = ft_atoi ft_itoa ft_tolower ft_toupper

FT_STR_DIR   = ft_str/
FT_STR   	 = ft_strchr ft_strncmp ft_strcmp ft_strlcpy ft_strdup ft_strlen ft_strrchr ft_strcat ft_strcpy ft_strncat ft_strnstr ft_substr ft_strmapi ft_strjoin ft_strtrim ft_split ft_strlcat ft_striteri

FT_LST_DIR = ft_lst/
FT_LST 	 = ft_lstnew ft_lstadd_front ft_lstlast ft_lstsize ft_lstadd_back ft_lstclear ft_lstdelone ft_lstiter ft_lstmap

SRC_FILES   += $(addprefix $(FT_IS_DIR), $(FT_IS))
SRC_FILES   += $(addprefix $(FT_MEM_DIR), $(FT_MEM))
SRC_FILES   += $(addprefix $(FT_PUT_DIR), $(FT_PUT))
SRC_FILES   += $(addprefix $(FT_STR_DIR), $(FT_STR))
SRC_FILES   += $(addprefix $(FT_LST_DIR), $(FT_LST))

SRC         = $(addsuffix .c, $(SRC_FILES))
OBJ         = $(addprefix $(OBJ_DIR), $(addsuffix .o, $(SRC_FILES)))

OBJ_CACHE   = .cache_exists

###

all: $(NAME)

$(NAME): $(OBJ) | $(OBJ_CACHE)
		$(AR) $(NAME) $(OBJ)
		$(RANLIB) $(NAME)
		@echo "\033[0;32m$(shell echo $(NAME) | tr '[:lower:]' '[:upper:]') : Archive created\033[0m"

$(OBJ_DIR)%.o : %.c | $(OBJ_CACHE)
		@echo "Compiling $<"
		@$(CC) $(CFLAGS) -I$(INCLUDES) -c $< -o $@

$(OBJ_CACHE):
		@mkdir -p $(OBJ_DIR)
		@mkdir -p $(OBJ_DIR)$(FT_IS_DIR)
		@mkdir -p $(OBJ_DIR)$(FT_MEM_DIR)
		@mkdir -p $(OBJ_DIR)$(FT_PUT_DIR)
		@mkdir -p $(OBJ_DIR)$(FT_STR_DIR)
		@mkdir -p $(OBJ_DIR)$(FT_TO_DIR)
		@mkdir -p $(OBJ_DIR)$(FT_LST_DIR)
		@touch $(OBJ_CACHE)

clean:
		$(RM) $(OBJ_DIR)
		$(RM) $(OBJ_CACHE)
		@echo "libft object files cleaned."

fclean: clean
		$(RM) $(NAME)
		@echo "libft archive files cleaned."

re: fclean all
		@echo "Cleaned and rebuilt everything for libft."

.PHONY: all clean fclean re

.SILENT:
