Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D202DA7C4
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Dec 2020 06:42:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F30217CC;
	Tue, 15 Dec 2020 06:41:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F30217CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608010925;
	bh=q4lEsrEB4pY9ZdyCrU5r7LN+VKvMX/BKZg5Y+Z9OYCc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K9scaQlmuj6scMcSnYhNRvk3wqU17dmi1KqkKjfNxSGXyQlraotUTH1A8RnVZG/PW
	 zvuqaGiG3qn+DWwqR/JbgATggr18I6OXUNnYnDHjqCys4LJIJYBmMbena4MWAGe0OJ
	 OGpvXJai0fNeyJZ5+04ngfstjEb/5+1GGgRU6B7E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F94CF804C1;
	Tue, 15 Dec 2020 06:39:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EBFDF804BD; Tue, 15 Dec 2020 06:39:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17536F8014B
 for <alsa-devel@alsa-project.org>; Tue, 15 Dec 2020 06:39:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17536F8014B
IronPort-SDR: IR9KuHy/+IR/yDsNHCovEDIzmIt5JOjX4jvWRbC5YqTyP4+BKecChYe8oXA30axHbSGTOcNF1O
 CqpYl2El3rCw==
X-IronPort-AV: E=McAfee;i="6000,8403,9835"; a="174938485"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; d="scan'208";a="174938485"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 21:39:42 -0800
IronPort-SDR: seCvUlhz2nAtW4zaQq8ezVK+q/Vb/8ykl3jdAJ206ypLcfDFHbxF/+fP3IaSFI90cJIpEFI5Dn
 7I0OQN1MpiLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; d="scan'208";a="341384810"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by orsmga006.jf.intel.com with ESMTP; 14 Dec 2020 21:39:40 -0800
From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: Intel: KMB: Enable DMA transfer mode
Date: Tue, 15 Dec 2020 13:33:07 +0800
Message-Id: <20201215053307.24128-3-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201215053307.24128-1-michael.wei.hong.sit@intel.com>
References: <20201215053307.24128-1-michael.wei.hong.sit@intel.com>
Cc: cezary.rojewski@intel.com, lars@metafoo.de, tiwai@suse.com,
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

Enable DMA transfer mode for Intel Keem Bay ASoC platform driver.

The driver will search the device tree for DMA resources at boot
time to enable DMA transfer mode, and will proceed to use DMA
transfer if the resource is available, otherwise the default PIO
mode will be used.

Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/Kconfig                |   2 +
 sound/soc/intel/keembay/kmb_platform.c | 157 ++++++++++++++++++++++---
 sound/soc/intel/keembay/kmb_platform.h |   9 ++
 3 files changed, 153 insertions(+), 15 deletions(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index a5b446d5af19..6114dadfc52f 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -200,6 +200,8 @@ config SND_SOC_INTEL_KEEMBAY
 	tristate "Keembay Platforms"
 	depends on ARM64 || COMPILE_TEST
 	depends on COMMON_CLK
+	select SND_DMAENGINE_PCM
+	select SND_SOC_GENERIC_DMAENGINE_PCM
 	help
 	  If you have a Intel Keembay platform then enable this option
 	  by saying Y or m.
diff --git a/sound/soc/intel/keembay/kmb_platform.c b/sound/soc/intel/keembay/kmb_platform.c
index 291a686568c2..81aed464c8bb 100644
--- a/sound/soc/intel/keembay/kmb_platform.c
+++ b/sound/soc/intel/keembay/kmb_platform.c
@@ -6,10 +6,12 @@
 //
 
 #include <linux/clk.h>
+#include <linux/dma-mapping.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <sound/dmaengine_pcm.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -343,6 +345,53 @@ static const struct snd_soc_component_driver kmb_component = {
 	.pointer	= kmb_pcm_pointer,
 };
 
+static const struct snd_soc_component_driver kmb_component_dma = {
+	.name		= "kmb",
+};
+
+static int kmb_probe(struct snd_soc_dai *cpu_dai)
+{
+	struct kmb_i2s_info *kmb_i2s = snd_soc_dai_get_drvdata(cpu_dai);
+
+	if (kmb_i2s->use_pio)
+		return 0;
+
+	snd_soc_dai_init_dma_data(cpu_dai, &kmb_i2s->play_dma_data,
+				  &kmb_i2s->capture_dma_data);
+
+	return 0;
+}
+
+static inline void kmb_i2s_enable_dma(struct kmb_i2s_info *kmb_i2s, u32 stream)
+{
+	u32 dma_reg;
+
+	dma_reg = readl(kmb_i2s->i2s_base + I2S_DMACR);
+	/* Enable DMA handshake for stream */
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+		dma_reg |= I2S_DMAEN_TXBLOCK;
+	else
+		dma_reg |= I2S_DMAEN_RXBLOCK;
+
+	writel(dma_reg, kmb_i2s->i2s_base + I2S_DMACR);
+}
+
+static inline void kmb_i2s_disable_dma(struct kmb_i2s_info *kmb_i2s, u32 stream)
+{
+	u32 dma_reg;
+
+	dma_reg = readl(kmb_i2s->i2s_base + I2S_DMACR);
+	/* Disable DMA handshake for stream */
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		dma_reg &= ~I2S_DMAEN_TXBLOCK;
+		writel(1, kmb_i2s->i2s_base + I2S_RTXDMA);
+	} else {
+		dma_reg &= ~I2S_DMAEN_RXBLOCK;
+		writel(1, kmb_i2s->i2s_base + I2S_RRXDMA);
+	}
+	writel(dma_reg, kmb_i2s->i2s_base + I2S_DMACR);
+}
+
 static void kmb_i2s_start(struct kmb_i2s_info *kmb_i2s,
 			  struct snd_pcm_substream *substream)
 {
@@ -356,7 +405,11 @@ static void kmb_i2s_start(struct kmb_i2s_info *kmb_i2s,
 	else
 		writel(1, kmb_i2s->i2s_base + IRER);
 
-	kmb_i2s_irq_trigger(kmb_i2s, substream->stream, config->chan_nr, true);
+	if (kmb_i2s->use_pio)
+		kmb_i2s_irq_trigger(kmb_i2s, substream->stream,
+				    config->chan_nr, true);
+	else
+		kmb_i2s_enable_dma(kmb_i2s, substream->stream);
 
 	if (kmb_i2s->master)
 		writel(1, kmb_i2s->i2s_base + CER);
@@ -434,7 +487,8 @@ static int kmb_dai_trigger(struct snd_pcm_substream *substream,
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 		kmb_i2s->active--;
-		kmb_i2s_stop(kmb_i2s, substream);
+		if (kmb_i2s->use_pio)
+			kmb_i2s_stop(kmb_i2s, substream);
 		break;
 	default:
 		return  -EINVAL;
@@ -485,16 +539,22 @@ static int kmb_dai_hw_params(struct snd_pcm_substream *substream,
 		config->data_width = 16;
 		kmb_i2s->ccr = 0x00;
 		kmb_i2s->xfer_resolution = 0x02;
+		kmb_i2s->play_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
+		kmb_i2s->capture_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
 		break;
 	case SNDRV_PCM_FORMAT_S24_LE:
 		config->data_width = 32;
 		kmb_i2s->ccr = 0x14;
 		kmb_i2s->xfer_resolution = 0x05;
+		kmb_i2s->play_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+		kmb_i2s->capture_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 		break;
 	case SNDRV_PCM_FORMAT_S32_LE:
 		config->data_width = 32;
 		kmb_i2s->ccr = 0x10;
 		kmb_i2s->xfer_resolution = 0x05;
+		kmb_i2s->play_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+		kmb_i2s->capture_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 		break;
 	default:
 		dev_err(kmb_i2s->dev, "kmb: unsupported PCM fmt");
@@ -572,9 +632,56 @@ static int kmb_dai_prepare(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int kmb_dai_startup(struct snd_pcm_substream *substream,
+			   struct snd_soc_dai *cpu_dai)
+{
+	struct kmb_i2s_info *kmb_i2s = snd_soc_dai_get_drvdata(cpu_dai);
+	struct snd_dmaengine_dai_dma_data *dma_data;
+
+	if (kmb_i2s->use_pio)
+		return 0;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		dma_data = &kmb_i2s->play_dma_data;
+	else
+		dma_data = &kmb_i2s->capture_dma_data;
+
+	snd_soc_dai_set_dma_data(cpu_dai, substream, dma_data);
+
+	return 0;
+}
+
+static int kmb_dai_hw_free(struct snd_pcm_substream *substream,
+			   struct snd_soc_dai *cpu_dai)
+{
+	struct kmb_i2s_info *kmb_i2s = snd_soc_dai_get_drvdata(cpu_dai);
+	/* I2S Programming sequence in Keem_Bay_VPU_DB_v1.1 */
+	if (kmb_i2s->use_pio)
+		kmb_i2s_clear_irqs(kmb_i2s, substream->stream);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		writel(0, kmb_i2s->i2s_base + ITER);
+	else
+		writel(0, kmb_i2s->i2s_base + IRER);
+
+	if (kmb_i2s->use_pio)
+		kmb_i2s_irq_trigger(kmb_i2s, substream->stream, 8, false);
+	else
+		kmb_i2s_disable_dma(kmb_i2s, substream->stream);
+
+	if (!kmb_i2s->active) {
+		writel(0, kmb_i2s->i2s_base + CER);
+		writel(0, kmb_i2s->i2s_base + IER);
+	}
+
+	return 0;
+}
+
 static struct snd_soc_dai_ops kmb_dai_ops = {
+	.startup	= kmb_dai_startup,
 	.trigger	= kmb_dai_trigger,
 	.hw_params	= kmb_dai_hw_params,
+	.hw_free	= kmb_dai_hw_free,
 	.prepare	= kmb_dai_prepare,
 	.set_fmt	= kmb_set_dai_fmt,
 };
@@ -607,6 +714,7 @@ static struct snd_soc_dai_driver intel_kmb_i2s_dai[] = {
 				    SNDRV_PCM_FMTBIT_S16_LE),
 		},
 		.ops = &kmb_dai_ops,
+		.probe = kmb_probe,
 	},
 };
 
@@ -626,6 +734,7 @@ static struct snd_soc_dai_driver intel_kmb_tdm_dai[] = {
 				    SNDRV_PCM_FMTBIT_S16_LE),
 		},
 		.ops = &kmb_dai_ops,
+		.probe = kmb_probe,
 	},
 };
 
@@ -637,10 +746,12 @@ static const struct of_device_id kmb_plat_of_match[] = {
 
 static int kmb_plat_dai_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	struct snd_soc_dai_driver *kmb_i2s_dai;
 	const struct of_device_id *match;
 	struct device *dev = &pdev->dev;
 	struct kmb_i2s_info *kmb_i2s;
+	struct resource *res;
 	int ret, irq;
 	u32 comp1_reg;
 
@@ -682,7 +793,7 @@ static int kmb_plat_dai_probe(struct platform_device *pdev)
 		return PTR_ERR(kmb_i2s->clk_i2s);
 	}
 
-	kmb_i2s->i2s_base = devm_platform_ioremap_resource(pdev, 0);
+	kmb_i2s->i2s_base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(kmb_i2s->i2s_base))
 		return PTR_ERR(kmb_i2s->i2s_base);
 
@@ -692,22 +803,38 @@ static int kmb_plat_dai_probe(struct platform_device *pdev)
 
 	kmb_i2s->dev = &pdev->dev;
 
-	irq = platform_get_irq_optional(pdev, 0);
-	if (irq > 0) {
-		ret = devm_request_irq(dev, irq, kmb_i2s_irq_handler, 0,
-				       pdev->name, kmb_i2s);
-		if (ret < 0) {
-			dev_err(dev, "failed to request irq\n");
-			return ret;
-		}
-	}
-
 	comp1_reg = readl(kmb_i2s->i2s_base + I2S_COMP_PARAM_1);
 
 	kmb_i2s->fifo_th = (1 << COMP1_FIFO_DEPTH(comp1_reg)) / 2;
 
-	ret = devm_snd_soc_register_component(dev, &kmb_component,
-					      kmb_i2s_dai, 1);
+	kmb_i2s->use_pio = !(of_property_read_bool(np, "dmas"));
+
+	if (kmb_i2s->use_pio) {
+		irq = platform_get_irq_optional(pdev, 0);
+		if (irq > 0) {
+			ret = devm_request_irq(dev, irq, kmb_i2s_irq_handler, 0,
+					       pdev->name, kmb_i2s);
+			if (ret < 0) {
+				dev_err(dev, "failed to request irq\n");
+				return ret;
+			}
+		}
+		ret = devm_snd_soc_register_component(dev, &kmb_component,
+						      kmb_i2s_dai, 1);
+	} else {
+		kmb_i2s->play_dma_data.addr = res->start + I2S_TXDMA;
+		kmb_i2s->capture_dma_data.addr = res->start + I2S_RXDMA;
+		ret = snd_dmaengine_pcm_register(&pdev->dev,
+						 NULL, 0);
+		if (ret) {
+			dev_err(&pdev->dev, "could not register dmaengine: %d\n",
+				ret);
+			return ret;
+		}
+		ret = devm_snd_soc_register_component(dev, &kmb_component_dma,
+						      kmb_i2s_dai, 1);
+	}
+
 	if (ret) {
 		dev_err(dev, "not able to register dai\n");
 		return ret;
diff --git a/sound/soc/intel/keembay/kmb_platform.h b/sound/soc/intel/keembay/kmb_platform.h
index 9756b132c12f..fd5341b66279 100644
--- a/sound/soc/intel/keembay/kmb_platform.h
+++ b/sound/soc/intel/keembay/kmb_platform.h
@@ -12,6 +12,7 @@
 #include <linux/bits.h>
 #include <linux/bitfield.h>
 #include <linux/types.h>
+#include <sound/dmaengine_pcm.h>
 
 /* Register values with reference to KMB databook v1.1 */
 /* common register for all channel */
@@ -103,7 +104,12 @@
 #define DW_I2S_MASTER	BIT(3)
 
 #define I2S_RXDMA	0x01C0
+#define I2S_RRXDMA	0x01C4
 #define I2S_TXDMA	0x01C8
+#define I2S_RTXDMA	0x01CC
+#define I2S_DMACR	0x0200
+#define I2S_DMAEN_RXBLOCK	(1 << 16)
+#define I2S_DMAEN_TXBLOCK	(1 << 17)
 
 /*
  * struct i2s_clk_config_data - represent i2s clk configuration data
@@ -131,6 +137,9 @@ struct kmb_i2s_info {
 	u32 xfer_resolution;
 	u32 fifo_th;
 	bool master;
+	/* data related to DMA transfers b/w i2s and DMAC */
+	struct snd_dmaengine_dai_dma_data play_dma_data;
+	struct snd_dmaengine_dai_dma_data capture_dma_data;
 
 	struct i2s_clk_config_data config;
 	int (*i2s_clk_cfg)(struct i2s_clk_config_data *config);
-- 
2.17.1

