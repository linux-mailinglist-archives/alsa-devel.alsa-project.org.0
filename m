Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9637FA134
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 14:38:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67D8D846;
	Mon, 27 Nov 2023 14:38:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67D8D846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701092297;
	bh=/bYP0A7guh2gx+dTt1lqj9fiXy1Rvo2B2dJpNFUeSxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EB581mJc3Hs29w3iJED166tx6vrSuiJf3DZmif1x2FtOkYDOE7egOUEqc68Qd78q7
	 7I3Qm62B1qQBFl17FqL7ORb/HRVVUSqJNPjjXJxtjwVN9vObQ0ZYSDM4I6wYseU0AC
	 48wmnim5w3EdvTxhGKDATMMYWNnFuy2Fz3tUMxUE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC63EF80683; Mon, 27 Nov 2023 14:36:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48AC6F80683;
	Mon, 27 Nov 2023 14:36:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55C38F80615; Mon, 27 Nov 2023 14:36:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 519A4F80236
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 14:36:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 519A4F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DLp7HX+g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701092163; x=1732628163;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/bYP0A7guh2gx+dTt1lqj9fiXy1Rvo2B2dJpNFUeSxw=;
  b=DLp7HX+g0wItdGmbc+xy4wjSykZFIbmq/Retd0zEQ+0F9mrW76Td1OpO
   Gkl6O53dKWYF2zIhir/P30kocgWnN2TuI+U+iaTg+2S4PZU9/uiXYMSRU
   /pkvLO9h82z/dFtq/QdcOUUQufC5IU91dODF/xlTGUyTrP8CtSPb3xvgN
   ueTy9YBnKiUS9P4R/0fChZBC7cDVDcDF6wZViTrzMw8h2rUVgLp7GlGYe
   D+kKUCpNGlhnPOhR5x6fpfFDUfpfwhaPS9YG52/Lf30XhSuUvv005E/hA
   xU0oIj6MCOEr7XUpqZy3xfC3jIqPAYa+GpYukaVsIZJGEN7RGHb4UQJvm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="391578587"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="391578587"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 05:34:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="891743781"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="891743781"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 05:34:35 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	cezary.rojewski@intel.com,
	yung-chuan.liao@linux.intel.com,
	ckeepax@opensource.cirrus.com,
	yong.zhi@intel.com,
	chao.song@linux.intel.com
Subject: [PATCH 6/7] ASoC: Intel: soc-acpi-intel-tgl-match: add cs42l43 and
 cs56l56 support
Date: Mon, 27 Nov 2023 15:34:47 +0200
Message-ID: <20231127133448.18449-7-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127133448.18449-1-peter.ujfalusi@linux.intel.com>
References: <20231127133448.18449-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VIGM5O3MRJR6XHSQL6KHKLIO3ZTEVU6L
X-Message-ID-Hash: VIGM5O3MRJR6XHSQL6KHKLIO3ZTEVU6L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VIGM5O3MRJR6XHSQL6KHKLIO3ZTEVU6L/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

This is a test configuration for UpExtreme.

The codec layout is configured as:
    - Link3: CS42L43 Jack
    - Link0: 2x CS35L56 Speaker
    - Link1: 2x CS35L56 Speaker

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-tgl-match.c   | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 5804926c8b56..49834bffa50c 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -41,6 +41,20 @@ static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
 	.group_id = 1,
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
 static const struct snd_soc_acpi_endpoint rt712_endpoints[] = {
 	{
 		.num = 0,
@@ -400,6 +414,64 @@ static const struct snd_soc_acpi_link_adr tgl_712_only[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_adr_device cs42l43_3_adr[] = {
+	{
+		.adr = 0x00033001FA424301ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "cs42l43"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device cs35l56_0_adr[] = {
+	{
+		.adr = 0x00003301FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "cs35l56-8"
+	},
+	{
+		.adr = 0x00003201FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_3_endpoint,
+		.name_prefix = "cs35l56-7"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device cs35l56_1_adr[] = {
+	{
+		.adr = 0x00013701FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "cs35l56-1"
+	},
+	{
+		.adr = 0x00013601FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_2_endpoint,
+		.name_prefix = "cs35l56-2"
+	}
+};
+
+static const struct snd_soc_acpi_link_adr tgl_cs42l43_cs35l56[] = {
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(cs42l43_3_adr),
+		.adr_d = cs42l43_3_adr,
+	},
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs35l56_0_adr),
+		.adr_d = cs35l56_0_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(cs35l56_1_adr),
+		.adr_d = cs35l56_1_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_codecs tgl_max98373_amp = {
 	.num_codecs = 1,
 	.codecs = {"MX98373"}
@@ -494,6 +566,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-tgl-rt715-rt711-rt1308-mono.tplg",
 	},
+	{
+		.link_mask = 0xB,
+		.links = tgl_cs42l43_cs35l56,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-tgl-cs42l43-l3-cs35l56-l01.tplg",
+	},
 	{
 		.link_mask = 0xF, /* 4 active links required */
 		.links = tgl_3_in_1_default,
-- 
2.43.0

