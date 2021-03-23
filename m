Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E052346BEA
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 23:14:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD8911686;
	Tue, 23 Mar 2021 23:14:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD8911686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616537697;
	bh=xJqjy+7weTlzSdZIQvB4cKpexVA+CmBfz/5tmXRjPCI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ukH5Ba0/3MrslaTkHhBNww30fQk/zfuFp1O5fG7mlBePylWLej6aisjhy40t5nBB6
	 7fC8xyH8Z0av7V1WChpgy22P+CZJFNhG+3opiW1COZ5Vxrkik+VbZ9Qur56n7dL0TT
	 Em/7BG9N1RkuJvJoK2Zr8iHATAUfyaEkApPo8Ktw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 646D2F8032B;
	Tue, 23 Mar 2021 23:12:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49572F8026D; Tue, 23 Mar 2021 23:12:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D0A3F800EE
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 23:12:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D0A3F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tceejv7M"
Received: by mail.kernel.org (Postfix) with ESMTPSA id EE245619C3;
 Tue, 23 Mar 2021 22:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616537551;
 bh=xJqjy+7weTlzSdZIQvB4cKpexVA+CmBfz/5tmXRjPCI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tceejv7McpSNYJf1CFHE+FPQOuP/4eL8tqYhMg8FI1eBVsyhY0MP0IyAsSxbQJrWs
 1f5bHr81ChfTi3n3YlpROvkaWqJiBquopCiZqi7rb2ln4Azzoth4Pk/gLARA5tgG2u
 Bxwz4YqJ6RfiTh2gBmTFs2n8/MrP6KgRRX6tPaEPpBi99vTP+bfdkqs/MaBiT/nJ4L
 /mPP2c/dK0JKOvRU7sdOsX//3oSBFsocwUp42GZLsEEtKlvIEPJmJAZGKWr0iqUJb+
 s8rUQrpJmA+8jk01LRDk5QJy4Y3zgGakTX99a3oq0rTfXsTs2//OQs42CU3n5wcJ8s
 Dtsk8+Xwc9SDg==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, alsa-devel@alsa-project.org, peter.ujfalusi@ti.com,
 kuninori.morimoto.gx@renesas.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com, patches@opensource.cirrus.com, daniel.baluta@nxp.com,
 gustavoars@kernel.org, ckeepax@opensource.cirrus.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: wm8960: Fix wrong bclk and lrclk with pll enabled
 for some chips
Date: Tue, 23 Mar 2021 22:12:14 +0000
Message-Id: <161653747938.32729.14710605922324529557.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1616150926-22892-1-git-send-email-shengjiu.wang@nxp.com>
References: <1616150926-22892-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

On Fri, 19 Mar 2021 18:48:46 +0800, Shengjiu Wang wrote:
> The input MCLK is 12.288MHz, the desired output sysclk is 11.2896MHz
> and sample rate is 44100Hz, with the configuration pllprescale=2,
> postscale=sysclkdiv=1, some chip may have wrong bclk
> and lrclk output with pll enabled in master mode, but with the
> configuration pllprescale=1, postscale=2, the output clock is correct.
> 
> >From Datasheet, the PLL performs best when f2 is between
> 90MHz and 100MHz when the desired sysclk output is 11.2896MHz
> or 12.288MHz, so sysclkdiv = 2 (f2/8) is the best choice.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm8960: Fix wrong bclk and lrclk with pll enabled for some chips
      commit: 16b82e75c15a7dbd564ea3654f3feb61df9e1e6f

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
