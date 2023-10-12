Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DBC7C767B
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 21:13:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6DD8BC0;
	Thu, 12 Oct 2023 21:13:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6DD8BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697138030;
	bh=EsuhuE+VVeE5ouvzUmoyrwgmUOx2k9Ewl+ZqnLzYGgM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nWYSKPrIueQ6JSLUrBViO+XHSy/Jt1H7ktulded/t9xb6TvkbZ3a72/5pQkV4THBb
	 F1C7Iu/J0zFNcya7a9OmOHzw0iK/1+vzAAxOiTPdXObIa3VlRsj+ps0EDLuFfMghRV
	 BCgt8S45mh57HywXw82zORBdE5CAMPbwEju6qK3Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4031AF8060E; Thu, 12 Oct 2023 21:09:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51840F805FD;
	Thu, 12 Oct 2023 21:09:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E185F805E7; Thu, 12 Oct 2023 21:09:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BFA2CF80563
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 21:09:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFA2CF80563
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mv/muumP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697137745; x=1728673745;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EsuhuE+VVeE5ouvzUmoyrwgmUOx2k9Ewl+ZqnLzYGgM=;
  b=mv/muumPRJ7azlhbzi94HHOCOyOIRqRknWjGuwB1i3mHdFbubDtbvSOR
   R6MP+HeGW1MM5YPWKQoHIextHhue9iwL8C/U4xM6uYVS9XsAnu7rbTYe/
   7dqUjsG9G2/NtCbyTuEj5ntWao+HFwumNwZcaUuNZtYG3QukcZgVcfYtf
   oJo4FjAtwam25AdkvPgLbc2KBpYAr4E7IWb29Oqb+Vij4at6h/N/UCcbP
   UcTnTERFdZOERu3eul2ZLgsgknmAu9FZIdX+oyoaP4mcvHvo5nSrCRGzo
   HP0rbbeZM88eOW9N4vrrRHlqPEOG/sTvP7NmFPQ1CeXs/dNtT5HO9x0ED
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="416060226"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="416060226"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="845108104"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="845108104"
Received: from gchoudha-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.hsd1.md.comcast.net) ([10.212.114.241])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:50 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 16/23] ASoC: Intel: sof_rt5682: use sof_hdmi_private to init
 HDMI
Date: Thu, 12 Oct 2023 15:08:19 -0400
Message-Id: <20231012190826.142619-17-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
References: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7AHISACPFCERUH3BEZVVWGNEUIC66VZB
X-Message-ID-Hash: 7AHISACPFCERUH3BEZVVWGNEUIC66VZB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7AHISACPFCERUH3BEZVVWGNEUIC66VZB/>
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
 sound/soc/intel/boards/sof_rt5682.c | 36 +++++++----------------------
 1 file changed, 8 insertions(+), 28 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index e256430b65a8..0f4923fb4d89 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -25,6 +25,7 @@
 #include "../../codecs/rt5645.h"
 #include "../common/soc-intel-quirks.h"
 #include "hda_dsp_common.h"
+#include "sof_hdmi_common.h"
 #include "sof_maxim_common.h"
 #include "sof_realtek_common.h"
 #include "sof_ssp_common.h"
@@ -61,16 +62,10 @@ static unsigned long sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
 
 static int is_legacy_cpu;
 
-struct sof_hdmi_pcm {
-	struct list_head head;
-	struct snd_soc_dai *codec_dai;
-};
-
 struct sof_card_private {
 	struct clk *mclk;
 	struct snd_soc_jack sof_headset;
-	struct list_head hdmi_pcm_list;
-	bool idisp_codec;
+	struct sof_hdmi_private hdmi;
 	enum sof_ssp_codec codec_type;
 	enum sof_ssp_codec amp_type;
 };
@@ -230,15 +225,8 @@ static int sof_hdmi_init(struct snd_soc_pcm_runtime *rtd)
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
@@ -508,9 +496,7 @@ static struct snd_soc_dai_link_component platform_component[] = {
 static int sof_card_late_probe(struct snd_soc_card *card)
 {
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(card);
-	struct snd_soc_component *component = NULL;
 	struct snd_soc_dapm_context *dapm = &card->dapm;
-	struct sof_hdmi_pcm *pcm;
 	int err;
 
 	if (ctx->amp_type == CODEC_MAX98373) {
@@ -523,15 +509,13 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 	}
 
 	/* HDMI is not supported by SOF on Baytrail/CherryTrail */
-	if (is_legacy_cpu || !ctx->idisp_codec)
+	if (is_legacy_cpu || !ctx->hdmi.idisp_codec)
 		return 0;
 
-	if (list_empty(&ctx->hdmi_pcm_list))
+	if (!ctx->hdmi.hdmi_comp)
 		return -EINVAL;
 
-	pcm = list_first_entry(&ctx->hdmi_pcm_list, struct sof_hdmi_pcm, head);
-	component = pcm->codec_dai->component;
-	return hda_dsp_hdmi_build_controls(card, component);
+	return hda_dsp_hdmi_build_controls(card, ctx->hdmi.hdmi_comp);
 }
 
 static const struct snd_kcontrol_new sof_controls[] = {
@@ -654,8 +638,6 @@ static struct snd_soc_dai_link_component dmic_component[] = {
 	}
 };
 
-#define IDISP_CODEC_MASK	0x4
-
 static struct snd_soc_dai_link *
 sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec codec_type,
 			  enum sof_ssp_codec amp_type, int ssp_codec,
@@ -988,7 +970,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 			hdmi_num = 3;
 
 		if (mach->mach_params.codec_mask & IDISP_CODEC_MASK)
-			ctx->idisp_codec = true;
+			ctx->hdmi.idisp_codec = true;
 	}
 
 	/* need to get main clock from pmc */
@@ -1035,7 +1017,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 	dai_links = sof_card_dai_links_create(&pdev->dev, ctx->codec_type,
 					      ctx->amp_type, ssp_codec, ssp_amp,
 					      dmic_be_num, hdmi_num,
-					      ctx->idisp_codec);
+					      ctx->hdmi.idisp_codec);
 	if (!dai_links)
 		return -ENOMEM;
 
@@ -1070,8 +1052,6 @@ static int sof_audio_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
-
 	sof_audio_card_rt5682.dev = &pdev->dev;
 
 	/* set platform name for each dailink */
-- 
2.39.2

