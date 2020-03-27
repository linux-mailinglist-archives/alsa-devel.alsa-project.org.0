Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1754195A82
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 17:00:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65A0D16BC;
	Fri, 27 Mar 2020 16:59:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65A0D16BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585324810;
	bh=/Mp6PTK+WKjdbNKbCLnl/OjuP/dyPCdWqgBpZedYIR8=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=PWhNiXbn5ZoO6qFDIvPNmtzQsU6V10EFmocZ77SaWzRkonCTs8LtSLgoRCeUUxBLN
	 tvyMVksy3VYaLrSdOt8j692gxu2eJPeA3o/Sy0e+W35bGPc50U3ifYC7EWxZjDuumm
	 dYSkjY5xDT/0qeYNR8qd4Dsqe+E9lnQpo0Jj9TwM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C074F80459;
	Fri, 27 Mar 2020 16:36:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 857D3F8047E; Fri, 27 Mar 2020 16:36:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 81E9AF80477
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 16:36:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81E9AF80477
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B472D1FB;
 Fri, 27 Mar 2020 08:36:36 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37D593F71F;
 Fri, 27 Mar 2020 08:36:36 -0700 (PDT)
Date: Fri, 27 Mar 2020 15:36:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: atmel: use asoc_rtd_to_cpu() / asoc_rtd_to_codec()
 macro for DAI pointer" to the asoc tree
In-Reply-To: <87369zk5ul.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87369zk5ul.wl-kuninori.morimoto.gx@renesas.com>
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

   ASoC: atmel: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer

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

From b434d70788815a4fb2de3051643ccf49cc38db42 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 23 Mar 2020 14:17:22 +0900
Subject: [PATCH] ASoC: atmel: use asoc_rtd_to_cpu() / asoc_rtd_to_codec()
 macro for DAI pointer

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/87369zk5ul.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/atmel/atmel-pcm-dma.c  | 4 ++--
 sound/soc/atmel/atmel-pcm-pdc.c  | 2 +-
 sound/soc/atmel/atmel_wm8904.c   | 2 +-
 sound/soc/atmel/mikroe-proto.c   | 2 +-
 sound/soc/atmel/sam9g20_wm8731.c | 2 +-
 sound/soc/atmel/sam9x5_wm8731.c  | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/atmel/atmel-pcm-dma.c b/sound/soc/atmel/atmel-pcm-dma.c
index db67f5ba1e9a..cb03c4f7324c 100644
--- a/sound/soc/atmel/atmel-pcm-dma.c
+++ b/sound/soc/atmel/atmel-pcm-dma.c
@@ -56,7 +56,7 @@ static void atmel_pcm_dma_irq(u32 ssc_sr,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct atmel_pcm_dma_params *prtd;
 
-	prtd = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
+	prtd = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
 
 	if (ssc_sr & prtd->mask->ssc_error) {
 		if (snd_pcm_running(substream))
@@ -83,7 +83,7 @@ static int atmel_pcm_configure_dma(struct snd_pcm_substream *substream,
 	struct ssc_device *ssc;
 	int ret;
 
-	prtd = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
+	prtd = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
 	ssc = prtd->ssc;
 
 	ret = snd_hwparams_to_dma_slave_config(substream, params, slave_config);
diff --git a/sound/soc/atmel/atmel-pcm-pdc.c b/sound/soc/atmel/atmel-pcm-pdc.c
index 59c1331a6984..a8daebcbf6c8 100644
--- a/sound/soc/atmel/atmel-pcm-pdc.c
+++ b/sound/soc/atmel/atmel-pcm-pdc.c
@@ -213,7 +213,7 @@ static int atmel_pcm_hw_params(struct snd_soc_component *component,
 	snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
 	runtime->dma_bytes = params_buffer_bytes(params);
 
-	prtd->params = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
+	prtd->params = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
 	prtd->params->dma_intr_handler = atmel_pcm_dma_irq;
 
 	prtd->dma_buffer = runtime->dma_addr;
diff --git a/sound/soc/atmel/atmel_wm8904.c b/sound/soc/atmel/atmel_wm8904.c
index 776b27d3686e..148c943cb538 100644
--- a/sound/soc/atmel/atmel_wm8904.c
+++ b/sound/soc/atmel/atmel_wm8904.c
@@ -27,7 +27,7 @@ static int atmel_asoc_wm8904_hw_params(struct snd_pcm_substream *substream,
 		struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_pll(codec_dai, WM8904_FLL_MCLK, WM8904_FLL_MCLK,
diff --git a/sound/soc/atmel/mikroe-proto.c b/sound/soc/atmel/mikroe-proto.c
index aa6d0d78566f..f9a85fd01b79 100644
--- a/sound/soc/atmel/mikroe-proto.c
+++ b/sound/soc/atmel/mikroe-proto.c
@@ -21,7 +21,7 @@
 static int snd_proto_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 
 	/* Set proto sysclk */
 	int ret = snd_soc_dai_set_sysclk(codec_dai, WM8731_SYSCLK_XTAL,
diff --git a/sound/soc/atmel/sam9g20_wm8731.c b/sound/soc/atmel/sam9g20_wm8731.c
index b1bef2bf142d..ed1f69b57024 100644
--- a/sound/soc/atmel/sam9g20_wm8731.c
+++ b/sound/soc/atmel/sam9g20_wm8731.c
@@ -96,7 +96,7 @@ static const struct snd_soc_dapm_route intercon[] = {
  */
 static int at91sam9g20ek_wm8731_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct device *dev = rtd->dev;
 	int ret;
 
diff --git a/sound/soc/atmel/sam9x5_wm8731.c b/sound/soc/atmel/sam9x5_wm8731.c
index 7822425d5e61..9fbc3c1113cc 100644
--- a/sound/soc/atmel/sam9x5_wm8731.c
+++ b/sound/soc/atmel/sam9x5_wm8731.c
@@ -40,7 +40,7 @@ struct sam9x5_drvdata {
  */
 static int sam9x5_wm8731_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct device *dev = rtd->dev;
 	int ret;
 
-- 
2.20.1

