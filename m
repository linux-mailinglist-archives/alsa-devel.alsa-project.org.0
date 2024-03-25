Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0D088B3BE
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 23:15:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B46AD2353;
	Mon, 25 Mar 2024 23:15:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B46AD2353
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711404931;
	bh=TGe/aTbC/Ax1DpTq9vEIfquwDuAbVXTLGFXWDTJr6Qs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VFsP7juIPQFt+2Cu0bxp2PQgHrlj8Us56Vw+/G8pfhp2woPC8VNq5k2aAN9nJG22b
	 aGNpACkETbWxCg6/s63qn+bSu+v46WccbXHWG5fylC5Pv8Uam3pNzmSGHMtkqhGAgz
	 zPbhSHsIwkmOwXsGGmxoPzYLZ6ZXy+/em087oOnY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 195F0F807D0; Mon, 25 Mar 2024 23:12:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DD43F8080A;
	Mon, 25 Mar 2024 23:12:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 921A3F806AF; Mon, 25 Mar 2024 23:11:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 930F1F80563
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 23:11:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 930F1F80563
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VnNgUMPA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404691; x=1742940691;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TGe/aTbC/Ax1DpTq9vEIfquwDuAbVXTLGFXWDTJr6Qs=;
  b=VnNgUMPANpGmEGEy2gzvpPmS74oSgY/JzHFGPYk5cunSAQkFOf9iaWvS
   nWbbSNYq1Gvwy0cbgEiDwr1c0MV5sJdMq4ngJKQpLZw6bVvK+JgS8yW4B
   24hGaOZyHeRur/H/jEqYy5hVhmSu/og45mWx5lXFHn89AU45rPgfHZqKe
   o0QUw7JjOsxS1BfGpqiDh9+Dxk3x9kD9mN1ULxWacdguDhrGxqapWInQI
   W94zH7Xs1N5Dw8rwL6iUxRpk39VGqY6wpeg971NdPF6kbTAIc8IcA8HN3
   5OAb3YLwK3wLN7oHoDmjnJ7i6/sLFiA4SEXe5q2ouF2RIb40kaboXJEY7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643665"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="6643665"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="15722156"
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
Subject: [PATCH 15/21] ASoC: Intel: sof_da7219: board id cleanup for jsl
 boards
Date: Mon, 25 Mar 2024 17:10:53 -0500
Message-Id: <20240325221059.206042-16-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KKJBTZV6AL2H5VKYL5CLR3XQQDWBOIER
X-Message-ID-Hash: KKJBTZV6AL2H5VKYL5CLR3XQQDWBOIER
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KKJBTZV6AL2H5VKYL5CLR3XQQDWBOIER/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Introduce "jsl_da7219_def" board to reduce the number of jsl board
configs. This config could support all boards which implement
headphone codec on SSP0 and speaker amplifiers on SSP1.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_da7219.c               | 8 +-------
 sound/soc/intel/common/soc-acpi-intel-jsl-match.c | 4 ++--
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index 4417e2b7adfd..3057798a0dca 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -375,13 +375,7 @@ static int audio_probe(struct platform_device *pdev)
 
 static const struct platform_device_id board_ids[] = {
 	{
-		.name = "jsl_mx98373_da7219",
-		.driver_data = (kernel_ulong_t)(SOF_DA7219_JSL_BOARD |
-					SOF_SSP_PORT_CODEC(0) |
-					SOF_SSP_PORT_AMP(1)),
-	},
-	{
-		.name = "jsl_mx98360_da7219",
+		.name = "jsl_da7219_def",
 		.driver_data = (kernel_ulong_t)(SOF_DA7219_JSL_BOARD |
 					SOF_SSP_PORT_CODEC(0) |
 					SOF_SSP_PORT_AMP(1)),
diff --git a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
index a6ac2525df17..d4b397c53bcc 100644
--- a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
@@ -52,14 +52,14 @@ static const struct snd_soc_acpi_codecs rt5682_rt5682s_hp = {
 struct snd_soc_acpi_mach snd_soc_acpi_intel_jsl_machines[] = {
 	{
 		.id = "DLGS7219",
-		.drv_name = "jsl_mx98373_da7219",
+		.drv_name = "jsl_da7219_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &mx98373_spk,
 		.sof_tplg_filename = "sof-jsl-da7219.tplg",
 	},
 	{
 		.id = "DLGS7219",
-		.drv_name = "jsl_mx98360_da7219",
+		.drv_name = "jsl_da7219_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &mx98360a_spk,
 		.sof_tplg_filename = "sof-jsl-da7219-mx98360a.tplg",
-- 
2.40.1

