Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 194881B0CE2
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 15:38:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90D52168C;
	Mon, 20 Apr 2020 15:38:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90D52168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587389932;
	bh=BSN8PJIuWMDXwx3TBeBQilL1wnMA+WbIz0U0lWcnoac=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rfrNyxPjnSe3EbGGCb7Dd1sx/J2AyMw6Wk9Yrim3mBsLZvVANfncPJGVvjlI0EXn5
	 N+GXFbnziEs/QhSL/uMIUrcFjF3N8RnEWUNRfyTxOf1LBeDZtIWfOyL/RmZqaeayS6
	 ZT/E75d61795ZyNGNID3mnndjzT6TFzW2jSe4Xqw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CAA3F8020C;
	Mon, 20 Apr 2020 15:37:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58CB3F801D9; Mon, 20 Apr 2020 15:37:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 181AAF800E7
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 15:37:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 181AAF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="xpDvF89D"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF4BE2070B;
 Mon, 20 Apr 2020 13:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587389816;
 bh=BSN8PJIuWMDXwx3TBeBQilL1wnMA+WbIz0U0lWcnoac=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=xpDvF89DtiiqL0Dk8DsmMykD5RPm93cFOOT8uTFwoxeJ3nnTBm7J92aLPAzHMnegq
 Cx39dX1TLHj1VjhSg5oeugSttl9OmD9S2GJvqxoEXb0pbdQ7KQ6bB+pB6Gj6v0asUJ
 KjFgYrNtU46UyAvdKiPcR4pfIHBPdKfdR4+cVOlY=
Date: Mon, 20 Apr 2020 14:36:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Gyeongtaek Lee <gt82.lee@samsung.com>
In-Reply-To: <000001d61537$b212f620$1638e260$@samsung.com>
References: <CGME20200418041321epcas2p1ceed010fde93a35e763a9db436e1c63b@epcas2p1.samsung.com>
 <000001d61537$b212f620$1638e260$@samsung.com>
Subject: Re: [PATCH] ASoC: dapm: fixup dapm kcontrol widget
Message-Id: <158738981360.28730.4152155485206663044.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, khw0178.kim@samsung.com, kimty@samsung.com,
 tiwai@suse.com, lgirdwood@gmail.com, hmseo@samsung.com, tkjung@samsung.com,
 pilsun.jang@samsung.com
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

On Sat, 18 Apr 2020 13:13:20 +0900, Gyeongtaek Lee wrote:
> snd_soc_dapm_kcontrol widget which is created by autodisable control
> should contain correct on_val, mask and shift because it is set when the
> widget is powered and changed value is applied on registers by following
> code in dapm_seq_run_coalesced().
> 
> 		mask |= w->mask << w->shift;
> 		if (w->power)
> 			value |= w->on_val << w->shift;
> 		else
> 			value |= w->off_val << w->shift;
> 
> [...]

Applied to

	broonie/sound.git for-5.7

Thanks!

[1/1] ASoC: dapm: fixup dapm kcontrol widget
      commit: ebf1474745b4373fdde0fcf32d9d1f369b50b212

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
