Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6AF4B1735
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 21:47:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F79B1AB3;
	Thu, 10 Feb 2022 21:46:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F79B1AB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644526031;
	bh=e+0+KumPfB/inHLwr58kdJLssIitccwigvTb2HPxUro=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AIjnkNTmYO3TaNu8N666qAGDckwjA1qE2cBMIn8JHwVm1WhopMd3c2oTSlSgSPpGQ
	 /NhbiQ29kM4OhusCgsft0l29nj+q1Cn/Jt+CQj+LAqcIMJteFCSSOFcxXhpfJqVI14
	 6iqRk+wuLiZw2TXmDA8X4RBhJdy9wyiws06Dqb8o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98A97F8016C;
	Thu, 10 Feb 2022 21:46:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53D5CF8016C; Thu, 10 Feb 2022 21:46:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBFACF8013D
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 21:45:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBFACF8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="T89+lcXx"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0DD05B8273A;
 Thu, 10 Feb 2022 20:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEF57C340ED;
 Thu, 10 Feb 2022 20:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644525956;
 bh=e+0+KumPfB/inHLwr58kdJLssIitccwigvTb2HPxUro=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=T89+lcXxx6sXod5zJG8s985idUQ+kPzFvHFpkFZIusKpD3j3KAbPYCj8osRAKfhm0
 AEIC39uzrLURIjKJv55kK+wC3ivuKXIv2D7UL6IM1Od0SLt69XofvFInY8mfISBLLl
 4wFO0Sb/63eOYiu1Pr4t6MVAGCydISZ9etmN8+1U1E+AXmllB8188BZmwUC3uIQ+xk
 CoDos3E94BjXEAYCU25rNYxhQ+SG5F2YimMxpZEoZNoSQExK3e5R1xsRumj9gwV/1L
 PU6Uf6X42nw+jEOlhVZpNHMzYybQzT3K0pEh4+zjcnveeA3gjCX5DBuOCqqwH5CtyW
 Gn54NUaPsb0/Q==
From: Mark Brown <broonie@kernel.org>
To: Ricard Wanderlof <ricardw@axis.com>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <alpine.DEB.2.21.2202101805360.7068@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.21.2202071806580.31604@lnxricardw1.se.axis.com>
 <alpine.DEB.2.21.2202101805360.7068@lnxricardw1.se.axis.com>
Subject: Re: [PATCH v2] ASoC: tlv320adc3xxx: Add IIR filter configuration
Message-Id: <164452595563.2004563.14203920612480753249.b4-ty@kernel.org>
Date: Thu, 10 Feb 2022 20:45:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel <alsa-devel@alsa-project.org>, kernel <kernel@axis.com>
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

On Thu, 10 Feb 2022 18:07:36 +0100, Ricard Wanderlof wrote:
> The TLV320ADC3001/3101 have an internal DSP, which can either be
> used in various preset configurations (called "Processing Blocks"
> in the data sheet), or as a freely programmable (using the
> "PurePath Studio" graphical programming tool from TI) but rather
> small DSP ("miniDSP").
> 
> Using the default configuration (PRB_R1) it's possible to set up
> filtering using a first-order IIR, which can be useful for adding
> a digital high pass filter to the signal chain, for instance.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tlv320adc3xxx: Add IIR filter configuration
      commit: 9193bc0558d1812343039b510797b669f054efc5

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
