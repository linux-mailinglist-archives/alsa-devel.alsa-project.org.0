Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 653B6720A5A
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 22:31:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E31E1FE;
	Fri,  2 Jun 2023 22:30:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E31E1FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685737868;
	bh=MmA8UYKfGmHsVSLb7enDaQEXS1iXeL+huBcS5VzUCp0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ua+jgo7Lc1t0qdeUq9p+szOEvJE6mYNfsh7fVy3b5bRjVAHxs9qh8xatzsQ1gtVVT
	 CRfb3z7xNH9AmalBHXJd1Zj/UJhxU7ov8Pvk38Ft2phCn0YsAoLNK4rM6A3AyRbPhN
	 +l4vxSjr4NY+tHrOAsuVakpmZeSIUTLKPp6P0tVY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D5C0F806A6; Fri,  2 Jun 2023 22:24:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DCB2F805AD;
	Fri,  2 Jun 2023 22:24:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5817FF8062F; Fri,  2 Jun 2023 22:24:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E3EFF8056F
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:23:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E3EFF8056F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BkJWclVm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685737398; x=1717273398;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MmA8UYKfGmHsVSLb7enDaQEXS1iXeL+huBcS5VzUCp0=;
  b=BkJWclVmuwo2AkiftTkziONUPTwOHNsjoepRorXlxLQyWHS5auALXBBj
   Eosykvl9sFsMNytnjHFVuAQ/p5vz5dvqYMm8U4RodfVarPYjqC2FIwOzv
   z9PnAru/DMHaa+BjdNTRwavt0+V7VgiV8+RLEu4s47Bh+/f++tBxb3cBr
   A5ehDbocwyLxEl+gIe8NsmVzFxjEbO52JsRrg/+ZWGt7Nk7xLoqmeHZYu
   RKBcRQzRPBTYyh/gYOmCgXQ0Ouy+dG617nWUiU+zIy96F3qsxfE2LdPvi
   BkYE0U5XDBEnpIZbR/J0F7qe7/7JCVOZnUb7cJKzPuWriov6R13o5DXFk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="354811343"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="354811343"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:23:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="773020058"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="773020058"
Received: from clatorre-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.190.110])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:23:04 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Uday M Bhat <uday.m.bhat@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Yong Zhi <yong.zhi@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 26/28] ASoC: Intel: sof_sdw: Add support for MAX98363 codec
Date: Fri,  2 Jun 2023 15:22:23 -0500
Message-Id: <20230602202225.249209-27-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
References: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: L4Q7CHELNCQLWKZ4SCGWQLZAFYOJL5YG
X-Message-ID-Hash: L4Q7CHELNCQLWKZ4SCGWQLZAFYOJL5YG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L4Q7CHELNCQLWKZ4SCGWQLZAFYOJL5YG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Uday M Bhat <uday.m.bhat@intel.com>

Add support for MAX98363 soundwire codec. Update build
configuration to include this codec.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Uday M Bhat <uday.m.bhat@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig         |  1 +
 sound/soc/intel/boards/sof_sdw.c       | 13 +++++++++++++
 sound/soc/intel/boards/sof_sdw_maxim.c |  6 ++++++
 3 files changed, 20 insertions(+)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 799a51f23b84..f472f603ab75 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -662,6 +662,7 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	depends on SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES || COMPILE_TEST
 	depends on SOUNDWIRE
+	select SND_SOC_MAX98363
 	select SND_SOC_MAX98373_I2C
 	select SND_SOC_MAX98373_SDW
 	select SND_SOC_RT700_SDW
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 04d050eac00d..6caf598c7aeb 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -810,6 +810,19 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		},
 		.dai_num = 1,
 	},
+	{
+		.part_id = 0x8363,
+		.dais = {
+			{
+				.direction = {true, false},
+				.dai_name = "max98363-aif1",
+				.dai_type = SOF_SDW_DAI_TYPE_AMP,
+				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_UNUSED_DAI_ID},
+				.init = sof_sdw_maxim_init,
+			},
+		},
+		.dai_num = 1,
+	},
 	{
 		.part_id = 0x5682,
 		.dais = {
diff --git a/sound/soc/intel/boards/sof_sdw_maxim.c b/sound/soc/intel/boards/sof_sdw_maxim.c
index 3cc47ae98c5e..8d40a83ad98e 100644
--- a/sound/soc/intel/boards/sof_sdw_maxim.c
+++ b/sound/soc/intel/boards/sof_sdw_maxim.c
@@ -14,6 +14,7 @@
 #include "sof_maxim_common.h"
 
 static int maxim_part_id;
+#define SOF_SDW_PART_ID_MAX98363 0x8363
 #define SOF_SDW_PART_ID_MAX98373 0x8373
 
 static const struct snd_soc_dapm_widget maxim_widgets[] = {
@@ -148,6 +149,11 @@ int sof_sdw_maxim_init(struct snd_soc_card *card,
 
 	maxim_part_id = info->part_id;
 	switch (maxim_part_id) {
+	case SOF_SDW_PART_ID_MAX98363:
+		/* Default ops are set in function init_dai_link.
+		 * called as part of function create_sdw_dailink
+		 */
+		break;
 	case SOF_SDW_PART_ID_MAX98373:
 		info->codec_card_late_probe = mx8373_sdw_late_probe;
 		dai_links->ops = &max_98373_sdw_ops;
-- 
2.37.2

