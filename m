Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 535E776A34C
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 23:49:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C2FAE88;
	Mon, 31 Jul 2023 23:48:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C2FAE88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690840180;
	bh=TWPeDSFtjxZ+wUab1fzlSuHbCYApsuTvzh3mUc+DhQE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Aq6Y6lsaTV+7lcYCe4dt2uQR7fxJOaZS/tTmvhCY34QHdU+OprFDHMc6SIG1bigoP
	 0XnhuSipPa5LSaZ9BHNke4gj4zIAe/QTeHOP0QcKb5KPK+vcHgLWLlOlt9WZbResiB
	 N3vJttX4sVwhyTAc+8c73WcZ65XHdFs/nX0U9Mvo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71166F8065E; Mon, 31 Jul 2023 23:44:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D36F7F8063E;
	Mon, 31 Jul 2023 23:44:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 635AAF805B5; Mon, 31 Jul 2023 23:43:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,RDNS_NONE,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29195F805AA
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 23:43:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29195F805AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=k6EXT8Ns
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690839806; x=1722375806;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TWPeDSFtjxZ+wUab1fzlSuHbCYApsuTvzh3mUc+DhQE=;
  b=k6EXT8NsH/zkiWf8cQhv0UThKfb/2ypEw97Qj4B+p4VZr4hNVvbc6sUR
   Isu1YSAnsrqFrtBO4XTXQXY8uu8LPvXF5tJH+78WTSw3DXLODxp25zLVS
   GuzQNQJUGNC/TovUIewtFw3Vk6Vm/ukwDLkdidpPQs8yR3ozh3pdUepmT
   /5apE0wlS+H21OVMloovZnvCtQFd+/B2G/jkLXLF+q/iTvm3rBnFl5b/i
   6hEWUPYzdjtj2fe0YRwDmuq0NjBRVcjXpwGL2hAc1skTkPbGM08k2gqtp
   nTdSpCSK9yCYitQMG62kfekM0jtKYeRaLMguTX0a4nC1tT2rXt6lkmGoO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="435449815"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="435449815"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:43:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="763523570"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="763523570"
Received: from youngnic-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.180.66])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:43:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 21/23] ASoC: intel: sof_sdw: Clean up DAI link counting
Date: Mon, 31 Jul 2023 16:42:55 -0500
Message-Id: <20230731214257.444605-22-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
References: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HU2QS6TUBPTH6NZDB3HHIKMNZZP7D73H
X-Message-ID-Hash: HU2QS6TUBPTH6NZDB3HHIKMNZZP7D73H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HU2QS6TUBPTH6NZDB3HHIKMNZZP7D73H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

The counting of each of the types of DAI link is a bit messy with things
added onto an intermediate variable as it goes along. Re-order things a
little to keep the order consistent with the rest of the function and
simplify the process down to a variable for each type of DAI and then
sum them at the end.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 67 +++++++++++++++-----------------
 1 file changed, 32 insertions(+), 35 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 5dbfcd88ab3c..dc6ea21b3341 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1584,12 +1584,12 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 {
 	struct device *dev = card->dev;
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(card->dev);
-	int ssp_num, sdw_be_num = 0, hdmi_num = 0, dmic_num;
+	int sdw_be_num = 0, ssp_num = 0, dmic_num = 0, hdmi_num = 0, bt_num = 0;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai_link_component *idisp_components;
 	struct snd_soc_dai_link_component *ssp_components;
-	struct snd_soc_acpi_mach_params *mach_params;
-	const struct snd_soc_acpi_link_adr *adr_link;
+	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
+	const struct snd_soc_acpi_link_adr *adr_link = mach_params->links;
 	struct snd_soc_dai_link_component *cpus;
 	struct snd_soc_codec_conf *codec_conf;
 	bool append_dai_type = false;
@@ -1606,16 +1606,31 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	int i, j, be_id = 0;
 	int codec_index;
 	int cpu_id = 0;
-	int comp_num;
 	int ret;
 
-	mach_params = &mach->mach_params;
-
 	/* allocate codec conf, will be populated when dailinks are created */
 	ret = sof_card_codec_conf_alloc(dev, mach_params, &codec_conf, &codec_conf_count);
 	if (ret < 0)
 		return ret;
 
+	ret = get_sdw_dailink_info(dev, adr_link, &sdw_be_num, &sdw_cpu_dai_num);
+	if (ret < 0) {
+		dev_err(dev, "failed to get sdw link info %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * on generic tgl platform, I2S or sdw mode is supported
+	 * based on board rework. A ACPI device is registered in
+	 * system only when I2S mode is supported, not sdw mode.
+	 * Here check ACPI ID to confirm I2S is supported.
+	 */
+	ssp_codec_index = find_codec_info_acpi(mach->id);
+	if (ssp_codec_index >= 0) {
+		ssp_mask = SOF_SSP_GET_PORT(sof_sdw_quirk);
+		ssp_num = hweight_long(ssp_mask);
+	}
+
 	if (mach_params->codec_mask & IDISP_CODEC_MASK) {
 		ctx->idisp_codec = true;
 
@@ -1625,44 +1640,26 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 			hdmi_num = SOF_PRE_TGL_HDMI_COUNT;
 	}
 
-	ssp_mask = SOF_SSP_GET_PORT(sof_sdw_quirk);
-	/*
-	 * on generic tgl platform, I2S or sdw mode is supported
-	 * based on board rework. A ACPI device is registered in
-	 * system only when I2S mode is supported, not sdw mode.
-	 * Here check ACPI ID to confirm I2S is supported.
-	 */
-	ssp_codec_index = find_codec_info_acpi(mach->id);
-	ssp_num = ssp_codec_index >= 0 ? hweight_long(ssp_mask) : 0;
-	comp_num = hdmi_num + ssp_num;
-
-	ret = get_sdw_dailink_info(dev, mach_params->links,
-				   &sdw_be_num, &sdw_cpu_dai_num);
-	if (ret < 0) {
-		dev_err(dev, "failed to get sdw link info %d", ret);
-		return ret;
-	}
-
 	/* enable dmic01 & dmic16k */
-	dmic_num = (sof_sdw_quirk & SOF_SDW_PCH_DMIC || mach_params->dmic_num) ? 2 : 0;
-	comp_num += dmic_num;
+	if (sof_sdw_quirk & SOF_SDW_PCH_DMIC || mach_params->dmic_num)
+		dmic_num = 2;
 
 	if (sof_sdw_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
-		comp_num++;
+		bt_num = 1;
 
-	dev_dbg(dev, "sdw %d, ssp %d, dmic %d, hdmi %d", sdw_be_num, ssp_num,
-		dmic_num, ctx->idisp_codec ? hdmi_num : 0);
+	dev_dbg(dev, "sdw %d, ssp %d, dmic %d, hdmi %d, bt: %d\n",
+		sdw_be_num, ssp_num, dmic_num, hdmi_num, bt_num);
 
 	/* allocate BE dailinks */
-	num_links = comp_num + sdw_be_num;
+	num_links = sdw_be_num + ssp_num + dmic_num + hdmi_num + bt_num;
 	dai_links = devm_kcalloc(dev, num_links, sizeof(*dai_links), GFP_KERNEL);
+	if (!dai_links)
+		return -ENOMEM;
 
 	/* allocated CPU DAIs */
-	total_cpu_dai_num = comp_num + sdw_cpu_dai_num;
-	cpus = devm_kcalloc(dev, total_cpu_dai_num, sizeof(*cpus),
-			    GFP_KERNEL);
-
-	if (!dai_links || !cpus)
+	total_cpu_dai_num = sdw_cpu_dai_num + ssp_num + dmic_num + hdmi_num + bt_num;
+	cpus = devm_kcalloc(dev, total_cpu_dai_num, sizeof(*cpus), GFP_KERNEL);
+	if (!cpus)
 		return -ENOMEM;
 
 	/* SDW */
-- 
2.39.2

