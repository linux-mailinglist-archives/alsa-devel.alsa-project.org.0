Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA7E7FA4DA
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 16:36:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53086DE5;
	Mon, 27 Nov 2023 16:36:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53086DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701099419;
	bh=31pRsjv2J+AIInTtcDsFPCwKu0vBHoekWn1R0zEBVeM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DuJ6IP2kwN6HMA9vvrM7txV8LFaLlBN/KVruLWuuVN5cFGrytHE6+9FI5Gc7A5RrF
	 3F7Ay3za1l3WDJhW1FLgI7sKJch7H1nuFnUiUbmJBBP7/tM10u7UjalFPpnC3ozB4r
	 yBiU5YY5iFZvNRxezyWs1ghshtF8yPLOo30I/Y00=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DE4CF8061D; Mon, 27 Nov 2023 16:35:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EAE0F8062F;
	Mon, 27 Nov 2023 16:35:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3891AF805EC; Mon, 27 Nov 2023 16:35:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D50F6F80254
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 16:35:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D50F6F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DFwHziO2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099327; x=1732635327;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=31pRsjv2J+AIInTtcDsFPCwKu0vBHoekWn1R0zEBVeM=;
  b=DFwHziO2aXE6/VANZ7EHggknW+7c8RHRK2wsZF9I3jR7q6RBJ7Lcq+QH
   ej9NnYnWjD1iH0OXuHdm7lxOZiJ3onYr0KXqhOJDOoUcUUPdqDy5lOliK
   9vmix+Ql5Mx4USJQwkojzrR9pff9XdH4BKIjzurksZZCB/nGsQl8AFNOP
   JcLHhqItrffaXG3a/RuXAkJVgsM2qrRdGVYCDyM3LIYhItJeeIAJ8wc8B
   GG2KTYvPTroAZYDgVfoS1LllMX7ux0goAyceBNOGVh02rqK7tr3ljIaxc
   HQtRjD+K+YiexYz2phpVCxA83/cpvLabud7AcALBfPnUJ3XZ8csGPD8eM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894426"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="372894426"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:26:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956405"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="771956405"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:26:36 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	chao.song@linux.intel.com
Subject: [PATCH 06/27] ASoC: Intel: board_helpers: support codec link
 initialization
Date: Mon, 27 Nov 2023 17:26:33 +0200
Message-ID: <20231127152654.28204-7-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
References: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: N4HAKLIUFO5Z6TVANTU2OFZATKRNLO6J
X-Message-ID-Hash: N4HAKLIUFO5Z6TVANTU2OFZATKRNLO6J
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N4HAKLIUFO5Z6TVANTU2OFZATKRNLO6J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add a helper function for machine drivers to initialize headphone
codec DAI links. The function will initialize common fields and let
caller to initialize codec-specific fields like codec, init, exit, and
ops fields.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_board_helpers.c | 51 ++++++++++++++++++++++
 sound/soc/intel/boards/sof_board_helpers.h |  6 +++
 2 files changed, 57 insertions(+)

diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index ce2967850c2d..5ee53c781b37 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -3,6 +3,7 @@
 // Copyright(c) 2023 Intel Corporation. All rights reserved.
 
 #include <sound/soc.h>
+#include "../common/soc-intel-quirks.h"
 #include "hda_dsp_common.h"
 #include "sof_board_helpers.h"
 
@@ -86,6 +87,55 @@ static struct snd_soc_dai_link_component platform_component[] = {
 	}
 };
 
+int sof_intel_board_set_codec_link(struct device *dev,
+				   struct snd_soc_dai_link *link, int be_id,
+				   enum sof_ssp_codec codec_type, int ssp_codec)
+{
+	struct snd_soc_dai_link_component *cpus;
+
+	dev_dbg(dev, "link %d: codec %s, ssp %d\n", be_id,
+		sof_ssp_get_codec_name(codec_type), ssp_codec);
+
+	/* link name */
+	link->name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec", ssp_codec);
+	if (!link->name)
+		return -ENOMEM;
+
+	/* cpus */
+	cpus = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link_component),
+			    GFP_KERNEL);
+	if (!cpus)
+		return -ENOMEM;
+
+	if (soc_intel_is_byt() || soc_intel_is_cht()) {
+		/* backward-compatibility for BYT/CHT boards */
+		cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "ssp%d-port",
+						ssp_codec);
+	} else {
+		cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin",
+						ssp_codec);
+	}
+	if (!cpus->dai_name)
+		return -ENOMEM;
+
+	link->cpus = cpus;
+	link->num_cpus = 1;
+
+	/* codecs - caller to handle */
+
+	/* platforms */
+	link->platforms = platform_component;
+	link->num_platforms = ARRAY_SIZE(platform_component);
+
+	link->id = be_id;
+	link->no_pcm = 1;
+	link->dpcm_capture = 1;
+	link->dpcm_playback = 1;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sof_intel_board_set_codec_link, SND_SOC_INTEL_SOF_BOARD_HELPERS);
+
 int sof_intel_board_set_dmic_link(struct device *dev,
 				  struct snd_soc_dai_link *link, int be_id,
 				  enum sof_dmic_be_type be_type)
@@ -202,3 +252,4 @@ MODULE_DESCRIPTION("ASoC Intel SOF Machine Driver Board Helpers");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
+MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_SSP_COMMON);
diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
index df99f576c1d8..7392d639672d 100644
--- a/sound/soc/intel/boards/sof_board_helpers.h
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -30,6 +30,7 @@ struct sof_rt5682_private {
  * @amp_type: type of speaker amplifier
  * @dmic_be_num: number of Intel PCH DMIC BE link
  * @hdmi_num: number of Intel HDMI BE link
+ * @ssp_codec: ssp port number of headphone BE link
  * @rt5682: private data for rt5682 machine driver
  */
 struct sof_card_private {
@@ -42,6 +43,8 @@ struct sof_card_private {
 	int dmic_be_num;
 	int hdmi_num;
 
+	int ssp_codec;
+
 	union {
 		struct sof_rt5682_private rt5682;
 	};
@@ -54,6 +57,9 @@ enum sof_dmic_be_type {
 
 int sof_intel_board_card_late_probe(struct snd_soc_card *card);
 
+int sof_intel_board_set_codec_link(struct device *dev,
+				   struct snd_soc_dai_link *link, int be_id,
+				   enum sof_ssp_codec codec_type, int ssp_codec);
 int sof_intel_board_set_dmic_link(struct device *dev,
 				  struct snd_soc_dai_link *link, int be_id,
 				  enum sof_dmic_be_type be_type);
-- 
2.43.0

