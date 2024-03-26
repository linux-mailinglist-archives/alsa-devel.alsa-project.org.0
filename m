Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8E288C8B3
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:12:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 757ED2C09;
	Tue, 26 Mar 2024 17:12:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 757ED2C09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711469566;
	bh=3BGgqt/NQ1cOKzlyAvCQvOk3uiXzl+v1VYM0btX6ABw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KkJTOqos8U5OhXFQqZ27P9znWYQm13DIBiKs9BeMVCJA9ceurTKNotk44Ut+LCR6P
	 0+9mvGRqFbJXVAWHTJNn01tPzlPUAV2Oh/XAz8fCHkHk+ujJ/fiucE+S/Ei6xpWtaQ
	 y6fck0yEnn6jF6NxnWMWBq7cUAoBMOgvAiHLypTg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 653A7F80636; Tue, 26 Mar 2024 17:07:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56992F8973C;
	Tue, 26 Mar 2024 17:07:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C5BCF80718; Tue, 26 Mar 2024 17:06:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4AF62F805F2
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:05:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AF62F805F2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=C5BsWNML
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469152; x=1743005152;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3BGgqt/NQ1cOKzlyAvCQvOk3uiXzl+v1VYM0btX6ABw=;
  b=C5BsWNMLOY0NmCsy4Q/QLBaovzSZErnV6Dx/9H0SeRF4NpkNoNq/TmGn
   ChvNhCRDqKjCIOnPZtiDyrQAkFTOG0Yiuo8bWQ414hOQ1dHMLbW/0S13y
   oPI9w5XwAftlBmuRMBNqQKqfn8rj6rETAMBFF587ZSUPmiujmUxgQIrno
   jrumG6Tiu1i+w0eFT4t4epmsREKfARqf1otzbQXLUE2n3Kft7pABgkmQO
   YKPqlbj22v/ZkKlAeKCQ/LrhUGwtwSDc5e4WFWRaUWFW/NsDD1MmorRid
   uRAWgCPwgWBD/rxoLVBmKZcpNfeVglYh3vcOsDBih4vYHdQ1MgLkazHmQ
   A==;
X-CSE-ConnectionGUID: dttcwtZdSQqPBHNLx/aBIQ==
X-CSE-MsgGUID: Ac5096hFSJ2D6KYYpOClow==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260498"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="17260498"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:05:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="20482381"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:59 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Chao Song <chao.song@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 24/34] ASoC: Intel: sof_sdw: use generic rtd_init function for
 Realtek SDW DMICs
Date: Tue, 26 Mar 2024 11:04:19 -0500
Message-Id: <20240326160429.13560-25-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JWGFJ7MD2CUW5SZNATMIUK233DOFKSWK
X-Message-ID-Hash: JWGFJ7MD2CUW5SZNATMIUK233DOFKSWK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JWGFJ7MD2CUW5SZNATMIUK233DOFKSWK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

The only thing that the rt_xxx_rtd_init() functions do is to set
card->components. And we can set card->components with name_prefix
as rt712_sdca_dmic_rtd_init() does.
And sof_sdw_rtd_init() will always select the first dai with the
given dai->name from codec_info_list[]. Unfortunately, we have
different codecs with the same dai name. For example, dai name of
rt715 and rt715-sdca are both "rt715-aif2". Using a generic rtd_init
allow sof_sdw_rtd_init() run the rtd_init() callback from a similar
codec dai.

Fixes: 8266c73126b7 ("ASoC: Intel: sof_sdw: add common sdw dai link init")
Reviewed-by: Chao Song <chao.song@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Makefile          |  1 +
 sound/soc/intel/boards/sof_sdw.c         | 12 +++---
 sound/soc/intel/boards/sof_sdw_common.h  |  1 +
 sound/soc/intel/boards/sof_sdw_rt_dmic.c | 52 ++++++++++++++++++++++++
 4 files changed, 60 insertions(+), 6 deletions(-)
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt_dmic.c

diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index bbf796a5f7ba..08cfd4baecdd 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -42,6 +42,7 @@ snd-soc-sof-sdw-objs += sof_sdw.o				\
 			sof_sdw_rt711.o sof_sdw_rt_sdca_jack_common.o	\
 			sof_sdw_rt712_sdca.o sof_sdw_rt715.o	\
 			sof_sdw_rt715_sdca.o sof_sdw_rt722_sdca.o	\
+			sof_sdw_rt_dmic.o			\
 			sof_sdw_cs42l42.o sof_sdw_cs42l43.o	\
 			sof_sdw_cs_amp.o			\
 			sof_sdw_dmic.o				\
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 3e6a758c98ab..0e376cb0ce0b 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -749,7 +749,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt712-sdca-dmic-aif1",
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
-				.rtd_init = rt712_sdca_dmic_rtd_init,
+				.rtd_init = rt_dmic_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -779,7 +779,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt712-sdca-dmic-aif1",
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
-				.rtd_init = rt712_sdca_dmic_rtd_init,
+				.rtd_init = rt_dmic_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -841,7 +841,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt715-aif2",
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
-				.rtd_init = rt715_sdca_rtd_init,
+				.rtd_init = rt_dmic_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -856,7 +856,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt715-aif2",
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
-				.rtd_init = rt715_sdca_rtd_init,
+				.rtd_init = rt_dmic_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -871,7 +871,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt715-aif2",
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
-				.rtd_init = rt715_rtd_init,
+				.rtd_init = rt_dmic_rtd_init,
 			},
 		},
 		.dai_num = 1,
@@ -886,7 +886,7 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt715-aif2",
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
-				.rtd_init = rt715_rtd_init,
+				.rtd_init = rt_dmic_rtd_init,
 			},
 		},
 		.dai_num = 1,
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index e21ef79126b2..decaed97fa74 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -197,6 +197,7 @@ int rt712_sdca_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt715_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt715_sdca_rtd_init(struct snd_soc_pcm_runtime *rtd);
+int rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd);
 int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd);
 
diff --git a/sound/soc/intel/boards/sof_sdw_rt_dmic.c b/sound/soc/intel/boards/sof_sdw_rt_dmic.c
new file mode 100644
index 000000000000..9091f5b5c648
--- /dev/null
+++ b/sound/soc/intel/boards/sof_sdw_rt_dmic.c
@@ -0,0 +1,52 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2024 Intel Corporation
+
+/*
+ * sof_sdw_rt_dmic - Helpers to handle Realtek SDW DMIC from generic machine driver
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include "sof_board_helpers.h"
+#include "sof_sdw_common.h"
+
+static const char * const dmics[] = {
+	"rt715",
+	"rt712-sdca-dmic",
+};
+
+int rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_component *component;
+	struct snd_soc_dai *codec_dai;
+	char *mic_name;
+
+	codec_dai = get_codec_dai_by_name(rtd, dmics, ARRAY_SIZE(dmics));
+	if (!codec_dai)
+		return -EINVAL;
+
+	component = codec_dai->component;
+
+	/*
+	 * rt715-sdca (aka rt714) is a special case that uses different name in card->components
+	 * and component->name_prefix.
+	 */
+	if (!strcmp(component->name_prefix, "rt714"))
+		mic_name = devm_kasprintf(card->dev, GFP_KERNEL, "rt715-sdca");
+	else
+		mic_name = devm_kasprintf(card->dev, GFP_KERNEL, "%s", component->name_prefix);
+
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+					  "%s mic:%s", card->components,
+					  mic_name);
+	if (!card->components)
+		return -ENOMEM;
+
+	dev_dbg(card->dev, "card->components: %s\n", card->components);
+
+	return 0;
+}
+MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
-- 
2.40.1

