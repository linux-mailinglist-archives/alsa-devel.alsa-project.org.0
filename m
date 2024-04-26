Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A60188B3B3A
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:24:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB911DEC;
	Fri, 26 Apr 2024 17:24:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB911DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145050;
	bh=uvsiV2YLLM+olUopeXgfESIJEeQMUUr6tjoE9Ugq0pw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ATZQlv3Wq10fhcMLDcRGf6/+ObVNiXFHK6ZI4KbDVZl3P2KilI//Lz1ug3MXRtMSn
	 UH50DpZR4v3hsOQxXCXvHSRfhmXWqcfYhTc/XEWHLXyfxzWOZnqdhkgBIGLChsczie
	 xeVKm7lk/AZN+AF1T/qUL9oZZ1jpIGpLHSawvdpM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E329F806A2; Fri, 26 Apr 2024 17:22:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2597CF805BB;
	Fri, 26 Apr 2024 17:22:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2ECCDF805BE; Fri, 26 Apr 2024 17:22:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 99C16F802E8
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:21:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99C16F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=aCZ88Qwh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714144908; x=1745680908;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uvsiV2YLLM+olUopeXgfESIJEeQMUUr6tjoE9Ugq0pw=;
  b=aCZ88Qwhgl4mHMUwy6jyQ3FCP6vuKt+B2X8gL2l6BaEjc/luiGtz/Lmc
   Z3bfPjakQjN5qr2VHYAaFJeh70eTzgcj7P3ifevUaypYN1cnH8gILdtFD
   Z3jJTMSU16dBD5hpwS/aszlNVeFtpSoIjx/S5Vf/CiBfvkK3l4dXyYcbe
   Ens4Xvd3XIAouTtsHFeG1czBGwXneCr1EoMm0XuGU+8/XCCmHXC8jG8wm
   vb0gdOjte+8AdLXkVXz0FvpOFGB4LELfoDTz5U2GFw/hw2WYFtA+/tZcn
   fGqui6jyLnYJTZZcFNcRVig340hlSNrVAhIxjLAUs8IEj2vwexhso1mQF
   A==;
X-CSE-ConnectionGUID: +lZob1MAQdiitwcvs/Mc/w==
X-CSE-MsgGUID: brRE45dKTL20XfqGrBuHfw==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21290603"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="21290603"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:21:40 -0700
X-CSE-ConnectionGUID: TZhS/xgITR+Umrtw3fsWHw==
X-CSE-MsgGUID: cv0B5d47RWaFIROsWzdjPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="30259025"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:21:40 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 03/12] ASoC: Intel: soc-acpi: mtl: add Dell SKU 0C64 and 0CC6
Date: Fri, 26 Apr 2024 10:21:14 -0500
Message-Id: <20240426152123.36284-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XVXDGOK54FKZAHR7ADJJ5ECGOSF34XYD
X-Message-ID-Hash: XVXDGOK54FKZAHR7ADJJ5ECGOSF34XYD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XVXDGOK54FKZAHR7ADJJ5ECGOSF34XYD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SKU 0C64 relies on rt713 (jack codec) on link0, rt1318 (single
amplifier) on link1 and rt1713 (dmic) on link3.

SKU 0CC6 relies on rt713 (jack codec) on link0, rt1318 (two
amplifiers) on link 1-2 and rt1713 (dmic) on link3.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-mtl-match.c   | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index f95490a16b55..8c1c430f5482 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -312,6 +312,15 @@ static const struct snd_soc_acpi_adr_device rt1316_3_single_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt1318_1_single_adr[] = {
+	{
+		.adr = 0x000130025D131801,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt1318"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt1318_1_group1_adr[] = {
 	{
 		.adr = 0x000130025D131801ull,
@@ -559,6 +568,49 @@ static const struct snd_soc_acpi_link_adr mtl_rt713_l0_rt1316_l12_rt1713_l3[] =
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr mtl_rt713_l0_rt1318_l1_rt1713_l3[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt713_0_single_adr),
+		.adr_d = rt713_0_single_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1318_1_single_adr),
+		.adr_d = rt1318_1_single_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt1713_3_single_adr),
+		.adr_d = rt1713_3_single_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr mtl_rt713_l0_rt1318_l12_rt1713_l3[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt713_0_single_adr),
+		.adr_d = rt713_0_single_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1318_1_group1_adr),
+		.adr_d = rt1318_1_group1_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt1318_2_group1_adr),
+		.adr_d = rt1318_2_group1_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt1713_3_single_adr),
+		.adr_d = rt1713_3_single_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr mtl_rt713_l0_rt1316_l12[] = {
 	{
 		.mask = BIT(0),
@@ -697,6 +749,18 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-rt713-l0-rt1316-l12-rt1713-l3.tplg",
 	},
+	{
+		.link_mask = GENMASK(3, 0),
+		.links = mtl_rt713_l0_rt1318_l12_rt1713_l3,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-rt713-l0-rt1318-l12-rt1713-l3.tplg",
+	},
+	{
+		.link_mask = BIT(0) | BIT(1) | BIT(3),
+		.links = mtl_rt713_l0_rt1318_l1_rt1713_l3,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-rt713-l0-rt1318-l1-rt1713-l3.tplg",
+	},
 	{
 		.link_mask = GENMASK(2, 0),
 		.links = mtl_rt713_l0_rt1316_l12,
-- 
2.40.1

