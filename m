Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC64988EB27
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 17:26:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3AA42C26;
	Wed, 27 Mar 2024 17:26:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3AA42C26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711556797;
	bh=BJ7HzRmQEbYAxjspN0Di11yQZZpfAoPKaesEvkARWl4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Thqoyu2HdegK2YPHmvv/KN4WkAaSgyapfN5VnfO4pfltcH0KHcDTyGpZL8qVwaD1N
	 Y2LEIFk9ERW0fM1XzEDpDJNgZOBru1nA1OL5H0JJvnU9fLtar0uEH0+TOnER5Vx72I
	 ZAiwqTCbE9lljeOkDGM6+Q7AIPAFLaG1hqSum3XY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11613F80679; Wed, 27 Mar 2024 17:24:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D7EBF80638;
	Wed, 27 Mar 2024 17:24:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2278DF805FD; Wed, 27 Mar 2024 17:24:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD0A3F801D5
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 17:24:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD0A3F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EdNkyXDY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711556676; x=1743092676;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BJ7HzRmQEbYAxjspN0Di11yQZZpfAoPKaesEvkARWl4=;
  b=EdNkyXDYMC4MB4V/TI3IcyLai70JeKryLub6fe97nxVMcn7oCNQzla4w
   GK+JKFGcog+1TIYcIPyPdbrfvCravslaPjS49KJ4gkCKprnqXy1VoKvkP
   ByUVSnvUrI/IfcT4Ut3k//FVq4AKrBds9yD+mr0iKTdFSEf/tmNydZNIr
   AikB41T+Di0dJX5yk2htNTqu2uwDe/JFsM5PToITjFyY1kUsH15/Hq50d
   iMr6amuyPBAUsxycLmVcNBFi1K6pKtzRSwkudhBKGXbW71vP2oPuamhKp
   NlkGmupc0ZD4tyQHu14WfSWka+C+IoFCmnzGEOYRXBQZpjWCNU5Xk5Yoa
   Q==;
X-CSE-ConnectionGUID: uQrDy1wFQpeuRAJDJcPiqA==
X-CSE-MsgGUID: XDkH0nWFTpi1qc+gHuI8NQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17221491"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="17221491"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:24:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="53821256"
Received: from ssherman-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.117.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:24:27 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 03/18] ASoC: Intel: ssp-common: naming convention change
Date: Wed, 27 Mar 2024 11:23:53 -0500
Message-Id: <20240327162408.63953-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
References: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TJV2HSMTEFWYR5KWQ7DRUFUUZJOAEOH4
X-Message-ID-Hash: TJV2HSMTEFWYR5KWQ7DRUFUUZJOAEOH4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TJV2HSMTEFWYR5KWQ7DRUFUUZJOAEOH4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

As we moved ssp-common files to new locations with new names, changing
the naming convention from sof_ssp_ to snd_soc_acpi_intel_.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc-acpi-intel-ssp-common.h       | 17 ++++++++++-------
 sound/soc/intel/boards/sof_board_helpers.c      | 13 +++++++------
 sound/soc/intel/boards/sof_board_helpers.h      |  4 ++--
 .../intel/common/soc-acpi-intel-ssp-common.c    | 17 ++++++++++-------
 4 files changed, 29 insertions(+), 22 deletions(-)

diff --git a/include/sound/soc-acpi-intel-ssp-common.h b/include/sound/soc-acpi-intel-ssp-common.h
index ff84154ce60a..b568cda11051 100644
--- a/include/sound/soc-acpi-intel-ssp-common.h
+++ b/include/sound/soc-acpi-intel-ssp-common.h
@@ -3,8 +3,8 @@
  * Copyright(c) 2023 Intel Corporation.
  */
 
-#ifndef __SOF_SSP_COMMON_H
-#define __SOF_SSP_COMMON_H
+#ifndef __LINUX_SND_SOC_ACPI_INTEL_SSP_COMMON_H
+#define __LINUX_SND_SOC_ACPI_INTEL_SSP_COMMON_H
 
 /* Cirrus Logic */
 #define CS35L41_ACPI_HID	"CSC3541"
@@ -37,7 +37,7 @@
 #define RT5682_ACPI_HID		"10EC5682"
 #define RT5682S_ACPI_HID	"RTL5682"
 
-enum sof_ssp_codec {
+enum snd_soc_acpi_intel_codec {
 	CODEC_NONE,
 
 	/* headphone codec */
@@ -65,9 +65,12 @@ enum sof_ssp_codec {
 	CODEC_RT1308,
 };
 
-enum sof_ssp_codec sof_ssp_detect_codec_type(struct device *dev);
-enum sof_ssp_codec sof_ssp_detect_amp_type(struct device *dev);
+enum snd_soc_acpi_intel_codec
+snd_soc_acpi_intel_detect_codec_type(struct device *dev);
+enum snd_soc_acpi_intel_codec
+snd_soc_acpi_intel_detect_amp_type(struct device *dev);
 
-const char *sof_ssp_get_codec_name(enum sof_ssp_codec codec_type);
+const char *
+snd_soc_acpi_intel_get_codec_name(enum snd_soc_acpi_intel_codec codec_type);
 
-#endif /* __SOF_SSP_COMMON_H */
+#endif /* __LINUX_SND_SOC_ACPI_INTEL_SSP_COMMON_H */
diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index 586600680e84..8819ab5694bf 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -103,13 +103,13 @@ static struct snd_soc_dai_link_component platform_component[] = {
 };
 
 static int set_ssp_codec_link(struct device *dev, struct snd_soc_dai_link *link,
-			      int be_id, enum sof_ssp_codec codec_type,
+			      int be_id, enum snd_soc_acpi_intel_codec codec_type,
 			      int ssp_codec)
 {
 	struct snd_soc_dai_link_component *cpus;
 
 	dev_dbg(dev, "link %d: ssp codec %s, ssp %d\n", be_id,
-		sof_ssp_get_codec_name(codec_type), ssp_codec);
+		snd_soc_acpi_intel_get_codec_name(codec_type), ssp_codec);
 
 	/* link name */
 	link->name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec", ssp_codec);
@@ -259,12 +259,13 @@ static int set_idisp_hdmi_link(struct device *dev, struct snd_soc_dai_link *link
 }
 
 static int set_ssp_amp_link(struct device *dev, struct snd_soc_dai_link *link,
-			    int be_id, enum sof_ssp_codec amp_type, int ssp_amp)
+			    int be_id, enum snd_soc_acpi_intel_codec amp_type,
+			    int ssp_amp)
 {
 	struct snd_soc_dai_link_component *cpus;
 
 	dev_dbg(dev, "link %d: ssp amp %s, ssp %d\n", be_id,
-		sof_ssp_get_codec_name(amp_type), ssp_amp);
+		snd_soc_acpi_intel_get_codec_name(amp_type), ssp_amp);
 
 	/* link name */
 	link->name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec", ssp_amp);
@@ -598,8 +599,8 @@ sof_intel_board_get_ctx(struct device *dev, unsigned long board_quirk)
 	if (!ctx)
 		return NULL;
 
-	ctx->codec_type = sof_ssp_detect_codec_type(dev);
-	ctx->amp_type = sof_ssp_detect_amp_type(dev);
+	ctx->codec_type = snd_soc_acpi_intel_detect_codec_type(dev);
+	ctx->amp_type = snd_soc_acpi_intel_detect_amp_type(dev);
 
 	ctx->dmic_be_num = 2;
 	ctx->hdmi_num = (board_quirk & SOF_NUM_IDISP_HDMI_MASK) >>
diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
index 34ea974c8493..644f6b4a1b7b 100644
--- a/sound/soc/intel/boards/sof_board_helpers.h
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -132,8 +132,8 @@ struct sof_card_private {
 	struct snd_soc_jack headset_jack;
 	struct sof_hdmi_private hdmi;
 
-	enum sof_ssp_codec codec_type;
-	enum sof_ssp_codec amp_type;
+	enum snd_soc_acpi_intel_codec codec_type;
+	enum snd_soc_acpi_intel_codec amp_type;
 
 	int dmic_be_num;
 	int hdmi_num;
diff --git a/sound/soc/intel/common/soc-acpi-intel-ssp-common.c b/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
index 37758f4e3f32..716243a4fc9a 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
@@ -19,7 +19,7 @@
 struct codec_map {
 	const char *name;
 	const char *acpi_hid;
-	enum sof_ssp_codec codec_type;
+	enum snd_soc_acpi_intel_codec codec_type;
 };
 
 static const struct codec_map codecs[] = {
@@ -64,7 +64,8 @@ static const struct codec_map amps[] = {
 	CODEC_MAP_ENTRY("RT1308", RT1308_ACPI_HID, CODEC_RT1308),
 };
 
-enum sof_ssp_codec sof_ssp_detect_codec_type(struct device *dev)
+enum snd_soc_acpi_intel_codec
+snd_soc_acpi_intel_detect_codec_type(struct device *dev)
 {
 	int i;
 
@@ -78,9 +79,10 @@ enum sof_ssp_codec sof_ssp_detect_codec_type(struct device *dev)
 
 	return CODEC_NONE;
 }
-EXPORT_SYMBOL_NS(sof_ssp_detect_codec_type, SND_SOC_INTEL_SOF_SSP_COMMON);
+EXPORT_SYMBOL_NS(snd_soc_acpi_intel_detect_codec_type, SND_SOC_INTEL_SOF_SSP_COMMON);
 
-enum sof_ssp_codec sof_ssp_detect_amp_type(struct device *dev)
+enum snd_soc_acpi_intel_codec
+snd_soc_acpi_intel_detect_amp_type(struct device *dev)
 {
 	int i;
 
@@ -94,9 +96,10 @@ enum sof_ssp_codec sof_ssp_detect_amp_type(struct device *dev)
 
 	return CODEC_NONE;
 }
-EXPORT_SYMBOL_NS(sof_ssp_detect_amp_type, SND_SOC_INTEL_SOF_SSP_COMMON);
+EXPORT_SYMBOL_NS(snd_soc_acpi_intel_detect_amp_type, SND_SOC_INTEL_SOF_SSP_COMMON);
 
-const char *sof_ssp_get_codec_name(enum sof_ssp_codec codec_type)
+const char *
+snd_soc_acpi_intel_get_codec_name(enum snd_soc_acpi_intel_codec codec_type)
 {
 	int i;
 
@@ -115,7 +118,7 @@ const char *sof_ssp_get_codec_name(enum sof_ssp_codec codec_type)
 
 	return NULL;
 }
-EXPORT_SYMBOL_NS(sof_ssp_get_codec_name, SND_SOC_INTEL_SOF_SSP_COMMON);
+EXPORT_SYMBOL_NS(snd_soc_acpi_intel_get_codec_name, SND_SOC_INTEL_SOF_SSP_COMMON);
 
 MODULE_DESCRIPTION("ASoC Intel SOF Common Machine Driver Helpers");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
-- 
2.40.1

