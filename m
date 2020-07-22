Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8969B228D5A
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 03:01:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 332A91670;
	Wed, 22 Jul 2020 03:01:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 332A91670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595379711;
	bh=pDFWSUNHlCVhtZA4YJkUgqvi4Vaf7kLiZsOr9BVh5S0=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CVcc/1PkD4Q721lgfxC2nuvZBPysC5tW2koA/vfNc1TVRIi0oOI7umISnOhsifQuI
	 Lrahqvd1ITC3qPKY8YmQHc03CH+dPP9+mS2ZpMmOTxx0D1rpLvkaK6Hj90tMCCJN6t
	 qK60wAUzgF0hAvL6RmkrLNC4BEYPXKA0uyvYwcxM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2959AF802EA;
	Wed, 22 Jul 2020 02:57:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31315F802E9; Wed, 22 Jul 2020 02:57:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB27CF802E7
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 02:57:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB27CF802E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tn9HIok+"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 00864208E4;
 Wed, 22 Jul 2020 00:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595379442;
 bh=pDFWSUNHlCVhtZA4YJkUgqvi4Vaf7kLiZsOr9BVh5S0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=tn9HIok+reSAfkiEqFpNutT6Vj16QXgxElRHQ8U7yeeaDE9wtRwo3+VbJmNFZXlR7
 80IQx+rV8C/qTrPfaK4xtOL3y3t/gvBZt9InoQT7jCDwbxpkpnJX/AG0e817d1bO1O
 63wm/FGLBdxduK9Lf0zyelHKVhFNRv5ctLos+oTQ=
Date: Wed, 22 Jul 2020 01:57:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20200721114232.2812254-1-tzungbi@google.com>
References: <20200721114232.2812254-1-tzungbi@google.com>
Subject: Re: [PATCH] ASoC: max98357a: move control of SD_MODE back to DAI ops
Message-Id: <159537940424.49432.9219488915928063357.b4-ty@kernel.org>
Cc: linux-rockchip@lists.infradead.org, alpernebiyasak@gmail.com,
 alsa-devel@alsa-project.org, cychiang@google.com
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

On Tue, 21 Jul 2020 19:42:32 +0800, Tzung-Bi Shih wrote:
> Partially reverts commit 128f825aeab7 ("ASoC: max98357a: move control
> of SD_MODE to DAPM").
> 
> In order to have mute control of max98357 from machine drivers, commit
> 128f825aeab7 ("ASoC: max98357a: move control of SD_MODE to DAPM")
> moves the control of SD_MODE from DAI ops to DAPM events.  However, pop
> noise has been observed on rk3399-gru-kevin boards due to this commit.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: max98357a: move control of SD_MODE back to DAI ops
      commit: 04a646ff5acaa9a0a6634af1c94e0d5c8115e5db

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
