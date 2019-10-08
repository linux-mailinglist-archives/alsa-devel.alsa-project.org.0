Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B2ED009E
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 20:18:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC979166C;
	Tue,  8 Oct 2019 20:17:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC979166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570558696;
	bh=3FFPvlv05S1wCPc6B0lH/i0IiszGw39ec9p0T0UmG7Q=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y8sC1DKnc4euCKRKf6uUfTOiVzj0h6hqcn6il0/zfoDH9Nu6s7P5BVpoMmciZTSWZ
	 PWtrEx626UGASgfyfJV9Opfu3wV0lyeUKLV23HI7oC2TJIDz0ltP7ADzLTL/i62Oz3
	 p4hlGFpqLgZemIquOCJDcE90rh1JWjyBL30AchqU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF755F8045E;
	Tue,  8 Oct 2019 20:15:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0253EF8038F; Tue,  8 Oct 2019 20:15:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED4E1F80322
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 20:15:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED4E1F80322
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BXq/Q6X8"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x98IFaH0079045;
 Tue, 8 Oct 2019 13:15:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1570558536;
 bh=1H6W8+jWkp7moxoMXT1Egtu0rru/AoyJR+2vilAofyQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=BXq/Q6X8XUn/4vmKnirS4tzoaqOdeuHY4r1wbRmpEhcLbS0Ia19FHhkBsiSZUIR/L
 w0y4gPn4hd5OngGNz6I3v4c/F4jsWAK0glpjKpXv4h8EeBRgey5r1dUaboZ7i9mz6T
 MeL3g3PDzHXmXF54MARGxBi1ItEMK84HPlk4fSLA=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x98IFaMV077080
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Oct 2019 13:15:36 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 8 Oct
 2019 13:15:35 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 8 Oct 2019 13:15:35 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x98IFZ8U074385;
 Tue, 8 Oct 2019 13:15:35 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <broonie@kernel.org>
Date: Tue, 8 Oct 2019 13:15:17 -0500
Message-ID: <20191008181517.5332-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20191008181517.5332-1-dmurphy@ti.com>
References: <20191008181517.5332-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, navada@ti.com,
 Dan Murphy <dmurphy@ti.com>
Subject: [alsa-devel] [PATCH 2/2] ASoC: tas2562: Introduce the TAS2562
	amplifier
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Introduce the Texas Instruments TAS2562 amplifier driver
with I/V sense for loud speaker applications.

http://www.ti.com/lit/gpn/tas2562

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 sound/soc/codecs/Kconfig   |   5 +
 sound/soc/codecs/Makefile  |   2 +
 sound/soc/codecs/tas2562.c | 590 +++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/tas2562.h |  85 ++++++
 4 files changed, 682 insertions(+)
 create mode 100644 sound/soc/codecs/tas2562.c
 create mode 100644 sound/soc/codecs/tas2562.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 229cc89f8c5a..51b1a7bdf8e8 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -179,6 +179,7 @@ config SND_SOC_ALL_CODECS
 	select SND_SOC_STAC9766 if SND_SOC_AC97_BUS
 	select SND_SOC_STI_SAS
 	select SND_SOC_TAS2552 if I2C
+	select SND_SOC_TAS2562 if I2C
 	select SND_SOC_TAS5086 if I2C
 	select SND_SOC_TAS571X if I2C
 	select SND_SOC_TAS5720 if I2C
@@ -1104,6 +1105,10 @@ config SND_SOC_TAS2552
 	tristate "Texas Instruments TAS2552 Mono Audio amplifier"
 	depends on I2C
 
+config SND_SOC_TAS2562
+	tristate "Texas Instruments TAS2562 Mono Audio amplifier"
+	depends on I2C
+
 config SND_SOC_TAS5086
 	tristate "Texas Instruments TAS5086 speaker amplifier"
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index c498373dcc5f..96ba39c119af 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -280,6 +280,7 @@ snd-soc-max98504-objs := max98504.o
 snd-soc-simple-amplifier-objs := simple-amplifier.o
 snd-soc-tpa6130a2-objs := tpa6130a2.o
 snd-soc-tas2552-objs := tas2552.o
+snd-soc-tas2562-objs := tas2562.o
 
 obj-$(CONFIG_SND_SOC_88PM860X)	+= snd-soc-88pm860x.o
 obj-$(CONFIG_SND_SOC_AB8500_CODEC)	+= snd-soc-ab8500-codec.o
@@ -474,6 +475,7 @@ obj-$(CONFIG_SND_SOC_STA529)   += snd-soc-sta529.o
 obj-$(CONFIG_SND_SOC_STAC9766)	+= snd-soc-stac9766.o
 obj-$(CONFIG_SND_SOC_STI_SAS)	+= snd-soc-sti-sas.o
 obj-$(CONFIG_SND_SOC_TAS2552)	+= snd-soc-tas2552.o
+obj-$(CONFIG_SND_SOC_TAS2562)	+= snd-soc-tas2562.o
 obj-$(CONFIG_SND_SOC_TAS5086)	+= snd-soc-tas5086.o
 obj-$(CONFIG_SND_SOC_TAS571X)	+= snd-soc-tas571x.o
 obj-$(CONFIG_SND_SOC_TAS5720)	+= snd-soc-tas5720.o
diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
new file mode 100644
index 000000000000..729acd874c48
--- /dev/null
+++ b/sound/soc/codecs/tas2562.c
@@ -0,0 +1,590 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Driver for the Texas Instruments TAS2562 CODEC
+// Copyright (C) 2019 Texas Instruments Inc.
+
+
+#include <linux/module.h>
+#include <linux/errno.h>
+#include <linux/device.h>
+#include <linux/i2c.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/gpio/consumer.h>
+#include <linux/regulator/consumer.h>
+#include <linux/delay.h>
+
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <sound/tlv.h>
+
+#include "tas2562.h"
+
+#define TAS2562_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |\
+			 SNDRV_PCM_FORMAT_S32_LE)
+
+struct tas2562_data {
+	struct snd_soc_component *component;
+	struct gpio_desc *sdz_gpio;
+	struct regmap *regmap;
+	struct device *dev;
+	struct i2c_client *client;
+	int v_sense_slot;
+	int i_sense_slot;
+};
+
+static int tas2562_set_bias_level(struct snd_soc_component *component,
+				 enum snd_soc_bias_level level)
+{
+	struct tas2562_data *tas2562 =
+			snd_soc_component_get_drvdata(component);
+
+	switch (level) {
+	case SND_SOC_BIAS_ON:
+		snd_soc_component_update_bits(component,
+			TAS2562_PWR_CTRL,
+			TAS2562_MODE_MASK, TAS2562_ACTIVE);
+		break;
+	case SND_SOC_BIAS_STANDBY:
+	case SND_SOC_BIAS_PREPARE:
+		snd_soc_component_update_bits(component,
+			TAS2562_PWR_CTRL,
+			TAS2562_MODE_MASK, TAS2562_MUTE);
+		break;
+	case SND_SOC_BIAS_OFF:
+		snd_soc_component_update_bits(component,
+			TAS2562_PWR_CTRL,
+			TAS2562_MODE_MASK, TAS2562_SHUTDOWN);
+		break;
+
+	default:
+		dev_err(tas2562->dev,
+				"wrong power level setting %d\n", level);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int tas2562_set_samplerate(struct tas2562_data *tas2562, int samplerate)
+{
+	int samp_rate;
+	int ramp_rate;
+
+	switch (samplerate) {
+	case 7350:
+		ramp_rate = TAS2562_TDM_CFG0_RAMPRATE_44_1;
+		samp_rate = TAS2562_TDM_CFG0_SAMPRATE_7305_8KHZ;
+		break;
+	case 8000:
+		ramp_rate = 0;
+		samp_rate = TAS2562_TDM_CFG0_SAMPRATE_7305_8KHZ;
+		break;
+	case 14700:
+		ramp_rate = TAS2562_TDM_CFG0_RAMPRATE_44_1;
+		samp_rate = TAS2562_TDM_CFG0_SAMPRATE_14_7_16KHZ;
+		break;
+	case 16000:
+		ramp_rate = 0;
+		samp_rate = TAS2562_TDM_CFG0_SAMPRATE_14_7_16KHZ;
+		break;
+	case 22050:
+		ramp_rate = TAS2562_TDM_CFG0_RAMPRATE_44_1;
+		samp_rate = TAS2562_TDM_CFG0_SAMPRATE_22_05_24KHZ;
+		break;
+	case 24000:
+		ramp_rate = 0;
+		samp_rate = TAS2562_TDM_CFG0_SAMPRATE_22_05_24KHZ;
+		break;
+	case 29400:
+		ramp_rate = TAS2562_TDM_CFG0_RAMPRATE_44_1;
+		samp_rate = TAS2562_TDM_CFG0_SAMPRATE_29_4_32KHZ;
+		break;
+	case 32000:
+		ramp_rate = 0;
+		samp_rate = TAS2562_TDM_CFG0_SAMPRATE_29_4_32KHZ;
+		break;
+	case 44100:
+		ramp_rate = TAS2562_TDM_CFG0_RAMPRATE_44_1;
+		samp_rate = TAS2562_TDM_CFG0_SAMPRATE_44_1_48KHZ;
+		break;
+	case 48000:
+		ramp_rate = 0;
+		samp_rate = TAS2562_TDM_CFG0_SAMPRATE_44_1_48KHZ;
+		break;
+	case 88200:
+		ramp_rate = TAS2562_TDM_CFG0_RAMPRATE_44_1;
+		samp_rate = TAS2562_TDM_CFG0_SAMPRATE_88_2_96KHZ;
+		break;
+	case 96000:
+		ramp_rate = 0;
+		samp_rate = TAS2562_TDM_CFG0_SAMPRATE_88_2_96KHZ;
+		break;
+	case 176400:
+		ramp_rate = TAS2562_TDM_CFG0_RAMPRATE_44_1;
+		samp_rate = TAS2562_TDM_CFG0_SAMPRATE_176_4_192KHZ;
+		break;
+	case 192000:
+		ramp_rate = 0;
+		samp_rate = TAS2562_TDM_CFG0_SAMPRATE_176_4_192KHZ;
+		break;
+	default:
+		dev_info(tas2562->dev, "%s, unsupported sample rate, %d\n",
+			__func__, samplerate);
+		return -EINVAL;
+	}
+
+	snd_soc_component_update_bits(tas2562->component, TAS2562_TDM_CFG0,
+		TAS2562_TDM_CFG0_RAMPRATE_MASK,	ramp_rate);
+	snd_soc_component_update_bits(tas2562->component, TAS2562_TDM_CFG0,
+		TAS2562_TDM_CFG0_SAMPRATE_MASK,	samp_rate);
+
+	return 0;
+}
+
+static int tas2562_set_dai_tdm_slot(struct snd_soc_dai *dai,
+		unsigned int tx_mask, unsigned int rx_mask,
+		int slots, int slot_width)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tas2562_data *tas2562 = snd_soc_component_get_drvdata(component);
+	int ret = 0;
+
+	switch (slot_width) {
+	case 16:
+		ret = snd_soc_component_update_bits(component,
+						    TAS2562_TDM_CFG2,
+						    TAS2562_TDM_CFG2_RXLEN_MASK,
+						    TAS2562_TDM_CFG2_RXLEN_16B);
+		break;
+	case 24:
+		ret = snd_soc_component_update_bits(component,
+						    TAS2562_TDM_CFG2,
+						    TAS2562_TDM_CFG2_RXLEN_MASK,
+						    TAS2562_TDM_CFG2_RXLEN_24B);
+		break;
+	case 32:
+		ret = snd_soc_component_update_bits(component,
+						    TAS2562_TDM_CFG2,
+						    TAS2562_TDM_CFG2_RXLEN_MASK,
+						    TAS2562_TDM_CFG2_RXLEN_32B);
+		break;
+
+	case 0:
+		/* Do not change slot width */
+		break;
+	default:
+		dev_err(tas2562->dev, "slot width not supported");
+		ret = -EINVAL;
+	}
+
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int tas2562_set_bitwidth(struct tas2562_data *tas2562, int bitwidth)
+{
+	int ret;
+
+	switch (bitwidth) {
+	case SNDRV_PCM_FORMAT_S16_LE:
+		snd_soc_component_update_bits(tas2562->component,
+					      TAS2562_TDM_CFG2,
+					      TAS2562_TDM_CFG2_RXWLEN_MASK,
+					      TAS2562_TDM_CFG2_RXWLEN_16B);
+		tas2562->v_sense_slot = tas2562->i_sense_slot + 2;
+		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
+		snd_soc_component_update_bits(tas2562->component,
+					      TAS2562_TDM_CFG2,
+					      TAS2562_TDM_CFG2_RXWLEN_MASK,
+					      TAS2562_TDM_CFG2_RXWLEN_24B);
+		tas2562->v_sense_slot = tas2562->i_sense_slot + 4;
+		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		snd_soc_component_update_bits(tas2562->component,
+					      TAS2562_TDM_CFG2,
+					      TAS2562_TDM_CFG2_RXWLEN_MASK,
+					      TAS2562_TDM_CFG2_RXWLEN_32B);
+		tas2562->v_sense_slot = tas2562->i_sense_slot + 4;
+		break;
+
+	default:
+		dev_info(tas2562->dev, "Not supported params format\n");
+	}
+
+	ret = snd_soc_component_update_bits(tas2562->component,
+		TAS2562_TDM_CFG5,
+		TAS2562_TDM_CFG5_VSNS_EN | TAS2562_TDM_CFG5_VSNS_SLOT_MASK,
+		TAS2562_TDM_CFG5_VSNS_EN | tas2562->v_sense_slot);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_soc_component_update_bits(tas2562->component,
+		TAS2562_TDM_CFG6,
+		TAS2562_TDM_CFG6_ISNS_EN | TAS2562_TDM_CFG6_ISNS_SLOT_MASK,
+		TAS2562_TDM_CFG6_ISNS_EN | tas2562->i_sense_slot);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int tas2562_hw_params(struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *params,
+			     struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tas2562_data *tas2562 = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	ret = tas2562_set_bitwidth(tas2562, params_format(params));
+	if (ret) {
+		dev_err(tas2562->dev, "set bitwidth failed, %d\n", ret);
+		return ret;
+	}
+
+	ret = tas2562_set_samplerate(tas2562, params_rate(params));
+	if (ret)
+		dev_err(tas2562->dev, "set bitwidth failed, %d\n", ret);
+
+	return ret;
+}
+
+static int tas2562_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct snd_soc_component *component = dai->component;
+	struct tas2562_data *tas2562 = snd_soc_component_get_drvdata(component);
+	u8 tdm_rx_start_slot = 0, asi_cfg_1 = 0;
+	int ret;
+
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		asi_cfg_1 = 0;
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		asi_cfg_1 |= TAS2562_TDM_CFG1_RX_FALLING;
+		break;
+	default:
+		dev_err(tas2562->dev, "ASI format Inverse is not found\n");
+		return -EINVAL;
+	}
+
+	ret = snd_soc_component_update_bits(component, TAS2562_TDM_CFG1,
+					    TAS2562_TDM_CFG1_RX_EDGE_MASK,
+					    asi_cfg_1);
+	if (ret < 0) {
+		dev_err(tas2562->dev, "Failed to set RX edge\n");
+		return ret;
+	}
+
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case (SND_SOC_DAIFMT_I2S):
+	case (SND_SOC_DAIFMT_DSP_A):
+	case (SND_SOC_DAIFMT_DSP_B):
+		tdm_rx_start_slot = BIT(1);
+		break;
+	case (SND_SOC_DAIFMT_LEFT_J):
+		tdm_rx_start_slot = 0;
+		break;
+	default:
+		dev_err(tas2562->dev, "DAI Format is not found, fmt=0x%x\n",
+			fmt);
+		ret = -EINVAL;
+		break;
+	}
+
+	ret = snd_soc_component_update_bits(component, TAS2562_TDM_CFG1,
+					    TAS2562_TDM_CFG1_RX_OFFSET_MASK,
+					    tdm_rx_start_slot);
+
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int tas2562_mute(struct snd_soc_dai *dai, int mute)
+{
+	struct snd_soc_component *component = dai->component;
+
+	return snd_soc_component_update_bits(component, TAS2562_PWR_CTRL,
+					     TAS2562_MODE_MASK,
+					     mute ? TAS2562_MUTE : 0);
+}
+
+static int tas2562_codec_probe(struct snd_soc_component *component)
+{
+	struct tas2562_data *tas2562 = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	tas2562->component = component;
+
+	if (tas2562->sdz_gpio)
+		gpiod_set_value_cansleep(tas2562->sdz_gpio, 1);
+
+	ret = snd_soc_component_update_bits(component, TAS2562_PWR_CTRL,
+					    TAS2562_MODE_MASK, TAS2562_MUTE);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+#ifdef CONFIG_PM
+static int tas2562_suspend(struct snd_soc_component *component)
+{
+	struct tas2562_data *tas2562 = snd_soc_component_get_drvdata(component);
+
+	regcache_cache_only(tas2562->regmap, true);
+	regcache_mark_dirty(tas2562->regmap);
+
+	if (tas2562->sdz_gpio)
+		gpiod_set_value_cansleep(tas2562->sdz_gpio, 0);
+
+	return 0;
+}
+
+static int tas2562_resume(struct snd_soc_component *component)
+{
+	struct tas2562_data *tas2562 = snd_soc_component_get_drvdata(component);
+
+	if (tas2562->sdz_gpio)
+		gpiod_set_value_cansleep(tas2562->sdz_gpio, 1);
+
+	regcache_cache_only(tas2562->regmap, false);
+
+	return regcache_sync(tas2562->regmap);
+}
+#else
+#define tas2562_suspend NULL
+#define tas2562_resume NULL
+#endif
+
+static const char * const tas2562_ASI1_src[] = {
+	"I2C offset", "Left", "Right", "LeftRightDiv2",
+};
+
+static SOC_ENUM_SINGLE_DECL(tas2562_ASI1_src_enum, TAS2562_TDM_CFG2, 4,
+			    tas2562_ASI1_src);
+
+static const struct snd_kcontrol_new tas2562_asi1_mux =
+	SOC_DAPM_ENUM("ASI1 Source", tas2562_ASI1_src_enum);
+
+static int tas2562_dac_event(struct snd_soc_dapm_widget *w,
+			     struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+					snd_soc_dapm_to_component(w->dapm);
+	struct tas2562_data *tas2562 = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		dev_info(tas2562->dev, "SND_SOC_DAPM_POST_PMU\n");
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		dev_info(tas2562->dev, "SND_SOC_DAPM_PRE_PMD\n");
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static DECLARE_TLV_DB_SCALE(tas2562_dac_tlv, 850, 50, 0);
+
+static const struct snd_kcontrol_new isense_switch =
+	SOC_DAPM_SINGLE("Switch", TAS2562_PWR_CTRL, TAS2562_ISENSE_POWER_EN,
+			1, 1);
+
+static const struct snd_kcontrol_new vsense_switch =
+	SOC_DAPM_SINGLE("Switch", TAS2562_PWR_CTRL, TAS2562_VSENSE_POWER_EN,
+			1, 1);
+
+static const struct snd_kcontrol_new tas2562_snd_controls[] = {
+	SOC_SINGLE_TLV("Amp Gain Volume", TAS2562_PB_CFG1, 0, 0x1c, 0,
+		       tas2562_dac_tlv),
+};
+
+static const struct snd_soc_dapm_widget tas2562_dapm_widgets[] = {
+	SND_SOC_DAPM_AIF_IN("ASI1", "ASI1 Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_MUX("ASI1 Sel", SND_SOC_NOPM, 0, 0, &tas2562_asi1_mux),
+	SND_SOC_DAPM_AIF_IN("DAC IN", "Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_DAC_E("DAC", NULL, SND_SOC_NOPM, 0, 0, tas2562_dac_event,
+			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_SWITCH("ISENSE", TAS2562_PWR_CTRL, 3, 1, &isense_switch),
+	SND_SOC_DAPM_SWITCH("VSENSE", TAS2562_PWR_CTRL, 2, 1, &vsense_switch),
+	SND_SOC_DAPM_SIGGEN("VMON"),
+	SND_SOC_DAPM_SIGGEN("IMON"),
+	SND_SOC_DAPM_OUTPUT("OUT"),
+};
+
+static const struct snd_soc_dapm_route tas2562_audio_map[] = {
+	{"ASI1 Sel", "I2C offset", "ASI1"},
+	{"ASI1 Sel", "Left", "ASI1"},
+	{"ASI1 Sel", "Right", "ASI1"},
+	{"ASI1 Sel", "LeftRightDiv2", "ASI1"},
+	{ "DAC", NULL, "DAC IN" },
+	{ "OUT", NULL, "DAC" },
+	{"ISENSE", "Switch", "IMON"},
+	{"VSENSE", "Switch", "VMON"},
+};
+
+static const struct snd_soc_component_driver soc_component_dev_tas2562 = {
+	.probe			= tas2562_codec_probe,
+	.suspend		= tas2562_suspend,
+	.resume			= tas2562_resume,
+	.set_bias_level		= tas2562_set_bias_level,
+	.controls		= tas2562_snd_controls,
+	.num_controls		= ARRAY_SIZE(tas2562_snd_controls),
+	.dapm_widgets		= tas2562_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(tas2562_dapm_widgets),
+	.dapm_routes		= tas2562_audio_map,
+	.num_dapm_routes	= ARRAY_SIZE(tas2562_audio_map),
+	.idle_bias_on		= 1,
+	.use_pmdown_time	= 1,
+	.endianness		= 1,
+	.non_legacy_dai_naming	= 1,
+};
+
+static const struct snd_soc_dai_ops tas2562_speaker_dai_ops = {
+	.hw_params	= tas2562_hw_params,
+	.set_fmt	= tas2562_set_dai_fmt,
+	.set_tdm_slot	= tas2562_set_dai_tdm_slot,
+	.digital_mute	= tas2562_mute,
+};
+
+static struct snd_soc_dai_driver tas2562_dai[] = {
+	{
+		.name = "tas2562-amplifier",
+		.id = 0,
+		.playback = {
+			.stream_name    = "ASI1 Playback",
+			.channels_min   = 2,
+			.channels_max   = 2,
+			.rates      = SNDRV_PCM_RATE_8000_192000,
+			.formats    = TAS2562_FORMATS,
+		},
+		.ops = &tas2562_speaker_dai_ops,
+	},
+};
+
+static const struct regmap_range_cfg tas2562_ranges[] = {
+	{
+		.range_min = 0,
+		.range_max = 5 * 128,
+		.selector_reg = TAS2562_PAGE_CTRL,
+		.selector_mask = 0xff,
+		.selector_shift = 0,
+		.window_start = 0,
+		.window_len = 128,
+	},
+};
+
+static const struct reg_default tas2562_reg_defaults[] = {
+	{ TAS2562_PAGE_CTRL, 0x00 },
+	{ TAS2562_SW_RESET, 0x00 },
+	{ TAS2562_PWR_CTRL, 0x0e },
+	{ TAS2562_PB_CFG1, 0x20 },
+	{ TAS2562_TDM_CFG0, 0x09 },
+	{ TAS2562_TDM_CFG1, 0x02 },
+};
+
+static const struct regmap_config tas2562_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+
+	.max_register = 5 * 128,
+	.cache_type = REGCACHE_RBTREE,
+	.reg_defaults = tas2562_reg_defaults,
+	.num_reg_defaults = ARRAY_SIZE(tas2562_reg_defaults),
+	.ranges = tas2562_ranges,
+	.num_ranges = ARRAY_SIZE(tas2562_ranges),
+};
+
+static int tas2562_parse_dt(struct tas2562_data *tas2562)
+{
+	struct device *dev = tas2562->dev;
+	int ret = 0;
+
+	tas2562->sdz_gpio = devm_gpiod_get_optional(dev, "shut-down-gpio",
+						      GPIOD_OUT_HIGH);
+	if (IS_ERR(tas2562->sdz_gpio)) {
+		if (PTR_ERR(tas2562->sdz_gpio) == -EPROBE_DEFER) {
+			tas2562->sdz_gpio = NULL;
+			return -EPROBE_DEFER;
+		}
+	}
+
+	ret = fwnode_property_read_u32(dev->fwnode, "ti,imon-slot-no",
+			&tas2562->i_sense_slot);
+	if (ret)
+		dev_err(dev, "Looking up %s property failed %d\n",
+			"ti,imon-slot-no", ret);
+
+	return ret;
+}
+
+static int tas2562_probe(struct i2c_client *client,
+			 const struct i2c_device_id *id)
+{
+	struct device *dev = &client->dev;
+	struct tas2562_data *data;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->client = client;
+	data->dev = &client->dev;
+
+	tas2562_parse_dt(data);
+
+	data->regmap = devm_regmap_init_i2c(client, &tas2562_regmap_config);
+	if (IS_ERR(data->regmap)) {
+		ret = PTR_ERR(data->regmap);
+		dev_err(dev, "failed to allocate register map: %d\n", ret);
+		return ret;
+	}
+
+	dev_set_drvdata(&client->dev, data);
+
+	return devm_snd_soc_register_component(dev, &soc_component_dev_tas2562,
+					       tas2562_dai,
+					       ARRAY_SIZE(tas2562_dai));
+
+}
+
+static const struct i2c_device_id tas2562_id[] = {
+	{ "tas2562", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, tas2562_id);
+
+static const struct of_device_id tas2562_of_match[] = {
+	{ .compatible = "ti,tas2562", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, tas2562_of_match);
+
+static struct i2c_driver tas2562_i2c_driver = {
+	.driver = {
+		.name = "tas2562",
+		.of_match_table = of_match_ptr(tas2562_of_match),
+	},
+	.probe = tas2562_probe,
+	.id_table = tas2562_id,
+};
+
+module_i2c_driver(tas2562_i2c_driver);
+
+MODULE_AUTHOR("Dan Murphy <dmurphy@ti.com>");
+MODULE_DESCRIPTION("TAS2562 Audio amplifier driver");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/tas2562.h b/sound/soc/codecs/tas2562.h
new file mode 100644
index 000000000000..60f2bb1d198b
--- /dev/null
+++ b/sound/soc/codecs/tas2562.h
@@ -0,0 +1,85 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * tas2562.h - ALSA SoC Texas Instruments TAS2562 Mono Audio Amplifier
+ *
+ * Copyright (C) 2019 Texas Instruments Incorporated -  http://www.ti.com
+ *
+ * Author: Dan Murphy <dmurphy@ti.com>
+ */
+
+#ifndef __TAS2562_H__
+#define __TAS2562_H__
+
+#define TAS2562_PAGE_CTRL	0x00
+
+#define TAS2562_REG(page, reg)	((page * 128) + reg)
+
+#define TAS2562_SW_RESET	TAS2562_REG(0, 0x01)
+#define TAS2562_PWR_CTRL	TAS2562_REG(0, 0x02)
+#define TAS2562_PB_CFG1		TAS2562_REG(0, 0x03)
+#define TAS2562_MISC_CFG1	TAS2562_REG(0, 0x04)
+#define TAS2562_MISC_CFG2	TAS2562_REG(0, 0x05)
+
+#define TAS2562_TDM_CFG0	TAS2562_REG(0, 0x06)
+#define TAS2562_TDM_CFG1	TAS2562_REG(0, 0x07)
+#define TAS2562_TDM_CFG2	TAS2562_REG(0, 0x08)
+#define TAS2562_TDM_CFG3	TAS2562_REG(0, 0x09)
+#define TAS2562_TDM_CFG4	TAS2562_REG(0, 0x0a)
+#define TAS2562_TDM_CFG5	TAS2562_REG(0, 0x0b)
+#define TAS2562_TDM_CFG6	TAS2562_REG(0, 0x0c)
+#define TAS2562_TDM_CFG7	TAS2562_REG(0, 0x0d)
+#define TAS2562_TDM_CFG8	TAS2562_REG(0, 0x0e)
+#define TAS2562_TDM_CFG9	TAS2562_REG(0, 0x0f)
+#define TAS2562_TDM_CFG10	TAS2562_REG(0, 0x10)
+#define TAS2562_TDM_DET		TAS2562_REG(0, 0x11)
+#define TAS2562_REV_ID		TAS2562_REG(0, 0x7d)
+
+/* Page 2 */
+#define TAS2562_DVC_CFG1	TAS2562_REG(2, 0x01)
+#define TAS2562_DVC_CFG2	TAS2562_REG(2, 0x02)
+
+#define TAS2562_RESET	BIT(0)
+
+#define TAS2562_MODE_MASK	0x3
+#define TAS2562_ACTIVE		0x0
+#define TAS2562_MUTE		0x1
+#define TAS2562_SHUTDOWN	0x2
+
+#define TAS2562_TDM_CFG1_RX_EDGE_MASK	BIT(0)
+#define TAS2562_TDM_CFG1_RX_FALLING	1
+#define TAS2562_TDM_CFG1_RX_OFFSET_MASK	GENMASK(4, 0)
+
+#define TAS2562_TDM_CFG0_RAMPRATE_MASK		BIT(5)
+#define TAS2562_TDM_CFG0_RAMPRATE_44_1		BIT(5)
+#define TAS2562_TDM_CFG0_SAMPRATE_MASK		GENMASK(3, 1)
+#define TAS2562_TDM_CFG0_SAMPRATE_7305_8KHZ	0x0
+#define TAS2562_TDM_CFG0_SAMPRATE_14_7_16KHZ	0x1
+#define TAS2562_TDM_CFG0_SAMPRATE_22_05_24KHZ	0x2
+#define TAS2562_TDM_CFG0_SAMPRATE_29_4_32KHZ	0x3
+#define TAS2562_TDM_CFG0_SAMPRATE_44_1_48KHZ	0x4
+#define TAS2562_TDM_CFG0_SAMPRATE_88_2_96KHZ	0x5
+#define TAS2562_TDM_CFG0_SAMPRATE_176_4_192KHZ	0x6
+
+#define TAS2562_TDM_CFG2_RIGHT_JUSTIFY	BIT(6)
+
+#define TAS2562_TDM_CFG2_RXLEN_MASK	GENMASK(0, 1)
+#define TAS2562_TDM_CFG2_RXLEN_16B	0x0
+#define TAS2562_TDM_CFG2_RXLEN_24B	BIT(0)
+#define TAS2562_TDM_CFG2_RXLEN_32B	BIT(1)
+
+#define TAS2562_TDM_CFG2_RXWLEN_MASK	GENMASK(3, 2)
+#define TAS2562_TDM_CFG2_RXWLEN_16B	0x0
+#define TAS2562_TDM_CFG2_RXWLEN_20B	BIT(2)
+#define TAS2562_TDM_CFG2_RXWLEN_24B	BIT(3)
+#define TAS2562_TDM_CFG2_RXWLEN_32B	(BIT(2) | BIT(3))
+
+#define TAS2562_VSENSE_POWER_EN		BIT(2)
+#define TAS2562_ISENSE_POWER_EN		BIT(3)
+
+#define TAS2562_TDM_CFG5_VSNS_EN	BIT(6)
+#define TAS2562_TDM_CFG5_VSNS_SLOT_MASK	GENMASK(5, 0)
+
+#define TAS2562_TDM_CFG6_ISNS_EN	BIT(6)
+#define TAS2562_TDM_CFG6_ISNS_SLOT_MASK	GENMASK(5, 0)
+
+#endif /* __TAS2562_H__ */
-- 
2.22.0.214.g8dca754b1e

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
