Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F02FB11BA0C
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 18:21:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E93D16A8;
	Wed, 11 Dec 2019 18:20:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E93D16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576084881;
	bh=GlokbUsTB5FHsgSwnZmEQOxioW6Q/bCFfL8+XV25KF0=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=W2VA/kkJ5LgOS8N0NHsdVzN1O2IYfUguTv5glfpAqoNBPZmNpSDshcgM3PPH5VV7q
	 Q2oXvsGBpduJvrFLnNZ8Rvic/PaaxAjNW7A+dgP3FhirV3jZe9St5jxFrPI47gwrSV
	 S52REyimv+oQM+ctFNn2Fs1R4QWmPX0gcYBrhb3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62889F80476;
	Wed, 11 Dec 2019 17:54:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3327BF80457; Wed, 11 Dec 2019 17:54:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id CBFDFF8043D
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 17:54:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBFDFF8043D
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41B7A31B;
 Wed, 11 Dec 2019 08:54:43 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B4D553F52E;
 Wed, 11 Dec 2019 08:54:42 -0800 (PST)
Date: Wed, 11 Dec 2019 16:54:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20191210145406.21419-7-tiwai@suse.de>
Message-Id: <applied-20191210145406.21419-7-tiwai@suse.de>
X-Patchwork-Hint: ignore
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>
Subject: [alsa-devel] Applied "ASoC: fsl: Drop superfluous ioctl PCM ops" to
	the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: fsl: Drop superfluous ioctl PCM ops

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From 6ac44ce9dfd6ba4dfb1d5e571131d132c53f23f1 Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 10 Dec 2019 15:53:49 +0100
Subject: [PATCH] ASoC: fsl: Drop superfluous ioctl PCM ops

ASoC PCM core deals the empty ioctl field now as default.
Let's kill the redundant lines.

Cc: Timur Tabi <timur@kernel.org>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
Link: https://lore.kernel.org/r/20191210145406.21419-7-tiwai@suse.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_asrc_dma.c | 1 -
 sound/soc/fsl/fsl_dma.c      | 1 -
 sound/soc/fsl/imx-pcm-fiq.c  | 1 -
 sound/soc/fsl/mpc5200_dma.c  | 1 -
 4 files changed, 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index d6146de9acd2..79d66224c0a8 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -428,7 +428,6 @@ static void fsl_asrc_dma_pcm_free(struct snd_soc_component *component,
 
 struct snd_soc_component_driver fsl_asrc_component = {
 	.name		= DRV_NAME,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.hw_params	= fsl_asrc_dma_hw_params,
 	.hw_free	= fsl_asrc_dma_hw_free,
 	.trigger	= fsl_asrc_dma_trigger,
diff --git a/sound/soc/fsl/fsl_dma.c b/sound/soc/fsl/fsl_dma.c
index 2868c4f97cb2..13ae089c1911 100644
--- a/sound/soc/fsl/fsl_dma.c
+++ b/sound/soc/fsl/fsl_dma.c
@@ -903,7 +903,6 @@ static int fsl_soc_dma_probe(struct platform_device *pdev)
 	dma->dai.name = DRV_NAME;
 	dma->dai.open = fsl_dma_open;
 	dma->dai.close = fsl_dma_close;
-	dma->dai.ioctl = snd_soc_pcm_lib_ioctl;
 	dma->dai.hw_params = fsl_dma_hw_params;
 	dma->dai.hw_free = fsl_dma_hw_free;
 	dma->dai.pointer = fsl_dma_pointer;
diff --git a/sound/soc/fsl/imx-pcm-fiq.c b/sound/soc/fsl/imx-pcm-fiq.c
index 08131d147983..f20d5b1c3848 100644
--- a/sound/soc/fsl/imx-pcm-fiq.c
+++ b/sound/soc/fsl/imx-pcm-fiq.c
@@ -338,7 +338,6 @@ static void snd_imx_pcm_free(struct snd_soc_component *component,
 static const struct snd_soc_component_driver imx_soc_component_fiq = {
 	.open		= snd_imx_open,
 	.close		= snd_imx_close,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.hw_params	= snd_imx_pcm_hw_params,
 	.prepare	= snd_imx_pcm_prepare,
 	.trigger	= snd_imx_pcm_trigger,
diff --git a/sound/soc/fsl/mpc5200_dma.c b/sound/soc/fsl/mpc5200_dma.c
index 5237ac96b756..ed7211d744b3 100644
--- a/sound/soc/fsl/mpc5200_dma.c
+++ b/sound/soc/fsl/mpc5200_dma.c
@@ -360,7 +360,6 @@ static const struct snd_soc_component_driver mpc5200_audio_dma_component = {
 	.open		= psc_dma_open,
 	.close		= psc_dma_close,
 	.hw_free	= psc_dma_hw_free,
-	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.pointer	= psc_dma_pointer,
 	.trigger	= psc_dma_trigger,
 	.hw_params	= psc_dma_hw_params,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
