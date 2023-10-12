Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D717C7679
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 21:13:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E99691D7;
	Thu, 12 Oct 2023 21:12:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E99691D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697138003;
	bh=v17lR/wHG0MsMm1yqblsU65jvuNSQ1C5yT1iT59EFII=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NYHQDvfFLaSf+2aaV9DVo/p3HloWNeoqmx+S9gn+CV13ybUHvThegvBh5fjgrH48O
	 e6APjBjebHdobtqiNmk6WX35aWsTmbZQEGTxoM4I1FHesK/Ga4CaWg8wJh4krGo+Yu
	 YHbuHfPPM0Ovdp9FSe4MfTOsNu9OgiLg3d9hUYwE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20AD6F80605; Thu, 12 Oct 2023 21:09:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86FCAF805FE;
	Thu, 12 Oct 2023 21:09:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21356F805E3; Thu, 12 Oct 2023 21:09:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 79C7DF8055C
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 21:09:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79C7DF8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ftWy9+Wm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697137744; x=1728673744;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v17lR/wHG0MsMm1yqblsU65jvuNSQ1C5yT1iT59EFII=;
  b=ftWy9+WmTbfTF205TzXiA4FtkYIWGrsCBH3s43oVQLbQFT0dV/ltLXvj
   9PZ7rNnidZLnaLWxRdIc5TzGztIrXpwJiuLo6/Eb/cys2comFaU2OAtKn
   1ClbiU/glFC5T4z7XvdCv2S+jugx8B+9ll7QBqv4f3Iay+cnfU7OZQg9n
   Z1MQ5hC5PLCfZ9nrW1gSvdewwB1TxW6LEDNMwWrTmWFlZrmBhqMSWc6Zw
   eJNNTHToNjT9P3XemCzFppIHrjaCxbarpE3QSf50U/w9emsNrDBKyHeXE
   sSkrKey76OUPQICflxpBEEjYUyImQy+5kAvr8nhqSxQGewwEfFsfsoZ6t
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="416060213"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="416060213"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="845108092"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="845108092"
Received: from gchoudha-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.hsd1.md.comcast.net) ([10.212.114.241])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:48 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 13/23] ASoC: Intel: sof_cs42l42: use sof_hdmi_private to init
 HDMI
Date: Thu, 12 Oct 2023 15:08:16 -0400
Message-Id: <20231012190826.142619-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
References: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NNWJVMMAP5GKFNR4KVCQYAEXU7QJIOPD
X-Message-ID-Hash: NNWJVMMAP5GKFNR4KVCQYAEXU7QJIOPD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NNWJVMMAP5GKFNR4KVCQYAEXU7QJIOPD/>
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
 sound/soc/intel/boards/sof_cs42l42.c | 33 ++++++++++------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index eeae65ac06c2..b38c54cc5640 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -21,6 +21,7 @@
 #include <dt-bindings/sound/cs42l42.h>
 #include "../common/soc-intel-quirks.h"
 #include "hda_dsp_common.h"
+#include "sof_hdmi_common.h"
 #include "sof_maxim_common.h"
 #include "sof_ssp_common.h"
 
@@ -67,14 +68,9 @@ static struct snd_soc_jack_pin jack_pins[] = {
 /* Default: SSP2 */
 static unsigned long sof_cs42l42_quirk = SOF_CS42L42_SSP_CODEC(2);
 
-struct sof_hdmi_pcm {
-	struct list_head head;
-	struct snd_soc_dai *codec_dai;
-};
-
 struct sof_card_private {
 	struct snd_soc_jack headset_jack;
-	struct list_head hdmi_pcm_list;
+	struct sof_hdmi_private hdmi;
 	enum sof_ssp_codec codec_type;
 	enum sof_ssp_codec amp_type;
 };
@@ -83,15 +79,8 @@ static int sof_hdmi_init(struct snd_soc_pcm_runtime *rtd)
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
@@ -177,15 +166,14 @@ static struct snd_soc_dai_link_component platform_component[] = {
 static int sof_card_late_probe(struct snd_soc_card *card)
 {
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(card);
-	struct snd_soc_component *component = NULL;
-	struct sof_hdmi_pcm *pcm;
 
-	if (list_empty(&ctx->hdmi_pcm_list))
+	if (!ctx->hdmi.idisp_codec)
+		return 0;
+
+	if (!ctx->hdmi.hdmi_comp)
 		return -EINVAL;
 
-	pcm = list_first_entry(&ctx->hdmi_pcm_list, struct sof_hdmi_pcm, head);
-	component = pcm->codec_dai->component;
-	return hda_dsp_hdmi_build_controls(card, component);
+	return hda_dsp_hdmi_build_controls(card, ctx->hdmi.hdmi_comp);
 }
 
 static const struct snd_kcontrol_new sof_controls[] = {
@@ -608,6 +596,9 @@ static int sof_audio_probe(struct platform_device *pdev)
 			hdmi_num = 3;
 	}
 
+	if (mach->mach_params.codec_mask & IDISP_CODEC_MASK)
+		ctx->hdmi.idisp_codec = true;
+
 	dev_dbg(&pdev->dev, "sof_cs42l42_quirk = %lx\n", sof_cs42l42_quirk);
 
 	ssp_bt = (sof_cs42l42_quirk & SOF_CS42L42_SSP_BT_MASK) >>
@@ -634,8 +625,6 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	sof_audio_card_cs42l42.dai_link = dai_links;
 
-	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
-
 	sof_audio_card_cs42l42.dev = &pdev->dev;
 
 	/* set platform name for each dailink */
-- 
2.39.2

