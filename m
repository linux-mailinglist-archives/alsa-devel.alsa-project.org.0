Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCB588EB43
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 17:29:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50F6E2C36;
	Wed, 27 Mar 2024 17:29:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50F6E2C36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711556984;
	bh=Et/Bpq0RKd9eLmA9c0OeqzY3evz0f/slQrkvVBl7WcY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tyAN7crodbjHxkNoq8jJA2gXgu7XKt0rbporN1UGTeRYUn2l64F5BflD/fw24s3rZ
	 BEVvm1+72mg68oRtmsO7YKTaWVm+Dd0/KC86lgXS1kS47JKOn3tKKSD3xJOz+EsxJT
	 b+4AiYVt/zAmtZa03EhKSd2bE+aj21CSZuQ2q9KA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6183DF80C7A; Wed, 27 Mar 2024 17:25:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5C6FF80C71;
	Wed, 27 Mar 2024 17:25:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F3C5F806E8; Wed, 27 Mar 2024 17:25:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C460DF805E6
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 17:24:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C460DF805E6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XD0cCbey
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711556686; x=1743092686;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Et/Bpq0RKd9eLmA9c0OeqzY3evz0f/slQrkvVBl7WcY=;
  b=XD0cCbeyziGRmgKmHm80H4VevCSCftSkV2VFNsh8fYfIEcbYs8vuIVRs
   UAK/WIZ4XZJbxF7Zqc+bKEosdX/tFcIdlmSx/cvSu7cEnoj26AUMYBUw0
   QWBTU8x0LjKlqU43OxC6lYpelf1G0Wo/UlDe8RXGQTaLAfn8yLvu5YRGL
   +5/vjauln8NLX6SB9+EUwosOE6W5svgUSTW4i2+pqpGkQYvSJa3HiFi4g
   hMWWTFroNzaKRK9XuOUpqcSvPO8iSBbAB8XXuyLVw7p6+jSrjRO+47RWo
   idSU3FIHjghNbJ+ydZGoHe7e54yOUOyFNXJFj83pJJ/g/zk/mgnApWoHq
   g==;
X-CSE-ConnectionGUID: W2jOD7m5QS22kWmmw7Z15A==
X-CSE-MsgGUID: rz5g2UAJQW2qI0Bof1GbJw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17221582"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="17221582"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:24:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="53821356"
Received: from ssherman-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.117.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:24:38 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 18/18] ASoC: Intel: sof_cs42l42: add mtl_cs42l42_def for mtl
 boards
Date: Wed, 27 Mar 2024 11:24:08 -0500
Message-Id: <20240327162408.63953-19-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
References: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PO7R52HJZOBWQ6JLK2BVPDFTYSWUIEN2
X-Message-ID-Hash: PO7R52HJZOBWQ6JLK2BVPDFTYSWUIEN2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PO7R52HJZOBWQ6JLK2BVPDFTYSWUIEN2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add the board config mtl_cs42l42_def to cs42l42 machine driver for all
mtl boards using default SSP port allocation (headphone codec on SSP2,
speaker amplifiers on SSP0, and BT offload on SSP1).

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_cs42l42.c              | 7 +++++++
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index 3fc76184bdb3..f4fee2ee0d63 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -278,6 +278,13 @@ static const struct platform_device_id board_ids[] = {
 					SOF_BT_OFFLOAD_PRESENT |
 					SOF_SSP_PORT_BT_OFFLOAD(2)),
 	},
+	{
+		.name = "mtl_cs42l42_def",
+		.driver_data = (kernel_ulong_t)(SOF_SSP_PORT_CODEC(2) |
+					SOF_SSP_PORT_AMP(0) |
+					SOF_BT_OFFLOAD_PRESENT |
+					SOF_SSP_PORT_BT_OFFLOAD(1)),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 7f422848a3ba..75935b454e5d 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -69,6 +69,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[] = {
 	/* place boards for each headphone codec: sof driver will complete the
 	 * tplg name and machine driver will detect the amp type
 	 */
+	{
+		.id = CS42L42_ACPI_HID,
+		.drv_name = "mtl_cs42l42_def",
+		.sof_tplg_filename = "sof-mtl", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
+					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
+	},
 	{
 		.id = NAU8825_ACPI_HID,
 		.drv_name = "mtl_nau8825_def",
-- 
2.40.1

