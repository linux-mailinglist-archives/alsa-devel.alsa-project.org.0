Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 885387A1F19
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 14:46:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8BD1E84;
	Fri, 15 Sep 2023 14:45:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8BD1E84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694781962;
	bh=FBGhKyTn6NtmsCUHTKZxMrlPQv5iDnqvm0TTI65TSmU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C2sLYBYYPvPuW4ukdbimkWGS1DOeSsJx4PF6sbflMc1yJcxQunlDMFiU6jaxNzY1T
	 EBYtJcr1l17c/fQyNOli3ZB97gO8/ocC6sxEPjqRY35tIcd9VNKtmHU3dM5bSOFz0V
	 e84BltdqcUOY/ZVd62gdXgJm3/aptqlKgUQxlCFM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9BE7F80552; Fri, 15 Sep 2023 14:41:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EEBDF80563;
	Fri, 15 Sep 2023 14:41:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E97D7F805E7; Fri, 15 Sep 2023 14:40:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED525F805E2
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 14:40:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED525F805E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CAJ6u9Sz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694781651; x=1726317651;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FBGhKyTn6NtmsCUHTKZxMrlPQv5iDnqvm0TTI65TSmU=;
  b=CAJ6u9SzDmrsTYEmvlE49CXj4g4312bxcFd0F31BSqWVj5YSMal0yEAO
   yUscQLqTP9gP4ywJpGSSNHps7pyXpNQq/Ebl1gyzueb0fhnS0bgsKBmiw
   ekv2dkL7eZrUzeUhffYanuoIpnkyF0NIKnVvq9U2QX2yHreH8lFdRSe7u
   4RbLGF2wNfxUsuu9oJavf09zl9IYA753ZGvkJAXPdnQ7dOlad8xk/QsYI
   OlInDhQVBL0mkH00ZJj8hhoW2mccLBzIyE4Mu94iswfRDvzencijujQ3i
   NLmmCTYZOGjKniHIYnM0OdkLNrZ4QasRzpOGUnQSC/StossB1aE6dyQSq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="358653231"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="358653231"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="774304667"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="774304667"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:44 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	brent.lu@intel.com,
	uday.m.bhat@intel.com,
	balamurugan.c@intel.com
Subject: [PATCH 15/19] ASoC: Intel: sof_nau8825: use realtek-common module
Date: Fri, 15 Sep 2023 20:48:48 +0800
Message-Id: <20230915124852.1696857-16-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
References: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2FX4JS5ROZGZGV57NBWWPNDWBQWG2NJZ
X-Message-ID-Hash: 2FX4JS5ROZGZGV57NBWWPNDWBQWG2NJZ
X-MailFrom: yung-chuan.liao@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2FX4JS5ROZGZGV57NBWWPNDWBQWG2NJZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Use realtek-common module to support rt1019p speaker amplifier.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_nau8825.c | 52 +---------------------------
 1 file changed, 1 insertion(+), 51 deletions(-)

diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index 1e4e58f22ca6..10fdd70b09c9 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -214,10 +214,6 @@ static const struct snd_kcontrol_new sof_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Right Spk"),
 };
 
-static const struct snd_kcontrol_new speaker_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Spk"),
-};
-
 static const struct snd_soc_dapm_widget sof_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
@@ -225,10 +221,6 @@ static const struct snd_soc_dapm_widget sof_widgets[] = {
 	SND_SOC_DAPM_SPK("Right Spk", NULL),
 };
 
-static const struct snd_soc_dapm_widget speaker_widgets[] = {
-	SND_SOC_DAPM_SPK("Spk", NULL),
-};
-
 static const struct snd_soc_dapm_widget dmic_widgets[] = {
 	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
 };
@@ -242,44 +234,11 @@ static const struct snd_soc_dapm_route sof_map[] = {
 	{ "MIC", NULL, "Headset Mic" },
 };
 
-static const struct snd_soc_dapm_route speaker_map[] = {
-	/* speaker */
-	{ "Spk", NULL, "Speaker" },
-};
-
 static const struct snd_soc_dapm_route dmic_map[] = {
 	/* digital mics */
 	{"DMic", NULL, "SoC DMIC"},
 };
 
-static int speaker_codec_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_card *card = rtd->card;
-	int ret;
-
-	ret = snd_soc_dapm_new_controls(&card->dapm, speaker_widgets,
-					ARRAY_SIZE(speaker_widgets));
-	if (ret) {
-		dev_err(rtd->dev, "unable to add dapm controls, ret %d\n", ret);
-		/* Don't need to add routes if widget addition failed */
-		return ret;
-	}
-
-	ret = snd_soc_add_card_controls(card, speaker_controls,
-					ARRAY_SIZE(speaker_controls));
-	if (ret) {
-		dev_err(rtd->dev, "unable to add card controls, ret %d\n", ret);
-		return ret;
-	}
-
-	ret = snd_soc_dapm_add_routes(&card->dapm, speaker_map,
-				      ARRAY_SIZE(speaker_map));
-
-	if (ret)
-		dev_err(rtd->dev, "Speaker map addition failed: %d\n", ret);
-	return ret;
-}
-
 static int dmic_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
@@ -330,13 +289,6 @@ static struct snd_soc_dai_link_component dmic_component[] = {
 	}
 };
 
-static struct snd_soc_dai_link_component rt1019p_component[] = {
-	{
-		.name = "RTL1019:00",
-		.dai_name = "HiFi",
-	}
-};
-
 static struct snd_soc_dai_link *
 sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 			  int ssp_codec, int ssp_amp, int dmic_be_num,
@@ -478,9 +430,7 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 			sof_rt1015p_dai_link(&links[id]);
 			break;
 		case CODEC_RT1019P:
-			links[id].codecs = rt1019p_component;
-			links[id].num_codecs = ARRAY_SIZE(rt1019p_component);
-			links[id].init = speaker_codec_init;
+			sof_rt1019p_dai_link(&links[id]);
 			break;
 		default:
 			dev_err(dev, "invalid amp type %d\n", amp_type);
-- 
2.25.1

