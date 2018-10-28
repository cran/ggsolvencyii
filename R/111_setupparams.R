## GNU General Public License version 3 , see file LICENCE ============== =====
##
##    sourcefile of package 'ggsolvencyii'
##    Copyright (C) <2018>  < Marco van Zanden , git@vanzanden.nl >
##
##    This program is free software: you can redistribute it and/or modify
##    it under the terms of the GNU General Public License as published by
##    the Free Software Foundation, either version 3 of the License, or
##    (at your option) any later version.
##
##    This program is distributed in the hope that it will be useful,
##    but WITHOUT ANY WARRANTY; without even the implied warranty of
##    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##    GNU General Public License for more details.
##
##    You should have received a copy of the GNU General Public License
##    along with this program.  If not, see <https://www.gnu.org/licenses/>.
##
##
## functions in this file =============================================== =====
##
## main:
##
## small:
##    fn_levelonedescription
##    fn_maxscrvalue
## ====================================================================== =====

## fn_levelonedescription =============================================== =====
#' fn_levelonedescription extracts the name of level 1 item from the structure
#'
#' @inheritParams fn_maxscrvalue
# '  @param params the params send by the geom_class, possible adjusted by setup_params.
#'
#' @return the value maxscrvalue, whether or not this is provided by the user
# ' @exportnot
#'
# ' @examples

fn_levelonedescription <- function(params) {
    structuredf     <- params$structuredf
    levelonedescription <- structuredf$description[structuredf$level == 1]
  ## return results
    return(levelonedescription)
}



## fn_maxscrvalue ======================================================= =====
#' fn_maxscrvalue
#' all elements in the resulting dataset are scaled to surface of value of the largest level 1 (SCR) element
#'  in the set, unless the value to be scaled to is provided as a parameter.
#'
#' @param data the data send by the geom_class, the result of the integration of user supplied data and expanded structure .
#' @param params the params send by the geom_class, possible adjusted by setup_params.
#'
#' @return the value maxscrvalue, whether or not this is provided by the user.
# ' @exportnot
#'
# ' @examples

fn_maxscrvalue <- function(data, params
                          ) {
      levelonedescription <- params$levelonedescription
      ## afleiden maxscrvalue for scaling
        if (!is.null(params$maxscrvalue)) {
          value_out <- params$maxscrvalue
          print(paste0("scaling is based on inputvalue (maxscrvalue) of ",
                       value_out))
        } else {
          value_out <- max(data$value[data$description == levelonedescription])
            print(paste0("scaling is based on a max (level= 1) value of ",
                         value_out ))
          # }
        }
      ## return results
        return(value_out)
    }
## fn_constructionplotdetails============================================ =====
#' fn_constructionplotdetails
#'
#' When no plotdetails table is given then a default table is constructed based on the current structure.
#'
#' @param structure the structure dataframe
#'
#' @return a dataframe columns levelordescription, surface, outline1 .. 11, with TRUE for all fields

fn_constructionplotdetails <- function(structure) {

      lvl <- c(structure$level,
               paste0(structure$level, "o"),
               paste0(structure$level, "d"))
      plotdetails <- data.frame(levelordescription = lvl,
                               surface = TRUE,
                               outline1 = TRUE,
                               outline2 = TRUE,
                               outline3 = TRUE,
                               outline4 = TRUE,
                               outline11 = TRUE,
                               outline13 = TRUE)
    ## deduplicate
      plotdetails <- plotdetails[!duplicated(plotdetails), ]
    ## removal of lines with double lettercodes (i.e. 'do', 'dd')
      ## 2do ##
    ## return results
      return(plotdetails)
    }

## ====================================================================== =====