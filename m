Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AF3232BA2
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 08:01:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E617176F;
	Thu, 30 Jul 2020 08:01:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E617176F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596088915;
	bh=8r4rQ/Q9Di3/xpDDWmx1ZdUyfm3pJw4LbF6ydWo4Njo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QWzU6DZCsRzhX3oSi0qNmT25ThhjwjmkvUHnGYSbnX7apL6aS0mjk+/zNprjSAjjV
	 YwPxq6q2Jr965PDnKrPhlXUi6xPHiqQQh4q7HVrrErqjqF/H6gspBnd1WG1gUEzyJw
	 Uw5G7pDPOd0qKQZ/PreqjnKWwMC1uQlvUq4Sgz0o=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9793F802E0;
	Thu, 30 Jul 2020 07:58:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7B74F802E0; Thu, 30 Jul 2020 07:58:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA01EF8028D
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 07:58:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA01EF8028D
IronPort-SDR: uLRdnYKyNAdEaMEQ8pZg/hCbkaxVRCeLYZXC1DWfnc/SMM+v470UvETkjwxykhf+c88iXBxtuI
 ckj5EWPx9yNQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9697"; a="139545724"
X-IronPort-AV: E=Sophos;i="5.75,413,1589266800"; d="scan'208";a="139545724"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2020 22:58:35 -0700
IronPort-SDR: SsoB15rfhx0c07cB3g3KOy7KMTxjosu5OJDKovO8BO4NqCA77tgcka3vp5oZuTHH5bMlGMXmJs
 hH2Rb/dvMh2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,413,1589266800"; d="scan'208";a="434923890"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by orsmga004.jf.intel.com with ESMTP; 29 Jul 2020 22:58:33 -0700
From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/4] ASoC: Intel: KMB: Enable TDM audio capture
Date: Thu, 30 Jul 2020 13:53:18 +0800
Message-Id: <20200730055319.1522-4-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200730055319.1522-1-michael.wei.hong.sit@intel.com>
References: <20200730055319.1522-1-michael.wei.hong.sit@intel.com>
Cc: cezary.rojewski@intel.com, andriy.shevchenko@intel.com, tiwai@suse.com,
 jee.heng.sia@intel.com, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, broonie@kernel.org
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

Enable I2S TDM audio capture for Intel Keem Bay platform.
The I2S TDM will support 4 channel and 8 channel audio capture only.
4 channel and 8 channel audio capture operates only in slave mode.

Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Reviewed-by: Sia Jee Heng <jee.heng.sia@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/keembay/kmb_platform.c | 105 +++++++++++++++++++------
 1 file changed, 80 insertions(+), 25 deletions(-)

diff --git a/sound/soc/intel/keembay/kmb_platform.c b/sound/soc/intel/keembay/kmb_platform.c
index eaa4fd391171..8cb097ecf4bc 100644
--- a/sound/soc/intel/keembay/kmb_platform.c
+++ b/sound/soc/intel/keembay/kmb_platform.c
@@ -17,7 +17,7 @@
 #define PERIODS_MAX		48
 #define PERIOD_BYTES_MIN	4096
 #define BUFFER_BYTES_MAX	(PERIODS_MAX * PERIOD_BYTES_MIN)
-#define TDM_OPERATION		1
+#define TDM_OPERATION		5
 #define I2S_OPERATION		0
 #define DATA_WIDTH_CONFIG_BIT	6
 #define TDM_CHANNEL_CONFIG_BIT	3
@@ -37,7 +37,7 @@ static const struct snd_pcm_hardware kmb_pcm_hardware = {
 		   SNDRV_PCM_FMTBIT_S24_LE |
 		   SNDRV_PCM_FMTBIT_S32_LE,
 	.channels_min = 2,
-	.channels_max = 2,
+	/* channels_max removed to allow configurable max channels */
 	.buffer_bytes_max = BUFFER_BYTES_MAX,
 	.period_bytes_min = PERIOD_BYTES_MIN,
 	.period_bytes_max = BUFFER_BYTES_MAX / PERIODS_MIN,
@@ -82,19 +82,25 @@ static unsigned int kmb_pcm_rx_fn(struct kmb_i2s_info *kmb_i2s,
 {
 	unsigned int period_pos = rx_ptr % runtime->period_size;
 	void __iomem *i2s_base = kmb_i2s->i2s_base;
+	int chan = kmb_i2s->config.chan_nr;
 	void *buf = runtime->dma_area;
-	int i;
+	int i, j;
 
 	/* KMB i2s uses two separate L/R FIFO */
 	for (i = 0; i < kmb_i2s->fifo_th; i++) {
-		if (kmb_i2s->config.data_width == 16) {
-			((u16(*)[2])buf)[rx_ptr][0] = readl(i2s_base + LRBR_LTHR(0));
-			((u16(*)[2])buf)[rx_ptr][1] = readl(i2s_base + RRBR_RTHR(0));
-		} else {
-			((u32(*)[2])buf)[rx_ptr][0] = readl(i2s_base + LRBR_LTHR(0));
-			((u32(*)[2])buf)[rx_ptr][1] = readl(i2s_base + RRBR_RTHR(0));
+		for (j = 0; j < chan / 2; j++) {
+			if (kmb_i2s->config.data_width == 16) {
+				((u16 *)buf)[rx_ptr * chan + (j * 2)] =
+						readl(i2s_base + LRBR_LTHR(j));
+				((u16 *)buf)[rx_ptr * chan + ((j * 2) + 1)] =
+						readl(i2s_base + RRBR_RTHR(j));
+			} else {
+				((u32 *)buf)[rx_ptr * chan + (j * 2)] =
+						readl(i2s_base + LRBR_LTHR(j));
+				((u32 *)buf)[rx_ptr * chan + ((j * 2) + 1)] =
+						readl(i2s_base + RRBR_RTHR(j));
+			}
 		}
-
 		period_pos++;
 
 		if (++rx_ptr >= runtime->buffer_size)
@@ -238,6 +244,7 @@ static irqreturn_t kmb_i2s_irq_handler(int irq, void *dev_id)
 	struct kmb_i2s_info *kmb_i2s = dev_id;
 	struct i2s_clk_config_data *config = &kmb_i2s->config;
 	irqreturn_t ret = IRQ_NONE;
+	u32 tx_enabled = 0;
 	u32 isr[4];
 	int i;
 
@@ -246,22 +253,45 @@ static irqreturn_t kmb_i2s_irq_handler(int irq, void *dev_id)
 
 	kmb_i2s_clear_irqs(kmb_i2s, SNDRV_PCM_STREAM_PLAYBACK);
 	kmb_i2s_clear_irqs(kmb_i2s, SNDRV_PCM_STREAM_CAPTURE);
+	/* Only check TX interrupt if TX is active */
+	tx_enabled = readl(kmb_i2s->i2s_base + ITER);
+
+	/*
+	 * Data available. Retrieve samples from FIFO
+	 */
+
+	/*
+	 * 8 channel audio will have isr[0..2] triggered,
+	 * reading the specific isr based on the audio configuration,
+	 * to avoid reading the buffers too early.
+	 */
+	switch (config->chan_nr) {
+	case 2:
+		if (isr[0] & ISR_RXDA)
+			kmb_pcm_operation(kmb_i2s, false);
+		ret = IRQ_HANDLED;
+		break;
+	case 4:
+		if (isr[1] & ISR_RXDA)
+			kmb_pcm_operation(kmb_i2s, false);
+		ret = IRQ_HANDLED;
+		break;
+	case 8:
+		if (isr[3] & ISR_RXDA)
+			kmb_pcm_operation(kmb_i2s, false);
+		ret = IRQ_HANDLED;
+		break;
+	}
 
 	for (i = 0; i < config->chan_nr / 2; i++) {
 		/*
 		 * Check if TX fifo is empty. If empty fill FIFO with samples
 		 */
-		if ((isr[i] & ISR_TXFE)) {
+		if ((isr[i] & ISR_TXFE) && tx_enabled) {
 			kmb_pcm_operation(kmb_i2s, true);
 			ret = IRQ_HANDLED;
 		}
-		/*
-		 * Data available. Retrieve samples from FIFO
-		 */
-		if ((isr[i] & ISR_RXDA)) {
-			kmb_pcm_operation(kmb_i2s, false);
-			ret = IRQ_HANDLED;
-		}
+
 		/* Error Handling: TX */
 		if (isr[i] & ISR_TXFO) {
 			dev_dbg(kmb_i2s->dev, "TX overrun (ch_id=%d)\n", i);
@@ -445,7 +475,7 @@ static int kmb_dai_hw_params(struct snd_pcm_substream *substream,
 {
 	struct kmb_i2s_info *kmb_i2s = snd_soc_dai_get_drvdata(cpu_dai);
 	struct i2s_clk_config_data *config = &kmb_i2s->config;
-	u32 register_val, write_val;
+	u32 write_val;
 	int ret;
 
 	switch (params_format(hw_params)) {
@@ -472,16 +502,34 @@ static int kmb_dai_hw_params(struct snd_pcm_substream *substream,
 	config->chan_nr = params_channels(hw_params);
 
 	switch (config->chan_nr) {
-	/* TODO: This switch case will handle up to TDM8 in the near future */
-	case TWO_CHANNEL_SUPPORT:
+	case 8:
+	case 4:
+		/*
+		 * Platform is not capable of providing clocks for
+		 * multi channel audio
+		 */
+		if (kmb_i2s->master)
+			return -EINVAL;
+
 		write_val = ((config->chan_nr / 2) << TDM_CHANNEL_CONFIG_BIT) |
 				(config->data_width << DATA_WIDTH_CONFIG_BIT) |
-				MASTER_MODE | I2S_OPERATION;
+				!MASTER_MODE | TDM_OPERATION;
 
 		writel(write_val, kmb_i2s->pss_base + I2S_GEN_CFG_0);
+		break;
+	case 2:
+		/*
+		 * Platform is only capable of providing clocks need for
+		 * 2 channel master mode
+		 */
+		if (!(kmb_i2s->master))
+			return -EINVAL;
+
+		write_val = ((config->chan_nr / 2) << TDM_CHANNEL_CONFIG_BIT) |
+				(config->data_width << DATA_WIDTH_CONFIG_BIT) |
+				MASTER_MODE | I2S_OPERATION;
 
-		register_val = readl(kmb_i2s->pss_base + I2S_GEN_CFG_0);
-		dev_dbg(kmb_i2s->dev, "pss register = 0x%X", register_val);
+		writel(write_val, kmb_i2s->pss_base + I2S_GEN_CFG_0);
 		break;
 	default:
 		dev_dbg(kmb_i2s->dev, "channel not supported\n");
@@ -531,7 +579,7 @@ static struct snd_soc_dai_ops kmb_dai_ops = {
 
 static struct snd_soc_dai_driver intel_kmb_platform_dai[] = {
 	{
-		.name = "kmb-plat-dai",
+	/* .name is provided by Device Tree */
 		.playback = {
 			.channels_min = 2,
 			.channels_max = 2,
@@ -571,6 +619,7 @@ static int kmb_plat_dai_probe(struct platform_device *pdev)
 	struct kmb_i2s_info *kmb_i2s;
 	int ret, irq;
 	u32 comp1_reg;
+	u32 channel_max;
 
 	kmb_i2s = devm_kzalloc(dev, sizeof(*kmb_i2s), GFP_KERNEL);
 	if (!kmb_i2s)
@@ -629,6 +678,12 @@ static int kmb_plat_dai_probe(struct platform_device *pdev)
 
 	kmb_i2s->fifo_th = (1 << COMP1_FIFO_DEPTH(comp1_reg)) / 2;
 
+	ret = of_property_read_u32(dev->of_node, "channel-max", &channel_max);
+	if (ret < 0)
+		dev_err(dev, "Couldn't find channel-max\n");
+	else if (intel_kmb_platform_dai->capture.channels_max < channel_max)
+		intel_kmb_platform_dai->capture.channels_max = channel_max;
+
 	ret = devm_snd_soc_register_component(dev, &kmb_component,
 					      intel_kmb_platform_dai,
 				ARRAY_SIZE(intel_kmb_platform_dai));
-- 
2.17.1

