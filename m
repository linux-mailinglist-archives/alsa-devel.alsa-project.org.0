Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3731051134B
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 10:10:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82CCF181C;
	Wed, 27 Apr 2022 10:10:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82CCF181C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651047054;
	bh=x1HHezFMAAsqooc0y/oh06f3D6BI5oHMGZu/FOJEbP4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QwjDbsjvq+BExsxLD9WmPtbgyXxjMvgpE6b/rbRfG5cGDQRm6OHqhSXob/T/0HIEd
	 ZX4R2wwDFgAHyc8e/PFEcOWrzahCRVMTgJBAdJhSR8soUQYWD9b6Feg9SZRe4oB8Cu
	 2v7XTOEBl2LnqeLsTLPZ3PbjpqdJuYqq7xk9gc70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23093F80507;
	Wed, 27 Apr 2022 10:09:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36D17F804FE; Wed, 27 Apr 2022 10:09:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02327F8016E
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 10:09:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02327F8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Kp1d1kYp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651046950; x=1682582950;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x1HHezFMAAsqooc0y/oh06f3D6BI5oHMGZu/FOJEbP4=;
 b=Kp1d1kYpbPQ8YR4oceAvb03bFDvZo+OsLCOIO5YkrVOSLCIszKpDKXcL
 +8n8c/OLMaZEh01EHkCjW347V8vVZaoBJATWa/TaK6Wny8DvW7IPcJWeh
 h/IYsqVKzKFgamCCPWZOsAlnQCr5sQaCqfNzUhtvNmpgfV1UDeeSzZ2eS
 EDBr2nVfCbRP462XAB5e8SGQdvlvNFnIaOlMXiXs74jy+Lg1zQInMP1um
 OtYnfS0lbNCSHc5jpi+b9oOuIhVL4TCqc7HpSak+vrnB1jyf/ZLQSKeXj
 IZ6Jb3S/4wIU9UkUtt1ZXIQl2XZ5jJOQiGx0F+79MomHgEVt7MsZvlAVK w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="291006175"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="291006175"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 01:09:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="705437333"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 27 Apr 2022 01:09:01 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 02/14] ASoC: codecs: Add HD-Audio codec driver
Date: Wed, 27 Apr 2022 10:18:50 +0200
Message-Id: <20220427081902.3525183-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427081902.3525183-1-cezary.rojewski@intel.com>
References: <20220427081902.3525183-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

Add generic ASoC equivalent of ALSA HD-Audio codec. This codec is
designed to follow HDA_DEV_LEGACY convention. Driver wrapps existing
hda_codec.c handlers to prevent code duplication within the newly added
code. Number of DAIs created is dependent on capabilities exposed by the
codec itself. Because of this, single solution can be applied to support
every single HD-Audio codec type.

At the same, through the ASoC topology, platform drivers may limit the
number of endpoints available to the userspace as codec driver exposes
BE DAIs only.

Both hda_codec_probe() and hda_codec_remove() declare their expectations
on device's usage_count and suspended-status. This is to catch any
unexpected behavior as PM-related code for HD-Audio has been changing
quite a bit throughout the years.

In order for codec DAI list to reflect its actual PCM capabilities, PCMs
need to be built and that can only happen once codec device is
constructed. To do that, a valid component->card->snd_card pointer is
needed. Said pointer will be provided by the framework once all card
components are accounted for and their probing can begin. Usage of
"binder" BE DAI solves the problem - codec can be listed as one of
HD-Audio card components without declaring any actual BE DAIs
statically.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/Kconfig   |   5 +
 sound/soc/codecs/Makefile  |   2 +
 sound/soc/codecs/hda-dai.c | 102 ++++++++++
 sound/soc/codecs/hda.c     | 395 +++++++++++++++++++++++++++++++++++++
 sound/soc/codecs/hda.h     |  19 ++
 5 files changed, 523 insertions(+)
 create mode 100644 sound/soc/codecs/hda-dai.c
 create mode 100644 sound/soc/codecs/hda.c
 create mode 100644 sound/soc/codecs/hda.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index b106e5517090..23fdbf97e453 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -937,6 +937,11 @@ config SND_SOC_HDAC_HDA
 	tristate
 	select SND_HDA
 
+config SND_SOC_HDA
+	tristate "HD-Audio codec driver"
+	select SND_HDA_EXT_CORE
+	select SND_HDA
+
 config SND_SOC_ICS43432
 	tristate "ICS43423 and compatible i2s microphones"
 
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 28dc4edfd01f..d32026ae326f 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -106,6 +106,7 @@ snd-soc-es8328-spi-objs := es8328-spi.o
 snd-soc-gtm601-objs := gtm601.o
 snd-soc-hdac-hdmi-objs := hdac_hdmi.o
 snd-soc-hdac-hda-objs := hdac_hda.o
+snd-soc-hda-codec-objs := hda.o hda-dai.o
 snd-soc-ics43432-objs := ics43432.o
 snd-soc-inno-rk3036-objs := inno_rk3036.o
 snd-soc-isabelle-objs := isabelle.o
@@ -458,6 +459,7 @@ obj-$(CONFIG_SND_SOC_ES8328_SPI)+= snd-soc-es8328-spi.o
 obj-$(CONFIG_SND_SOC_GTM601)    += snd-soc-gtm601.o
 obj-$(CONFIG_SND_SOC_HDAC_HDMI) += snd-soc-hdac-hdmi.o
 obj-$(CONFIG_SND_SOC_HDAC_HDA) += snd-soc-hdac-hda.o
+obj-$(CONFIG_SND_SOC_HDA) += snd-soc-hda-codec.o
 obj-$(CONFIG_SND_SOC_ICS43432)	+= snd-soc-ics43432.o
 obj-$(CONFIG_SND_SOC_INNO_RK3036)	+= snd-soc-inno-rk3036.o
 obj-$(CONFIG_SND_SOC_ISABELLE)	+= snd-soc-isabelle.o
diff --git a/sound/soc/codecs/hda-dai.c b/sound/soc/codecs/hda-dai.c
new file mode 100644
index 000000000000..5371ff086261
--- /dev/null
+++ b/sound/soc/codecs/hda-dai.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+//
+// Author: Cezary Rojewski <cezary.rojewski@intel.com>
+//
+
+#include <sound/soc.h>
+#include <sound/hda_codec.h>
+#include "hda.h"
+
+static int hda_codec_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct hda_pcm_stream *stream_info;
+	struct hda_codec *codec;
+	struct hda_pcm *pcm;
+	int ret;
+
+	codec = dev_to_hda_codec(dai->dev);
+	stream_info = snd_soc_dai_get_dma_data(dai, substream);
+	pcm = container_of(stream_info, struct hda_pcm, stream[substream->stream]);
+
+	dev_dbg(dai->dev, "open stream codec: %08x, info: %p, pcm: %p %s substream: %p\n",
+		codec->core.vendor_id, stream_info, pcm, pcm->name, substream);
+
+	snd_hda_codec_pcm_get(pcm);
+
+	ret = stream_info->ops.open(stream_info, codec, substream);
+	if (ret < 0) {
+		dev_err(dai->dev, "codec open failed: %d\n", ret);
+		snd_hda_codec_pcm_put(pcm);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void hda_codec_dai_shutdown(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct hda_pcm_stream *stream_info;
+	struct hda_codec *codec;
+	struct hda_pcm *pcm;
+	int ret;
+
+	codec = dev_to_hda_codec(dai->dev);
+	stream_info = snd_soc_dai_get_dma_data(dai, substream);
+	pcm = container_of(stream_info, struct hda_pcm, stream[substream->stream]);
+
+	dev_dbg(dai->dev, "close stream codec: %08x, info: %p, pcm: %p %s substream: %p\n",
+		codec->core.vendor_id, stream_info, pcm, pcm->name, substream);
+
+	ret = stream_info->ops.close(stream_info, codec, substream);
+	if (ret < 0)
+		dev_err(dai->dev, "codec close failed: %d\n", ret);
+
+	snd_hda_codec_pcm_put(pcm);
+}
+
+static int hda_codec_dai_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct hda_pcm_stream *stream_info;
+	struct hda_codec *codec;
+
+	codec = dev_to_hda_codec(dai->dev);
+	stream_info = snd_soc_dai_get_dma_data(dai, substream);
+
+	snd_hda_codec_cleanup(codec, stream_info, substream);
+
+	return 0;
+}
+
+static int hda_codec_dai_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct hda_pcm_stream *stream_info;
+	struct hdac_stream *stream;
+	struct hda_codec *codec;
+	unsigned int format;
+	int ret;
+
+	codec = dev_to_hda_codec(dai->dev);
+	stream = substream->runtime->private_data;
+	stream_info = snd_soc_dai_get_dma_data(dai, substream);
+	format = snd_hdac_calc_stream_format(runtime->rate, runtime->channels, runtime->format,
+					     runtime->sample_bits, 0);
+
+	ret = snd_hda_codec_prepare(codec, stream_info, stream->stream_tag, format, substream);
+	if (ret < 0) {
+		dev_err(dai->dev, "codec prepare failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+const struct snd_soc_dai_ops snd_soc_hda_codec_dai_ops = {
+	.startup = hda_codec_dai_startup,
+	.shutdown = hda_codec_dai_shutdown,
+	.hw_free = hda_codec_dai_hw_free,
+	.prepare = hda_codec_dai_prepare,
+};
+EXPORT_SYMBOL_GPL(snd_soc_hda_codec_dai_ops);
diff --git a/sound/soc/codecs/hda.c b/sound/soc/codecs/hda.c
new file mode 100644
index 000000000000..edcb8bc6806b
--- /dev/null
+++ b/sound/soc/codecs/hda.c
@@ -0,0 +1,395 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+//
+// Author: Cezary Rojewski <cezary.rojewski@intel.com>
+//
+
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <sound/soc.h>
+#include <sound/hdaudio_ext.h>
+#include <sound/hda_i915.h>
+#include <sound/hda_codec.h>
+#include "hda.h"
+
+static int hda_codec_create_dais(struct hda_codec *codec, int pcm_count,
+				 struct snd_soc_dai_driver **drivers)
+{
+	struct device *dev = &codec->core.dev;
+	struct snd_soc_dai_driver *drvs;
+	struct hda_pcm *pcm;
+	int i;
+
+	drvs = devm_kcalloc(dev, pcm_count, sizeof(*drvs), GFP_KERNEL);
+	if (!drvs)
+		return -ENOMEM;
+
+	pcm = list_first_entry(&codec->pcm_list_head, struct hda_pcm, list);
+
+	for (i = 0; i < pcm_count; i++, pcm = list_next_entry(pcm, list)) {
+		struct snd_soc_pcm_stream *stream;
+		int dir;
+
+		dev_info(dev, "creating for %s %d\n", pcm->name, i);
+		drvs[i].id = i;
+		drvs[i].name = pcm->name;
+		drvs[i].ops = &snd_soc_hda_codec_dai_ops;
+
+		dir = SNDRV_PCM_STREAM_PLAYBACK;
+		stream = &drvs[i].playback;
+		if (!pcm->stream[dir].substreams) {
+			dev_info(dev, "skipping playback dai for %s\n", pcm->name);
+			goto capture_dais;
+		}
+
+		stream->stream_name =
+			devm_kasprintf(dev, GFP_KERNEL, "%s %s", pcm->name,
+				       snd_pcm_direction_name(dir));
+		if (!stream->stream_name)
+			return -ENOMEM;
+		stream->channels_min = pcm->stream[dir].channels_min;
+		stream->channels_max = pcm->stream[dir].channels_max;
+		stream->rates = pcm->stream[dir].rates;
+		stream->formats = pcm->stream[dir].formats;
+		stream->sig_bits = pcm->stream[dir].maxbps;
+
+capture_dais:
+		dir = SNDRV_PCM_STREAM_CAPTURE;
+		stream = &drvs[i].capture;
+		if (!pcm->stream[dir].substreams) {
+			dev_info(dev, "skipping capture dai for %s\n", pcm->name);
+			continue;
+		}
+
+		stream->stream_name =
+			devm_kasprintf(dev, GFP_KERNEL, "%s %s", pcm->name,
+				       snd_pcm_direction_name(dir));
+		if (!stream->stream_name)
+			return -ENOMEM;
+		stream->channels_min = pcm->stream[dir].channels_min;
+		stream->channels_max = pcm->stream[dir].channels_max;
+		stream->rates = pcm->stream[dir].rates;
+		stream->formats = pcm->stream[dir].formats;
+		stream->sig_bits = pcm->stream[dir].maxbps;
+	}
+
+	*drivers = drvs;
+	return 0;
+}
+
+static int hda_codec_register_dais(struct hda_codec *codec, struct snd_soc_component *component)
+{
+	struct snd_soc_dai_driver *drvs = NULL;
+	struct snd_soc_dapm_context *dapm;
+	struct hda_pcm *pcm;
+	int ret, pcm_count = 0;
+
+	if (list_empty(&codec->pcm_list_head))
+		return -EINVAL;
+	list_for_each_entry(pcm, &codec->pcm_list_head, list)
+		pcm_count++;
+
+	ret = hda_codec_create_dais(codec, pcm_count, &drvs);
+	if (ret < 0)
+		return ret;
+
+	dapm = snd_soc_component_get_dapm(component);
+
+	list_for_each_entry(pcm, &codec->pcm_list_head, list) {
+		struct snd_soc_dai *dai;
+
+		dai = snd_soc_register_dai(component, drvs, false);
+		if (!dai) {
+			dev_err(component->dev, "register dai for %s failed\n", pcm->name);
+			return -EINVAL;
+		}
+
+		ret = snd_soc_dapm_new_dai_widgets(dapm, dai);
+		if (ret < 0) {
+			dev_err(component->dev, "create widgets failed: %d\n", ret);
+			snd_soc_unregister_dai(dai);
+			return ret;
+		}
+
+		snd_soc_dai_init_dma_data(dai, &pcm->stream[0], &pcm->stream[1]);
+		drvs++;
+	}
+
+	return 0;
+}
+
+static void hda_codec_unregister_dais(struct hda_codec *codec,
+				      struct snd_soc_component *component)
+{
+	struct snd_soc_dai *dai, *save;
+	struct hda_pcm *pcm;
+
+	for_each_component_dais_safe(component, dai, save) {
+		list_for_each_entry(pcm, &codec->pcm_list_head, list) {
+			if (strcmp(dai->driver->name, pcm->name))
+				continue;
+
+			if (dai->playback_widget)
+				snd_soc_dapm_free_widget(dai->playback_widget);
+			if (dai->capture_widget)
+				snd_soc_dapm_free_widget(dai->capture_widget);
+			snd_soc_unregister_dai(dai);
+			break;
+		}
+	}
+}
+
+int hda_codec_probe_complete(struct hda_codec *codec)
+{
+	struct hdac_device *hdev = &codec->core;
+	struct hdac_bus *bus = hdev->bus;
+	int ret;
+
+	ret = snd_hda_codec_build_controls(codec);
+	if (ret < 0) {
+		dev_err(&hdev->dev, "unable to create controls %d\n", ret);
+		goto out;
+	}
+
+	/* Bus suspended codecs as it does not manage their pm */
+	pm_runtime_set_active(&hdev->dev);
+	/* rpm was forbidden in snd_hda_codec_device_new() */
+	snd_hda_codec_set_power_save(codec, 2000);
+	snd_hda_codec_register(codec);
+out:
+	/* Complement pm_runtime_get_sync(bus) in probe */
+	pm_runtime_mark_last_busy(bus->dev);
+	pm_runtime_put_autosuspend(bus->dev);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(hda_codec_probe_complete);
+
+/* Expects codec with usage_count=1 and status=suspended */
+static int hda_codec_probe(struct snd_soc_component *component)
+{
+	struct hda_codec *codec = dev_to_hda_codec(component->dev);
+	struct hdac_device *hdev = &codec->core;
+	struct hdac_bus *bus = hdev->bus;
+	struct hdac_ext_link *hlink;
+	hda_codec_patch_t patch;
+	int ret;
+
+#ifdef CONFIG_PM
+	WARN_ON(atomic_read(&hdev->dev.power.usage_count) != 1 ||
+		!pm_runtime_status_suspended(&hdev->dev));
+#endif
+
+	hlink = snd_hdac_ext_bus_link_at(bus, hdev->addr);
+	if (!hlink) {
+		dev_err(&hdev->dev, "hdac link not found\n");
+		return -EIO;
+	}
+
+	pm_runtime_get_sync(bus->dev);
+	if (hda_codec_is_display(codec))
+		snd_hdac_display_power(bus, hdev->addr, true);
+	snd_hdac_ext_bus_link_get(bus, hlink);
+
+	ret = snd_hda_codec_device_new(codec->bus, component->card->snd_card, hdev->addr, codec,
+				       false);
+	if (ret < 0) {
+		dev_err(&hdev->dev, "create hda codec failed: %d\n", ret);
+		goto device_new_err;
+	}
+
+	ret = snd_hda_codec_set_name(codec, codec->preset->name);
+	if (ret < 0) {
+		dev_err(&hdev->dev, "name failed %s\n", codec->preset->name);
+		goto err;
+	}
+
+	ret = snd_hdac_regmap_init(&codec->core);
+	if (ret < 0) {
+		dev_err(&hdev->dev, "regmap init failed\n");
+		goto err;
+	}
+
+	patch = (hda_codec_patch_t)codec->preset->driver_data;
+	if (!patch) {
+		dev_err(&hdev->dev, "no patch specified?\n");
+		ret = -EINVAL;
+		goto err;
+	}
+
+	ret = patch(codec);
+	if (ret < 0) {
+		dev_err(&hdev->dev, "patch failed %d\n", ret);
+		goto err;
+	}
+
+	/* configure codec for 1:1 PCM:DAI mapping */
+	codec->mst_no_extra_pcms = 1;
+
+	ret = snd_hda_codec_parse_pcms(codec);
+	if (ret < 0) {
+		dev_err(&hdev->dev, "unable to map pcms to dai %d\n", ret);
+		goto parse_pcms_err;
+	}
+
+	ret = hda_codec_register_dais(codec, component);
+	if (ret < 0) {
+		dev_err(&hdev->dev, "update dais failed: %d\n", ret);
+		goto parse_pcms_err;
+	}
+
+	if (!hda_codec_is_display(codec)) {
+		ret = hda_codec_probe_complete(codec);
+		if (ret < 0)
+			goto complete_err;
+	}
+
+	codec->core.lazy_cache = true;
+
+	return 0;
+
+complete_err:
+	hda_codec_unregister_dais(codec, component);
+parse_pcms_err:
+	if (codec->patch_ops.free)
+		codec->patch_ops.free(codec);
+err:
+	snd_hda_codec_cleanup_for_unbind(codec);
+device_new_err:
+	if (hda_codec_is_display(codec))
+		snd_hdac_display_power(bus, hdev->addr, false);
+
+	snd_hdac_ext_bus_link_put(bus, hlink);
+
+	pm_runtime_mark_last_busy(bus->dev);
+	pm_runtime_put_autosuspend(bus->dev);
+	return ret;
+}
+
+/* Leaves codec with usage_count=1 and status=suspended */
+static void hda_codec_remove(struct snd_soc_component *component)
+{
+	struct hda_codec *codec = dev_to_hda_codec(component->dev);
+	struct hdac_device *hdev = &codec->core;
+	struct hdac_bus *bus = hdev->bus;
+	struct hdac_ext_link *hlink;
+	bool was_registered = codec->registered;
+
+	/* Don't allow any more runtime suspends */
+	pm_runtime_forbid(&hdev->dev);
+
+	hda_codec_unregister_dais(codec, component);
+
+	if (codec->patch_ops.free)
+		codec->patch_ops.free(codec);
+
+	snd_hda_codec_cleanup_for_unbind(codec);
+	pm_runtime_put_noidle(&hdev->dev);
+	/* snd_hdac_device_exit() is only called on bus remove */
+	pm_runtime_set_suspended(&hdev->dev);
+
+	if (hda_codec_is_display(codec))
+		snd_hdac_display_power(bus, hdev->addr, false);
+
+	hlink = snd_hdac_ext_bus_link_at(bus, hdev->addr);
+	if (hlink)
+		snd_hdac_ext_bus_link_put(bus, hlink);
+	/*
+	 * HDMI card's hda_codec_probe_complete() (see late_probe()) may
+	 * not be called due to early error, leaving bus uc unbalanced
+	 */
+	if (!was_registered) {
+		pm_runtime_mark_last_busy(bus->dev);
+		pm_runtime_put_autosuspend(bus->dev);
+	}
+
+#ifdef CONFIG_PM
+	WARN_ON(atomic_read(&hdev->dev.power.usage_count) != 1 ||
+		!pm_runtime_status_suspended(&hdev->dev));
+#endif
+}
+
+static const struct snd_soc_dapm_route hda_dapm_routes[] = {
+	{"AIF1TX", NULL, "Codec Input Pin1"},
+	{"AIF2TX", NULL, "Codec Input Pin2"},
+	{"AIF3TX", NULL, "Codec Input Pin3"},
+
+	{"Codec Output Pin1", NULL, "AIF1RX"},
+	{"Codec Output Pin2", NULL, "AIF2RX"},
+	{"Codec Output Pin3", NULL, "AIF3RX"},
+};
+
+static const struct snd_soc_dapm_widget hda_dapm_widgets[] = {
+	/* Audio Interface */
+	SND_SOC_DAPM_AIF_IN("AIF1RX", "Analog Codec Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("AIF2RX", "Digital Codec Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("AIF3RX", "Alt Analog Codec Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("AIF1TX", "Analog Codec Capture", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("AIF2TX", "Digital Codec Capture", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("AIF3TX", "Alt Analog Codec Capture", 0, SND_SOC_NOPM, 0, 0),
+
+	/* Input Pins */
+	SND_SOC_DAPM_INPUT("Codec Input Pin1"),
+	SND_SOC_DAPM_INPUT("Codec Input Pin2"),
+	SND_SOC_DAPM_INPUT("Codec Input Pin3"),
+
+	/* Output Pins */
+	SND_SOC_DAPM_OUTPUT("Codec Output Pin1"),
+	SND_SOC_DAPM_OUTPUT("Codec Output Pin2"),
+	SND_SOC_DAPM_OUTPUT("Codec Output Pin3"),
+};
+
+static struct snd_soc_dai_driver card_binder_dai = {
+	.id = -1,
+	.name = "codec-probing-DAI",
+};
+
+static int hda_hdev_attach(struct hdac_device *hdev)
+{
+	struct hda_codec *codec = dev_to_hda_codec(&hdev->dev);
+	struct snd_soc_component_driver *comp_drv;
+
+	comp_drv = devm_kzalloc(&hdev->dev, sizeof(*comp_drv), GFP_KERNEL);
+	if (!comp_drv)
+		return -ENOMEM;
+
+	/*
+	 * It's save to rely on dev_name() rather than a copy as component
+	 * driver's lifetime is directly tied to hda codec one
+	 */
+	comp_drv->name = dev_name(&hdev->dev);
+	comp_drv->probe = hda_codec_probe;
+	comp_drv->remove = hda_codec_remove;
+	comp_drv->idle_bias_on = false;
+	if (!hda_codec_is_display(codec)) {
+		comp_drv->dapm_widgets = hda_dapm_widgets;
+		comp_drv->num_dapm_widgets = ARRAY_SIZE(hda_dapm_widgets);
+		comp_drv->dapm_routes = hda_dapm_routes;
+		comp_drv->num_dapm_routes = ARRAY_SIZE(hda_dapm_routes);
+	}
+
+	return snd_soc_register_component(&hdev->dev, comp_drv, &card_binder_dai, 1);
+}
+
+static int hda_hdev_detach(struct hdac_device *hdev)
+{
+	struct hda_codec *codec = dev_to_hda_codec(&hdev->dev);
+
+	if (codec->registered)
+		cancel_delayed_work_sync(&codec->jackpoll_work);
+
+	snd_soc_unregister_component(&hdev->dev);
+
+	return 0;
+}
+
+const struct hdac_ext_bus_ops soc_hda_ext_bus_ops = {
+	.hdev_attach = hda_hdev_attach,
+	.hdev_detach = hda_hdev_detach,
+};
+EXPORT_SYMBOL_GPL(soc_hda_ext_bus_ops);
+
+MODULE_DESCRIPTION("HD-Audio codec driver");
+MODULE_AUTHOR("Cezary Rojewski <cezary.rojewski@intel.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/hda.h b/sound/soc/codecs/hda.h
new file mode 100644
index 000000000000..78a2be4945b1
--- /dev/null
+++ b/sound/soc/codecs/hda.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+ *
+ * Author: Cezary Rojewski <cezary.rojewski@intel.com>
+ */
+
+#ifndef SND_SOC_CODECS_HDA_H
+#define SND_SOC_CODECS_HDA_H
+
+#define hda_codec_is_display(codec) \
+	((((codec)->core.vendor_id >> 16) & 0xFFFF) == 0x8086)
+
+extern const struct snd_soc_dai_ops snd_soc_hda_codec_dai_ops;
+
+extern const struct hdac_ext_bus_ops soc_hda_ext_bus_ops;
+int hda_codec_probe_complete(struct hda_codec *codec);
+
+#endif
-- 
2.25.1

