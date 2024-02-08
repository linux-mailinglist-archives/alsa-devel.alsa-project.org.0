Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E0A84E5C1
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Feb 2024 17:59:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47AB9E76;
	Thu,  8 Feb 2024 17:59:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47AB9E76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707411568;
	bh=1qIbuDxxnC7LHRl1bXGWQdtxfGnCJuRj1o/za54baOE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iJi5HR1/K1gzZvF7E7540qN3umP4wuIrIY8vOB8nTe0BFMKxk2HJSyI9BF17lGs01
	 zyXbpNdGV+x1G3nDcHkPOGJILLd/fIgfZdzBiTeJ2ZdCijb01O/Rvyq/ZbU/AgQz/z
	 u5t0cLk/WieypYOO4aSBRH2uWsIGuJjg+STgQeN8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00743F80716; Thu,  8 Feb 2024 17:56:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2B8AF80713;
	Thu,  8 Feb 2024 17:56:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E30F8F80615; Thu,  8 Feb 2024 17:56:17 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 45621F801D5
	for <alsa-devel@alsa-project.org>; Thu,  8 Feb 2024 17:56:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45621F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hdYEssJX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411365; x=1738947365;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1qIbuDxxnC7LHRl1bXGWQdtxfGnCJuRj1o/za54baOE=;
  b=hdYEssJXsNR6zn5GHnhg2DGlfS7JJS4vdckqaNPozv4WGTB3DxdbeoaF
   J0RwbtBnyY4v4xS0e1plpO4Dl7WztuDCmAXIPjLoy844qp4PzP85q09I2
   qJsAIJZVA4hra+5/rEWZezHau398Rukov0eVMM+fA5V/pGC+psbwpQ2YB
   276jFL8QYwFOlEv+XW1DXCoKfJdj6H97SrXSS0swc2i9ZTV3LIkpE5fCz
   D+eK8+NxrezI1QC2MaTbwgx8VNnnXGpfxES7AW89UqLvXVVPU1jEeRlDQ
   5Ck4MF6pKIQPZBi88bKU5FJCbWOrWR5YjUzfMMPPKCPNBL1x2L0uoTSfj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675329"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="395675329"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:55:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="1690160"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:55:57 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 05/24] ASoC: Intel: sof_rt5682: board id cleanup for mtl
 boards
Date: Thu,  8 Feb 2024 10:55:26 -0600
Message-Id: <20240208165545.93811-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
References: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PGIQU5NUTRGOKVDOEYMEOLJOTGJHXGMD
X-Message-ID-Hash: PGIQU5NUTRGOKVDOEYMEOLJOTGJHXGMD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PGIQU5NUTRGOKVDOEYMEOLJOTGJHXGMD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Many board configs are duplicated since codec and amplifier type are
removed from board quirk. Introduce "mtl_rt5682_def" board to reduce
the number of mtl board configs.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c               | 9 +--------
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c | 4 ++--
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 995372091387..fc2582045598 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -889,14 +889,7 @@ static const struct platform_device_id board_ids[] = {
 					SOF_RT5682_NUM_HDMIDEV(3)),
 	},
 	{
-		.name = "mtl_rt1019_rt5682",
-		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(2) |
-					SOF_RT5682_SSP_AMP(0) |
-					SOF_RT5682_NUM_HDMIDEV(3)),
-	},
-	{
-		.name = "mtl_rt5650",
+		.name = "mtl_rt5682_def",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
 					SOF_RT5682_SSP_CODEC(2) |
 					SOF_RT5682_SSP_AMP(0) |
diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 23eaf47b3f24..e9a5da079089 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -62,7 +62,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[] = {
 	},
 	{
 		.comp_ids = &mtl_rt5682_rt5682s_hp,
-		.drv_name = "mtl_rt1019_rt5682",
+		.drv_name = "mtl_rt5682_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &mtl_rt1019p_amp,
 		.sof_tplg_filename = "sof-mtl-rt1019-rt5682.tplg",
@@ -84,7 +84,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[] = {
 	},
 	{
 		.id = "10EC5650",
-		.drv_name = "mtl_rt5650",
+		.drv_name = "mtl_rt5682_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &mtl_rt5650_amp,
 		.sof_tplg_filename = "sof-mtl-rt5650.tplg",
-- 
2.40.1

