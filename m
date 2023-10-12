Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9427C7678
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 21:13:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 104A7204;
	Thu, 12 Oct 2023 21:12:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 104A7204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697137991;
	bh=497SJBZuQqefj9DKkP1/C+SzKF9pg8FavpU1OQMuNGk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KXItv7wuPfikcqvOAb7CmPu6Twek6Vksz+0AuhoxvvQ9rRVBONLRNLGtmWCUDlahE
	 V1hlMfbaTIF/4g6yK4J74TGR0v7pWELxGlApt7yqSxULVnyH30/ri0C5/6tYjfqRq4
	 gWtzdieGglQU9lcbyjzXXmisLKt8sHM+h59qd9lw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0272BF805FF; Thu, 12 Oct 2023 21:09:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14241F805F7;
	Thu, 12 Oct 2023 21:09:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 389C7F805D8; Thu, 12 Oct 2023 21:09:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC012F8019B
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 21:09:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC012F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DhfCH549
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697137745; x=1728673745;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=497SJBZuQqefj9DKkP1/C+SzKF9pg8FavpU1OQMuNGk=;
  b=DhfCH549jQKKmVdNX3jHdKonPL6HONiBAHCt6ajSVmy3WEE0EqxalMje
   NBpN6NwzH/CT9yBxdOgYaclWC272yGIFO2VY2qDAExqQSXB9mJcuRuHSR
   kqVA+KI7YSdKA6TKmbn4KIPjnKWbrcnFiAO1vQ4WONxGi8Cr3J8lLFelA
   q+7zJ0F47VqRUkJybZqnmFsc3/1GId6a8QTbMUgqmsrPv8emDnkD0NV3D
   orsk37t9iwcXw69IL36Xq+xK2r4eh74N0XroAPpq5tNjYfUnCwV86Ll7c
   5VfbIfbBGPCGZDxefXrmkqnGaTpnBm6YorgdjHIF2mI8ugGoDMdtnNRa4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="416060217"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="416060217"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="845108096"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="845108096"
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
Subject: [PATCH 14/23] ASoC: Intel: sof_da7219: use sof_hdmi_private to init
 HDMI
Date: Thu, 12 Oct 2023 15:08:17 -0400
Message-Id: <20231012190826.142619-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
References: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5Q767IGAG6IGCI7DY4KN6OETJDBQLV6U
X-Message-ID-Hash: 5Q767IGAG6IGCI7DY4KN6OETJDBQLV6U
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
Archived-At: <>
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
 sound/soc/intel/boards/sof_da7219.c | 32 ++++++++++++-----------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index 03131cb495d1..6eb5a6144e97 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -16,6 +16,7 @@
 #include <sound/sof.h>
 #include "../../codecs/da7219.h"
 #include "hda_dsp_common.h"
+#include "sof_hdmi_common.h"
 #include "sof_maxim_common.h"
 #include "sof_ssp_common.h"
 
@@ -24,14 +25,9 @@
 
 #define DIALOG_CODEC_DAI	"da7219-hifi"
 
-struct hdmi_pcm {
-	struct list_head head;
-	struct snd_soc_dai *codec_dai;
-};
-
 struct card_private {
 	struct snd_soc_jack headset_jack;
-	struct list_head hdmi_pcm_list;
+	struct sof_hdmi_private hdmi;
 	enum sof_ssp_codec codec_type;
 	enum sof_ssp_codec amp_type;
 
@@ -230,15 +226,8 @@ static int hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_dai *dai = snd_soc_rtd_to_codec(rtd, 0);
-	struct hdmi_pcm *pcm;
 
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
@@ -246,10 +235,14 @@ static int hdmi_init(struct snd_soc_pcm_runtime *rtd)
 static int card_late_probe(struct snd_soc_card *card)
 {
 	struct card_private *ctx = snd_soc_card_get_drvdata(card);
-	struct hdmi_pcm *pcm;
 
-	pcm = list_first_entry(&ctx->hdmi_pcm_list, struct hdmi_pcm, head);
-	return hda_dsp_hdmi_build_controls(card, pcm->codec_dai->component);
+	if (!ctx->hdmi.idisp_codec)
+		return 0;
+
+	if (!ctx->hdmi.hdmi_comp)
+		return -EINVAL;
+
+	return hda_dsp_hdmi_build_controls(card, ctx->hdmi.hdmi_comp);
 }
 
 SND_SOC_DAILINK_DEF(ssp0_pin,
@@ -469,6 +462,9 @@ static int audio_probe(struct platform_device *pdev)
 	ctx->codec_type = sof_ssp_detect_codec_type(&pdev->dev);
 	ctx->amp_type = sof_ssp_detect_amp_type(&pdev->dev);
 
+	if (mach->mach_params.codec_mask & IDISP_CODEC_MASK)
+		ctx->hdmi.idisp_codec = true;
+
 	if (board_quirk & SOF_DA7219_JSL_BOARD) {
 		/* backward-compatible with existing devices */
 		switch (ctx->amp_type) {
@@ -524,8 +520,6 @@ static int audio_probe(struct platform_device *pdev)
 
 	card_da7219.dai_link = dai_links;
 
-	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
-
 	card_da7219.dev = &pdev->dev;
 
 	ret = snd_soc_fixup_dai_links_platform_name(&card_da7219,
-- 
2.39.2

