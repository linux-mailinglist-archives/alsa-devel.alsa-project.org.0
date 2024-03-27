Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9170188EB30
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 17:27:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA01A2BFD;
	Wed, 27 Mar 2024 17:27:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA01A2BFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711556874;
	bh=pTeryrvseJcCWI/DDqcKtsUMeDVdgeOAEB5bQ3J6A6U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=czZZhWUpt+UB35OhtbcoNC0/1n7yImj8PEk8WApfG9Irqsn434DGd+/mrrzTpD0tC
	 8M7CqK7MITRqpYcVdoXFcUVzlnhAXWPynV8Pe1O4qZWPh+zy5Gcbns61ajvjg9C7+a
	 v+HXY0Oi+pC5l0rkGJI37NE+EFKUVvrwlk/pNK28=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D38F9F8072A; Wed, 27 Mar 2024 17:25:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58147F80707;
	Wed, 27 Mar 2024 17:25:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FCD0F80689; Wed, 27 Mar 2024 17:25:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 22A5FF80571
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 17:24:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22A5FF80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZFdfIfGR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711556680; x=1743092680;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pTeryrvseJcCWI/DDqcKtsUMeDVdgeOAEB5bQ3J6A6U=;
  b=ZFdfIfGRUSLvzqyX0POys5YTzva6MVmU76mB/u1jLg6edfOOOGUzdS4n
   RlBTFDV2+3EJ5lHZP29f1pPfx2x6wB+DpWsXUj8rdVgtyWu14BCdoyftU
   C+47gQ8Nh3yMLRXAz/nAK5AmbzoBVdid5Q3Z7BPDW4pzefmfsy+xivdgo
   EJAqfFLEXYqXAJ0fsIeKLfs7nlpQ+KJ5IowFshzMR3lokT0hB5HAtfGOV
   41j18wA5T08mRgQpY1lsrVh5XHLVWBFYAFafYqCZxx3EQpu3JXZbu4v/U
   7+JZ821NTH/Z+nvQkNk4wQjJLDcR0YiWAnq1Bo5APMotBNHLhAXkvEnX7
   g==;
X-CSE-ConnectionGUID: meE8m8yfTkG44ZBjiuIbNg==
X-CSE-MsgGUID: Vn/zHhsCROK/+bivBYEwJw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17221535"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="17221535"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:24:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="53821304"
Received: from ssherman-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.117.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:24:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 10/18] ASoC: Intel: sof_nau8825: add mtl_nau8825_def for mtl
 boards
Date: Wed, 27 Mar 2024 11:24:00 -0500
Message-Id: <20240327162408.63953-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
References: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HOVHTYJBY3QUNLQB5E2DSS3EDO3G2TMT
X-Message-ID-Hash: HOVHTYJBY3QUNLQB5E2DSS3EDO3G2TMT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HOVHTYJBY3QUNLQB5E2DSS3EDO3G2TMT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add the board config mtl_nau8825_def to nau8825 machine driver for all
mtl boards using default SSP port allocation (headphone codec on SSP2,
speaker amplifiers on SSP0, and BT offload on SSP1).

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_nau8825.c              |  7 +++++++
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c | 11 +++++++++++
 2 files changed, 18 insertions(+)

diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index 23fe8b4015cc..fe5f9e8dd652 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -319,6 +319,13 @@ static const struct platform_device_id board_ids[] = {
 					SOF_SSP_PORT_BT_OFFLOAD(2) |
 					SOF_BT_OFFLOAD_PRESENT),
 	},
+	{
+		.name = "mtl_nau8825_def",
+		.driver_data = (kernel_ulong_t)(SOF_SSP_PORT_CODEC(2) |
+					SOF_SSP_PORT_AMP(0) |
+					SOF_SSP_PORT_BT_OFFLOAD(1) |
+					SOF_BT_OFFLOAD_PRESENT),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 27d1313e6686..0125e81af9e1 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -8,6 +8,7 @@
 
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
+#include <sound/soc-acpi-intel-ssp-common.h>
 #include "soc-acpi-intel-sdw-mockup-match.h"
 
 static const struct snd_soc_acpi_codecs mtl_max98357a_amp = {
@@ -89,6 +90,16 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[] = {
 		.quirk_data = &mtl_rt5650_amp,
 		.sof_tplg_filename = "sof-mtl-rt5650.tplg",
 	},
+	/* place boards for each headphone codec: sof driver will complete the
+	 * tplg name and machine driver will detect the amp type
+	 */
+	{
+		.id = NAU8825_ACPI_HID,
+		.drv_name = "mtl_nau8825_def",
+		.sof_tplg_filename = "sof-mtl", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
+					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
+	},
 	/* place amp-only boards in the end of table */
 	{
 		.id = "INTC10B0",
-- 
2.40.1

