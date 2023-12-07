Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAAC80956E
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 23:33:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85C8AA4D;
	Thu,  7 Dec 2023 23:33:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85C8AA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701988431;
	bh=DW5TwRD7qrAx9gIi5dGnp44PJkUlQbn/+XaQJD4plMI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OaLk095XGOw+mtszatHS5DVRMT5rfvX56UdP+UgObZ0HxE6N6B5zcg1KPhuNg2nfE
	 A3zZvZdgIuKIfZgT1x4Oz9siwvT1SJJv4hkWAk5DoA3a/toNQA+QOsVZtSvrNae95y
	 M8YKVMsHCh1UdW3xM5UctdLTUhOXe9OhbBD8faC0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3338DF806F8; Thu,  7 Dec 2023 23:31:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1F37F806E8;
	Thu,  7 Dec 2023 23:31:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62D31F80588; Thu,  7 Dec 2023 23:31:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A22EF8055C
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 23:30:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A22EF8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YZSXHMSs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701988224; x=1733524224;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DW5TwRD7qrAx9gIi5dGnp44PJkUlQbn/+XaQJD4plMI=;
  b=YZSXHMSs1lgxvzvoSUirIXO9P8nl3cdQlUg8W9DGOCOJWjqn0e6UFvp5
   +1KK62LEvIZLA+XFtW98PrdQkqcLlLZhyD1XXwo4O2po6FCvcN1yyT0Nc
   rjX/bEfrPRJAyZUs4DcamdMlOxmFSs2kmprEJWg2sRToQX6NuEEjY1l6v
   FaaaLIthYWnTZndwhNIAwb58L9+66rN9c8LueCuHJXyIWTUW/GIfehy8O
   E7dATlzvnjEFoL3Fo+FpKCJK8DP7GXXufu4rA+Bp5r9bFlKyqwrycfuao
   JAZBz6xDydl/hixpGgPRA9/ZlhcTBbdqcdFBxt4Fn0KFwzhjP3LehLCRV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="480516680"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600";
   d="scan'208";a="480516680"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 14:30:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895307503"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600";
   d="scan'208";a="895307503"
Received: from hrcolco-mobl3.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.159])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 14:30:20 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	vinod.koul@intel.com,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	vijendar.mukunda@amd.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [RFC PATCH 12/16] ASoC: SOF: Intel: hda-sdw-bpt: add helpers for
 SoundWire BPT DMA
Date: Thu,  7 Dec 2023 16:29:40 -0600
Message-Id: <20231207222944.663893-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZQQSI566A4R2CZF6LK7VZIQ253TDFM7F
X-Message-ID-Hash: ZQQSI566A4R2CZF6LK7VZIQ253TDFM7F
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZQQSI566A4R2CZF6LK7VZIQ253TDFM7F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add SoundWire BPT DMA helpers as a separate module to avoid circular
dependencies.

For now this assumes no link DMA, only coupled mode.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/hda-sdw-bpt.h       |  76 +++++++
 sound/soc/sof/intel/Kconfig       |   8 +-
 sound/soc/sof/intel/Makefile      |   4 +
 sound/soc/sof/intel/hda-sdw-bpt.c | 328 ++++++++++++++++++++++++++++++
 4 files changed, 415 insertions(+), 1 deletion(-)
 create mode 100644 include/sound/hda-sdw-bpt.h
 create mode 100644 sound/soc/sof/intel/hda-sdw-bpt.c

diff --git a/include/sound/hda-sdw-bpt.h b/include/sound/hda-sdw-bpt.h
new file mode 100644
index 000000000000..163c4513c26f
--- /dev/null
+++ b/include/sound/hda-sdw-bpt.h
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2023 Intel Corporation. All rights reserved.
+ */
+
+#include <linux/device.h>
+
+struct hdac_ext_stream;
+struct snd_dma_buffer;
+
+#if IS_ENABLED(CONFIG_SND_SOF_SOF_HDA_SDW_BPT)
+int hda_sdw_bpt_open(struct device *dev,
+		     int link_id,
+		     struct hdac_ext_stream **bpt_tx_stream,
+		     struct snd_dma_buffer *dmab_tx_bdl,
+		     u32 bpt_tx_num_bytes,
+		     u32 tx_dma_bandwidth,
+		     struct hdac_ext_stream **bpt_rx_stream,
+		     struct snd_dma_buffer *dmab_rx_bdl,
+		     u32 bpt_rx_num_bytes,
+		     u32 rx_dma_bandwidth);
+
+int hda_sdw_bpt_send_async(struct device *dev,
+			   struct hdac_ext_stream *bpt_tx_stream,
+			   struct hdac_ext_stream *bpt_rx_stream);
+
+int hda_sdw_bpt_wait(struct device *dev,
+		     struct hdac_ext_stream *bpt_tx_stream,
+		     struct hdac_ext_stream *bpt_rx_stream);
+
+int hda_sdw_bpt_close(struct device *dev,
+		      struct hdac_ext_stream *bpt_tx_stream,
+		      struct snd_dma_buffer *dmab_tx_bdl,
+		      struct hdac_ext_stream *bpt_rx_stream,
+		      struct snd_dma_buffer *dmab_rx_bdl);
+#else
+static inline int hda_sdw_bpt_open(struct device *dev,
+				   int link_id,
+				   struct hdac_ext_stream **bpt_tx_stream,
+				   struct snd_dma_buffer *dmab_tx_bdl,
+				   u32 bpt_tx_num_bytes,
+				   u32 tx_dma_bandwidth,
+				   struct hdac_ext_stream **bpt_rx_stream,
+				   struct snd_dma_buffer *dmab_rx_bdl,
+				   u32 bpt_rx_num_bytes,
+				   u32 rx_dma_bandwidth)
+{
+	return 0;
+}
+
+static inline int hda_sdw_bpt_send_async(struct device *dev,
+					 struct hdac_ext_stream *bpt_tx_stream,
+					 struct hdac_ext_stream *bpt_rx_stream)
+{
+	return 0;
+}
+
+static inline int hda_sdw_bpt_wait(struct device *dev,
+				   struct hdac_ext_stream *bpt_tx_stream,
+				   struct hdac_ext_stream *bpt_rx_stream)
+{
+	return 0;
+}
+
+static inline int hda_sdw_bpt_close(struct device *dev,
+				    struct hdac_ext_stream *bpt_tx_stream,
+				    struct snd_dma_buffer *dmab_tx_bdl,
+				    struct hdac_ext_stream *bpt_rx_stream,
+				    struct snd_dma_buffer *dmab_rx_bdl)
+{
+	return 0;
+}
+#endif
diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 3396bd46b778..d2650348987b 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -268,6 +268,7 @@ config SND_SOC_SOF_INTEL_LNL
 	tristate
 	select SND_SOC_SOF_HDA_GENERIC
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
+	select SND_SOF_SOF_HDA_SDW_BPT if SND_SOC_SOF_INTEL_SOUNDWIRE
 	select SND_SOC_SOF_IPC4
 	select SND_SOC_SOF_INTEL_MTL
 
@@ -325,12 +326,17 @@ config SND_SOC_SOF_HDA_AUDIO_CODEC
 
 endif ## SND_SOC_SOF_HDA_GENERIC
 
+config SND_SOF_SOF_HDA_SDW_BPT
+	tristate
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level.
+
 config SND_SOC_SOF_HDA_LINK_BASELINE
 	tristate
 	select SND_SOC_SOF_HDA if SND_SOC_SOF_HDA_LINK
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level.
 
 config SND_SOC_SOF_HDA
 	tristate
diff --git a/sound/soc/sof/intel/Makefile b/sound/soc/sof/intel/Makefile
index 806df08e3fd5..de1e37a76c29 100644
--- a/sound/soc/sof/intel/Makefile
+++ b/sound/soc/sof/intel/Makefile
@@ -12,6 +12,8 @@ snd-sof-intel-hda-generic-objs := hda.o hda-common-ops.o
 
 snd-sof-intel-hda-mlink-objs := hda-mlink.o
 
+snd-sof-intel-hda-sdw-bpt-objs := hda-sdw-bpt.o
+
 snd-sof-intel-hda-common-$(CONFIG_SND_SOC_SOF_HDA_PROBES) += hda-probes.o
 
 snd-sof-intel-hda-objs := hda-codec.o
@@ -26,6 +28,8 @@ obj-$(CONFIG_SND_SOC_SOF_HDA_GENERIC) += snd-sof-intel-hda-generic.o
 obj-$(CONFIG_SND_SOC_SOF_HDA_MLINK) += snd-sof-intel-hda-mlink.o
 obj-$(CONFIG_SND_SOC_SOF_HDA) += snd-sof-intel-hda.o
 
+obj-$(CONFIG_SND_SOF_SOF_HDA_SDW_BPT) += snd-sof-intel-hda-sdw-bpt.o
+
 snd-sof-pci-intel-tng-objs := pci-tng.o
 snd-sof-pci-intel-skl-objs := pci-skl.o skl.o hda-loader-skl.o
 snd-sof-pci-intel-apl-objs := pci-apl.o apl.o
diff --git a/sound/soc/sof/intel/hda-sdw-bpt.c b/sound/soc/sof/intel/hda-sdw-bpt.c
new file mode 100644
index 000000000000..980c75c3a6bd
--- /dev/null
+++ b/sound/soc/sof/intel/hda-sdw-bpt.c
@@ -0,0 +1,328 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2024 Intel Corporation. All rights reserved.
+//
+
+/*
+ * Hardware interface for SoundWire BPT support with HDA DMA
+ */
+
+#include <sound/hdaudio_ext.h>
+#include <sound/hda-mlink.h>
+#include <sound/hda-sdw-bpt.h>
+#include <sound/sof.h>
+#include "../ops.h"
+#include "../sof-priv.h"
+#include "hda.h"
+
+static int hda_sdw_bpt_dma_prepare(struct device *dev,
+				   struct hdac_ext_stream **sdw_bpt_stream,
+				   struct snd_dma_buffer *dmab_bdl,
+				   u32 bpt_num_bytes,
+				   unsigned int num_channels,
+				   int direction)
+{
+	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+	struct hdac_ext_stream *bpt_stream;
+	unsigned int format = HDA_CL_STREAM_FORMAT;
+
+	/*
+	 * the baseline format needs to be adjusted to
+	 * bandwidth requirements
+	 */
+	format |= (num_channels - 1);
+
+	dev_dbg(dev, "direction %d format_val %x\n", direction, format);
+
+	bpt_stream = hda_cl_prepare(dev, format,
+				    bpt_num_bytes,
+				    dmab_bdl,
+				    direction,
+				    false);
+	if (IS_ERR(bpt_stream)) {
+		dev_err(sdev->dev, "%s: SDW BPT DMA prepare failed: dir %d\n",
+			__func__, direction);
+		return PTR_ERR(bpt_stream);
+	}
+	*sdw_bpt_stream = bpt_stream;
+
+	if (hdac_stream(bpt_stream)->direction == SNDRV_PCM_STREAM_PLAYBACK) {
+		struct hdac_bus *bus = sof_to_bus(sdev);
+		struct hdac_ext_link *hlink;
+		int stream_tag;
+
+		stream_tag = hdac_stream(bpt_stream)->stream_tag;
+		hlink = hdac_bus_eml_sdw_get_hlink(bus);
+
+		snd_hdac_ext_bus_link_set_stream_id(hlink, stream_tag);
+	}
+	return 0;
+}
+
+static int hda_sdw_bpt_dma_deprepare(struct device *dev,
+				     struct hdac_ext_stream *sdw_bpt_stream,
+				     struct snd_dma_buffer *dmab_bdl)
+{
+	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+	int ret;
+
+	ret = hda_cl_cleanup(sdev->dev, dmab_bdl, sdw_bpt_stream);
+	if (ret < 0) {
+		dev_err(sdev->dev, "%s: SDW BPT DMA cleanup failed\n",
+			__func__);
+		return ret;
+	}
+
+	if (hdac_stream(sdw_bpt_stream)->direction == SNDRV_PCM_STREAM_PLAYBACK) {
+		struct hdac_bus *bus = sof_to_bus(sdev);
+		struct hdac_ext_link *hlink;
+		int stream_tag;
+
+		stream_tag = hdac_stream(sdw_bpt_stream)->stream_tag;
+		hlink = hdac_bus_eml_sdw_get_hlink(bus);
+
+		snd_hdac_ext_bus_link_clear_stream_id(hlink, stream_tag);
+	}
+
+	return 0;
+}
+
+static int hda_sdw_bpt_dma_enable(struct device *dev,
+				  struct hdac_ext_stream *sdw_bpt_stream)
+{
+	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+	int ret;
+
+	ret = hda_cl_trigger(sdev->dev, sdw_bpt_stream, SNDRV_PCM_TRIGGER_START);
+	if (ret < 0) {
+		dev_err(sdev->dev, "%s: SDW BPT DMA trigger start failed\n", __func__);
+		return ret;
+	}
+	return 0;
+}
+
+static int hda_sdw_bpt_dma_disable(struct device *dev,
+				   struct hdac_ext_stream *sdw_bpt_stream)
+{
+	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+	int ret;
+
+	ret = hda_cl_trigger(sdev->dev, sdw_bpt_stream, SNDRV_PCM_TRIGGER_STOP);
+	if (ret < 0) {
+		dev_err(sdev->dev, "%s: SDW BPT DMA trigger stop failed\n", __func__);
+		return ret;
+	}
+	return 0;
+}
+
+int hda_sdw_bpt_open(struct device *dev,
+		     int link_id,
+		     struct hdac_ext_stream **bpt_tx_stream,
+		     struct snd_dma_buffer *dmab_tx_bdl,
+		     u32 bpt_tx_num_bytes,
+		     u32 tx_dma_bandwidth,
+		     struct hdac_ext_stream **bpt_rx_stream,
+		     struct snd_dma_buffer *dmab_rx_bdl,
+		     u32 bpt_rx_num_bytes,
+		     u32 rx_dma_bandwidth)
+{
+	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+	unsigned int num_channels_tx;
+	unsigned int num_channels_rx;
+	int ret2;
+	int ret1;
+	int ret;
+
+	num_channels_tx = DIV_ROUND_UP(tx_dma_bandwidth, 48000 * 32);
+
+	ret = hda_sdw_bpt_dma_prepare(dev,
+				      bpt_tx_stream,
+				      dmab_tx_bdl,
+				      bpt_tx_num_bytes,
+				      num_channels_tx,
+				      SNDRV_PCM_STREAM_PLAYBACK);
+	if (ret < 0) {
+		dev_err(dev, "%s: hda_sdw_bpt_dma_prepare failed for TX: %d\n",
+			__func__, ret);
+		return ret;
+	}
+
+	num_channels_rx = DIV_ROUND_UP(rx_dma_bandwidth, 48000 * 32);
+
+	ret = hda_sdw_bpt_dma_prepare(dev,
+				      bpt_rx_stream,
+				      dmab_rx_bdl,
+				      bpt_rx_num_bytes,
+				      num_channels_rx,
+				      SNDRV_PCM_STREAM_CAPTURE);
+	if (ret < 0) {
+		dev_err(dev, "%s: hda_sdw_bpt_dma_prepare failed for RX: %d\n",
+			__func__, ret);
+
+		ret1 = hda_sdw_bpt_dma_deprepare(dev,
+						 *bpt_tx_stream,
+						 dmab_tx_bdl);
+		if (ret1 < 0)
+			dev_err(dev, "%s: hda_sdw_bpt_dma_deprepare failed for TX: %d\n",
+				__func__, ret1);
+		return ret;
+	}
+
+	/* we need to map the channels in PCMSyCM registers */
+	ret = hdac_bus_eml_sdw_map_stream_ch(sof_to_bus(sdev),
+					     link_id,
+					     0, /* cpu_dai->id -> PDI0 */
+					     GENMASK(num_channels_tx - 1, 0),
+					     hdac_stream(*bpt_tx_stream)->stream_tag,
+					     SNDRV_PCM_STREAM_PLAYBACK);
+	if (ret < 0)
+		dev_err(dev, "%s: hdac_bus_eml_sdw_map_stream_ch failed for TX: %d\n",
+			__func__, ret);
+
+	ret1 = hdac_bus_eml_sdw_map_stream_ch(sof_to_bus(sdev),
+					      link_id,
+					      1, /* cpu_dai->id -> PDI1 */
+					      GENMASK(num_channels_rx - 1, 0),
+					      hdac_stream(*bpt_rx_stream)->stream_tag,
+					      SNDRV_PCM_STREAM_CAPTURE);
+	if (ret1 < 0)
+		dev_err(dev, "%s: hdac_bus_eml_sdw_map_stream_ch failed for RX: %d\n",
+			__func__, ret1);
+
+	if (!ret)
+		ret = ret1;
+
+	if (ret < 0) {
+		ret2 = hda_sdw_bpt_close(dev,
+					 *bpt_tx_stream,
+					 dmab_tx_bdl,
+					 *bpt_rx_stream,
+					 dmab_rx_bdl);
+		if (ret2 < 0)
+			dev_err(dev, "%s: hda_sdw_bpt_close failed: %d\n",
+				__func__, ret2);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(hda_sdw_bpt_open, SND_SOC_SOF_INTEL_HDA_SDW_BPT);
+
+int hda_sdw_bpt_send_async(struct device *dev,
+			   struct hdac_ext_stream *bpt_tx_stream,
+			   struct hdac_ext_stream *bpt_rx_stream)
+{
+	int ret1;
+	int ret;
+
+	ret = hda_sdw_bpt_dma_enable(dev, bpt_tx_stream);
+	if (ret < 0) {
+		dev_err(dev, "%s: hda_sdw_bpt_dma_enable failed for TX: %d\n",
+			__func__, ret);
+		return ret;
+	}
+
+	ret = hda_sdw_bpt_dma_enable(dev, bpt_rx_stream);
+	if (ret < 0) {
+		dev_err(dev, "%s: hda_sdw_bpt_dma_enable failed for RX: %d\n",
+			__func__, ret);
+
+		ret1 = hda_sdw_bpt_dma_disable(dev, bpt_tx_stream);
+		if (ret1 < 0)
+			dev_err(dev, "%s: hda_sdw_bpt_dma_disable failed for TX: %d\n",
+				__func__, ret1);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(hda_sdw_bpt_send_async, SND_SOC_SOF_INTEL_HDA_SDW_BPT);
+
+/*
+ * 3s is several orders of magnitude larger than what is needed for a
+ * typical firmware download.
+ */
+#define HDA_BPT_IOC_TIMEOUT_MS 3000
+
+int hda_sdw_bpt_wait(struct device *dev,
+		     struct hdac_ext_stream *bpt_tx_stream,
+		     struct hdac_ext_stream *bpt_rx_stream)
+{
+	struct sof_intel_hda_stream *hda_tx_stream;
+	struct sof_intel_hda_stream *hda_rx_stream;
+	unsigned long time_tx_left;
+	unsigned long time_rx_left;
+	snd_pcm_uframes_t tx_position;
+	snd_pcm_uframes_t rx_position;
+	int ret = 0;
+	int ret1;
+
+	hda_tx_stream = container_of(bpt_tx_stream, struct sof_intel_hda_stream,
+				     hext_stream);
+	hda_rx_stream = container_of(bpt_rx_stream, struct sof_intel_hda_stream,
+				     hext_stream);
+
+	time_tx_left = wait_for_completion_timeout(&hda_tx_stream->ioc,
+						   msecs_to_jiffies(HDA_BPT_IOC_TIMEOUT_MS));
+	if (!time_tx_left) {
+		tx_position = hda_dsp_stream_get_position(hdac_stream(bpt_tx_stream),
+							  SNDRV_PCM_STREAM_PLAYBACK,
+							  false);
+		dev_err(dev, "%s: SDW BPT TX DMA did not complete: %ld\n",
+			__func__, tx_position);
+		ret = -ETIMEDOUT;
+	}
+
+	/* the wait should be minimal here */
+	time_rx_left = wait_for_completion_timeout(&hda_rx_stream->ioc,
+						   msecs_to_jiffies(HDA_BPT_IOC_TIMEOUT_MS));
+	if (!time_rx_left) {
+		rx_position = hda_dsp_stream_get_position(hdac_stream(bpt_rx_stream),
+							  SNDRV_PCM_STREAM_CAPTURE,
+							  false);
+		dev_err(dev, "%s: SDW BPT RX DMA did not complete: %ld\n",
+			__func__, rx_position);
+		ret = -ETIMEDOUT;
+	}
+
+	ret1 = hda_sdw_bpt_dma_disable(dev, bpt_rx_stream);
+	if (!ret)
+		ret = ret1;
+
+	ret1 = hda_sdw_bpt_dma_disable(dev, bpt_tx_stream);
+	if (!ret)
+		ret = ret1;
+
+	return ret;
+}
+EXPORT_SYMBOL_NS(hda_sdw_bpt_wait, SND_SOC_SOF_INTEL_HDA_SDW_BPT);
+
+int hda_sdw_bpt_close(struct device *dev,
+		      struct hdac_ext_stream *bpt_tx_stream,
+		      struct snd_dma_buffer *dmab_tx_bdl,
+		      struct hdac_ext_stream *bpt_rx_stream,
+		      struct snd_dma_buffer *dmab_rx_bdl)
+{
+	int ret;
+	int ret1;
+
+	ret = hda_sdw_bpt_dma_deprepare(dev,
+					bpt_tx_stream,
+					dmab_tx_bdl);
+
+	ret1 = hda_sdw_bpt_dma_deprepare(dev,
+					 bpt_rx_stream,
+					 dmab_rx_bdl);
+	if (!ret)
+		ret = ret1;
+
+	return ret;
+}
+EXPORT_SYMBOL_NS(hda_sdw_bpt_close, SND_SOC_SOF_INTEL_HDA_SDW_BPT);
+
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_COMMON);
+MODULE_IMPORT_NS(SND_SOC_SOF_HDA_MLINK);
-- 
2.39.2

