Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A55E1BA32A
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 14:08:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A027B1689;
	Mon, 27 Apr 2020 14:07:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A027B1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587989321;
	bh=1m16fC0Omj/UN4RkPHjzbywpoiVoVofm7ryYwBegEAM=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nEDY5wZHi1zRWhqmJfNWz6XlnTX8SiTH6v/YfWRpEZZbvoG61dwoRPai+wOVGxxuH
	 GZioY3wtmIs4aPyRSprVDSiJFImVlFS5UktpxCx0OQ7P5emFOARdI06Qz0uCVgFtdz
	 CvqIgdacjzsekiWRoDlxcFcgDNn9/AGEv3iy6vtM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93491F80232;
	Mon, 27 Apr 2020 14:07:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B0AAF80112; Mon, 27 Apr 2020 14:06:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2D83F80112
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 14:06:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2D83F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jN69zCDJ"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2234020656;
 Mon, 27 Apr 2020 12:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587989208;
 bh=1m16fC0Omj/UN4RkPHjzbywpoiVoVofm7ryYwBegEAM=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=jN69zCDJKrqExjNLOR8Cbwymi5eN2AbzM0CHbDsx9suR47QUg2Kmq/xQtMCIrmouI
 A0hNeOLjfGU7p+9Tp0NrRed2toBUVtjjfiYffuiLdgIthDizhLhHZmoi3knnz3ly0/
 orJbiLE9HH6OSI5kbYpwwJT2Cu+9wth6kcm+Lu0A=
Date: Mon, 27 Apr 2020 13:06:46 +0100
From: Mark Brown <broonie@kernel.org>
To: festevam@gmail.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com,
 timur@kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 alsa-devel@alsa-project.org, tiwai@suse.com, perex@perex.cz
In-Reply-To: <a8f2ad955aac9e52587beedc1133b3efbe746895.1587968824.git.shengjiu.wang@nxp.com>
References: <a8f2ad955aac9e52587beedc1133b3efbe746895.1587968824.git.shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: fsl_esai: Disable exception interrupt before
 scheduling tasklet
Message-Id: <158798920600.35547.13024845856873705018.b4-ty@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Mon, 27 Apr 2020 14:23:21 +0800, Shengjiu Wang wrote:
> Disable exception interrupt before scheduling tasklet, otherwise if
> the tasklet isn't handled immediately, there will be endless xrun
> interrupt.
> 
> Fixes: 7ccafa2b3879 ("ASoC: fsl_esai: recover the channel swap after xrun")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

Thanks!

[1/1] ASoC: fsl_esai: Disable exception interrupt before scheduling tasklet
      commit: 1fecbb71fe0e46b886f84e3b6decca6643c3af6d

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
