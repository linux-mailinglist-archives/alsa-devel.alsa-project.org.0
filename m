Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E5D7A5726
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 03:52:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE430886;
	Tue, 19 Sep 2023 03:51:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE430886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695088342;
	bh=Rw11hdiBfbfg6RCT6LpE/HLxNM9yZ1ymEinpihnurPs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eE6r43lqs6OdGO8pkRIn44Uqc2KL5DDwUidjbZLNjIqa29Yum+Ad1ylyh6AWI0q6Y
	 Zpd3m8WbsaSCZroCHtD9jxPqZz+jH9K+XGGjxcWURt/W0z3vCY2qq7M8yhVRXeABpU
	 SCYPgbxewbH+bkEejdNCM2CY2SmbOH4xf7t65v4A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D356AF801F5; Tue, 19 Sep 2023 03:51:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1A13F8025A;
	Tue, 19 Sep 2023 03:51:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E207F80494; Tue, 19 Sep 2023 03:51:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 371D2F80124
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 03:51:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 371D2F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=X9NhpiXp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695088274; x=1726624274;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Rw11hdiBfbfg6RCT6LpE/HLxNM9yZ1ymEinpihnurPs=;
  b=X9NhpiXpyT3YOYTMPwwOJX1jE10Mu1NrzdH7QLUqa3peXTUbvaLht/Yl
   9BNs2k/otAV9gUjHRM5dBE7l9AgFqvwBljOGONFSoz8rRouhlehFkp1//
   IMhc99O33mLdYGkI1rF3+XZcRQTdRQLwEAUmu3c4Yq1TiyBHrZauGoM3A
   fZQDPfjJKRWm0MhB5P5NqB0hvlS2+JIA1x/oIoIHxztjRdt7rQiCGNs0V
   Ugtxn6mtoDkLiC5dfMTktN9lBP8lSURT7Oulw3TgrqPnupDILN7py1osM
   RgDqkjFc2ptNo8td+7VkyiQ35X1V2oxzsqY6VAWDnwrQ+Ewtr/Cgfxj3N
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="377136209"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000";
   d="scan'208";a="377136209"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 18:51:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811545624"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000";
   d="scan'208";a="811545624"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 18:51:00 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 2/2] ASoC: Intel: soc-acpi-intel-mtl-match: add acpi match
 table for cdb35l56-eight-c
Date: Tue, 19 Sep 2023 10:00:11 +0800
Message-Id: <20230919020011.1896041-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230919020011.1896041-1-yung-chuan.liao@linux.intel.com>
References: <20230919020011.1896041-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6O4K6ZTLDZZIIS2ZX4NC4IPZDCNPJBJW
X-Message-ID-Hash: 6O4K6ZTLDZZIIS2ZX4NC4IPZDCNPJBJW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6O4K6ZTLDZZIIS2ZX4NC4IPZDCNPJBJW/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Chao Song <chao.song@linux.intel.com>

This patch adds acpi match table for cdb35l56-eight-c
AIC board from Cirrus Logic.

The codec layout is configured as:
    - Link0: CS42L43 Jack
    - Link1: 2x CS35L56 Speaker
    - Link2: 2x CS35L56 Speaker

Signed-off-by: Chao Song <chao.song@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-mtl-match.c   | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 0304246d2922..b6409d2bd1fb 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -92,6 +92,20 @@ static const struct snd_soc_acpi_endpoint rt712_endpoints[] = {
 	},
 };
 
+static const struct snd_soc_acpi_endpoint spk_2_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 2,
+	.group_id = 1,
+};
+
+static const struct snd_soc_acpi_endpoint spk_3_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 3,
+	.group_id = 1,
+};
+
 static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 	{
 		.adr = 0x000030025D071101ull,
@@ -211,6 +225,45 @@ static const struct snd_soc_acpi_link_adr mtl_712_only[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_adr_device cs42l43_0_adr[] = {
+	{
+		.adr = 0x00003001FA424301ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "cs42l43"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device cs35l56_1_adr[] = {
+	{
+		.adr = 0x00013701FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "cs35l56-8"
+	},
+	{
+		.adr = 0x00013601FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_3_endpoint,
+		.name_prefix = "cs35l56-7"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device cs35l56_2_adr[] = {
+	{
+		.adr = 0x00023301FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "cs35l56-1"
+	},
+	{
+		.adr = 0x00023201FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_2_endpoint,
+		.name_prefix = "cs35l56-2"
+	}
+};
+
 static const struct snd_soc_acpi_link_adr rt5682_link2_max98373_link0[] = {
 	/* Expected order: jack -> amp */
 	{
@@ -317,6 +370,25 @@ static const struct snd_soc_acpi_link_adr cs42l42_link0_max98363_link2[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr mtl_cs42l43_cs35l56[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l43_0_adr),
+		.adr_d = cs42l43_0_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(cs35l56_1_adr),
+		.adr_d = cs35l56_1_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(cs35l56_2_adr),
+		.adr_d = cs35l56_2_adr,
+	},
+	{}
+};
+
 /* this table is used when there is no I2S codec present */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 	/* mockup tests need to be first */
@@ -350,6 +422,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-rt1318-l12-rt714-l0.tplg"
 	},
+	{
+		.link_mask = GENMASK(2, 0),
+		.links = mtl_cs42l43_cs35l56,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-cs42l43-l0-cs35l56-l12.tplg",
+	},
 	{
 		.link_mask = GENMASK(3, 0),
 		.links = mtl_3_in_1_sdca,
-- 
2.25.1

