Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A718A88B3C3
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 23:16:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D5452369;
	Mon, 25 Mar 2024 23:16:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D5452369
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711404970;
	bh=u7YL/uosgWmOgTrX1I/D78/QvVIiO3Nn6fCcab50v0s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YuCMp3wXqtaCy6NZk1WKlb8THybhEFcgfZ89adp+fjY1nOLlAyd6CJI2Hd4cwARwG
	 DwV+o5NMmfFvdpptiDCcAvESbfY7dVPiS+aAIAxgPqIN26c1KLWzEamH5sS7lFdulX
	 NHZAsjR7fJQ5cpfmROaF3RZQRrDp9cBWwyAG3k2Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DB98F80C17; Mon, 25 Mar 2024 23:12:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DE72F805FA;
	Mon, 25 Mar 2024 23:12:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E3BBF8069F; Mon, 25 Mar 2024 23:11:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35EC6F8025F
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 23:11:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35EC6F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NOxRGCPr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404692; x=1742940692;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u7YL/uosgWmOgTrX1I/D78/QvVIiO3Nn6fCcab50v0s=;
  b=NOxRGCPrvpICCSfZP9mnaDy4UZKktbk8oJZBAbIOuY6+W6xDjHpnVr5+
   +vKRylf2QJ8t5O9i5ABMQRO5V3/2TRGEykK89b7c4EAjjBmHLJrfbeRyk
   MtkzoKYsYUrxBKLcQAoWdGIvOs7KFVGSNqWdzuKpKB4CLi1+D7iDypIEQ
   3ilPfsMXWKEe+nNjwH5VUkK+dnJKA1s4EMRVFUvKp+QBHBXpaL+RjN8BX
   MeA+LyLIMfxkIYphRWO/x+xO1vEox79JD3MI2IjIItQB0WThwh0nmhK3R
   F/FpRlcnz/5CGG9hS8BHaNcMsWpaSma4XYN5k2aqtAmSeM037Dl9tstza
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643671"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="6643671"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="15722163"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.212.98.109])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:24 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 16/21] ASoC: Intel: sof_da7219: board id cleanup for adl
 boards
Date: Mon, 25 Mar 2024 17:10:54 -0500
Message-Id: <20240325221059.206042-17-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: V3Y7ZPD6DLVX6KJCQZL3FCV4JYXOMHS5
X-Message-ID-Hash: V3Y7ZPD6DLVX6KJCQZL3FCV4JYXOMHS5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V3Y7ZPD6DLVX6KJCQZL3FCV4JYXOMHS5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Introduce "adl_da7219_def" board to reduce the number of jsl board
configs. This config could support all boards which implement
headphone codec on SSP0 and speaker amplifiers on SSP1.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_da7219.c               | 2 +-
 sound/soc/intel/common/soc-acpi-intel-adl-match.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index 3057798a0dca..0da7aa2e31c2 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -381,7 +381,7 @@ static const struct platform_device_id board_ids[] = {
 					SOF_SSP_PORT_AMP(1)),
 	},
 	{
-		.name = "adl_mx98360_da7219",
+		.name = "adl_da7219_def",
 		.driver_data = (kernel_ulong_t)(SOF_DA7219_MCLK_EN |
 					SOF_SSP_PORT_CODEC(0) |
 					SOF_SSP_PORT_AMP(1) |
diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index 0da79a3ba1f0..6c710e9a26f1 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -616,7 +616,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 	},
 	{
 		.id = "DLGS7219",
-		.drv_name = "adl_mx98360_da7219",
+		.drv_name = "adl_da7219_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &adl_max98360a_amp,
 		.sof_tplg_filename = "sof-adl-max98360a-da7219.tplg",
-- 
2.40.1

