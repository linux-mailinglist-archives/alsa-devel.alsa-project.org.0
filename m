Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA58195A21
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 16:44:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9ED72168C;
	Fri, 27 Mar 2020 16:44:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9ED72168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585323890;
	bh=B0JnR2h0eAy1rJ4ETwDDbzKourPsXPzuOUBU9duwKTU=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=EcxuQIPWUg46naAHRmMNzmcInX5pjdGfZzOcAyMmaYQC62no+ZI14CLqBeW5q0neN
	 oXwZXcBOGTO2KODh/hxPaZDpc71A4aDY2H4zV2WyI+O6R3Aiw5IxtHhqdb0Iprb571
	 asGNIT8OqVNnY2+iNk8nKoALsySfEmk89HscDPAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3448EF80346;
	Fri, 27 Mar 2020 16:34:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7210DF8033D; Fri, 27 Mar 2020 16:34:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id B0802F80340
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 16:34:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0802F80340
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 302F91FB;
 Fri, 27 Mar 2020 08:34:39 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A53783F71F;
 Fri, 27 Mar 2020 08:34:38 -0700 (PDT)
Date: Fri, 27 Mar 2020 15:34:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: ux500: use asoc_rtd_to_cpu() / asoc_rtd_to_codec()
 macro for DAI pointer" to the asoc tree
In-Reply-To: <871rpjir34.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-871rpjir34.wl-kuninori.morimoto.gx@renesas.com>
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

   ASoC: ux500: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer

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

From 99396e3883672a9073e7458b40504d647351b54f Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 23 Mar 2020 14:21:35 +0900
Subject: [PATCH] ASoC: ux500: use asoc_rtd_to_cpu() / asoc_rtd_to_codec()
 macro for DAI pointer

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/871rpjir34.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/ux500/mop500_ab8500.c | 6 +++---
 sound/soc/ux500/ux500_pcm.c     | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/ux500/mop500_ab8500.c b/sound/soc/ux500/mop500_ab8500.c
index 77655084bbde..6aaa19829a73 100644
--- a/sound/soc/ux500/mop500_ab8500.c
+++ b/sound/soc/ux500/mop500_ab8500.c
@@ -215,8 +215,8 @@ static int mop500_ab8500_hw_params(struct snd_pcm_substream *substream,
 			struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct device *dev = rtd->card->dev;
 	unsigned int fmt;
 	int channels, ret = 0, driver_mode, slots;
@@ -339,7 +339,7 @@ static int mop500_ab8500_hw_params(struct snd_pcm_substream *substream,
 static int mop500_ab8500_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 
 	mutex_lock(&mop500_ab8500_params_lock);
 	__clear_bit(cpu_dai->id, &mop500_ab8500_usage);
diff --git a/sound/soc/ux500/ux500_pcm.c b/sound/soc/ux500/ux500_pcm.c
index 9445dbe8e039..39b96c132bc8 100644
--- a/sound/soc/ux500/ux500_pcm.c
+++ b/sound/soc/ux500/ux500_pcm.c
@@ -46,7 +46,7 @@ static const struct snd_pcm_hardware ux500_pcm_hw = {
 static struct dma_chan *ux500_pcm_request_chan(struct snd_soc_pcm_runtime *rtd,
 	struct snd_pcm_substream *substream)
 {
-	struct snd_soc_dai *dai = rtd->cpu_dai;
+	struct snd_soc_dai *dai = asoc_rtd_to_cpu(rtd, 0);
 	u16 per_data_width, mem_data_width;
 	struct stedma40_chan_cfg *dma_cfg;
 	struct ux500_msp_dma_params *dma_params;
@@ -86,7 +86,7 @@ static int ux500_pcm_prepare_slave_config(struct snd_pcm_substream *substream,
 		struct dma_slave_config *slave_config)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct msp_i2s_platform_data *pdata = rtd->cpu_dai->dev->platform_data;
+	struct msp_i2s_platform_data *pdata = asoc_rtd_to_cpu(rtd, 0)->dev->platform_data;
 	struct snd_dmaengine_dai_dma_data *snd_dma_params;
 	struct ux500_msp_dma_params *ste_dma_params;
 	dma_addr_t dma_addr;
@@ -94,11 +94,11 @@ static int ux500_pcm_prepare_slave_config(struct snd_pcm_substream *substream,
 
 	if (pdata) {
 		ste_dma_params =
-			snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
+			snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
 		dma_addr = ste_dma_params->tx_rx_addr;
 	} else {
 		snd_dma_params =
-			snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
+			snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
 		dma_addr = snd_dma_params->addr;
 	}
 
-- 
2.20.1

