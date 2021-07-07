using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_Contract.Models
{
    public class Request
    {
        public string Source { get; set; }
        public string Creator { get; set; }
        public string Approver { get; set; }
    }

    public class CreateEContractRequest:Request
    {
        public string ContractRefId { get; set; }
        public string ContractName { get; set; }
    }
}