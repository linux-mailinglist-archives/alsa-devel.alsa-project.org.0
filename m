Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8401234187A
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Mar 2021 10:34:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E061B16A2;
	Fri, 19 Mar 2021 10:33:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E061B16A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616146490;
	bh=0bnoy+LvdRwmGu5taj0dcb13nRu/LIn1zZmyVN56paA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bIO2unsqkoL3VDjob4icSEdMAHtxYvaoQMyend1aj/VwXXWblcs8O5HPdNI8WXCwQ
	 kAQl9BfkxaLvsp34Grb1O5iqoBeEDlA5mhYek9Ud3IC84eKfAwqwH5OLTTIlOb5al9
	 mlJPnL2BW/3CkSstksNDBMwoilsxSAg1FZeuAQFM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2D23F804E7;
	Fri, 19 Mar 2021 10:30:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5524BF80430; Fri, 19 Mar 2021 10:30:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UPPERCASE_50_75,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26E3BF80253
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 10:30:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26E3BF80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="MMcHkZyB"
Received: by mail-wr1-x436.google.com with SMTP id x13so8389076wrs.9
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 02:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oNbfo6iAf6ovwUhCvST+NW5Tmees959q+wGNiyykXZY=;
 b=MMcHkZyBE9ZXVe5VJdOEHRFic/KgW9C2MBo07+4yR3r1deHiQXs5N/GfGhwnX7TXQ7
 eajc/GM2HsB0o56xI0kA4m1fH0Ayf14LFtQpNjTGI9Yt0KK3MDFtSB/rr7rVhQPfFJKJ
 /8JzIaUm5+esP3g/gJxJgaf793+rkijCmm4BRJJstmX0pijotRqD5oYJ5gh5dric0hDH
 Gs2zXxqf2kYlL1/x973BvCyAcDGxha4sez5u4HoUDvId1N3Y5VPGe34pVZu78gi1tPh4
 iCVUHC+D6AH4CJ3u87UmW6+KoDN/C/nVzWnY4PQmSIaJ5PkK5UyNP0jGBFASZxSAMxT2
 k9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oNbfo6iAf6ovwUhCvST+NW5Tmees959q+wGNiyykXZY=;
 b=dillq5BHPIUIGVuIzSmJCTSHpx3MBFgXdbZfPUdeKe9wG/ijgx4U/yKkULds9E4mpJ
 c5Shrqyo0JRRs15Q9OjI5GVgWM8D8aHuQbRooGxmD2sPzOQqBgFjn1OIoqVAMQvWC8XM
 Nbwf5e4gvnUQY3QzYU93+34w1oOH2PUd9KECcremxi9EnO6kh4a9xVzqclO4klPaBY/1
 ZwgdPqSu3oUXSlORQd4F/NLV5dWzDnezBJwuaWh7hWscP7JNuXd+Beo/TIEWCq8pZmvW
 R7zpkjqnh1stVg3NhrsXY1QtqDd20Nk4PxLmsXlo2EKc150I9li97XQ7lwT9ujqAX6iu
 edlg==
X-Gm-Message-State: AOAM532qQUcmJQdKQibU6+qM3cTLuOOB38y8wDzIczRyZspDxG7fpqJb
 9bC1Q2Mv2UAVyUPfX2XSCTYN6Q==
X-Google-Smtp-Source: ABdhPJybmoWvnJaU3lR6RnOIbaAVP0FAOTsDFqGSgzfOWX1ZdhMlaUODVobVFEYgIV6U3V63vIjYCA==
X-Received: by 2002:adf:ecc8:: with SMTP id s8mr3448259wro.11.1616146207369;
 Fri, 19 Mar 2021 02:30:07 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id p6sm6779058wru.2.2021.03.19.02.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 02:30:06 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v3 3/7] ASoC: codecs: wcd938x: add basic driver
Date: Fri, 19 Mar 2021 09:29:15 +0000
Message-Id: <20210319092919.21218-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210319092919.21218-1-srinivas.kandagatla@linaro.org>
References: <20210319092919.21218-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

This patch adds basic SoundWire codec driver to support for
WCD938X TX and RX devices.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/Kconfig       |    9 +
 sound/soc/codecs/Makefile      |    2 +
 sound/soc/codecs/wcd938x-sdw.c |  291 ++++++
 sound/soc/codecs/wcd938x.c     | 1615 ++++++++++++++++++++++++++++++++
 sound/soc/codecs/wcd938x.h     |  676 +++++++++++++
 5 files changed, 2593 insertions(+)
 create mode 100644 sound/soc/codecs/wcd938x-sdw.c
 create mode 100644 sound/soc/codecs/wcd938x.c
 create mode 100644 sound/soc/codecs/wcd938x.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 4ab34bca71aa..17fe1f690d22 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -231,6 +231,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_UDA1380
 	imply SND_SOC_WCD9335
 	imply SND_SOC_WCD934X
+	imply SND_SOC_WCD938X
 	imply SND_SOC_LPASS_RX_MACRO
 	imply SND_SOC_LPASS_TX_MACRO
 	imply SND_SOC_WL1273
@@ -1521,6 +1522,14 @@ config SND_SOC_WCD934X
 	  The WCD9340/9341 is a audio codec IC Integrated in
 	  Qualcomm SoCs like SDM845.
 
+config SND_SOC_WCD938X
+	tristate "WCD9380/WCD9385 Codec"
+	depends on SOUNDWIRE
+	select REGMAP_SOUNDWIRE
+	help
+	  The WCD9380/9385 is a audio codec IC Integrated in
+	  Qualcomm SoCs like SM8250.
+
 config SND_SOC_WL1273
 	tristate
 
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index edff5c5b92d3..c7dbe84d939e 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -249,6 +249,7 @@ snd-soc-uda134x-objs := uda134x.o
 snd-soc-uda1380-objs := uda1380.o
 snd-soc-wcd9335-objs := wcd-clsh-v2.o wcd9335.o
 snd-soc-wcd934x-objs := wcd-clsh-v2.o wcd934x.o
+snd-soc-wcd938x-objs := wcd938x.o wcd938x-sdw.o wcd-clsh-v2.o wcd938x-sdw.o
 snd-soc-wl1273-objs := wl1273.o
 snd-soc-wm-adsp-objs := wm_adsp.o
 snd-soc-wm0010-objs := wm0010.o
@@ -568,6 +569,7 @@ obj-$(CONFIG_SND_SOC_UDA134X)	+= snd-soc-uda134x.o
 obj-$(CONFIG_SND_SOC_UDA1380)	+= snd-soc-uda1380.o
 obj-$(CONFIG_SND_SOC_WCD9335)	+= snd-soc-wcd9335.o
 obj-$(CONFIG_SND_SOC_WCD934X)	+= snd-soc-wcd934x.o
+obj-$(CONFIG_SND_SOC_WCD938X)	+= snd-soc-wcd938x.o
 obj-$(CONFIG_SND_SOC_WL1273)	+= snd-soc-wl1273.o
 obj-$(CONFIG_SND_SOC_WM0010)	+= snd-soc-wm0010.o
 obj-$(CONFIG_SND_SOC_WM1250_EV1) += snd-soc-wm1250-ev1.o
diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
new file mode 100644
index 000000000000..ca29793b0972
--- /dev/null
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -0,0 +1,291 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2021, Linaro Limited
+
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/platform_device.h>
+#include <linux/device.h>
+#include <linux/delay.h>
+#include <linux/kernel.h>
+#include <linux/component.h>
+#include <sound/soc.h>
+#include <linux/pm_runtime.h>
+#include <linux/irqdomain.h>
+#include <linux/of.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+#include <linux/soundwire/sdw_registers.h>
+#include <linux/regmap.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <linux/regulator/consumer.h>
+#include "wcd938x.h"
+
+#define WCD938X_RATES_MASK (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
+			    SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
+			    SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_192000)
+/* Fractional Rates */
+#define WCD938X_FRAC_RATES_MASK (SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_88200 |\
+				 SNDRV_PCM_RATE_176400)
+#define WCD938X_FORMATS_S16_S24_LE (SNDRV_PCM_FMTBIT_S16_LE | \
+				    SNDRV_PCM_FMTBIT_S24_LE)
+#define SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(m) (0xE0 + 0x10 * (m))
+
+static struct wcd938x_sdw_ch_info wcd938x_sdw_rx_ch_info[] = {
+	WCD_SDW_CH(WCD938X_HPH_L, WCD938X_HPH_PORT, BIT(0)),
+	WCD_SDW_CH(WCD938X_HPH_R, WCD938X_HPH_PORT, BIT(1)),
+	WCD_SDW_CH(WCD938X_CLSH, WCD938X_CLSH_PORT, BIT(0)),
+	WCD_SDW_CH(WCD938X_COMP_L, WCD938X_COMP_PORT, BIT(0)),
+	WCD_SDW_CH(WCD938X_COMP_R, WCD938X_COMP_PORT, BIT(1)),
+	WCD_SDW_CH(WCD938X_LO, WCD938X_LO_PORT, BIT(0)),
+	WCD_SDW_CH(WCD938X_DSD_L, WCD938X_DSD_PORT, BIT(0)),
+	WCD_SDW_CH(WCD938X_DSD_R, WCD938X_DSD_PORT, BIT(1)),
+};
+
+static struct wcd938x_sdw_ch_info wcd938x_sdw_tx_ch_info[] = {
+	WCD_SDW_CH(WCD938X_ADC1, WCD938X_ADC_1_2_PORT, BIT(0)),
+	WCD_SDW_CH(WCD938X_ADC2, WCD938X_ADC_1_2_PORT, BIT(1)),
+	WCD_SDW_CH(WCD938X_ADC3, WCD938X_ADC_3_4_PORT, BIT(0)),
+	WCD_SDW_CH(WCD938X_ADC4, WCD938X_ADC_3_4_PORT, BIT(1)),
+	WCD_SDW_CH(WCD938X_DMIC0, WCD938X_DMIC_0_3_MBHC_PORT, BIT(0)),
+	WCD_SDW_CH(WCD938X_DMIC1, WCD938X_DMIC_0_3_MBHC_PORT, BIT(1)),
+	WCD_SDW_CH(WCD938X_MBHC, WCD938X_DMIC_0_3_MBHC_PORT, BIT(2)),
+	WCD_SDW_CH(WCD938X_DMIC2, WCD938X_DMIC_0_3_MBHC_PORT, BIT(2)),
+	WCD_SDW_CH(WCD938X_DMIC3, WCD938X_DMIC_0_3_MBHC_PORT, BIT(3)),
+	WCD_SDW_CH(WCD938X_DMIC4, WCD938X_DMIC_4_7_PORT, BIT(0)),
+	WCD_SDW_CH(WCD938X_DMIC5, WCD938X_DMIC_4_7_PORT, BIT(1)),
+	WCD_SDW_CH(WCD938X_DMIC6, WCD938X_DMIC_4_7_PORT, BIT(2)),
+	WCD_SDW_CH(WCD938X_DMIC7, WCD938X_DMIC_4_7_PORT, BIT(3)),
+};
+
+static struct sdw_dpn_prop wcd938x_dpn_prop[WCD938X_MAX_SWR_PORTS] = {
+	{
+		.num = 1,
+		.type = SDW_DPN_SIMPLE,
+		.min_ch = 1,
+		.max_ch = 8,
+		.simple_ch_prep_sm = true,
+	}, {
+		.num = 2,
+		.type = SDW_DPN_SIMPLE,
+		.min_ch = 1,
+		.max_ch = 4,
+		.simple_ch_prep_sm = true,
+	}, {
+		.num = 3,
+		.type = SDW_DPN_SIMPLE,
+		.min_ch = 1,
+		.max_ch = 4,
+		.simple_ch_prep_sm = true,
+	}, {
+		.num = 4,
+		.type = SDW_DPN_SIMPLE,
+		.min_ch = 1,
+		.max_ch = 4,
+		.simple_ch_prep_sm = true,
+	}, {
+		.num = 5,
+		.type = SDW_DPN_SIMPLE,
+		.min_ch = 1,
+		.max_ch = 4,
+		.simple_ch_prep_sm = true,
+	}
+};
+
+static int wcd938x_sdw_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params,
+				struct snd_soc_dai *dai)
+{
+	struct wcd938x_sdw_priv *wcd = dev_get_drvdata(dai->dev);
+	struct sdw_port_config port_config[WCD938X_MAX_SWR_PORTS];
+	unsigned long int ch_mask;
+	int i, j;
+
+	wcd->sconfig.ch_count = 1;
+	wcd->active_ports = 0;
+	for (i = 0; i < WCD938X_MAX_SWR_PORTS; i++) {
+		ch_mask = wcd->port_config[i].ch_mask;
+
+		if (!ch_mask)
+			continue;
+
+		for_each_set_bit(j, &ch_mask, 4)
+			wcd->sconfig.ch_count++;
+
+		port_config[wcd->active_ports] = wcd->port_config[i];
+		wcd->active_ports++;
+	}
+
+	wcd->sconfig.bps = 1;
+	wcd->sconfig.frame_rate =  params_rate(params);
+	if (wcd->is_tx)
+		wcd->sconfig.direction = SDW_DATA_DIR_TX;
+	else
+		wcd->sconfig.direction = SDW_DATA_DIR_RX;
+
+	wcd->sconfig.type = SDW_STREAM_PCM;
+
+	return sdw_stream_add_slave(wcd->sdev, &wcd->sconfig,
+				    &port_config[0], wcd->active_ports,
+				    wcd->sruntime);
+}
+
+static int wcd938x_sdw_free(struct snd_pcm_substream *substream,
+			      struct snd_soc_dai *dai)
+{
+	struct wcd938x_sdw_priv *wcd = dev_get_drvdata(dai->dev);
+
+	sdw_stream_remove_slave(wcd->sdev, wcd->sruntime);
+
+	return 0;
+}
+
+static int wcd938x_sdw_set_sdw_stream(struct snd_soc_dai *dai,
+				  void *stream, int direction)
+{
+	struct wcd938x_sdw_priv *wcd = dev_get_drvdata(dai->dev);
+
+	wcd->sruntime = stream;
+
+	return 0;
+}
+
+static struct snd_soc_dai_ops wcd938x_sdw_dai_ops = {
+	.hw_params = wcd938x_sdw_hw_params,
+	.hw_free = wcd938x_sdw_free,
+	.set_sdw_stream = wcd938x_sdw_set_sdw_stream,
+};
+
+static struct snd_soc_dai_driver wcd938x_rx_dai = {
+	.name = "wcd938x-sdw-rx",
+	.playback = {
+		.stream_name = "WCD AIF1 Playback",
+		.rates = WCD938X_RATES_MASK | WCD938X_FRAC_RATES_MASK,
+		.formats = WCD938X_FORMATS_S16_S24_LE,
+		.rate_max = 192000,
+		.rate_min = 8000,
+		.channels_min = 1,
+		.channels_max = 2,
+	},
+	.ops = &wcd938x_sdw_dai_ops,
+};
+
+static struct snd_soc_dai_driver wcd938x_tx_dai = {
+	.name = "wcd938x-sdw-tx",
+	.capture = {
+		.stream_name = "WCD AIF1 Capture",
+		.rates = WCD938X_RATES_MASK,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		.rate_min = 8000,
+		.rate_max = 192000,
+		.channels_min = 1,
+		.channels_max = 4,
+	},
+	.ops = &wcd938x_sdw_dai_ops,
+};
+
+static int wcd9380_update_status(struct sdw_slave *slave,
+				 enum sdw_slave_status status)
+{
+	struct wcd938x_sdw_priv *wcd = dev_get_drvdata(&slave->dev);
+
+	if (status == SDW_SLAVE_ATTACHED)
+		wcd938x_io_init(wcd);
+
+	return 0;
+}
+
+static int wcd9380_bus_config(struct sdw_slave *slave,
+			      struct sdw_bus_params *params)
+{
+	sdw_write(slave, SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(params->next_bank),  0x01);
+
+	return 0;
+}
+
+static int wcd9380_interrupt_callback(struct sdw_slave *slave,
+				      struct sdw_slave_intr_status *status)
+{
+	struct wcd938x_sdw_priv *wcd = dev_get_drvdata(&slave->dev);
+
+	return wcd938x_handle_sdw_irq(wcd);
+}
+
+static struct sdw_slave_ops wcd9380_slave_ops = {
+	.update_status = wcd9380_update_status,
+	.interrupt_callback = wcd9380_interrupt_callback,
+	.bus_config = wcd9380_bus_config,
+};
+
+static int wcd9380_probe(struct sdw_slave *pdev,
+			 const struct sdw_device_id *id)
+{
+	struct device *dev = &pdev->dev;
+	struct wcd938x_sdw_priv *wcd;
+	const char *dir = "rx";
+	int ret;
+
+	wcd = devm_kzalloc(dev, sizeof(*wcd), GFP_KERNEL);
+	if (!wcd)
+		return -ENOMEM;
+
+	of_property_read_string(dev->of_node, "direction", &dir);
+	if (!strcmp(dir, "tx"))
+		wcd->is_tx = true;
+	else
+		wcd->is_tx = false;
+
+
+	ret = of_property_read_variable_u32_array(dev->of_node, "qcom,port-mapping",
+						  wcd->port_map,
+						  WCD938X_MAX_TX_SWR_PORTS,
+						  WCD938X_MAX_SWR_PORTS);
+	if (ret)
+		dev_info(dev, "Static Port mapping not specified\n");
+
+	wcd->sdev = pdev;
+	dev_set_drvdata(dev, wcd);
+	ret = wcd938x_init(wcd);
+	if (ret)
+		return ret;
+
+	pdev->prop.scp_int1_mask = SDW_SCP_INT1_IMPL_DEF |
+					SDW_SCP_INT1_BUS_CLASH |
+					SDW_SCP_INT1_PARITY;
+	pdev->prop.lane_control_support = true;
+	if (wcd->is_tx) {
+		pdev->prop.source_ports = GENMASK(WCD938X_MAX_SWR_PORTS, 0);
+		pdev->prop.src_dpn_prop = wcd938x_dpn_prop;
+		wcd->ch_info = &wcd938x_sdw_tx_ch_info[0];
+		pdev->prop.wake_capable = true;
+	} else {
+		pdev->prop.sink_ports = GENMASK(WCD938X_MAX_SWR_PORTS, 0);
+		pdev->prop.sink_dpn_prop = wcd938x_dpn_prop;
+		wcd->ch_info = &wcd938x_sdw_rx_ch_info[0];
+	}
+
+	if (wcd->is_tx)
+		return wcd938x_register_component(wcd, dev, &wcd938x_tx_dai);
+	else
+		return wcd938x_register_component(wcd, dev, &wcd938x_rx_dai);
+
+}
+
+static const struct sdw_device_id wcd9380_slave_id[] = {
+	SDW_SLAVE_ENTRY(0x0217, 0x10d, 0),
+	{},
+};
+MODULE_DEVICE_TABLE(sdw, wcd9380_slave_id);
+
+static struct sdw_driver wcd9380_codec_driver = {
+	.probe	= wcd9380_probe,
+	.ops = &wcd9380_slave_ops,
+	.id_table = wcd9380_slave_id,
+	.driver = {
+		.name	= "wcd9380-codec",
+	}
+};
+module_sdw_driver(wcd9380_codec_driver);
+
+MODULE_DESCRIPTION("WCD938X SDW codec driver");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
new file mode 100644
index 000000000000..9e8d588e2235
--- /dev/null
+++ b/sound/soc/codecs/wcd938x.c
@@ -0,0 +1,1615 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
+
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/platform_device.h>
+#include <linux/device.h>
+#include <linux/delay.h>
+#include <linux/kernel.h>
+#include <linux/component.h>
+#include <sound/soc.h>
+#include <sound/tlv.h>
+#include <linux/of_gpio.h>
+#include <linux/of.h>
+#include <linux/soundwire/sdw_registers.h>
+#include <sound/jack.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <linux/regmap.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <linux/regulator/consumer.h>
+
+#include "wcd-clsh-v2.h"
+#include "wcd938x.h"
+
+#define WCD938X_MAX_MICBIAS		(4)
+#define WCD938X_MAX_SUPPLY		(4)
+#define WCD938X_MBHC_MAX_BUTTONS	(8)
+#define TX_ADC_MAX			(4)
+#define WCD938X_TX_MAX_SWR_PORTS	(5)
+
+/* Convert from vout ctl to micbias voltage in mV */
+#define  WCD_VOUT_CTL_TO_MICB(v)	(1000 + v * 50)
+#define SWR_CLK_RATE_0P6MHZ		(600000)
+#define SWR_CLK_RATE_1P2MHZ		(1200000)
+#define SWR_CLK_RATE_2P4MHZ		(2400000)
+#define SWR_CLK_RATE_4P8MHZ		(4800000)
+#define SWR_CLK_RATE_9P6MHZ		(9600000)
+#define SWR_CLK_RATE_11P2896MHZ		(1128960)
+
+#define WCD938X_DRV_NAME "wcd938x_codec"
+#define WCD938X_VERSION_1_0		(1)
+#define EAR_RX_PATH_AUX			(1)
+
+#define ADC_MODE_VAL_HIFI		0x01
+#define ADC_MODE_VAL_LO_HIF		0x02
+#define ADC_MODE_VAL_NORMAL		0x03
+#define ADC_MODE_VAL_LP			0x05
+#define ADC_MODE_VAL_ULP1		0x09
+#define ADC_MODE_VAL_ULP2		0x0B
+
+/* Z value defined in milliohm */
+#define WCD938X_ZDET_VAL_32             (32000)
+#define WCD938X_ZDET_VAL_400            (400000)
+#define WCD938X_ZDET_VAL_1200           (1200000)
+#define WCD938X_ZDET_VAL_100K           (100000000)
+/* Z floating defined in ohms */
+#define WCD938X_ZDET_FLOATING_IMPEDANCE	(0x0FFFFFFE)
+#define WCD938X_ZDET_NUM_MEASUREMENTS   (900)
+#define WCD938X_MBHC_GET_C1(c)          ((c & 0xC000) >> 14)
+#define WCD938X_MBHC_GET_X1(x)          (x & 0x3FFF)
+/* Z value compared in milliOhm */
+#define WCD938X_MBHC_IS_SECOND_RAMP_REQUIRED(z) ((z > 400000) || (z < 32000))
+#define WCD938X_MBHC_ZDET_CONST         (86 * 16384)
+#define WCD938X_MBHC_MOISTURE_RREF      R_24_KOHM
+#define WCD_MBHC_HS_V_MAX           1600
+
+enum {
+	WCD9380 = 0,
+	WCD9385 = 5,
+};
+
+enum {
+	TX_HDR12 = 0,
+	TX_HDR34,
+	TX_HDR_MAX,
+};
+
+enum {
+	WCD_RX1,
+	WCD_RX2,
+	WCD_RX3
+};
+
+enum {
+	/* INTR_CTRL_INT_MASK_0 */
+	WCD938X_IRQ_MBHC_BUTTON_PRESS_DET = 0,
+	WCD938X_IRQ_MBHC_BUTTON_RELEASE_DET,
+	WCD938X_IRQ_MBHC_ELECT_INS_REM_DET,
+	WCD938X_IRQ_MBHC_ELECT_INS_REM_LEG_DET,
+	WCD938X_IRQ_MBHC_SW_DET,
+	WCD938X_IRQ_HPHR_OCP_INT,
+	WCD938X_IRQ_HPHR_CNP_INT,
+	WCD938X_IRQ_HPHL_OCP_INT,
+
+	/* INTR_CTRL_INT_MASK_1 */
+	WCD938X_IRQ_HPHL_CNP_INT,
+	WCD938X_IRQ_EAR_CNP_INT,
+	WCD938X_IRQ_EAR_SCD_INT,
+	WCD938X_IRQ_AUX_CNP_INT,
+	WCD938X_IRQ_AUX_SCD_INT,
+	WCD938X_IRQ_HPHL_PDM_WD_INT,
+	WCD938X_IRQ_HPHR_PDM_WD_INT,
+	WCD938X_IRQ_AUX_PDM_WD_INT,
+
+	/* INTR_CTRL_INT_MASK_2 */
+	WCD938X_IRQ_LDORT_SCD_INT,
+	WCD938X_IRQ_MBHC_MOISTURE_INT,
+	WCD938X_IRQ_HPHL_SURGE_DET_INT,
+	WCD938X_IRQ_HPHR_SURGE_DET_INT,
+	WCD938X_NUM_IRQS,
+};
+
+
+enum {
+	WCD_ADC1 = 0,
+	WCD_ADC2,
+	WCD_ADC3,
+	WCD_ADC4,
+	ALLOW_BUCK_DISABLE,
+	HPH_COMP_DELAY,
+	HPH_PA_DELAY,
+	AMIC2_BCS_ENABLE,
+	WCD_SUPPLIES_LPM_MODE,
+};
+
+enum {
+	ADC_MODE_INVALID = 0,
+	ADC_MODE_HIFI,
+	ADC_MODE_LO_HIF,
+	ADC_MODE_NORMAL,
+	ADC_MODE_LP,
+	ADC_MODE_ULP1,
+	ADC_MODE_ULP2,
+};
+
+enum {
+	AIF1_PB = 0,
+	AIF1_CAP,
+	NUM_CODEC_DAIS,
+};
+
+struct wcd938x_priv {
+	struct device *dev;
+	struct regmap *regmap;
+	struct wcd_clsh_ctrl *clsh_info;
+	struct irq_domain *virq;
+	struct regmap_irq_chip *wcd_regmap_irq_chip;
+	struct regmap_irq_chip_data *irq_chip;
+	struct regulator_bulk_data supplies[WCD938X_MAX_SUPPLY];
+	struct snd_soc_jack *jack;
+	unsigned long status_mask;
+	s32 micb_ref[WCD938X_MAX_MICBIAS];
+	s32 pullup_ref[WCD938X_MAX_MICBIAS];
+	u32 hph_mode;
+	u32 tx_mode[TX_ADC_MAX];
+	int flyback_cur_det_disable;
+	int ear_rx_path;
+	int variant;
+	int reset_gpio;
+	u32 micb1_mv;
+	u32 micb2_mv;
+	u32 micb3_mv;
+	u32 micb4_mv;
+	int hphr_pdm_wd_int;
+	int hphl_pdm_wd_int;
+	int aux_pdm_wd_int;
+	bool comp1_enable;
+	bool comp2_enable;
+	bool ldoh;
+	bool bcs_dis;
+};
+
+enum {
+	MIC_BIAS_1 = 1,
+	MIC_BIAS_2,
+	MIC_BIAS_3,
+	MIC_BIAS_4
+};
+
+enum {
+	MICB_PULLUP_ENABLE,
+	MICB_PULLUP_DISABLE,
+	MICB_ENABLE,
+	MICB_DISABLE,
+};
+
+static struct wcd938x_priv *g_wcd938x;
+
+static const struct reg_default wcd938x_defaults[] = {
+	{WCD938X_ANA_PAGE_REGISTER,                            0x00},
+	{WCD938X_ANA_BIAS,                                     0x00},
+	{WCD938X_ANA_RX_SUPPLIES,                              0x00},
+	{WCD938X_ANA_HPH,                                      0x0C},
+	{WCD938X_ANA_EAR,                                      0x00},
+	{WCD938X_ANA_EAR_COMPANDER_CTL,                        0x02},
+	{WCD938X_ANA_TX_CH1,                                   0x20},
+	{WCD938X_ANA_TX_CH2,                                   0x00},
+	{WCD938X_ANA_TX_CH3,                                   0x20},
+	{WCD938X_ANA_TX_CH4,                                   0x00},
+	{WCD938X_ANA_MICB1_MICB2_DSP_EN_LOGIC,                 0x00},
+	{WCD938X_ANA_MICB3_DSP_EN_LOGIC,                       0x00},
+	{WCD938X_ANA_MBHC_MECH,                                0x39},
+	{WCD938X_ANA_MBHC_ELECT,                               0x08},
+	{WCD938X_ANA_MBHC_ZDET,                                0x00},
+	{WCD938X_ANA_MBHC_RESULT_1,                            0x00},
+	{WCD938X_ANA_MBHC_RESULT_2,                            0x00},
+	{WCD938X_ANA_MBHC_RESULT_3,                            0x00},
+	{WCD938X_ANA_MBHC_BTN0,                                0x00},
+	{WCD938X_ANA_MBHC_BTN1,                                0x10},
+	{WCD938X_ANA_MBHC_BTN2,                                0x20},
+	{WCD938X_ANA_MBHC_BTN3,                                0x30},
+	{WCD938X_ANA_MBHC_BTN4,                                0x40},
+	{WCD938X_ANA_MBHC_BTN5,                                0x50},
+	{WCD938X_ANA_MBHC_BTN6,                                0x60},
+	{WCD938X_ANA_MBHC_BTN7,                                0x70},
+	{WCD938X_ANA_MICB1,                                    0x10},
+	{WCD938X_ANA_MICB2,                                    0x10},
+	{WCD938X_ANA_MICB2_RAMP,                               0x00},
+	{WCD938X_ANA_MICB3,                                    0x10},
+	{WCD938X_ANA_MICB4,                                    0x10},
+	{WCD938X_BIAS_CTL,                                     0x2A},
+	{WCD938X_BIAS_VBG_FINE_ADJ,                            0x55},
+	{WCD938X_LDOL_VDDCX_ADJUST,                            0x01},
+	{WCD938X_LDOL_DISABLE_LDOL,                            0x00},
+	{WCD938X_MBHC_CTL_CLK,                                 0x00},
+	{WCD938X_MBHC_CTL_ANA,                                 0x00},
+	{WCD938X_MBHC_CTL_SPARE_1,                             0x00},
+	{WCD938X_MBHC_CTL_SPARE_2,                             0x00},
+	{WCD938X_MBHC_CTL_BCS,                                 0x00},
+	{WCD938X_MBHC_MOISTURE_DET_FSM_STATUS,                 0x00},
+	{WCD938X_MBHC_TEST_CTL,                                0x00},
+	{WCD938X_LDOH_MODE,                                    0x2B},
+	{WCD938X_LDOH_BIAS,                                    0x68},
+	{WCD938X_LDOH_STB_LOADS,                               0x00},
+	{WCD938X_LDOH_SLOWRAMP,                                0x50},
+	{WCD938X_MICB1_TEST_CTL_1,                             0x1A},
+	{WCD938X_MICB1_TEST_CTL_2,                             0x00},
+	{WCD938X_MICB1_TEST_CTL_3,                             0xA4},
+	{WCD938X_MICB2_TEST_CTL_1,                             0x1A},
+	{WCD938X_MICB2_TEST_CTL_2,                             0x00},
+	{WCD938X_MICB2_TEST_CTL_3,                             0x24},
+	{WCD938X_MICB3_TEST_CTL_1,                             0x1A},
+	{WCD938X_MICB3_TEST_CTL_2,                             0x00},
+	{WCD938X_MICB3_TEST_CTL_3,                             0xA4},
+	{WCD938X_MICB4_TEST_CTL_1,                             0x1A},
+	{WCD938X_MICB4_TEST_CTL_2,                             0x00},
+	{WCD938X_MICB4_TEST_CTL_3,                             0xA4},
+	{WCD938X_TX_COM_ADC_VCM,                               0x39},
+	{WCD938X_TX_COM_BIAS_ATEST,                            0xE0},
+	{WCD938X_TX_COM_SPARE1,                                0x00},
+	{WCD938X_TX_COM_SPARE2,                                0x00},
+	{WCD938X_TX_COM_TXFE_DIV_CTL,                          0x22},
+	{WCD938X_TX_COM_TXFE_DIV_START,                        0x00},
+	{WCD938X_TX_COM_SPARE3,                                0x00},
+	{WCD938X_TX_COM_SPARE4,                                0x00},
+	{WCD938X_TX_1_2_TEST_EN,                               0xCC},
+	{WCD938X_TX_1_2_ADC_IB,                                0xE9},
+	{WCD938X_TX_1_2_ATEST_REFCTL,                          0x0A},
+	{WCD938X_TX_1_2_TEST_CTL,                              0x38},
+	{WCD938X_TX_1_2_TEST_BLK_EN1,                          0xFF},
+	{WCD938X_TX_1_2_TXFE1_CLKDIV,                          0x00},
+	{WCD938X_TX_1_2_SAR2_ERR,                              0x00},
+	{WCD938X_TX_1_2_SAR1_ERR,                              0x00},
+	{WCD938X_TX_3_4_TEST_EN,                               0xCC},
+	{WCD938X_TX_3_4_ADC_IB,                                0xE9},
+	{WCD938X_TX_3_4_ATEST_REFCTL,                          0x0A},
+	{WCD938X_TX_3_4_TEST_CTL,                              0x38},
+	{WCD938X_TX_3_4_TEST_BLK_EN3,                          0xFF},
+	{WCD938X_TX_3_4_TXFE3_CLKDIV,                          0x00},
+	{WCD938X_TX_3_4_SAR4_ERR,                              0x00},
+	{WCD938X_TX_3_4_SAR3_ERR,                              0x00},
+	{WCD938X_TX_3_4_TEST_BLK_EN2,                          0xFB},
+	{WCD938X_TX_3_4_TXFE2_CLKDIV,                          0x00},
+	{WCD938X_TX_3_4_SPARE1,                                0x00},
+	{WCD938X_TX_3_4_TEST_BLK_EN4,                          0xFB},
+	{WCD938X_TX_3_4_TXFE4_CLKDIV,                          0x00},
+	{WCD938X_TX_3_4_SPARE2,                                0x00},
+	{WCD938X_CLASSH_MODE_1,                                0x40},
+	{WCD938X_CLASSH_MODE_2,                                0x3A},
+	{WCD938X_CLASSH_MODE_3,                                0x00},
+	{WCD938X_CLASSH_CTRL_VCL_1,                            0x70},
+	{WCD938X_CLASSH_CTRL_VCL_2,                            0x82},
+	{WCD938X_CLASSH_CTRL_CCL_1,                            0x31},
+	{WCD938X_CLASSH_CTRL_CCL_2,                            0x80},
+	{WCD938X_CLASSH_CTRL_CCL_3,                            0x80},
+	{WCD938X_CLASSH_CTRL_CCL_4,                            0x51},
+	{WCD938X_CLASSH_CTRL_CCL_5,                            0x00},
+	{WCD938X_CLASSH_BUCK_TMUX_A_D,                         0x00},
+	{WCD938X_CLASSH_BUCK_SW_DRV_CNTL,                      0x77},
+	{WCD938X_CLASSH_SPARE,                                 0x00},
+	{WCD938X_FLYBACK_EN,                                   0x4E},
+	{WCD938X_FLYBACK_VNEG_CTRL_1,                          0x0B},
+	{WCD938X_FLYBACK_VNEG_CTRL_2,                          0x45},
+	{WCD938X_FLYBACK_VNEG_CTRL_3,                          0x74},
+	{WCD938X_FLYBACK_VNEG_CTRL_4,                          0x7F},
+	{WCD938X_FLYBACK_VNEG_CTRL_5,                          0x83},
+	{WCD938X_FLYBACK_VNEG_CTRL_6,                          0x98},
+	{WCD938X_FLYBACK_VNEG_CTRL_7,                          0xA9},
+	{WCD938X_FLYBACK_VNEG_CTRL_8,                          0x68},
+	{WCD938X_FLYBACK_VNEG_CTRL_9,                          0x64},
+	{WCD938X_FLYBACK_VNEGDAC_CTRL_1,                       0xED},
+	{WCD938X_FLYBACK_VNEGDAC_CTRL_2,                       0xF0},
+	{WCD938X_FLYBACK_VNEGDAC_CTRL_3,                       0xA6},
+	{WCD938X_FLYBACK_CTRL_1,                               0x65},
+	{WCD938X_FLYBACK_TEST_CTL,                             0x00},
+	{WCD938X_RX_AUX_SW_CTL,                                0x00},
+	{WCD938X_RX_PA_AUX_IN_CONN,                            0x01},
+	{WCD938X_RX_TIMER_DIV,                                 0x32},
+	{WCD938X_RX_OCP_CTL,                                   0x1F},
+	{WCD938X_RX_OCP_COUNT,                                 0x77},
+	{WCD938X_RX_BIAS_EAR_DAC,                              0xA0},
+	{WCD938X_RX_BIAS_EAR_AMP,                              0xAA},
+	{WCD938X_RX_BIAS_HPH_LDO,                              0xA9},
+	{WCD938X_RX_BIAS_HPH_PA,                               0xAA},
+	{WCD938X_RX_BIAS_HPH_RDACBUFF_CNP2,                    0x8A},
+	{WCD938X_RX_BIAS_HPH_RDAC_LDO,                         0x88},
+	{WCD938X_RX_BIAS_HPH_CNP1,                             0x82},
+	{WCD938X_RX_BIAS_HPH_LOWPOWER,                         0x82},
+	{WCD938X_RX_BIAS_AUX_DAC,                              0xA0},
+	{WCD938X_RX_BIAS_AUX_AMP,                              0xAA},
+	{WCD938X_RX_BIAS_VNEGDAC_BLEEDER,                      0x50},
+	{WCD938X_RX_BIAS_MISC,                                 0x00},
+	{WCD938X_RX_BIAS_BUCK_RST,                             0x08},
+	{WCD938X_RX_BIAS_BUCK_VREF_ERRAMP,                     0x44},
+	{WCD938X_RX_BIAS_FLYB_ERRAMP,                          0x40},
+	{WCD938X_RX_BIAS_FLYB_BUFF,                            0xAA},
+	{WCD938X_RX_BIAS_FLYB_MID_RST,                         0x14},
+	{WCD938X_HPH_L_STATUS,                                 0x04},
+	{WCD938X_HPH_R_STATUS,                                 0x04},
+	{WCD938X_HPH_CNP_EN,                                   0x80},
+	{WCD938X_HPH_CNP_WG_CTL,                               0x9A},
+	{WCD938X_HPH_CNP_WG_TIME,                              0x14},
+	{WCD938X_HPH_OCP_CTL,                                  0x28},
+	{WCD938X_HPH_AUTO_CHOP,                                0x16},
+	{WCD938X_HPH_CHOP_CTL,                                 0x83},
+	{WCD938X_HPH_PA_CTL1,                                  0x46},
+	{WCD938X_HPH_PA_CTL2,                                  0x50},
+	{WCD938X_HPH_L_EN,                                     0x80},
+	{WCD938X_HPH_L_TEST,                                   0xE0},
+	{WCD938X_HPH_L_ATEST,                                  0x50},
+	{WCD938X_HPH_R_EN,                                     0x80},
+	{WCD938X_HPH_R_TEST,                                   0xE0},
+	{WCD938X_HPH_R_ATEST,                                  0x54},
+	{WCD938X_HPH_RDAC_CLK_CTL1,                            0x99},
+	{WCD938X_HPH_RDAC_CLK_CTL2,                            0x9B},
+	{WCD938X_HPH_RDAC_LDO_CTL,                             0x33},
+	{WCD938X_HPH_RDAC_CHOP_CLK_LP_CTL,                     0x00},
+	{WCD938X_HPH_REFBUFF_UHQA_CTL,                         0x68},
+	{WCD938X_HPH_REFBUFF_LP_CTL,                           0x0E},
+	{WCD938X_HPH_L_DAC_CTL,                                0x20},
+	{WCD938X_HPH_R_DAC_CTL,                                0x20},
+	{WCD938X_HPH_SURGE_HPHLR_SURGE_COMP_SEL,               0x55},
+	{WCD938X_HPH_SURGE_HPHLR_SURGE_EN,                     0x19},
+	{WCD938X_HPH_SURGE_HPHLR_SURGE_MISC1,                  0xA0},
+	{WCD938X_HPH_SURGE_HPHLR_SURGE_STATUS,                 0x00},
+	{WCD938X_EAR_EAR_EN_REG,                               0x22},
+	{WCD938X_EAR_EAR_PA_CON,                               0x44},
+	{WCD938X_EAR_EAR_SP_CON,                               0xDB},
+	{WCD938X_EAR_EAR_DAC_CON,                              0x80},
+	{WCD938X_EAR_EAR_CNP_FSM_CON,                          0xB2},
+	{WCD938X_EAR_TEST_CTL,                                 0x00},
+	{WCD938X_EAR_STATUS_REG_1,                             0x00},
+	{WCD938X_EAR_STATUS_REG_2,                             0x08},
+	{WCD938X_ANA_NEW_PAGE_REGISTER,                        0x00},
+	{WCD938X_HPH_NEW_ANA_HPH2,                             0x00},
+	{WCD938X_HPH_NEW_ANA_HPH3,                             0x00},
+	{WCD938X_SLEEP_CTL,                                    0x16},
+	{WCD938X_SLEEP_WATCHDOG_CTL,                           0x00},
+	{WCD938X_MBHC_NEW_ELECT_REM_CLAMP_CTL,                 0x00},
+	{WCD938X_MBHC_NEW_CTL_1,                               0x02},
+	{WCD938X_MBHC_NEW_CTL_2,                               0x05},
+	{WCD938X_MBHC_NEW_PLUG_DETECT_CTL,                     0xE9},
+	{WCD938X_MBHC_NEW_ZDET_ANA_CTL,                        0x0F},
+	{WCD938X_MBHC_NEW_ZDET_RAMP_CTL,                       0x00},
+	{WCD938X_MBHC_NEW_FSM_STATUS,                          0x00},
+	{WCD938X_MBHC_NEW_ADC_RESULT,                          0x00},
+	{WCD938X_TX_NEW_AMIC_MUX_CFG,                          0x00},
+	{WCD938X_AUX_AUXPA,                                    0x00},
+	{WCD938X_LDORXTX_MODE,                                 0x0C},
+	{WCD938X_LDORXTX_CONFIG,                               0x10},
+	{WCD938X_DIE_CRACK_DIE_CRK_DET_EN,                     0x00},
+	{WCD938X_DIE_CRACK_DIE_CRK_DET_OUT,                    0x00},
+	{WCD938X_HPH_NEW_INT_RDAC_GAIN_CTL,                    0x40},
+	{WCD938X_HPH_NEW_INT_RDAC_HD2_CTL_L,                   0x81},
+	{WCD938X_HPH_NEW_INT_RDAC_VREF_CTL,                    0x10},
+	{WCD938X_HPH_NEW_INT_RDAC_OVERRIDE_CTL,                0x00},
+	{WCD938X_HPH_NEW_INT_RDAC_HD2_CTL_R,                   0x81},
+	{WCD938X_HPH_NEW_INT_PA_MISC1,                         0x22},
+	{WCD938X_HPH_NEW_INT_PA_MISC2,                         0x00},
+	{WCD938X_HPH_NEW_INT_PA_RDAC_MISC,                     0x00},
+	{WCD938X_HPH_NEW_INT_HPH_TIMER1,                       0xFE},
+	{WCD938X_HPH_NEW_INT_HPH_TIMER2,                       0x02},
+	{WCD938X_HPH_NEW_INT_HPH_TIMER3,                       0x4E},
+	{WCD938X_HPH_NEW_INT_HPH_TIMER4,                       0x54},
+	{WCD938X_HPH_NEW_INT_PA_RDAC_MISC2,                    0x00},
+	{WCD938X_HPH_NEW_INT_PA_RDAC_MISC3,                    0x00},
+	{WCD938X_HPH_NEW_INT_RDAC_HD2_CTL_L_NEW,               0x90},
+	{WCD938X_HPH_NEW_INT_RDAC_HD2_CTL_R_NEW,               0x90},
+	{WCD938X_RX_NEW_INT_HPH_RDAC_BIAS_LOHIFI,              0x62},
+	{WCD938X_RX_NEW_INT_HPH_RDAC_BIAS_ULP,                 0x01},
+	{WCD938X_RX_NEW_INT_HPH_RDAC_LDO_LP,                   0x11},
+	{WCD938X_MBHC_NEW_INT_MOISTURE_DET_DC_CTRL,            0x57},
+	{WCD938X_MBHC_NEW_INT_MOISTURE_DET_POLLING_CTRL,       0x01},
+	{WCD938X_MBHC_NEW_INT_MECH_DET_CURRENT,                0x00},
+	{WCD938X_MBHC_NEW_INT_SPARE_2,                         0x00},
+	{WCD938X_EAR_INT_NEW_EAR_CHOPPER_CON,                  0xA8},
+	{WCD938X_EAR_INT_NEW_CNP_VCM_CON1,                     0x42},
+	{WCD938X_EAR_INT_NEW_CNP_VCM_CON2,                     0x22},
+	{WCD938X_EAR_INT_NEW_EAR_DYNAMIC_BIAS,                 0x00},
+	{WCD938X_AUX_INT_EN_REG,                               0x00},
+	{WCD938X_AUX_INT_PA_CTRL,                              0x06},
+	{WCD938X_AUX_INT_SP_CTRL,                              0xD2},
+	{WCD938X_AUX_INT_DAC_CTRL,                             0x80},
+	{WCD938X_AUX_INT_CLK_CTRL,                             0x50},
+	{WCD938X_AUX_INT_TEST_CTRL,                            0x00},
+	{WCD938X_AUX_INT_STATUS_REG,                           0x00},
+	{WCD938X_AUX_INT_MISC,                                 0x00},
+	{WCD938X_LDORXTX_INT_BIAS,                             0x6E},
+	{WCD938X_LDORXTX_INT_STB_LOADS_DTEST,                  0x50},
+	{WCD938X_LDORXTX_INT_TEST0,                            0x1C},
+	{WCD938X_LDORXTX_INT_STARTUP_TIMER,                    0xFF},
+	{WCD938X_LDORXTX_INT_TEST1,                            0x1F},
+	{WCD938X_LDORXTX_INT_STATUS,                           0x00},
+	{WCD938X_SLEEP_INT_WATCHDOG_CTL_1,                     0x0A},
+	{WCD938X_SLEEP_INT_WATCHDOG_CTL_2,                     0x0A},
+	{WCD938X_DIE_CRACK_INT_DIE_CRK_DET_INT1,               0x02},
+	{WCD938X_DIE_CRACK_INT_DIE_CRK_DET_INT2,               0x60},
+	{WCD938X_TX_COM_NEW_INT_TXFE_DIVSTOP_L2,               0xFF},
+	{WCD938X_TX_COM_NEW_INT_TXFE_DIVSTOP_L1,               0x7F},
+	{WCD938X_TX_COM_NEW_INT_TXFE_DIVSTOP_L0,               0x3F},
+	{WCD938X_TX_COM_NEW_INT_TXFE_DIVSTOP_ULP1P2M,          0x1F},
+	{WCD938X_TX_COM_NEW_INT_TXFE_DIVSTOP_ULP0P6M,          0x0F},
+	{WCD938X_TX_COM_NEW_INT_TXFE_ICTRL_STG1_L2L1,          0xD7},
+	{WCD938X_TX_COM_NEW_INT_TXFE_ICTRL_STG1_L0,            0xC8},
+	{WCD938X_TX_COM_NEW_INT_TXFE_ICTRL_STG1_ULP,           0xC6},
+	{WCD938X_TX_COM_NEW_INT_TXFE_ICTRL_STG2MAIN_L2L1,      0xD5},
+	{WCD938X_TX_COM_NEW_INT_TXFE_ICTRL_STG2MAIN_L0,        0xCA},
+	{WCD938X_TX_COM_NEW_INT_TXFE_ICTRL_STG2MAIN_ULP,       0x05},
+	{WCD938X_TX_COM_NEW_INT_TXFE_ICTRL_STG2CASC_L2L1L0,    0xA5},
+	{WCD938X_TX_COM_NEW_INT_TXFE_ICTRL_STG2CASC_ULP,       0x13},
+	{WCD938X_TX_COM_NEW_INT_TXADC_SCBIAS_L2L1,             0x88},
+	{WCD938X_TX_COM_NEW_INT_TXADC_SCBIAS_L0ULP,            0x42},
+	{WCD938X_TX_COM_NEW_INT_TXADC_INT_L2,                  0xFF},
+	{WCD938X_TX_COM_NEW_INT_TXADC_INT_L1,                  0x64},
+	{WCD938X_TX_COM_NEW_INT_TXADC_INT_L0,                  0x64},
+	{WCD938X_TX_COM_NEW_INT_TXADC_INT_ULP,                 0x77},
+	{WCD938X_DIGITAL_PAGE_REGISTER,                        0x00},
+	{WCD938X_DIGITAL_CHIP_ID0,                             0x00},
+	{WCD938X_DIGITAL_CHIP_ID1,                             0x00},
+	{WCD938X_DIGITAL_CHIP_ID2,                             0x0D},
+	{WCD938X_DIGITAL_CHIP_ID3,                             0x01},
+	{WCD938X_DIGITAL_SWR_TX_CLK_RATE,                      0x00},
+	{WCD938X_DIGITAL_CDC_RST_CTL,                          0x03},
+	{WCD938X_DIGITAL_TOP_CLK_CFG,                          0x00},
+	{WCD938X_DIGITAL_CDC_ANA_CLK_CTL,                      0x00},
+	{WCD938X_DIGITAL_CDC_DIG_CLK_CTL,                      0xF0},
+	{WCD938X_DIGITAL_SWR_RST_EN,                           0x00},
+	{WCD938X_DIGITAL_CDC_PATH_MODE,                        0x55},
+	{WCD938X_DIGITAL_CDC_RX_RST,                           0x00},
+	{WCD938X_DIGITAL_CDC_RX0_CTL,                          0xFC},
+	{WCD938X_DIGITAL_CDC_RX1_CTL,                          0xFC},
+	{WCD938X_DIGITAL_CDC_RX2_CTL,                          0xFC},
+	{WCD938X_DIGITAL_CDC_TX_ANA_MODE_0_1,                  0x00},
+	{WCD938X_DIGITAL_CDC_TX_ANA_MODE_2_3,                  0x00},
+	{WCD938X_DIGITAL_CDC_COMP_CTL_0,                       0x00},
+	{WCD938X_DIGITAL_CDC_ANA_TX_CLK_CTL,                   0x1E},
+	{WCD938X_DIGITAL_CDC_HPH_DSM_A1_0,                     0x00},
+	{WCD938X_DIGITAL_CDC_HPH_DSM_A1_1,                     0x01},
+	{WCD938X_DIGITAL_CDC_HPH_DSM_A2_0,                     0x63},
+	{WCD938X_DIGITAL_CDC_HPH_DSM_A2_1,                     0x04},
+	{WCD938X_DIGITAL_CDC_HPH_DSM_A3_0,                     0xAC},
+	{WCD938X_DIGITAL_CDC_HPH_DSM_A3_1,                     0x04},
+	{WCD938X_DIGITAL_CDC_HPH_DSM_A4_0,                     0x1A},
+	{WCD938X_DIGITAL_CDC_HPH_DSM_A4_1,                     0x03},
+	{WCD938X_DIGITAL_CDC_HPH_DSM_A5_0,                     0xBC},
+	{WCD938X_DIGITAL_CDC_HPH_DSM_A5_1,                     0x02},
+	{WCD938X_DIGITAL_CDC_HPH_DSM_A6_0,                     0xC7},
+	{WCD938X_DIGITAL_CDC_HPH_DSM_A7_0,                     0xF8},
+	{WCD938X_DIGITAL_CDC_HPH_DSM_C_0,                      0x47},
+	{WCD938X_DIGITAL_CDC_HPH_DSM_C_1,                      0x43},
+	{WCD938X_DIGITAL_CDC_HPH_DSM_C_2,                      0xB1},
+	{WCD938X_DIGITAL_CDC_HPH_DSM_C_3,                      0x17},
+	{WCD938X_DIGITAL_CDC_HPH_DSM_R1,                       0x4D},
+	{WCD938X_DIGITAL_CDC_HPH_DSM_R2,                       0x29},
+	{WCD938X_DIGITAL_CDC_HPH_DSM_R3,                       0x34},
+	{WCD938X_DIGITAL_CDC_HPH_DSM_R4,                       0x59},
+	{WCD938X_DIGITAL_CDC_HPH_DSM_R5,                       0x66},
+	{WCD938X_DIGITAL_CDC_HPH_DSM_R6,                       0x87},
+	{WCD938X_DIGITAL_CDC_HPH_DSM_R7,                       0x64},
+	{WCD938X_DIGITAL_CDC_AUX_DSM_A1_0,                     0x00},
+	{WCD938X_DIGITAL_CDC_AUX_DSM_A1_1,                     0x01},
+	{WCD938X_DIGITAL_CDC_AUX_DSM_A2_0,                     0x96},
+	{WCD938X_DIGITAL_CDC_AUX_DSM_A2_1,                     0x09},
+	{WCD938X_DIGITAL_CDC_AUX_DSM_A3_0,                     0xAB},
+	{WCD938X_DIGITAL_CDC_AUX_DSM_A3_1,                     0x05},
+	{WCD938X_DIGITAL_CDC_AUX_DSM_A4_0,                     0x1C},
+	{WCD938X_DIGITAL_CDC_AUX_DSM_A4_1,                     0x02},
+	{WCD938X_DIGITAL_CDC_AUX_DSM_A5_0,                     0x17},
+	{WCD938X_DIGITAL_CDC_AUX_DSM_A5_1,                     0x02},
+	{WCD938X_DIGITAL_CDC_AUX_DSM_A6_0,                     0xAA},
+	{WCD938X_DIGITAL_CDC_AUX_DSM_A7_0,                     0xE3},
+	{WCD938X_DIGITAL_CDC_AUX_DSM_C_0,                      0x69},
+	{WCD938X_DIGITAL_CDC_AUX_DSM_C_1,                      0x54},
+	{WCD938X_DIGITAL_CDC_AUX_DSM_C_2,                      0x02},
+	{WCD938X_DIGITAL_CDC_AUX_DSM_C_3,                      0x15},
+	{WCD938X_DIGITAL_CDC_AUX_DSM_R1,                       0xA4},
+	{WCD938X_DIGITAL_CDC_AUX_DSM_R2,                       0xB5},
+	{WCD938X_DIGITAL_CDC_AUX_DSM_R3,                       0x86},
+	{WCD938X_DIGITAL_CDC_AUX_DSM_R4,                       0x85},
+	{WCD938X_DIGITAL_CDC_AUX_DSM_R5,                       0xAA},
+	{WCD938X_DIGITAL_CDC_AUX_DSM_R6,                       0xE2},
+	{WCD938X_DIGITAL_CDC_AUX_DSM_R7,                       0x62},
+	{WCD938X_DIGITAL_CDC_HPH_GAIN_RX_0,                    0x55},
+	{WCD938X_DIGITAL_CDC_HPH_GAIN_RX_1,                    0xA9},
+	{WCD938X_DIGITAL_CDC_HPH_GAIN_DSD_0,                   0x3D},
+	{WCD938X_DIGITAL_CDC_HPH_GAIN_DSD_1,                   0x2E},
+	{WCD938X_DIGITAL_CDC_HPH_GAIN_DSD_2,                   0x01},
+	{WCD938X_DIGITAL_CDC_AUX_GAIN_DSD_0,                   0x00},
+	{WCD938X_DIGITAL_CDC_AUX_GAIN_DSD_1,                   0xFC},
+	{WCD938X_DIGITAL_CDC_AUX_GAIN_DSD_2,                   0x01},
+	{WCD938X_DIGITAL_CDC_HPH_GAIN_CTL,                     0x00},
+	{WCD938X_DIGITAL_CDC_AUX_GAIN_CTL,                     0x00},
+	{WCD938X_DIGITAL_CDC_EAR_PATH_CTL,                     0x00},
+	{WCD938X_DIGITAL_CDC_SWR_CLH,                          0x00},
+	{WCD938X_DIGITAL_SWR_CLH_BYP,                          0x00},
+	{WCD938X_DIGITAL_CDC_TX0_CTL,                          0x68},
+	{WCD938X_DIGITAL_CDC_TX1_CTL,                          0x68},
+	{WCD938X_DIGITAL_CDC_TX2_CTL,                          0x68},
+	{WCD938X_DIGITAL_CDC_TX_RST,                           0x00},
+	{WCD938X_DIGITAL_CDC_REQ_CTL,                          0x01},
+	{WCD938X_DIGITAL_CDC_RST,                              0x00},
+	{WCD938X_DIGITAL_CDC_AMIC_CTL,                         0x0F},
+	{WCD938X_DIGITAL_CDC_DMIC_CTL,                         0x04},
+	{WCD938X_DIGITAL_CDC_DMIC1_CTL,                        0x01},
+	{WCD938X_DIGITAL_CDC_DMIC2_CTL,                        0x01},
+	{WCD938X_DIGITAL_CDC_DMIC3_CTL,                        0x01},
+	{WCD938X_DIGITAL_CDC_DMIC4_CTL,                        0x01},
+	{WCD938X_DIGITAL_EFUSE_PRG_CTL,                        0x00},
+	{WCD938X_DIGITAL_EFUSE_CTL,                            0x2B},
+	{WCD938X_DIGITAL_CDC_DMIC_RATE_1_2,                    0x11},
+	{WCD938X_DIGITAL_CDC_DMIC_RATE_3_4,                    0x11},
+	{WCD938X_DIGITAL_PDM_WD_CTL0,                          0x00},
+	{WCD938X_DIGITAL_PDM_WD_CTL1,                          0x00},
+	{WCD938X_DIGITAL_PDM_WD_CTL2,                          0x00},
+	{WCD938X_DIGITAL_INTR_MODE,                            0x00},
+	{WCD938X_DIGITAL_INTR_MASK_0,                          0xFF},
+	{WCD938X_DIGITAL_INTR_MASK_1,                          0xFF},
+	{WCD938X_DIGITAL_INTR_MASK_2,                          0x3F},
+	{WCD938X_DIGITAL_INTR_STATUS_0,                        0x00},
+	{WCD938X_DIGITAL_INTR_STATUS_1,                        0x00},
+	{WCD938X_DIGITAL_INTR_STATUS_2,                        0x00},
+	{WCD938X_DIGITAL_INTR_CLEAR_0,                         0x00},
+	{WCD938X_DIGITAL_INTR_CLEAR_1,                         0x00},
+	{WCD938X_DIGITAL_INTR_CLEAR_2,                         0x00},
+	{WCD938X_DIGITAL_INTR_LEVEL_0,                         0x00},
+	{WCD938X_DIGITAL_INTR_LEVEL_1,                         0x00},
+	{WCD938X_DIGITAL_INTR_LEVEL_2,                         0x00},
+	{WCD938X_DIGITAL_INTR_SET_0,                           0x00},
+	{WCD938X_DIGITAL_INTR_SET_1,                           0x00},
+	{WCD938X_DIGITAL_INTR_SET_2,                           0x00},
+	{WCD938X_DIGITAL_INTR_TEST_0,                          0x00},
+	{WCD938X_DIGITAL_INTR_TEST_1,                          0x00},
+	{WCD938X_DIGITAL_INTR_TEST_2,                          0x00},
+	{WCD938X_DIGITAL_TX_MODE_DBG_EN,                       0x00},
+	{WCD938X_DIGITAL_TX_MODE_DBG_0_1,                      0x00},
+	{WCD938X_DIGITAL_TX_MODE_DBG_2_3,                      0x00},
+	{WCD938X_DIGITAL_LB_IN_SEL_CTL,                        0x00},
+	{WCD938X_DIGITAL_LOOP_BACK_MODE,                       0x00},
+	{WCD938X_DIGITAL_SWR_DAC_TEST,                         0x00},
+	{WCD938X_DIGITAL_SWR_HM_TEST_RX_0,                     0x40},
+	{WCD938X_DIGITAL_SWR_HM_TEST_TX_0,                     0x40},
+	{WCD938X_DIGITAL_SWR_HM_TEST_RX_1,                     0x00},
+	{WCD938X_DIGITAL_SWR_HM_TEST_TX_1,                     0x00},
+	{WCD938X_DIGITAL_SWR_HM_TEST_TX_2,                     0x00},
+	{WCD938X_DIGITAL_SWR_HM_TEST_0,                        0x00},
+	{WCD938X_DIGITAL_SWR_HM_TEST_1,                        0x00},
+	{WCD938X_DIGITAL_PAD_CTL_SWR_0,                        0x8F},
+	{WCD938X_DIGITAL_PAD_CTL_SWR_1,                        0x06},
+	{WCD938X_DIGITAL_I2C_CTL,                              0x00},
+	{WCD938X_DIGITAL_CDC_TX_TANGGU_SW_MODE,                0x00},
+	{WCD938X_DIGITAL_EFUSE_TEST_CTL_0,                     0x00},
+	{WCD938X_DIGITAL_EFUSE_TEST_CTL_1,                     0x00},
+	{WCD938X_DIGITAL_EFUSE_T_DATA_0,                       0x00},
+	{WCD938X_DIGITAL_EFUSE_T_DATA_1,                       0x00},
+	{WCD938X_DIGITAL_PAD_CTL_PDM_RX0,                      0xF1},
+	{WCD938X_DIGITAL_PAD_CTL_PDM_RX1,                      0xF1},
+	{WCD938X_DIGITAL_PAD_CTL_PDM_TX0,                      0xF1},
+	{WCD938X_DIGITAL_PAD_CTL_PDM_TX1,                      0xF1},
+	{WCD938X_DIGITAL_PAD_CTL_PDM_TX2,                      0xF1},
+	{WCD938X_DIGITAL_PAD_INP_DIS_0,                        0x00},
+	{WCD938X_DIGITAL_PAD_INP_DIS_1,                        0x00},
+	{WCD938X_DIGITAL_DRIVE_STRENGTH_0,                     0x00},
+	{WCD938X_DIGITAL_DRIVE_STRENGTH_1,                     0x00},
+	{WCD938X_DIGITAL_DRIVE_STRENGTH_2,                     0x00},
+	{WCD938X_DIGITAL_RX_DATA_EDGE_CTL,                     0x1F},
+	{WCD938X_DIGITAL_TX_DATA_EDGE_CTL,                     0x80},
+	{WCD938X_DIGITAL_GPIO_MODE,                            0x00},
+	{WCD938X_DIGITAL_PIN_CTL_OE,                           0x00},
+	{WCD938X_DIGITAL_PIN_CTL_DATA_0,                       0x00},
+	{WCD938X_DIGITAL_PIN_CTL_DATA_1,                       0x00},
+	{WCD938X_DIGITAL_PIN_STATUS_0,                         0x00},
+	{WCD938X_DIGITAL_PIN_STATUS_1,                         0x00},
+	{WCD938X_DIGITAL_DIG_DEBUG_CTL,                        0x00},
+	{WCD938X_DIGITAL_DIG_DEBUG_EN,                         0x00},
+	{WCD938X_DIGITAL_ANA_CSR_DBG_ADD,                      0x00},
+	{WCD938X_DIGITAL_ANA_CSR_DBG_CTL,                      0x48},
+	{WCD938X_DIGITAL_SSP_DBG,                              0x00},
+	{WCD938X_DIGITAL_MODE_STATUS_0,                        0x00},
+	{WCD938X_DIGITAL_MODE_STATUS_1,                        0x00},
+	{WCD938X_DIGITAL_SPARE_0,                              0x00},
+	{WCD938X_DIGITAL_SPARE_1,                              0x00},
+	{WCD938X_DIGITAL_SPARE_2,                              0x00},
+	{WCD938X_DIGITAL_EFUSE_REG_0,                          0x00},
+	{WCD938X_DIGITAL_EFUSE_REG_1,                          0xFF},
+	{WCD938X_DIGITAL_EFUSE_REG_2,                          0xFF},
+	{WCD938X_DIGITAL_EFUSE_REG_3,                          0xFF},
+	{WCD938X_DIGITAL_EFUSE_REG_4,                          0xFF},
+	{WCD938X_DIGITAL_EFUSE_REG_5,                          0xFF},
+	{WCD938X_DIGITAL_EFUSE_REG_6,                          0xFF},
+	{WCD938X_DIGITAL_EFUSE_REG_7,                          0xFF},
+	{WCD938X_DIGITAL_EFUSE_REG_8,                          0xFF},
+	{WCD938X_DIGITAL_EFUSE_REG_9,                          0xFF},
+	{WCD938X_DIGITAL_EFUSE_REG_10,                         0xFF},
+	{WCD938X_DIGITAL_EFUSE_REG_11,                         0xFF},
+	{WCD938X_DIGITAL_EFUSE_REG_12,                         0xFF},
+	{WCD938X_DIGITAL_EFUSE_REG_13,                         0xFF},
+	{WCD938X_DIGITAL_EFUSE_REG_14,                         0xFF},
+	{WCD938X_DIGITAL_EFUSE_REG_15,                         0xFF},
+	{WCD938X_DIGITAL_EFUSE_REG_16,                         0xFF},
+	{WCD938X_DIGITAL_EFUSE_REG_17,                         0xFF},
+	{WCD938X_DIGITAL_EFUSE_REG_18,                         0xFF},
+	{WCD938X_DIGITAL_EFUSE_REG_19,                         0xFF},
+	{WCD938X_DIGITAL_EFUSE_REG_20,                         0x0E},
+	{WCD938X_DIGITAL_EFUSE_REG_21,                         0x00},
+	{WCD938X_DIGITAL_EFUSE_REG_22,                         0x00},
+	{WCD938X_DIGITAL_EFUSE_REG_23,                         0xF8},
+	{WCD938X_DIGITAL_EFUSE_REG_24,                         0x16},
+	{WCD938X_DIGITAL_EFUSE_REG_25,                         0x00},
+	{WCD938X_DIGITAL_EFUSE_REG_26,                         0x00},
+	{WCD938X_DIGITAL_EFUSE_REG_27,                         0x00},
+	{WCD938X_DIGITAL_EFUSE_REG_28,                         0x00},
+	{WCD938X_DIGITAL_EFUSE_REG_29,                         0x00},
+	{WCD938X_DIGITAL_EFUSE_REG_30,                         0x00},
+	{WCD938X_DIGITAL_EFUSE_REG_31,                         0x00},
+	{WCD938X_DIGITAL_TX_REQ_FB_CTL_0,                      0x88},
+	{WCD938X_DIGITAL_TX_REQ_FB_CTL_1,                      0x88},
+	{WCD938X_DIGITAL_TX_REQ_FB_CTL_2,                      0x88},
+	{WCD938X_DIGITAL_TX_REQ_FB_CTL_3,                      0x88},
+	{WCD938X_DIGITAL_TX_REQ_FB_CTL_4,                      0x88},
+	{WCD938X_DIGITAL_DEM_BYPASS_DATA0,                     0x55},
+	{WCD938X_DIGITAL_DEM_BYPASS_DATA1,                     0x55},
+	{WCD938X_DIGITAL_DEM_BYPASS_DATA2,                     0x55},
+	{WCD938X_DIGITAL_DEM_BYPASS_DATA3,                     0x01},
+};
+
+static bool wcd938x_rdwr_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case WCD938X_ANA_PAGE_REGISTER:
+	case WCD938X_ANA_BIAS:
+	case WCD938X_ANA_RX_SUPPLIES:
+	case WCD938X_ANA_HPH:
+	case WCD938X_ANA_EAR:
+	case WCD938X_ANA_EAR_COMPANDER_CTL:
+	case WCD938X_ANA_TX_CH1:
+	case WCD938X_ANA_TX_CH2:
+	case WCD938X_ANA_TX_CH3:
+	case WCD938X_ANA_TX_CH4:
+	case WCD938X_ANA_MICB1_MICB2_DSP_EN_LOGIC:
+	case WCD938X_ANA_MICB3_DSP_EN_LOGIC:
+	case WCD938X_ANA_MBHC_MECH:
+	case WCD938X_ANA_MBHC_ELECT:
+	case WCD938X_ANA_MBHC_ZDET:
+	case WCD938X_ANA_MBHC_BTN0:
+	case WCD938X_ANA_MBHC_BTN1:
+	case WCD938X_ANA_MBHC_BTN2:
+	case WCD938X_ANA_MBHC_BTN3:
+	case WCD938X_ANA_MBHC_BTN4:
+	case WCD938X_ANA_MBHC_BTN5:
+	case WCD938X_ANA_MBHC_BTN6:
+	case WCD938X_ANA_MBHC_BTN7:
+	case WCD938X_ANA_MICB1:
+	case WCD938X_ANA_MICB2:
+	case WCD938X_ANA_MICB2_RAMP:
+	case WCD938X_ANA_MICB3:
+	case WCD938X_ANA_MICB4:
+	case WCD938X_BIAS_CTL:
+	case WCD938X_BIAS_VBG_FINE_ADJ:
+	case WCD938X_LDOL_VDDCX_ADJUST:
+	case WCD938X_LDOL_DISABLE_LDOL:
+	case WCD938X_MBHC_CTL_CLK:
+	case WCD938X_MBHC_CTL_ANA:
+	case WCD938X_MBHC_CTL_SPARE_1:
+	case WCD938X_MBHC_CTL_SPARE_2:
+	case WCD938X_MBHC_CTL_BCS:
+	case WCD938X_MBHC_TEST_CTL:
+	case WCD938X_LDOH_MODE:
+	case WCD938X_LDOH_BIAS:
+	case WCD938X_LDOH_STB_LOADS:
+	case WCD938X_LDOH_SLOWRAMP:
+	case WCD938X_MICB1_TEST_CTL_1:
+	case WCD938X_MICB1_TEST_CTL_2:
+	case WCD938X_MICB1_TEST_CTL_3:
+	case WCD938X_MICB2_TEST_CTL_1:
+	case WCD938X_MICB2_TEST_CTL_2:
+	case WCD938X_MICB2_TEST_CTL_3:
+	case WCD938X_MICB3_TEST_CTL_1:
+	case WCD938X_MICB3_TEST_CTL_2:
+	case WCD938X_MICB3_TEST_CTL_3:
+	case WCD938X_MICB4_TEST_CTL_1:
+	case WCD938X_MICB4_TEST_CTL_2:
+	case WCD938X_MICB4_TEST_CTL_3:
+	case WCD938X_TX_COM_ADC_VCM:
+	case WCD938X_TX_COM_BIAS_ATEST:
+	case WCD938X_TX_COM_SPARE1:
+	case WCD938X_TX_COM_SPARE2:
+	case WCD938X_TX_COM_TXFE_DIV_CTL:
+	case WCD938X_TX_COM_TXFE_DIV_START:
+	case WCD938X_TX_COM_SPARE3:
+	case WCD938X_TX_COM_SPARE4:
+	case WCD938X_TX_1_2_TEST_EN:
+	case WCD938X_TX_1_2_ADC_IB:
+	case WCD938X_TX_1_2_ATEST_REFCTL:
+	case WCD938X_TX_1_2_TEST_CTL:
+	case WCD938X_TX_1_2_TEST_BLK_EN1:
+	case WCD938X_TX_1_2_TXFE1_CLKDIV:
+	case WCD938X_TX_3_4_TEST_EN:
+	case WCD938X_TX_3_4_ADC_IB:
+	case WCD938X_TX_3_4_ATEST_REFCTL:
+	case WCD938X_TX_3_4_TEST_CTL:
+	case WCD938X_TX_3_4_TEST_BLK_EN3:
+	case WCD938X_TX_3_4_TXFE3_CLKDIV:
+	case WCD938X_TX_3_4_TEST_BLK_EN2:
+	case WCD938X_TX_3_4_TXFE2_CLKDIV:
+	case WCD938X_TX_3_4_SPARE1:
+	case WCD938X_TX_3_4_TEST_BLK_EN4:
+	case WCD938X_TX_3_4_TXFE4_CLKDIV:
+	case WCD938X_TX_3_4_SPARE2:
+	case WCD938X_CLASSH_MODE_1:
+	case WCD938X_CLASSH_MODE_2:
+	case WCD938X_CLASSH_MODE_3:
+	case WCD938X_CLASSH_CTRL_VCL_1:
+	case WCD938X_CLASSH_CTRL_VCL_2:
+	case WCD938X_CLASSH_CTRL_CCL_1:
+	case WCD938X_CLASSH_CTRL_CCL_2:
+	case WCD938X_CLASSH_CTRL_CCL_3:
+	case WCD938X_CLASSH_CTRL_CCL_4:
+	case WCD938X_CLASSH_CTRL_CCL_5:
+	case WCD938X_CLASSH_BUCK_TMUX_A_D:
+	case WCD938X_CLASSH_BUCK_SW_DRV_CNTL:
+	case WCD938X_CLASSH_SPARE:
+	case WCD938X_FLYBACK_EN:
+	case WCD938X_FLYBACK_VNEG_CTRL_1:
+	case WCD938X_FLYBACK_VNEG_CTRL_2:
+	case WCD938X_FLYBACK_VNEG_CTRL_3:
+	case WCD938X_FLYBACK_VNEG_CTRL_4:
+	case WCD938X_FLYBACK_VNEG_CTRL_5:
+	case WCD938X_FLYBACK_VNEG_CTRL_6:
+	case WCD938X_FLYBACK_VNEG_CTRL_7:
+	case WCD938X_FLYBACK_VNEG_CTRL_8:
+	case WCD938X_FLYBACK_VNEG_CTRL_9:
+	case WCD938X_FLYBACK_VNEGDAC_CTRL_1:
+	case WCD938X_FLYBACK_VNEGDAC_CTRL_2:
+	case WCD938X_FLYBACK_VNEGDAC_CTRL_3:
+	case WCD938X_FLYBACK_CTRL_1:
+	case WCD938X_FLYBACK_TEST_CTL:
+	case WCD938X_RX_AUX_SW_CTL:
+	case WCD938X_RX_PA_AUX_IN_CONN:
+	case WCD938X_RX_TIMER_DIV:
+	case WCD938X_RX_OCP_CTL:
+	case WCD938X_RX_OCP_COUNT:
+	case WCD938X_RX_BIAS_EAR_DAC:
+	case WCD938X_RX_BIAS_EAR_AMP:
+	case WCD938X_RX_BIAS_HPH_LDO:
+	case WCD938X_RX_BIAS_HPH_PA:
+	case WCD938X_RX_BIAS_HPH_RDACBUFF_CNP2:
+	case WCD938X_RX_BIAS_HPH_RDAC_LDO:
+	case WCD938X_RX_BIAS_HPH_CNP1:
+	case WCD938X_RX_BIAS_HPH_LOWPOWER:
+	case WCD938X_RX_BIAS_AUX_DAC:
+	case WCD938X_RX_BIAS_AUX_AMP:
+	case WCD938X_RX_BIAS_VNEGDAC_BLEEDER:
+	case WCD938X_RX_BIAS_MISC:
+	case WCD938X_RX_BIAS_BUCK_RST:
+	case WCD938X_RX_BIAS_BUCK_VREF_ERRAMP:
+	case WCD938X_RX_BIAS_FLYB_ERRAMP:
+	case WCD938X_RX_BIAS_FLYB_BUFF:
+	case WCD938X_RX_BIAS_FLYB_MID_RST:
+	case WCD938X_HPH_CNP_EN:
+	case WCD938X_HPH_CNP_WG_CTL:
+	case WCD938X_HPH_CNP_WG_TIME:
+	case WCD938X_HPH_OCP_CTL:
+	case WCD938X_HPH_AUTO_CHOP:
+	case WCD938X_HPH_CHOP_CTL:
+	case WCD938X_HPH_PA_CTL1:
+	case WCD938X_HPH_PA_CTL2:
+	case WCD938X_HPH_L_EN:
+	case WCD938X_HPH_L_TEST:
+	case WCD938X_HPH_L_ATEST:
+	case WCD938X_HPH_R_EN:
+	case WCD938X_HPH_R_TEST:
+	case WCD938X_HPH_R_ATEST:
+	case WCD938X_HPH_RDAC_CLK_CTL1:
+	case WCD938X_HPH_RDAC_CLK_CTL2:
+	case WCD938X_HPH_RDAC_LDO_CTL:
+	case WCD938X_HPH_RDAC_CHOP_CLK_LP_CTL:
+	case WCD938X_HPH_REFBUFF_UHQA_CTL:
+	case WCD938X_HPH_REFBUFF_LP_CTL:
+	case WCD938X_HPH_L_DAC_CTL:
+	case WCD938X_HPH_R_DAC_CTL:
+	case WCD938X_HPH_SURGE_HPHLR_SURGE_COMP_SEL:
+	case WCD938X_HPH_SURGE_HPHLR_SURGE_EN:
+	case WCD938X_HPH_SURGE_HPHLR_SURGE_MISC1:
+	case WCD938X_EAR_EAR_EN_REG:
+	case WCD938X_EAR_EAR_PA_CON:
+	case WCD938X_EAR_EAR_SP_CON:
+	case WCD938X_EAR_EAR_DAC_CON:
+	case WCD938X_EAR_EAR_CNP_FSM_CON:
+	case WCD938X_EAR_TEST_CTL:
+	case WCD938X_ANA_NEW_PAGE_REGISTER:
+	case WCD938X_HPH_NEW_ANA_HPH2:
+	case WCD938X_HPH_NEW_ANA_HPH3:
+	case WCD938X_SLEEP_CTL:
+	case WCD938X_SLEEP_WATCHDOG_CTL:
+	case WCD938X_MBHC_NEW_ELECT_REM_CLAMP_CTL:
+	case WCD938X_MBHC_NEW_CTL_1:
+	case WCD938X_MBHC_NEW_CTL_2:
+	case WCD938X_MBHC_NEW_PLUG_DETECT_CTL:
+	case WCD938X_MBHC_NEW_ZDET_ANA_CTL:
+	case WCD938X_MBHC_NEW_ZDET_RAMP_CTL:
+	case WCD938X_TX_NEW_AMIC_MUX_CFG:
+	case WCD938X_AUX_AUXPA:
+	case WCD938X_LDORXTX_MODE:
+	case WCD938X_LDORXTX_CONFIG:
+	case WCD938X_DIE_CRACK_DIE_CRK_DET_EN:
+	case WCD938X_HPH_NEW_INT_RDAC_GAIN_CTL:
+	case WCD938X_HPH_NEW_INT_RDAC_HD2_CTL_L:
+	case WCD938X_HPH_NEW_INT_RDAC_VREF_CTL:
+	case WCD938X_HPH_NEW_INT_RDAC_OVERRIDE_CTL:
+	case WCD938X_HPH_NEW_INT_RDAC_HD2_CTL_R:
+	case WCD938X_HPH_NEW_INT_PA_MISC1:
+	case WCD938X_HPH_NEW_INT_PA_MISC2:
+	case WCD938X_HPH_NEW_INT_PA_RDAC_MISC:
+	case WCD938X_HPH_NEW_INT_HPH_TIMER1:
+	case WCD938X_HPH_NEW_INT_HPH_TIMER2:
+	case WCD938X_HPH_NEW_INT_HPH_TIMER3:
+	case WCD938X_HPH_NEW_INT_HPH_TIMER4:
+	case WCD938X_HPH_NEW_INT_PA_RDAC_MISC2:
+	case WCD938X_HPH_NEW_INT_PA_RDAC_MISC3:
+	case WCD938X_HPH_NEW_INT_RDAC_HD2_CTL_L_NEW:
+	case WCD938X_HPH_NEW_INT_RDAC_HD2_CTL_R_NEW:
+	case WCD938X_RX_NEW_INT_HPH_RDAC_BIAS_LOHIFI:
+	case WCD938X_RX_NEW_INT_HPH_RDAC_BIAS_ULP:
+	case WCD938X_RX_NEW_INT_HPH_RDAC_LDO_LP:
+	case WCD938X_MBHC_NEW_INT_MOISTURE_DET_DC_CTRL:
+	case WCD938X_MBHC_NEW_INT_MOISTURE_DET_POLLING_CTRL:
+	case WCD938X_MBHC_NEW_INT_MECH_DET_CURRENT:
+	case WCD938X_MBHC_NEW_INT_SPARE_2:
+	case WCD938X_EAR_INT_NEW_EAR_CHOPPER_CON:
+	case WCD938X_EAR_INT_NEW_CNP_VCM_CON1:
+	case WCD938X_EAR_INT_NEW_CNP_VCM_CON2:
+	case WCD938X_EAR_INT_NEW_EAR_DYNAMIC_BIAS:
+	case WCD938X_AUX_INT_EN_REG:
+	case WCD938X_AUX_INT_PA_CTRL:
+	case WCD938X_AUX_INT_SP_CTRL:
+	case WCD938X_AUX_INT_DAC_CTRL:
+	case WCD938X_AUX_INT_CLK_CTRL:
+	case WCD938X_AUX_INT_TEST_CTRL:
+	case WCD938X_AUX_INT_MISC:
+	case WCD938X_LDORXTX_INT_BIAS:
+	case WCD938X_LDORXTX_INT_STB_LOADS_DTEST:
+	case WCD938X_LDORXTX_INT_TEST0:
+	case WCD938X_LDORXTX_INT_STARTUP_TIMER:
+	case WCD938X_LDORXTX_INT_TEST1:
+	case WCD938X_SLEEP_INT_WATCHDOG_CTL_1:
+	case WCD938X_SLEEP_INT_WATCHDOG_CTL_2:
+	case WCD938X_DIE_CRACK_INT_DIE_CRK_DET_INT1:
+	case WCD938X_DIE_CRACK_INT_DIE_CRK_DET_INT2:
+	case WCD938X_TX_COM_NEW_INT_TXFE_DIVSTOP_L2:
+	case WCD938X_TX_COM_NEW_INT_TXFE_DIVSTOP_L1:
+	case WCD938X_TX_COM_NEW_INT_TXFE_DIVSTOP_L0:
+	case WCD938X_TX_COM_NEW_INT_TXFE_DIVSTOP_ULP1P2M:
+	case WCD938X_TX_COM_NEW_INT_TXFE_DIVSTOP_ULP0P6M:
+	case WCD938X_TX_COM_NEW_INT_TXFE_ICTRL_STG1_L2L1:
+	case WCD938X_TX_COM_NEW_INT_TXFE_ICTRL_STG1_L0:
+	case WCD938X_TX_COM_NEW_INT_TXFE_ICTRL_STG1_ULP:
+	case WCD938X_TX_COM_NEW_INT_TXFE_ICTRL_STG2MAIN_L2L1:
+	case WCD938X_TX_COM_NEW_INT_TXFE_ICTRL_STG2MAIN_L0:
+	case WCD938X_TX_COM_NEW_INT_TXFE_ICTRL_STG2MAIN_ULP:
+	case WCD938X_TX_COM_NEW_INT_TXFE_ICTRL_STG2CASC_L2L1L0:
+	case WCD938X_TX_COM_NEW_INT_TXFE_ICTRL_STG2CASC_ULP:
+	case WCD938X_TX_COM_NEW_INT_TXADC_SCBIAS_L2L1:
+	case WCD938X_TX_COM_NEW_INT_TXADC_SCBIAS_L0ULP:
+	case WCD938X_TX_COM_NEW_INT_TXADC_INT_L2:
+	case WCD938X_TX_COM_NEW_INT_TXADC_INT_L1:
+	case WCD938X_TX_COM_NEW_INT_TXADC_INT_L0:
+	case WCD938X_TX_COM_NEW_INT_TXADC_INT_ULP:
+	case WCD938X_DIGITAL_PAGE_REGISTER:
+	case WCD938X_DIGITAL_SWR_TX_CLK_RATE:
+	case WCD938X_DIGITAL_CDC_RST_CTL:
+	case WCD938X_DIGITAL_TOP_CLK_CFG:
+	case WCD938X_DIGITAL_CDC_ANA_CLK_CTL:
+	case WCD938X_DIGITAL_CDC_DIG_CLK_CTL:
+	case WCD938X_DIGITAL_SWR_RST_EN:
+	case WCD938X_DIGITAL_CDC_PATH_MODE:
+	case WCD938X_DIGITAL_CDC_RX_RST:
+	case WCD938X_DIGITAL_CDC_RX0_CTL:
+	case WCD938X_DIGITAL_CDC_RX1_CTL:
+	case WCD938X_DIGITAL_CDC_RX2_CTL:
+	case WCD938X_DIGITAL_CDC_TX_ANA_MODE_0_1:
+	case WCD938X_DIGITAL_CDC_TX_ANA_MODE_2_3:
+	case WCD938X_DIGITAL_CDC_COMP_CTL_0:
+	case WCD938X_DIGITAL_CDC_ANA_TX_CLK_CTL:
+	case WCD938X_DIGITAL_CDC_HPH_DSM_A1_0:
+	case WCD938X_DIGITAL_CDC_HPH_DSM_A1_1:
+	case WCD938X_DIGITAL_CDC_HPH_DSM_A2_0:
+	case WCD938X_DIGITAL_CDC_HPH_DSM_A2_1:
+	case WCD938X_DIGITAL_CDC_HPH_DSM_A3_0:
+	case WCD938X_DIGITAL_CDC_HPH_DSM_A3_1:
+	case WCD938X_DIGITAL_CDC_HPH_DSM_A4_0:
+	case WCD938X_DIGITAL_CDC_HPH_DSM_A4_1:
+	case WCD938X_DIGITAL_CDC_HPH_DSM_A5_0:
+	case WCD938X_DIGITAL_CDC_HPH_DSM_A5_1:
+	case WCD938X_DIGITAL_CDC_HPH_DSM_A6_0:
+	case WCD938X_DIGITAL_CDC_HPH_DSM_A7_0:
+	case WCD938X_DIGITAL_CDC_HPH_DSM_C_0:
+	case WCD938X_DIGITAL_CDC_HPH_DSM_C_1:
+	case WCD938X_DIGITAL_CDC_HPH_DSM_C_2:
+	case WCD938X_DIGITAL_CDC_HPH_DSM_C_3:
+	case WCD938X_DIGITAL_CDC_HPH_DSM_R1:
+	case WCD938X_DIGITAL_CDC_HPH_DSM_R2:
+	case WCD938X_DIGITAL_CDC_HPH_DSM_R3:
+	case WCD938X_DIGITAL_CDC_HPH_DSM_R4:
+	case WCD938X_DIGITAL_CDC_HPH_DSM_R5:
+	case WCD938X_DIGITAL_CDC_HPH_DSM_R6:
+	case WCD938X_DIGITAL_CDC_HPH_DSM_R7:
+	case WCD938X_DIGITAL_CDC_AUX_DSM_A1_0:
+	case WCD938X_DIGITAL_CDC_AUX_DSM_A1_1:
+	case WCD938X_DIGITAL_CDC_AUX_DSM_A2_0:
+	case WCD938X_DIGITAL_CDC_AUX_DSM_A2_1:
+	case WCD938X_DIGITAL_CDC_AUX_DSM_A3_0:
+	case WCD938X_DIGITAL_CDC_AUX_DSM_A3_1:
+	case WCD938X_DIGITAL_CDC_AUX_DSM_A4_0:
+	case WCD938X_DIGITAL_CDC_AUX_DSM_A4_1:
+	case WCD938X_DIGITAL_CDC_AUX_DSM_A5_0:
+	case WCD938X_DIGITAL_CDC_AUX_DSM_A5_1:
+	case WCD938X_DIGITAL_CDC_AUX_DSM_A6_0:
+	case WCD938X_DIGITAL_CDC_AUX_DSM_A7_0:
+	case WCD938X_DIGITAL_CDC_AUX_DSM_C_0:
+	case WCD938X_DIGITAL_CDC_AUX_DSM_C_1:
+	case WCD938X_DIGITAL_CDC_AUX_DSM_C_2:
+	case WCD938X_DIGITAL_CDC_AUX_DSM_C_3:
+	case WCD938X_DIGITAL_CDC_AUX_DSM_R1:
+	case WCD938X_DIGITAL_CDC_AUX_DSM_R2:
+	case WCD938X_DIGITAL_CDC_AUX_DSM_R3:
+	case WCD938X_DIGITAL_CDC_AUX_DSM_R4:
+	case WCD938X_DIGITAL_CDC_AUX_DSM_R5:
+	case WCD938X_DIGITAL_CDC_AUX_DSM_R6:
+	case WCD938X_DIGITAL_CDC_AUX_DSM_R7:
+	case WCD938X_DIGITAL_CDC_HPH_GAIN_RX_0:
+	case WCD938X_DIGITAL_CDC_HPH_GAIN_RX_1:
+	case WCD938X_DIGITAL_CDC_HPH_GAIN_DSD_0:
+	case WCD938X_DIGITAL_CDC_HPH_GAIN_DSD_1:
+	case WCD938X_DIGITAL_CDC_HPH_GAIN_DSD_2:
+	case WCD938X_DIGITAL_CDC_AUX_GAIN_DSD_0:
+	case WCD938X_DIGITAL_CDC_AUX_GAIN_DSD_1:
+	case WCD938X_DIGITAL_CDC_AUX_GAIN_DSD_2:
+	case WCD938X_DIGITAL_CDC_HPH_GAIN_CTL:
+	case WCD938X_DIGITAL_CDC_AUX_GAIN_CTL:
+	case WCD938X_DIGITAL_CDC_EAR_PATH_CTL:
+	case WCD938X_DIGITAL_CDC_SWR_CLH:
+	case WCD938X_DIGITAL_SWR_CLH_BYP:
+	case WCD938X_DIGITAL_CDC_TX0_CTL:
+	case WCD938X_DIGITAL_CDC_TX1_CTL:
+	case WCD938X_DIGITAL_CDC_TX2_CTL:
+	case WCD938X_DIGITAL_CDC_TX_RST:
+	case WCD938X_DIGITAL_CDC_REQ_CTL:
+	case WCD938X_DIGITAL_CDC_RST:
+	case WCD938X_DIGITAL_CDC_AMIC_CTL:
+	case WCD938X_DIGITAL_CDC_DMIC_CTL:
+	case WCD938X_DIGITAL_CDC_DMIC1_CTL:
+	case WCD938X_DIGITAL_CDC_DMIC2_CTL:
+	case WCD938X_DIGITAL_CDC_DMIC3_CTL:
+	case WCD938X_DIGITAL_CDC_DMIC4_CTL:
+	case WCD938X_DIGITAL_EFUSE_PRG_CTL:
+	case WCD938X_DIGITAL_EFUSE_CTL:
+	case WCD938X_DIGITAL_CDC_DMIC_RATE_1_2:
+	case WCD938X_DIGITAL_CDC_DMIC_RATE_3_4:
+	case WCD938X_DIGITAL_PDM_WD_CTL0:
+	case WCD938X_DIGITAL_PDM_WD_CTL1:
+	case WCD938X_DIGITAL_PDM_WD_CTL2:
+	case WCD938X_DIGITAL_INTR_MODE:
+	case WCD938X_DIGITAL_INTR_MASK_0:
+	case WCD938X_DIGITAL_INTR_MASK_1:
+	case WCD938X_DIGITAL_INTR_MASK_2:
+	case WCD938X_DIGITAL_INTR_CLEAR_0:
+	case WCD938X_DIGITAL_INTR_CLEAR_1:
+	case WCD938X_DIGITAL_INTR_CLEAR_2:
+	case WCD938X_DIGITAL_INTR_LEVEL_0:
+	case WCD938X_DIGITAL_INTR_LEVEL_1:
+	case WCD938X_DIGITAL_INTR_LEVEL_2:
+	case WCD938X_DIGITAL_INTR_SET_0:
+	case WCD938X_DIGITAL_INTR_SET_1:
+	case WCD938X_DIGITAL_INTR_SET_2:
+	case WCD938X_DIGITAL_INTR_TEST_0:
+	case WCD938X_DIGITAL_INTR_TEST_1:
+	case WCD938X_DIGITAL_INTR_TEST_2:
+	case WCD938X_DIGITAL_TX_MODE_DBG_EN:
+	case WCD938X_DIGITAL_TX_MODE_DBG_0_1:
+	case WCD938X_DIGITAL_TX_MODE_DBG_2_3:
+	case WCD938X_DIGITAL_LB_IN_SEL_CTL:
+	case WCD938X_DIGITAL_LOOP_BACK_MODE:
+	case WCD938X_DIGITAL_SWR_DAC_TEST:
+	case WCD938X_DIGITAL_SWR_HM_TEST_RX_0:
+	case WCD938X_DIGITAL_SWR_HM_TEST_TX_0:
+	case WCD938X_DIGITAL_SWR_HM_TEST_RX_1:
+	case WCD938X_DIGITAL_SWR_HM_TEST_TX_1:
+	case WCD938X_DIGITAL_SWR_HM_TEST_TX_2:
+	case WCD938X_DIGITAL_PAD_CTL_SWR_0:
+	case WCD938X_DIGITAL_PAD_CTL_SWR_1:
+	case WCD938X_DIGITAL_I2C_CTL:
+	case WCD938X_DIGITAL_CDC_TX_TANGGU_SW_MODE:
+	case WCD938X_DIGITAL_EFUSE_TEST_CTL_0:
+	case WCD938X_DIGITAL_EFUSE_TEST_CTL_1:
+	case WCD938X_DIGITAL_PAD_CTL_PDM_RX0:
+	case WCD938X_DIGITAL_PAD_CTL_PDM_RX1:
+	case WCD938X_DIGITAL_PAD_CTL_PDM_TX0:
+	case WCD938X_DIGITAL_PAD_CTL_PDM_TX1:
+	case WCD938X_DIGITAL_PAD_CTL_PDM_TX2:
+	case WCD938X_DIGITAL_PAD_INP_DIS_0:
+	case WCD938X_DIGITAL_PAD_INP_DIS_1:
+	case WCD938X_DIGITAL_DRIVE_STRENGTH_0:
+	case WCD938X_DIGITAL_DRIVE_STRENGTH_1:
+	case WCD938X_DIGITAL_DRIVE_STRENGTH_2:
+	case WCD938X_DIGITAL_RX_DATA_EDGE_CTL:
+	case WCD938X_DIGITAL_TX_DATA_EDGE_CTL:
+	case WCD938X_DIGITAL_GPIO_MODE:
+	case WCD938X_DIGITAL_PIN_CTL_OE:
+	case WCD938X_DIGITAL_PIN_CTL_DATA_0:
+	case WCD938X_DIGITAL_PIN_CTL_DATA_1:
+	case WCD938X_DIGITAL_DIG_DEBUG_CTL:
+	case WCD938X_DIGITAL_DIG_DEBUG_EN:
+	case WCD938X_DIGITAL_ANA_CSR_DBG_ADD:
+	case WCD938X_DIGITAL_ANA_CSR_DBG_CTL:
+	case WCD938X_DIGITAL_SSP_DBG:
+	case WCD938X_DIGITAL_SPARE_0:
+	case WCD938X_DIGITAL_SPARE_1:
+	case WCD938X_DIGITAL_SPARE_2:
+	case WCD938X_DIGITAL_TX_REQ_FB_CTL_0:
+	case WCD938X_DIGITAL_TX_REQ_FB_CTL_1:
+	case WCD938X_DIGITAL_TX_REQ_FB_CTL_2:
+	case WCD938X_DIGITAL_TX_REQ_FB_CTL_3:
+	case WCD938X_DIGITAL_TX_REQ_FB_CTL_4:
+	case WCD938X_DIGITAL_DEM_BYPASS_DATA0:
+	case WCD938X_DIGITAL_DEM_BYPASS_DATA1:
+	case WCD938X_DIGITAL_DEM_BYPASS_DATA2:
+	case WCD938X_DIGITAL_DEM_BYPASS_DATA3:
+		return true;
+	}
+
+	return false;
+}
+
+static bool wcd938x_readonly_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case WCD938X_ANA_MBHC_RESULT_1:
+	case WCD938X_ANA_MBHC_RESULT_2:
+	case WCD938X_ANA_MBHC_RESULT_3:
+	case WCD938X_MBHC_MOISTURE_DET_FSM_STATUS:
+	case WCD938X_TX_1_2_SAR2_ERR:
+	case WCD938X_TX_1_2_SAR1_ERR:
+	case WCD938X_TX_3_4_SAR4_ERR:
+	case WCD938X_TX_3_4_SAR3_ERR:
+	case WCD938X_HPH_L_STATUS:
+	case WCD938X_HPH_R_STATUS:
+	case WCD938X_HPH_SURGE_HPHLR_SURGE_STATUS:
+	case WCD938X_EAR_STATUS_REG_1:
+	case WCD938X_EAR_STATUS_REG_2:
+	case WCD938X_MBHC_NEW_FSM_STATUS:
+	case WCD938X_MBHC_NEW_ADC_RESULT:
+	case WCD938X_DIE_CRACK_DIE_CRK_DET_OUT:
+	case WCD938X_AUX_INT_STATUS_REG:
+	case WCD938X_LDORXTX_INT_STATUS:
+	case WCD938X_DIGITAL_CHIP_ID0:
+	case WCD938X_DIGITAL_CHIP_ID1:
+	case WCD938X_DIGITAL_CHIP_ID2:
+	case WCD938X_DIGITAL_CHIP_ID3:
+	case WCD938X_DIGITAL_INTR_STATUS_0:
+	case WCD938X_DIGITAL_INTR_STATUS_1:
+	case WCD938X_DIGITAL_INTR_STATUS_2:
+	case WCD938X_DIGITAL_SWR_HM_TEST_0:
+	case WCD938X_DIGITAL_SWR_HM_TEST_1:
+	case WCD938X_DIGITAL_EFUSE_T_DATA_0:
+	case WCD938X_DIGITAL_EFUSE_T_DATA_1:
+	case WCD938X_DIGITAL_PIN_STATUS_0:
+	case WCD938X_DIGITAL_PIN_STATUS_1:
+	case WCD938X_DIGITAL_MODE_STATUS_0:
+	case WCD938X_DIGITAL_MODE_STATUS_1:
+	case WCD938X_DIGITAL_EFUSE_REG_0:
+	case WCD938X_DIGITAL_EFUSE_REG_1:
+	case WCD938X_DIGITAL_EFUSE_REG_2:
+	case WCD938X_DIGITAL_EFUSE_REG_3:
+	case WCD938X_DIGITAL_EFUSE_REG_4:
+	case WCD938X_DIGITAL_EFUSE_REG_5:
+	case WCD938X_DIGITAL_EFUSE_REG_6:
+	case WCD938X_DIGITAL_EFUSE_REG_7:
+	case WCD938X_DIGITAL_EFUSE_REG_8:
+	case WCD938X_DIGITAL_EFUSE_REG_9:
+	case WCD938X_DIGITAL_EFUSE_REG_10:
+	case WCD938X_DIGITAL_EFUSE_REG_11:
+	case WCD938X_DIGITAL_EFUSE_REG_12:
+	case WCD938X_DIGITAL_EFUSE_REG_13:
+	case WCD938X_DIGITAL_EFUSE_REG_14:
+	case WCD938X_DIGITAL_EFUSE_REG_15:
+	case WCD938X_DIGITAL_EFUSE_REG_16:
+	case WCD938X_DIGITAL_EFUSE_REG_17:
+	case WCD938X_DIGITAL_EFUSE_REG_18:
+	case WCD938X_DIGITAL_EFUSE_REG_19:
+	case WCD938X_DIGITAL_EFUSE_REG_20:
+	case WCD938X_DIGITAL_EFUSE_REG_21:
+	case WCD938X_DIGITAL_EFUSE_REG_22:
+	case WCD938X_DIGITAL_EFUSE_REG_23:
+	case WCD938X_DIGITAL_EFUSE_REG_24:
+	case WCD938X_DIGITAL_EFUSE_REG_25:
+	case WCD938X_DIGITAL_EFUSE_REG_26:
+	case WCD938X_DIGITAL_EFUSE_REG_27:
+	case WCD938X_DIGITAL_EFUSE_REG_28:
+	case WCD938X_DIGITAL_EFUSE_REG_29:
+	case WCD938X_DIGITAL_EFUSE_REG_30:
+	case WCD938X_DIGITAL_EFUSE_REG_31:
+		return true;
+	}
+	return false;
+}
+
+static bool wcd938x_readable_register(struct device *dev, unsigned int reg)
+{
+	bool ret;
+
+	ret = wcd938x_readonly_register(dev, reg);
+	if (!ret)
+		return wcd938x_rdwr_register(dev, reg);
+
+	return ret;
+}
+
+static bool wcd938x_writeable_register(struct device *dev, unsigned int reg)
+{
+	return wcd938x_rdwr_register(dev, reg);
+}
+
+static bool wcd938x_volatile_register(struct device *dev, unsigned int reg)
+{
+	if (reg <= WCD938X_BASE_ADDRESS)
+		return 0;
+
+	if (reg == WCD938X_DIGITAL_SWR_TX_CLK_RATE)
+		return true;
+
+	if (wcd938x_readonly_register(dev, reg))
+		return true;
+
+	return false;
+}
+
+static struct regmap_config wcd938x_regmap_config = {
+	.name = "wcd938x_csr",
+	.reg_bits = 32,
+	.val_bits = 8,
+	.cache_type = REGCACHE_RBTREE,
+	.reg_defaults = wcd938x_defaults,
+	.num_reg_defaults = ARRAY_SIZE(wcd938x_defaults),
+	.max_register = WCD938X_MAX_REGISTER,
+	.readable_reg = wcd938x_readable_register,
+	.writeable_reg = wcd938x_writeable_register,
+	.volatile_reg = wcd938x_volatile_register,
+	.can_multi_write = true,
+};
+
+static const struct regmap_irq wcd938x_irqs[WCD938X_NUM_IRQS] = {
+	REGMAP_IRQ_REG(WCD938X_IRQ_MBHC_BUTTON_PRESS_DET, 0, 0x01),
+	REGMAP_IRQ_REG(WCD938X_IRQ_MBHC_BUTTON_RELEASE_DET, 0, 0x02),
+	REGMAP_IRQ_REG(WCD938X_IRQ_MBHC_ELECT_INS_REM_DET, 0, 0x04),
+	REGMAP_IRQ_REG(WCD938X_IRQ_MBHC_ELECT_INS_REM_LEG_DET, 0, 0x08),
+	REGMAP_IRQ_REG(WCD938X_IRQ_MBHC_SW_DET, 0, 0x10),
+	REGMAP_IRQ_REG(WCD938X_IRQ_HPHR_OCP_INT, 0, 0x20),
+	REGMAP_IRQ_REG(WCD938X_IRQ_HPHR_CNP_INT, 0, 0x40),
+	REGMAP_IRQ_REG(WCD938X_IRQ_HPHL_OCP_INT, 0, 0x80),
+	REGMAP_IRQ_REG(WCD938X_IRQ_HPHL_CNP_INT, 1, 0x01),
+	REGMAP_IRQ_REG(WCD938X_IRQ_EAR_CNP_INT, 1, 0x02),
+	REGMAP_IRQ_REG(WCD938X_IRQ_EAR_SCD_INT, 1, 0x04),
+	REGMAP_IRQ_REG(WCD938X_IRQ_AUX_CNP_INT, 1, 0x08),
+	REGMAP_IRQ_REG(WCD938X_IRQ_AUX_SCD_INT, 1, 0x10),
+	REGMAP_IRQ_REG(WCD938X_IRQ_HPHL_PDM_WD_INT, 1, 0x20),
+	REGMAP_IRQ_REG(WCD938X_IRQ_HPHR_PDM_WD_INT, 1, 0x40),
+	REGMAP_IRQ_REG(WCD938X_IRQ_AUX_PDM_WD_INT, 1, 0x80),
+	REGMAP_IRQ_REG(WCD938X_IRQ_LDORT_SCD_INT, 2, 0x01),
+	REGMAP_IRQ_REG(WCD938X_IRQ_MBHC_MOISTURE_INT, 2, 0x02),
+	REGMAP_IRQ_REG(WCD938X_IRQ_HPHL_SURGE_DET_INT, 2, 0x04),
+	REGMAP_IRQ_REG(WCD938X_IRQ_HPHR_SURGE_DET_INT, 2, 0x08),
+};
+
+static struct regmap_irq_chip wcd938x_regmap_irq_chip = {
+	.name = "wcd938x",
+	.irqs = wcd938x_irqs,
+	.num_irqs = ARRAY_SIZE(wcd938x_irqs),
+	.num_regs = 3,
+	.status_base = WCD938X_DIGITAL_INTR_STATUS_0,
+	.mask_base = WCD938X_DIGITAL_INTR_MASK_0,
+	.type_base = WCD938X_DIGITAL_INTR_LEVEL_0,
+	.ack_base = WCD938X_DIGITAL_INTR_CLEAR_0,
+	.use_ack = 1,
+	.runtime_pm = true,
+	.irq_drv_data = NULL,
+};
+
+int wcd938x_io_init(struct wcd938x_sdw_priv *wcd)
+{
+	struct regmap *rm = wcd->wcd938x->regmap;
+
+	if (!wcd->is_tx)
+		return 0;
+
+	regmap_update_bits(rm, WCD938X_SLEEP_CTL, 0x0E, 0x0E);
+	regmap_update_bits(rm, WCD938X_SLEEP_CTL, 0x80, 0x80);
+	/* 1 msec delay as per HW requirement */
+	usleep_range(1000, 1010);
+	regmap_update_bits(rm, WCD938X_SLEEP_CTL, 0x40, 0x40);
+	/* 1 msec delay as per HW requirement */
+	usleep_range(1000, 1010);
+	regmap_update_bits(rm, WCD938X_LDORXTX_CONFIG, 0x10, 0x00);
+	regmap_update_bits(rm, WCD938X_BIAS_VBG_FINE_ADJ,
+								0xF0, 0x80);
+	regmap_update_bits(rm, WCD938X_ANA_BIAS, 0x80, 0x80);
+	regmap_update_bits(rm, WCD938X_ANA_BIAS, 0x40, 0x40);
+	/* 10 msec delay as per HW requirement */
+	usleep_range(10000, 10010);
+
+	regmap_update_bits(rm, WCD938X_ANA_BIAS, 0x40, 0x00);
+	regmap_update_bits(rm, WCD938X_HPH_NEW_INT_RDAC_GAIN_CTL,
+				      0xF0, 0x00);
+	regmap_update_bits(rm, WCD938X_HPH_NEW_INT_RDAC_HD2_CTL_L_NEW,
+				      0x1F, 0x15);
+	regmap_update_bits(rm, WCD938X_HPH_NEW_INT_RDAC_HD2_CTL_R_NEW,
+				      0x1F, 0x15);
+	regmap_update_bits(rm, WCD938X_HPH_REFBUFF_UHQA_CTL,
+				      0xC0, 0x80);
+	regmap_update_bits(rm, WCD938X_DIGITAL_CDC_DMIC_CTL,
+				      0x02, 0x02);
+
+	regmap_update_bits(rm, WCD938X_TX_COM_NEW_INT_TXFE_ICTRL_STG2CASC_ULP,
+			   0xFF, 0x14);
+	regmap_update_bits(rm, WCD938X_TX_COM_NEW_INT_TXFE_ICTRL_STG2MAIN_ULP,
+			   0x1F, 0x08);
+
+	regmap_update_bits(rm, WCD938X_DIGITAL_TX_REQ_FB_CTL_0, 0xFF, 0x55);
+	regmap_update_bits(rm, WCD938X_DIGITAL_TX_REQ_FB_CTL_1, 0xFF, 0x44);
+	regmap_update_bits(rm, WCD938X_DIGITAL_TX_REQ_FB_CTL_2, 0xFF, 0x11);
+	regmap_update_bits(rm, WCD938X_DIGITAL_TX_REQ_FB_CTL_3, 0xFF, 0x00);
+	regmap_update_bits(rm, WCD938X_DIGITAL_TX_REQ_FB_CTL_4, 0xFF, 0x00);
+
+	/* Set Noise Filter Resistor value */
+	regmap_update_bits(rm, WCD938X_MICB1_TEST_CTL_1, 0xE0, 0xE0);
+	regmap_update_bits(rm, WCD938X_MICB2_TEST_CTL_1, 0xE0, 0xE0);
+	regmap_update_bits(rm, WCD938X_MICB3_TEST_CTL_1, 0xE0, 0xE0);
+	regmap_update_bits(rm, WCD938X_MICB4_TEST_CTL_1, 0xE0, 0xE0);
+
+	regmap_update_bits(rm, WCD938X_TX_3_4_TEST_BLK_EN2, 0x01, 0x00);
+	regmap_update_bits(rm, WCD938X_HPH_SURGE_HPHLR_SURGE_EN, 0xC0, 0xC0);
+
+	return 0;
+
+}
+
+static int wcd938x_get_micb_vout_ctl_val(u32 micb_mv)
+{
+	/* min micbias voltage is 1V and maximum is 2.85V */
+	if (micb_mv < 1000 || micb_mv > 2850)
+		return -EINVAL;
+
+	return (micb_mv - 1000) / 50;
+}
+
+static int wcd938x_set_micbias_data(struct wcd938x_priv *wcd938x)
+{
+	int vout_ctl_1, vout_ctl_2, vout_ctl_3, vout_ctl_4;
+
+	/* set micbias voltage */
+	vout_ctl_1 = wcd938x_get_micb_vout_ctl_val(wcd938x->micb1_mv);
+	vout_ctl_2 = wcd938x_get_micb_vout_ctl_val(wcd938x->micb2_mv);
+	vout_ctl_3 = wcd938x_get_micb_vout_ctl_val(wcd938x->micb3_mv);
+	vout_ctl_4 = wcd938x_get_micb_vout_ctl_val(wcd938x->micb4_mv);
+	if (vout_ctl_1 < 0 || vout_ctl_2 < 0 || vout_ctl_3 < 0 || vout_ctl_4 < 0)
+		return -EINVAL;
+
+	regmap_update_bits(wcd938x->regmap, WCD938X_ANA_MICB1,
+			   WCD938X_MICB_VOUT_MASK, vout_ctl_1);
+	regmap_update_bits(wcd938x->regmap, WCD938X_ANA_MICB2,
+			   WCD938X_MICB_VOUT_MASK, vout_ctl_2);
+	regmap_update_bits(wcd938x->regmap, WCD938X_ANA_MICB3,
+			   WCD938X_MICB_VOUT_MASK, vout_ctl_3);
+	regmap_update_bits(wcd938x->regmap, WCD938X_ANA_MICB4,
+			   WCD938X_MICB_VOUT_MASK, vout_ctl_4);
+
+	return 0;
+}
+
+static int wcd938x_soc_codec_rx_probe(struct snd_soc_component *component)
+{
+	struct wcd938x_sdw_priv *wcd = snd_soc_component_get_drvdata(component);
+	struct wcd938x_priv *wcd938x = wcd->wcd938x;
+
+	snd_soc_component_init_regmap(component, wcd938x->regmap);
+
+	wcd938x->clsh_info = wcd_clsh_ctrl_alloc(component, WCD938X);
+
+	return 0;
+}
+
+static irqreturn_t wcd938x_wd_handle_irq(int irq, void *data)
+{
+	return IRQ_HANDLED;
+}
+
+static struct irq_chip wcd_irq_chip = {
+	.name = "WCD938x",
+};
+
+static int wcd_irq_chip_map(struct irq_domain *irqd, unsigned int virq,
+			irq_hw_number_t hw)
+{
+	irq_set_chip_and_handler(virq, &wcd_irq_chip, handle_simple_irq);
+	irq_set_nested_thread(virq, 1);
+	irq_set_noprobe(virq);
+
+	return 0;
+}
+
+static const struct irq_domain_ops wcd_domain_ops = {
+	.map = wcd_irq_chip_map,
+};
+
+static int wcd938x_irq_init(struct wcd938x_sdw_priv *data, struct device *dev)
+{
+	struct wcd938x_priv *wcd = data->wcd938x;
+
+	wcd->virq = irq_domain_add_linear(NULL, 1, &wcd_domain_ops, NULL);
+	if (!(wcd->virq)) {
+		dev_err(dev, "%s: Failed to add IRQ domain\n", __func__);
+		return -EINVAL;
+	}
+
+	return devm_regmap_add_irq_chip(dev, wcd->regmap,
+					irq_create_mapping(wcd->virq, 0),
+					IRQF_ONESHOT, 0, &wcd938x_regmap_irq_chip,
+					&wcd->irq_chip);
+}
+
+static int wcd938x_soc_codec_probe(struct snd_soc_component *component)
+{
+	struct wcd938x_sdw_priv *wcd = snd_soc_component_get_drvdata(component);
+	struct wcd938x_priv *wcd938x = wcd->wcd938x;
+	struct device *dev = component->dev;
+	int ret, i;
+
+	wait_for_completion_timeout(&wcd->sdev->initialization_complete,
+				    msecs_to_jiffies(3000));
+
+	snd_soc_component_init_regmap(component, wcd938x->regmap);
+
+	wcd938x->variant = snd_soc_component_read_field(component,
+						 WCD938X_DIGITAL_EFUSE_REG_0,
+						 WCD938X_ID_MASK);
+
+	/* Set all interrupts as edge triggered */
+	for (i = 0; i < wcd938x_regmap_irq_chip.num_regs; i++) {
+		regmap_write(wcd938x->regmap,
+			     (WCD938X_DIGITAL_INTR_LEVEL_0 + i), 0);
+	}
+
+	ret = wcd938x_irq_init(wcd, component->dev);
+	if (ret) {
+		dev_err(component->dev, "%s: IRQ init failed: %d\n",
+			__func__, ret);
+		return ret;
+	}
+
+	wcd938x->hphr_pdm_wd_int = regmap_irq_get_virq(wcd938x->irq_chip,
+						       WCD938X_IRQ_HPHR_PDM_WD_INT);
+	wcd938x->hphl_pdm_wd_int = regmap_irq_get_virq(wcd938x->irq_chip,
+						       WCD938X_IRQ_HPHL_PDM_WD_INT);
+	wcd938x->aux_pdm_wd_int = regmap_irq_get_virq(wcd938x->irq_chip,
+						       WCD938X_IRQ_AUX_PDM_WD_INT);
+
+	/* Request for watchdog interrupt */
+	ret = request_threaded_irq(wcd938x->hphr_pdm_wd_int, NULL, wcd938x_wd_handle_irq,
+				   IRQF_ONESHOT | IRQF_TRIGGER_RISING,
+				   "HPHR PDM WD INT", wcd938x);
+	if (ret)
+		dev_err(dev, "Failed to request HPHR WD interrupt (%d)\n", ret);
+
+	ret = request_threaded_irq(wcd938x->hphl_pdm_wd_int, NULL, wcd938x_wd_handle_irq,
+				   IRQF_ONESHOT | IRQF_TRIGGER_RISING,
+				   "HPHL PDM WD INT", wcd938x);
+	if (ret)
+		dev_err(dev, "Failed to request HPHL WD interrupt (%d)\n", ret);
+
+	ret = request_threaded_irq(wcd938x->aux_pdm_wd_int, NULL, wcd938x_wd_handle_irq,
+				   IRQF_ONESHOT | IRQF_TRIGGER_RISING,
+				   "AUX PDM WD INT", wcd938x);
+	if (ret)
+		dev_err(dev, "Failed to request Aux WD interrupt (%d)\n", ret);
+
+	/* Disable watchdog interrupt for HPH and AUX */
+	disable_irq_nosync(wcd938x->hphr_pdm_wd_int);
+	disable_irq_nosync(wcd938x->hphl_pdm_wd_int);
+	disable_irq_nosync(wcd938x->aux_pdm_wd_int);
+
+	return ret;
+}
+
+static const struct snd_soc_component_driver soc_codec_dev_wcd938x_sdw_rx = {
+	.name = "wcd938x_codec_rx",
+	.probe = wcd938x_soc_codec_rx_probe,
+};
+
+static const struct snd_soc_component_driver soc_codec_dev_wcd938x_sdw_tx = {
+	.name = "wcd938x_codec_tx",
+	.probe = wcd938x_soc_codec_probe,
+};
+
+static void wcd938x_dt_parse_micbias_info(struct device *dev, struct wcd938x_priv *wcd)
+{
+	struct device_node *np = dev->of_node;
+	u32 prop_val = 0;
+	int rc = 0;
+
+	rc = of_property_read_u32(np, "qcom,micbias1-microvolt",  &prop_val);
+	if (!rc)
+		wcd->micb1_mv = prop_val/1000;
+	else
+		dev_info(dev, "%s: Micbias1 DT property not found\n", __func__);
+
+	rc = of_property_read_u32(np, "qcom,micbias2-microvolt",  &prop_val);
+	if (!rc)
+		wcd->micb2_mv = prop_val/1000;
+	else
+		dev_info(dev, "%s: Micbias2 DT property not found\n", __func__);
+
+	rc = of_property_read_u32(np, "qcom,micbias3-microvolt", &prop_val);
+	if (!rc)
+		wcd->micb3_mv = prop_val/1000;
+	else
+		dev_info(dev, "%s: Micbias3 DT property not found\n", __func__);
+
+	rc = of_property_read_u32(np, "qcom,micbias4-microvolt",  &prop_val);
+	if (!rc)
+		wcd->micb4_mv = prop_val/1000;
+	else
+		dev_info(dev, "%s: Micbias4 DT property not found\n", __func__);
+}
+
+static int wcd938x_populate_dt_data(struct wcd938x_sdw_priv *wcd, struct device *dev)
+{
+	struct wcd938x_priv *wcd938x = wcd->wcd938x;
+	int ret;
+
+
+	wcd938x->reset_gpio = of_get_named_gpio(dev->of_node, "reset-gpios", 0);
+	if (wcd938x->reset_gpio < 0) {
+		dev_err(dev, "Failed to get reset gpio: err = %d\n",
+			wcd938x->reset_gpio);
+		return wcd938x->reset_gpio;
+	}
+
+	wcd938x->supplies[0].supply = "vdd-rxtx";
+	wcd938x->supplies[1].supply = "vdd-io";
+	wcd938x->supplies[2].supply = "vdd-buck";
+	wcd938x->supplies[3].supply = "vdd-mic-bias";
+
+	ret = regulator_bulk_get(dev, WCD938X_MAX_SUPPLY, wcd938x->supplies);
+	if (ret) {
+		dev_err(dev, "Failed to get supplies: err = %d\n", ret);
+		return ret;
+	}
+
+	ret = regulator_bulk_enable(WCD938X_MAX_SUPPLY, wcd938x->supplies);
+	if (ret) {
+		dev_err(dev, "Failed to enable supplies: err = %d\n", ret);
+		return ret;
+	}
+
+	wcd938x_dt_parse_micbias_info(dev, wcd938x);
+	return 0;
+}
+
+static int wcd938x_reset(struct wcd938x_sdw_priv *wcd, struct device *dev)
+{
+	struct wcd938x_priv *wcd938x = wcd->wcd938x;
+
+	gpio_direction_output(wcd938x->reset_gpio, 0);
+	/* 20us sleep required after pulling the reset gpio to LOW */
+	usleep_range(20, 30);
+	gpio_set_value(wcd938x->reset_gpio, 1);
+	/* 20us sleep required after pulling the reset gpio to HIGH */
+	usleep_range(20, 30);
+
+	return 0;
+}
+
+static int __wcd938x_init(struct wcd938x_sdw_priv *wcd, struct device *dev)
+{
+	int ret;
+	struct wcd938x_priv *wcd938x = wcd->wcd938x;
+
+	wcd938x_reset(wcd, dev);
+
+	wcd938x->regmap = devm_regmap_init_sdw(wcd->sdev, &wcd938x_regmap_config);
+	if (IS_ERR(wcd938x->regmap)) {
+		dev_err(dev, "%s: Regmap init failed\n", __func__);
+		return PTR_ERR(wcd938x->regmap);
+	}
+
+	ret = wcd938x_set_micbias_data(wcd938x);
+	if (ret < 0) {
+		dev_err(dev, "%s: bad micbias data\n", __func__);
+		return ret;
+	}
+
+	return 0;
+}
+
+int wcd938x_register_component(struct wcd938x_sdw_priv *wcd, struct device *dev,
+			       struct snd_soc_dai_driver *dai_driver)
+{
+	if (wcd->is_tx)
+		return snd_soc_register_component(dev,
+						  &soc_codec_dev_wcd938x_sdw_tx,
+						  dai_driver, 1);
+	else
+		return snd_soc_register_component(dev,
+						  &soc_codec_dev_wcd938x_sdw_rx,
+						  dai_driver, 1);
+}
+
+int wcd938x_handle_sdw_irq(struct wcd938x_sdw_priv *wcd)
+{
+	struct wcd938x_priv *wcd938x = wcd->wcd938x;
+	struct irq_domain *slave_irq = wcd938x->virq;
+	u32 sts1, sts2, sts3;
+
+	do {
+		handle_nested_irq(irq_find_mapping(slave_irq, 0));
+		regmap_read(wcd938x->regmap, WCD938X_DIGITAL_INTR_STATUS_0, &sts1);
+		regmap_read(wcd938x->regmap, WCD938X_DIGITAL_INTR_STATUS_1, &sts2);
+		regmap_read(wcd938x->regmap, WCD938X_DIGITAL_INTR_STATUS_2, &sts3);
+
+	} while (sts1 || sts2 || sts3);
+
+	return IRQ_HANDLED;
+}
+
+int wcd938x_init(struct wcd938x_sdw_priv *data)
+{
+	struct wcd938x_priv *wcd938x = NULL;
+	struct device *dev = &data->sdev->dev;
+	bool is_tx = data->is_tx;
+	int ret;
+
+	if (!is_tx) {
+		if (g_wcd938x) {
+			data->wcd938x = g_wcd938x;
+			return 0;
+		} else {
+			return -EPROBE_DEFER;
+		}
+	}
+
+	wcd938x = devm_kzalloc(dev, sizeof(struct wcd938x_priv),
+				GFP_KERNEL);
+	if (!wcd938x)
+		return -ENOMEM;
+
+	data->wcd938x = wcd938x;
+	g_wcd938x = wcd938x;
+	wcd938x->dev = dev;
+	ret = wcd938x_populate_dt_data(data, dev);
+	if (ret) {
+		dev_err(dev, "%s: Fail to obtain platform data\n", __func__);
+		return -EINVAL;
+	}
+
+	ret = __wcd938x_init(data, dev);
+	if (ret) {
+		dev_err(dev, "%s: Fail to init\n", __func__);
+		return ret;
+	}
+
+	return 0;
+}
+
+int wcd938x_deinit(struct wcd938x_sdw_priv *wcd)
+{
+	struct wcd938x_priv *wcd938x = wcd->wcd938x;
+
+	if (!wcd->is_tx)
+		wcd_clsh_ctrl_free(wcd938x->clsh_info);
+
+	g_wcd938x = NULL;
+
+	return 0;
+}
diff --git a/sound/soc/codecs/wcd938x.h b/sound/soc/codecs/wcd938x.h
new file mode 100644
index 000000000000..c373850f209e
--- /dev/null
+++ b/sound/soc/codecs/wcd938x.h
@@ -0,0 +1,676 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __WCD938X_H__
+#define __WCD938X_H__
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+
+#define WCD938X_BASE_ADDRESS			(0x3000)
+#define WCD938X_ANA_PAGE_REGISTER               (0x3000)
+#define WCD938X_ANA_BIAS                        (0x3001)
+#define WCD938X_ANA_RX_SUPPLIES                 (0x3008)
+#define WCD938X_RX_BIAS_EN_MASK			BIT(0)
+#define WCD938X_REGULATOR_MODE_MASK		BIT(1)
+#define WCD938X_REGULATOR_MODE_CLASS_AB		1
+#define WCD938X_VNEG_EN_MASK			BIT(6)
+#define WCD938X_VPOS_EN_MASK			BIT(7)
+#define WCD938X_ANA_HPH                         (0x3009)
+#define WCD938X_HPHR_REF_EN_MASK		BIT(4)
+#define WCD938X_HPHL_REF_EN_MASK		BIT(5)
+#define WCD938X_HPHR_EN_MASK			BIT(6)
+#define WCD938X_HPHL_EN_MASK			BIT(7)
+#define WCD938X_ANA_EAR                         (0x300A)
+#define WCD938X_ANA_EAR_COMPANDER_CTL           (0x300B)
+#define WCD938X_GAIN_OVRD_REG_MASK		BIT(7)
+#define WCD938X_EAR_GAIN_MASK			GENMASK(6, 2)
+#define WCD938X_ANA_TX_CH1                      (0x300E)
+#define WCD938X_ANA_TX_CH2                      (0x300F)
+#define WCD938X_HPF1_INIT_MASK			BIT(6)
+#define WCD938X_HPF2_INIT_MASK			BIT(5)
+#define WCD938X_ANA_TX_CH3                      (0x3010)
+#define WCD938X_ANA_TX_CH4                      (0x3011)
+#define WCD938X_HPF3_INIT_MASK			BIT(6)
+#define WCD938X_HPF4_INIT_MASK			BIT(5)
+#define WCD938X_ANA_MICB1_MICB2_DSP_EN_LOGIC    (0x3012)
+#define WCD938X_ANA_MICB3_DSP_EN_LOGIC          (0x3013)
+#define WCD938X_ANA_MBHC_MECH                   (0x3014)
+#define WCD938X_MBHC_L_DET_EN_MASK		BIT(7)
+#define WCD938X_MBHC_L_DET_EN			BIT(7)
+#define WCD938X_MBHC_GND_DET_EN_MASK		BIT(6)
+#define WCD938X_MBHC_MECH_DETECT_TYPE_MASK	BIT(5)
+#define WCD938X_MBHC_MECH_DETECT_TYPE_INS	1
+#define WCD938X_MBHC_HPHL_PLUG_TYPE_MASK	BIT(4)
+#define WCD938X_MBHC_HPHL_PLUG_TYPE_NO		1
+#define WCD938X_MBHC_GND_PLUG_TYPE_MASK		BIT(3)
+#define WCD938X_MBHC_GND_PLUG_TYPE_NO		1
+#define WCD938X_MBHC_HSL_PULLUP_COMP_EN		BIT(2)
+#define WCD938X_MBHC_HSG_PULLUP_COMP_EN		BIT(1)
+#define WCD938X_MBHC_HPHL_100K_TO_GND_EN	BIT(0)
+
+#define WCD938X_ANA_MBHC_ELECT                  (0x3015)
+#define WCD938X_ANA_MBHC_BD_ISRC_CTL_MASK	GENMASK(6, 4)
+#define WCD938X_ANA_MBHC_BD_ISRC_100UA		GENMASK(5, 4)
+#define WCD938X_ANA_MBHC_BD_ISRC_OFF		0
+#define WCD938X_ANA_MBHC_BIAS_EN_MASK		BIT(0)
+#define WCD938X_ANA_MBHC_BIAS_EN		BIT(0)
+#define WCD938X_ANA_MBHC_ZDET                   (0x3016)
+#define WCD938X_ANA_MBHC_RESULT_1               (0x3017)
+#define WCD938X_ANA_MBHC_RESULT_2               (0x3018)
+#define WCD938X_ANA_MBHC_RESULT_3               (0x3019)
+#define WCD938X_MBHC_BTN_RESULT_MASK		GENMASK(2, 0)
+#define WCD938X_ANA_MBHC_BTN0                   (0x301A)
+#define WCD938X_MBHC_BTN_VTH_MASK		GENMASK(7, 2)
+#define WCD938X_ANA_MBHC_BTN1                   (0x301B)
+#define WCD938X_ANA_MBHC_BTN2                   (0x301C)
+#define WCD938X_ANA_MBHC_BTN3                   (0x301D)
+#define WCD938X_ANA_MBHC_BTN4                   (0x301E)
+#define WCD938X_ANA_MBHC_BTN5                   (0x301F)
+#define WCD938X_VTH_MASK			GENMASK(7, 2)
+#define WCD938X_ANA_MBHC_BTN6                   (0x3020)
+#define WCD938X_ANA_MBHC_BTN7                   (0x3021)
+#define WCD938X_ANA_MICB1                       (0x3022)
+#define WCD938X_MICB_VOUT_MASK			GENMASK(5, 0)
+#define WCD938X_MICB_EN_MASK			GENMASK(7, 6)
+#define WCD938X_MICB_DISABLE			0
+#define WCD938X_MICB_ENABLE			1
+#define WCD938X_MICB_PULL_UP			2
+#define WCD938X_MICB_PULL_DOWN			3
+#define WCD938X_ANA_MICB2                       (0x3023)
+#define WCD938X_ANA_MICB2_ENABLE		BIT(6)
+#define WCD938X_ANA_MICB2_ENABLE_MASK		GENMASK(7, 6)
+#define WCD938X_ANA_MICB2_VOUT_MASK		GENMASK(5, 0)
+#define WCD938X_ANA_MICB2_RAMP                  (0x3024)
+#define WCD938X_RAMP_EN_MASK			BIT(7)
+#define WCD938X_RAMP_SHIFT_CTRL_MASK		GENMASK(4, 2)
+#define WCD938X_ANA_MICB3                       (0x3025)
+#define WCD938X_ANA_MICB4                       (0x3026)
+#define WCD938X_BIAS_CTL                        (0x3028)
+#define WCD938X_BIAS_VBG_FINE_ADJ               (0x3029)
+#define WCD938X_LDOL_VDDCX_ADJUST               (0x3040)
+#define WCD938X_LDOL_DISABLE_LDOL               (0x3041)
+#define WCD938X_MBHC_CTL_CLK                    (0x3056)
+#define WCD938X_MBHC_CTL_ANA                    (0x3057)
+#define WCD938X_MBHC_CTL_SPARE_1                (0x3058)
+#define WCD938X_MBHC_CTL_SPARE_2                (0x3059)
+#define WCD938X_MBHC_CTL_BCS                    (0x305A)
+#define WCD938X_MBHC_MOISTURE_DET_FSM_STATUS    (0x305B)
+#define WCD938X_MBHC_TEST_CTL                   (0x305C)
+#define WCD938X_LDOH_MODE                       (0x3067)
+#define WCD938X_LDOH_EN_MASK			BIT(7)
+#define WCD938X_LDOH_BIAS                       (0x3068)
+#define WCD938X_LDOH_STB_LOADS                  (0x3069)
+#define WCD938X_LDOH_SLOWRAMP                   (0x306A)
+#define WCD938X_MICB1_TEST_CTL_1                (0x306B)
+#define WCD938X_MICB1_TEST_CTL_2                (0x306C)
+#define WCD938X_MICB1_TEST_CTL_3                (0x306D)
+#define WCD938X_MICB2_TEST_CTL_1                (0x306E)
+#define WCD938X_MICB2_TEST_CTL_2                (0x306F)
+#define WCD938X_MICB2_TEST_CTL_3                (0x3070)
+#define WCD938X_MICB3_TEST_CTL_1                (0x3071)
+#define WCD938X_MICB3_TEST_CTL_2                (0x3072)
+#define WCD938X_MICB3_TEST_CTL_3                (0x3073)
+#define WCD938X_MICB4_TEST_CTL_1                (0x3074)
+#define WCD938X_MICB4_TEST_CTL_2                (0x3075)
+#define WCD938X_MICB4_TEST_CTL_3                (0x3076)
+#define WCD938X_TX_COM_ADC_VCM                  (0x3077)
+#define WCD938X_TX_COM_BIAS_ATEST               (0x3078)
+#define WCD938X_TX_COM_SPARE1                   (0x3079)
+#define WCD938X_TX_COM_SPARE2                   (0x307A)
+#define WCD938X_TX_COM_TXFE_DIV_CTL             (0x307B)
+#define WCD938X_TX_COM_TXFE_DIV_START           (0x307C)
+#define WCD938X_TX_COM_SPARE3                   (0x307D)
+#define WCD938X_TX_COM_SPARE4                   (0x307E)
+#define WCD938X_TX_1_2_TEST_EN                  (0x307F)
+#define WCD938X_TX_1_2_ADC_IB                   (0x3080)
+#define WCD938X_TX_1_2_ATEST_REFCTL             (0x3081)
+#define WCD938X_TX_1_2_TEST_CTL                 (0x3082)
+#define WCD938X_TX_1_2_TEST_BLK_EN1             (0x3083)
+#define WCD938X_TX_1_2_TXFE1_CLKDIV             (0x3084)
+#define WCD938X_TX_1_2_SAR2_ERR                 (0x3085)
+#define WCD938X_TX_1_2_SAR1_ERR                 (0x3086)
+#define WCD938X_TX_3_4_TEST_EN                  (0x3087)
+#define WCD938X_TX_3_4_ADC_IB                   (0x3088)
+#define WCD938X_TX_3_4_ATEST_REFCTL             (0x3089)
+#define WCD938X_TX_3_4_TEST_CTL                 (0x308A)
+#define WCD938X_TX_3_4_TEST_BLK_EN3             (0x308B)
+#define WCD938X_TX_3_4_TXFE3_CLKDIV             (0x308C)
+#define WCD938X_TX_3_4_SAR4_ERR                 (0x308D)
+#define WCD938X_TX_3_4_SAR3_ERR                 (0x308E)
+#define WCD938X_TX_3_4_TEST_BLK_EN2             (0x308F)
+#define WCD938X_TX_3_4_TXFE2_CLKDIV             (0x3090)
+#define WCD938X_TX_3_4_SPARE1                   (0x3091)
+#define WCD938X_TX_3_4_TEST_BLK_EN4             (0x3092)
+#define WCD938X_TX_3_4_TXFE4_CLKDIV             (0x3093)
+#define WCD938X_TX_3_4_SPARE2                   (0x3094)
+#define WCD938X_CLASSH_MODE_1                   (0x3097)
+#define WCD938X_CLASSH_MODE_2                   (0x3098)
+#define WCD938X_CLASSH_MODE_3                   (0x3099)
+#define WCD938X_CLASSH_CTRL_VCL_1               (0x309A)
+#define WCD938X_CLASSH_CTRL_VCL_2               (0x309B)
+#define WCD938X_CLASSH_CTRL_CCL_1               (0x309C)
+#define WCD938X_CLASSH_CTRL_CCL_2               (0x309D)
+#define WCD938X_CLASSH_CTRL_CCL_3               (0x309E)
+#define WCD938X_CLASSH_CTRL_CCL_4               (0x309F)
+#define WCD938X_CLASSH_CTRL_CCL_5               (0x30A0)
+#define WCD938X_CLASSH_BUCK_TMUX_A_D            (0x30A1)
+#define WCD938X_CLASSH_BUCK_SW_DRV_CNTL         (0x30A2)
+#define WCD938X_CLASSH_SPARE                    (0x30A3)
+#define WCD938X_FLYBACK_EN                      (0x30A4)
+#define WCD938X_EN_CUR_DET_MASK			BIT(2)
+#define WCD938X_FLYBACK_VNEG_CTRL_1             (0x30A5)
+#define WCD938X_FLYBACK_VNEG_CTRL_2             (0x30A6)
+#define WCD938X_FLYBACK_VNEG_CTRL_3             (0x30A7)
+#define WCD938X_FLYBACK_VNEG_CTRL_4             (0x30A8)
+#define WCD938X_FLYBACK_VNEG_CTRL_5             (0x30A9)
+#define WCD938X_FLYBACK_VNEG_CTRL_6             (0x30AA)
+#define WCD938X_FLYBACK_VNEG_CTRL_7             (0x30AB)
+#define WCD938X_FLYBACK_VNEG_CTRL_8             (0x30AC)
+#define WCD938X_FLYBACK_VNEG_CTRL_9             (0x30AD)
+#define WCD938X_FLYBACK_VNEGDAC_CTRL_1          (0x30AE)
+#define WCD938X_FLYBACK_VNEGDAC_CTRL_2          (0x30AF)
+#define WCD938X_FLYBACK_VNEGDAC_CTRL_3          (0x30B0)
+#define WCD938X_FLYBACK_CTRL_1                  (0x30B1)
+#define WCD938X_FLYBACK_TEST_CTL                (0x30B2)
+#define WCD938X_RX_AUX_SW_CTL                   (0x30B3)
+#define WCD938X_RX_PA_AUX_IN_CONN               (0x30B4)
+#define WCD938X_RX_TIMER_DIV                    (0x30B5)
+#define WCD938X_RX_OCP_CTL                      (0x30B6)
+#define WCD938X_RX_OCP_COUNT                    (0x30B7)
+#define WCD938X_RX_BIAS_EAR_DAC                 (0x30B8)
+#define WCD938X_RX_BIAS_EAR_AMP                 (0x30B9)
+#define WCD938X_RX_BIAS_HPH_LDO                 (0x30BA)
+#define WCD938X_RX_BIAS_HPH_PA                  (0x30BB)
+#define WCD938X_RX_BIAS_HPH_RDACBUFF_CNP2       (0x30BC)
+#define WCD938X_RX_BIAS_HPH_RDAC_LDO            (0x30BD)
+#define WCD938X_RX_BIAS_HPH_CNP1                (0x30BE)
+#define WCD938X_RX_BIAS_HPH_LOWPOWER            (0x30BF)
+#define WCD938X_RX_BIAS_AUX_DAC                 (0x30C0)
+#define WCD938X_RX_BIAS_AUX_AMP                 (0x30C1)
+#define WCD938X_RX_BIAS_VNEGDAC_BLEEDER         (0x30C2)
+#define WCD938X_RX_BIAS_MISC                    (0x30C3)
+#define WCD938X_RX_BIAS_BUCK_RST                (0x30C4)
+#define WCD938X_RX_BIAS_BUCK_VREF_ERRAMP        (0x30C5)
+#define WCD938X_RX_BIAS_FLYB_ERRAMP             (0x30C6)
+#define WCD938X_RX_BIAS_FLYB_BUFF               (0x30C7)
+#define WCD938X_RX_BIAS_FLYB_MID_RST            (0x30C8)
+#define WCD938X_HPH_L_STATUS                    (0x30C9)
+#define WCD938X_HPH_R_STATUS                    (0x30CA)
+#define WCD938X_HPH_CNP_EN                      (0x30CB)
+#define WCD938X_HPH_CNP_WG_CTL                  (0x30CC)
+#define WCD938X_HPH_CNP_WG_TIME                 (0x30CD)
+#define WCD938X_HPH_OCP_CTL                     (0x30CE)
+#define WCD938X_HPH_AUTO_CHOP                   (0x30CF)
+#define WCD938X_HPH_CHOP_CTL                    (0x30D0)
+#define WCD938X_HPH_PA_CTL1                     (0x30D1)
+#define WCD938X_HPH_PA_CTL2                     (0x30D2)
+#define WCD938X_HPHPA_GND_R_MASK		BIT(6)
+#define WCD938X_HPHPA_GND_L_MASK		BIT(4)
+#define WCD938X_HPH_L_EN                        (0x30D3)
+#define WCD938X_HPH_L_TEST                      (0x30D4)
+#define WCD938X_HPH_L_ATEST                     (0x30D5)
+#define WCD938X_HPH_R_EN                        (0x30D6)
+#define WCD938X_GAIN_SRC_SEL_MASK		BIT(5)
+#define WCD938X_GAIN_SRC_SEL_REGISTER		1
+#define WCD938X_HPH_R_TEST                      (0x30D7)
+#define WCD938X_HPH_R_ATEST                     (0x30D8)
+#define WCD938X_HPHPA_GND_OVR_MASK		BIT(1)
+#define WCD938X_HPH_RDAC_CLK_CTL1               (0x30D9)
+#define WCD938X_CHOP_CLK_EN_MASK		BIT(7)
+#define WCD938X_HPH_RDAC_CLK_CTL2               (0x30DA)
+#define WCD938X_HPH_RDAC_LDO_CTL                (0x30DB)
+#define WCD938X_HPH_RDAC_CHOP_CLK_LP_CTL        (0x30DC)
+#define WCD938X_HPH_REFBUFF_UHQA_CTL            (0x30DD)
+#define WCD938X_HPH_REFBUFF_LP_CTL              (0x30DE)
+#define WCD938X_PREREF_FLIT_BYPASS_MASK		BIT(0)
+#define WCD938X_HPH_L_DAC_CTL                   (0x30DF)
+#define WCD938X_HPH_R_DAC_CTL                   (0x30E0)
+#define WCD938X_HPH_SURGE_HPHLR_SURGE_COMP_SEL  (0x30E1)
+#define WCD938X_HPH_SURGE_HPHLR_SURGE_EN        (0x30E2)
+#define WCD938X_HPH_SURGE_HPHLR_SURGE_MISC1     (0x30E3)
+#define WCD938X_HPH_SURGE_HPHLR_SURGE_STATUS    (0x30E4)
+#define WCD938X_EAR_EAR_EN_REG                  (0x30E9)
+#define WCD938X_EAR_EAR_PA_CON                  (0x30EA)
+#define WCD938X_EAR_EAR_SP_CON                  (0x30EB)
+#define WCD938X_EAR_EAR_DAC_CON                 (0x30EC)
+#define WCD938X_DAC_SAMPLE_EDGE_SEL_MASK	BIT(7)
+#define WCD938X_EAR_EAR_CNP_FSM_CON             (0x30ED)
+#define WCD938X_EAR_TEST_CTL                    (0x30EE)
+#define WCD938X_EAR_STATUS_REG_1                (0x30EF)
+#define WCD938X_EAR_STATUS_REG_2                (0x30F0)
+#define WCD938X_ANA_NEW_PAGE_REGISTER           (0x3100)
+#define WCD938X_HPH_NEW_ANA_HPH2                (0x3101)
+#define WCD938X_HPH_NEW_ANA_HPH3                (0x3102)
+#define WCD938X_SLEEP_CTL                       (0x3103)
+#define WCD938X_SLEEP_WATCHDOG_CTL              (0x3104)
+#define WCD938X_MBHC_NEW_ELECT_REM_CLAMP_CTL    (0x311F)
+#define WCD938X_MBHC_NEW_CTL_1                  (0x3120)
+#define WCD938X_MBHC_CTL_RCO_EN_MASK		BIT(7)
+#define WCD938X_MBHC_CTL_RCO_EN			BIT(7)
+#define WCD938X_MBHC_BTN_DBNC_MASK		GENMASK(1, 0)
+#define WCD938X_MBHC_BTN_DBNC_T_16_MS		0x2
+#define WCD938X_MBHC_NEW_CTL_2                  (0x3121)
+#define WCD938X_M_RTH_CTL_MASK			GENMASK(3, 2)
+#define WCD938X_MBHC_HS_VREF_CTL_MASK		GENMASK(1, 0)
+#define WCD938X_MBHC_HS_VREF_1P5_V		0x1
+#define WCD938X_MBHC_NEW_PLUG_DETECT_CTL        (0x3122)
+#define WCD938X_MBHC_DBNC_TIMER_INSREM_DBNC_T_96_MS	0x6
+
+#define WCD938X_MBHC_NEW_ZDET_ANA_CTL           (0x3123)
+#define WCD938X_ZDET_RANGE_CTL_MASK		GENMASK(3, 0)
+#define WCD938X_ZDET_MAXV_CTL_MASK		GENMASK(6, 4)
+#define WCD938X_MBHC_NEW_ZDET_RAMP_CTL          (0x3124)
+#define WCD938X_MBHC_NEW_FSM_STATUS             (0x3125)
+#define WCD938X_MBHC_NEW_ADC_RESULT             (0x3126)
+#define WCD938X_TX_NEW_AMIC_MUX_CFG             (0x3127)
+#define WCD938X_AUX_AUXPA                       (0x3128)
+#define WCD938X_AUXPA_CLK_EN_MASK		BIT(4)
+#define WCD938X_LDORXTX_MODE                    (0x3129)
+#define WCD938X_LDORXTX_CONFIG                  (0x312A)
+#define WCD938X_DIE_CRACK_DIE_CRK_DET_EN        (0x312C)
+#define WCD938X_DIE_CRACK_DIE_CRK_DET_OUT       (0x312D)
+#define WCD938X_HPH_NEW_INT_RDAC_GAIN_CTL       (0x3132)
+#define WCD938X_HPH_NEW_INT_RDAC_HD2_CTL_L      (0x3133)
+#define WCD938X_HPH_NEW_INT_RDAC_VREF_CTL       (0x3134)
+#define WCD938X_HPH_NEW_INT_RDAC_OVERRIDE_CTL   (0x3135)
+#define WCD938X_HPH_NEW_INT_RDAC_HD2_CTL_R      (0x3136)
+#define WCD938X_HPH_RES_DIV_MASK		GENMASK(4, 0)
+#define WCD938X_HPH_NEW_INT_PA_MISC1            (0x3137)
+#define WCD938X_HPH_NEW_INT_PA_MISC2            (0x3138)
+#define WCD938X_HPH_NEW_INT_PA_RDAC_MISC        (0x3139)
+#define WCD938X_HPH_NEW_INT_HPH_TIMER1          (0x313A)
+#define WCD938X_AUTOCHOP_TIMER_EN		BIT(1)
+#define WCD938X_HPH_NEW_INT_HPH_TIMER2          (0x313B)
+#define WCD938X_HPH_NEW_INT_HPH_TIMER3          (0x313C)
+#define WCD938X_HPH_NEW_INT_HPH_TIMER4          (0x313D)
+#define WCD938X_HPH_NEW_INT_PA_RDAC_MISC2       (0x313E)
+#define WCD938X_HPH_NEW_INT_PA_RDAC_MISC3       (0x313F)
+#define WCD938X_HPH_NEW_INT_RDAC_HD2_CTL_L_NEW  (0x3140)
+#define WCD938X_HPH_NEW_INT_RDAC_HD2_CTL_R_NEW  (0x3141)
+#define WCD938X_RX_NEW_INT_HPH_RDAC_BIAS_LOHIFI (0x3145)
+#define WCD938X_RX_NEW_INT_HPH_RDAC_BIAS_ULP    (0x3146)
+#define WCD938X_RX_NEW_INT_HPH_RDAC_LDO_LP      (0x3147)
+#define WCD938X_MBHC_NEW_INT_MOISTURE_DET_DC_CTRL  (0x31AF)
+#define WCD938X_MBHC_NEW_INT_MOISTURE_DET_POLLING_CTRL (0x31B0)
+#define WCD938X_MOISTURE_EN_POLLING_MASK	BIT(2)
+#define WCD938X_MBHC_NEW_INT_MECH_DET_CURRENT   (0x31B1)
+#define WCD938X_HSDET_PULLUP_C_MASK		GENMASK(4, 0)
+#define WCD938X_MBHC_NEW_INT_SPARE_2            (0x31B2)
+#define WCD938X_EAR_INT_NEW_EAR_CHOPPER_CON     (0x31B7)
+#define WCD938X_EAR_INT_NEW_CNP_VCM_CON1        (0x31B8)
+#define WCD938X_EAR_INT_NEW_CNP_VCM_CON2        (0x31B9)
+#define WCD938X_EAR_INT_NEW_EAR_DYNAMIC_BIAS    (0x31BA)
+#define WCD938X_AUX_INT_EN_REG                  (0x31BD)
+#define WCD938X_AUX_INT_PA_CTRL                 (0x31BE)
+#define WCD938X_AUX_INT_SP_CTRL                 (0x31BF)
+#define WCD938X_AUX_INT_DAC_CTRL                (0x31C0)
+#define WCD938X_AUX_INT_CLK_CTRL                (0x31C1)
+#define WCD938X_AUX_INT_TEST_CTRL               (0x31C2)
+#define WCD938X_AUX_INT_STATUS_REG              (0x31C3)
+#define WCD938X_AUX_INT_MISC                    (0x31C4)
+#define WCD938X_LDORXTX_INT_BIAS                (0x31C5)
+#define WCD938X_LDORXTX_INT_STB_LOADS_DTEST     (0x31C6)
+#define WCD938X_LDORXTX_INT_TEST0               (0x31C7)
+#define WCD938X_LDORXTX_INT_STARTUP_TIMER       (0x31C8)
+#define WCD938X_LDORXTX_INT_TEST1               (0x31C9)
+#define WCD938X_LDORXTX_INT_STATUS              (0x31CA)
+#define WCD938X_SLEEP_INT_WATCHDOG_CTL_1        (0x31D0)
+#define WCD938X_SLEEP_INT_WATCHDOG_CTL_2        (0x31D1)
+#define WCD938X_DIE_CRACK_INT_DIE_CRK_DET_INT1  (0x31D3)
+#define WCD938X_DIE_CRACK_INT_DIE_CRK_DET_INT2  (0x31D4)
+#define WCD938X_TX_COM_NEW_INT_TXFE_DIVSTOP_L2  (0x31D5)
+#define WCD938X_TX_COM_NEW_INT_TXFE_DIVSTOP_L1  (0x31D6)
+#define WCD938X_TX_COM_NEW_INT_TXFE_DIVSTOP_L0  (0x31D7)
+#define WCD938X_TX_COM_NEW_INT_TXFE_DIVSTOP_ULP1P2M	(0x31D8)
+#define WCD938X_TX_COM_NEW_INT_TXFE_DIVSTOP_ULP0P6M	(0x31D9)
+#define WCD938X_TX_COM_NEW_INT_TXFE_ICTRL_STG1_L2L1	(0x31DA)
+#define WCD938X_TX_COM_NEW_INT_TXFE_ICTRL_STG1_L0       (0x31DB)
+#define WCD938X_TX_COM_NEW_INT_TXFE_ICTRL_STG1_ULP      (0x31DC)
+#define WCD938X_TX_COM_NEW_INT_TXFE_ICTRL_STG2MAIN_L2L1 (0x31DD)
+#define WCD938X_TX_COM_NEW_INT_TXFE_ICTRL_STG2MAIN_L0   (0x31DE)
+#define WCD938X_TX_COM_NEW_INT_TXFE_ICTRL_STG2MAIN_ULP  (0x31DF)
+#define WCD938X_TX_COM_NEW_INT_TXFE_ICTRL_STG2CASC_L2L1L0 (0x31E0)
+#define WCD938X_TX_COM_NEW_INT_TXFE_ICTRL_STG2CASC_ULP	(0x31E1)
+#define WCD938X_TX_COM_NEW_INT_TXADC_SCBIAS_L2L1	(0x31E2)
+#define WCD938X_TX_COM_NEW_INT_TXADC_SCBIAS_L0ULP	(0x31E3)
+#define WCD938X_TX_COM_NEW_INT_TXADC_INT_L2     (0x31E4)
+#define WCD938X_TX_COM_NEW_INT_TXADC_INT_L1     (0x31E5)
+#define WCD938X_TX_COM_NEW_INT_TXADC_INT_L0     (0x31E6)
+#define WCD938X_TX_COM_NEW_INT_TXADC_INT_ULP    (0x31E7)
+#define WCD938X_DIGITAL_PAGE_REGISTER           (0x3400)
+#define WCD938X_DIGITAL_CHIP_ID0                (0x3401)
+#define WCD938X_DIGITAL_CHIP_ID1                (0x3402)
+#define WCD938X_DIGITAL_CHIP_ID2                (0x3403)
+#define WCD938X_DIGITAL_CHIP_ID3                (0x3404)
+#define WCD938X_DIGITAL_SWR_TX_CLK_RATE         (0x3405)
+#define WCD938X_DIGITAL_CDC_RST_CTL             (0x3406)
+#define WCD938X_DIGITAL_TOP_CLK_CFG             (0x3407)
+#define WCD938X_DIGITAL_CDC_ANA_CLK_CTL         (0x3408)
+#define WCD938X_ANA_RX_CLK_EN_MASK		BIT(0)
+#define WCD938X_ANA_RX_DIV2_CLK_EN_MASK		BIT(1)
+#define WCD938X_ANA_RX_DIV4_CLK_EN_MASK		BIT(2)
+#define WCD938X_ANA_TX_CLK_EN_MASK		BIT(3)
+#define WCD938X_ANA_TX_DIV2_CLK_EN_MASK		BIT(4)
+#define WCD938X_ANA_TX_DIV4_CLK_EN_MASK		BIT(5)
+#define WCD938X_DIGITAL_CDC_DIG_CLK_CTL         (0x3409)
+#define WCD938X_TXD3_CLK_EN_MASK		BIT(7)
+#define WCD938X_TXD2_CLK_EN_MASK		BIT(6)
+#define WCD938X_TXD1_CLK_EN_MASK		BIT(5)
+#define WCD938X_TXD0_CLK_EN_MASK		BIT(4)
+#define WCD938X_TX_CLK_EN_MASK			GENMASK(7, 4)
+#define WCD938X_RXD2_CLK_EN_MASK		BIT(2)
+#define WCD938X_RXD1_CLK_EN_MASK		BIT(1)
+#define WCD938X_RXD0_CLK_EN_MASK		BIT(0)
+#define WCD938X_DIGITAL_SWR_RST_EN              (0x340A)
+#define WCD938X_DIGITAL_CDC_PATH_MODE           (0x340B)
+#define WCD938X_DIGITAL_CDC_RX_RST              (0x340C)
+#define WCD938X_DIGITAL_CDC_RX0_CTL             (0x340D)
+#define WCD938X_DEM_DITHER_ENABLE_MASK		BIT(6)
+#define WCD938X_DIGITAL_CDC_RX1_CTL             (0x340E)
+#define WCD938X_DIGITAL_CDC_RX2_CTL             (0x340F)
+#define WCD938X_DIGITAL_CDC_TX_ANA_MODE_0_1     (0x3410)
+#define WCD938X_TXD0_MODE_MASK			GENMASK(3, 0)
+#define WCD938X_TXD1_MODE_MASK			GENMASK(7, 4)
+#define WCD938X_DIGITAL_CDC_TX_ANA_MODE_2_3     (0x3411)
+#define WCD938X_TXD2_MODE_MASK			GENMASK(3, 0)
+#define WCD938X_TXD3_MODE_MASK			GENMASK(7, 4)
+#define WCD938X_DIGITAL_CDC_COMP_CTL_0          (0x3414)
+#define WCD938X_HPHR_COMP_EN_MASK		BIT(0)
+#define WCD938X_HPHL_COMP_EN_MASK		BIT(1)
+#define WCD938X_DIGITAL_CDC_ANA_TX_CLK_CTL      (0x3417)
+#define WCD938X_TX_SC_CLK_EN_MASK		BIT(0)
+#define WCD938X_DIGITAL_CDC_HPH_DSM_A1_0        (0x3418)
+#define WCD938X_DIGITAL_CDC_HPH_DSM_A1_1        (0x3419)
+#define WCD938X_DIGITAL_CDC_HPH_DSM_A2_0        (0x341A)
+#define WCD938X_DIGITAL_CDC_HPH_DSM_A2_1        (0x341B)
+#define WCD938X_DIGITAL_CDC_HPH_DSM_A3_0        (0x341C)
+#define WCD938X_DIGITAL_CDC_HPH_DSM_A3_1        (0x341D)
+#define WCD938X_DIGITAL_CDC_HPH_DSM_A4_0        (0x341E)
+#define WCD938X_DIGITAL_CDC_HPH_DSM_A4_1        (0x341F)
+#define WCD938X_DIGITAL_CDC_HPH_DSM_A5_0        (0x3420)
+#define WCD938X_DIGITAL_CDC_HPH_DSM_A5_1        (0x3421)
+#define WCD938X_DIGITAL_CDC_HPH_DSM_A6_0        (0x3422)
+#define WCD938X_DIGITAL_CDC_HPH_DSM_A7_0        (0x3423)
+#define WCD938X_DIGITAL_CDC_HPH_DSM_C_0         (0x3424)
+#define WCD938X_DIGITAL_CDC_HPH_DSM_C_1         (0x3425)
+#define WCD938X_DIGITAL_CDC_HPH_DSM_C_2         (0x3426)
+#define WCD938X_DIGITAL_CDC_HPH_DSM_C_3         (0x3427)
+#define WCD938X_DIGITAL_CDC_HPH_DSM_R1          (0x3428)
+#define WCD938X_DIGITAL_CDC_HPH_DSM_R2          (0x3429)
+#define WCD938X_DIGITAL_CDC_HPH_DSM_R3          (0x342A)
+#define WCD938X_DIGITAL_CDC_HPH_DSM_R4          (0x342B)
+#define WCD938X_DIGITAL_CDC_HPH_DSM_R5          (0x342C)
+#define WCD938X_DIGITAL_CDC_HPH_DSM_R6          (0x342D)
+#define WCD938X_DIGITAL_CDC_HPH_DSM_R7          (0x342E)
+#define WCD938X_DIGITAL_CDC_AUX_DSM_A1_0        (0x342F)
+#define WCD938X_DIGITAL_CDC_AUX_DSM_A1_1        (0x3430)
+#define WCD938X_DIGITAL_CDC_AUX_DSM_A2_0        (0x3431)
+#define WCD938X_DIGITAL_CDC_AUX_DSM_A2_1        (0x3432)
+#define WCD938X_DIGITAL_CDC_AUX_DSM_A3_0        (0x3433)
+#define WCD938X_DIGITAL_CDC_AUX_DSM_A3_1        (0x3434)
+#define WCD938X_DIGITAL_CDC_AUX_DSM_A4_0        (0x3435)
+#define WCD938X_DIGITAL_CDC_AUX_DSM_A4_1        (0x3436)
+#define WCD938X_DIGITAL_CDC_AUX_DSM_A5_0        (0x3437)
+#define WCD938X_DIGITAL_CDC_AUX_DSM_A5_1        (0x3438)
+#define WCD938X_DIGITAL_CDC_AUX_DSM_A6_0        (0x3439)
+#define WCD938X_DIGITAL_CDC_AUX_DSM_A7_0        (0x343A)
+#define WCD938X_DIGITAL_CDC_AUX_DSM_C_0         (0x343B)
+#define WCD938X_DIGITAL_CDC_AUX_DSM_C_1         (0x343C)
+#define WCD938X_DIGITAL_CDC_AUX_DSM_C_2         (0x343D)
+#define WCD938X_DIGITAL_CDC_AUX_DSM_C_3         (0x343E)
+#define WCD938X_DIGITAL_CDC_AUX_DSM_R1          (0x343F)
+#define WCD938X_DIGITAL_CDC_AUX_DSM_R2          (0x3440)
+#define WCD938X_DIGITAL_CDC_AUX_DSM_R3          (0x3441)
+#define WCD938X_DIGITAL_CDC_AUX_DSM_R4          (0x3442)
+#define WCD938X_DIGITAL_CDC_AUX_DSM_R5          (0x3443)
+#define WCD938X_DIGITAL_CDC_AUX_DSM_R6          (0x3444)
+#define WCD938X_DIGITAL_CDC_AUX_DSM_R7          (0x3445)
+#define WCD938X_DIGITAL_CDC_HPH_GAIN_RX_0       (0x3446)
+#define WCD938X_DIGITAL_CDC_HPH_GAIN_RX_1       (0x3447)
+#define WCD938X_DIGITAL_CDC_HPH_GAIN_DSD_0      (0x3448)
+#define WCD938X_DIGITAL_CDC_HPH_GAIN_DSD_1      (0x3449)
+#define WCD938X_DIGITAL_CDC_HPH_GAIN_DSD_2      (0x344A)
+#define WCD938X_DIGITAL_CDC_AUX_GAIN_DSD_0      (0x344B)
+#define WCD938X_DIGITAL_CDC_AUX_GAIN_DSD_1      (0x344C)
+#define WCD938X_DIGITAL_CDC_AUX_GAIN_DSD_2      (0x344D)
+#define WCD938X_DIGITAL_CDC_HPH_GAIN_CTL        (0x344E)
+#define WCD938X_HPHL_RX_EN_MASK			BIT(2)
+#define WCD938X_HPHR_RX_EN_MASK			BIT(3)
+#define WCD938X_DIGITAL_CDC_AUX_GAIN_CTL        (0x344F)
+#define WCD938X_AUX_EN_MASK			BIT(0)
+#define WCD938X_DIGITAL_CDC_EAR_PATH_CTL        (0x3450)
+#define WCD938X_DIGITAL_CDC_SWR_CLH             (0x3451)
+#define WCD938X_DIGITAL_SWR_CLH_BYP             (0x3452)
+#define WCD938X_DIGITAL_CDC_TX0_CTL             (0x3453)
+#define WCD938X_DIGITAL_CDC_TX1_CTL             (0x3454)
+#define WCD938X_DIGITAL_CDC_TX2_CTL             (0x3455)
+#define WCD938X_DIGITAL_CDC_TX_RST              (0x3456)
+#define WCD938X_DIGITAL_CDC_REQ_CTL             (0x3457)
+#define WCD938X_FS_RATE_4P8_MASK		BIT(1)
+#define WCD938X_NO_NOTCH_MASK			BIT(0)
+#define WCD938X_DIGITAL_CDC_RST                 (0x3458)
+#define WCD938X_DIGITAL_CDC_AMIC_CTL            (0x345A)
+#define WCD938X_AMIC1_IN_SEL_DMIC		0
+#define WCD938X_AMIC1_IN_SEL_AMIC		0
+#define WCD938X_AMIC1_IN_SEL_MASK		BIT(0)
+#define WCD938X_AMIC3_IN_SEL_MASK		BIT(1)
+#define WCD938X_AMIC4_IN_SEL_MASK		BIT(2)
+#define WCD938X_AMIC5_IN_SEL_MASK		BIT(3)
+#define WCD938X_DIGITAL_CDC_DMIC_CTL            (0x345B)
+#define WCD938X_DMIC_CLK_SCALING_EN_MASK	GENMASK(2, 1)
+#define WCD938X_DIGITAL_CDC_DMIC1_CTL           (0x345C)
+#define WCD938X_DMIC_CLK_EN_MASK		BIT(3)
+#define WCD938X_DIGITAL_CDC_DMIC2_CTL           (0x345D)
+#define WCD938X_DIGITAL_CDC_DMIC3_CTL           (0x345E)
+#define WCD938X_DIGITAL_CDC_DMIC4_CTL           (0x345F)
+#define WCD938X_DIGITAL_EFUSE_PRG_CTL           (0x3460)
+#define WCD938X_DIGITAL_EFUSE_CTL               (0x3461)
+#define WCD938X_DIGITAL_CDC_DMIC_RATE_1_2       (0x3462)
+#define WCD938X_DIGITAL_CDC_DMIC_RATE_3_4       (0x3463)
+#define WCD938X_DMIC1_RATE_MASK			GENMASK(3, 0)
+#define WCD938X_DMIC2_RATE_MASK			GENMASK(7, 4)
+#define WCD938X_DMIC3_RATE_MASK			GENMASK(3, 0)
+#define WCD938X_DMIC4_RATE_MASK			GENMASK(7, 4)
+#define WCD938X_DMIC4_RATE_2P4MHZ		3
+
+#define WCD938X_DIGITAL_PDM_WD_CTL0             (0x3465)
+#define WCD938X_PDM_WD_EN_MASK			GENMASK(2, 0)
+#define WCD938X_DIGITAL_PDM_WD_CTL1             (0x3466)
+#define WCD938X_DIGITAL_PDM_WD_CTL2             (0x3467)
+#define WCD938X_AUX_PDM_WD_EN_MASK			GENMASK(2, 0)
+#define WCD938X_DIGITAL_INTR_MODE               (0x346A)
+#define WCD938X_DIGITAL_INTR_MASK_0             (0x346B)
+#define WCD938X_DIGITAL_INTR_MASK_1             (0x346C)
+#define WCD938X_DIGITAL_INTR_MASK_2             (0x346D)
+#define WCD938X_DIGITAL_INTR_STATUS_0           (0x346E)
+#define WCD938X_DIGITAL_INTR_STATUS_1           (0x346F)
+#define WCD938X_DIGITAL_INTR_STATUS_2           (0x3470)
+#define WCD938X_DIGITAL_INTR_CLEAR_0            (0x3471)
+#define WCD938X_DIGITAL_INTR_CLEAR_1            (0x3472)
+#define WCD938X_DIGITAL_INTR_CLEAR_2            (0x3473)
+#define WCD938X_DIGITAL_INTR_LEVEL_0            (0x3474)
+#define WCD938X_DIGITAL_INTR_LEVEL_1            (0x3475)
+#define WCD938X_DIGITAL_INTR_LEVEL_2            (0x3476)
+#define WCD938X_DIGITAL_INTR_SET_0              (0x3477)
+#define WCD938X_DIGITAL_INTR_SET_1              (0x3478)
+#define WCD938X_DIGITAL_INTR_SET_2              (0x3479)
+#define WCD938X_DIGITAL_INTR_TEST_0             (0x347A)
+#define WCD938X_DIGITAL_INTR_TEST_1             (0x347B)
+#define WCD938X_DIGITAL_INTR_TEST_2             (0x347C)
+#define WCD938X_DIGITAL_TX_MODE_DBG_EN          (0x347F)
+#define WCD938X_DIGITAL_TX_MODE_DBG_0_1         (0x3480)
+#define WCD938X_DIGITAL_TX_MODE_DBG_2_3         (0x3481)
+#define WCD938X_DIGITAL_LB_IN_SEL_CTL           (0x3482)
+#define WCD938X_DIGITAL_LOOP_BACK_MODE          (0x3483)
+#define WCD938X_DIGITAL_SWR_DAC_TEST            (0x3484)
+#define WCD938X_DIGITAL_SWR_HM_TEST_RX_0        (0x3485)
+#define WCD938X_DIGITAL_SWR_HM_TEST_TX_0        (0x3486)
+#define WCD938X_DIGITAL_SWR_HM_TEST_RX_1        (0x3487)
+#define WCD938X_DIGITAL_SWR_HM_TEST_TX_1        (0x3488)
+#define WCD938X_DIGITAL_SWR_HM_TEST_TX_2        (0x3489)
+#define WCD938X_DIGITAL_SWR_HM_TEST_0           (0x348A)
+#define WCD938X_DIGITAL_SWR_HM_TEST_1           (0x348B)
+#define WCD938X_DIGITAL_PAD_CTL_SWR_0           (0x348C)
+#define WCD938X_DIGITAL_PAD_CTL_SWR_1           (0x348D)
+#define WCD938X_DIGITAL_I2C_CTL                 (0x348E)
+#define WCD938X_DIGITAL_CDC_TX_TANGGU_SW_MODE   (0x348F)
+#define WCD938X_DIGITAL_EFUSE_TEST_CTL_0        (0x3490)
+#define WCD938X_DIGITAL_EFUSE_TEST_CTL_1        (0x3491)
+#define WCD938X_DIGITAL_EFUSE_T_DATA_0          (0x3492)
+#define WCD938X_DIGITAL_EFUSE_T_DATA_1          (0x3493)
+#define WCD938X_DIGITAL_PAD_CTL_PDM_RX0         (0x3494)
+#define WCD938X_DIGITAL_PAD_CTL_PDM_RX1         (0x3495)
+#define WCD938X_DIGITAL_PAD_CTL_PDM_TX0         (0x3496)
+#define WCD938X_DIGITAL_PAD_CTL_PDM_TX1         (0x3497)
+#define WCD938X_DIGITAL_PAD_CTL_PDM_TX2         (0x3498)
+#define WCD938X_DIGITAL_PAD_INP_DIS_0           (0x3499)
+#define WCD938X_DIGITAL_PAD_INP_DIS_1           (0x349A)
+#define WCD938X_DIGITAL_DRIVE_STRENGTH_0        (0x349B)
+#define WCD938X_DIGITAL_DRIVE_STRENGTH_1        (0x349C)
+#define WCD938X_DIGITAL_DRIVE_STRENGTH_2        (0x349D)
+#define WCD938X_DIGITAL_RX_DATA_EDGE_CTL        (0x349E)
+#define WCD938X_DIGITAL_TX_DATA_EDGE_CTL        (0x349F)
+#define WCD938X_DIGITAL_GPIO_MODE               (0x34A0)
+#define WCD938X_DIGITAL_PIN_CTL_OE              (0x34A1)
+#define WCD938X_DIGITAL_PIN_CTL_DATA_0          (0x34A2)
+#define WCD938X_DIGITAL_PIN_CTL_DATA_1          (0x34A3)
+#define WCD938X_DIGITAL_PIN_STATUS_0            (0x34A4)
+#define WCD938X_DIGITAL_PIN_STATUS_1            (0x34A5)
+#define WCD938X_DIGITAL_DIG_DEBUG_CTL           (0x34A6)
+#define WCD938X_DIGITAL_DIG_DEBUG_EN            (0x34A7)
+#define WCD938X_DIGITAL_ANA_CSR_DBG_ADD         (0x34A8)
+#define WCD938X_DIGITAL_ANA_CSR_DBG_CTL         (0x34A9)
+#define WCD938X_DIGITAL_SSP_DBG                 (0x34AA)
+#define WCD938X_DIGITAL_MODE_STATUS_0           (0x34AB)
+#define WCD938X_DIGITAL_MODE_STATUS_1           (0x34AC)
+#define WCD938X_DIGITAL_SPARE_0                 (0x34AD)
+#define WCD938X_DIGITAL_SPARE_1                 (0x34AE)
+#define WCD938X_DIGITAL_SPARE_2                 (0x34AF)
+#define WCD938X_DIGITAL_EFUSE_REG_0             (0x34B0)
+#define WCD938X_ID_MASK				GENMASK(4, 1)
+#define WCD938X_DIGITAL_EFUSE_REG_1             (0x34B1)
+#define WCD938X_DIGITAL_EFUSE_REG_2             (0x34B2)
+#define WCD938X_DIGITAL_EFUSE_REG_3             (0x34B3)
+#define WCD938X_DIGITAL_EFUSE_REG_4             (0x34B4)
+#define WCD938X_DIGITAL_EFUSE_REG_5             (0x34B5)
+#define WCD938X_DIGITAL_EFUSE_REG_6             (0x34B6)
+#define WCD938X_DIGITAL_EFUSE_REG_7             (0x34B7)
+#define WCD938X_DIGITAL_EFUSE_REG_8             (0x34B8)
+#define WCD938X_DIGITAL_EFUSE_REG_9             (0x34B9)
+#define WCD938X_DIGITAL_EFUSE_REG_10            (0x34BA)
+#define WCD938X_DIGITAL_EFUSE_REG_11            (0x34BB)
+#define WCD938X_DIGITAL_EFUSE_REG_12            (0x34BC)
+#define WCD938X_DIGITAL_EFUSE_REG_13            (0x34BD)
+#define WCD938X_DIGITAL_EFUSE_REG_14            (0x34BE)
+#define WCD938X_DIGITAL_EFUSE_REG_15            (0x34BF)
+#define WCD938X_DIGITAL_EFUSE_REG_16            (0x34C0)
+#define WCD938X_DIGITAL_EFUSE_REG_17            (0x34C1)
+#define WCD938X_DIGITAL_EFUSE_REG_18            (0x34C2)
+#define WCD938X_DIGITAL_EFUSE_REG_19            (0x34C3)
+#define WCD938X_DIGITAL_EFUSE_REG_20            (0x34C4)
+#define WCD938X_DIGITAL_EFUSE_REG_21            (0x34C5)
+#define WCD938X_DIGITAL_EFUSE_REG_22            (0x34C6)
+#define WCD938X_DIGITAL_EFUSE_REG_23            (0x34C7)
+#define WCD938X_DIGITAL_EFUSE_REG_24            (0x34C8)
+#define WCD938X_DIGITAL_EFUSE_REG_25            (0x34C9)
+#define WCD938X_DIGITAL_EFUSE_REG_26            (0x34CA)
+#define WCD938X_DIGITAL_EFUSE_REG_27            (0x34CB)
+#define WCD938X_DIGITAL_EFUSE_REG_28            (0x34CC)
+#define WCD938X_DIGITAL_EFUSE_REG_29            (0x34CD)
+#define WCD938X_DIGITAL_EFUSE_REG_30            (0x34CE)
+#define WCD938X_DIGITAL_EFUSE_REG_31            (0x34CF)
+#define WCD938X_DIGITAL_TX_REQ_FB_CTL_0         (0x34D0)
+#define WCD938X_DIGITAL_TX_REQ_FB_CTL_1         (0x34D1)
+#define WCD938X_DIGITAL_TX_REQ_FB_CTL_2         (0x34D2)
+#define WCD938X_DIGITAL_TX_REQ_FB_CTL_3         (0x34D3)
+#define WCD938X_DIGITAL_TX_REQ_FB_CTL_4         (0x34D4)
+#define WCD938X_DIGITAL_DEM_BYPASS_DATA0        (0x34D5)
+#define WCD938X_DIGITAL_DEM_BYPASS_DATA1        (0x34D6)
+#define WCD938X_DIGITAL_DEM_BYPASS_DATA2        (0x34D7)
+#define WCD938X_DIGITAL_DEM_BYPASS_DATA3        (0x34D8)
+#define WCD938X_MAX_REGISTER			(WCD938X_DIGITAL_DEM_BYPASS_DATA3)
+
+#define WCD938X_MAX_SWR_PORTS	5
+#define WCD938X_MAX_TX_SWR_PORTS 4
+#define WCD938X_MAX_SWR_CH_IDS	15
+
+struct wcd938x_sdw_ch_info {
+	int port_num;
+	unsigned int ch_mask;
+};
+
+#define WCD_SDW_CH(id, pn, cmask)	\
+	[id] = {			\
+		.port_num = pn,		\
+		.ch_mask = cmask,	\
+	}
+
+enum wcd938x_tx_sdw_ports {
+	WCD938X_ADC_1_2_PORT = 1,
+	WCD938X_ADC_3_4_PORT,
+	/* DMIC0_0, DMIC0_1, DMIC1_0, DMIC1_1 */
+	WCD938X_DMIC_0_3_MBHC_PORT,
+	WCD938X_DMIC_4_7_PORT,
+};
+
+enum wcd938x_tx_sdw_channels {
+	WCD938X_ADC1,
+	WCD938X_ADC2,
+	WCD938X_ADC3,
+	WCD938X_ADC4,
+	WCD938X_DMIC0,
+	WCD938X_DMIC1,
+	WCD938X_MBHC,
+	WCD938X_DMIC2,
+	WCD938X_DMIC3,
+	WCD938X_DMIC4,
+	WCD938X_DMIC5,
+	WCD938X_DMIC6,
+	WCD938X_DMIC7,
+};
+
+enum wcd938x_rx_sdw_ports {
+	WCD938X_HPH_PORT = 1,
+	WCD938X_CLSH_PORT,
+	WCD938X_COMP_PORT,
+	WCD938X_LO_PORT,
+	WCD938X_DSD_PORT,
+};
+
+enum wcd938x_rx_sdw_channels {
+	WCD938X_HPH_L,
+	WCD938X_HPH_R,
+	WCD938X_CLSH,
+	WCD938X_COMP_L,
+	WCD938X_COMP_R,
+	WCD938X_LO,
+	WCD938X_DSD_R,
+	WCD938X_DSD_L,
+};
+enum {
+	WCD938X_SDW_DIR_RX,
+	WCD938X_SDW_DIR_TX,
+};
+
+struct wcd938x_priv;
+struct wcd938x_sdw_priv {
+	struct sdw_slave *sdev;
+	struct sdw_stream_config sconfig;
+	struct sdw_stream_runtime *sruntime;
+	struct sdw_port_config port_config[WCD938X_MAX_SWR_PORTS];
+	struct wcd938x_sdw_ch_info *ch_info;
+	bool port_enable[WCD938X_MAX_SWR_CH_IDS];
+	int port_map[WCD938X_MAX_SWR_PORTS];
+	int active_ports;
+	int num_ports;
+	bool is_tx;
+	struct wcd938x_priv *wcd938x;
+};
+
+int wcd938x_init(struct wcd938x_sdw_priv *priv);
+int wcd938x_io_init(struct wcd938x_sdw_priv *priv);
+int wcd938x_deinit(struct wcd938x_sdw_priv *priv);
+int wcd938x_handle_sdw_irq(struct wcd938x_sdw_priv *priv);
+int wcd938x_register_component(struct wcd938x_sdw_priv *wcd,
+			       struct device *dev,
+			       struct snd_soc_dai_driver *dai_driver);
+
+#endif /* __WCD938X_H__ */
-- 
2.21.0

