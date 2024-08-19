using MediatR;
using SMSC.Application.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SMSC.Application.Queries.Employee
{
    public class GetEmployeeListQuery : IRequest<IEnumerable<EmployeeDto>>
    {
        public EmployeeDto EmployeeDto { get; set; }
    }
}