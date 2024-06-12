Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4378904C3C
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 09:01:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6403FE9F;
	Wed, 12 Jun 2024 09:00:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6403FE9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718175669;
	bh=tqqJI6wD144Ba0q2mBEunzNzlWBhDW4D6RtTx5VSFGA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nnj+mcTtgF89PB4tT0DRxwetzeNgIKdJ9Du1lxhuF5xk2Rzk17smX283DL4Pb5KKX
	 jkPxasHJWASwy4goLybaBcWBVrRSHnhci5LC2rN3qeb/YNRWWYRS468XAxbeo13kqM
	 2hAxQJNBenoiIR0iL9uLKvItBczQYcZWVRYaIy8A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34770F805BE; Wed, 12 Jun 2024 09:00:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FBFFF805E2;
	Wed, 12 Jun 2024 09:00:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3940BF805B3; Wed, 12 Jun 2024 09:00:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 225DFF805A1
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 08:59:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 225DFF805A1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gDPk4Avj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718175582; x=1749711582;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tqqJI6wD144Ba0q2mBEunzNzlWBhDW4D6RtTx5VSFGA=;
  b=gDPk4AvjySeI/BlJ+4HMt8SwdeX1JhFz6PTfysah3/yiQMuq+GrggpbI
   kwHhH7UyJHop7M4MgPoMZ7vU8TC4NC7ejt/0JrfmxrL5gzpQiKKDltjMu
   45Gns2dXP6QkMj1cPPzHBuCDOZHRkr582omcZ+Y3nZZ1vlgAtDbEkK4Hd
   6MPKcJvhQFMFb0XNPJ+k2PAlk8PdgFpyvh3yFNOoXArwp4rLwBs+GmbpG
   lV7KmK6teDVy7Cptu5WoGwG/5B1KmAJ+8ldehQULpd4icdu0fed5PtDpj
   g/IstrpM9p/1v0hRhQjRju03t0/pwW+dN0VN/jHWC6k1UIDsJNR9ixf3p
   A==;
X-CSE-ConnectionGUID: GXzRlIThS9mgf2XLRyw76Q==
X-CSE-MsgGUID: mANrZS6ISJOsifusria/ag==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15147466"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000";
   d="scan'208";a="15147466"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 23:59:39 -0700
X-CSE-ConnectionGUID: i1Lq8sxqQ5SNHprafjtX/Q==
X-CSE-MsgGUID: txqi0e+5RE6oFKEVUDCIoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000";
   d="scan'208";a="70486901"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.245.246.56])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 23:59:37 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 5/5] ASoC: Intel: soc-acpi-intel-ptl-match: Add rt722 support
Date: Wed, 12 Jun 2024 08:58:58 +0200
Message-ID: <20240612065858.53041-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240612065858.53041-1-pierre-louis.bossart@linux.intel.com>
References: <20240612065858.53041-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Z2YNMDIVTOLWQHK3YXPYBQOJZKRVUE3P
X-Message-ID-Hash: Z2YNMDIVTOLWQHK3YXPYBQOJZKRVUE3P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z2YNMDIVTOLWQHK3YXPYBQOJZKRVUE3P/>
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

