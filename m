Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B934D88EB49
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 17:30:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 583EC2C55;
	Wed, 27 Mar 2024 17:29:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 583EC2C55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711557005;
	bh=cOyf6fdZwa3ljk1RfWn3pKTRNtto1U1plCa6n3+94CY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p0hEZVLhxg3gvq1HuMH+Jwt5UK4+Fmee1xTtWXi0u0PGPuudr56VX0x9l50/IjPxy
	 7evtdiTd0IWVs4RqaoOAdGYjVwCbF6Hrd3n2EGrT/F3T0uWPhy6doax99R7BMOZNMl
	 kiCjcz08388oyEK89H+aSXcL5cHFMb0taGGTccTU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F419EF80C98; Wed, 27 Mar 2024 17:25:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13128F80CB9;
	Wed, 27 Mar 2024 17:25:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8114F80720; Wed, 27 Mar 2024 17:25:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 435DDF805C0
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 17:24:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 435DDF805C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bzfNfA3a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711556684; x=1743092684;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cOyf6fdZwa3ljk1RfWn3pKTRNtto1U1plCa6n3+94CY=;
  b=bzfNfA3a7njFqJnnzBe1OezbCZqgDscZyWDc7SHmyTK4O6rfSGDcJAba
   kQdnrM1gAT8MeNzJt+kQjymt59RzM8hd6RtNuhYvxJXw3MIo3UAC6wzzc
   lN+Xhk2iF4uJFbQ6fAaP8IwHfybQG0WdYCcSw8k1t9MjZqh8k8S+8tqXO
   XTu3pWNz3WMmUNhnkwOL13zhrykgEEcGBwOp7iPP2ymiexjG2WiLAkoJE
   rIjVWda/U3mXpdWnGVvt2e6VfAJtwtZdiuzhZgZ/nPa20DFP/MYeVLnLi
   2c3Z4n/Hh75pENs3RjX4h/7VqQ8B39JLq0Rb5QjVm2T38bhf8MRuPdmFW
   w==;
X-CSE-ConnectionGUID: 3D5ndmFvTAWKHSOTMZMa7g==
X-CSE-MsgGUID: s/JohFZ4SCyJI/fJSTBg6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17221577"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="17221577"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:24:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="53821350"
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
Subject: [PATCH 17/18] ASoC: Intel: sof_cs42l42: add rpl_cs42l42_def for rpl
 boards
Date: Wed, 27 Mar 2024 11:24:07 -0500
Message-Id: <20240327162408.63953-18-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
References: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DQPKJLLWQRAK6C47K47W2O6SGDAKIWSA
X-Message-ID-Hash: DQPKJLLWQRAK6C47K47W2O6SGDAKIWSA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DQPKJLLWQRAK6C47K47W2O6SGDAKIWSA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add the board config rpl_cs42l42_def to cs42l42 machine driver for all
rpl boards using default SSP port allocation (headphone codec on SSP0,
speaker amplifiers on SSP1, and BT offload on SSP2).

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_cs42l42.c              | 8 ++++++++
 sound/soc/intel/common/soc-acpi-intel-rpl-match.c | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index 8a2833a0e3c5..3fc76184bdb3 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -270,6 +270,14 @@ static const struct platform_device_id board_ids[] = {
 					SOF_BT_OFFLOAD_PRESENT |
 					SOF_SSP_PORT_BT_OFFLOAD(2)),
 	},
+	{
+		.name = "rpl_cs42l42_def",
+		.driver_data = (kernel_ulong_t)(SOF_SSP_PORT_CODEC(0) |
+					SOF_SSP_PORT_AMP(1) |
+					SOF_NUM_IDISP_HDMI(4) |
+					SOF_BT_OFFLOAD_PRESENT |
+					SOF_SSP_PORT_BT_OFFLOAD(2)),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
index e28a21667780..34588db6138a 100644
--- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -404,6 +404,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
 	/* place boards for each headphone codec: sof driver will complete the
 	 * tplg name and machine driver will detect the amp type
 	 */
+	{
+		.id = CS42L42_ACPI_HID,
+		.drv_name = "rpl_cs42l42_def",
+		.sof_tplg_filename = "sof-rpl", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
+					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
+	},
 	{
 		.id = NAU8825_ACPI_HID,
 		.drv_name = "rpl_nau8825_def",
-- 
2.40.1

