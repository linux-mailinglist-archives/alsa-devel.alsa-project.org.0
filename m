Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB16720A40
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 22:26:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CC981FE;
	Fri,  2 Jun 2023 22:25:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CC981FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685737608;
	bh=aYvuNkIJCJIg6Y000rfYQZ93nbPAe+88bGdbNpuykPQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A+ZKKvY2yzu8QxbumMGBIvmhI4yGFGRowQUCSv16nl7elp6LW0yDbh36DAnp6bRmu
	 dATCcmMOXzI1VvJoWlI/ECkki+hPL1Mr6kgWCjCodXFRo67tZK55EHNmzZR5oQe2IX
	 aH1k9f1nip1hK7DFNEszEqqa6RmhFBjj6CJLDKeQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7511CF805F9; Fri,  2 Jun 2023 22:23:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B2A3F805F1;
	Fri,  2 Jun 2023 22:23:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EEAD4F805DA; Fri,  2 Jun 2023 22:23:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5D1FF80549
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:23:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5D1FF80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TuYA6j23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685737390; x=1717273390;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aYvuNkIJCJIg6Y000rfYQZ93nbPAe+88bGdbNpuykPQ=;
  b=TuYA6j23QWpYvAcGvnqM75Ex+ePagvLASq1Ky52VF3lHTK/L8rduGqaq
   a6lkBH2yp/r0odSdDswk48IgqaU/NqpyceyNJi352XftnAGE9VDXtYnts
   LWtENOr/fUyXnxughKo9oc3PECvNUf6tNxCLKpmKPzuVJFOQj9LWEKb4m
   OZgf+/5lWFWxThvMTp8syrg/z1IL7tq6z7EHY58tX8Q6V+cTdtR8v3Pst
   mhMjSnzwaPjgxhz3FQCEBlIc3bFZBZnBLL49xcBaYraEcscm0JjTTWETY
   kkUFut3gAAR5z8OJvwdk3OokO2/YYdezMFENiJtxESfPWa0JBQ50c7NzW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="354811255"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="354811255"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="773020019"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="773020019"
Received: from clatorre-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.190.110])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:51 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 11/28] ASoC: Intel: soc-acpi-intel-tgl-match: add rt712 ID
Date: Fri,  2 Jun 2023 15:22:08 -0500
Message-Id: <20230602202225.249209-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
References: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HF7Z4662SPFBQWJ3VQFF4LM6B5A47BNG
X-Message-ID-Hash: HF7Z4662SPFBQWJ3VQFF4LM6B5A47BNG
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Add rt712 ID for TGL.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-tgl-match.c   | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index ef19150e7b2e..5804926c8b56 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -41,6 +41,21 @@ static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
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
 static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
 	{
 		.adr = 0x000020025D071100ull,
@@ -170,6 +185,24 @@ static const struct snd_soc_acpi_adr_device rt1316_1_single_adr[] = {
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
+static const struct snd_soc_acpi_adr_device rt1712_1_single_adr[] = {
+	{
+		.adr = 0x000130025D171201ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt712-dmic"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt1316_1_group1_adr[] = {
 	{
 		.adr = 0x000131025D131601ull, /* unique ID is set for some reason */
@@ -353,6 +386,20 @@ static const struct snd_soc_acpi_link_adr tgl_3_in_1_sdca_mono[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr tgl_712_only[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt712_0_single_adr),
+		.adr_d = rt712_0_single_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1712_1_single_adr),
+		.adr_d = rt1712_1_single_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_codecs tgl_max98373_amp = {
 	.num_codecs = 1,
 	.codecs = {"MX98373"}
@@ -435,6 +482,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-tgl-rt715-rt711-rt1308-mono.tplg",
 	},
+	{
+		.link_mask = 0xF, /* 4 active links required */
+		.links = tgl_712_only,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-tgl-rt712.tplg",
+	},
 	{
 		.link_mask = 0x7,
 		.links = tgl_sdw_rt711_link1_rt1308_link2_rt715_link0,
-- 
2.37.2

