Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 751A78B3B81
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:31:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A7F11926;
	Fri, 26 Apr 2024 17:30:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A7F11926
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145462;
	bh=J2eM61MUNL0PVZO5q4cOIHXd03/HUMuzQ7EwErj0wjI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lui181HDZFTMIbPUVzd4N3g7sbMXA4UJr57E6k+vdvv2WNrZp/B8TsCRKt0p2Ro7y
	 vuv9BWVYEyttZkNaZwh2VAZ6PqUtVi35DZJXgYGSnf0R1WIRsPUjfFidfEhmcnKjsw
	 o97j0AAZhuol+GTBl9zwjE9vej2KLidMmuUzqb+o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F11DF80C98; Fri, 26 Apr 2024 17:26:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6227FF80C75;
	Fri, 26 Apr 2024 17:26:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2664F805BD; Fri, 26 Apr 2024 17:26:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 26272F805F7
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:25:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26272F805F7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IRZUeIom
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145155; x=1745681155;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J2eM61MUNL0PVZO5q4cOIHXd03/HUMuzQ7EwErj0wjI=;
  b=IRZUeIomI0xgekMfryOAbLwuemYMLthIDsJ86yb+A7UAvkSmXAnGDvpJ
   eQact8NhHI9vJfIWYRGMpMx+L3dQuPl/cSYjJr7cUBnAVNxxc0qe1iVre
   vTS7hgTfUMAeU9BMtyaDBushISy7UStp0N5HEXgar5yZoFS+FLe2BziPu
   JoOjiNo9ucxDdo5ttLPqOlYAIyk3idWpQv9R1pbTVff/XMH16kDF7eIJO
   bPJsrg/iU/LKiLHH40pvZKbri+wyegJ6ad1iyBsAY0qK2ZuVw/CmrO7aV
   Cl6EIbOfub3NJGBXP/KXLujM61qpYlkIPiwxpNVKfJuRNfcPD6nB+g7L2
   A==;
X-CSE-ConnectionGUID: 9C2Kxsn2THmXosP06ePzIw==
X-CSE-MsgGUID: epmJfltBRLaNixdz8SYvqQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291356"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="21291356"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:51 -0700
X-CSE-ConnectionGUID: GjxfGHSnTEOVDidpf+gEww==
X-CSE-MsgGUID: 8EyijvjOR6OH3IpHdzhiog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="30259605"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:51 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 19/23] ASoC: Intel: sof_rt5682: add icl_rt5682_def for icl
 boards
Date: Fri, 26 Apr 2024 10:25:25 -0500
Message-Id: <20240426152529.38345-20-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UXBXVOLTXOPSELCDXPJBOUQYAIUMYQOI
X-Message-ID-Hash: UXBXVOLTXOPSELCDXPJBOUQYAIUMYQOI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UXBXVOLTXOPSELCDXPJBOUQYAIUMYQOI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add the board config icl_rt5682_def to rt5682 machine driver for all
icl boards using default SSP port allocation (headphone codec on SSP0).

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c               | 14 +++++---------
 sound/soc/intel/common/soc-acpi-intel-icl-match.c |  2 +-
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 4c6dfe632edf..7a35db5cab35 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -76,15 +76,6 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 					SOF_SSP_PORT_CODEC(0) |
 					SOF_SSP_PORT_AMP(1)),
 	},
-	{
-		.callback = sof_rt5682_quirk_cb,
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Ice Lake Client"),
-		},
-		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
-					SOF_SSP_PORT_CODEC(0)),
-	},
 	{
 		.callback = sof_rt5682_quirk_cb,
 		.matches = {
@@ -808,6 +799,11 @@ static const struct platform_device_id board_ids[] = {
 					SOF_SSP_PORT_CODEC(2) |
 					SOF_SSP_PORT_AMP(1)),
 	},
+	{
+		.name = "icl_rt5682_def",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_SSP_PORT_CODEC(0)),
+	},
 	{
 		.name = "cml_rt5682_def",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
diff --git a/sound/soc/intel/common/soc-acpi-intel-icl-match.c b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
index d0062f2cd256..39875d67dcd1 100644
--- a/sound/soc/intel/common/soc-acpi-intel-icl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
@@ -29,7 +29,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_icl_machines[] = {
 	},
 	{
 		.id = "10EC5682",
-		.drv_name = "sof_rt5682",
+		.drv_name = "icl_rt5682_def",
 		.sof_tplg_filename = "sof-icl-rt5682.tplg",
 	},
 	{
-- 
2.40.1

