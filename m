Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 768FD88B3C4
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 23:16:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E18262355;
	Mon, 25 Mar 2024 23:16:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E18262355
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711404984;
	bh=laVSfbd4eAmRKQ2DaoMAzXDhpjSciyC7dQqa8fRdp2g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cflRmYLRn7epTMNVXO5ZVRLSvoH0zoRb2M/g5ah6MWgUgo7Fz2nD/aE3toydvkYW5
	 jyByX0qSFnXVqhRNOLCFCVW5ELC9ZhVpb1pUywLd2rsPUE/AtoGX3Mybq1lvpOHsWQ
	 zAeH7ZBi4vaCeSBahI1YeYcpYNCfF6Kl7tNrRwG0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB5CAF80C7E; Mon, 25 Mar 2024 23:12:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56E36F80C74;
	Mon, 25 Mar 2024 23:12:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C32AF806BB; Mon, 25 Mar 2024 23:11:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60A88F805C0
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 23:11:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60A88F805C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mJTMr01+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404692; x=1742940692;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=laVSfbd4eAmRKQ2DaoMAzXDhpjSciyC7dQqa8fRdp2g=;
  b=mJTMr01+/ykzFWK3JNqNolim/Xw9w7WPfFm8BUXfF7eeCwwaDQLM7QMs
   j4vRA8RiBh+J8Xc81R2mucaAxltry+3oMUYTN8Yka5yy0putipsqMJldO
   FzuJiaRWRzIp/8vb/HQj+uwJ9LyAW4AWvaE+ftZd0U8bIjhsZpEenzp7c
   ajbUpvLC/aez5w/ecuS08W6fWVPIHZbWkPEGftdFRKmjbnhFCaqpDKtCf
   8IcG4G7TCBkeVxvSu9oUOrxU2t2XQw9VkpQUmzeEUTnYQF/zQw8yqe4Xy
   /eI/3PtXKkvy0S6MM4as4zikDNhX4EO8rpgSJ9RKEb9tVKwp2STTy5tbI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643677"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="6643677"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="15722168"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.212.98.109])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:25 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 17/21] ASoC: Intel: sof_da7219: board id cleanup for rpl
 boards
Date: Mon, 25 Mar 2024 17:10:55 -0500
Message-Id: <20240325221059.206042-18-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WGZDTUIOIPHFKEVWXVEGZWU7FTX2CS4Q
X-Message-ID-Hash: WGZDTUIOIPHFKEVWXVEGZWU7FTX2CS4Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WGZDTUIOIPHFKEVWXVEGZWU7FTX2CS4Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Introduce "rpl_da7219_def" board to reduce the number of rpl board
configs. This config could support all boards which implement
headphone codec on SSP0 and speaker amplifiers on SSP1.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_da7219.c               | 2 +-
 sound/soc/intel/common/soc-acpi-intel-rpl-match.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index 0da7aa2e31c2..fd3a7be993c1 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -390,7 +390,7 @@ static const struct platform_device_id board_ids[] = {
 					SOF_BT_OFFLOAD_PRESENT),
 	},
 	{
-		.name = "rpl_mx98360_da7219",
+		.name = "rpl_da7219_def",
 		.driver_data = (kernel_ulong_t)(SOF_DA7219_MCLK_EN |
 					SOF_SSP_PORT_CODEC(0) |
 					SOF_SSP_PORT_AMP(1) |
diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
index c43e537e60d2..77c917897c8d 100644
--- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -457,7 +457,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
 	},
 	{
 		.id = "DLGS7219",
-		.drv_name = "rpl_mx98360_da7219",
+		.drv_name = "rpl_da7219_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &rpl_max98360a_amp,
 		.sof_tplg_filename = "sof-rpl-max98360a-da7219.tplg",
-- 
2.40.1

