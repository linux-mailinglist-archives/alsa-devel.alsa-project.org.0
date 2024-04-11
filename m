Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A13788A21BD
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Apr 2024 00:32:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D785C2BAA;
	Fri, 12 Apr 2024 00:32:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D785C2BAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712874732;
	bh=FWG2AfFnImMcpOfUcKhPWUGMJBhZtewcs9s04fO8Wig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZFqLx3uvVW1y7SmBbnWieC7dyYGgL4ZSrtvO3JGHoyUnA7xEXMkvA8VqYiuHewmPF
	 MIbrytCtU0FzDCQfoCm5lYiEC0QzOqKRAcdAPGntjiRs9DmfMSD6pEnkLmS/M7Zwkz
	 Ti1YjDgQhxqx/k2D33CFdIRZnynVVxKVku6yWTwo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DBBAF805AD; Fri, 12 Apr 2024 00:31:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A8B7F8055C;
	Fri, 12 Apr 2024 00:31:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE6BDF80130; Fri, 12 Apr 2024 00:16:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0638AF80568
	for <alsa-devel@alsa-project.org>; Fri, 12 Apr 2024 00:04:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0638AF80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XKHqE3/d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712873067; x=1744409067;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FWG2AfFnImMcpOfUcKhPWUGMJBhZtewcs9s04fO8Wig=;
  b=XKHqE3/dbosJikazAaHvK708Iuuwl9XAE1PQvZxh5gVEmKljz06z+OYd
   Bv5b+ZoAHeQkazrjKrn2iVj+Cby8zjcHVPAy1ZEmovbNHJk48WjcY+fh5
   g9af2ZaOdkHXC9exqpC0kdSSFYpR+Eqn1CN9ajyznF5lRWTcmy9Zd08ws
   CQW2TX3v3brXU/a9CFKQN9DkF9dKmOZsgBZcqx0Ik8c81/QT3u39Cr2m8
   tkp3/4B6MqZy2DYpOzAKSPFYOp9APVYmwNyl8/4FOFOCeWIZNZtDB4gDl
   +HiDEP9aMpO2avldgQT0AaP2ykF3uoK3SZjVJHRfOfCbcAM5CmgmBePVH
   w==;
X-CSE-ConnectionGUID: gl85yTLPQmuwzy34IVx3Yg==
X-CSE-MsgGUID: UvyWNgjcRUGvBsYm3Mukww==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19708370"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000";
   d="scan'208";a="19708370"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 15:04:18 -0700
X-CSE-ConnectionGUID: tlA6iIWlTwGccwSKxTLg/A==
X-CSE-MsgGUID: NEk9o1LdRoeO0Hlkd+ahLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000";
   d="scan'208";a="21628755"
Received: from aramana1-mobl.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.213.177.233])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 15:04:17 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 08/12] ASoC: Intel: sof_da7219: add mtl_da7219_def for mtl
 boards
Date: Thu, 11 Apr 2024 17:03:43 -0500
Message-Id: <20240411220347.131267-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
References: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YUW6N52W2GIGKFOIVBFMKT3MSLOK57X3
X-Message-ID-Hash: YUW6N52W2GIGKFOIVBFMKT3MSLOK57X3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YUW6N52W2GIGKFOIVBFMKT3MSLOK57X3/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add the board config mtl_da7219_def to da7219 machine driver for all
mtl boards using default SSP port allocation (headphone codec on SSP2,
speaker amplifiers on SSP0, and BT offload on SSP1).

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_da7219.c               | 8 ++++++++
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index fd3a7be993c1..cbbce07ec5f7 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -398,6 +398,14 @@ static const struct platform_device_id board_ids[] = {
 					SOF_SSP_PORT_BT_OFFLOAD(2) |
 					SOF_BT_OFFLOAD_PRESENT),
 	},
+	{
+		.name = "mtl_da7219_def",
+		.driver_data = (kernel_ulong_t)(SOF_DA7219_MCLK_EN |
+					SOF_SSP_PORT_CODEC(2) |
+					SOF_SSP_PORT_AMP(0) |
+					SOF_SSP_PORT_BT_OFFLOAD(1) |
+					SOF_BT_OFFLOAD_PRESENT),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 264f5c19af56..f95490a16b55 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -76,6 +76,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[] = {
 		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
 					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
 	},
+	{
+		.id = DA7219_ACPI_HID,
+		.drv_name = "mtl_da7219_def",
+		.sof_tplg_filename = "sof-mtl", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
+					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
+	},
 	{
 		.id = NAU8825_ACPI_HID,
 		.drv_name = "mtl_nau8825_def",
-- 
2.40.1

