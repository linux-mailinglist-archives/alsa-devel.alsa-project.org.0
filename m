Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8F684E5EC
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Feb 2024 18:02:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC72EFAA;
	Thu,  8 Feb 2024 18:02:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC72EFAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707411764;
	bh=bBqCF2/OnOSVb2gLZk/AQzWEjtWBOf6SkDQcoEfQ+BM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iaBt3aUsCXa+bRi9S3LHyCcZ+8lZsqQE/H/Y1ECwZrtVdHIg1rK78B3BTmolbtk8H
	 5H4qoJ/EdqYsUzxRcLJlHC4nzzBlLTP+yMGjY/RcDiD5UxOwoaL9KJEchSgyBtQYz4
	 35S6ezy9h0NyIMPDqyuSKXa8WcuknaldjLfgSesQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BB2FF896FC; Thu,  8 Feb 2024 17:57:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DCAC6F896ED;
	Thu,  8 Feb 2024 17:57:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38A4CF806CB; Thu,  8 Feb 2024 17:56:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D02DEF80609
	for <alsa-devel@alsa-project.org>; Thu,  8 Feb 2024 17:56:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D02DEF80609
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TKbEoOrN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411377; x=1738947377;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bBqCF2/OnOSVb2gLZk/AQzWEjtWBOf6SkDQcoEfQ+BM=;
  b=TKbEoOrNTfHlcyVRXxh3YDuRRKhhHSy5CVM8LPpAgI4CW6cyj7hda8Fg
   Tt2H0gu2pKuXzpsIMrgnQ5fyYzutciYAA89fIoMZq6sgu0CV3g2jLP0dV
   FfoAMVcmBfIKKrQ3DbXdn3Chh+gR2rPRoc+TCEQVw9h2BhZ5qAsLVLSju
   Okd/+2JRorU+lNft5n9lx6D1g+sRuL4EtQk2WOjmFytZFlfN9S/8a9U7S
   tfTLEn8VjHUebU20o3H3M6+o4+qEJ+9MnJtMyU6AN/8jDQ1KT4cEE8jHW
   qTO84JAl2k5uAvzN8fsC9mBP5CueDPTA/4nW1blAWAo7C7tJ0Gl+kaa8Y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675442"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="395675442"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:56:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="1690279"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:56:06 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Chao Song <chao.song@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 22/24] ASoC: Intel: soc-acpi: add RT712 support for LNL
Date: Thu,  8 Feb 2024 10:55:43 -0600
Message-Id: <20240208165545.93811-23-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
References: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OPRQQVFAV7HSAEMJAUA4OK4IDNXYB5HR
X-Message-ID-Hash: OPRQQVFAV7HSAEMJAUA4OK4IDNXYB5HR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OPRQQVFAV7HSAEMJAUA4OK4IDNXYB5HR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Chao Song <chao.song@linux.intel.com>

This patch adds RT712 support for LNL.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-lnl-match.c   | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
index 5897bb6b28b8..3d48e161cb33 100644
--- a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
@@ -36,6 +36,21 @@ static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
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
@@ -45,6 +60,24 @@ static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt712_2_single_adr[] = {
+	{
+		.adr = 0x000230025D071201ull,
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
 static const struct snd_soc_acpi_adr_device rt1316_2_group1_adr[] = {
 	{
 		.adr = 0x000230025D131601ull,
@@ -81,6 +114,20 @@ static const struct snd_soc_acpi_link_adr lnl_rvp[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr lnl_712_only[] = {
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt712_2_single_adr),
+		.adr_d = rt712_2_single_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt1712_3_single_adr),
+		.adr_d = rt1712_3_single_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr lnl_3_in_1_sdca[] = {
 	{
 		.mask = BIT(0),
@@ -138,6 +185,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-lnl-rt711.tplg",
 	},
+	{
+		.link_mask = BIT(2) | BIT(3),
+		.links = lnl_712_only,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-lnl-rt712-l2-rt1712-l3.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_lnl_sdw_machines);
-- 
2.40.1

