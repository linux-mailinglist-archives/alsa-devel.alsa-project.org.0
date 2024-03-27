Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80AA988EB29
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 17:26:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E549C2BF9;
	Wed, 27 Mar 2024 17:26:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E549C2BF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711556802;
	bh=dl07m3XcYcWXk2Do65By1l1yivaLPt8dc/boG6KMMUc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Rhhrdzimq3TcSHC7rHhSS4wGKyohcxjSZ7doR11WS1UaUrHgTcM1Xx/j4CySdYMdU
	 +1coTZ+qgw0btycuY3UMNurYKmlIgk/zk7vO5knIZVTlurbx/xZb+8tupxP4d1gEVD
	 zehkFGtVo0UORFFetDQUYNQYqh3M8clSULA6+iYo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACC9EF80682; Wed, 27 Mar 2024 17:25:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96FF1F806A5;
	Wed, 27 Mar 2024 17:25:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7986F8061F; Wed, 27 Mar 2024 17:24:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CD227F80074
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 17:24:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD227F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Th6vdwOA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711556678; x=1743092678;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dl07m3XcYcWXk2Do65By1l1yivaLPt8dc/boG6KMMUc=;
  b=Th6vdwOAu+T4nuwH7pKUT36sPWan271Qy+VoLeZ7MW7YImeH23KyDLKH
   LX9ESxd0u1up1Hl7pTsJ3ZXSaqAIctUCaZLV4/8ZPU6/mYd4mw2E72ihY
   WNTUvAzlx6xynAXdL+tA67V6mvYmg010cg/9ibuUZ6Gfq5nkSawgg18om
   GeRQ70btoFlWpv/R/t4rOkIqUC6VXLlsfAzisBVPwYsGpWnMVy9RDQGEk
   B3yoa5jzPGUk47YnJdesrmA4vH/Z1sDgmuhCQ9iLZdQ0wlbno5oGN7pVu
   Ycxj9NmJf2czAe/5Hk875CVODWlFn3t2B6vvXxd4bto8zp4NC0EBFx2ra
   Q==;
X-CSE-ConnectionGUID: 0o6e3Xa3REqkoPOFe4N01w==
X-CSE-MsgGUID: jNmij8DJQsmyaFSZoLwTtg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17221512"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="17221512"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:24:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="53821277"
Received: from ssherman-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.117.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:24:29 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 06/18] ASoC: Intel: ssp-common: get codec tplg suffix function
Date: Wed, 27 Mar 2024 11:23:56 -0500
Message-Id: <20240327162408.63953-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
References: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EVLPSOLBPGPDMGL2CH2SQFYZR2YOYAST
X-Message-ID-Hash: EVLPSOLBPGPDMGL2CH2SQFYZR2YOYAST
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EVLPSOLBPGPDMGL2CH2SQFYZR2YOYAST/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add helper functions to get tplg suffix string for specific headphone
codec or speaker amplifier. The string could be used to compose the
default topology file name for specific headphone codec and speaker
amplifier combination.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc-acpi-intel-ssp-common.h     |  5 ++
 .../intel/common/soc-acpi-intel-ssp-common.c  | 76 ++++++++++++++-----
 2 files changed, 60 insertions(+), 21 deletions(-)

diff --git a/include/sound/soc-acpi-intel-ssp-common.h b/include/sound/soc-acpi-intel-ssp-common.h
index b568cda11051..b4597c8dac78 100644
--- a/include/sound/soc-acpi-intel-ssp-common.h
+++ b/include/sound/soc-acpi-intel-ssp-common.h
@@ -73,4 +73,9 @@ snd_soc_acpi_intel_detect_amp_type(struct device *dev);
 const char *
 snd_soc_acpi_intel_get_codec_name(enum snd_soc_acpi_intel_codec codec_type);
 
+const char *
+snd_soc_acpi_intel_get_codec_tplg_suffix(enum snd_soc_acpi_intel_codec codec_type);
+const char *
+snd_soc_acpi_intel_get_amp_tplg_suffix(enum snd_soc_acpi_intel_codec codec_type);
+
 #endif /* __LINUX_SND_SOC_ACPI_INTEL_SSP_COMMON_H */
diff --git a/sound/soc/intel/common/soc-acpi-intel-ssp-common.c b/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
index 68da7260fb1d..a887f019afe2 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
@@ -9,59 +9,61 @@
 /*
  * Codec probe function
  */
-#define CODEC_MAP_ENTRY(n, h, t)	\
+#define CODEC_MAP_ENTRY(n, s, h, t)	\
 	{				\
 		.name = n,		\
+		.tplg_suffix = s,	\
 		.acpi_hid = h,		\
 		.codec_type = t,	\
 	}
 
 struct codec_map {
 	const char *name;
+	const char *tplg_suffix;
 	const char *acpi_hid;
 	enum snd_soc_acpi_intel_codec codec_type;
 };
 
 static const struct codec_map codecs[] = {
 	/* Cirrus Logic */
-	CODEC_MAP_ENTRY("CS42L42", CS42L42_ACPI_HID, CODEC_CS42L42),
+	CODEC_MAP_ENTRY("CS42L42", "cs42l42", CS42L42_ACPI_HID, CODEC_CS42L42),
 
 	/* Dialog */
-	CODEC_MAP_ENTRY("DA7219", DA7219_ACPI_HID, CODEC_DA7219),
+	CODEC_MAP_ENTRY("DA7219", "da7219", DA7219_ACPI_HID, CODEC_DA7219),
 
 	/* Everest */
-	CODEC_MAP_ENTRY("ES8316", ES8316_ACPI_HID, CODEC_ES8316),
-	CODEC_MAP_ENTRY("ES8326", ES8326_ACPI_HID, CODEC_ES8326),
-	CODEC_MAP_ENTRY("ES8336", ES8336_ACPI_HID, CODEC_ES8336),
+	CODEC_MAP_ENTRY("ES8316", "es8336", ES8316_ACPI_HID, CODEC_ES8316),
+	CODEC_MAP_ENTRY("ES8326", "es8336", ES8326_ACPI_HID, CODEC_ES8326),
+	CODEC_MAP_ENTRY("ES8336", "es8336", ES8336_ACPI_HID, CODEC_ES8336),
 
 	/* Nuvoton */
-	CODEC_MAP_ENTRY("NAU8825", NAU8825_ACPI_HID, CODEC_NAU8825),
+	CODEC_MAP_ENTRY("NAU8825", "nau8825", NAU8825_ACPI_HID, CODEC_NAU8825),
 
 	/* Realtek */
-	CODEC_MAP_ENTRY("RT5650", RT5650_ACPI_HID, CODEC_RT5650),
-	CODEC_MAP_ENTRY("RT5682", RT5682_ACPI_HID, CODEC_RT5682),
-	CODEC_MAP_ENTRY("RT5682S", RT5682S_ACPI_HID, CODEC_RT5682S),
+	CODEC_MAP_ENTRY("RT5650", "rt5650", RT5650_ACPI_HID, CODEC_RT5650),
+	CODEC_MAP_ENTRY("RT5682", "rt5682", RT5682_ACPI_HID, CODEC_RT5682),
+	CODEC_MAP_ENTRY("RT5682S", "rt5682", RT5682S_ACPI_HID, CODEC_RT5682S),
 };
 
 static const struct codec_map amps[] = {
 	/* Cirrus Logic */
-	CODEC_MAP_ENTRY("CS35L41", CS35L41_ACPI_HID, CODEC_CS35L41),
+	CODEC_MAP_ENTRY("CS35L41", "cs35l41", CS35L41_ACPI_HID, CODEC_CS35L41),
 
 	/* Maxim */
-	CODEC_MAP_ENTRY("MAX98357A", MAX_98357A_ACPI_HID, CODEC_MAX98357A),
-	CODEC_MAP_ENTRY("MAX98360A", MAX_98360A_ACPI_HID, CODEC_MAX98360A),
-	CODEC_MAP_ENTRY("MAX98373", MAX_98373_ACPI_HID, CODEC_MAX98373),
-	CODEC_MAP_ENTRY("MAX98390", MAX_98390_ACPI_HID, CODEC_MAX98390),
+	CODEC_MAP_ENTRY("MAX98357A", "max98357a", MAX_98357A_ACPI_HID, CODEC_MAX98357A),
+	CODEC_MAP_ENTRY("MAX98360A", "max98360a", MAX_98360A_ACPI_HID, CODEC_MAX98360A),
+	CODEC_MAP_ENTRY("MAX98373", "max98373", MAX_98373_ACPI_HID, CODEC_MAX98373),
+	CODEC_MAP_ENTRY("MAX98390", "max98390", MAX_98390_ACPI_HID, CODEC_MAX98390),
 
 	/* Nuvoton */
-	CODEC_MAP_ENTRY("NAU8318", NAU8318_ACPI_HID, CODEC_NAU8318),
+	CODEC_MAP_ENTRY("NAU8318", "nau8318", NAU8318_ACPI_HID, CODEC_NAU8318),
 
 	/* Realtek */
-	CODEC_MAP_ENTRY("RT1011", RT1011_ACPI_HID, CODEC_RT1011),
-	CODEC_MAP_ENTRY("RT1015", RT1015_ACPI_HID, CODEC_RT1015),
-	CODEC_MAP_ENTRY("RT1015P", RT1015P_ACPI_HID, CODEC_RT1015P),
-	CODEC_MAP_ENTRY("RT1019P", RT1019P_ACPI_HID, CODEC_RT1019P),
-	CODEC_MAP_ENTRY("RT1308", RT1308_ACPI_HID, CODEC_RT1308),
+	CODEC_MAP_ENTRY("RT1011", "rt1011", RT1011_ACPI_HID, CODEC_RT1011),
+	CODEC_MAP_ENTRY("RT1015", "rt1015", RT1015_ACPI_HID, CODEC_RT1015),
+	CODEC_MAP_ENTRY("RT1015P", "rt1015", RT1015P_ACPI_HID, CODEC_RT1015P),
+	CODEC_MAP_ENTRY("RT1019P", "rt1019", RT1019P_ACPI_HID, CODEC_RT1019P),
+	CODEC_MAP_ENTRY("RT1308", "rt1308", RT1308_ACPI_HID, CODEC_RT1308),
 };
 
 enum snd_soc_acpi_intel_codec
@@ -120,6 +122,38 @@ snd_soc_acpi_intel_get_codec_name(enum snd_soc_acpi_intel_codec codec_type)
 }
 EXPORT_SYMBOL_NS(snd_soc_acpi_intel_get_codec_name, SND_SOC_ACPI_INTEL_MATCH);
 
+const char *
+snd_soc_acpi_intel_get_codec_tplg_suffix(enum snd_soc_acpi_intel_codec codec_type)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(codecs); i++) {
+		if (codecs[i].codec_type != codec_type)
+			continue;
+
+		return codecs[i].tplg_suffix;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_NS(snd_soc_acpi_intel_get_codec_tplg_suffix, SND_SOC_ACPI_INTEL_MATCH);
+
+const char *
+snd_soc_acpi_intel_get_amp_tplg_suffix(enum snd_soc_acpi_intel_codec codec_type)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(amps); i++) {
+		if (amps[i].codec_type != codec_type)
+			continue;
+
+		return amps[i].tplg_suffix;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_NS(snd_soc_acpi_intel_get_amp_tplg_suffix, SND_SOC_ACPI_INTEL_MATCH);
+
 MODULE_DESCRIPTION("ASoC Intel SOF Common Machine Driver Helpers");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
-- 
2.40.1

