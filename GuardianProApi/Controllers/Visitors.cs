using GuardianProApi.DB;
using GuardianProApi.DB.Tables;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;

namespace GuardianProApi.Controllers;

[Route("api/[controller]")]
[ApiController]
public class Visitors
{
    [HttpGet]
    public string GetVisitors()
    {
        string result;
        using (var db = new ContextDB())
        {
            result = JsonConvert.SerializeObject(db.Visitor.ToList());
        }

        return result;
    }
}