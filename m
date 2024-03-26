Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3565588C897
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:08:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C65F32BEE;
	Tue, 26 Mar 2024 17:08:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C65F32BEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711469308;
	bh=BCGUnmel3nMig/J6x2o3QtQOnlesmw1kiPswkn4iK8o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Zujw0+C76z/4IhvWbiJPkTGlU9D56wp7pdkcmBy6wT1+q3zH0At4mMcMBh1AP5ypu
	 ceOTxh8x0ZYYsDnugJbmouJ5kH3m8LLD4VYpK09ys5OIvdd/BiTHCHZFlFVBdSJrF3
	 fgA6dTxpogKcQWRh16LnrpzcPZ8urdyNsYc/68ik=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2ED5CF806C7; Tue, 26 Mar 2024 17:06:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A727F806A7;
	Tue, 26 Mar 2024 17:06:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 840E0F805B6; Tue, 26 Mar 2024 17:05:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C458F80570
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:05:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C458F80570
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UphfnKWX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469135; x=1743005135;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BCGUnmel3nMig/J6x2o3QtQOnlesmw1kiPswkn4iK8o=;
  b=UphfnKWXQuqtV6mcJjXZPfpGSA8jLUts9OdWDwrxPAl9mJmMtoA5OGhr
   oLv+fOQFsQ0VX6NNK6UcR1xR1p4Llpw+1HuOFWhq1/XulabIL6A3wWC9W
   Kd7aTRVylG+7rE6gnO3c6oIeXVeHcHbxtWWExj5wXq24MXHeVRgLh7gLr
   0k8HaPuUllMyIrzTd4xm88KCfgoqzX2sJSYHxLCCJSLrS0eOgWjDu7Ls6
   gcsgzaTQ+iNc4hJ0d+agjaWgbXlJZ8zYkzWZRM0qvW/RWj09z1ToTc01S
   44u4erNFTIF95VNkrU5L7gNbI162IQrBUK2/oHEKkRynWb9lhMvy90Zq/
   A==;
X-CSE-ConnectionGUID: 5hYbdtOfRFmCc+31ZlQycw==
X-CSE-MsgGUID: v+v6yVYOT2qkKUpsaRD6lA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260392"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="17260392"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="20482209"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:49 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 10/34] ASoC: Intel: sof_sdw: Factor out SSP DAI creation
Date: Tue, 26 Mar 2024 11:04:05 -0500
Message-Id: <20240326160429.13560-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YJMBMSPUQ7XAPR47ZVAULPLQRLHCNKZR
X-Message-ID-Hash: YJMBMSPUQ7XAPR47ZVAULPLQRLHCNKZR
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Factor out the creation of the SSP DAI links into a helper function. No
functional change.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 63 +++++++++++++++++++-------------
 1 file changed, 37 insertions(+), 26 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index a12283d3e1cc..9980652c901b 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1625,6 +1625,40 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 	return 0;
 }
 
+static int create_ssp_dailinks(struct snd_soc_card *card,
+			       struct snd_soc_dai_link **dai_links, int *be_id,
+			       struct sof_sdw_codec_info *ssp_info,
+			       unsigned long ssp_mask)
+{
+	struct device *dev = card->dev;
+	int i, j = 0;
+	int ret;
+
+	for_each_set_bit(i, &ssp_mask, BITS_PER_TYPE(ssp_mask)) {
+		char *name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec", i);
+		char *cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", i);
+		char *codec_name = devm_kasprintf(dev, GFP_KERNEL, "i2c-%s:0%d",
+						  ssp_info->acpi_id, j++);
+		int playback = ssp_info->dais[0].direction[SNDRV_PCM_STREAM_PLAYBACK];
+		int capture = ssp_info->dais[0].direction[SNDRV_PCM_STREAM_CAPTURE];
+
+		ret = init_simple_dai_link(dev, *dai_links, be_id, name,
+					   playback, capture, cpu_dai_name,
+					   codec_name, ssp_info->dais[0].dai_name,
+					   NULL, ssp_info->ops);
+		if (ret)
+			return ret;
+
+		ret = ssp_info->dais[0].init(card, NULL, *dai_links, ssp_info, 0);
+		if (ret < 0)
+			return ret;
+
+		(*dai_links)++;
+	}
+
+	return 0;
+}
+
 static int sof_card_dai_links_create(struct snd_soc_card *card)
 {
 	struct device *dev = card->dev;
@@ -1780,36 +1814,13 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 
 SSP:
 	/* SSP */
-	if (!ssp_num)
-		goto DMIC;
-
-	j = 0;
-	for_each_set_bit(i, &ssp_mask, BITS_PER_TYPE(ssp_mask)) {
-		int playback, capture;
-
-		name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec", i);
-		cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", i);
-		codec_name = devm_kasprintf(dev, GFP_KERNEL, "i2c-%s:0%d",
-					    ssp_info->acpi_id, j++);
-
-		playback = ssp_info->dais[0].direction[SNDRV_PCM_STREAM_PLAYBACK];
-		capture = ssp_info->dais[0].direction[SNDRV_PCM_STREAM_CAPTURE];
-
-		ret = init_simple_dai_link(dev, dai_links, &be_id, name,
-					   playback, capture, cpu_dai_name,
-					   codec_name, ssp_info->dais[0].dai_name,
-					   NULL, ssp_info->ops);
+	if (ssp_num) {
+		ret = create_ssp_dailinks(card, &dai_links, &be_id,
+					  ssp_info, ssp_mask);
 		if (ret)
 			return ret;
-
-		ret = ssp_info->dais[0].init(card, NULL, dai_links, ssp_info, 0);
-		if (ret < 0)
-			return ret;
-
-		dai_links++;
 	}
 
-DMIC:
 	/* dmic */
 	if (dmic_num > 0) {
 		if (ctx->ignore_pch_dmic) {
-- 
2.40.1

