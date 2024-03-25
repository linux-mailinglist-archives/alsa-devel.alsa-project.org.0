Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FB088B3CD
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 23:17:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7ACF238B;
	Mon, 25 Mar 2024 23:17:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7ACF238B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711405037;
	bh=QOBjDB6AApBh+EA1ArAbtjdkuVS+wlbI9u5I4RYbrLQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jVCx+yuWHvMUJyleNU03XbFwpmE0fkIx72JuayxCViOhgGw3dL54qV6biBlctq2r/
	 r+ECBtGtP/gHYIU5+bWcGnXzGBqXq+268zyzKZDLXrnq7AUUAe0/kcA1GKgm7ulO02
	 KlLDGLD2Kv2vYje4Q4wOeBc5FZkhv567bSiTTERw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F2FDF896B4; Mon, 25 Mar 2024 23:12:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E677AF89684;
	Mon, 25 Mar 2024 23:12:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8059EF806F5; Mon, 25 Mar 2024 23:12:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E4C1F805EF
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 23:11:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E4C1F805EF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WpAc90Yk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404695; x=1742940695;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QOBjDB6AApBh+EA1ArAbtjdkuVS+wlbI9u5I4RYbrLQ=;
  b=WpAc90Yk57yz57VB+twZT85C4r6KhUTfvuil4mGCsuX4JByEblhDujj1
   vjVc1Z2ypTa+ieDJF5swASgAgiwNLnq64B2B1mO2t9hFg20b6QkdSFFs5
   nsRznYyb/jhIC5raVnmsW7HzU6sw17VJIyCcrHst5fYyu/VwgzXUoeoRZ
   g6iPHnRIC8tB9ioVMn8K69z0IjFoJepVcI6efAJF1MF/szlJYM71fggqp
   zZOHs1tp9ugAUQ7KQC8WDIHeIqBLgJrhIRDE9V2pnRt6Rtffbt60UbjxE
   2w7aAw9hdEo/fTP/81Axi8xchXHedzGbRrll9mHfAkvlDptn89Fq9GVzE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643698"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="6643698"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="15722186"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.212.98.109])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:27 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 21/21] ASoC: Intel: sof_rt5682: board id cleanup for cml
 boards
Date: Mon, 25 Mar 2024 17:10:59 -0500
Message-Id: <20240325221059.206042-22-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KBHCGBGGVLFWRDKPRPK5XPS6ZE3SYLYE
X-Message-ID-Hash: KBHCGBGGVLFWRDKPRPK5XPS6ZE3SYLYE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KBHCGBGGVLFWRDKPRPK5XPS6ZE3SYLYE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Introduce "cml_rt5682_def" for cml boards which implement headphone
codec on SSP0 and speaker amplifiers on SSP1.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c               | 2 +-
 sound/soc/intel/common/soc-acpi-intel-cml-match.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index f80fdbd8fdac..aadd341a202c 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -722,7 +722,7 @@ static const struct platform_device_id board_ids[] = {
 		.name = "sof_rt5682",
 	},
 	{
-		.name = "cml_rt1015_rt5682",
+		.name = "cml_rt5682_def",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
 					SOF_SSP_PORT_CODEC(0) |
 					SOF_SSP_PORT_AMP(1)),
diff --git a/sound/soc/intel/common/soc-acpi-intel-cml-match.c b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
index 5eab17820532..d47a548959ea 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
@@ -49,21 +49,21 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cml_machines[] = {
 	},
 	{
 		.id = "10EC5682",
-		.drv_name = "cml_rt1015_rt5682",
+		.drv_name = "cml_rt5682_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &rt1015_spk_codecs,
 		.sof_tplg_filename = "sof-cml-rt1011-rt5682.tplg",
 	},
 	{
 		.id = "10EC5682",
-		.drv_name = "sof_rt5682",
+		.drv_name = "cml_rt5682_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &max98357a_spk_codecs,
 		.sof_tplg_filename = "sof-cml-rt5682-max98357a.tplg",
 	},
 	{
 		.id = "10EC5682",
-		.drv_name = "sof_rt5682",
+		.drv_name = "cml_rt5682_def",
 		.sof_tplg_filename = "sof-cml-rt5682.tplg",
 	},
 	{
-- 
2.40.1

