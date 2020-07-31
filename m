Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B922345E2
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 14:32:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9B8A16A1;
	Fri, 31 Jul 2020 14:32:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9B8A16A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596198772;
	bh=CyJ0Xsmhq/iB6sLmlnOWDOpEeUlTFnjHlr2D9JGNuvs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ELUAQmYwzl2fO8RDApZw1wle4VOOAIB4qGMx58wwvX7n2OFA28UY/rNuyoDDJCaQT
	 cBKZ5zYjaiXlBjfmm1N6MOccJF458IBepJE/Z2IU415lRtJPjxKs5azVEXGBqN17zI
	 jU5uPzLBuBVkhkYow75O9HayO7UOJTrNF54l0AJE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13121F8028D;
	Fri, 31 Jul 2020 14:31:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB94FF8028D; Fri, 31 Jul 2020 14:31:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A879F8011C
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 14:30:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A879F8011C
IronPort-SDR: gKew7cVK2O1WG+mCga3GDAauwOv2gmytaxjAeTPpvX+oocZCrwE57SogIYUO4FN+hoA5jy4xop
 SJ8G4vut2XrQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="169877726"
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; d="scan'208";a="169877726"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2020 05:30:49 -0700
IronPort-SDR: tBj6JDEK8ejNGpSr8gZ1dVM+t2WX/vR5FImmYsuAiPYGCPcU5PYRFf+B24IFK6YaDH71gxt5Z9
 cZmfCbwdAmtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,418,1589266800"; d="scan'208";a="365483191"
Received: from brentlu-desk0.itwn.intel.com ([10.5.253.11])
 by orsmga001.jf.intel.com with ESMTP; 31 Jul 2020 05:30:45 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 2/2] ASoC: Intel: Add period size constraint on strago board
Date: Fri, 31 Jul 2020 20:26:05 +0800
Message-Id: <1596198365-10105-3-git-send-email-brent.lu@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596198365-10105-1-git-send-email-brent.lu@intel.com>
References: <1596020585-11517-1-git-send-email-brent.lu@intel.com>
 <1596198365-10105-1-git-send-email-brent.lu@intel.com>
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Sam McNally <sammc@chromium.org>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Yu-Hsuan Hsu <yuhsuan@chromium.org>, Daniel Stuart <daniel.stuart14@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Brent Lu <brent.lu@intel.com>, Damian van Soelen <dj.vsoelen@gmail.com>
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

From: Yu-Hsuan Hsu <yuhsuan@chromium.org>

The CRAS server does not set the period size in hw_param so ALSA will
calculate a value for period size which is based on the buffer size
and other parameters. The value may not always be aligned with Atom's
dsp design so a constraint is added to make sure the board always has
a good value.

Cyan uses chtmax98090 and others(banon, celes, edgar, kefka...) use
rt5650.

Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/intel/boards/cht_bsw_max98090_ti.c | 14 +++++++++++++-
 sound/soc/intel/boards/cht_bsw_rt5645.c      | 14 +++++++++++++-
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/cht_bsw_max98090_ti.c b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
index 835e9bd..bf67254 100644
--- a/sound/soc/intel/boards/cht_bsw_max98090_ti.c
+++ b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
@@ -283,8 +283,20 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 
 static int cht_aif1_startup(struct snd_pcm_substream *substream)
 {
-	return snd_pcm_hw_constraint_single(substream->runtime,
+	int err;
+
+	/* Set period size to 240 to align with Atom design */
+	err = snd_pcm_hw_constraint_minmax(substream->runtime,
+			SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 240, 240);
+	if (err < 0)
+		return err;
+
+	err = snd_pcm_hw_constraint_single(substream->runtime,
 			SNDRV_PCM_HW_PARAM_RATE, 48000);
+	if (err < 0)
+		return err;
+
+	return 0;
 }
 
 static int cht_max98090_headset_init(struct snd_soc_component *component)
diff --git a/sound/soc/intel/boards/cht_bsw_rt5645.c b/sound/soc/intel/boards/cht_bsw_rt5645.c
index b53c024..6e62f0d 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5645.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5645.c
@@ -414,8 +414,20 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 
 static int cht_aif1_startup(struct snd_pcm_substream *substream)
 {
-	return snd_pcm_hw_constraint_single(substream->runtime,
+	int err;
+
+	/* Set period size to 240 to align with Atom design */
+	err = snd_pcm_hw_constraint_minmax(substream->runtime,
+			SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 240, 240);
+	if (err < 0)
+		return err;
+
+	err = snd_pcm_hw_constraint_single(substream->runtime,
 			SNDRV_PCM_HW_PARAM_RATE, 48000);
+	if (err < 0)
+		return err;
+
+	return 0;
 }
 
 static const struct snd_soc_ops cht_aif1_ops = {
-- 
2.7.4

