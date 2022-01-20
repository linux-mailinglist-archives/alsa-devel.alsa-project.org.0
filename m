Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F162495691
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jan 2022 00:04:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D8C62DCC;
	Fri, 21 Jan 2022 00:03:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D8C62DCC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642719864;
	bh=cS97qPbQWIkeoC1Qme5b/0oN1W+YWDkm1dURqRnQkGI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lE4BR/Q2yCBPkHgDPHCjcDjMR9TqdruSBfgBm/VoqAH0yPPEThPZ/LTISoTLIRqQy
	 c6hE4Bwb5D9wGAWzec5C3eb8N7pN3pqsMopKPZAEqGVoyhQEqt5mCt5Ja2q8i2HOHx
	 keldewQXk7oe94onhbp4iOSYaFii7giL6nudqkwo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C502F804AA;
	Fri, 21 Jan 2022 00:02:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BAE1F804AA; Fri, 21 Jan 2022 00:02:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5596F80128
 for <alsa-devel@alsa-project.org>; Fri, 21 Jan 2022 00:02:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5596F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lwg+IJDu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642719763; x=1674255763;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cS97qPbQWIkeoC1Qme5b/0oN1W+YWDkm1dURqRnQkGI=;
 b=lwg+IJDuuAAoLWjwCbI6NIpquPGRi67HOHXT0o6OyXp1TMJcL6xKJ7Is
 ZRHI7g5kvMpL4TJjAMGM7UHdsVcdNFFPIWVoWxGydL/4yFfwMrKYNqDuo
 iA8AOT9u+Czy/xVpx0U1nrgXr6arUJnbH5fr5d+cZaQJ/djcGA+NYISRQ
 SItUXsLS6ZrWkVLxI9tjjOTP537B0uvYtTityCspu/JB6WWfiXxKKWKyf
 Z747SQ8Z7umQi2Mv2/13J+lHW2yn1W3V8ht1kWTCgmdVI3ClljfEjTQEb
 h/4R78AjQLwPqG0wbxbedbNnFg+g07qmZHGpAMwI/mkrt3ueBY0EKUlk4 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="306232005"
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="306232005"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 15:02:35 -0800
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="533014790"
Received: from sthambit-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.64.44])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 15:02:34 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ASoC: Intel: sof_rt5682: add support for systems without
 i915 audio
Date: Thu, 20 Jan 2022 17:02:25 -0600
Message-Id: <20220120230226.175906-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120230226.175906-1-pierre-louis.bossart@linux.intel.com>
References: <20220120230226.175906-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Yong Zhi <yong.zhi@intel.com>
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

From: Yong Zhi <yong.zhi@intel.com>

Add support to systems where iDisp HDMI/DP audio codec is disabled for some
reason, switch codecs to SoC dummy in the affected DAI links. This allows
to reuse existing topologies as hdmi_num is 3 by default.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 32 ++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index bd6d2e7dea53..8391bea8ec79 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -81,6 +81,7 @@ struct sof_card_private {
 	struct snd_soc_jack sof_headset;
 	struct list_head hdmi_pcm_list;
 	bool common_hdmi_codec_drv;
+	bool idisp_codec;
 };
 
 static int sof_rt5682_quirk_cb(const struct dmi_system_id *id)
@@ -417,7 +418,7 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 	int i = 0;
 
 	/* HDMI is not supported by SOF on Baytrail/CherryTrail */
-	if (is_legacy_cpu)
+	if (is_legacy_cpu || !ctx->idisp_codec)
 		return 0;
 
 	if (list_empty(&ctx->hdmi_pcm_list))
@@ -558,11 +559,14 @@ static struct snd_soc_dai_link_component dummy_component[] = {
 	}
 };
 
+#define IDISP_CODEC_MASK	0x4
+
 static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 							  int ssp_codec,
 							  int ssp_amp,
 							  int dmic_be_num,
-							  int hdmi_num)
+							  int hdmi_num,
+							  bool idisp_codec)
 {
 	struct snd_soc_dai_link_component *idisp_components;
 	struct snd_soc_dai_link_component *cpus;
@@ -676,13 +680,18 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		if (!links[id].cpus->dai_name)
 			goto devm_err;
 
-		idisp_components[i - 1].name = "ehdaudio0D2";
-		idisp_components[i - 1].dai_name = devm_kasprintf(dev,
-								  GFP_KERNEL,
-								  "intel-hdmi-hifi%d",
-								  i);
-		if (!idisp_components[i - 1].dai_name)
-			goto devm_err;
+		if (idisp_codec) {
+			idisp_components[i - 1].name = "ehdaudio0D2";
+			idisp_components[i - 1].dai_name = devm_kasprintf(dev,
+									  GFP_KERNEL,
+									  "intel-hdmi-hifi%d",
+									  i);
+			if (!idisp_components[i - 1].dai_name)
+				goto devm_err;
+		} else {
+			idisp_components[i - 1].name = "snd-soc-dummy";
+			idisp_components[i - 1].dai_name = "snd-soc-dummy-dai";
+		}
 
 		links[id].codecs = &idisp_components[i - 1];
 		links[id].num_codecs = 1;
@@ -838,6 +847,9 @@ static int sof_audio_probe(struct platform_device *pdev)
 		/* default number of HDMI DAI's */
 		if (!hdmi_num)
 			hdmi_num = 3;
+
+		if (mach->mach_params.codec_mask & IDISP_CODEC_MASK)
+			ctx->idisp_codec = true;
 	}
 
 	/* need to get main clock from pmc */
@@ -892,7 +904,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 		sof_audio_card_rt5682.num_links++;
 
 	dai_links = sof_card_dai_links_create(&pdev->dev, ssp_codec, ssp_amp,
-					      dmic_be_num, hdmi_num);
+					      dmic_be_num, hdmi_num, ctx->idisp_codec);
 	if (!dai_links)
 		return -ENOMEM;
 
-- 
2.25.1

