Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 655F877C3D4
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 01:16:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDC053E8;
	Tue, 15 Aug 2023 01:15:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDC053E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692055003;
	bh=o0MD66FIueVfJYSi89+IcUmxY82T0ZcVdXo/TTqu1GQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uVSDaoxKSzOKIozNlw3/zuSM2cBFM+Zvjw2QnW5m0NFVDIck2twWRe/3b6l6u3hjx
	 lC1UyeNvRj7+J6cUvmKR3l2jzG7Sb9OowNB9AnlMYDtLQudXrPYBOoC+Atk0jy+pOp
	 erJM8gwACUnt7/3K8LZoygiijPa1FOrkNg6TTq6s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78A97F805AE; Tue, 15 Aug 2023 01:14:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C321FF805A9;
	Tue, 15 Aug 2023 01:14:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC95DF8056F; Tue, 15 Aug 2023 01:14:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BEDECF800EE
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 01:14:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEDECF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kWi3/239
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692054862; x=1723590862;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o0MD66FIueVfJYSi89+IcUmxY82T0ZcVdXo/TTqu1GQ=;
  b=kWi3/239/G7EQtiQX+jOc9hBpLuQyz6XTfpqvoCe8v0UcG4wdAIIuB+j
   tb84nPqiU/HqXyKCU/bsfLOvJd06aGNXUoJ/kjD7QwHsg9QmdzbnSOxXk
   X0LBPwxxTvczMYgofrcEOFAbe2cdxwiCcQKaj3llBz0E8ywOLv/la/wRN
   qD5yucU9nMabm9BozJaqI86CNZKqZ2wEcHJSV0TjwRfQqRk0myp3vpot+
   M4VPZLJger5NRkDM500kl+bWiVdNXHqwTmAFlbVDnpICq2Lrn5ouxnfmx
   jc/JOU6TlqIgflQclFhvG/yGGd4euqP8VRmPvAnpYZmVfuviPGgO0xerr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="403136805"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200";
   d="scan'208";a="403136805"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 16:14:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="1064250691"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200";
   d="scan'208";a="1064250691"
Received: from dishasur-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.104.139])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 16:14:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Balamurugan C <balamurugan.c@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 4/4] ASoC: Intel: RPL: Add entry for HDMI-In capture support
 on non-I2S codec boards.
Date: Mon, 14 Aug 2023 18:13:58 -0500
Message-Id: <20230814231358.78971-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230814231358.78971-1-pierre-louis.bossart@linux.intel.com>
References: <20230814231358.78971-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2LHVLR457CWQK4P4IKQVOO2KVMUCXRC6
X-Message-ID-Hash: 2LHVLR457CWQK4P4IKQVOO2KVMUCXRC6
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2LHVLR457CWQK4P4IKQVOO2KVMUCXRC6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Balamurugan C <balamurugan.c@intel.com>

Adding HDMI-In capture support for the RPL products doesn't have onboard
I2S codec.but need to support HDMI-In capture via I2S and audio playback
through HDMI/DP monitor.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Balamurugan C <balamurugan.c@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_ssp_amp.c              | 9 +++++++++
 sound/soc/intel/common/soc-acpi-intel-rpl-match.c | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index 0aef718e82b2..5aa16fd3939b 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -472,6 +472,15 @@ static const struct platform_device_id board_ids[] = {
 					SOF_NO_OF_HDMI_PLAYBACK(3) |
 					SOF_HDMI_PLAYBACK_PRESENT),
 	},
+	{
+		.name = "rpl_lt6911_hdmi_ssp",
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
diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
index 3db0dc4ca66f..91b0648799b2 100644
--- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -405,6 +405,11 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
 					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
 					SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
 	},
+	{
+		.id = "INTC10B0",
+		.drv_name = "rpl_lt6911_hdmi_ssp",
+		.sof_tplg_filename = "sof-rpl-nocodec-hdmi-ssp02.tplg"
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_rpl_machines);
-- 
2.39.2

