Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BC55763CB
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 16:43:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 464F018FF;
	Fri, 15 Jul 2022 16:42:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 464F018FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657896205;
	bh=LYhgQYejIMibgkXKpbjW2lvF8KUmZM7QFN1CczAXbm0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Axwyyea3PiwgtXtO2maSBAS07tL32XgtkHayAs+rOZVEd4+jW3u+tIEAsULjzxlVG
	 lHDswEyv7u2F8U+To6EhAqrPgRfn5O/ZTK7mhWnhacGidOHJCfcY9Nuf3OR9IvF34g
	 pEEGUJcM2FPQoULtbkbWTEEBqyoAaAc6duCdmhsk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2431DF80212;
	Fri, 15 Jul 2022 16:42:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEACBF80542; Fri, 15 Jul 2022 16:42:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23C63F8014E
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 16:41:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23C63F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ScPlcG21"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657896119; x=1689432119;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LYhgQYejIMibgkXKpbjW2lvF8KUmZM7QFN1CczAXbm0=;
 b=ScPlcG21euwQvDWunCkO463palnM9p0HMeG0gz+TyUSAd+7qHQ+kW0C5
 bI6uddKW4LAVfinm0qrT0Lm2/AQIZs8fdJUV9waLOIHgfzGHEnVlWHPGV
 V1Lb91KIRFhPHAzPGB4rMdACzsxROuhxEwQprjWEY4H5MgjISo/VKovMN
 jvgKsiNUAqgoFW72nIfqtLCiY2zNpFEFPYu5GM3/2EwQD8YqC2IaB8nN7
 LSzAW3k71bIJvDQAlEpZpqZ+oMmWRwjkrxzLBAdqzHho3KXHRpbHQ4lBr
 3StKw/f79F/7/dEN4E3/j8NQFLGonbSXJUJsHrKSVJl0Q185WpfD0woK3 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="286947094"
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="286947094"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 07:41:53 -0700
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="593756522"
Received: from lgonzal1-mobl02.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.14.184])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 07:41:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/4] ASoC: Intel: soc-acpi: add table for HP Omen 16-k0005TX
Date: Fri, 15 Jul 2022 09:41:42 -0500
Message-Id: <20220715144144.274770-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220715144144.274770-1-pierre-louis.bossart@linux.intel.com>
References: <20220715144144.274770-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, gregkh@linuxfoundation.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, Bard liao <yung-chuan.liao@linux.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This device has an RT711-SDCA headset codec on link0 and an RT1316
amplifier on link3.

BugLink: https://github.com/thesofproject/sof/issues/5955
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-adl-match.c   | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index fea087d3fa15..6957d801f241 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -137,6 +137,15 @@ static const struct snd_soc_acpi_adr_device rt1316_2_single_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt1316_3_single_adr[] = {
+	{
+		.adr = 0x000330025D131601ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt1316-1"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt714_0_adr[] = {
 	{
 		.adr = 0x000030025D071401ull,
@@ -326,6 +335,20 @@ static const struct snd_soc_acpi_link_adr adl_sdw_rt1316_link2_rt714_link0[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr adl_sdw_rt711_link0_rt1316_link3[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt711_sdca_0_adr),
+		.adr_d = rt711_sdca_0_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt1316_3_single_adr),
+		.adr_d = rt1316_3_single_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_adr_device mx8373_2_adr[] = {
 	{
 		.adr = 0x000223019F837300ull,
@@ -546,6 +569,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-adl-rt1316-l2-mono-rt714-l0.tplg",
 	},
+	{
+		.link_mask = 0x9, /* 2 active links required */
+		.links = adl_sdw_rt711_link0_rt1316_link3,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-adl-rt711-l0-rt1316-l3.tplg",
+	},
 	{
 		.link_mask = 0x1, /* link0 required */
 		.links = adl_rvp,
-- 
2.34.1

