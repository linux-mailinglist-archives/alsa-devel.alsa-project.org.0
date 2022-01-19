Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE291493F92
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jan 2022 19:03:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B6B43137;
	Wed, 19 Jan 2022 19:03:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B6B43137
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642615431;
	bh=ntFkmrYHf7DolESwdFrg5bWQtilBQv+yuy5/Fz0esAE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JjI31hGW4rZTIOP1ILG0rjksHZ0UBbdywCDkYEpq4jt63ladGqSaxZraxQCHJBOGp
	 KudLdMWCq/tEK2W0xY+PlEnjBitpos3sYWKXtjewYqCc3IzDf5Y1pEDzUG2BwwMIdJ
	 8LgU2pj3sOjL+csXCgccgK8Lwp1vjyBb+DrhYAjQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06676F80100;
	Wed, 19 Jan 2022 19:02:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A842F80212; Wed, 19 Jan 2022 19:02:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2ABAF80100
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 19:02:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2ABAF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Num7Tfcz"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 581F7B81AD5;
 Wed, 19 Jan 2022 18:02:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11466C004E1;
 Wed, 19 Jan 2022 18:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642615358;
 bh=ntFkmrYHf7DolESwdFrg5bWQtilBQv+yuy5/Fz0esAE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Num7TfczXyuFgQUEaNnJsxuhSPEJa5PzPlZ5KozMoGrfRWShxkoP7/mYFMiHF95OE
 7+5+NJYqaTSEO2qcVwWnoCbmR9lfq4XyuAgMjh089/69bWLCukl3vxSoxJ2umxSCcl
 CeMeOLNjfSgTa0+lHuC2wo39eaIbiMVRnrp+n0Dk3ofzouenC3Zh5iPDLAGMv5Uh0f
 EIaPwQeOepjIJArXqYokLFfuJsTzq+wvMMl/+rZkPsLF+tohMh8mvDS7/Fir8UDLkB
 WYkdzPwCb+75pOQdsP/qlB8lB7jod41ydD5NOUoYgQE8QBuaWz8oDBPbPq/zWyCO84
 tRPVbP0FWry3A==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
In-Reply-To: <20220119123101.GA9509@kili>
References: <20220119123101.GA9509@kili>
Subject: Re: [PATCH] ASoC: max9759: fix underflow in speaker_gain_control_put()
Message-Id: <164261535576.2816847.8184092572557171826.b4-ty@kernel.org>
Date: Wed, 19 Jan 2022 18:02:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

On Wed, 19 Jan 2022 15:31:01 +0300, Dan Carpenter wrote:
> Check for negative values of "priv->gain" to prevent an out of bounds
> access.  The concern is that these might come from the user via:
>   -> snd_ctl_elem_write_user()
>     -> snd_ctl_elem_write()
>       -> kctl->put()
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: max9759: fix underflow in speaker_gain_control_put()
      commit: 4c907bcd9dcd233da6707059d777ab389dcbd964

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
