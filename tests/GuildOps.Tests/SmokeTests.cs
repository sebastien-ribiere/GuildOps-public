using GuildOps.Core.Domain;
using GuildOps.Core.Engine;
using static GuildOps.Tests.TestSupport;

namespace GuildOps.Tests;

/// <summary>Contrôles de santé rapides : la session démarre, le roster est complet, une partie se termine.</summary>
public class SmokeTests
{
    [Fact]
    public void Session_can_be_created()
    {
        var s = NewSession();
        Assert.NotNull(s);
        Assert.NotNull(s.Guild);
    }

    [Fact]
    public void Roster_has_twelve_heroes_and_some_offers()
    {
        var s = NewSession();
        Assert.Equal(12, s.Heroes.Count);
        Assert.NotEmpty(s.CurrentOffers);
    }

    [Fact]
    public void A_game_can_be_played_to_the_end()
    {
        var s = NewSession();
        Bots.Idle(s);
        Assert.Equal(GameStatus.Finished, s.Status);
        Assert.NotNull(s.Report);
    }
}
