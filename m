Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC09B7FA12F
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 14:38:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 397A8DEE;
	Mon, 27 Nov 2023 14:37:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 397A8DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701092283;
	bh=ylPOM8+EoXFj0fcda/iP43PmN+shQ7mww8VqSMW2wiU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OEGl64mjapgBzmjmx4wYKHQyPa5NXso4dWUlg91vLsAiA41mbvaBBtwq2dsl5WTmg
	 iNtGZ/uCH2H7HhwrSnk5yb16xrHLCDaOTSEgvVkebvB61CiGFzQpshGZ95ADQNJuog
	 vhD3lE0fQZEt+cjgdt+dWOlGfEMvnD0m1IoMmm4c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A875F80674; Mon, 27 Nov 2023 14:36:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BF96F80649;
	Mon, 27 Nov 2023 14:36:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 856C5F805C8; Mon, 27 Nov 2023 14:36:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 674F8F8007E
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 14:36:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 674F8F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=La+7vV+K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701092162; x=1732628162;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ylPOM8+EoXFj0fcda/iP43PmN+shQ7mww8VqSMW2wiU=;
  b=La+7vV+Kk/usqoMMLBmdKBdpEgjHTAz/B3OtPGVZ6kEBoefSvVySMZIq
   3tzdrcoafhhevIGU1C2LszSNIL1vvGiu6LhUd9+AJNaMbZ+fJgptn/Cxy
   y2sBmYJvoeboTKr5xU9TVEA8NEBRn/bRg1ivr5vWDsgdsY/JwvXIaBb8V
   X/eZhLkpSR+xHVy+nY7Dz5ZpYKqQ09Bdg4wGsjqaCQyPR5VT6Hh1xAucc
   0lDY3bA9uFxdjJUrBNt1YdzFZF63KlPbXIlJAG2klJw3dqlQaiTpg056a
   uq7OGvFnj5bQXy/vIXmVCbZp6T/qVMAPzaRvIpIiOs6P9Fx8wNAgq22Dn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="391578559"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="391578559"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 05:34:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="891743770"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="891743770"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 05:34:28 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	cezary.rojewski@intel.com,
	yung-chuan.liao@linux.intel.com,
	ckeepax@opensource.cirrus.com,
	yong.zhi@intel.com,
	chao.song@linux.intel.com
Subject: [PATCH 4/7] ASoC: Intel: soc-acpi: rt713+rt1316, no sdw-dmic config
Date: Mon, 27 Nov 2023 15:34:45 +0200
Message-ID: <20231127133448.18449-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127133448.18449-1-peter.ujfalusi@linux.intel.com>
References: <20231127133448.18449-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SG7HUYGIGAPJL4LHDHVJ4FAY57AWMFC4
X-Message-ID-Hash: SG7HUYGIGAPJL4LHDHVJ4FAY57AWMFC4
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SG7HUYGIGAPJL4LHDHVJ4FAY57AWMFC4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Mac Chiang <mac.chiang@intel.com>

This is additional HW board: rt713+rt1316 without rt713-dmic configuration:

SDW0: rt713 audio jack
SDW1: rt1316 spk_amp_l
SDW2: rt1316 spk_amp_r

Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-mtl-match.c   | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index af4224bff718..2035f561ca50 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -434,6 +434,25 @@ static const struct snd_soc_acpi_link_adr mtl_rt713_l0_rt1316_l12_rt1713_l3[] =
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr mtl_rt713_l0_rt1316_l12[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt713_0_single_adr),
+		.adr_d = rt713_0_single_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1316_1_group2_adr),
+		.adr_d = rt1316_1_group2_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt1316_2_group2_adr),
+		.adr_d = rt1316_2_group2_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_adr_device mx8363_2_adr[] = {
 	{
 		.adr = 0x000230019F836300ull,
@@ -519,6 +538,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-rt713-l0-rt1316-l12-rt1713-l3.tplg",
 	},
+	{
+		.link_mask = GENMASK(2, 0),
+		.links = mtl_rt713_l0_rt1316_l12,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-rt713-l0-rt1316-l12.tplg",
+	},
 	{
 		.link_mask = BIT(3) | BIT(0),
 		.links = mtl_712_only,
-- 
2.43.0

