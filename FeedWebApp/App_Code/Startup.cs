using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(FeedWebApp.Startup))]
namespace FeedWebApp
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
