Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7EC720A4C
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 22:29:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 186756C1;
	Fri,  2 Jun 2023 22:28:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 186756C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685737787;
	bh=/DMUU0e4Rv7b7+G9uAYeljQyHKzZvppuHE4hjstyaiY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Tc8fLavMtpcPfA2arL/sjWpYc4CPsbwTYCh0xLZXmPUF4CL1v+pJRAjDTFcxSZ+0L
	 u7Z/G6CPqCbSJhSsbtUBXeSHGBVbcvNofLbUbT7hHAQeVisgfmvcyRcpLU4kZU4hOV
	 H7oeblwIuLq6KFXXEZ0C4mrgw72uTGpDcjrs+p5k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2F01F80659; Fri,  2 Jun 2023 22:24:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 634D6F80656;
	Fri,  2 Jun 2023 22:24:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D94D2F8060C; Fri,  2 Jun 2023 22:24:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 793A2F8055B
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:23:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 793A2F8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BRlTg3iX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685737395; x=1717273395;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/DMUU0e4Rv7b7+G9uAYeljQyHKzZvppuHE4hjstyaiY=;
  b=BRlTg3iX2whwWEugWFtzDM/5TKpjWjRguTJaTIVvOrZNuvwbDb6D1wnL
   MSNdFO8GRDmzxEFMzWxr9do20Zj5N1dbtZcHt8EItTvWuqmCDqAs8odZl
   DswqL8/aurf0indZf0b+rBURS8NZa4Zf9rXDgrvYf7b36SBomP/fDbrjf
   LJ8zR/xRaQSoTbg2tjgp2s++pB5TUggAQFeQYjDON30Q3w8mNGszqzu2I
   igOtFirR6W/nfFllBvIB9pKeMm4CUbYM3rh9H6EudrzUfUsqFpW4jUEYz
   qdYrRuXX/dLigRijJiuubRjTbEErBZ2fDyZRAJjd1Jpn9tgqEpExNJq7X
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="354811303"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="354811303"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="773020037"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="773020037"
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
Subject: [PATCH 20/28] ASoC: Intel: ADL: Moving amp only boards into end of
 the table.
Date: Fri,  2 Jun 2023 15:22:17 -0500
Message-Id: <20230602202225.249209-21-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
References: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TZ5E6Q6AKGMV6G6TWSNSHFS5Y4XUIOTN
X-Message-ID-Hash: TZ5E6Q6AKGMV6G6TWSNSHFS5Y4XUIOTN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TZ5E6Q6AKGMV6G6TWSNSHFS5Y4XUIOTN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Balamurugan C <balamurugan.c@intel.com>

Moving amp only boards into end of the match table to have
better order and maintenance.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Balamurugan C <balamurugan.c@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-adl-match.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index 3ecbeaecdc63..bcd66e0094b4 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -580,12 +580,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 		.quirk_data = &adl_max98360a_amp,
 		.sof_tplg_filename = "sof-adl-max98360a-cs42l42.tplg",
 	},
-	/* place amp-only boards in the end of table */
-	{
-		.id = "CSC3541",
-		.drv_name = "adl_cs35l41",
-		.sof_tplg_filename = "sof-adl-cs35l41.tplg",
-	},
 	{
 		.comp_ids = &essx_83x6,
 		.drv_name = "adl_es83x6_c1_h02",
@@ -601,6 +595,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
 					SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
 	},
+	/* place amp-only boards in the end of table */
+	{
+		.id = "CSC3541",
+		.drv_name = "adl_cs35l41",
+		.sof_tplg_filename = "sof-adl-cs35l41.tplg",
+	},
 	{
 		.id = "INTC10B0",
 		.drv_name = "adl_lt6911_hdmi_ssp",
-- 
2.37.2

