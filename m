Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9E869B07D
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 17:18:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34D51FA8;
	Fri, 17 Feb 2023 17:17:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34D51FA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676650694;
	bh=EdmSJBI52NpxTZebQY3rzB4Sc31jSEb5pCWFuQYXBnY=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VIraYNse7BzBdtujznbUkQFtHJ4/1UJZFPozEy3iPEcmgimiugZedjuGA5w7nuooN
	 Oi5kiCOPgeQzMT6qX5VhL1riD+7xhZkpTf6rXTJy5dGUaChvhyf4IGMk/HK6RRBgTe
	 oaBOgRmLB3cbttRbwc+8/Tprh462XNUnvJyIPYBk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 269D8F8057E;
	Fri, 17 Feb 2023 17:14:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CF50F80557; Fri, 17 Feb 2023 17:14:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5819AF80525
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 17:14:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5819AF80525
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=hsApAvKb
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31HFh1JQ028722;
	Fri, 17 Feb 2023 10:14:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Ht2/O3ebDaPae4TLLZNIuvgSojUYziL/Ut/LvqsNiEw=;
 b=hsApAvKbQksJfawDNH9ri6stdFFXqIf50zFhDHoXnM0KGMIwQu0GHxTIg5EO6HERfvZ5
 Gip8jFTk3b6Rzr84k9srHPUHb12SMEvfsWWxPGB/BbJRcHobNlWIEvqO6XSUmgIylClg
 yd7LF8LpBei0FMVz6PEwn6wctp45Sv+XNH14WFSYezbMHF093vlbZ+ZysDOE5l/ZkMRN
 HFCCMFz5GYjWHiutmksC7HOMSgeqFjyq6stxxaouikhRMkdWPaZvXfXHI/2xE4wxw9ca
 VrgVCs57EpSZgnOQv5bbwYrW+4qI8OztTlVTpc0qqI6g+v224cMFLfBHAJeppr84t1Nz /g==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3nt1btgsph-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Feb 2023 10:14:16 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Fri, 17 Feb
 2023 10:14:10 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.21 via Frontend Transport; Fri, 17 Feb 2023 10:14:10 -0600
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D62B211AD;
	Fri, 17 Feb 2023 16:14:10 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <cezary.rojewski@intel.com>, <peter.ujfalusi@linux.intel.com>,
        <yung-chuan.liao@linux.intel.com>, <kai.vehmanen@linux.intel.com>
Subject: [PATCH 09/10] ASoC: Intel: sof_sdw: Add support for Cirrus Logic
 CS35L56
Date: Fri, 17 Feb 2023 16:14:09 +0000
Message-ID: <20230217161410.915202-10-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230217161410.915202-1-rf@opensource.cirrus.com>
References: <20230217161410.915202-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: nCH5A9e22-gAo9qKOQuaYJTqA43WX6G9
X-Proofpoint-GUID: nCH5A9e22-gAo9qKOQuaYJTqA43WX6G9
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: YZKRCYNTTS6MSZNM732Q4G33GU45EEUZ
X-Message-ID-Hash: YZKRCYNTTS6MSZNM732Q4G33GU45EEUZ
X-MailFrom: prvs=74127981b7=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Richard Fitzgerald <rf@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YZKRCYNTTS6MSZNM732Q4G33GU45EEUZ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The CS35L56 is a high-performance mono boosted audio amplifier.

This patch adds the initialization for one, two or four amps.

All amps receive the same 2-channel (stereo) audio. Left/right
channel-to-speaker mapping is not fixed. The CS35L56 on-board DSP
adjusts the mapping based on current posture (orientation).

Each CS35L56 has 6 feedback channels for monitoring but to
remain within limited SoundWire bandwidth only one channel per
amp is enabled.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 MAINTAINERS                              |   1 +
 sound/soc/intel/boards/Kconfig           |   1 +
 sound/soc/intel/boards/Makefile          |   1 +
 sound/soc/intel/boards/sof_sdw.c         |   7 ++
 sound/soc/intel/boards/sof_sdw_common.h  |   7 ++
 sound/soc/intel/boards/sof_sdw_cs35l56.c | 115 +++++++++++++++++++++++
 6 files changed, 132 insertions(+)
 create mode 100644 sound/soc/intel/boards/sof_sdw_cs35l56.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3d7aaa42b854..c40bae5e90ea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5039,6 +5039,7 @@ F:	include/sound/cs*
 F:	sound/pci/hda/cs*
 F:	sound/pci/hda/hda_cs_dsp_ctl.*
 F:	sound/soc/codecs/cs*
+F:	sound/soc/intel/boards/sof_sdw_cs35l56.c
 
 CIRRUS LOGIC DSP FIRMWARE DRIVER
 M:	Simon Trimmer <simont@opensource.cirrus.com>
diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 99308ed85277..3e483bbf3ebe 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -662,6 +662,7 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	depends on SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES || COMPILE_TEST
 	depends on SOUNDWIRE
+	select SND_SOC_CS35L56_SDW
 	select SND_SOC_MAX98373_I2C
 	select SND_SOC_MAX98373_SDW
 	select SND_SOC_RT700_SDW
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index d1fd7a2b32db..64e37f8e4a4b 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -37,6 +37,7 @@ snd-soc-sof_da7219_max98373-objs := sof_da7219_max98373.o
 snd-soc-ehl-rt5660-objs := ehl_rt5660.o
 snd-soc-sof-ssp-amp-objs := sof_ssp_amp.o
 snd-soc-sof-sdw-objs += sof_sdw.o				\
+			sof_sdw_cs35l56.o			\
 			sof_sdw_max98373.o sof_sdw_rt_amp.o	\
 			sof_sdw_rt5682.o sof_sdw_rt700.o	\
 			sof_sdw_rt711.o sof_sdw_rt711_sdca.o 	\
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index d2ed807abde9..6c679b4b963f 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -544,6 +544,13 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.exit = sof_sdw_rt711_exit,
 		.codec_type = SOF_SDW_CODEC_TYPE_JACK,
 	},
+	{
+		.part_id = 0x3556,
+		.direction = {true, true},
+		.dai_name = "cs35l56-sdw1",
+		.init = sof_sdw_cs35l56_init,
+		.codec_type = SOF_SDW_CODEC_TYPE_AMP,
+	},
 	{
 		.part_id = 0x1308,
 		.acpi_id = "10EC1308",
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 350010b0e5f4..1bb8e4a34c56 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -102,6 +102,13 @@ int sof_sdw_hdmi_card_late_probe(struct snd_soc_card *card);
 /* DMIC support */
 int sof_sdw_dmic_init(struct snd_soc_pcm_runtime *rtd);
 
+/* CS35L56 support */
+int sof_sdw_cs35l56_init(struct snd_soc_card *card,
+			 const struct snd_soc_acpi_link_adr *link,
+			 struct snd_soc_dai_link *dai_links,
+			 struct sof_sdw_codec_info *info,
+			 bool playback);
+
 /* RT711 support */
 int sof_sdw_rt711_init(struct snd_soc_card *card,
 		       const struct snd_soc_acpi_link_adr *link,
diff --git a/sound/soc/intel/boards/sof_sdw_cs35l56.c b/sound/soc/intel/boards/sof_sdw_cs35l56.c
new file mode 100644
index 000000000000..b862567fd9e2
--- /dev/null
+++ b/sound/soc/intel/boards/sof_sdw_cs35l56.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Based on sof_sdw_rt5682.c
+// Copyright (c) 2020 Intel Corporation
+
+/*
+ *  sof_sdw_cs35l56 - Helpers to handle CS35L56 from generic machine driver
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc-dai.h>
+#include "sof_sdw_common.h"
+
+static const struct snd_soc_dapm_widget cs35l56_sof_widgets[] = {
+	SND_SOC_DAPM_SPK("Speaker", NULL),
+	SND_SOC_DAPM_LINE("Monitor", NULL),
+};
+
+static const struct snd_soc_dapm_route cs35l56_sof_map[] = {
+	{ "Speaker", NULL, "AMP1 SPK" },
+	{ "Speaker", NULL, "AMP2 SPK" },
+	{ "Speaker", NULL, "AMP3 SPK" },
+	{ "Speaker", NULL, "AMP4 SPK" },
+};
+
+static int cs35l56_init_multiple(struct snd_soc_pcm_runtime *rtd, int count)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dai *codec_dai;
+	int i, ret;
+
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+					  "%s hs:cs35l56",
+					  card->components);
+	if (!card->components)
+		return -ENOMEM;
+
+	ret = snd_soc_dapm_new_controls(&card->dapm,
+					cs35l56_sof_widgets, ARRAY_SIZE(cs35l56_sof_widgets));
+	if (ret) {
+		dev_err(card->dev, "Widgets add failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, cs35l56_sof_map, count);
+	if (ret) {
+		dev_err(card->dev, "Map add %d failed: %d\n", count, ret);
+		return ret;
+	}
+
+	/* Enable one feedback TX per amp on different slots */
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x3, 1 << i, 4, 16);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int cs35l56_init_one(struct snd_soc_pcm_runtime *rtd)
+{
+	return cs35l56_init_multiple(rtd, 1);
+}
+
+static int cs35l56_init_two(struct snd_soc_pcm_runtime *rtd)
+{
+	return cs35l56_init_multiple(rtd, 2);
+}
+
+static int cs35l56_init_three(struct snd_soc_pcm_runtime *rtd)
+{
+	return cs35l56_init_multiple(rtd, 3);
+}
+
+static int cs35l56_init_four(struct snd_soc_pcm_runtime *rtd)
+{
+	return cs35l56_init_multiple(rtd, 4);
+}
+
+int sof_sdw_cs35l56_init(struct snd_soc_card *card,
+			 const struct snd_soc_acpi_link_adr *link,
+			 struct snd_soc_dai_link *dai_links,
+			 struct sof_sdw_codec_info *info,
+			 bool playback)
+{
+	/* Init with playback dai link only. */
+	if (!playback)
+		return 0;
+
+	info->amp_num++;
+
+	switch (info->amp_num) {
+	case 1:
+		dai_links->init = cs35l56_init_one;
+		break;
+	case 2:
+		dai_links->init = cs35l56_init_two;
+		break;
+	case 3:
+		dai_links->init = cs35l56_init_three;
+		break;
+	case 4:
+		dai_links->init = cs35l56_init_four;
+		break;
+	default:
+		dev_err(card->dev, "%s: Unexpected number of amps %d\n", __func__, info->amp_num);
+		dai_links->init = cs35l56_init_four;
+		break;
+	}
+
+	return 0;
+}
-- 
2.30.2

