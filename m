Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8DD4C78B9
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 20:22:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9378718F6;
	Mon, 28 Feb 2022 20:21:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9378718F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646076137;
	bh=8FYmaxqsi8/KhMb09vDGQSwOhqKXJTcOOa5fIGaspcc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IsX9ihi6R0kCMiH9jXA1zhqeg7OG8WTrKoFvSyZYXH73Ep7hqD0Bj2uaLMdx1iuHW
	 /SL8McDzzANIeSJiDotRzWAE9lAF+WJP9jOA3YCidmyIPYf4rTYxzISJgLWLjzKMq6
	 cCM3FalYOUGKmeh/uwYYhqPsUyuEA8nuiMpFndO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56DAFF8057D;
	Mon, 28 Feb 2022 20:16:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CB7CF8054A; Mon, 28 Feb 2022 20:15:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0DA3F80519
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 20:15:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0DA3F80519
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="F/u7ihxD"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 382BAB815CB;
 Mon, 28 Feb 2022 19:15:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA358C340F1;
 Mon, 28 Feb 2022 19:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646075738;
 bh=8FYmaxqsi8/KhMb09vDGQSwOhqKXJTcOOa5fIGaspcc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=F/u7ihxDwbEOqAmlhWv+kVnm22rNioLjCRUTROmSZ50qD8kRn575gBbK0NgI3LDyi
 Z9sQbAGrT+dQXKGD9h37GOuH5ZbL7iNS/YMdVdXanOHj2WS6ImUHMaeo2zTbubFpds
 My6g8Kp183n/ISvpes2eAK9nTPoSoI3Mg0cFqDD7Z9VjDRnRb2KTLAJp7HPj6dp6Le
 3mVtCcDm+U6Q5MenBtqtb2hKfvwFfDW3i/F4647WdkU+pf6x+ya3wxopmLycG/R/VB
 oW1FXHsjFU4z00idUO+vJlzhi+oWIDLT61H038fdQU9V7Zn7s/vgI1STpJDGYjMe+3
 0JV+SaqG8fdiA==
From: Mark Brown <broonie@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>, alsa-devel@alsa-project.org
In-Reply-To: <20220223130625.3430589-1-s.hauer@pengutronix.de>
References: <20220223130625.3430589-1-s.hauer@pengutronix.de>
Subject: Re: [PATCH] ASoC: fsl: Drop unused argument from imx_pcm_dma_init()
Message-Id: <164607573754.3538791.4095490674890244349.b4-ty@kernel.org>
Date: Mon, 28 Feb 2022 19:15:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, kernel@pengutronix.de,
 Xiubo Li <Xiubo.Lee@gmail.com>
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

On Wed, 23 Feb 2022 14:06:25 +0100, Sascha Hauer wrote:
> Since 70d435ba1cd ("ASoC: imx-pcm-dma: simplify pcm_config") the size
> argument to imx_pcm_dma_init() is unused, so drop it. Also remove the
> now unused defines that the users of imx_pcm_dma_init() used to pass the
> size argument
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: Drop unused argument from imx_pcm_dma_init()
      commit: 9b3ff6378df33dbea4b9459ee804b25f1ce294ca

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
