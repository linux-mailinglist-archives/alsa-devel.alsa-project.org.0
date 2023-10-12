Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2D57C768B
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 21:16:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8459FEA4;
	Thu, 12 Oct 2023 21:15:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8459FEA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697138183;
	bh=qu2W6Dqxr5OV6ED0i5GKf1xpm3HN0FfwmIe4uBCjKr4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UrV/2h4Rtz6QZiV/OKYd4ENFse+fPGSXRLt1Cc8AvMQrUgcn8ZwinUF8uj4iEyGqI
	 5FX7ThHNpCj/WnRvDwTjlQxWKDvMvH4yg6R4PhDTFS/bvXtDOXq8QZwrFVqQnn2S/T
	 o/zP639kxjJqow9VKwyfYzRr2N7u5ODYCr/TIviw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03C92F8065B; Thu, 12 Oct 2023 21:11:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CB8AF805B4;
	Thu, 12 Oct 2023 21:10:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EAA4F802E8; Thu, 12 Oct 2023 21:10:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7367F80310
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 21:08:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7367F80310
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OqCpbnxE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697137740; x=1728673740;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qu2W6Dqxr5OV6ED0i5GKf1xpm3HN0FfwmIe4uBCjKr4=;
  b=OqCpbnxEVGfY92+K2eQxHALoRmmm4IoxcXqESAPt5OzWgawZfKbz/5Ta
   5sXV9QHK7Rem3JMGiPRBefCRq1KCbtPwGxWUP38TYiJfuvFjpQZzsn4DF
   U9tJfoK0i9xPgrcNNzg8aTMxaQQSXX/Nu0kHV6Ef+fMGWTWuMEwzzpGCh
   uZMrL1BYmmAtN3H7JM6gUWS4eqghDLgx1BdlzysL6SfRQkgZwovNB5Ltv
   nr4mG3PU9jAJu5yeXJDG2LpYpEKmotQsfB99cnQv64dQUSusJZo345TeF
   V1B+3x/j2ZSZwn9YHmubceb2gtZY1nXoC3UOXqensd/XW5UMXu+cmZeYz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="416060173"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="416060173"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="845108056"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="845108056"
Received: from gchoudha-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.hsd1.md.comcast.net) ([10.212.114.241])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:38 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 03/23] ASoC: Intel: soc-acpi-intel-mtl-match: add rt713 rt1316
 config
Date: Thu, 12 Oct 2023 15:08:06 -0400
Message-Id: <20231012190826.142619-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
References: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BVLGKXD25Z32ZA3DZWO6VUY74IMHHQ5F
X-Message-ID-Hash: BVLGKXD25Z32ZA3DZWO6VUY74IMHHQ5F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BVLGKXD25Z32ZA3DZWO6VUY74IMHHQ5F/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Adding rt713 jack + rt1316 amp + rt1713 dmic configuration support.

Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-mtl-match.c   | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index fbacabc93d6d..5e8881bf0768 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -158,6 +158,24 @@ static const struct snd_soc_acpi_adr_device rt1712_3_single_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt713_0_single_adr[] = {
+	{
+		.adr = 0x000031025D071301ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt713"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt1713_3_single_adr[] = {
+	{
+		.adr = 0x000331025D171301ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt713-dmic"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device mx8373_0_adr[] = {
 	{
 		.adr = 0x000023019F837300ull,
@@ -200,6 +218,24 @@ static const struct snd_soc_acpi_adr_device rt1316_3_group1_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt1316_1_group2_adr[] = {
+	{
+		.adr = 0x000131025D131601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "rt1316-1"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt1316_2_group2_adr[] = {
+	{
+		.adr = 0x000230025D131601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "rt1316-2"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt1318_1_group1_adr[] = {
 	{
 		.adr = 0x000130025D131801ull,
@@ -356,6 +392,30 @@ static const struct snd_soc_acpi_link_adr mtl_sdw_rt1318_l12_rt714_l0[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr mtl_rt713_l0_rt1316_l12_rt1713_l3[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt713_0_single_adr),
+		.adr_d = rt713_0_single_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1316_1_group2_adr),
+		.adr_d = rt1316_1_group2_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt1316_2_group2_adr),
+		.adr_d = rt1316_2_group2_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt1713_3_single_adr),
+		.adr_d = rt1713_3_single_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_adr_device mx8363_2_adr[] = {
 	{
 		.adr = 0x000230019F836300ull,
@@ -435,6 +495,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-rt715-rt711-rt1308-mono.tplg",
 	},
+	{
+		.link_mask = GENMASK(3, 0),
+		.links = mtl_rt713_l0_rt1316_l12_rt1713_l3,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-rt713-l0-rt1316-l12-rt1713-l3.tplg",
+	},
 	{
 		.link_mask = BIT(3) | BIT(0),
 		.links = mtl_712_only,
-- 
2.39.2

