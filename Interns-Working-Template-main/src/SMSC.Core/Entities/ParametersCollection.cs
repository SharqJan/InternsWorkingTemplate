﻿using System.Data;

namespace SMSC.Core.Entities
{
    public class ParametersCollection
    {
        public string ParameterName { get; set; }
        public object ParameterValue { get; set; }
        public DbType ParameterType { get; set; }
        public ParameterDirection ParameterDirection { get; set; }
    }
}
