Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B68945E00
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2024 14:42:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2384B419A;
	Fri,  2 Aug 2024 14:42:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2384B419A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722602552;
	bh=tOZ91IT2s8wpY7yLumZ5kw412vfzz4MXb5MVorwZxpY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EWOHaKsU8HA1HyOqBTEquFJQkkRGl3kSGrZcQvAiVrZIeIPXsm80Ndq0gGmi6tnDB
	 15/X9M3H0A3CBQ+k9sNW/hQul/jzcEuhe+4Q5Z2QvMaFmSGcPIDHWwynRpyA4vuSLC
	 bVMs0ZpQlXo+nriB9bqLSyk4PnwW4cfvXgzpbjLo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E9D0F80619; Fri,  2 Aug 2024 14:41:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F1C3F80649;
	Fri,  2 Aug 2024 14:41:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D314EF802DB; Fri,  2 Aug 2024 14:40:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5DC9AF80269
	for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2024 14:40:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DC9AF80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Z3pCHOiM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722602438; x=1754138438;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tOZ91IT2s8wpY7yLumZ5kw412vfzz4MXb5MVorwZxpY=;
  b=Z3pCHOiM0LHz6a0TlH2Sfrx/PI2q1BgEhElnOnYqgHRc8S6HknXgsTe6
   UURzWgTcCHmOdyx7KpnQmw42l0Tm3yFobvfnOj1inps1Pkm/6nz5oSX/C
   tRP5mGI1TFuNYIWYES5Nm7Ex/SAFiVd1gFnlQ5PIZpV0r8De2qPo/wvD0
   +1gcW4bd6cKn0szFVR7Xus8WK9wQHHp0eCZYWmAOiqCbjIQr8aX6nV5s4
   W4j7ETaFx1ZXHAvoKLhmgW7r/apz2o9zMK0okV5dQh1LACBvD96SUpp/3
   2Y+Y3O6yUqE/6eDgi8oxWYP6jNtTeWM1JaT6VWt3ZaYOVFK5d+gm2QFT2
   A==;
X-CSE-ConnectionGUID: 02Y764+oTru5Xw43VVBVhw==
X-CSE-MsgGUID: /BCHl77PQjWeQqW1jAkgmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="24488242"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800";
   d="scan'208";a="24488242"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 05:40:35 -0700
X-CSE-ConnectionGUID: Zn29nhgER5CAHa9q/kr/XQ==
X-CSE-MsgGUID: P4ipXeDGSe2zzwsMTRhq9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800";
   d="scan'208";a="55024815"
Received: from ltuz-desk.ger.corp.intel.com (HELO pbossart-mobl6.intel.com)
 ([10.245.246.89])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 05:40:33 -0700
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
Subject: [PATCH v4 4/5] ASoC: Intel: soc-acpi-intel-ptl-match: add rt711-sdca
 table
Date: Fri,  2 Aug 2024 14:40:10 +0200
Message-ID: <20240802124011.173820-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240802124011.173820-1-pierre-louis.bossart@linux.intel.com>
References: <20240802124011.173820-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DJPTQQJWA2I5CCSNMGFBU7GPNNXBUH3D
X-Message-ID-Hash: DJPTQQJWA2I5CCSNMGFBU7GPNNXBUH3D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DJPTQQJWA2I5CCSNMGFBU7GPNNXBUH3D/>
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

