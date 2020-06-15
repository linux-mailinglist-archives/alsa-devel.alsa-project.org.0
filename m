Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F0C1F9B83
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jun 2020 17:08:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 501EF167B;
	Mon, 15 Jun 2020 17:07:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 501EF167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592233705;
	bh=sN3Bz1ArwLZ57cbhXnAQRcV8BrVBCwaTj6BNwFFv7kE=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jsd6I3oNmviiIrHaEHVdckng9d3SmKmtvUrjFo+eI7VRwU5O8hih866Jcgg2kYrRY
	 Qj8rTdVwOPAOcg52i9WfSLC3IP4dxH6TlLQBkTcsHy4B80yhGdkuoTZKjVEQX1aAhr
	 EPGXhJLvvuXMTB3i761wPy1wJmyfGf9DmBOvM6qc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 796CEF802BC;
	Mon, 15 Jun 2020 17:05:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84E58F802BE; Mon, 15 Jun 2020 17:05:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43DA7F802A8
 for <alsa-devel@alsa-project.org>; Mon, 15 Jun 2020 17:05:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43DA7F802A8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oiTmzD1I"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4A48620739;
 Mon, 15 Jun 2020 15:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592233542;
 bh=sN3Bz1ArwLZ57cbhXnAQRcV8BrVBCwaTj6BNwFFv7kE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=oiTmzD1I8zYxp3Z8B25BdF5tZH+komfDtiHgmhnMaFCCqulL9USpYsSC3AWhYjLfI
 Hja4d4PIQoyUrmISr+esFj3Kn8vIJ2Y4Oc4ywQmWDe5EVihYoYlptUzKBo2s9GjB2d
 GnaVpiajbCNtCl6imkX2CAQQpr7OwhLiK8u9X/Vo=
Date: Mon, 15 Jun 2020 16:05:40 +0100
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, "derek.fang@realtek.com" <derek.fang@realtek.com>
In-Reply-To: <1591938925-1070-1-git-send-email-derek.fang@realtek.com>
References: <1591938925-1070-1-git-send-email-derek.fang@realtek.com>
Subject: Re: [PATCH 1/5] ASoC: rt5682: Enable Vref2 under using PLL2
Message-Id: <159223353043.8967.11796262898694869884.b4-ty@kernel.org>
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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

On Fri, 12 Jun 2020 13:15:21 +0800, derek.fang@realtek.com wrote:
> Enable Vref2 under long term using PLL2 to avoid clock unstable.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: rt5682: Enable Vref2 under using PLL2
      (no commit info)
[2/5] ASoC: rl6231: Add new supports on rl6231
      (no commit info)
[3/5] ASoC: rt5682: Let PLL2 support the freq conversion for 44100Hz sample rate
      (no commit info)
[4/5] ASoC: rt5682: DAI wclk supports 44100 Hz output
      (no commit info)
[5/5] ASoC: rt5682: Let dai clks be registered whether mclk exists or not
      commit: 19ab0f005b165146ea4a93f71e9cb5e71de9c0ce

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
