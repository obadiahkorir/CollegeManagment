using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(NIT.Startup))]
namespace NIT
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
