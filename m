Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6955214DA
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 14:10:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5466D1738;
	Tue, 10 May 2022 14:09:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5466D1738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652184603;
	bh=lFJcbVCPRrlxMF7Es3buefEYHExe8F0q0Q6c96lfHIw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PuGJuQ0Utce35cJixCYwAvdWabkFV9MjuK6eIQfSsIMo6081TYdCZLPnKmHexwe2a
	 V3apBlhCQdvvx1s3/tet1aVQ8QLhTlXV48DFHoNE+byTAwuePR4WhHmysw05Rjsb2U
	 ueEEFUbEmfQDKh6lHTe0rz3P3cz/O3XI9+I5KXe0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCB54F8014C;
	Tue, 10 May 2022 14:09:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75FE7F8019D; Tue, 10 May 2022 14:09:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41D1BF8014C
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 14:08:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41D1BF8014C
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 615831A005D;
 Tue, 10 May 2022 14:08:56 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CE76B1A0056;
 Tue, 10 May 2022 14:08:55 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 99A48180031E;
 Tue, 10 May 2022 20:08:54 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl_ssi: Add support multi fifo script
Date: Tue, 10 May 2022 19:56:48 +0800
Message-Id: <1652183808-3745-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
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

With dual fifo enabled, the case that recording mono sound
in the background, playback mono sound twice in parallal,
at second time playback sound may distort, the possible
reason is using dual fifo to playback mono sound is not
recommended.

This patch is to provide a option to use multi fifo script,
which can be dynamically configured as one fifo or two fifo
mode.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_ssi.c | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index ca30a4ede076..84cb36d9dfea 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -40,6 +40,7 @@
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
+#include <linux/dma/imx-dma.h>
 
 #include <sound/core.h>
 #include <sound/pcm.h>
@@ -214,6 +215,7 @@ struct fsl_ssi_soc_data {
  * @synchronous: Use synchronous mode - both of TX and RX use STCK and SFCK
  * @use_dma: DMA is used or FIQ with stream filter
  * @use_dual_fifo: DMA with support for dual FIFO mode
+ * @use_dyna_fifo: DMA with support for multi FIFO script
  * @has_ipg_clk_name: If "ipg" is in the clock name list of device tree
  * @fifo_depth: Depth of the SSI FIFOs
  * @slot_width: Width of each DAI slot
@@ -243,6 +245,7 @@ struct fsl_ssi_soc_data {
  * @dma_maxburst: Max number of words to transfer in one go. So far,
  *                this is always the same as fifo_watermark.
  * @ac97_reg_lock: Mutex lock to serialize AC97 register access operations
+ * @audio_config: configure for dma multi fifo script
  */
 struct fsl_ssi {
 	struct regmap *regs;
@@ -255,6 +258,7 @@ struct fsl_ssi {
 	bool synchronous;
 	bool use_dma;
 	bool use_dual_fifo;
+	bool use_dyna_fifo;
 	bool has_ipg_clk_name;
 	unsigned int fifo_depth;
 	unsigned int slot_width;
@@ -287,6 +291,7 @@ struct fsl_ssi {
 	u32 dma_maxburst;
 
 	struct mutex ac97_reg_lock;
+	struct sdma_peripheral_config audio_config[2];
 };
 
 /*
@@ -643,7 +648,7 @@ static int fsl_ssi_startup(struct snd_pcm_substream *substream,
 	 * task from fifo0, fifo1 would be neglected at the end of each
 	 * period. But SSI would still access fifo1 with an invalid data.
 	 */
-	if (ssi->use_dual_fifo)
+	if (ssi->use_dual_fifo || ssi->use_dyna_fifo)
 		snd_pcm_hw_constraint_step(substream->runtime, 0,
 					   SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 2);
 
@@ -802,6 +807,7 @@ static int fsl_ssi_hw_params(struct snd_pcm_substream *substream,
 {
 	bool tx2, tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	struct fsl_ssi *ssi = snd_soc_dai_get_drvdata(dai);
+	struct fsl_ssi_regvals *vals = ssi->regvals;
 	struct regmap *regs = ssi->regs;
 	unsigned int channels = params_channels(hw_params);
 	unsigned int sample_size = params_width(hw_params);
@@ -856,6 +862,28 @@ static int fsl_ssi_hw_params(struct snd_pcm_substream *substream,
 	tx2 = tx || ssi->synchronous;
 	regmap_update_bits(regs, REG_SSI_SxCCR(tx2), SSI_SxCCR_WL_MASK, wl);
 
+	if (ssi->use_dyna_fifo) {
+		if (channels == 1) {
+			ssi->audio_config[0].n_fifos_dst = 1;
+			ssi->audio_config[1].n_fifos_src = 1;
+			vals[RX].srcr &= ~SSI_SRCR_RFEN1;
+			vals[TX].stcr &= ~SSI_STCR_TFEN1;
+			vals[RX].scr  &= ~SSI_SCR_TCH_EN;
+			vals[TX].scr  &= ~SSI_SCR_TCH_EN;
+		} else {
+			ssi->audio_config[0].n_fifos_dst = 2;
+			ssi->audio_config[1].n_fifos_src = 2;
+			vals[RX].srcr |= SSI_SRCR_RFEN1;
+			vals[TX].stcr |= SSI_STCR_TFEN1;
+			vals[RX].scr  |= SSI_SCR_TCH_EN;
+			vals[TX].scr  |= SSI_SCR_TCH_EN;
+		}
+		ssi->dma_params_tx.peripheral_config = &ssi->audio_config[0];
+		ssi->dma_params_tx.peripheral_size = sizeof(ssi->audio_config[0]);
+		ssi->dma_params_rx.peripheral_config = &ssi->audio_config[1];
+		ssi->dma_params_rx.peripheral_size = sizeof(ssi->audio_config[1]);
+	}
+
 	return 0;
 }
 
@@ -1353,7 +1381,7 @@ static int fsl_ssi_imx_probe(struct platform_device *pdev,
 	ssi->dma_params_rx.addr = ssi->ssi_phys + REG_SSI_SRX0;
 
 	/* Use even numbers to avoid channel swap due to SDMA script design */
-	if (ssi->use_dual_fifo) {
+	if (ssi->use_dual_fifo || ssi->use_dyna_fifo) {
 		ssi->dma_params_tx.maxburst &= ~0x1;
 		ssi->dma_params_rx.maxburst &= ~0x1;
 	}
@@ -1446,6 +1474,8 @@ static int fsl_ssi_probe_from_dt(struct fsl_ssi *ssi)
 	if (ssi->use_dma && !ret && dmas[2] == IMX_DMATYPE_SSI_DUAL)
 		ssi->use_dual_fifo = true;
 
+	if (ssi->use_dma && !ret && dmas[2] == IMX_DMATYPE_MULTI_SAI)
+		ssi->use_dyna_fifo = true;
 	/*
 	 * Backward compatible for older bindings by manually triggering the
 	 * machine driver's probe(). Use /compatible property, including the
-- 
2.17.1

