Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8AB76A34A
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 23:49:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB3D8E80;
	Mon, 31 Jul 2023 23:48:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB3D8E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690840140;
	bh=eJooDVkxS8hYi9+dZ2YHgjPvUIV7g3uhKja0RQ/txVA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AEYKTUuqF3MroApJsQTqJ/UTKWybG0+Qh2tQNO5ruk8T/JmpuLOqr0OYU1/fZWLGq
	 RJHj1EOk7aroJR7U4t0X7TAIuR0w+5BwMFt/JsmaM5V64sh7YIUHiCatFidDCqEJNm
	 lvltqFKMFz+T2TrVPuTwdqce/M1a5fSbiF90I75Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 835EBF80636; Mon, 31 Jul 2023 23:44:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ECB0AF80632;
	Mon, 31 Jul 2023 23:44:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21908F805BD; Mon, 31 Jul 2023 23:43:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,RDNS_NONE,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 91FC1F80579
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 23:43:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91FC1F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TbY+z55s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690839805; x=1722375805;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eJooDVkxS8hYi9+dZ2YHgjPvUIV7g3uhKja0RQ/txVA=;
  b=TbY+z55sKIOybmKLzV9WJOflGnrY2rM/8zM4OmXAXTKIxGJcNgmxdEU8
   EFnC/Llc6VXRMLdsXB89VNEP2/Nv8i6nxjAQqQo6AMt0Hf6UESB8h561s
   edYoveTfvvurfIq7uhBc3nfHW6QY5NL2uFeoZrGEP7ixZPbbu6CM970Rq
   gBrfa7I1fszdLbUXQeSQyGpih4i/Gl0X6xQBrQdjBX3903bqAU3hppKkM
   Gta/Tc9XDaXi7ejikpgXgbxZw1pCIM5kB+SL9KkaOlSWjeFqWrFWexh+T
   hpkej2+mSPO43nCaQHKxa1JAjXOiu7mnaNQwTCiFSgdDXpm1lsbWTsd1R
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="435449811"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="435449811"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:43:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="763523569"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="763523569"
Received: from youngnic-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.180.66])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:43:20 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Chao Song <chao.song@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 20/23] ASoC: Intel: sof_sdw: add cs35l56 codec info
Date: Mon, 31 Jul 2023 16:42:54 -0500
Message-Id: <20230731214257.444605-21-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
References: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5TGUQRRUE56POF5TTSCD5WIU2D5NRHQA
X-Message-ID-Hash: 5TGUQRRUE56POF5TTSCD5WIU2D5NRHQA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5TGUQRRUE56POF5TTSCD5WIU2D5NRHQA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Chao Song <chao.song@linux.intel.com>

Add cs35l56 support in sof_sdw machine driver.

Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig          |  1 +
 sound/soc/intel/boards/Makefile         |  2 +-
 sound/soc/intel/boards/sof_sdw.c        | 13 +++++++
 sound/soc/intel/boards/sof_sdw_common.h |  6 ++++
 sound/soc/intel/boards/sof_sdw_cs_amp.c | 47 +++++++++++++++++++++++++
 5 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/intel/boards/sof_sdw_cs_amp.c

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 141fba0f8c70..0ae6eecc8851 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -679,6 +679,7 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	select SND_SOC_RT1318_SDW
 	select SND_SOC_RT5682_SDW
 	select SND_SOC_CS42L42_SDW
+	select SND_SOC_CS35L56_SDW
 	select SND_SOC_DMIC
 	select SND_SOC_INTEL_HDA_DSP_COMMON
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 931415d9cf6f..a570b5b40f22 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -42,7 +42,7 @@ snd-soc-sof-sdw-objs += sof_sdw.o				\
 			sof_sdw_rt711.o sof_sdw_rt_sdca_jack_common.o	\
 			sof_sdw_rt712_sdca.o sof_sdw_rt715.o	\
 			sof_sdw_rt715_sdca.o sof_sdw_dmic.o	\
-			sof_sdw_cs42l42.o \
+			sof_sdw_cs42l42.o sof_sdw_cs_amp.o	\
 			sof_sdw_hdmi.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_RT5682_MACH) += snd-soc-sof_rt5682.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_CS42L42_MACH) += snd-soc-sof_cs42l42.o
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index e6faed2b99b2..5dbfcd88ab3c 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -903,6 +903,19 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		},
 		.dai_num = 1,
 	},
+	{
+		.part_id = 0x3556,
+		.dais = {
+			{
+				.direction = {true, true},
+				.dai_name = "cs35l56-sdw1",
+				.dai_type = SOF_SDW_DAI_TYPE_AMP,
+				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_AMP_IN_DAI_ID},
+				.init = sof_sdw_cs_amp_init,
+			},
+		},
+		.dai_num = 1,
+	},
 	{
 		.part_id = 0x4242,
 		.dais = {
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index fe234b98eb64..2f4fe6bc3d5d 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -206,4 +206,10 @@ int sof_sdw_cs42l42_init(struct snd_soc_card *card,
 			 struct sof_sdw_codec_info *info,
 			 bool playback);
 
+/* CS AMP support */
+int sof_sdw_cs_amp_init(struct snd_soc_card *card,
+			const struct snd_soc_acpi_link_adr *link,
+			struct snd_soc_dai_link *dai_links,
+			struct sof_sdw_codec_info *info,
+			bool playback);
 #endif
diff --git a/sound/soc/intel/boards/sof_sdw_cs_amp.c b/sound/soc/intel/boards/sof_sdw_cs_amp.c
new file mode 100644
index 000000000000..98f6546f484b
--- /dev/null
+++ b/sound/soc/intel/boards/sof_sdw_cs_amp.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2023 Intel Corporation
+
+/*
+ *  sof_sdw_cs_amp - Helpers to handle CS35L56 from generic machine driver
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include "sof_sdw_common.h"
+
+#define CODEC_NAME_SIZE	8
+
+static int cs_spk_init(struct snd_soc_pcm_runtime *rtd)
+{
+	const char *dai_name = rtd->dai_link->codecs->dai_name;
+	struct snd_soc_card *card = rtd->card;
+	char codec_name[CODEC_NAME_SIZE];
+
+	snprintf(codec_name, CODEC_NAME_SIZE, "%s", dai_name);
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+					  "%s spk:%s",
+					  card->components, codec_name);
+	if (!card->components)
+		return -ENOMEM;
+
+	return 0;
+}
+
+
+int sof_sdw_cs_amp_init(struct snd_soc_card *card,
+			const struct snd_soc_acpi_link_adr *link,
+			struct snd_soc_dai_link *dai_links,
+			struct sof_sdw_codec_info *info,
+			bool playback)
+{
+	/* Count amp number and do init on playback link only. */
+	if (!playback)
+		return 0;
+
+	info->amp_num++;
+	dai_links->init = cs_spk_init;
+
+	return 0;
+}
-- 
2.39.2

