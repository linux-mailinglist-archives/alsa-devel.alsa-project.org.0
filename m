Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4860B2247E
	for <lists+alsa-devel@lfdr.de>; Sat, 18 May 2019 20:32:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B777416A8;
	Sat, 18 May 2019 20:31:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B777416A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558204367;
	bh=YYG2oaz5H9t+kw6qoidxU9NWbUVHaqHyBfiYsDoWBDA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XvBvTuEItbzChqKVZ7YX4sHxBk/UeT4aLbjm6Ylx99WaTmQaYOr4SoE6xsHhVnjZ4
	 G+r/jrovWqsizgbdHkeRJk+v3iEpovyNdIjfNtLA3Akww+w8NI13KCn9eptwGvZhUE
	 EEC+YZ2xpN/E36ci8hi+1W7UsuEIQbxQ1/td5U3s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA61EF896EC;
	Sat, 18 May 2019 20:30:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4DEDF896B9; Sat, 18 May 2019 20:30:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C905FF896B6
 for <alsa-devel@alsa-project.org>; Sat, 18 May 2019 20:30:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C905FF896B6
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 May 2019 11:30:16 -0700
X-ExtLoop1: 1
Received: from darrenlp-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.186.92])
 by orsmga008.jf.intel.com with ESMTP; 18 May 2019 11:30:15 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Sat, 18 May 2019 13:30:07 -0500
Message-Id: <20190518183009.13359-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190518183009.13359-1-pierre-louis.bossart@linux.intel.com>
References: <20190518183009.13359-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, Sathya Prakash M R <sathya.prakash.m.r@intel.com>,
 broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 1/3] ASoC: Intel: sof-rt5682: Few minor fixes
	for AMP SSP and codec button
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Sathya Prakash M R <sathya.prakash.m.r@intel.com>

    This fixes:
    1. BIT mask for AMP SSP was incorrect.
    2. The RT5682 codec button mapping is corrected.

Signed-off-by: Sathya Prakash M R <sathya.prakash.m.r@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index f28fb98cc306..e441dc979966 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -29,9 +29,10 @@
 #define SOF_RT5682_MCLK_EN			BIT(3)
 #define SOF_RT5682_MCLK_24MHZ			BIT(4)
 #define SOF_SPEAKER_AMP_PRESENT		BIT(5)
-#define SOF_RT5682_SSP_AMP(quirk)		((quirk) & GENMASK(8, 6))
-#define SOF_RT5682_SSP_AMP_MASK			(GENMASK(8, 6))
 #define SOF_RT5682_SSP_AMP_SHIFT		6
+#define SOF_RT5682_SSP_AMP_MASK                 (GENMASK(8, 6))
+#define SOF_RT5682_SSP_AMP(quirk)	\
+	(((quirk) << SOF_RT5682_SSP_AMP_SHIFT) & SOF_RT5682_SSP_AMP_MASK)
 
 /* Default: MCLK on, MCLK 19.2M, SSP0  */
 static unsigned long sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
@@ -144,9 +145,9 @@ static int sof_rt5682_codec_init(struct snd_soc_pcm_runtime *rtd)
 	jack = &ctx->sof_headset;
 
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOLUMEUP);
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
 	ret = snd_soc_component_set_jack(component, jack, NULL);
 
 	if (ret) {
@@ -519,6 +520,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	/* compute number of dai links */
 	sof_audio_card_rt5682.num_links = 1 + dmic_num + hdmi_num;
+
 	if (sof_rt5682_quirk & SOF_SPEAKER_AMP_PRESENT)
 		sof_audio_card_rt5682.num_links++;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
