Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E6251134C
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 10:11:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD472184E;
	Wed, 27 Apr 2022 10:10:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD472184E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651047069;
	bh=aCNwSRVzOgmE3IAm/BBQcHvML+a7RFXzJdtkO818LnI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qHMMnAquWjmtrqHRShA1L2FnxiDB2p2rQgod1UYw0cs3mF2TlT6JMRCHPnWUOVg08
	 w8ep+T2Lol3Uuiy+405mSa08UvAxL3WJg972MU3JsAXpVAHVW9p5tUspyXLzmje0yE
	 5YRdgm38o7SMLVnaXQttm9xsIUVRUUN3g9d3fzYA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0824AF80511;
	Wed, 27 Apr 2022 10:09:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19070F8016E; Wed, 27 Apr 2022 10:09:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 999E4F800AE
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 10:09:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 999E4F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="k5F47JC9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651046950; x=1682582950;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aCNwSRVzOgmE3IAm/BBQcHvML+a7RFXzJdtkO818LnI=;
 b=k5F47JC9hZBjVIqL3bAivUzDz0PP1JGg66S/9+J7MEdoAurpnv1Hj0zA
 WPXmz7Lk/BekHgY044eWP1OjNG4+cu7Plho/GetA2AXMzda6hQe1hgGJM
 DPI5NAEfu+Uxozhdmneg7ISstgjn8PDp7Ti2XEFFeBWjoQoxJ7dmPRpyG
 TuoKZ/rmsq7nRGfciIe42SqIntkQaTLgICGyGizC6QKQjUHyKVLF8BJkO
 j/wNR8cA6BiRJm8f8GlsvQMVdtpBXqEgIIpMkZVe1IStSjpKSL496dFXD
 a70ZKG/Xyfy3BNWAmNiR/ME6pePBlu1/GJJXZDT/POqTqu2PTIzLU3alY w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="291006189"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="291006189"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 01:09:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="705437353"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 27 Apr 2022 01:09:05 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 03/14] ASoC: Intel: avs: Add HDAudio machine board
Date: Wed, 27 Apr 2022 10:18:51 +0200
Message-Id: <20220427081902.3525183-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427081902.3525183-1-cezary.rojewski@intel.com>
References: <20220427081902.3525183-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Connect AVS driver with ASoC HDAudio codec with help of this machine
board. Similarly to its platform and codec components, DAI links and
routes are being created dynamically so single board can be used across
all HDAudio codec types.

Card makes use of "binder" BE DAI Link so HDAudio codec driver can be
listed as one of its components. This allows for BE DAIs to be created
dynamically, based on HDAudio codec capabilities.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/Kconfig              |   3 +
 sound/soc/intel/avs/Makefile         |   3 +
 sound/soc/intel/avs/boards/Kconfig   |  15 ++
 sound/soc/intel/avs/boards/Makefile  |   5 +
 sound/soc/intel/avs/boards/hdaudio.c | 294 +++++++++++++++++++++++++++
 5 files changed, 320 insertions(+)
 create mode 100644 sound/soc/intel/avs/boards/Kconfig
 create mode 100644 sound/soc/intel/avs/boards/Makefile
 create mode 100644 sound/soc/intel/avs/boards/hdaudio.c

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index be42c4eff165..851e8053e2fa 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -224,5 +224,8 @@ config SND_SOC_INTEL_AVS
 	  capabilities. This includes Skylake, Kabylake, Amberlake and
 	  Apollolake.
 
+# Machine board drivers
+source "sound/soc/intel/avs/boards/Kconfig"
+
 # ASoC codec drivers
 source "sound/soc/intel/boards/Kconfig"
diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
index 952f51977656..abd51fb6b55d 100644
--- a/sound/soc/intel/avs/Makefile
+++ b/sound/soc/intel/avs/Makefile
@@ -5,3 +5,6 @@ snd-soc-avs-objs := dsp.o ipc.o messages.o utils.o core.o loader.o \
 snd-soc-avs-objs += cldma.o
 
 obj-$(CONFIG_SND_SOC_INTEL_AVS) += snd-soc-avs.o
+
+# Machine support
+obj-$(CONFIG_SND_SOC) += boards/
diff --git a/sound/soc/intel/avs/boards/Kconfig b/sound/soc/intel/avs/boards/Kconfig
new file mode 100644
index 000000000000..de62c0437f6e
--- /dev/null
+++ b/sound/soc/intel/avs/boards/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menu "Intel AVS Machine drivers"
+	depends on SND_SOC_INTEL_AVS
+
+comment "Available DSP configurations"
+
+config SND_SOC_INTEL_AVS_MACH_HDAUDIO
+	tristate "HD-Audio generic board"
+	select SND_SOC_HDA
+	help
+	  This adds support for AVS with HDAudio codec configuration.
+	  Say Y or m if you have such a device. This is a recommended option.
+	  If unsure select "N".
+
+endmenu
diff --git a/sound/soc/intel/avs/boards/Makefile b/sound/soc/intel/avs/boards/Makefile
new file mode 100644
index 000000000000..e5281148e5d4
--- /dev/null
+++ b/sound/soc/intel/avs/boards/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+snd-soc-avs-hdaudio-objs := hdaudio.o
+
+obj-$(CONFIG_SND_SOC_INTEL_AVS_MACH_HDAUDIO) += snd-soc-avs-hdaudio.o
diff --git a/sound/soc/intel/avs/boards/hdaudio.c b/sound/soc/intel/avs/boards/hdaudio.c
new file mode 100644
index 000000000000..d2fc41d39448
--- /dev/null
+++ b/sound/soc/intel/avs/boards/hdaudio.c
@@ -0,0 +1,294 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+//
+// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+//          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+//
+
+#include <linux/platform_device.h>
+#include <sound/hda_codec.h>
+#include <sound/hda_i915.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include "../../../codecs/hda.h"
+
+static int avs_create_dai_links(struct device *dev, struct hda_codec *codec, int pcm_count,
+				const char *platform_name, struct snd_soc_dai_link **links)
+{
+	struct snd_soc_dai_link_component *platform;
+	struct snd_soc_dai_link *dl;
+	struct hda_pcm *pcm;
+	const char *cname = dev_name(&codec->core.dev);
+	int i;
+
+	dl = devm_kcalloc(dev, pcm_count, sizeof(*dl), GFP_KERNEL);
+	platform = devm_kzalloc(dev, sizeof(*platform), GFP_KERNEL);
+	if (!dl || !platform)
+		return -ENOMEM;
+
+	platform->name = platform_name;
+	pcm = list_first_entry(&codec->pcm_list_head, struct hda_pcm, list);
+
+	for (i = 0; i < pcm_count; i++, pcm = list_next_entry(pcm, list)) {
+		dl[i].name = devm_kasprintf(dev, GFP_KERNEL, "%s link%d", cname, i);
+		if (!dl[i].name)
+			return -ENOMEM;
+
+		dl[i].id = i;
+		dl[i].nonatomic = 1;
+		dl[i].no_pcm = 1;
+		dl[i].dpcm_playback = 1;
+		dl[i].dpcm_capture = 1;
+		dl[i].platforms = platform;
+		dl[i].num_platforms = 1;
+
+		dl[i].codecs = devm_kzalloc(dev, sizeof(*dl->codecs), GFP_KERNEL);
+		dl[i].cpus = devm_kzalloc(dev, sizeof(*dl->cpus), GFP_KERNEL);
+		if (!dl[i].codecs || !dl[i].cpus)
+			return -ENOMEM;
+
+		dl[i].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "%s-cpu%d", cname, i);
+		if (!dl[i].cpus->dai_name)
+			return -ENOMEM;
+
+		dl[i].codecs->name = devm_kstrdup(dev, cname, GFP_KERNEL);
+		dl[i].codecs->dai_name = pcm->name;
+		dl[i].num_codecs = 1;
+		dl[i].num_cpus = 1;
+	}
+
+	*links = dl;
+	return 0;
+}
+
+static int avs_create_dapm_routes(struct device *dev, struct hda_codec *codec, int pcm_count,
+				  struct snd_soc_dapm_route **routes, int *num_routes)
+{
+	struct snd_soc_dapm_route *dr;
+	struct hda_pcm *pcm;
+	const char *cname = dev_name(&codec->core.dev);
+	int i, n = 0;
+
+	/* at max twice the number of pcms */
+	dr = devm_kcalloc(dev, pcm_count * 2, sizeof(*dr), GFP_KERNEL);
+	if (!dr)
+		return -ENOMEM;
+
+	pcm = list_first_entry(&codec->pcm_list_head, struct hda_pcm, list);
+
+	for (i = 0; i < pcm_count; i++, pcm = list_next_entry(pcm, list)) {
+		struct hda_pcm_stream *stream;
+		int dir;
+
+		dir = SNDRV_PCM_STREAM_PLAYBACK;
+		stream = &pcm->stream[dir];
+		if (!stream->substreams)
+			goto capture_routes;
+
+		dr[n].sink = devm_kasprintf(dev, GFP_KERNEL, "%s %s", pcm->name,
+					    snd_pcm_direction_name(dir));
+		dr[n].source = devm_kasprintf(dev, GFP_KERNEL, "%s-cpu%d Tx", cname, i);
+		if (!dr[n].sink || !dr[n].source)
+			return -ENOMEM;
+		n++;
+
+capture_routes:
+		dir = SNDRV_PCM_STREAM_CAPTURE;
+		stream = &pcm->stream[dir];
+		if (!stream->substreams)
+			continue;
+
+		dr[n].sink = devm_kasprintf(dev, GFP_KERNEL, "%s-cpu%d Rx", cname, i);
+		dr[n].source = devm_kasprintf(dev, GFP_KERNEL, "%s %s", pcm->name,
+					      snd_pcm_direction_name(dir));
+		if (!dr[n].sink || !dr[n].source)
+			return -ENOMEM;
+		n++;
+	}
+
+	*routes = dr;
+	*num_routes = n;
+	return 0;
+}
+
+/* Should be aligned with SectionPCM's name from topology */
+#define FEDAI_NAME_PREFIX "HDMI"
+
+static struct snd_pcm *
+avs_card_hdmi_pcm_at(struct snd_soc_card *card, int hdmi_idx)
+{
+	struct snd_soc_pcm_runtime *rtd;
+	int dir = SNDRV_PCM_STREAM_PLAYBACK;
+
+	for_each_card_rtds(card, rtd) {
+		struct snd_pcm *spcm;
+		int ret, n;
+
+		spcm = rtd->pcm ? rtd->pcm->streams[dir].pcm : NULL;
+		if (!spcm || !strstr(spcm->id, FEDAI_NAME_PREFIX))
+			continue;
+
+		ret = sscanf(spcm->id, FEDAI_NAME_PREFIX "%d", &n);
+		if (ret != 1)
+			continue;
+		if (n == hdmi_idx)
+			return rtd->pcm;
+	}
+
+	return NULL;
+}
+
+static int avs_card_late_probe(struct snd_soc_card *card)
+{
+	struct snd_soc_acpi_mach *mach = dev_get_platdata(card->dev);
+	struct hda_codec *codec = mach->pdata;
+	struct hda_pcm *hpcm;
+	/* Topology pcm indexing is 1-based */
+	int i = 1;
+
+	list_for_each_entry(hpcm, &codec->pcm_list_head, list) {
+		struct snd_pcm *spcm;
+
+		spcm = avs_card_hdmi_pcm_at(card, i);
+		if (spcm) {
+			hpcm->pcm = spcm;
+			hpcm->device = spcm->device;
+			dev_info(card->dev, "%s: mapping HDMI converter %d to PCM %d (%p)\n",
+				 __func__, i, hpcm->device, spcm);
+		} else {
+			hpcm->pcm = NULL;
+			hpcm->device = SNDRV_PCM_INVALID_DEVICE;
+			dev_warn(card->dev, "%s: no PCM in topology for HDMI converter %d\n",
+				 __func__, i);
+		}
+		i++;
+	}
+
+	return hda_codec_probe_complete(codec);
+}
+
+static int avs_probing_link_init(struct snd_soc_pcm_runtime *rtm)
+{
+	struct snd_soc_dapm_route *routes;
+	struct snd_soc_acpi_mach *mach;
+	struct snd_soc_dai_link *links = NULL;
+	struct snd_soc_card *card = rtm->card;
+	struct hda_codec *codec;
+	struct hda_pcm *pcm;
+	int ret, n, pcm_count = 0;
+
+	mach = dev_get_platdata(card->dev);
+	codec = mach->pdata;
+
+	if (list_empty(&codec->pcm_list_head))
+		return -EINVAL;
+	list_for_each_entry(pcm, &codec->pcm_list_head, list)
+		pcm_count++;
+
+	ret = avs_create_dai_links(card->dev, codec, pcm_count, mach->mach_params.platform, &links);
+	if (ret < 0) {
+		dev_err(card->dev, "create links failed: %d\n", ret);
+		return ret;
+	}
+
+	for (n = 0; n < pcm_count; n++) {
+		ret = snd_soc_add_pcm_runtime(card, &links[n]);
+		if (ret < 0) {
+			dev_err(card->dev, "add links failed: %d\n", ret);
+			return ret;
+		}
+	}
+
+	ret = avs_create_dapm_routes(card->dev, codec, pcm_count, &routes, &n);
+	if (ret < 0) {
+		dev_err(card->dev, "create routes failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, routes, n);
+	if (ret < 0) {
+		dev_err(card->dev, "add routes failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+SND_SOC_DAILINK_DEF(dummy, DAILINK_COMP_ARRAY(COMP_DUMMY()));
+
+static struct snd_soc_dai_link probing_link = {
+	.name = "probing-LINK",
+	.id = -1,
+	.nonatomic = 1,
+	.no_pcm = 1,
+	.dpcm_playback = 1,
+	.dpcm_capture = 1,
+	.cpus = dummy,
+	.num_cpus = ARRAY_SIZE(dummy),
+	.init = avs_probing_link_init,
+};
+
+static int avs_hdaudio_probe(struct platform_device *pdev)
+{
+	struct snd_soc_dai_link *binder;
+	struct snd_soc_acpi_mach *mach;
+	struct snd_soc_card *card;
+	struct device *dev = &pdev->dev;
+	struct hda_codec *codec;
+
+	mach = dev_get_platdata(dev);
+	codec = mach->pdata;
+
+	/* codec may be unloaded before card's probe() fires */
+	if (!device_is_registered(&codec->core.dev))
+		return -ENODEV;
+
+	binder = devm_kmemdup(dev, &probing_link, sizeof(probing_link), GFP_KERNEL);
+	if (!binder)
+		return -ENOMEM;
+
+	binder->platforms = devm_kzalloc(dev, sizeof(*binder->platforms), GFP_KERNEL);
+	binder->codecs = devm_kzalloc(dev, sizeof(*binder->codecs), GFP_KERNEL);
+	if (!binder->platforms || !binder->codecs)
+		return -ENOMEM;
+
+	binder->codecs->name = devm_kstrdup(dev, dev_name(&codec->core.dev), GFP_KERNEL);
+	if (!binder->codecs->name)
+		return -ENOMEM;
+
+	binder->platforms->name = mach->mach_params.platform;
+	binder->num_platforms = 1;
+	binder->codecs->dai_name = "codec-probing-DAI";
+	binder->num_codecs = 1;
+
+	card = devm_kzalloc(dev, sizeof(*card), GFP_KERNEL);
+	if (!card)
+		return -ENOMEM;
+
+	card->name = binder->codecs->name;
+	card->dev = dev;
+	card->owner = THIS_MODULE;
+	card->dai_link = binder;
+	card->num_links = 1;
+	card->fully_routed = true;
+	if (hda_codec_is_display(codec))
+		card->late_probe = avs_card_late_probe;
+
+	return devm_snd_soc_register_card(dev, card);
+}
+
+static struct platform_driver avs_hdaudio_driver = {
+	.probe = avs_hdaudio_probe,
+	.driver = {
+		.name = "avs_hdaudio",
+		.pm = &snd_soc_pm_ops,
+	},
+};
+
+module_platform_driver(avs_hdaudio_driver)
+
+MODULE_DESCRIPTION("Intel HD-Audio machine driver");
+MODULE_AUTHOR("Cezary Rojewski <cezary.rojewski@intel.com>");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:avs_hdaudio");
-- 
2.25.1

