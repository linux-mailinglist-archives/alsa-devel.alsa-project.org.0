Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 754DB7C767A
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 21:13:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 762D584A;
	Thu, 12 Oct 2023 21:12:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 762D584A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697138021;
	bh=PNrm2X/PxRq0cUdwuHaATm1IepNOxOsBhYK9snkSvQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F+zRUPPLKL7BTp4Igao8M6kjV8S+rKCk8Ylz6+N3Qq84JbjXzWhnZoUFQsR8ehFiF
	 /nIiqa0ZcXU1dmRWjHHko7O6ilH1RVvYhokcwVPqkEQ5ursNsYeuZIhQE1ak6P94Vx
	 ekv0arOyCWoHzJ1z9sMNsaj28q/5eA7ZJOAbB/HI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A43B4F80604; Thu, 12 Oct 2023 21:09:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D292CF80578;
	Thu, 12 Oct 2023 21:09:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D189F805D9; Thu, 12 Oct 2023 21:09:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36617F80564
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 21:09:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36617F80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=oHd+UHTV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697137745; x=1728673745;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PNrm2X/PxRq0cUdwuHaATm1IepNOxOsBhYK9snkSvQ0=;
  b=oHd+UHTVcg7/2uIP2M3uC7VveggmsR82rv/y7ZBDCkQZgMTOVBzhJwda
   BEGbNS2WKvfb8S4I7bAIJRYwXHIgE5keI9JmYaUmHd5RT38ERPyXBLoXf
   Duvm0F5YwXBXAgmCiJn8fFm6jIi6zyAs1Nlis9B7OOY9tR4j6GRSLSXDV
   ebVzKF0pA5mxJVvH3r7cBSakTlFUyclryYI29v7dBCoiQJ0jrKbwMeT8u
   AI3rW5YDYhcAbsnGWq4y28v15VwstoLO7V9q2f8NDHXwBdx4jZa8cR1hV
   /Eld+JpNkeXyBgCIfeG/cu9VtOGiKNLLYVIvVB44MMphTKDIK8LBPKccN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="416060222"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="416060222"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="845108100"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="845108100"
Received: from gchoudha-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.hsd1.md.comcast.net) ([10.212.114.241])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:49 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 15/23] ASoC: Intel: sof_nau8825: use sof_hdmi_private to init
 HDMI
Date: Thu, 12 Oct 2023 15:08:18 -0400
Message-Id: <20231012190826.142619-16-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
References: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HEQOOTXJMVHEYZOHZQ7WRO5A7VKCB7FW
X-Message-ID-Hash: HEQOOTXJMVHEYZOHZQ7WRO5A7VKCB7FW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HEQOOTXJMVHEYZOHZQ7WRO5A7VKCB7FW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Use sof_hdmi_private structure instead of a link list of sof_hdmi_pcm
structure for HDMI dai link initialization since hdac-hdmi support is
removed.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_nau8825.c | 32 ++++++++++------------------
 1 file changed, 11 insertions(+), 21 deletions(-)

diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index 496a6401404d..5c594e6d2fb4 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -22,6 +22,7 @@
 #include "../common/soc-intel-quirks.h"
 #include "hda_dsp_common.h"
 #include "sof_realtek_common.h"
+#include "sof_hdmi_common.h"
 #include "sof_maxim_common.h"
 #include "sof_nuvoton_common.h"
 #include "sof_ssp_common.h"
@@ -46,15 +47,10 @@
 
 static unsigned long sof_nau8825_quirk = SOF_NAU8825_SSP_CODEC(0);
 
-struct sof_hdmi_pcm {
-	struct list_head head;
-	struct snd_soc_dai *codec_dai;
-};
-
 struct sof_card_private {
 	struct clk *mclk;
 	struct snd_soc_jack sof_headset;
-	struct list_head hdmi_pcm_list;
+	struct sof_hdmi_private hdmi;
 	enum sof_ssp_codec codec_type;
 	enum sof_ssp_codec amp_type;
 };
@@ -63,15 +59,8 @@ static int sof_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
-	struct sof_hdmi_pcm *pcm;
 
-	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
-	if (!pcm)
-		return -ENOMEM;
-
-	pcm->codec_dai = dai;
-
-	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
+	ctx->hdmi.hdmi_comp = dai->component;
 
 	return 0;
 }
@@ -182,7 +171,6 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 {
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dapm_context *dapm = &card->dapm;
-	struct sof_hdmi_pcm *pcm;
 	int err;
 
 	if (ctx->amp_type == CODEC_MAX98373) {
@@ -194,12 +182,13 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 			return err;
 	}
 
-	if (list_empty(&ctx->hdmi_pcm_list))
+	if (!ctx->hdmi.idisp_codec)
+		return 0;
+
+	if (!ctx->hdmi.hdmi_comp)
 		return -EINVAL;
 
-	pcm = list_first_entry(&ctx->hdmi_pcm_list, struct sof_hdmi_pcm, head);
-
-	return hda_dsp_hdmi_build_controls(card, pcm->codec_dai->component);
+	return hda_dsp_hdmi_build_controls(card, ctx->hdmi.hdmi_comp);
 }
 
 static const struct snd_kcontrol_new sof_controls[] = {
@@ -506,6 +495,9 @@ static int sof_audio_probe(struct platform_device *pdev)
 	if (!hdmi_num)
 		hdmi_num = 3;
 
+	if (mach->mach_params.codec_mask & IDISP_CODEC_MASK)
+		ctx->hdmi.idisp_codec = true;
+
 	ssp_amp = (sof_nau8825_quirk & SOF_NAU8825_SSP_AMP_MASK) >>
 			SOF_NAU8825_SSP_AMP_SHIFT;
 
@@ -547,8 +539,6 @@ static int sof_audio_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
-
 	sof_audio_card_nau8825.dev = &pdev->dev;
 
 	/* set platform name for each dailink */
-- 
2.39.2

