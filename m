Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E21993EFA
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2024 08:52:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27D5483B;
	Tue,  8 Oct 2024 08:52:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27D5483B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728370343;
	bh=aBhMMc0z1xLqYQUA9NZ2tp+ctsltxUmNbPPcVsphsmk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=FiDvOSqzx8xeIMBuTRisSZdelmG3Xws3Gl+ILwMBCEi6ohZl+PXYvmiezYFjoJUpu
	 vv3UuFi5NRvsgTPz2p8pz5g62ye3DiLn7RCbdvE7Nvl/1QNNx35n61wvrEOZj8zXqM
	 FUL3iADy1sC56wsVKDlmHGCTba0dliesgfxIhO94=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8284BF805EE; Tue,  8 Oct 2024 08:51:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2DBBF805F9;
	Tue,  8 Oct 2024 08:51:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 471A3F80528; Tue,  8 Oct 2024 08:51:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2BE6CF80527
	for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2024 08:51:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BE6CF80527
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5C57F200081;
	Tue,  8 Oct 2024 08:51:06 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 22A74202309;
	Tue,  8 Oct 2024 08:51:06 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 7ACB9183B725;
	Tue,  8 Oct 2024 14:51:04 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: fsl_xcvr: reset RX dpath after wrong preamble
Date: Tue,  8 Oct 2024 14:27:53 +0800
Message-Id: <1728368873-31379-3-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1728368873-31379-1-git-send-email-shengjiu.wang@nxp.com>
References: <1728368873-31379-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: ZMV5H7LXDDEPILMPYPDWFXSL6DOHHCWI
X-Message-ID-Hash: ZMV5H7LXDDEPILMPYPDWFXSL6DOHHCWI
X-MailFrom: shengjiu.wang@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZMV5H7LXDDEPILMPYPDWFXSL6DOHHCWI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Below preamble error means wrong preamble of IEC958 received,
the channel order may be wrong at the moment.

FSL_XCVR_IRQ_PREAMBLE_MISMATCH
FSL_XCVR_IRQ_UNEXP_PRE_REC
FSL_XCVR_IRQ_M_W_PRE_MISMATCH
FSL_XCVR_IRQ_B_PRE_MISMATCH

All above errors may cause channel swap, to avoid such issues,
need to reset the DMAC path.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_xcvr.c | 90 ++++++++++++++++++++++++++++++++++------
 sound/soc/fsl/fsl_xcvr.h |  4 ++
 2 files changed, 81 insertions(+), 13 deletions(-)

diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index 9e24d6462c01..1e0bfd59d511 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -53,6 +53,8 @@ struct fsl_xcvr {
 	struct snd_aes_iec958 rx_iec958;
 	struct snd_aes_iec958 tx_iec958;
 	u8 cap_ds[FSL_XCVR_CAPDS_SIZE];
+	struct work_struct work_rst;
+	spinlock_t lock; /* Protect hw_reset and trigger */
 };
 
 static const struct fsl_xcvr_pll_conf {
@@ -663,7 +665,10 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 {
 	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
-	int ret;
+	unsigned long lock_flags;
+	int ret = 0;
+
+	spin_lock_irqsave(&xcvr->lock, lock_flags);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -675,7 +680,7 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 					 FSL_XCVR_EXT_CTRL_DPTH_RESET(tx));
 		if (ret < 0) {
 			dev_err(dai->dev, "Failed to set DPATH RESET: %d\n", ret);
-			return ret;
+			goto release_lock;
 		}
 
 		if (tx) {
@@ -687,7 +692,7 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 						   FSL_XCVR_ISR_CMDC_TX_EN);
 				if (ret < 0) {
 					dev_err(dai->dev, "err updating isr %d\n", ret);
-					return ret;
+					goto release_lock;
 				}
 				fallthrough;
 			case FSL_XCVR_MODE_SPDIF:
@@ -696,7 +701,7 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 					 FSL_XCVR_TX_DPTH_CTRL_STRT_DATA_TX);
 				if (ret < 0) {
 					dev_err(dai->dev, "Failed to start DATA_TX: %d\n", ret);
-					return ret;
+					goto release_lock;
 				}
 				break;
 			}
@@ -707,14 +712,14 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 					 FSL_XCVR_EXT_CTRL_DMA_DIS(tx), 0);
 		if (ret < 0) {
 			dev_err(dai->dev, "Failed to enable DMA: %d\n", ret);
-			return ret;
+			goto release_lock;
 		}
 
 		ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_IER0,
 					 FSL_XCVR_IRQ_EARC_ALL, FSL_XCVR_IRQ_EARC_ALL);
 		if (ret < 0) {
 			dev_err(dai->dev, "Error while setting IER0: %d\n", ret);
-			return ret;
+			goto release_lock;
 		}
 
 		/* clear DPATH RESET */
@@ -723,7 +728,7 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 					 0);
 		if (ret < 0) {
 			dev_err(dai->dev, "Failed to clear DPATH RESET: %d\n", ret);
-			return ret;
+			goto release_lock;
 		}
 
 		break;
@@ -736,14 +741,14 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 					 FSL_XCVR_EXT_CTRL_DMA_DIS(tx));
 		if (ret < 0) {
 			dev_err(dai->dev, "Failed to disable DMA: %d\n", ret);
-			return ret;
+			goto release_lock;
 		}
 
 		ret = regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_IER0,
 					 FSL_XCVR_IRQ_EARC_ALL, 0);
 		if (ret < 0) {
 			dev_err(dai->dev, "Failed to clear IER0: %d\n", ret);
-			return ret;
+			goto release_lock;
 		}
 
 		if (tx) {
@@ -754,7 +759,7 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 					 FSL_XCVR_TX_DPTH_CTRL_STRT_DATA_TX);
 				if (ret < 0) {
 					dev_err(dai->dev, "Failed to stop DATA_TX: %d\n", ret);
-					return ret;
+					goto release_lock;
 				}
 				if (xcvr->soc_data->spdif_only)
 					break;
@@ -768,17 +773,20 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 				if (ret < 0) {
 					dev_err(dai->dev,
 						"Err updating ISR %d\n", ret);
-					return ret;
+					goto release_lock;
 				}
 				break;
 			}
 		}
 		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
+		break;
 	}
 
-	return 0;
+release_lock:
+	spin_unlock_irqrestore(&xcvr->lock, lock_flags);
+	return ret;
 }
 
 static int fsl_xcvr_load_firmware(struct fsl_xcvr *xcvr)
@@ -1198,6 +1206,34 @@ static const struct regmap_config fsl_xcvr_regmap_cfg = {
 	.cache_type = REGCACHE_FLAT,
 };
 
+static void reset_rx_work(struct work_struct *work)
+{
+	struct fsl_xcvr *xcvr = container_of(work, struct fsl_xcvr, work_rst);
+	struct device *dev = &xcvr->pdev->dev;
+	unsigned long lock_flags;
+	u32 ext_ctrl;
+
+	dev_dbg(dev, "reset rx path\n");
+	spin_lock_irqsave(&xcvr->lock, lock_flags);
+	regmap_read(xcvr->regmap, FSL_XCVR_EXT_CTRL, &ext_ctrl);
+
+	if (!(ext_ctrl & FSL_XCVR_EXT_CTRL_DMA_RD_DIS)) {
+		regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
+				   FSL_XCVR_EXT_CTRL_DMA_RD_DIS,
+				   FSL_XCVR_EXT_CTRL_DMA_RD_DIS);
+		regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
+				   FSL_XCVR_EXT_CTRL_RX_DPTH_RESET,
+				   FSL_XCVR_EXT_CTRL_RX_DPTH_RESET);
+		regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
+				   FSL_XCVR_EXT_CTRL_DMA_RD_DIS,
+				   0);
+		regmap_update_bits(xcvr->regmap, FSL_XCVR_EXT_CTRL,
+				   FSL_XCVR_EXT_CTRL_RX_DPTH_RESET,
+				   0);
+	}
+	spin_unlock_irqrestore(&xcvr->lock, lock_flags);
+}
+
 static irqreturn_t irq0_isr(int irq, void *devid)
 {
 	struct fsl_xcvr *xcvr = (struct fsl_xcvr *)devid;
@@ -1269,6 +1305,29 @@ static irqreturn_t irq0_isr(int irq, void *devid)
 		dev_dbg(dev, "CMDC status update\n");
 		isr_clr |= FSL_XCVR_IRQ_CMDC_STATUS_UPD;
 	}
+	if (isr & FSL_XCVR_IRQ_PREAMBLE_MISMATCH) {
+		dev_dbg(dev, "Preamble mismatch\n");
+		isr_clr |= FSL_XCVR_IRQ_PREAMBLE_MISMATCH;
+	}
+	if (isr & FSL_XCVR_IRQ_UNEXP_PRE_REC) {
+		dev_dbg(dev, "Unexpected preamble received\n");
+		isr_clr |= FSL_XCVR_IRQ_UNEXP_PRE_REC;
+	}
+	if (isr & FSL_XCVR_IRQ_M_W_PRE_MISMATCH) {
+		dev_dbg(dev, "M/W preamble mismatch\n");
+		isr_clr |= FSL_XCVR_IRQ_M_W_PRE_MISMATCH;
+	}
+	if (isr & FSL_XCVR_IRQ_B_PRE_MISMATCH) {
+		dev_dbg(dev, "B preamble mismatch\n");
+		isr_clr |= FSL_XCVR_IRQ_B_PRE_MISMATCH;
+	}
+
+	if (isr & (FSL_XCVR_IRQ_PREAMBLE_MISMATCH |
+		   FSL_XCVR_IRQ_UNEXP_PRE_REC |
+		   FSL_XCVR_IRQ_M_W_PRE_MISMATCH |
+		   FSL_XCVR_IRQ_B_PRE_MISMATCH)) {
+		schedule_work(&xcvr->work_rst);
+	}
 
 	if (isr_clr) {
 		regmap_write(regmap, FSL_XCVR_EXT_ISR_CLR, isr_clr);
@@ -1415,11 +1474,16 @@ static int fsl_xcvr_probe(struct platform_device *pdev)
 			fsl_xcvr_comp.name);
 	}
 
+	INIT_WORK(&xcvr->work_rst, reset_rx_work);
+	spin_lock_init(&xcvr->lock);
 	return ret;
 }
 
 static void fsl_xcvr_remove(struct platform_device *pdev)
 {
+	struct fsl_xcvr *xcvr = dev_get_drvdata(&pdev->dev);
+
+	cancel_work_sync(&xcvr->work_rst);
 	pm_runtime_disable(&pdev->dev);
 }
 
diff --git a/sound/soc/fsl/fsl_xcvr.h b/sound/soc/fsl/fsl_xcvr.h
index ce27b13698e7..c72cb05184df 100644
--- a/sound/soc/fsl/fsl_xcvr.h
+++ b/sound/soc/fsl/fsl_xcvr.h
@@ -166,6 +166,10 @@
 					 FSL_XCVR_IRQ_FIFO_UOFL_ERR | \
 					 FSL_XCVR_IRQ_HOST_WAKEUP | \
 					 FSL_XCVR_IRQ_CMDC_STATUS_UPD |\
+					 FSL_XCVR_IRQ_B_PRE_MISMATCH |\
+					 FSL_XCVR_IRQ_M_W_PRE_MISMATCH |\
+					 FSL_XCVR_IRQ_PREAMBLE_MISMATCH |\
+					 FSL_XCVR_IRQ_UNEXP_PRE_REC |\
 					 FSL_XCVR_IRQ_ARC_MODE)
 
 #define FSL_XCVR_ISR_CMDC_TX_EN		BIT(3)
-- 
2.34.1

