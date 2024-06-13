Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C99E90643E
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 08:39:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7A05E0F;
	Thu, 13 Jun 2024 08:39:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7A05E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718260793;
	bh=tqqJI6wD144Ba0q2mBEunzNzlWBhDW4D6RtTx5VSFGA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aZdzst77jbzs8b1qwhTAGM6ZXnMJGj5ZdSnXQOMfgSLGwknAoLAlNSjN4NfpPYQ0u
	 p20pmkf5B16Uv9HcuOjBuC9I/kW8wRzdAMFE5neTHZlR+27zA+U84q5m0gzdHszrs7
	 NqEHXjtb/WpAZpQcGVCTAikCgyUwSdTjrD5D2qrQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4706DF80680; Thu, 13 Jun 2024 08:38:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A697F80691;
	Thu, 13 Jun 2024 08:38:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6AA5F805FF; Thu, 13 Jun 2024 08:38:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E184F80589
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 08:38:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E184F80589
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=B8jjusty
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718260684; x=1749796684;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tqqJI6wD144Ba0q2mBEunzNzlWBhDW4D6RtTx5VSFGA=;
  b=B8jjusty57W9DdHRexEm60c5TkWz+rxuS6jzgs68E9DH+x+F3ED4yf8s
   0+/6RxFUax1gv2k6yHU3lgNW+7Lx+rMcUemdcdJcIj1jY/7JNbe8RLbyB
   rS8EfJVA7g3fkHqVknp/NEQbwPLsnb2+Ga6R5GREA7NXZytIg04ol4GKJ
   gJWag3hjT1bKr1L6+eGyXRn0FIqOAmpwiK2UWTNPZ63wkTUmYn2N66Wti
   DVlxrIOWTpknsFTCR9oTZiX8wawbkihZyiRsuOefaGe64w5h/Gm6dZTWE
   KT0ZsyZzjQo73ZeLDz1H3OeDw6nCND38W6txWTOFtZsu+c6xjuyL0nqNt
   A==;
X-CSE-ConnectionGUID: Chkp/n57TvmNTyGlvlGMAg==
X-CSE-MsgGUID: YqFEXYG5SaaNrobkrs3w+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="25736653"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000";
   d="scan'208";a="25736653"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 23:38:03 -0700
X-CSE-ConnectionGUID: WAnfwx61SdGA8TGKOxcD9Q==
X-CSE-MsgGUID: 6V1WgmhRTpSRT6/vgEvFlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000";
   d="scan'208";a="39960989"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.245.246.108])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 23:37:59 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v2 5/5] ASoC: Intel: soc-acpi-intel-ptl-match: Add rt722
 support
Date: Thu, 13 Jun 2024 08:37:32 +0200
Message-ID: <20240613063732.241157-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240613063732.241157-1-pierre-louis.bossart@linux.intel.com>
References: <20240613063732.241157-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YWJ333J5S46SNGCAYS45RVCUFEXHDTTL
X-Message-ID-Hash: YWJ333J5S46SNGCAYS45RVCUFEXHDTTL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YWJ333J5S46SNGCAYS45RVCUFEXHDTTL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

This patch adds match table for rt722 multiple
function codec on link 0.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-ptl-match.c   | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index ce4234fd3895..d01646f52d1f 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -22,6 +22,31 @@ static const struct snd_soc_acpi_endpoint single_endpoint = {
 	.group_id = 0,
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
@@ -31,6 +56,24 @@ static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
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
+static const struct snd_soc_acpi_link_adr ptl_rt722_only[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt722_0_single_adr),
+		.adr_d = rt722_0_single_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr ptl_rvp[] = {
 	{
 		.mask = BIT(0),
@@ -67,6 +110,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-ptl-rt711.tplg",
 	},
+	{
+		.link_mask = BIT(0),
+		.links = ptl_rt722_only,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-ptl-rt722-l0.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_ptl_sdw_machines);
-- 
2.43.0

