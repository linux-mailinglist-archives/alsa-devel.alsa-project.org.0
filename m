Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A7190643B
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 08:39:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EE9EA4B;
	Thu, 13 Jun 2024 08:39:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EE9EA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718260761;
	bh=tOZ91IT2s8wpY7yLumZ5kw412vfzz4MXb5MVorwZxpY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Vg32caIsdk3WtYhx5C82KjKWuibU01giNyWAhm2DlmGTH0bOUaYIx9+7X4oEqhjir
	 bAybHlqFOLAUMkPyI4HIQOAkSK0A56VMu89aprwSNgN8FHjUitbXDLb9KC2UnsHLfb
	 Yc9TwmUDegDIUBPX6GgJWT9G3zbTLJyaoERbHz54=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1210F80632; Thu, 13 Jun 2024 08:38:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0611FF80631;
	Thu, 13 Jun 2024 08:38:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A403F805B4; Thu, 13 Jun 2024 08:38:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6AF14F800D0
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 08:38:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AF14F800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NMC+NHrt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718260682; x=1749796682;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tOZ91IT2s8wpY7yLumZ5kw412vfzz4MXb5MVorwZxpY=;
  b=NMC+NHrtTew5KPcSt1spWpGTKyN8DKOD0Forb8o6mh1QzrGjB6aUtC3+
   LX5e3oxHkS2xH3mpj00t8Kxzu3qEta6DhUg8RhBPg7lVdmLaK3OFMvJo7
   mSOErabWWxSAQHTPcoJE8vbVtbN3V0RQDQYW/RMbE/c2kV//kVOJdR497
   Rni8ZOsnT3sfxjkxsXfOPXmEuxIedId2Xw8lWMbxfLfju7ucYoMqlqCph
   eq8dnxeZXFpaFFPFagCzeJkhxlvPDbsoKzPQzBlfAryq3RYVbqk2tQXL3
   K6/qwd90uCkNmaLtpkTj+Z36IKU3ByQQ8ttA26cLtc3ladpnLDWo/gaA4
   A==;
X-CSE-ConnectionGUID: 16TxJeMpQoSsxgtCO3RpWg==
X-CSE-MsgGUID: 60SS10LgQjST/MsRTHSlJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="25736647"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000";
   d="scan'208";a="25736647"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 23:37:59 -0700
X-CSE-ConnectionGUID: 6R9a3YwdQruo7RPqCtq4wg==
X-CSE-MsgGUID: tyzxhkqlQIKI/WzbuttsPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000";
   d="scan'208";a="39960976"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.245.246.108])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 23:37:55 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v2 4/5] ASoC: Intel: soc-acpi-intel-ptl-match: add rt711-sdca
 table
Date: Thu, 13 Jun 2024 08:37:31 +0200
Message-ID: <20240613063732.241157-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240613063732.241157-1-pierre-louis.bossart@linux.intel.com>
References: <20240613063732.241157-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DGRDJQEH6PJM3HSES3MHNECRXYA3CDLW
X-Message-ID-Hash: DGRDJQEH6PJM3HSES3MHNECRXYA3CDLW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DGRDJQEH6PJM3HSES3MHNECRXYA3CDLW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Add rt711-sdca on sdw link0.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-ptl-match.c   | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index dba45fa7a453..ce4234fd3895 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -15,6 +15,31 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_machines[] = {
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_ptl_machines);
 
+static const struct snd_soc_acpi_endpoint single_endpoint = {
+	.num = 0,
+	.aggregated = 0,
+	.group_position = 0,
+	.group_id = 0,
+};
+
+static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
+	{
+		.adr = 0x000030025D071101ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt711"
+	}
+};
+
+static const struct snd_soc_acpi_link_adr ptl_rvp[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt711_sdca_0_adr),
+		.adr_d = rt711_sdca_0_adr,
+	},
+	{}
+};
+
 /* this table is used when there is no I2S codec present */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 	/* mockup tests need to be first */
@@ -36,6 +61,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-ptl-rt715-rt711-rt1308-mono.tplg",
 	},
+	{
+		.link_mask = BIT(0),
+		.links = ptl_rvp,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-ptl-rt711.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_ptl_sdw_machines);
-- 
2.43.0

