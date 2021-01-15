module zf_log
    use iso_c_binding
    implicit none
    interface
        subroutine zf_logd_c(text) bind(c,name="zf_logd")
            use,intrinsic::iso_c_binding, only: c_char
            character(kind=c_char),intent(in),dimension(*) :: text
        end subroutine
    end interface

    contains

    subroutine zf_logd(text)
        use,intrinsic :: iso_c_binding
        implicit none
        character(len=*),intent(in) :: text
        character(len=256) :: text_c
        text_c = text//char(0)
        call zf_logd_c(text_c)
    end subroutine

end module