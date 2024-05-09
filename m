Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD04B8C1323
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 18:39:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04C3DE94;
	Thu,  9 May 2024 18:39:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04C3DE94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715272781;
	bh=2X1+p3nPIqEpE7NVJ9g7nnodLkLO3UoeD6NRAMiKBlw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E0QQLPGC0urtsKBWh3HoNOJFtGv0ZWH0v92Zs/47YsW34x8uIyL8PbsxgEA6ixvFf
	 p5/bo8JsDkz33wIJlk3HymXoNJEySp9P52PoZd9QDR5wJyzeTVl+0h5BLJTlpZxMT/
	 B8VcmQj0yaI5Ai4f4R+cbx21yPpTsjNrvWYzTphs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65826F805C4; Thu,  9 May 2024 18:36:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05506F80587;
	Thu,  9 May 2024 18:36:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A988CF80564; Thu,  9 May 2024 18:36:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF4F2F804E7
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 18:34:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF4F2F804E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KRAEHPjR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272475; x=1746808475;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2X1+p3nPIqEpE7NVJ9g7nnodLkLO3UoeD6NRAMiKBlw=;
  b=KRAEHPjRmVPXLQYJ6ZLeHjZzzWCiTJKvxIVoKPajejrKUydqS3Oo2dNM
   CXnNKOSSawgmGaZC+OH40VTApaD1WiWXEtEEx0XpE10Yy9vd6ysgrHnEW
   AXb3manHu0QqkmIHdS+Ed0OsEdo/Fux81OhWiI6e7ognrTT+IKz+zC5Vz
   1W6byzmpQWVd31prpCRxbLLsXziEfOK3qCGeXq1jqlCPoaK+OLAnhR2Ej
   bRSHaBAzLXdu6H6iajp3MNkFX4ExnVcRJeHJ688sPrEhQeDMyGrIFs0dM
   Q4sJESz1nvDbLsJo4ILF1zM4iKljdqHFgEX0e1JH9Rd4SNr6hCD0ey7Eh
   w==;
X-CSE-ConnectionGUID: 77s5YzAQRYyrbxVmKC5NuA==
X-CSE-MsgGUID: 7xdyoA6WSua4eVH3soqUvA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15017525"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="15017525"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:34:27 -0700
X-CSE-ConnectionGUID: BYIl/HQ2QoCnmYWkuJ0Qxw==
X-CSE-MsgGUID: HmB3W08MQdScw/S4/zTSKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="33760982"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.213.181.85])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:34:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 03/18] ASoC: Intel: sof_rt5682: board id cleanup for mtl
 boards
Date: Thu,  9 May 2024 11:34:03 -0500
Message-Id: <20240509163418.67746-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
References: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LZ6D7IR3ZZV3LA33UT5I5A3LKTO4B2PU
X-Message-ID-Hash: LZ6D7IR3ZZV3LA33UT5I5A3LKTO4B2PU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LZ6D7IR3ZZV3LA33UT5I5A3LKTO4B2PU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Since mtl chromebook is using DMI quirk for board config, changing the
SSP port config of mtl_rt5682_def to RVP to simplify mtl board id and
enumeration table.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c           | 20 +++-------------
 .../intel/common/soc-acpi-intel-mtl-match.c   | 24 -------------------
 2 files changed, 3 insertions(+), 41 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 5a189c165e2d..3dc373855a58 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -865,26 +865,12 @@ static const struct platform_device_id board_ids[] = {
 					/* SSP 0 and SSP 2 are used for HDMI IN */
 					SOF_SSP_MASK_HDMI_CAPTURE(0x5)),
 	},
-	{
-		.name = "mtl_mx98357_rt5682",
-		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_SSP_PORT_CODEC(0) |
-					SOF_SSP_PORT_AMP(1) |
-					SOF_SSP_PORT_BT_OFFLOAD(2) |
-					SOF_BT_OFFLOAD_PRESENT),
-	},
-	{
-		.name = "mtl_mx98360_rt5682",
-		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_SSP_PORT_CODEC(0) |
-					SOF_SSP_PORT_AMP(1)),
-	},
 	{
 		.name = "mtl_rt5682_def",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_SSP_PORT_CODEC(2) |
-					SOF_SSP_PORT_AMP(0) |
-					SOF_SSP_PORT_BT_OFFLOAD(1) |
+					SOF_SSP_PORT_CODEC(0) |
+					SOF_SSP_PORT_AMP(1) |
+					SOF_SSP_PORT_BT_OFFLOAD(2) |
 					SOF_BT_OFFLOAD_PRESENT),
 	},
 	{ }
diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 4eeec0bc92dc..0bff91317768 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -11,16 +11,6 @@
 #include <sound/soc-acpi-intel-ssp-common.h>
 #include "soc-acpi-intel-sdw-mockup-match.h"
 
-static const struct snd_soc_acpi_codecs mtl_max98357a_amp = {
-	.num_codecs = 1,
-	.codecs = {"MX98357A"}
-};
-
-static const struct snd_soc_acpi_codecs mtl_max98360a_amp = {
-	.num_codecs = 1,
-	.codecs = {"MX98360A"}
-};
-
 static const struct snd_soc_acpi_codecs mtl_rt5682_rt5682s_hp = {
 	.num_codecs = 2,
 	.codecs = {RT5682_ACPI_HID, RT5682S_ACPI_HID},
@@ -37,20 +27,6 @@ static const struct snd_soc_acpi_codecs mtl_lt6911_hdmi = {
 };
 
 struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[] = {
-	{
-		.comp_ids = &mtl_rt5682_rt5682s_hp,
-		.drv_name = "mtl_mx98357_rt5682",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &mtl_max98357a_amp,
-		.sof_tplg_filename = "sof-mtl-max98357a-rt5682.tplg",
-	},
-	{
-		.comp_ids = &mtl_rt5682_rt5682s_hp,
-		.drv_name = "mtl_mx98360_rt5682",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &mtl_max98360a_amp,
-		.sof_tplg_filename = "sof-mtl-max98360a-rt5682.tplg",
-	},
 	{
 		.comp_ids = &mtl_essx_83x6,
 		.drv_name = "mtl_es83x6_c1_h02",
-- 
2.40.1

