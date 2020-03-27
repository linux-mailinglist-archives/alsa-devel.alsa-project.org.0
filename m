Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72848195A1B
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 16:43:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BB4F1664;
	Fri, 27 Mar 2020 16:42:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BB4F1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585323818;
	bh=i/+nApljOj5QJ0SlblhmYkX4W4sH3YxBH9vcGSj3tqM=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=LkVmwTXQhxLnHNgH0OBEnEcORzYKQqL6FHY/y2RulSybcZZRXi98fmf9HdjCP2CSv
	 Lte+t3h7H7Xk5NPgizjdPqL/Kr0BDXUH4iX9VMwCfD/S0/MzT8bLt927KPs2tV7wtx
	 +l2gNzVm9sQAt43Z2Z9yVc2516P/DutqkkO1eUTQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C917DF80336;
	Fri, 27 Mar 2020 16:34:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97A2AF80334; Fri, 27 Mar 2020 16:34:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id A644FF80322
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 16:34:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A644FF80322
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25CC61FB;
 Fri, 27 Mar 2020 08:34:30 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E6CB3F71F;
 Fri, 27 Mar 2020 08:34:29 -0700 (PDT)
Date: Fri, 27 Mar 2020 15:34:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: arm: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro
 for DAI pointer" to the asoc tree
In-Reply-To: <87y2rrhcia.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87y2rrhcia.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

The patch

   ASoC: arm: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 575be8838dcad6f127d8bbcb69cf0b8128342d5b Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 23 Mar 2020 14:21:49 +0900
Subject: [PATCH] ASoC: arm: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro
 for DAI pointer

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/87y2rrhcia.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/arm/pxa2xx-pcm-lib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/arm/pxa2xx-pcm-lib.c b/sound/arm/pxa2xx-pcm-lib.c
index a86c95d89824..e81083e1bc68 100644
--- a/sound/arm/pxa2xx-pcm-lib.c
+++ b/sound/arm/pxa2xx-pcm-lib.c
@@ -38,7 +38,7 @@ int pxa2xx_pcm_hw_params(struct snd_pcm_substream *substream,
 	struct dma_slave_config config;
 	int ret;
 
-	dma_params = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
+	dma_params = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
 	if (!dma_params)
 		return 0;
 
@@ -47,7 +47,7 @@ int pxa2xx_pcm_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 
 	snd_dmaengine_pcm_set_config_from_dai_data(substream,
-			snd_soc_dai_get_dma_data(rtd->cpu_dai, substream),
+			snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream),
 			&config);
 
 	ret = dmaengine_slave_config(chan, &config);
@@ -95,7 +95,7 @@ int pxa2xx_pcm_open(struct snd_pcm_substream *substream)
 
 	runtime->hw = pxa2xx_pcm_hardware;
 
-	dma_params = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
+	dma_params = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
 	if (!dma_params)
 		return 0;
 
@@ -120,7 +120,7 @@ int pxa2xx_pcm_open(struct snd_pcm_substream *substream)
 		return ret;
 
 	return snd_dmaengine_pcm_open(
-		substream, dma_request_slave_channel(rtd->cpu_dai->dev,
+		substream, dma_request_slave_channel(asoc_rtd_to_cpu(rtd, 0)->dev,
 						     dma_params->chan_name));
 }
 EXPORT_SYMBOL(pxa2xx_pcm_open);
-- 
2.20.1

