Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3248884E5E5
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Feb 2024 18:02:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98A73FAA;
	Thu,  8 Feb 2024 18:02:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98A73FAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707411745;
	bh=iRATeZtRrW+PHtKv+nCULUFBqBZO+V/KE5hbLZcj5RU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OZCMKUolGv7sgVAkiTpWbnUQjh2CNKCZRosOGoojAJsWjc07FIbCQbuL2snERJlP4
	 0cki6ukNsg81uwKY6ZCzEM6ldvd6mb69qhndtwNRp3T9paIzb3DM3NJWAtd3GhsLdz
	 I1W5dDFbMw0ylkgKaXw4DjLC+zuJ0MvWSL8lSWfI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9815BF896DB; Thu,  8 Feb 2024 17:57:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21B73F896B4;
	Thu,  8 Feb 2024 17:57:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8524F806BC; Thu,  8 Feb 2024 17:56:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EBFE7F8060C
	for <alsa-devel@alsa-project.org>; Thu,  8 Feb 2024 17:56:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBFE7F8060C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OITOTBzL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411377; x=1738947377;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iRATeZtRrW+PHtKv+nCULUFBqBZO+V/KE5hbLZcj5RU=;
  b=OITOTBzLjyfA7afpXYqL2DiZKP1yhZQPPCE1WhSuQHE7zfepK5R3lWao
   tc7JUgut6jAhvbQmybZvvrgsWaTJjAoxNYCWx+cL5PeJ9UNNZriRKcAx9
   04GVg4P8Aq/Iiiws0DQYv41R2iAa8ChZGKrqus2g8fGsVyypwTLj9ZTUg
   bwFhRhk6aqv9LabL4J93B+aImfBPNk+3ndrD9qdHS/2BZ957XQYECjMHV
   +FKEm8leCmjcWucmdCBayJP762KgL+nUNksLxnAJOTn18Oo1VUarVRWRG
   ENCW++cz7boU2Vm5V4hOiMePzSJyl7qu6RHo0Z/Bve37SPxjkgaMntxnt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675447"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="395675447"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:56:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="1690284"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:56:07 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Chao Song <chao.song@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 23/24] ASoC: Intel: soc-acpi-intel-lnl-match: Add rt722
 support
Date: Thu,  8 Feb 2024 10:55:44 -0600
Message-Id: <20240208165545.93811-24-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
References: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UR7EYMKIX7W7MPUOKUW4PJB5JEU4RD5Q
X-Message-ID-Hash: UR7EYMKIX7W7MPUOKUW4PJB5JEU4RD5Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UR7EYMKIX7W7MPUOKUW4PJB5JEU4RD5Q/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Chao Song <chao.song@linux.intel.com>

This patch adds match table for rt722 multiple
function codec on link 0.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-lnl-match.c   | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
index 3d48e161cb33..74d6dcd7471f 100644
--- a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
@@ -51,6 +51,31 @@ static const struct snd_soc_acpi_endpoint rt712_endpoints[] = {
 	},
 };
 
+/*
+ * RT722 is a multi-function codec, three endpoints are created for
+ * its headset, amp and dmic functions.
+ */
+static const struct snd_soc_acpi_endpoint rt722_endpoints[] = {
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
+	{
+		.num = 2,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
 static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 	{
 		.adr = 0x000030025D071101ull,
@@ -78,6 +103,15 @@ static const struct snd_soc_acpi_adr_device rt1712_3_single_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt722_0_single_adr[] = {
+	{
+		.adr = 0x000030025d072201ull,
+		.num_endpoints = ARRAY_SIZE(rt722_endpoints),
+		.endpoints = rt722_endpoints,
+		.name_prefix = "rt722"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt1316_2_group1_adr[] = {
 	{
 		.adr = 0x000230025D131601ull,
@@ -128,6 +162,15 @@ static const struct snd_soc_acpi_link_adr lnl_712_only[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr lnl_rt722_only[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt722_0_single_adr),
+		.adr_d = rt722_0_single_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr lnl_3_in_1_sdca[] = {
 	{
 		.mask = BIT(0),
@@ -191,6 +234,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-lnl-rt712-l2-rt1712-l3.tplg",
 	},
+	{
+		.link_mask = BIT(0),
+		.links = lnl_rt722_only,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-lnl-rt722-l0.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_lnl_sdw_machines);
-- 
2.40.1

