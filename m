Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 245DC30E9DC
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 03:03:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4F0116F9;
	Thu,  4 Feb 2021 03:03:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4F0116F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612404231;
	bh=R6Etz/M6hA+E4C4sX4d5IfEkyHwgQr+Dd2dkEC4bZ+I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nOVnneIVYZgPpAGPu1eRd5sXVVzWNhIsgm1LC5jYcZ1Xj0cl3zaOWUBykBj6VgmYr
	 JWdSCjp3TJJo0mZivUo1hWUyVH6dWCw5IkY4OTxmEPlryd9dCpH+N3MYed38GX+esH
	 j4YH6sx0B37XW6dP5McSk25Tts3t2j9+KlcW6Tf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9B47F802E2;
	Thu,  4 Feb 2021 03:00:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57320F802A0; Thu,  4 Feb 2021 03:00:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6716FF8016E
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 03:00:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6716FF8016E
IronPort-SDR: +qVAQg3+1mcxOaR1UFMspYVTNImXCf9n8T6Qnx6JTMnsqaJPYPyXY4wzZjdW2wePsRg11vpki7
 tVgZM9FveagQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="245227999"
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; d="scan'208";a="245227999"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 18:00:44 -0800
IronPort-SDR: 8aOIZYDKJgnwagqXIRdXuPNbCpJzMQottBxcrLhVkH7YCBKx7Llzrt4PU5qu79EQAunUo8eRhX
 7TaGsdKhxb1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; d="scan'208";a="433712075"
Received: from jsia-hp-z620-workstation.png.intel.com ([10.221.118.135])
 by orsmga001.jf.intel.com with ESMTP; 03 Feb 2021 18:00:43 -0800
From: Sia Jee Heng <jee.heng.sia@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH RFC 4/4] ASoC: Intel: KMB: Support IEC958 encoded PCM format
Date: Thu,  4 Feb 2021 09:42:58 +0800
Message-Id: <20210204014258.10197-5-jee.heng.sia@intel.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210204014258.10197-1-jee.heng.sia@intel.com>
References: <20210204014258.10197-1-jee.heng.sia@intel.com>
Cc: broonie@kernel.org, tiwai@suse.com, jee.heng.sia@intel.com,
 pierre-louis.bossart@linux.intel.com
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

Support ALSA IEC958 plugin for KeemBay I2S driver.
Bit manipulation needed as IEC958 format supported by ADV7511 HDMI chip
is not compatible with the ALSA IEC958 plugin format.

Signed-off-by: Sia Jee Heng <jee.heng.sia@intel.com>
---
 sound/soc/intel/keembay/kmb_platform.c | 73 +++++++++++++++++++++++++-
 sound/soc/intel/keembay/kmb_platform.h |  1 +
 2 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/keembay/kmb_platform.c b/sound/soc/intel/keembay/kmb_platform.c
index 4961ba89c110..0fd1e8f62c89 100644
--- a/sound/soc/intel/keembay/kmb_platform.c
+++ b/sound/soc/intel/keembay/kmb_platform.c
@@ -5,6 +5,7 @@
 // Intel KeemBay Platform driver.
 //
 
+#include <linux/bitrev.h>
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
@@ -39,7 +40,8 @@ static const struct snd_pcm_hardware kmb_pcm_hardware = {
 	.rate_max = 48000,
 	.formats = SNDRV_PCM_FMTBIT_S16_LE |
 		   SNDRV_PCM_FMTBIT_S24_LE |
-		   SNDRV_PCM_FMTBIT_S32_LE,
+		   SNDRV_PCM_FMTBIT_S32_LE |
+		   SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE,
 	.channels_min = 2,
 	.channels_max = 2,
 	.buffer_bytes_max = BUFFER_BYTES_MAX,
@@ -50,6 +52,50 @@ static const struct snd_pcm_hardware kmb_pcm_hardware = {
 	.fifo_size = 16,
 };
 
+/*
+ * Convert to ADV7511 HDMI hardware format.
+ * ADV7511 HDMI chip need parity bit replaced by block start bit and
+ * with the preamble bits left out.
+ * ALSA IEC958 subframe format:
+ * bit 0-3  = preamble (0x8 = block start)
+ *     4-7  = AUX (=0)
+ *     8-27 = audio data (without AUX if 24bit sample)
+ *     28   = validity
+ *     29   = user data
+ *     30   = channel status
+ *     31   = parity
+ *
+ * ADV7511 IEC958 subframe format:
+ * bit 0-23  = audio data
+ *     24    = validity
+ *     25    = user data
+ *     26    = channel status
+ *     27    = block start
+ *     28-31 = 0
+ * MSB to LSB bit reverse by software as hardware not supporting it.
+ */
+static void hdmi_reformat_iec958(struct snd_pcm_runtime *runtime,
+				 struct kmb_i2s_info *kmb_i2s,
+				 unsigned int tx_ptr)
+{
+	u32(*buf)[2] = (void *)runtime->dma_area;
+	unsigned long temp;
+	u32 i, j, sample;
+
+	for (i = 0; i < kmb_i2s->fifo_th; i++) {
+		j = 0;
+		do {
+			temp = buf[tx_ptr][j];
+			/* Replace parity with block start*/
+			assign_bit(31, &temp, (BIT(3) & temp));
+			sample = bitrev32(temp);
+			buf[tx_ptr][j] = sample << 4;
+			j++;
+		} while (j < 2);
+		tx_ptr++;
+	}
+}
+
 static unsigned int kmb_pcm_tx_fn(struct kmb_i2s_info *kmb_i2s,
 				  struct snd_pcm_runtime *runtime,
 				  unsigned int tx_ptr, bool *period_elapsed)
@@ -65,6 +111,8 @@ static unsigned int kmb_pcm_tx_fn(struct kmb_i2s_info *kmb_i2s,
 			writel(((u16(*)[2])buf)[tx_ptr][0], i2s_base + LRBR_LTHR(0));
 			writel(((u16(*)[2])buf)[tx_ptr][1], i2s_base + RRBR_RTHR(0));
 		} else {
+			if (kmb_i2s->iec958_fmt)
+				hdmi_reformat_iec958(runtime, kmb_i2s, tx_ptr);
 			writel(((u32(*)[2])buf)[tx_ptr][0], i2s_base + LRBR_LTHR(0));
 			writel(((u32(*)[2])buf)[tx_ptr][1], i2s_base + RRBR_RTHR(0));
 		}
@@ -235,6 +283,7 @@ static int kmb_pcm_trigger(struct snd_soc_component *component,
 			kmb_i2s->tx_substream = NULL;
 		else
 			kmb_i2s->rx_substream = NULL;
+		kmb_i2s->iec958_fmt = false;
 		break;
 	default:
 		return -EINVAL;
@@ -549,6 +598,9 @@ static int kmb_dai_hw_params(struct snd_pcm_substream *substream,
 		kmb_i2s->play_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 		kmb_i2s->capture_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 		break;
+	case SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE:
+		kmb_i2s->iec958_fmt = true;
+		fallthrough;
 	case SNDRV_PCM_FORMAT_S32_LE:
 		config->data_width = 32;
 		kmb_i2s->ccr = 0x10;
@@ -686,6 +738,24 @@ static struct snd_soc_dai_ops kmb_dai_ops = {
 	.set_fmt	= kmb_set_dai_fmt,
 };
 
+static struct snd_soc_dai_driver intel_kmb_hdmi_dai[] = {
+	{
+		.name = "intel_kmb_hdmi_i2s",
+		.playback = {
+			.channels_min = 2,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min = 48000,
+			.rate_max = 48000,
+			.formats = (SNDRV_PCM_FMTBIT_S16_LE |
+				    SNDRV_PCM_FMTBIT_S24_LE |
+				    SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE),
+		},
+		.ops = &kmb_dai_ops,
+		.probe = kmb_probe,
+	},
+};
+
 static struct snd_soc_dai_driver intel_kmb_i2s_dai[] = {
 	{
 		.name = "intel_kmb_i2s",
@@ -740,6 +810,7 @@ static struct snd_soc_dai_driver intel_kmb_tdm_dai[] = {
 
 static const struct of_device_id kmb_plat_of_match[] = {
 	{ .compatible = "intel,keembay-i2s", .data = &intel_kmb_i2s_dai},
+	{ .compatible = "intel,keembay-hdmi-i2s", .data = &intel_kmb_hdmi_dai},
 	{ .compatible = "intel,keembay-tdm", .data = &intel_kmb_tdm_dai},
 	{}
 };
diff --git a/sound/soc/intel/keembay/kmb_platform.h b/sound/soc/intel/keembay/kmb_platform.h
index 67234caee814..29be2cd84ddb 100644
--- a/sound/soc/intel/keembay/kmb_platform.h
+++ b/sound/soc/intel/keembay/kmb_platform.h
@@ -150,6 +150,7 @@ struct kmb_i2s_info {
 	struct snd_pcm_substream *rx_substream;
 	unsigned int tx_ptr;
 	unsigned int rx_ptr;
+	bool iec958_fmt;
 };
 
 #endif /* KMB_PLATFORM_H_ */
-- 
2.18.0

