Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEAC345D44
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 12:46:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06D72168D;
	Tue, 23 Mar 2021 12:45:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06D72168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616499991;
	bh=HUy9SuzJ1x+SoyTBE/9oxiQt7Vd1okainUo64cODfVY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J7m4cuW8itkUTm4Vlb/N+UqO/TRl2iMQipoBX7uyH4LVu9b6kvH1oRp5edDuUHgad
	 WZ0CJ0SX8xuyS0hLafyof6meceb7HM9X3/g3sNLtm6nNoQ9U5ejfBT+K9GfP+2LIrx
	 99oo0ATSjEmjVHXsHbrPvB01pixkpgUN6GUYySvA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85D5BF8049C;
	Tue, 23 Mar 2021 12:44:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49335F8042F; Tue, 23 Mar 2021 12:44:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 986A9F80279
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 12:44:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 986A9F80279
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="nCienpYj"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1616499842; x=1648035842;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HUy9SuzJ1x+SoyTBE/9oxiQt7Vd1okainUo64cODfVY=;
 b=nCienpYjJyc09QTtRGuvjvqcsea7VyM5oRBwL7fEuaEGV0dN//GEgvym
 YgDnI8NlZsbxRr9DM0MNCbg64O+98HeKNvectz/htFf+VCZHyZbiAsKE1
 nUSG0kqDIN8U+lYgalYj0QWGVLV3yHkUUX671c187IwbN6jbtqEHwbvLc
 rjeBqSH1huryOrlLlvv54/lqqEv80TUttjEjmd6/BZVwdjyZl5wEidGrU
 Df/Zu1AvAnNSfIssKY6Ua8Z9aU+3Wll1WsF4gut+6iLv3cF7c5MKnYdDR
 mv1ezBJGeFSAEMB1AhaB0/aDB/YyNmlFWIOCmw+R3D81UP7lFR4jMp91S Q==;
IronPort-SDR: MVAniebYcvsWxLwTvxXjqZa7Y1SrowUrybCZbN1JE+JZylWTioWDMb7DcOp2Tbyw1Lw1Wrb/ls
 HIBgtV84aLofnnTktzSur++2ycD/O6dEoHiFvNYxZw0wKLoG12O9wPwIBlqZS1+Bt6VDA43rmn
 6eiSFNFYFK77CnLOWVt0OgJIwjyb7mPOCokgutRLRmg92XqU4wMCP0jlnyrrtmJDeCRVbeY1uU
 xTMTDadkw5H0wOKdBfscchq+xkJ6mGGgrIQ4dCp7r50TEmp3EvexQyFwb1C35WSsdR5SqxNlib
 EU8=
X-IronPort-AV: E=Sophos;i="5.81,271,1610434800"; d="scan'208";a="111004697"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Mar 2021 04:43:59 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 23 Mar 2021 04:43:58 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 23 Mar 2021 04:43:55 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 3/3] ASoC: soc-pcm: apply BE HW constraint rules
Date: Tue, 23 Mar 2021 13:43:27 +0200
Message-ID: <20210323114327.3969072-4-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210323114327.3969072-1-codrin.ciubotariu@microchip.com>
References: <20210323114327.3969072-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: gustavoars@kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 mirq-linux@rere.qmqm.pl, broonie@kernel.org,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
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

Apply the HW constraint rules added by the BE DAIs. The constraint rules
are applied after the fixup is called for the HW parameters. This way, if
the HW parameters do not correspond with the HW capabilities, the
constraint rules will return an error. The mask and the interval
constraints are the same as the ones used for FE. The DAI link
dpcm_merged_* flags are used to check if the FE and BE must share the same
HW parameters.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
 include/sound/pcm.h     |  2 ++
 sound/core/pcm_native.c | 17 +++++++++++++----
 sound/soc/soc-pcm.c     | 30 ++++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 198d37d04d78..b56a4435439a 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -987,6 +987,8 @@ int snd_pcm_hw_rule_div(struct snd_pcm_hw_params *params,
 			struct snd_pcm_hw_rule *rule);
 
 int snd_pcm_hw_refine(struct snd_pcm_substream *substream, struct snd_pcm_hw_params *params);
+int constrain_params_by_rules(struct snd_pcm_substream *substream,
+			      struct snd_pcm_hw_params *params);
 
 int snd_pcm_hw_constraint_mask64(struct snd_pcm_runtime *runtime, snd_pcm_hw_param_t var,
 				 u_int64_t mask);
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index d6f14162bce5..2ff6e182c7f5 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -22,6 +22,7 @@
 #include <sound/pcm_params.h>
 #include <sound/timer.h>
 #include <sound/minors.h>
+#include <sound/soc.h>
 #include <linux/uio.h>
 #include <linux/delay.h>
 
@@ -326,11 +327,10 @@ static int constrain_interval_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int constrain_params_by_rules(struct snd_pcm_substream *substream,
-				     struct snd_pcm_hw_params *params)
+int constrain_params_by_rules(struct snd_pcm_substream *substream,
+			      struct snd_pcm_hw_params *params)
 {
-	struct snd_pcm_hw_constraints *constrs =
-					&substream->runtime->hw_constraints;
+	struct snd_pcm_hw_constraints *constrs;
 	unsigned int k;
 	unsigned int *rstamps;
 	unsigned int vstamps[SNDRV_PCM_HW_PARAM_LAST_INTERVAL + 1];
@@ -342,6 +342,14 @@ static int constrain_params_by_rules(struct snd_pcm_substream *substream,
 	bool again;
 	int changed, err = 0;
 
+	if (substream->pcm->internal) {
+		struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+
+		constrs = &rtd->dpcm[substream->stream].hw_constraints;
+	} else {
+		constrs = &substream->runtime->hw_constraints;
+	}
+
 	/*
 	 * Each application of rule has own sequence number.
 	 *
@@ -446,6 +454,7 @@ static int constrain_params_by_rules(struct snd_pcm_substream *substream,
 	kfree(rstamps);
 	return err;
 }
+EXPORT_SYMBOL(constrain_params_by_rules);
 
 static int fixup_unreferenced_params(struct snd_pcm_substream *substream,
 				     struct snd_pcm_hw_params *params)
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index dae246918e0d..5bd71d48c0de 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1934,11 +1934,25 @@ int dpcm_be_dai_hw_params(struct snd_soc_pcm_runtime *fe, int stream)
 		memcpy(&dpcm->hw_params, &fe->dpcm[stream].hw_params,
 				sizeof(struct snd_pcm_hw_params));
 
+		/* copy FE mask and interval constraints */
+		memcpy(&be->dpcm[stream].hw_constraints.masks,
+		       &be_substream->runtime->hw_constraints.masks,
+		       sizeof(be_substream->runtime->hw_constraints.masks));
+		memcpy(&be->dpcm[stream].hw_constraints.intervals,
+		       &be_substream->runtime->hw_constraints.intervals,
+		       sizeof(be_substream->runtime->hw_constraints.intervals));
+
 		/* perform any hw_params fixups */
 		ret = snd_soc_link_be_hw_params_fixup(be, &dpcm->hw_params);
 		if (ret < 0)
 			goto unwind;
 
+		/* apply constrain rules */
+		dpcm->hw_params.rmask = ~0U;
+		ret = constrain_params_by_rules(be_substream, &dpcm->hw_params);
+		if (ret < 0)
+			goto unwind;
+
 		/* copy the fixed-up hw params for BE dai */
 		memcpy(&be->dpcm[stream].hw_params, &dpcm->hw_params,
 		       sizeof(struct snd_pcm_hw_params));
@@ -2002,6 +2016,22 @@ static int dpcm_fe_dai_hw_params(struct snd_pcm_substream *substream,
 
 	memcpy(&fe->dpcm[stream].hw_params, params,
 			sizeof(struct snd_pcm_hw_params));
+	if (!fe->dai_link->dpcm_merged_format) {
+		snd_mask_any(hw_param_mask(&fe->dpcm[stream].hw_params,
+					   SNDRV_PCM_HW_PARAM_FORMAT));
+		snd_interval_any(hw_param_interval(&fe->dpcm[stream].hw_params,
+						   SNDRV_PCM_HW_PARAM_SAMPLE_BITS));
+		snd_interval_any(hw_param_interval(&fe->dpcm[stream].hw_params,
+						   SNDRV_PCM_HW_PARAM_FRAME_BITS));
+	}
+	if (!fe->dai_link->dpcm_merged_chan) {
+		snd_interval_any(hw_param_interval(&fe->dpcm[stream].hw_params,
+						   SNDRV_PCM_HW_PARAM_CHANNELS));
+	}
+	if (!fe->dai_link->dpcm_merged_rate) {
+		snd_interval_any(hw_param_interval(&fe->dpcm[stream].hw_params,
+						   SNDRV_PCM_HW_PARAM_RATE));
+	}
 	ret = dpcm_be_dai_hw_params(fe, stream);
 	if (ret < 0)
 		goto out;
-- 
2.27.0

