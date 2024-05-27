Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 284D58D0E47
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2024 21:38:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C959820;
	Mon, 27 May 2024 21:38:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C959820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716838723;
	bh=dW60t95bPnKl9GWiqKVKl+Byxl7cm63BjWqgbq4l084=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JZRuc1g0oZ10vsbYHZsVQ01E1QFnI+jsCRmpOzGyEZCzsHcHRwuu28K44de/zz/Mo
	 MYYk4AoVUkS7EZS1qMt/UEuPLNvPgVPPBKDK1esAAPfKfwbIVT1M9Oie+J8+gp0OwI
	 YVT0Pb5B6rDslOEmYr81vygpXurcoz3i7Bshbbfw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47E0CF8069A; Mon, 27 May 2024 21:36:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73DD1F806A1;
	Mon, 27 May 2024 21:36:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BE84F8063A; Mon, 27 May 2024 21:36:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D08DF804FF
	for <alsa-devel@alsa-project.org>; Mon, 27 May 2024 21:36:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D08DF804FF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nb5lbwlm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838582; x=1748374582;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dW60t95bPnKl9GWiqKVKl+Byxl7cm63BjWqgbq4l084=;
  b=nb5lbwlmlSmxgmGGO93In2QUk4wbeOcfoZavOnAZaYBg5rdHNwkINE3l
   mqcEZvqhrU/LuSI+74T2J4c3a9G/OIms/sA+7abnPie+XoHa9QzcqQvNh
   uFbvci/Y0Ggg4eoEf/KSQcX6/8bcaDfpBlmiS5+B4net+j9rTFk0qwuBs
   Ln/F/ngNuLqQtbxODMB4seFvinkGHqW2QQL3HsoXqXbhHjyJ8zFtZ0vwv
   ZAwgKYRzJ9ev+eyboqyAL8Uoyw118QWSjl7MdwwcnlBJyebsU1kuln5YS
   h2GoPjUMScz/WkeYcCmiLv8Q9FuYAH+T1Any4EztHp4npjWSSWeYlZoCI
   Q==;
X-CSE-ConnectionGUID: YVbydrt7TQSXPjRE9maagg==
X-CSE-MsgGUID: gKYjSvtyTiytW2JVLJWiwg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13339355"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="13339355"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:36:16 -0700
X-CSE-ConnectionGUID: Zsqq2Q+eRfaSs/mvUm/xDQ==
X-CSE-MsgGUID: RRRiOZjUTtmCPcAtG7WfwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="58029771"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:36:15 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 09/18] ASoC: Intel: soc-acpi: Add match entries for some
 cs42l43 laptops
Date: Mon, 27 May 2024 14:35:43 -0500
Message-ID: <20240527193552.165567-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
References: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q3LRT4ZICWARWGHGECELPMBZYEAAQI3D
X-Message-ID-Hash: Q3LRT4ZICWARWGHGECELPMBZYEAAQI3D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q3LRT4ZICWARWGHGECELPMBZYEAAQI3D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Add some new match table entries on Arrowlake and Raptorlake for some
coming cs42l43 laptops.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-arl-match.c   | 50 +++++++++++++++++++
 .../intel/common/soc-acpi-intel-rpl-match.c   | 50 +++++++++++++++++++
 2 files changed, 100 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-arl-match.c b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
index 79d26e0f2c28..cc87c34e5a08 100644
--- a/sound/soc/intel/common/soc-acpi-intel-arl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
@@ -15,6 +15,42 @@ static const struct snd_soc_acpi_endpoint single_endpoint = {
 	.group_id = 0,
 };
 
+static const struct snd_soc_acpi_endpoint cs42l43_endpoints[] = {
+	{ /* Jack Playback Endpoint */
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /* DMIC Capture Endpoint */
+		.num = 1,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /* Jack Capture Endpoint */
+		.num = 2,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /* Speaker Playback Endpoint */
+		.num = 3,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
+static const struct snd_soc_acpi_adr_device cs42l43_0_adr[] = {
+	{
+		.adr = 0x00003001FA424301ull,
+		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints),
+		.endpoints = cs42l43_endpoints,
+		.name_prefix = "cs42l43"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
 	{
 		.adr = 0x000020025D071100ull,
@@ -33,6 +69,14 @@ static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_link_adr arl_cs42l43_l0[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l43_0_adr),
+		.adr_d = cs42l43_0_adr,
+	},
+};
+
 static const struct snd_soc_acpi_link_adr arl_rvp[] = {
 	{
 		.mask = BIT(0),
@@ -58,6 +102,12 @@ EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_arl_machines);
 
 /* this table is used when there is no I2S codec present */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_sdw_machines[] = {
+	{
+		.link_mask = BIT(0),
+		.links = arl_cs42l43_l0,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-arl-cs42l43-l0.tplg",
+	},
 	{
 		.link_mask = 0x1, /* link0 required */
 		.links = arl_rvp,
diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
index b0a49e28ab09..bc8817633b81 100644
--- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -30,6 +30,42 @@ static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
 	.group_id = 1,
 };
 
+static const struct snd_soc_acpi_endpoint cs42l43_endpoints[] = {
+	{ /* Jack Playback Endpoint */
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /* DMIC Capture Endpoint */
+		.num = 1,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /* Jack Capture Endpoint */
+		.num = 2,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /* Speaker Playback Endpoint */
+		.num = 3,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
+static const struct snd_soc_acpi_adr_device cs42l43_0_adr[] = {
+	{
+		.adr = 0x00003001FA424301ull,
+		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints),
+		.endpoints = cs42l43_endpoints,
+		.name_prefix = "cs42l43"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
 	{
 		.adr = 0x000020025D071100ull,
@@ -156,6 +192,14 @@ static const struct snd_soc_acpi_adr_device rt714_3_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_link_adr rpl_cs42l43_l0[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l43_0_adr),
+		.adr_d = cs42l43_0_adr,
+	},
+};
+
 static const struct snd_soc_acpi_link_adr rpl_sdca_3_in_1[] = {
 	{
 		.mask = BIT(0),
@@ -446,6 +490,12 @@ EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_rpl_machines);
 
 /* this table is used when there is no I2S codec present */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_sdw_machines[] = {
+	{
+		.link_mask = BIT(0),
+		.links = rpl_cs42l43_l0,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-rpl-cs42l43-l0.tplg",
+	},
 	{
 		.link_mask = 0xF, /* 4 active links required */
 		.links = rpl_sdca_3_in_1,
-- 
2.43.0

