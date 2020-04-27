Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1EE1BAA84
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 18:56:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 754A016AA;
	Mon, 27 Apr 2020 18:55:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 754A016AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588006590;
	bh=qiERsDGucGhz0OrjsEP1gWJ06zn/pW7yPwFhh2O65q4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B+2sld1liwADbeKpOt3XOxTZR489hzqzvJSpA8WI++RZnTlzkGiJQgInrlt2EOM9W
	 Pt0+6kVknVrHdwLSJXREDCMwrcBdcMRoYO6kCmzvR7nAxT8dAAhGpHVwFqWvA/6xM3
	 8CfVl32gXc0+fbzVcvyw2alP2FX+2HkrFFYZgJ3g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEE91F802BC;
	Mon, 27 Apr 2020 18:52:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B9C6F80291; Mon, 27 Apr 2020 18:52:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F12DF8025F
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 18:52:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F12DF8025F
IronPort-SDR: YxyCMsfm9tbUuEPe6NQP7ZtOljmc4YmPthlm0QBQm/Kfe5m9g7D76hkycgtd8s9WmXrXNMYLnX
 H1RqSwFN8xMg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 09:52:11 -0700
IronPort-SDR: H0Funuf7csEK8HDOpW7Oi5/NwykIVwfCWPkVLc9YTydm1iF5V5mlezEwUZ5n9/gzvLqTto7N1l
 qDjoYwiEoG5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,324,1583222400"; d="scan'208";a="248925568"
Received: from dbombien-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.254.51.189])
 by fmsmga008.fm.intel.com with ESMTP; 27 Apr 2020 09:52:11 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/4] ASoC: sof-sdw: remove CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC
 condition
Date: Mon, 27 Apr 2020 09:52:10 -0700
Message-Id: <20200427165211.23463-4-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200427165211.23463-1-ranjani.sridharan@linux.intel.com>
References: <20200427165211.23463-1-ranjani.sridharan@linux.intel.com>
Cc: tiwai@suse.de, Libin Yang <libin.yang@linux.intel.com>, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Libin Yang <libin.yang@linux.intel.com>

As CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC is always enabled in sof-soundwire
driver, let's remove the test of CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC
in the code.

Signed-off-by: Libin Yang <libin.yang@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c      | 8 --------
 sound/soc/intel/boards/sof_sdw_hdmi.c | 7 -------
 2 files changed, 15 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index cffc790fc2ea..03bf27bfdbe1 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -663,9 +663,7 @@ static int sof_card_dai_links_create(struct device *dev,
 				     struct snd_soc_card *card)
 {
 	int ssp_num, sdw_be_num = 0, hdmi_num = 0, dmic_num;
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 	struct snd_soc_dai_link_component *idisp_components;
-#endif
 	struct snd_soc_dai_link_component *ssp_components;
 	struct snd_soc_acpi_mach_params *mach_params;
 	const struct snd_soc_acpi_link_adr *adr_link;
@@ -686,10 +684,8 @@ static int sof_card_dai_links_create(struct device *dev,
 	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++)
 		codec_info_list[i].amp_num = 0;
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 	hdmi_num = sof_sdw_quirk & SOF_SDW_TGL_HDMI ?
 				SOF_TGL_HDMI_COUNT : SOF_PRE_TGL_HDMI_COUNT;
-#endif
 
 	ssp_mask = SOF_SSP_GET_PORT(sof_sdw_quirk);
 	/*
@@ -849,7 +845,6 @@ static int sof_card_dai_links_create(struct device *dev,
 		INC_ID(be_id, cpu_id, link_id);
 	}
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 	/* HDMI */
 	if (hdmi_num > 0) {
 		idisp_components = devm_kcalloc(dev, hdmi_num,
@@ -886,7 +881,6 @@ static int sof_card_dai_links_create(struct device *dev,
 			      sof_sdw_hdmi_init, NULL);
 		INC_ID(be_id, cpu_id, link_id);
 	}
-#endif
 
 	card->dai_link = links;
 	card->num_links = num_links;
@@ -920,9 +914,7 @@ static int mc_probe(struct platform_device *pdev)
 
 	dmi_check_system(sof_sdw_quirk_table);
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
-#endif
 
 	card->dev = &pdev->dev;
 
diff --git a/sound/soc/intel/boards/sof_sdw_hdmi.c b/sound/soc/intel/boards/sof_sdw_hdmi.c
index cb1118e78e89..65302ea2578b 100644
--- a/sound/soc/intel/boards/sof_sdw_hdmi.c
+++ b/sound/soc/intel/boards/sof_sdw_hdmi.c
@@ -16,7 +16,6 @@
 #include "../../codecs/hdac_hdmi.h"
 #include "hda_dsp_common.h"
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 static struct snd_soc_jack hdmi[MAX_HDMI_NUM];
 
 struct hdmi_pcm {
@@ -89,9 +88,3 @@ int sof_sdw_hdmi_card_late_probe(struct snd_soc_card *card)
 
 	return hdac_hdmi_jack_port_init(component, &card->dapm);
 }
-#else
-int sof_sdw_hdmi_card_late_probe(struct snd_soc_card *card)
-{
-	return 0;
-}
-#endif
-- 
2.17.1

