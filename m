Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC608A21BA
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Apr 2024 00:30:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88E892BE5;
	Fri, 12 Apr 2024 00:30:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88E892BE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712874650;
	bh=4ICqNi7vqhb2xGHusmpS/YlxcDHMkVyEnauN1AgKMlI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=glSSX8RQDpRLIpjIjJJh1Kdqc12+nrjnPIIlSsN9vJuQOiKitRULh9tpF5tC+ihGi
	 YNh6jY+PGhp6nH9JBg0Fu4+ICu7l8AM7mnJix3iolA+0SD4Et/WmRgRqruieunlwdS
	 l6Wn7rdk3DNGiI7v/Q/hHpliTHpunSGtftNZDBQw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5272EF805C6; Fri, 12 Apr 2024 00:30:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ABFC9F805C9;
	Fri, 12 Apr 2024 00:29:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37999F80236; Fri, 12 Apr 2024 00:16:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6BA12F80238
	for <alsa-devel@alsa-project.org>; Fri, 12 Apr 2024 00:04:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BA12F80238
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HrFyzisY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712873066; x=1744409066;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4ICqNi7vqhb2xGHusmpS/YlxcDHMkVyEnauN1AgKMlI=;
  b=HrFyzisY3PRgPU76B5Qfo+yGWKghYe+AFlowFA5hMDA/KSirniD5eScx
   BZDfpvPzna5NmJbKHks3WH4WZic/1fsPXoZalpE8dbD3PXrghl0rSEw4K
   fKsHw8khARLSAQ8hUxykJfJwFUDFKY0VmhLrlVqIPQ35xmEPr4uFR+EXY
   Vy9o9gIwvSx1ZxGWUum9CgQ9Bpm0eMtLOTrmmWcOC/KLw/Y4Jo1LYGYEX
   rSURe4iLtBhwvfqMR1BGsgVHKsol5KMtdxlnbnEqpW/Mv8idMPmqbZ5Rx
   8SlJjbOGGrxp0Rq6jZScmusTZzW0oO8zecdT60mo70IF2EPpgvO2ySZVB
   Q==;
X-CSE-ConnectionGUID: sJ84GnYKS8CwkXycH48zEg==
X-CSE-MsgGUID: 3yAYpsoUQPWUIDSgpRAndQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19708360"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000";
   d="scan'208";a="19708360"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 15:04:16 -0700
X-CSE-ConnectionGUID: YC/usQsZQ3aFUwko6ZlbQg==
X-CSE-MsgGUID: jsEjuBeCSaWcZHSqjiDOnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000";
   d="scan'208";a="21628746"
Received: from aramana1-mobl.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.213.177.233])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 15:04:16 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 06/12] ASoC: Intel: sof_da7219: mach cleanup for adl boards
Date: Thu, 11 Apr 2024 17:03:41 -0500
Message-Id: <20240411220347.131267-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
References: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FQOXEQUDQDM6Q7SL6GH4TZXMRYHWZG2N
X-Message-ID-Hash: FQOXEQUDQDM6Q7SL6GH4TZXMRYHWZG2N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FQOXEQUDQDM6Q7SL6GH4TZXMRYHWZG2N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add a common entry in enumeration table for all da7219 boards
with/without speaker amplifier. All other adl_da7219_def entries
become redundant so get removed.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-adl-match.c   | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index 1ea2d9c582ee..4167b2e9bc6a 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -453,11 +453,6 @@ static const struct snd_soc_acpi_codecs adl_max98357a_amp = {
 	.codecs = {"MX98357A"}
 };
 
-static const struct snd_soc_acpi_codecs adl_max98360a_amp = {
-	.num_codecs = 1,
-	.codecs = {"MX98360A"}
-};
-
 static const struct snd_soc_acpi_codecs adl_rt5682_rt5682s_hp = {
 	.num_codecs = 2,
 	.codecs = {RT5682_ACPI_HID, RT5682S_ACPI_HID},
@@ -510,13 +505,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
 					SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
 	},
-	{
-		.id = "DLGS7219",
-		.drv_name = "adl_da7219_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &adl_max98360a_amp,
-		.sof_tplg_filename = "sof-adl-max98360a-da7219.tplg",
-	},
 	/* place boards for each headphone codec: sof driver will complete the
 	 * tplg name and machine driver will detect the amp type
 	 */
@@ -527,6 +515,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
 					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
 	},
+	{
+		.id = DA7219_ACPI_HID,
+		.drv_name = "adl_da7219_def",
+		.sof_tplg_filename = "sof-adl", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
+					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
+	},
 	{
 		.id = NAU8825_ACPI_HID,
 		.drv_name = "adl_nau8825_def",
-- 
2.40.1

