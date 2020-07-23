Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B855322B7AB
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jul 2020 22:25:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55A6F1681;
	Thu, 23 Jul 2020 22:24:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55A6F1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595535945;
	bh=WLDe8p+A/CpQf5/6gq8TVOgNo0NwPqUHogMr+bFuRAw=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TwREkKUHvhMOIec+rbJln+B0wZMWMeLxdFc2YNHsSQ4AK2K0zv3P7o7PKxIQff4Ir
	 e6mBMM9D9Hy34M59FFTpVIRdvFYkP1iO/XD0WLAyjajN+Vl4PpEUJG8dDAIxohCoB7
	 JkQO6UigIwqe0AMU2FavRTaxLQd1OzV2oaB+uFeo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E63BF802FD;
	Thu, 23 Jul 2020 22:20:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 000BBF802FE; Thu, 23 Jul 2020 22:20:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99745F802EB
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 22:20:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99745F802EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Hf0XD6+L"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 73B5A20B1F;
 Thu, 23 Jul 2020 20:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595535627;
 bh=WLDe8p+A/CpQf5/6gq8TVOgNo0NwPqUHogMr+bFuRAw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Hf0XD6+LeWC+wP6ISweQEjefDPwEoG0pmVg1WZ5pQscc75fWWmHrmL53k7Hod/Wvs
 SgSWCTbWHINmRuH7QXaOeghUz/+2zm5S9/yu8s6YNXlZ452dCjxEetWpwmA11LR/2a
 lrhoNY+QjgS1cFscMjJspwQeD+GHPPq/fuXtPPRE=
Date: Thu, 23 Jul 2020 21:20:11 +0100
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, perex@perex.cz,
 "Alexander A. Klimov" <grandmaster@al2klimov.de>, jarkko.nikula@bitmer.com,
 tiwai@suse.com, alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 lgirdwood@gmail.com, peter.ujfalusi@ti.com
In-Reply-To: <20200718112403.13709-1-grandmaster@al2klimov.de>
References: <20200718112403.13709-1-grandmaster@al2klimov.de>
Subject: Re: [PATCH] ASoC: omap: Replace HTTP links with HTTPS ones
Message-Id: <159553557415.41908.1856023334882832244.b4-ty@kernel.org>
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

On Sat, 18 Jul 2020 13:24:03 +0200, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: omap: Replace HTTP links with HTTPS ones
      commit: 3323a148fd79a6c6c8809bb793708bcfa626081d

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
