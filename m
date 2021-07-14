Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 786A03C7CE2
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jul 2021 05:24:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC91B16A0;
	Wed, 14 Jul 2021 05:23:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC91B16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626233063;
	bh=PzYVCBUhMYIYfApGzu21bM8OvOMrdUOw+K60BlKSKxg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rN31a+50OWEWiJtH0eyJ1TD+Hq9gm+pRn335I2XWcmpY9RA0b2RwHv0luWsuEPia8
	 hnloO/dvLJosvWjRD3tptM8mXPcSpoL/+pPhUQsb+0AixTfTW+xhIjkefANp/dLW84
	 eMGImXD/5YoAX7+ARik0LVcODLjM/W/dO8v98dAs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D421F80254;
	Wed, 14 Jul 2021 05:22:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 362EEF804DF; Wed, 14 Jul 2021 05:22:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41F2BF8013C
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 05:22:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41F2BF8013C
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="232086413"
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="232086413"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 20:22:25 -0700
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="459818099"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 20:22:22 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 01/10] ASoC: codecs: add SoundWire mockup device support
Date: Wed, 14 Jul 2021 11:22:00 +0800
Message-Id: <20210714032209.11284-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210714032209.11284-1-yung-chuan.liao@linux.intel.com>
References: <20210714032209.11284-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

To test the host controller and bus management code, it is currently
required to have a physical SoundWire peripheral attached to the
bus. To help with pre-silicon or early hardware enablement, it would
be very useful to have a SoundWire 'mockup' device that is exposed in
platform firmware but does not drive any signal on the bus.

This is different to the existing ASoC 'dummy' codec uses for I2S/TDM,
the SoundWire spec makes it clear that a device that is not attached
to the bus is not permitted to interact with the bus, be it for
command/control or data.

This patch exposes a 'mockup' device, with a minimalist driver, with 4
partID values reserved by Intel for such test configurations. The
mockup device exposes one full-duplex DAI based on 2 ports (DP1 for
playback and DP8 for capture). The capture data port is just virtual,
such a mockup device is prevented by the SoundWire specification from
presenting any data generated by a Source port without being Attached.

All the callbacks exposed by the SoundWire Slave interface are
populated, even if they just return immediately. This is intentional
to describe what a minimal codec driver should do and implement and
help new codec vendors provide support for their devices.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/codecs/Kconfig      |  18 ++
 sound/soc/codecs/Makefile     |   2 +
 sound/soc/codecs/sdw-mockup.c | 310 ++++++++++++++++++++++++++++++++++
 3 files changed, 330 insertions(+)
 create mode 100644 sound/soc/codecs/sdw-mockup.c

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 7ebae3f09435..9e3e4db3d75d 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -187,6 +187,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_RT715_SDCA_SDW
 	imply SND_SOC_RT1308_SDW
 	imply SND_SOC_RT1316_SDW
+	imply SND_SOC_SDW_MOCKUP
 	imply SND_SOC_SGTL5000
 	imply SND_SOC_SI476X
 	imply SND_SOC_SIMPLE_AMPLIFIER
@@ -1287,6 +1288,23 @@ config SND_SOC_RT715_SDCA_SDW
 	select REGMAP_SOUNDWIRE
 	select REGMAP_SOUNDWIRE_MBQ
 
+config SND_SOC_SDW_MOCKUP
+	tristate "SoundWire mockup codec"
+	depends on EXPERT
+	depends on SOUNDWIRE
+	help
+	  This option enables a SoundWire mockup codec that does not drive the
+	  bus, take part in the command/command protocol or generate data on a
+	  Source port.
+	  This option is only intended to be used for tests on a device
+	  with a connector, in combination with a bus analyzer, or to test new
+	  topologies that differ from the actual hardware layout.
+	  This mockup device could be totally virtual but could also be a
+	  real physical one with one key restriction: it is not allowed by the
+	  SoundWire specification to be configured via a sideband mechanism and
+	  generate audio data for capture. However, nothing prevents such a
+	  peripheral device from snooping the bus.
+
 #Freescale sgtl5000 codec
 config SND_SOC_SGTL5000
 	tristate "Freescale SGTL5000 CODEC"
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index de8b83dd2c76..d656b1405473 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -203,6 +203,7 @@ snd-soc-rt711-objs := rt711.o rt711-sdw.o
 snd-soc-rt711-sdca-objs := rt711-sdca.o rt711-sdca-sdw.o
 snd-soc-rt715-objs := rt715.o rt715-sdw.o
 snd-soc-rt715-sdca-objs := rt715-sdca.o rt715-sdca-sdw.o
+snd-soc-sdw-mockup-objs := sdw-mockup.o
 snd-soc-sgtl5000-objs := sgtl5000.o
 snd-soc-alc5623-objs := alc5623.o
 snd-soc-alc5632-objs := alc5632.o
@@ -530,6 +531,7 @@ obj-$(CONFIG_SND_SOC_RT711)     += snd-soc-rt711.o
 obj-$(CONFIG_SND_SOC_RT711_SDCA_SDW)     += snd-soc-rt711-sdca.o
 obj-$(CONFIG_SND_SOC_RT715)     += snd-soc-rt715.o
 obj-$(CONFIG_SND_SOC_RT715_SDCA_SDW)     += snd-soc-rt715-sdca.o
+obj-$(CONFIG_SND_SOC_SDW_MOCKUP)     += snd-soc-sdw-mockup.o
 obj-$(CONFIG_SND_SOC_SGTL5000)  += snd-soc-sgtl5000.o
 obj-$(CONFIG_SND_SOC_SIGMADSP)	+= snd-soc-sigmadsp.o
 obj-$(CONFIG_SND_SOC_SIGMADSP_I2C)	+= snd-soc-sigmadsp-i2c.o
diff --git a/sound/soc/codecs/sdw-mockup.c b/sound/soc/codecs/sdw-mockup.c
new file mode 100644
index 000000000000..a4f79eb2c69d
--- /dev/null
+++ b/sound/soc/codecs/sdw-mockup.c
@@ -0,0 +1,310 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// sdw-mockup.c -- a mockup SoundWire codec for tests where only the host
+// drives the bus.
+//
+// Copyright(c) 2021 Intel Corporation
+//
+//
+
+#include <linux/device.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+#include <linux/soundwire/sdw_registers.h>
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+
+struct  sdw_mockup_priv {
+	struct sdw_slave *slave;
+};
+
+struct sdw_stream_data {
+	struct sdw_stream_runtime *sdw_stream;
+};
+
+static int sdw_mockup_component_probe(struct snd_soc_component *component)
+{
+	return 0;
+}
+
+static void sdw_mockup_component_remove(struct snd_soc_component *component)
+{
+}
+
+static const struct snd_soc_component_driver snd_soc_sdw_mockup_component = {
+	.probe = sdw_mockup_component_probe,
+	.remove = sdw_mockup_component_remove,
+};
+
+static int sdw_mockup_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
+				     int direction)
+{
+	struct sdw_stream_data *stream;
+
+	if (!sdw_stream)
+		return 0;
+
+	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
+	if (!stream)
+		return -ENOMEM;
+
+	stream->sdw_stream = sdw_stream;
+
+	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
+	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
+		dai->playback_dma_data = stream;
+	else
+		dai->capture_dma_data = stream;
+
+	return 0;
+}
+
+static void sdw_mockup_shutdown(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct sdw_stream_data *stream;
+
+	stream = snd_soc_dai_get_dma_data(dai, substream);
+	snd_soc_dai_set_dma_data(dai, substream, NULL);
+	kfree(stream);
+}
+
+static int sdw_mockup_pcm_hw_params(struct snd_pcm_substream *substream,
+				    struct snd_pcm_hw_params *params,
+				    struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct sdw_mockup_priv *sdw_mockup = snd_soc_component_get_drvdata(component);
+	struct sdw_stream_config stream_config;
+	struct sdw_port_config port_config;
+	enum sdw_data_direction direction;
+	struct sdw_stream_data *stream;
+	int num_channels;
+	int port;
+	int ret;
+
+	stream = snd_soc_dai_get_dma_data(dai, substream);
+	if (!stream)
+		return -EINVAL;
+
+	if (!sdw_mockup->slave)
+		return -EINVAL;
+
+	/* SoundWire specific configuration */
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		direction = SDW_DATA_DIR_RX;
+		port = 1;
+	} else {
+		direction = SDW_DATA_DIR_TX;
+		port = 8;
+	}
+
+	stream_config.frame_rate = params_rate(params);
+	stream_config.ch_count = params_channels(params);
+	stream_config.bps = snd_pcm_format_width(params_format(params));
+	stream_config.direction = direction;
+
+	num_channels = params_channels(params);
+	port_config.ch_mask = (1 << num_channels) - 1;
+	port_config.num = port;
+
+	ret = sdw_stream_add_slave(sdw_mockup->slave, &stream_config,
+				   &port_config, 1, stream->sdw_stream);
+	if (ret)
+		dev_err(dai->dev, "Unable to configure port\n");
+
+	return ret;
+}
+
+static int sdw_mockup_pcm_hw_free(struct snd_pcm_substream *substream,
+				  struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct sdw_mockup_priv *sdw_mockup = snd_soc_component_get_drvdata(component);
+	struct sdw_stream_data *stream =
+		snd_soc_dai_get_dma_data(dai, substream);
+
+	if (!sdw_mockup->slave)
+		return -EINVAL;
+
+	sdw_stream_remove_slave(sdw_mockup->slave, stream->sdw_stream);
+	return 0;
+}
+
+static const struct snd_soc_dai_ops sdw_mockup_ops = {
+	.hw_params	= sdw_mockup_pcm_hw_params,
+	.hw_free	= sdw_mockup_pcm_hw_free,
+	.set_sdw_stream	= sdw_mockup_set_sdw_stream,
+	.shutdown	= sdw_mockup_shutdown,
+};
+
+static struct snd_soc_dai_driver sdw_mockup_dai[] = {
+	{
+		.name = "sdw-mockup-aif1",
+		.id = 1,
+		.playback = {
+			.stream_name = "DP1 Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+		},
+		.capture = {
+			.stream_name = "DP8 Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+		},
+		.ops = &sdw_mockup_ops,
+	},
+};
+
+static int sdw_mockup_update_status(struct sdw_slave *slave,
+				    enum sdw_slave_status status)
+{
+	return 0;
+}
+
+static int sdw_mockup_read_prop(struct sdw_slave *slave)
+{
+	struct sdw_slave_prop *prop = &slave->prop;
+	int nval;
+	int i, j;
+	u32 bit;
+	unsigned long addr;
+	struct sdw_dpn_prop *dpn;
+
+	prop->paging_support = false;
+
+	/*
+	 * first we need to allocate memory for set bits in port lists
+	 * the port allocation is completely arbitrary:
+	 * DP0 is not supported
+	 * DP1 is sink
+	 * DP8 is source
+	 */
+	prop->source_ports = BIT(8);
+	prop->sink_ports = BIT(1);
+
+	nval = hweight32(prop->source_ports);
+	prop->src_dpn_prop = devm_kcalloc(&slave->dev, nval,
+					  sizeof(*prop->src_dpn_prop),
+					  GFP_KERNEL);
+	if (!prop->src_dpn_prop)
+		return -ENOMEM;
+
+	i = 0;
+	dpn = prop->src_dpn_prop;
+	addr = prop->source_ports;
+	for_each_set_bit(bit, &addr, 32) {
+		dpn[i].num = bit;
+		dpn[i].type = SDW_DPN_FULL;
+		dpn[i].simple_ch_prep_sm = true;
+		i++;
+	}
+
+	/* do this again for sink now */
+	nval = hweight32(prop->sink_ports);
+	prop->sink_dpn_prop = devm_kcalloc(&slave->dev, nval,
+					   sizeof(*prop->sink_dpn_prop),
+					   GFP_KERNEL);
+	if (!prop->sink_dpn_prop)
+		return -ENOMEM;
+
+	j = 0;
+	dpn = prop->sink_dpn_prop;
+	addr = prop->sink_ports;
+	for_each_set_bit(bit, &addr, 32) {
+		dpn[j].num = bit;
+		dpn[j].type = SDW_DPN_FULL;
+		dpn[j].simple_ch_prep_sm = true;
+		j++;
+	}
+
+	prop->simple_clk_stop_capable = true;
+
+	/* wake-up event */
+	prop->wake_capable = 0;
+
+	return 0;
+}
+
+static int sdw_mockup_bus_config(struct sdw_slave *slave,
+				 struct sdw_bus_params *params)
+{
+	return 0;
+}
+
+static int sdw_mockup_interrupt_callback(struct sdw_slave *slave,
+					 struct sdw_slave_intr_status *status)
+{
+	return 0;
+}
+
+static const struct sdw_slave_ops sdw_mockup_slave_ops = {
+	.read_prop = sdw_mockup_read_prop,
+	.interrupt_callback = sdw_mockup_interrupt_callback,
+	.update_status = sdw_mockup_update_status,
+	.bus_config = sdw_mockup_bus_config,
+};
+
+static int sdw_mockup_sdw_probe(struct sdw_slave *slave,
+				const struct sdw_device_id *id)
+{
+	struct device *dev = &slave->dev;
+	struct sdw_mockup_priv *sdw_mockup;
+	int ret;
+
+	sdw_mockup = devm_kzalloc(dev, sizeof(*sdw_mockup), GFP_KERNEL);
+	if (!sdw_mockup)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, sdw_mockup);
+	sdw_mockup->slave = slave;
+
+	ret =  devm_snd_soc_register_component(dev,
+					       &snd_soc_sdw_mockup_component,
+					       sdw_mockup_dai,
+					       ARRAY_SIZE(sdw_mockup_dai));
+
+	return ret;
+}
+
+static int sdw_mockup_sdw_remove(struct sdw_slave *slave)
+{
+	return 0;
+}
+
+/*
+ * Intel reserved parts ID with the following mapping expected:
+ * 0xAAAA: generic full-duplex codec
+ * 0xAA55: headset codec (mock-up of RT711/RT5682) - full-duplex
+ * 0x55AA: amplifier (mock-up of RT1308/Maxim 98373) - playback only with
+ * IV feedback
+ * 0x5555: mic codec (mock-up of RT715) - capture-only
+ */
+static const struct sdw_device_id sdw_mockup_id[] = {
+	SDW_SLAVE_ENTRY_EXT(0x0105, 0xAAAA, 0x0, 0, 0),
+	SDW_SLAVE_ENTRY_EXT(0x0105, 0xAA55, 0x0, 0, 0),
+	SDW_SLAVE_ENTRY_EXT(0x0105, 0x55AA, 0x0, 0, 0),
+	SDW_SLAVE_ENTRY_EXT(0x0105, 0x5555, 0x0, 0, 0),
+	{},
+};
+MODULE_DEVICE_TABLE(sdw, sdw_mockup_id);
+
+static struct sdw_driver sdw_mockup_sdw_driver = {
+	.driver = {
+		.name = "sdw-mockup",
+		.owner = THIS_MODULE,
+	},
+	.probe = sdw_mockup_sdw_probe,
+	.remove = sdw_mockup_sdw_remove,
+	.ops = &sdw_mockup_slave_ops,
+	.id_table = sdw_mockup_id,
+};
+module_sdw_driver(sdw_mockup_sdw_driver);
+
+MODULE_DESCRIPTION("ASoC SDW mockup codec driver");
+MODULE_AUTHOR("Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>");
+MODULE_LICENSE("GPL");
-- 
2.17.1

