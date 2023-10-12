Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 054397C767E
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 21:14:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 385ECE7F;
	Thu, 12 Oct 2023 21:13:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 385ECE7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697138078;
	bh=ntdkCftW17y+bOemdjhh8YycvkWyehsJkfEri82mkVM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VmdIdbAMp3mOxQ5swWXmhfTMFTdUXapCQYdOBiz7/wQM9UEFpQj53tQc9WkbyBhfe
	 9aQscFp8RKNixyM1Lw7n06IxVNRvpN9Vv5OKeoKyRIxpmZI7uMFEDog+r7GSSd/Shy
	 ZN53P5Rc0U+TXMaXEVcNK+IsYRr/+Gbz/Gtfs0xg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2CC0F8057E; Thu, 12 Oct 2023 21:10:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA094F8062F;
	Thu, 12 Oct 2023 21:09:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79975F80567; Thu, 12 Oct 2023 21:09:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 32532F8056F
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 21:09:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32532F8056F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OJjwksB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697137747; x=1728673747;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ntdkCftW17y+bOemdjhh8YycvkWyehsJkfEri82mkVM=;
  b=OJjwksB7R4j9qE3FLZFaWFLzovZw/58f1agwHBC46OVp4yZzScSy7srh
   ATFbFvDU9GK4KaIFGSOYLxHIxeZStSl9PN9MMMoeTLOOcNMfCkuItYeWd
   o5MFI+A4ta/JWnJjI+yNeSqGvc47Oo+5O+R2ET9HgJV7zVahRSKV69jZa
   H5N3YcsIckosHc2bNJwVfMqCljH0wVUraaM7M1z3G7gXfURXNyhHfENRc
   PnyAaA2pfWA2+j5QWYFeY4E6WJnyEJUcz0QwIixT9G+R+a4UAeMA8GDrI
   02hvdtO+l5u2lsRd3h0EDwXe4Mz1nhBnMeMMeKfiLiSkiKUYhTyskvt3D
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="416060245"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="416060245"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="845108116"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="845108116"
Received: from gchoudha-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.hsd1.md.comcast.net) ([10.212.114.241])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:53 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 19/23] ASoC: Intel: board_helpers: new module for common
 functions
Date: Thu, 12 Oct 2023 15:08:22 -0400
Message-Id: <20231012190826.142619-20-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
References: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SEM3KRPMNJBBMWSWQBXGCT5LJF7LEJFK
X-Message-ID-Hash: SEM3KRPMNJBBMWSWQBXGCT5LJF7LEJFK
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SEM3KRPMNJBBMWSWQBXGCT5LJF7LEJFK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Create a new module to host common functions for machine drivers. This
patch supports Intel HDMI DAI link initialization.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig             |   3 +
 sound/soc/intel/boards/Makefile            |   3 +
 sound/soc/intel/boards/sof_board_helpers.c | 112 +++++++++++++++++++++
 sound/soc/intel/boards/sof_board_helpers.h |  54 ++++++++++
 4 files changed, 172 insertions(+)
 create mode 100644 sound/soc/intel/boards/sof_board_helpers.c
 create mode 100644 sound/soc/intel/boards/sof_board_helpers.h

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index d67867ce4c74..08569e0fc4a2 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -44,6 +44,9 @@ config SND_SOC_INTEL_SOF_NUVOTON_COMMON
 config SND_SOC_INTEL_SOF_SSP_COMMON
 	tristate
 
+config SND_SOC_INTEL_SOF_BOARD_HELPERS
+	tristate
+
 if SND_SOC_INTEL_CATPT
 
 config SND_SOC_INTEL_HASWELL_MACH
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index ae78e4aa69fc..943bf8b80e01 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -102,3 +102,6 @@ obj-$(CONFIG_SND_SOC_INTEL_SOF_NUVOTON_COMMON) += snd-soc-intel-sof-nuvoton-comm
 
 snd-soc-intel-sof-ssp-common-objs += sof_ssp_common.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_SSP_COMMON) += snd-soc-intel-sof-ssp-common.o
+
+snd-soc-intel-sof-board-helpers-objs += sof_board_helpers.o
+obj-$(CONFIG_SND_SOC_INTEL_SOF_BOARD_HELPERS) += snd-soc-intel-sof-board-helpers.o
diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
new file mode 100644
index 000000000000..627742ce84bd
--- /dev/null
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -0,0 +1,112 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2023 Intel Corporation. All rights reserved.
+
+#include <sound/soc.h>
+#include "hda_dsp_common.h"
+#include "sof_board_helpers.h"
+
+/*
+ * Intel HDMI DAI Link
+ */
+static int hdmi_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
+
+	ctx->hdmi.hdmi_comp = dai->component;
+
+	return 0;
+}
+
+int sof_intel_board_card_late_probe(struct snd_soc_card *card)
+{
+	struct sof_card_private *ctx = snd_soc_card_get_drvdata(card);
+
+	if (!ctx->hdmi_num)
+		return 0;
+
+	if (!ctx->hdmi.idisp_codec)
+		return 0;
+
+	if (!ctx->hdmi.hdmi_comp)
+		return -EINVAL;
+
+	return hda_dsp_hdmi_build_controls(card, ctx->hdmi.hdmi_comp);
+}
+EXPORT_SYMBOL_NS(sof_intel_board_card_late_probe, SND_SOC_INTEL_SOF_BOARD_HELPERS);
+
+/*
+ * DAI Link Helpers
+ */
+static struct snd_soc_dai_link_component platform_component[] = {
+	{
+		/* name might be overridden during probe */
+		.name = "0000:00:1f.3"
+	}
+};
+
+int sof_intel_board_set_intel_hdmi_link(struct device *dev,
+					struct snd_soc_dai_link *link, int be_id,
+					int hdmi_id, bool idisp_codec)
+{
+	struct snd_soc_dai_link_component *cpus, *codecs;
+
+	dev_dbg(dev, "link %d: intel hdmi, hdmi id %d, idisp codec %d\n",
+		be_id, hdmi_id, idisp_codec);
+
+	/* link name */
+	link->name = devm_kasprintf(dev, GFP_KERNEL, "iDisp%d", hdmi_id);
+	if (!link->name)
+		return -ENOMEM;
+
+	/* cpus */
+	cpus = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link_component),
+			    GFP_KERNEL);
+	if (!cpus)
+		return -ENOMEM;
+
+	cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "iDisp%d Pin", hdmi_id);
+	if (!cpus->dai_name)
+		return -ENOMEM;
+
+	link->cpus = cpus;
+	link->num_cpus = 1;
+
+	/* codecs */
+	if (idisp_codec) {
+		codecs = devm_kzalloc(dev,
+				      sizeof(struct snd_soc_dai_link_component),
+				      GFP_KERNEL);
+		if (!codecs)
+			return -ENOMEM;
+
+		codecs->name = "ehdaudio0D2";
+		codecs->dai_name = devm_kasprintf(dev, GFP_KERNEL,
+						  "intel-hdmi-hifi%d", hdmi_id);
+		if (!codecs->dai_name)
+			return -ENOMEM;
+
+		link->codecs = codecs;
+	} else {
+		link->codecs = &snd_soc_dummy_dlc;
+	}
+	link->num_codecs = 1;
+
+	/* platforms */
+	link->platforms = platform_component;
+	link->num_platforms = ARRAY_SIZE(platform_component);
+
+	link->id = be_id;
+	link->init = (hdmi_id == 1) ? hdmi_init : NULL;
+	link->no_pcm = 1;
+	link->dpcm_playback = 1;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sof_intel_board_set_intel_hdmi_link, SND_SOC_INTEL_SOF_BOARD_HELPERS);
+
+MODULE_DESCRIPTION("ASoC Intel SOF Machine Driver Board Helpers");
+MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
new file mode 100644
index 000000000000..7a15ddaa3a2c
--- /dev/null
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright(c) 2023 Intel Corporation.
+ */
+
+#ifndef __SOF_INTEL_BOARD_HELPERS_H
+#define __SOF_INTEL_BOARD_HELPERS_H
+
+#include <sound/soc.h>
+#include "sof_hdmi_common.h"
+#include "sof_ssp_common.h"
+
+/*
+ * sof_rt5682_private: private data for rt5682 machine driver
+ *
+ * @mclk: mclk clock data
+ * @is_legacy_cpu: true for BYT/CHT boards
+ */
+struct sof_rt5682_private {
+	struct clk *mclk;
+	bool is_legacy_cpu;
+};
+
+/*
+ * sof_card_private: common data for machine drivers
+ *
+ * @headset_jack: headset jack data
+ * @hdmi: init data for hdmi dai link
+ * @codec_type: type of headset codec
+ * @amp_type: type of speaker amplifier
+ * @hdmi_num: number of Intel HDMI BE link
+ * @rt5682: private data for rt5682 machine driver
+ */
+struct sof_card_private {
+	struct snd_soc_jack headset_jack;
+	struct sof_hdmi_private hdmi;
+
+	enum sof_ssp_codec codec_type;
+	enum sof_ssp_codec amp_type;
+
+	int hdmi_num;
+
+	union {
+		struct sof_rt5682_private rt5682;
+	};
+};
+
+int sof_intel_board_card_late_probe(struct snd_soc_card *card);
+
+int sof_intel_board_set_intel_hdmi_link(struct device *dev,
+					struct snd_soc_dai_link *link, int be_id,
+					int hdmi_id, bool idisp_codec);
+
+#endif /* __SOF_INTEL_BOARD_HELPERS_H */
-- 
2.39.2

