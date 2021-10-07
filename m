Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F245A425F4A
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 23:39:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E99F166D;
	Thu,  7 Oct 2021 23:39:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E99F166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633642791;
	bh=M0JScwCK6dY7QbVsEnkNN+IZlnMsuYMilyBSTNOFTCA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q7hbopQLeTUav0lFKHAIi/fmvWubFTguUiZQban9zsUQh7exNKE44CDBX6jtsZ2/p
	 d6GsfIa20ogkSZAXshG9isfM0MbRMWkvx4kEb1yCppIaCGn72odfIk+40O4llOM/ov
	 A79pOYymCWs0TAeTY1twArzsakwvNp8hJJwdXv8w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B40DF804E7;
	Thu,  7 Oct 2021 23:37:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8853F804E6; Thu,  7 Oct 2021 23:37:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 837B4F804BD
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 23:37:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 837B4F804BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lsV5RMPu"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8CADB6120D;
 Thu,  7 Oct 2021 21:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633642670;
 bh=M0JScwCK6dY7QbVsEnkNN+IZlnMsuYMilyBSTNOFTCA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lsV5RMPuJp5pZ9++YPV+7cBgmTN/2UYfsuJlrQSpTeIV2URfpnMo6jL0XkXvmBJSR
 TvJPHujqPw0VldZV57Ux7dIjEcdYY0k3NqipoSPHZs1vN1d+OftGRl3z+tTG1iiR+Z
 gGTj+OJlRgoH3orvmBa7RtgYy0e7lQKVPAwyygO5T3kQyR+OsRKUHY3v/06eyHECHc
 EjeVQ2FjvvaoAXmMknEuZwM8iZ3CqyTzIA9L0mys5pycYIHVPh70ujNOPVJQ1y1snY
 KTIOTRZ+OABxXtiamqJ0H2rN7GEkakYczESmrefKJCxjzPZUK1ZugPufvrTOwfURGD
 oAvAM1FKlip1g==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ASoC: DAPM: Fix missing kctl change notifications
Date: Thu,  7 Oct 2021 22:37:26 +0100
Message-Id: <163364264607.649699.9456169458169532979.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006141712.2439-1-tiwai@suse.de>
References: <20211006141712.2439-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 6 Oct 2021 16:17:12 +0200, Takashi Iwai wrote:
> The put callback of a kcontrol is supposed to return 1 when the value
> is changed, and this will be notified to user-space.  However, some
> DAPM kcontrols always return 0 (except for errors), hence the
> user-space misses the update of a control value.
> 
> This patch corrects the behavior by properly returning 1 when the
> value gets updated.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: DAPM: Fix missing kctl change notifications
      commit: 5af82c81b2c49cfb1cad84d9eb6eab0e3d1c4842

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
