Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF8377C3D3
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 01:16:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 479BD844;
	Tue, 15 Aug 2023 01:15:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 479BD844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692054993;
	bh=ddGuAWRJXk9MY5JHlS9ykEJYf8skM80hv7pY8F+2tt8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a/rN5EZ1DltfdMJCRo1JFS/uAC9fuSML3KDKOtD2trA9AYXnfoOyrK4dd1mVRTUlQ
	 jWlXdGBXTDTGcxtGHCTwHjL4Hib3rBNv3uWCZKM+znHsvSdW4yZpM2ME2hTZGc3KUg
	 CFJHblvo7MOpVdih+aZj3mfQ8zXJB74QunIneY78=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 959FEF805A0; Tue, 15 Aug 2023 01:14:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E1FFF80579;
	Tue, 15 Aug 2023 01:14:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A7B2F8055A; Tue, 15 Aug 2023 01:14:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A748AF80016
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 01:14:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A748AF80016
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=me/oSUgZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692054858; x=1723590858;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ddGuAWRJXk9MY5JHlS9ykEJYf8skM80hv7pY8F+2tt8=;
  b=me/oSUgZxVfiMNQuImGOH/6lip//4Jzg1Se8LEU/mrQePSv98T0Z+JSh
   wgp7EyWbeRBlf6lpwvM3KFXLYa4DZzBqYWKJQF+4ZJpqdQZeOdSjdv5Al
   dcvvh6C5vIwe+uW9KYTb4KYXDvG1s4fpgaloU6a9JZh1Uad6MHiQ7nmv4
   paxwENPH9FPvZXOWPhTPmUZbkHGyyGt9SptnrTWI7sDQ+HiH27Kczerof
   1keQVQG6yB9w7Unr1nhlttA8usVFSw0pw3rxFUb99RvZDiioJUiVSJKcV
   72kpyTnfvhn1Vh3bn+Mx4DDe9b9pUVbFi2FzPiHQFItQbktC9KUGAFDLz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="403136791"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200";
   d="scan'208";a="403136791"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 16:14:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="1064250678"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200";
   d="scan'208";a="1064250678"
Received: from dishasur-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.104.139])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 16:14:10 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Balamurugan C <balamurugan.c@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 1/4] ASoC: Intel: soc-acpi: Add entry for sof_es8336 in RPL
 match table.
Date: Mon, 14 Aug 2023 18:13:55 -0500
Message-Id: <20230814231358.78971-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230814231358.78971-1-pierre-louis.bossart@linux.intel.com>
References: <20230814231358.78971-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FHDVHZKOYTRLZLO6HZJSLJH6ILURC7GR
X-Message-ID-Hash: FHDVHZKOYTRLZLO6HZJSLJH6ILURC7GR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FHDVHZKOYTRLZLO6HZJSLJH6ILURC7GR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Balamurugan C <balamurugan.c@intel.com>

Adding support for ES83x6 codec in RPL match table.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Balamurugan C <balamurugan.c@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-rpl-match.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
index 4eefdb2dd45c..1f503c734ab5 100644
--- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -331,6 +331,11 @@ static const struct snd_soc_acpi_codecs rpl_rt5682_hp = {
 	.codecs = {"10EC5682", "RTL5682"},
 };
 
+static const struct snd_soc_acpi_codecs rpl_essx_83x6 = {
+	.num_codecs = 3,
+	.codecs = { "ESSX8316", "ESSX8326", "ESSX8336"},
+};
+
 static const struct snd_soc_acpi_codecs rpl_max98357a_amp = {
 	.num_codecs = 1,
 	.codecs = {"MX98357A"}
@@ -380,6 +385,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
 		.quirk_data = &rpl_rt1019p_amp,
 		.sof_tplg_filename = "sof-rpl-rt1019-rt5682.tplg",
 	},
+	{
+		.comp_ids = &rpl_essx_83x6,
+		.drv_name = "sof-essx8336",
+		.sof_tplg_filename = "sof-rpl-es83x6", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER |
+					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
+					SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_rpl_machines);
-- 
2.39.2

