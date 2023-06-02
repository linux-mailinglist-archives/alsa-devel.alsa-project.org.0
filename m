Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D59C0720A49
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 22:28:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46971823;
	Fri,  2 Jun 2023 22:28:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46971823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685737736;
	bh=quZSwOoWsI1bIB7jN2UkhVsUsNQJFkwhgR6VBehmE3g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SeTCqGluliNe6cPtPvtvZMY3pVAzw68vXA3bI4Ldw2+ApV5RHpBzHCLRFTAus3fcm
	 FmvCX32qieKZoyIjFBCcAKV2uR2BRN2ba9gS7IADSOVlzTi4sLtA8ozVvAVIxIeuyb
	 G4KzvGQgvYyaf+joJi65rkIteuEJKHGrxSCAA+eg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 239D4F8063C; Fri,  2 Jun 2023 22:24:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C5DCF805AF;
	Fri,  2 Jun 2023 22:24:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87CD3F80601; Fri,  2 Jun 2023 22:23:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 777C8F8055A
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:23:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 777C8F8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IxdkeD6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685737394; x=1717273394;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=quZSwOoWsI1bIB7jN2UkhVsUsNQJFkwhgR6VBehmE3g=;
  b=IxdkeD6F/pOWsiA+s48+kwncjJ50X64iFkBf6zRTyq8QWWsdzh2l/LtW
   L5Kjl7cp0RdqtGPXV3/rBUa5HX0EG8z1xm7qBO3mmbrxDi9f7khjfThr2
   3beJjdTDd41BP+SHiVGX7BsznIiMgiblU69n09xF1En8YukFyeM6JIjBw
   lf7v595JcolnU0+z16k2KfZGEs1RdvV6vBKXqXdyfS4w6CiWQQSUTa7W6
   I+rWjNp8yQFbiuQX7bTQ5gB9vl1jedHzKlv6CJe+Gm6QpGXOaCTU9Fm40
   xdLcHlDWRzfUSkdU1NOAGIfhxin0zXZQg1iIcw25Y9Y86NE1EQ3rVoJJx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="354811287"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="354811287"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="773020034"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="773020034"
Received: from clatorre-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.190.110])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:58 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Balamurugan C <balamurugan.c@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 19/28] ASoC: Intel: ADL: Enable HDMI-In capture feature
 support for non-I2S codec boards.
Date: Fri,  2 Jun 2023 15:22:16 -0500
Message-Id: <20230602202225.249209-20-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
References: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LJR3YC4Z4XHSRTVYPJMFTKLDBPTYHTHF
X-Message-ID-Hash: LJR3YC4Z4XHSRTVYPJMFTKLDBPTYHTHF
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Balamurugan C <balamurugan.c@intel.com>

Adding HDMI-In capture support for the products doesn't have onboard
I2S codec.but need to support HDMI-In capture via I2S and audio playback
through HDMI/DP monitor.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Balamurugan C <balamurugan.c@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_ssp_amp.c              | 9 +++++++++
 sound/soc/intel/common/soc-acpi-intel-adl-match.c | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index b33f720b3e6d..56fa0c196daf 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -463,6 +463,15 @@ static const struct platform_device_id board_ids[] = {
 					SOF_SSP_BT_OFFLOAD_PRESENT |
 					SOF_CS35L41_SPEAKER_AMP_PRESENT),
 	},
+	{
+		.name = "adl_lt6911_hdmi_ssp",
+		.driver_data = (kernel_ulong_t)(SOF_NO_OF_HDMI_CAPTURE_SSP(2) |
+					SOF_HDMI_CAPTURE_1_SSP(0) |
+					SOF_HDMI_CAPTURE_2_SSP(2) |
+					SOF_SSP_HDMI_CAPTURE_PRESENT |
+					SOF_NO_OF_HDMI_PLAYBACK(3) |
+					SOF_HDMI_PLAYBACK_PRESENT),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index ac18a6c83a4e..3ecbeaecdc63 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -601,6 +601,11 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
 					SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
 	},
+	{
+		.id = "INTC10B0",
+		.drv_name = "adl_lt6911_hdmi_ssp",
+		.sof_tplg_filename = "sof-adl-nocodec-hdmi-ssp02.tplg"
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_adl_machines);
-- 
2.37.2

