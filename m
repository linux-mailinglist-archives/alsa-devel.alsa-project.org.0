Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A337C4CAB0C
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 18:02:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 162AC1ED7;
	Wed,  2 Mar 2022 18:01:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 162AC1ED7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646240524;
	bh=B/K/tTPNF4Sv4xXy2rc+6++dvT8nb0M4EukdEIC0H4g=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JICCAKzQf9o1zPe8QloScZ7598WJYZ0R7Tdabu9E8zyhYrQeyfELXWVqgNrP8fmWS
	 oFD1yGLvDg7daooLyJ7o8vMgrxVAahTUFd462H5/gW2UEgiV613GHm+QzahBVw8v+v
	 EE2Ad+cZQKDjgNpcss68MTswRHXn07rsWxzrmWu0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72421F8027D;
	Wed,  2 Mar 2022 18:00:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38562F801D5; Wed,  2 Mar 2022 18:00:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEE29F80154
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 18:00:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEE29F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FfQEulIw"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 57E8761917;
 Wed,  2 Mar 2022 17:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E46A7C004E1;
 Wed,  2 Mar 2022 17:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646240448;
 bh=B/K/tTPNF4Sv4xXy2rc+6++dvT8nb0M4EukdEIC0H4g=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=FfQEulIwqFKcM9qnsrrTLwulSPwOHeEeBhHcmCQQ6omEuxt6s72BCW6e3WDxPXWZU
 mQBSkGCGcgruvEeRSMtJgg/GVCEYCN4KM6b60ZMsgA258wxLZo01Ptys1nzkEhG42Q
 /G7Qv6YP3KtMl4TwZjuu9CLAjJNzZFZjOv1uDKVU8QBpv5VaCrnB3S/IfE8ITH2DqM
 ZY293dY98et8WhC0m34CGt4zu65rkaobYGY2k+5D/5f51EoHFMPu6TzJ7xOK12ljxh
 EZDS2xWPcOHwve/GNMgQtSnZv/RpakeeQXGPkZS1YykaDPXIDWxGQG7snPg5GBBuqU
 sXLbjGw8yQ2LA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Sascha Hauer <s.hauer@pengutronix.de>
In-Reply-To: <20220301113446.1053171-1-s.hauer@pengutronix.de>
References: <20220301113446.1053171-1-s.hauer@pengutronix.de>
Subject: Re: [PATCH] ASoC: soc-generic-dmaengine-pcm: set period_bytes_min
 based on maxburst
Message-Id: <164624044765.1145067.15313306321326353592.b4-ty@kernel.org>
Date: Wed, 02 Mar 2022 17:00:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Lars-Peter Clausen <lars@metafoo.de>, kernel@pengutronix.de
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

On Tue, 1 Mar 2022 12:34:46 +0100, Sascha Hauer wrote:
> In dmaengine_pcm_set_runtime_hwparams() period_bytes_min is hardcoded to
> 256. For some applications that may be too big. This patch changes that
> to calculate the value based on dma_data->maxburst. The correct value
> would be maxburst multiplied by the address width of the hardware FIFO.
> Unfortunately the address width is dynamically calculated based on the
> stream parameters and is not known at open time, so the worst case
> is chosen here which is 8 bytes, the maximum that is supported by
> dmaengine drivers.
> Not all drivers may set a maxburst value, so we fall back to the
> previously used hardcoded value of 256 bytes.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-generic-dmaengine-pcm: set period_bytes_min based on maxburst
      commit: 300689fb04b3f23c1ac1abfe960b48ec414df597

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
