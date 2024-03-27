Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FD088EB42
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 17:29:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A85752C2A;
	Wed, 27 Mar 2024 17:29:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A85752C2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711556974;
	bh=k4DX4gn64X3zpa0wG4xldGenu8XVSNu55Cuza/XVQds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b8yug+h8SlkQ+mEnnsvqsZuql647xMbtn93/tPf1QRZORhXaF19BB+AkBbnlvXl8Y
	 jC9LhrQbp4VlriTRW8zY4RaBf8Bm7//sKPnUAieQwsC9MPU1b91d/YyXXDdTK2c30w
	 sVRgC6PXdSLG0zNahr+fxzr1TdFPrECWWzAEBLY0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4084CF80C1E; Wed, 27 Mar 2024 17:25:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA42DF80C1E;
	Wed, 27 Mar 2024 17:25:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5E1AF806B6; Wed, 27 Mar 2024 17:25:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F1EDDF80578
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 17:24:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1EDDF80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KUxrkKzb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711556684; x=1743092684;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k4DX4gn64X3zpa0wG4xldGenu8XVSNu55Cuza/XVQds=;
  b=KUxrkKzbXaSsk2uYpMxkAng5M8KUVFjYjbopT/cld5iuZnRU5W3ieWiK
   6PtILYlcKwPwGyf1qBxypahYo1mCEAs3hXmWc1koAGPvUngl24J8sopCM
   iZPh42DqUmzdhzefVzJ8hsLocbhcujYG/qgciZ39T/QN5YPV/WI7R17nd
   yVuYavaswi36mP8mLmhZEhxIpkhaLp9khwne8B3TeTnYiObGPbPBm3X2t
   m1KoEpmSsjR83OEcFGJ60HZdon5t2tVdlVVOtIc6+NrBRcVnsZePFQ7cR
   Peoie+sBy4yOJ9NufLKHPTFPJlG4EoDTgpZSh/8ijQiH/TuUKjPUVVURp
   w==;
X-CSE-ConnectionGUID: o/Av03G8T0WvNFmfBzO3aA==
X-CSE-MsgGUID: cBIR0p63RyeYVWGhjskAZw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17221572"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="17221572"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:24:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="53821345"
Received: from ssherman-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.117.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:24:37 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 16/18] ASoC: Intel: sof_cs42l42: mach cleanup for adl boards
Date: Wed, 27 Mar 2024 11:24:06 -0500
Message-Id: <20240327162408.63953-17-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
References: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XZKMBHXECZH4VV5LVMASJPLNTLMAI4NX
X-Message-ID-Hash: XZKMBHXECZH4VV5LVMASJPLNTLMAI4NX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XZKMBHXECZH4VV5LVMASJPLNTLMAI4NX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add a common entry in enumeration table for all cs42l42 boards
with/without speaker amplifier. All other adl_cs42l42_def entries
become redundant so get removed.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-adl-match.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index 7977a6fb9a5c..1ea2d9c582ee 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -495,13 +495,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 		.quirk_data = &adl_lt6911_hdmi,
 		.sof_tplg_filename = "sof-adl-rt5682-ssp1-hdmi-ssp02.tplg",
 	},
-	{
-		.id = "10134242",
-		.drv_name = "adl_cs42l42_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &adl_max98360a_amp,
-		.sof_tplg_filename = "sof-adl-max98360a-cs42l42.tplg",
-	},
 	{
 		.comp_ids = &essx_83x6,
 		.drv_name = "adl_es83x6_c1_h02",
@@ -527,6 +520,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 	/* place boards for each headphone codec: sof driver will complete the
 	 * tplg name and machine driver will detect the amp type
 	 */
+	{
+		.id = CS42L42_ACPI_HID,
+		.drv_name = "adl_cs42l42_def",
+		.sof_tplg_filename = "sof-adl", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
+					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
+	},
 	{
 		.id = NAU8825_ACPI_HID,
 		.drv_name = "adl_nau8825_def",
-- 
2.40.1

