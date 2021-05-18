using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc.Formatters;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using System.Buffers;
using System.Threading.Tasks;

namespace TaskWebUI.AppCode.Filters
{
    public class JsonSerializerFilter : IAsyncResultFilter
    {
        public async Task OnResultExecutionAsync(ResultExecutingContext context, ResultExecutionDelegate next)
        {
            if (context.Result is ObjectResult objectResult)
            {
                var options = context.HttpContext.RequestServices.GetService(typeof(IOptions<MvcOptions>)) as IOptions<MvcOptions>;
                var jsonOptions = context.HttpContext.RequestServices.GetService(typeof(IOptions<MvcNewtonsoftJsonOptions>)) as IOptions<MvcNewtonsoftJsonOptions>;

                objectResult.Formatters.RemoveType<NewtonsoftJsonOutputFormatter>();
                jsonOptions.Value.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore;
                objectResult.Formatters.Add(new NewtonsoftJsonOutputFormatter(jsonOptions.Value.SerializerSettings, ArrayPool<char>.Shared, options.Value));

            }
            await next();
        }
    }
}
