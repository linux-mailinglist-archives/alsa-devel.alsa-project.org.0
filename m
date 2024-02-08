Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B2C84E5A8
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Feb 2024 17:57:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A073B826;
	Thu,  8 Feb 2024 17:57:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A073B826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707411441;
	bh=2GOhPgPfZXs0eLtD8qC1pk8cpbLmORrtDi6ZC4N/T8w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X/sWVbbS+ebH77lDpDmonu94njTo/t8a///UXWpwL2YdzsB/rr5u9qDC4LzZ9qH/C
	 fVx7yOfQ55UN9kSRFeuhY1RS7k1kR47kQC9ImDVppYshuPTqeNFxYq8vVhUELCIKPy
	 7X5V+rFNTHgJsTH0nGl7fLFaM0DkawuMc8ClZZEI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84276F805FD; Thu,  8 Feb 2024 17:56:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D3FAF805E9;
	Thu,  8 Feb 2024 17:56:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05FAFF8056F; Thu,  8 Feb 2024 17:56:06 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id DF641F80548
	for <alsa-devel@alsa-project.org>; Thu,  8 Feb 2024 17:56:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF641F80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=X+ibBk55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411365; x=1738947365;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2GOhPgPfZXs0eLtD8qC1pk8cpbLmORrtDi6ZC4N/T8w=;
  b=X+ibBk55FcM6E7c6b1gM0et+BavUMuWyCtn7TSZ8GV4jMG7vxTrEpaeb
   u+ywmxg9sCj4R9XlaSHfm1aqO6fy27pUM5oseSXGkRnGMLgHqZkEMnBNG
   AKOf4Oc2yAG6shmw4vWqx7/7tk6rdcYrpd7biUrxLAGNyeAQ1YWoBgcjw
   ddiad8NLwbm63Li0iitw8ZsWnWOJWkK8rBjtqkjoGGcJUitgxmDXbLxkT
   mAzxuPnCIQ+kWIwrI5RqQHJ37tEgrfZr27C2+d+Eqhah5FSyBO93lrhgM
   2pB4lSrVUTYCv4wgJs4KzxifliV8ail+RlgYcRhpzondjt22xqoCbNg6Y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675321"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="395675321"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:55:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="1690156"
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
Subject: [PATCH 04/24] ASoC: Intel: sof_rt5682: board id cleanup for rpl
 boards
Date: Thu,  8 Feb 2024 10:55:25 -0600
Message-Id: <20240208165545.93811-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
References: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BGGNSEOCACHTLVGQICUCGBUG2JO6BQ7L
X-Message-ID-Hash: BGGNSEOCACHTLVGQICUCGBUG2JO6BQ7L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BGGNSEOCACHTLVGQICUCGBUG2JO6BQ7L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Many board configs are duplicated since codec and amplifier type are
removed from board quirk. Introduce "rpl_rt5682_def" board to reduce
the number of rpl board configs.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c               | 11 +----------
 sound/soc/intel/common/soc-acpi-intel-rpl-match.c |  4 ++--
 2 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index e556bbd660c5..995372091387 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -856,16 +856,7 @@ static const struct platform_device_id board_ids[] = {
 					SOF_RT5682_NUM_HDMIDEV(4)),
 	},
 	{
-		.name = "rpl_mx98360_rt5682",
-		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-					SOF_RT5682_SSP_CODEC(0) |
-					SOF_RT5682_SSP_AMP(1) |
-					SOF_RT5682_NUM_HDMIDEV(4) |
-					SOF_BT_OFFLOAD_SSP(2) |
-					SOF_SSP_BT_OFFLOAD_PRESENT),
-	},
-	{
-		.name = "rpl_rt1019_rt5682",
+		.name = "rpl_rt5682_def",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
 					SOF_RT5682_SSP_CODEC(0) |
 					SOF_RT5682_SSP_AMP(1) |
diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
index c0a643f4725a..00a21af210fa 100644
--- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -395,7 +395,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
 	},
 	{
 		.comp_ids = &rpl_rt5682_hp,
-		.drv_name = "rpl_mx98360_rt5682",
+		.drv_name = "rpl_rt5682_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &rpl_max98360a_amp,
 		.sof_tplg_filename = "sof-rpl-max98360a-rt5682.tplg",
@@ -423,7 +423,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
 	},
 	{
 		.comp_ids = &rpl_rt5682_hp,
-		.drv_name = "rpl_rt1019_rt5682",
+		.drv_name = "rpl_rt5682_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &rpl_rt1019p_amp,
 		.sof_tplg_filename = "sof-rpl-rt1019-rt5682.tplg",
-- 
2.40.1

