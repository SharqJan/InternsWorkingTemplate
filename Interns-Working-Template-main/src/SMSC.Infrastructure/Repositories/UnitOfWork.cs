using SMSC.Application.Interfaces;
using SMSC.Core.Interfaces;

namespace SMSC.Infrastructure.Repositories
{
    public class UnitOfWork : IUnitOfWork
    {
        //Define Data Access Repositories Here
        private readonly IRepository _dbRepository;

        public UnitOfWork(IRepository dbRepository)
        {
            _dbRepository = dbRepository;
        }



        //Define All Repositories Interfaces Here
        private IEmployeeRepository _employeeRepository;
        // Initialize All Interfaces Here
        public IEmployeeRepository EmployeeRepository { get { _employeeRepository = (_employeeRepository == null) ? new EmployeeRepository(_dbRepository) : _employeeRepository; return _employeeRepository; } }




    }
}
