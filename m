Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D367C767C
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 21:14:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BA8DA4D;
	Thu, 12 Oct 2023 21:13:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BA8DA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697138046;
	bh=JhzCeGr54D4bCTxKgkm994SUjPrqxB7tQo0nC3K8qK0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ra/yzNQNjo/dvz0LFfUWH8vi4LUurEdwJWXq7ORQ/bITVc4rY5D0dhZ+QTxdDMdU4
	 8YFGYUnL2Vnj93miKqSej5X6jCQAuK7d56AC8MZ8igrNnIyMp8RkHs0QRo9slQMbpj
	 QYEl9Ysqo8zKuCuw2IRuc5H9aHDKXCr7jgs+sY9A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B08EF8061B; Thu, 12 Oct 2023 21:09:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D07CAF80615;
	Thu, 12 Oct 2023 21:09:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F654F805E9; Thu, 12 Oct 2023 21:09:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D2208F80568
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 21:09:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2208F80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jVogqtmE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697137747; x=1728673747;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JhzCeGr54D4bCTxKgkm994SUjPrqxB7tQo0nC3K8qK0=;
  b=jVogqtmEPVSaz7XdG6qDfSZat9IKt8vU5vs5pldRgT3FUZ49Jz+2fttX
   +8hNB2Mu3Rz8twql+jphZLODTDpSYYsfXFS7hx3Nfoda6SL1Y2ghrpt2M
   1yosqakmt97RpNr6UCHWEDqOI8hTj6Yf3tb3v5hGhtjCaDGIWuRfe7ycG
   lk6aPlXbj2e9xUyXy0C6XZKGd6EqUXW/5wXH7kPDpIMXyyLU+huNuq2vi
   PlrEfi+Gp774tvIwDB/nOINxqMOHH26cDR3THSi1DGJfd2EjKUWTLUSWa
   BXJmYAI0Nt1+znGT6x6sFchRTSoBDVqVi+SQigzV0JE+vFXKmJ2SguTiQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="416060237"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="416060237"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="845108111"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="845108111"
Received: from gchoudha-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.hsd1.md.comcast.net) ([10.212.114.241])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:53 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 18/23] ASoC: Intel: sof_ssp_amp: use sof_hdmi_private to init
 HDMI
Date: Thu, 12 Oct 2023 15:08:21 -0400
Message-Id: <20231012190826.142619-19-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
References: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YWT37Z4F2CRFTHIWSTIEMSORQJC3ZRGE
X-Message-ID-Hash: YWT37Z4F2CRFTHIWSTIEMSORQJC3ZRGE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YWT37Z4F2CRFTHIWSTIEMSORQJC3ZRGE/>
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
 sound/soc/intel/boards/sof_ssp_amp.c | 37 ++++++----------------------
 1 file changed, 8 insertions(+), 29 deletions(-)

diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index a3ac1e8c4c07..58655c2f2939 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -18,6 +18,7 @@
 #include <sound/pcm_params.h>
 #include <sound/sof.h>
 #include "hda_dsp_common.h"
+#include "sof_hdmi_common.h"
 #include "sof_realtek_common.h"
 #include "sof_cirrus_common.h"
 #include "sof_ssp_common.h"
@@ -60,14 +61,8 @@
 /* Default: SSP2  */
 static unsigned long sof_ssp_amp_quirk = SOF_AMPLIFIER_SSP(2);
 
-struct sof_hdmi_pcm {
-	struct list_head head;
-	struct snd_soc_dai *codec_dai;
-};
-
 struct sof_card_private {
-	struct list_head hdmi_pcm_list;
-	bool idisp_codec;
+	struct sof_hdmi_private hdmi;
 	enum sof_ssp_codec amp_type;
 };
 
@@ -93,22 +88,17 @@ static const struct snd_soc_dapm_route sof_ssp_amp_dapm_routes[] = {
 static int sof_card_late_probe(struct snd_soc_card *card)
 {
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(card);
-	struct snd_soc_component *component = NULL;
-	struct sof_hdmi_pcm *pcm;
 
 	if (!(sof_ssp_amp_quirk & SOF_HDMI_PLAYBACK_PRESENT))
 		return 0;
 
-	/* HDMI is not supported by SOF on Baytrail/CherryTrail */
-	if (!ctx->idisp_codec)
+	if (!ctx->hdmi.idisp_codec)
 		return 0;
 
-	if (list_empty(&ctx->hdmi_pcm_list))
+	if (!ctx->hdmi.hdmi_comp)
 		return -EINVAL;
 
-	pcm = list_first_entry(&ctx->hdmi_pcm_list, struct sof_hdmi_pcm, head);
-	component = pcm->codec_dai->component;
-	return hda_dsp_hdmi_build_controls(card, component);
+	return hda_dsp_hdmi_build_controls(card, ctx->hdmi.hdmi_comp);
 }
 
 static struct snd_soc_card sof_ssp_amp_card = {
@@ -140,21 +130,12 @@ static int sof_hdmi_init(struct snd_soc_pcm_runtime *rtd)
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
 
-#define IDISP_CODEC_MASK	0x4
-
 /* BE ID defined in sof-tgl-rt1308-hdmi-ssp.m4 */
 #define HDMI_IN_BE_ID		0
 #define SPK_BE_ID		2
@@ -394,7 +375,7 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 			hdmi_num = 3;
 
 		if (mach->mach_params.codec_mask & IDISP_CODEC_MASK)
-			ctx->idisp_codec = true;
+			ctx->hdmi.idisp_codec = true;
 
 		sof_ssp_amp_card.num_links += hdmi_num;
 	}
@@ -404,7 +385,7 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 
 	dai_links = sof_card_dai_links_create(&pdev->dev, ctx->amp_type,
 					      ssp_codec, dmic_be_num, hdmi_num,
-					      ctx->idisp_codec);
+					      ctx->hdmi.idisp_codec);
 	if (!dai_links)
 		return -ENOMEM;
 
@@ -424,8 +405,6 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
-
 	sof_ssp_amp_card.dev = &pdev->dev;
 
 	/* set platform name for each dailink */
-- 
2.39.2

