using GuardianProApi.DB;
using GuardianProCore.Tables;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;

namespace GuardianProApi.Controllers;

[Route("Api/[controller]")]
[ApiController]
public class Visitor
{
    [Route("GetAll")]
    [HttpGet]
    public async Task<string> GetVisitors()
    {
        string result;
        using (var db = new ContextDB())
        {
            result = JsonConvert.SerializeObject(db.Visitor.ToList());
        }

        return result;
    }
}