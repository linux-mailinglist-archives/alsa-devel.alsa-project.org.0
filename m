Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6418F118BDD
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 16:02:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E15E61691;
	Tue, 10 Dec 2019 16:01:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E15E61691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575990161;
	bh=3LXWrr36PzKZub/GudsJYR14sUhgif9wCs4/N9zTBGU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gh67lD8F6Gw8nR457p4Geixbn/KdPbdH4IRaCjU8B3t8+SI+hLmJU5clfiMlbeB77
	 IS5pLfFmGu1mtxsnP43Xet/aMXJxv1yLRirrMmoqBzwe0ovjIpnk1H8VpyzhOF5g2e
	 HLzSWrA/9Xr/dOZhbq9xJfVnDDwMci+yu1MNIWBI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE45BF802DB;
	Tue, 10 Dec 2019 15:54:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58EBDF80255; Tue, 10 Dec 2019 15:54:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E635BF80258
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 15:54:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E635BF80258
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 848C9AE07;
 Tue, 10 Dec 2019 14:54:12 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 10 Dec 2019 15:53:49 +0100
Message-Id: <20191210145406.21419-7-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210145406.21419-1-tiwai@suse.de>
References: <20191210145406.21419-1-tiwai@suse.de>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, Takashi Iwai <tiwai@suse.de>,
 alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>
Subject: [alsa-devel] [PATCH for-5.6 06/23] ASoC: fsl: Drop superfluous
	ioctl PCM ops
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

ASoC PCM core deals the empty ioctl field now as default.
Let's kill the redundant lines.

Cc: Timur Tabi <timur@kernel.org>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
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
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
