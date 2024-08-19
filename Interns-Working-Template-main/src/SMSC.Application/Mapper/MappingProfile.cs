using AutoMapper;
using SMSC.Application.Dto;
using SMSC.Core.Entities;

namespace SMSC.Application.Mapper
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            // employee
            CreateMap<Employee, EmployeeDto>();

            CreateMap<Employee, EmployeeDto>().ReverseMap();

        }
    }
}
