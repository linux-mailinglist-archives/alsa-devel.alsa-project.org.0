Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5FB1B2A69
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Apr 2020 16:45:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A93016D0;
	Tue, 21 Apr 2020 16:44:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A93016D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587480328;
	bh=5e3Om0tNq5AkjbiSTQR8U7jUZzgzErPBUb1379XOKSw=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bd8irdvmLIHXsn3zLKm2kKICepadUuWcXTVQIDHa3RM5QkU0G7TLo1mhFzACpG+kF
	 hVwaQHj6hBkrEu5gGcCUHys8aQYWYmBGNRWkDmxPR0HDaf0SpSWxMSd3CcepOgd5Fc
	 Hp+jxSez55z4HfbxOmOih3TPT/8SVypqA/6ne3k4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70CF3F800E7;
	Tue, 21 Apr 2020 16:43:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3F96F801EC; Tue, 21 Apr 2020 16:43:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD048F800E7
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 16:43:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD048F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZSG5SzUn"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EC497206A2;
 Tue, 21 Apr 2020 14:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587480214;
 bh=5e3Om0tNq5AkjbiSTQR8U7jUZzgzErPBUb1379XOKSw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=ZSG5SzUn9vFXbtZ+C9VMvFYVgu4YyuOoDliCn6TS/Cz6F7+oxLJDxg5s5JJgBCNLk
 8YZC2rCVpT7hOlSgGe25cevaZqbaJQnBscgywTE6WRSIo+fGVj2OpHX025f6qbKB9c
 imvlx2FOW4JPEYO4MoLx+ezeqYoeHe1KIM6ReJek=
Date: Tue, 21 Apr 2020 15:43:31 +0100
From: Mark Brown <broonie@kernel.org>
To: tglx@linutronix.de, patches@opensource.cirrus.com, info@metux.net,
 ckeepax@opensource.wolfsonmicro.com, allison@lohutok.net,
 alsa-devel@alsa-project.org, kstewart@linuxfoundation.org, perex@perex.cz,
 Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org
In-Reply-To: <1587468525-27514-1-git-send-email-shengjiu.wang@nxp.com>
References: <1587468525-27514-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: wm8960: Fix wrong clock after suspend & resume
Message-Id: <158748021184.7424.16056997508827972639.b4-ty@kernel.org>
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

On Tue, 21 Apr 2020 19:28:45 +0800, Shengjiu Wang wrote:
> After suspend & resume, wm8960_hw_params may be called when
> bias_level is not SND_SOC_BIAS_ON, then wm8960_configure_clocking
> is not called. But if sample rate is changed at that time, then
> the output clock rate will be not correct.
> 
> So judgement of bias_level is SND_SOC_BIAS_ON in wm8960_hw_params
> is not necessary and it causes above issue.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

Thanks!

[1/1] ASoC: wm8960: Fix wrong clock after suspend & resume
      commit: 1e060a453c8604311fb45ae2f84f67ed673329b4

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
