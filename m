Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AEE7A1EEA
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 14:42:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3CBB1CE;
	Fri, 15 Sep 2023 14:41:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3CBB1CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694781752;
	bh=2o8R/9dX2r/z+0qtyE/+W/qmG3tC2MPK2fZ2ZzYf59A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mmcXP5de85SWbkGUQwjy2uT3Dn5lnx8O4dDTRDMLFkAYmySzxvKbQjbpm/zDhvvQc
	 bmaTUy9l4JmimtNJQw0DrklYj0oWXd5sYETZxDEAlaHg+72ysPDD4CLRnQ3qAzXW3Y
	 7gKsbHgfd94JcNWtE5rJlYNUhKgcyBg70XWuzbIU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CD26F805B0; Fri, 15 Sep 2023 14:40:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A711F805A8;
	Fri, 15 Sep 2023 14:40:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10A6DF80431; Fri, 15 Sep 2023 14:40:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 185E3F8047D
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 14:40:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 185E3F8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KDMHZjQT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694781619; x=1726317619;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2o8R/9dX2r/z+0qtyE/+W/qmG3tC2MPK2fZ2ZzYf59A=;
  b=KDMHZjQTY5VA2Dnjnv2nwOZraSYjMRAFJjw333rwMZika8QRHRcXtfVk
   VdlRhwkK+OG10VHaGN6ujI5BB75REQbDClXNM5P1LtkAsARJjOgYjwxrS
   vg8T4OKUAnmL2S2qILwxrlISp2iNtlgjz5UuVvWrS3oMcmoSrBQCFVVKA
   DyU177nDhtKBN1T6hxL4IeIAUkV8kDHO6XQkw69ctH+4qBGj21/5CGCtn
   av40d6Q3KIPBf8alfibjsJidL7ip0KCBuAoxBUEpRw1p1SCiAXE/eq/Uz
   5iIeKOPLIfAfAWWM6cHfH6yVMntQUFgmLqUg5iCLkkPlQa0toiYvi0pUI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="358653123"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="358653123"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="774304546"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="774304546"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:13 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	brent.lu@intel.com,
	uday.m.bhat@intel.com,
	balamurugan.c@intel.com
Subject: [PATCH 03/19] ASoC: Intel: use ACPI HID definition in ssp-common
Date: Fri, 15 Sep 2023 20:48:36 +0800
Message-Id: <20230915124852.1696857-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
References: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ETSKSOWE2SZJPN3P7U2V6WYJHJG5F6FL
X-Message-ID-Hash: ETSKSOWE2SZJPN3P7U2V6WYJHJG5F6FL
X-MailFrom: yung-chuan.liao@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ETSKSOWE2SZJPN3P7U2V6WYJHJG5F6FL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Use ACPI HID definition in ssp-common header for device name macros.
No functional change here.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_cirrus_common.h  |  9 ++---
 sound/soc/intel/boards/sof_maxim_common.h   | 13 +++++---
 sound/soc/intel/boards/sof_realtek_common.h | 37 +++++++++++++++------
 3 files changed, 40 insertions(+), 19 deletions(-)

diff --git a/sound/soc/intel/boards/sof_cirrus_common.h b/sound/soc/intel/boards/sof_cirrus_common.h
index ca438c12c386..d4ecf8d023d1 100644
--- a/sound/soc/intel/boards/sof_cirrus_common.h
+++ b/sound/soc/intel/boards/sof_cirrus_common.h
@@ -9,15 +9,16 @@
 #define __SOF_CIRRUS_COMMON_H
 
 #include <sound/soc.h>
+#include "sof_ssp_common.h"
 
 /*
  * Cirrus Logic CS35L41/CS35L53
  */
 #define CS35L41_CODEC_DAI	"cs35l41-pcm"
-#define CS35L41_DEV0_NAME	"i2c-CSC3541:00"
-#define CS35L41_DEV1_NAME	"i2c-CSC3541:01"
-#define CS35L41_DEV2_NAME	"i2c-CSC3541:02"
-#define CS35L41_DEV3_NAME	"i2c-CSC3541:03"
+#define CS35L41_DEV0_NAME	"i2c-" CS35L41_ACPI_HID ":00"
+#define CS35L41_DEV1_NAME	"i2c-" CS35L41_ACPI_HID ":01"
+#define CS35L41_DEV2_NAME	"i2c-" CS35L41_ACPI_HID ":02"
+#define CS35L41_DEV3_NAME	"i2c-" CS35L41_ACPI_HID ":03"
 
 void cs35l41_set_dai_link(struct snd_soc_dai_link *link);
 void cs35l41_set_codec_conf(struct snd_soc_card *card);
diff --git a/sound/soc/intel/boards/sof_maxim_common.h b/sound/soc/intel/boards/sof_maxim_common.h
index a095b47b856b..fe0212fbad8e 100644
--- a/sound/soc/intel/boards/sof_maxim_common.h
+++ b/sound/soc/intel/boards/sof_maxim_common.h
@@ -11,10 +11,14 @@
 #define __SOF_MAXIM_COMMON_H
 
 #include <sound/soc.h>
+#include "sof_ssp_common.h"
 
+/*
+ * Maxim MAX98373
+ */
 #define MAX_98373_CODEC_DAI	"max98373-aif1"
-#define MAX_98373_DEV0_NAME	"i2c-MX98373:00"
-#define MAX_98373_DEV1_NAME	"i2c-MX98373:01"
+#define MAX_98373_DEV0_NAME	"i2c-" MAX_98373_ACPI_HID ":00"
+#define MAX_98373_DEV1_NAME	"i2c-" MAX_98373_ACPI_HID ":01"
 
 extern struct snd_soc_dai_link_component max_98373_components[2];
 extern struct snd_soc_ops max_98373_ops;
@@ -27,7 +31,6 @@ int max_98373_trigger(struct snd_pcm_substream *substream, int cmd);
 /*
  * Maxim MAX98390
  */
-#define MAX_98390_ACPI_HID	"MX98390"
 #define MAX_98390_CODEC_DAI	"max98390-aif1"
 #define MAX_98390_DEV0_NAME	"i2c-" MAX_98390_ACPI_HID ":00"
 #define MAX_98390_DEV1_NAME	"i2c-" MAX_98390_ACPI_HID ":01"
@@ -41,8 +44,8 @@ void max_98390_set_codec_conf(struct device *dev, struct snd_soc_card *card);
  * Maxim MAX98357A/MAX98360A
  */
 #define MAX_98357A_CODEC_DAI	"HiFi"
-#define MAX_98357A_DEV0_NAME	"MX98357A:00"
-#define MAX_98360A_DEV0_NAME	"MX98360A:00"
+#define MAX_98357A_DEV0_NAME	MAX_98357A_ACPI_HID ":00"
+#define MAX_98360A_DEV0_NAME	MAX_98360A_ACPI_HID ":00"
 
 void max_98357a_dai_link(struct snd_soc_dai_link *link);
 void max_98360a_dai_link(struct snd_soc_dai_link *link);
diff --git a/sound/soc/intel/boards/sof_realtek_common.h b/sound/soc/intel/boards/sof_realtek_common.h
index 3ae99d8239e0..e3fa2924c1c1 100644
--- a/sound/soc/intel/boards/sof_realtek_common.h
+++ b/sound/soc/intel/boards/sof_realtek_common.h
@@ -11,36 +11,53 @@
 #define __SOF_REALTEK_COMMON_H
 
 #include <sound/soc.h>
+#include "sof_ssp_common.h"
+
+/*
+ * Realtek ALC1011
+ */
 
 #define RT1011_CODEC_DAI	"rt1011-aif"
-#define RT1011_DEV0_NAME	"i2c-10EC1011:00"
-#define RT1011_DEV1_NAME	"i2c-10EC1011:01"
-#define RT1011_DEV2_NAME	"i2c-10EC1011:02"
-#define RT1011_DEV3_NAME	"i2c-10EC1011:03"
+#define RT1011_DEV0_NAME	"i2c-" RT1011_ACPI_HID ":00"
+#define RT1011_DEV1_NAME	"i2c-" RT1011_ACPI_HID ":01"
+#define RT1011_DEV2_NAME	"i2c-" RT1011_ACPI_HID ":02"
+#define RT1011_DEV3_NAME	"i2c-" RT1011_ACPI_HID ":03"
 
 void sof_rt1011_dai_link(struct snd_soc_dai_link *link);
 void sof_rt1011_codec_conf(struct snd_soc_card *card);
 
+/*
+ * Realtek ALC1015 (AUTO)
+ */
 #define RT1015P_CODEC_DAI	"HiFi"
-#define RT1015P_DEV0_NAME	"RTL1015:00"
-#define RT1015P_DEV1_NAME	"RTL1015:01"
+#define RT1015P_DEV0_NAME	RT1015P_ACPI_HID ":00"
+#define RT1015P_DEV1_NAME	RT1015P_ACPI_HID ":01"
 
 void sof_rt1015p_dai_link(struct snd_soc_dai_link *link);
 void sof_rt1015p_codec_conf(struct snd_soc_card *card);
 
+/*
+ * Realtek ALC1015 (I2C)
+ */
 #define RT1015_CODEC_DAI	"rt1015-aif"
-#define RT1015_DEV0_NAME	"i2c-10EC1015:00"
-#define RT1015_DEV1_NAME	"i2c-10EC1015:01"
+#define RT1015_DEV0_NAME	"i2c-" RT1015_ACPI_HID ":00"
+#define RT1015_DEV1_NAME	"i2c-" RT1015_ACPI_HID ":01"
 
 void sof_rt1015_dai_link(struct snd_soc_dai_link *link);
 void sof_rt1015_codec_conf(struct snd_soc_card *card);
 
+/*
+ * Realtek ALC1308
+ */
 #define RT1308_CODEC_DAI	"rt1308-aif"
-#define RT1308_DEV0_NAME	"i2c-10EC1308:00"
+#define RT1308_DEV0_NAME	"i2c-" RT1308_ACPI_HID ":00"
 void sof_rt1308_dai_link(struct snd_soc_dai_link *link);
 
+/*
+ * Realtek ALC1019
+ */
 #define RT1019P_CODEC_DAI	"HiFi"
-#define RT1019P_DEV0_NAME	"RTL1019:00"
+#define RT1019P_DEV0_NAME	RT1019P_ACPI_HID ":00"
 
 void sof_rt1019p_dai_link(struct snd_soc_dai_link *link);
 
-- 
2.25.1

