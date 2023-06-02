Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CD8720A42
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 22:27:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00547844;
	Fri,  2 Jun 2023 22:26:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00547844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685737643;
	bh=AGoLJw5l0H9fQX8aNiC524oYwhnqOS/YzQRoYj4isgA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ttvv81Bmbs1wWx2xP+xeF9Du0oP4WN5sqI2KqiyaW6QaX5Oesl8w36Kt2RQQqtGaG
	 GfqsX5rkvYMOOKErbwxq002rg7HWGMlU/iLFPLa9SdPR2W2LbJf7cxcdsB3S/PkV5L
	 g6ChU3TpiRllgoR827QuEmKp32RkILwGpv3tOkPM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DE70F80609; Fri,  2 Jun 2023 22:23:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3FEAF8055A;
	Fri,  2 Jun 2023 22:23:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DCCAF805E6; Fri,  2 Jun 2023 22:23:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6A69F80527
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:23:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6A69F80527
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JzijAEc2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685737391; x=1717273391;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AGoLJw5l0H9fQX8aNiC524oYwhnqOS/YzQRoYj4isgA=;
  b=JzijAEc278f0DwrFzy21aY5DUZiuWX7JQRSyBsrcMNmkC9SpRLAB/maU
   WkYnSNchEpk3tdVBDAGl5AjQwNIDkvpdwfoPxkdtVFEWMUeMbBKo2u6MI
   7OE0h4uND0W7Qa3ip0etI10xomG5yzAysbaK69Ztv7ZAKPXJ8cwmsdYA7
   26bubtgCAjCKSCwiFku0Ceyk9LZ3Q1pjBBMMOfjAHGbPBI0Clp0sCAumb
   8ADJAoKbZN2wYTvmFbq2RxYmWY9TCVpanjxNSU+wpwrhruCj+APJMji4S
   6OESqMBdfA4J7W7kCJXww4Q+wJMLVdj1iLEY7EOz/+L+LnDbu3cxcGpZc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="354811263"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="354811263"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="773020021"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="773020021"
Received: from clatorre-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.190.110])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 12/28] ASoC: Intel: soc-acpi-intel-mtl-match: add rt712 ID
Date: Fri,  2 Jun 2023 15:22:09 -0500
Message-Id: <20230602202225.249209-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
References: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5CBTVUKJIS7HO6J4DSWR56ST7OL3NM5G
X-Message-ID-Hash: 5CBTVUKJIS7HO6J4DSWR56ST7OL3NM5G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5CBTVUKJIS7HO6J4DSWR56ST7OL3NM5G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Add rt712 ID for MTL.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-mtl-match.c   | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 8fd4d0db201e..2c2bece6cd77 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -65,6 +65,21 @@ static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
 	.group_id = 1,
 };
 
+static const struct snd_soc_acpi_endpoint rt712_endpoints[] = {
+	{
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{
+		.num = 1,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
 static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 	{
 		.adr = 0x000030025D071101ull,
@@ -74,6 +89,24 @@ static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt712_0_single_adr[] = {
+	{
+		.adr = 0x000030025D071201ull,
+		.num_endpoints = ARRAY_SIZE(rt712_endpoints),
+		.endpoints = rt712_endpoints,
+		.name_prefix = "rt712"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt1712_3_single_adr[] = {
+	{
+		.adr = 0x000330025D171201ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt712-dmic"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device mx8373_0_adr[] = {
 	{
 		.adr = 0x000023019F837300ull,
@@ -125,6 +158,20 @@ static const struct snd_soc_acpi_adr_device rt714_1_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_link_adr mtl_712_only[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt712_0_single_adr),
+		.adr_d = rt712_0_single_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt1712_3_single_adr),
+		.adr_d = rt1712_3_single_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr rt5682_link2_max98373_link0[] = {
 	/* Expected order: jack -> amp */
 	{
@@ -194,6 +241,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-rt715-rt711-rt1308-mono.tplg",
 	},
+	{
+		.link_mask = BIT(3) | BIT(0),
+		.links = mtl_712_only,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-rt712-l0-rt1712-l3.tplg",
+	},
 	{
 		.link_mask = GENMASK(3, 0),
 		.links = mtl_3_in_1_sdca,
-- 
2.37.2

