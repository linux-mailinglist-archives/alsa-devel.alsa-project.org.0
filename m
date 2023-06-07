Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A6B725A03
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 11:21:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D395D825;
	Wed,  7 Jun 2023 11:20:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D395D825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686129662;
	bh=0tWcBeij4s8WagaAM5q0PnBo51Kt0KMKt0fEo0Rc0Q8=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IdyuCAyOhSlIjN8RI1kNh2miIw+bRqiHWDP3s8k1I7fJZjzJS8wnuisGnSERzUF9D
	 b3HfbNoWt73Da6QwKpNN/v3Pe+TPyx+beSApx6T5qKCS27GZm6Otik6TMOSbEQjifg
	 NB18hwV7unD9u3o6vy7OllfPOCoWZRkoQewk83zM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B02F8F805AF; Wed,  7 Jun 2023 11:18:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB3DBF805A8;
	Wed,  7 Jun 2023 11:18:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8750F80199; Wed,  7 Jun 2023 10:15:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F836F800C8
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 10:14:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F836F800C8
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id B83747F8A;
	Wed,  7 Jun 2023 16:14:40 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 7 Jun
 2023 16:14:40 +0800
Received: from SD-Server.starfivetech.com (183.27.98.122) by
 EXMBX168.cuchost.com (172.16.6.78) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Wed, 7 Jun 2023 16:14:40 +0800
From: Walker Chen <walker.chen@starfivetech.com>
To: Mark Brown <broonie@kernel.org>, Claudiu Beznea
	<Claudiu.Beznea@microchip.com>, Dan Carpenter <dan.carpenter@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, "Jaroslav
 Kysela" <perex@perex.cz>, Walker Chen <walker.chen@starfivetech.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1] ASoC: starfive: Cleanup and fix error check for JH7110 TDM
Date: Wed, 7 Jun 2023 16:14:39 +0800
Message-ID: <20230607081439.1517-1-walker.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [183.27.98.122]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-MailFrom: walker.chen@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: C4FJGGKNJ7NKCZH2J5LZ7BKZKOFQIKYZ
X-Message-ID-Hash: C4FJGGKNJ7NKCZH2J5LZ7BKZKOFQIKYZ
X-Mailman-Approved-At: Wed, 07 Jun 2023 09:18:37 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some minor issues were found during addtional testing and static
analysis. The patch fixed these minor issues.
1.Use BIT() macro to indicate configuration for TDM registers.

2.Fix the check for devm_reset_control_array_get_exclusive return
value. The devm_reset_control_array_get_exclusive() function may return
NULL if it's an optional request. If optional is intended then NULL
should not be treated as an error case, but as a special kind of success
case. So here the IS_ERR() is used to check better.

Fixes: fd4762b6b5cf ("ASoC: starfive: Add JH7110 TDM driver")
Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
---
Fix the following issue:
https://lore.kernel.org/all/ZH7t6Nc+NTcGpq%2F3@moroto/
---
 sound/soc/starfive/jh7110_tdm.c | 200 +++++++++++---------------------
 1 file changed, 68 insertions(+), 132 deletions(-)

diff --git a/sound/soc/starfive/jh7110_tdm.c b/sound/soc/starfive/jh7110_tdm.c
index 973b910d2d3e..139ff091672e 100644
--- a/sound/soc/starfive/jh7110_tdm.c
+++ b/sound/soc/starfive/jh7110_tdm.c
@@ -24,63 +24,33 @@
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
 
+/* Register offsets for JH7110 TDM device */
 #define TDM_PCMGBCR			0x00
-	#define PCMGBCR_MASK		0x1e
-	#define PCMGBCR_ENABLE		BIT(0)
-	#define PCMGBCR_TRITXEN		BIT(4)
-	#define CLKPOL_BIT		5
-	#define TRITXEN_BIT		4
-	#define ELM_BIT			3
-	#define SYNCM_BIT		2
-	#define MS_BIT			1
 #define TDM_PCMTXCR			0x04
-	#define PCMTXCR_TXEN		BIT(0)
-	#define IFL_BIT			11
-	#define WL_BIT			8
-	#define SSCALE_BIT		4
-	#define SL_BIT			2
-	#define LRJ_BIT			1
 #define TDM_PCMRXCR			0x08
-	#define PCMRXCR_RXEN		BIT(0)
-	#define PCMRXCR_RXSL_MASK	0xc
-	#define PCMRXCR_RXSL_16BIT	0x4
-	#define PCMRXCR_RXSL_32BIT	0x8
-	#define PCMRXCR_SCALE_MASK	0xf0
-	#define PCMRXCR_SCALE_1CH	0x10
 #define TDM_PCMDIV			0x0c
 
-#define JH7110_TDM_FIFO			0x170c0000
-#define JH7110_TDM_FIFO_DEPTH		32
+/* Bit definition for TDM_PCMGBCR */
+#define TDM_PCMGBCR_SYNCM_LONG		BIT(2)
+#define TDM_PCMGBCR_MS_SLAVE		BIT(1)
+#define TDM_PCMGBCR_EN			BIT(0)
 
-enum TDM_MASTER_SLAVE_MODE {
-	TDM_AS_MASTER = 0,
-	TDM_AS_SLAVE,
-};
+/* Bit definition for TDM_PCMTXCR */
+#define TDM_PCMTXCR_LEFT_J		BIT(1)
+#define TDM_PCMTXCR_TXEN		BIT(0)
 
-enum TDM_CLKPOL {
-	/* tx raising and rx falling */
-	TDM_TX_RASING_RX_FALLING = 0,
-	/* tx falling and rx raising */
-	TDM_TX_FALLING_RX_RASING,
-};
+/* Bit definition for TDM_PCMRXCR */
+#define TDM_PCMRXCR_LEFT_J		BIT(1)
+#define TDM_PCMRXCR_RXEN		BIT(0)
 
-enum TDM_ELM {
-	/* only work while SYNCM=0 */
-	TDM_ELM_LATE = 0,
-	TDM_ELM_EARLY,
-};
-
-enum TDM_SYNCM {
-	/* short frame sync */
-	TDM_SYNCM_SHORT = 0,
-	/* long frame sync */
-	TDM_SYNCM_LONG,
-};
+#define JH7110_TDM_FIFO			0x170c0000
+#define JH7110_TDM_FIFO_DEPTH		32
 
-enum TDM_IFL {
-	/* FIFO to send or received : half-1/2, Quarter-1/4 */
-	TDM_FIFO_HALF = 0,
-	TDM_FIFO_QUARTER,
+enum TDM_SL {
+	/* send or received slot length */
+	TDM_8BIT_SLOT_LEN = 0,
+	TDM_16BIT_SLOT_LEN,
+	TDM_32BIT_SLOT_LEN,
 };
 
 enum TDM_WL {
@@ -92,43 +62,24 @@ enum TDM_WL {
 	TDM_32BIT_WORD_LEN,
 };
 
-enum TDM_SL {
-	/* send or received slot length */
-	TDM_8BIT_SLOT_LEN = 0,
-	TDM_16BIT_SLOT_LEN,
-	TDM_32BIT_SLOT_LEN,
-};
-
-enum TDM_LRJ {
-	/* left-justify or right-justify */
-	TDM_RIGHT_JUSTIFY = 0,
-	TDM_LEFT_JUSTIFT,
-};
-
-struct tdm_chan_cfg {
-	enum TDM_IFL ifl;
-	enum TDM_WL  wl;
-	unsigned char sscale;
-	enum TDM_SL  sl;
-	enum TDM_LRJ lrj;
-	unsigned char enable;
-};
-
 struct jh7110_tdm_dev {
 	void __iomem *tdm_base;
 	struct device *dev;
 	struct clk_bulk_data clks[6];
 	struct reset_control *resets;
 
-	enum TDM_CLKPOL clkpolity;
-	enum TDM_ELM	elm;
-	enum TDM_SYNCM	syncm;
-	enum TDM_MASTER_SLAVE_MODE ms_mode;
+	/* related to PCMTXCR */
+	u16 txwl;
+	u16 txsscale;
+	u16 txsl;
 
-	struct tdm_chan_cfg tx;
-	struct tdm_chan_cfg rx;
+	/* related to PCMRXCR */
+	u16 rxwl;
+	u16 rxsscale;
+	u16 rxsl;
 
 	u16 syncdiv;
+	u16 syncm;
 	u32 samplerate;
 	u32 pcmclk;
 
@@ -166,13 +117,13 @@ static void jh7110_tdm_start(struct jh7110_tdm_dev *tdm,
 	u32 data;
 
 	data = jh7110_tdm_readl(tdm, TDM_PCMGBCR);
-	jh7110_tdm_writel(tdm, TDM_PCMGBCR, data | PCMGBCR_ENABLE);
+	jh7110_tdm_writel(tdm, TDM_PCMGBCR, data | TDM_PCMGBCR_EN);
 
 	/* restore context */
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		jh7110_tdm_writel(tdm, TDM_PCMTXCR, tdm->saved_pcmtxcr | PCMTXCR_TXEN);
+		jh7110_tdm_writel(tdm, TDM_PCMTXCR, tdm->saved_pcmtxcr | TDM_PCMTXCR_TXEN);
 	else
-		jh7110_tdm_writel(tdm, TDM_PCMRXCR, tdm->saved_pcmrxcr | PCMRXCR_RXEN);
+		jh7110_tdm_writel(tdm, TDM_PCMRXCR, tdm->saved_pcmrxcr | TDM_PCMRXCR_RXEN);
 }
 
 static void jh7110_tdm_stop(struct jh7110_tdm_dev *tdm,
@@ -182,11 +133,11 @@ static void jh7110_tdm_stop(struct jh7110_tdm_dev *tdm,
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		val = jh7110_tdm_readl(tdm, TDM_PCMTXCR);
-		val &= ~PCMTXCR_TXEN;
+		val &= ~TDM_PCMTXCR_TXEN;
 		jh7110_tdm_writel(tdm, TDM_PCMTXCR, val);
 	} else {
 		val = jh7110_tdm_readl(tdm, TDM_PCMRXCR);
-		val &= ~PCMRXCR_RXEN;
+		val &= ~TDM_PCMRXCR_RXEN;
 		jh7110_tdm_writel(tdm, TDM_PCMRXCR, val);
 	}
 }
@@ -195,15 +146,15 @@ static int jh7110_tdm_syncdiv(struct jh7110_tdm_dev *tdm)
 {
 	u32 sl, sscale, syncdiv;
 
-	if (tdm->rx.sl >= tdm->tx.sl)
-		sl = tdm->rx.sl;
+	if (tdm->rxsl >= tdm->txsl)
+		sl = tdm->rxsl;
 	else
-		sl = tdm->tx.sl;
+		sl = tdm->txsl;
 
-	if (tdm->rx.sscale >= tdm->tx.sscale)
-		sscale = tdm->rx.sscale;
+	if (tdm->rxsscale >= tdm->txsscale)
+		sscale = tdm->rxsscale;
 	else
-		sscale = tdm->tx.sscale;
+		sscale = tdm->txsscale;
 
 	syncdiv = tdm->pcmclk / tdm->samplerate - 1;
 
@@ -212,10 +163,10 @@ static int jh7110_tdm_syncdiv(struct jh7110_tdm_dev *tdm)
 		return -EINVAL;
 	}
 
-	if (tdm->syncm == TDM_SYNCM_LONG &&
-	    (tdm->rx.sscale <= 1 || tdm->tx.sscale <= 1) &&
+	if (tdm->syncm == TDM_PCMGBCR_SYNCM_LONG &&
+	    (tdm->rxsscale <= 1 || tdm->txsscale <= 1) &&
 	    ((syncdiv + 1) <= sl)) {
-		dev_err(tdm->dev, "Wrong syncdiv! It must be (syncdiv+1) > max[tx.sl, rx.sl]\n");
+		dev_err(tdm->dev, "Wrong syncdiv! It must be (syncdiv+1) > max[txsl, rxsl]\n");
 		return -EINVAL;
 	}
 
@@ -233,17 +184,15 @@ static int jh7110_tdm_config(struct jh7110_tdm_dev *tdm,
 	if (ret)
 		return ret;
 
-	datarx = (tdm->rx.ifl << IFL_BIT) |
-		  (tdm->rx.wl << WL_BIT) |
-		  (tdm->rx.sscale << SSCALE_BIT) |
-		  (tdm->rx.sl << SL_BIT) |
-		  (tdm->rx.lrj << LRJ_BIT);
+	datarx = (tdm->rxwl << 8) |
+		  (tdm->rxsscale << 4) |
+		  (tdm->rxsl << 2) |
+		  TDM_PCMRXCR_LEFT_J;
 
-	datatx = (tdm->tx.ifl << IFL_BIT) |
-		  (tdm->tx.wl << WL_BIT) |
-		  (tdm->tx.sscale << SSCALE_BIT) |
-		  (tdm->tx.sl << SL_BIT) |
-		  (tdm->tx.lrj << LRJ_BIT);
+	datatx = (tdm->txwl << 8) |
+		  (tdm->txsscale << 4) |
+		  (tdm->txsl << 2) |
+		  TDM_PCMTXCR_LEFT_J;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		jh7110_tdm_writel(tdm, TDM_PCMTXCR, datatx);
@@ -346,7 +295,8 @@ static int jh7110_tdm_hw_params(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
 	struct jh7110_tdm_dev *tdm = snd_soc_dai_get_drvdata(dai);
-	int chan_wl, chan_sl, chan_nr;
+	int chan_nr;
+	unsigned short chan_wl, chan_sl;
 	unsigned int data_width;
 	unsigned int dma_bus_width;
 	struct snd_dmaengine_dai_dma_data *dma_data = NULL;
@@ -389,15 +339,15 @@ static int jh7110_tdm_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		tdm->tx.wl = chan_wl;
-		tdm->tx.sl = chan_sl;
-		tdm->tx.sscale = chan_nr;
+		tdm->txwl = chan_wl;
+		tdm->txsl = chan_sl;
+		tdm->txsscale = chan_nr;
 		tdm->play_dma_data.addr_width = dma_bus_width;
 		dma_data = &tdm->play_dma_data;
 	} else {
-		tdm->rx.wl = chan_wl;
-		tdm->rx.sl = chan_sl;
-		tdm->rx.sscale = chan_nr;
+		tdm->rxwl = chan_wl;
+		tdm->rxsl = chan_sl;
+		tdm->rxsscale = chan_nr;
 		tdm->capture_dma_data.addr_width = dma_bus_width;
 		dma_data = &tdm->capture_dma_data;
 	}
@@ -444,15 +394,17 @@ static int jh7110_tdm_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 	struct jh7110_tdm_dev *tdm = snd_soc_dai_get_drvdata(cpu_dai);
 	unsigned int gbcr;
 
+	gbcr = tdm->syncm;
+
 	/* set master/slave audio interface */
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
 	case SND_SOC_DAIFMT_BP_FP:
 		/* cpu is master */
-		tdm->ms_mode = TDM_AS_MASTER;
+		gbcr &= ~TDM_PCMGBCR_MS_SLAVE;
 		break;
 	case SND_SOC_DAIFMT_BC_FC:
 		/* codec is master */
-		tdm->ms_mode = TDM_AS_SLAVE;
+		gbcr |= TDM_PCMGBCR_MS_SLAVE;
 		break;
 	case SND_SOC_DAIFMT_BC_FP:
 	case SND_SOC_DAIFMT_BP_FC:
@@ -462,10 +414,6 @@ static int jh7110_tdm_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 		return -EINVAL;
 	}
 
-	gbcr = (tdm->clkpolity << CLKPOL_BIT) |
-		(tdm->elm << ELM_BIT) |
-		(tdm->syncm << SYNCM_BIT) |
-		(tdm->ms_mode << MS_BIT);
 	jh7110_tdm_writel(tdm, TDM_PCMGBCR, gbcr);
 
 	return 0;
@@ -537,18 +485,7 @@ static const struct snd_dmaengine_pcm_config jh7110_dmaengine_pcm_config = {
 
 static void jh7110_tdm_init_params(struct jh7110_tdm_dev *tdm)
 {
-	tdm->clkpolity = TDM_TX_RASING_RX_FALLING;
-	tdm->elm = TDM_ELM_LATE;
-	tdm->syncm = TDM_SYNCM_SHORT;
-
-	tdm->rx.ifl = TDM_FIFO_HALF;
-	tdm->tx.ifl = TDM_FIFO_HALF;
-	tdm->rx.wl = TDM_16BIT_WORD_LEN;
-	tdm->tx.wl = TDM_16BIT_WORD_LEN;
-	tdm->rx.sscale = 2;
-	tdm->tx.sscale = 2;
-	tdm->rx.lrj = TDM_LEFT_JUSTIFT;
-	tdm->tx.lrj = TDM_LEFT_JUSTIFT;
+	tdm->syncm = 0;
 
 	tdm->play_dma_data.addr = JH7110_TDM_FIFO;
 	tdm->play_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
@@ -580,10 +517,9 @@ static int jh7110_tdm_clk_reset_get(struct platform_device *pdev,
 	}
 
 	tdm->resets = devm_reset_control_array_get_exclusive(&pdev->dev);
-	if (IS_ERR_OR_NULL(tdm->resets)) {
-		ret = PTR_ERR(tdm->resets);
-		dev_err(&pdev->dev, "Failed to get tdm resets");
-		return ret;
+	if (IS_ERR(tdm->resets)) {
+		dev_err(&pdev->dev, "Failed to get tdm resets\n");
+		return PTR_ERR(tdm->resets);
 	}
 
 	return 0;
@@ -649,12 +585,12 @@ static int jh7110_tdm_dev_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id jh7110_tdm_of_match[] = {
+static const struct of_device_id jh7110_tdm_match[] = {
 	{ .compatible = "starfive,jh7110-tdm", },
 	{}
 };
 
-MODULE_DEVICE_TABLE(of, jh7110_tdm_of_match);
+MODULE_DEVICE_TABLE(of, jh7110_tdm_match);
 
 static const struct dev_pm_ops jh7110_tdm_pm_ops = {
 	RUNTIME_PM_OPS(jh7110_tdm_runtime_suspend,
@@ -666,7 +602,7 @@ static const struct dev_pm_ops jh7110_tdm_pm_ops = {
 static struct platform_driver jh7110_tdm_driver = {
 	.driver = {
 		.name = "jh7110-tdm",
-		.of_match_table = jh7110_tdm_of_match,
+		.of_match_table = jh7110_tdm_match,
 		.pm = pm_ptr(&jh7110_tdm_pm_ops),
 	},
 	.probe = jh7110_tdm_probe,
-- 
2.17.1

