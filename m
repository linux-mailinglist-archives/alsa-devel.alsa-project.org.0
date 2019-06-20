Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDF14CAD9
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2019 11:29:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE295167C;
	Thu, 20 Jun 2019 11:28:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE295167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561022945;
	bh=mRpTwQDQE160y8LLUDmmIIrbE1q/Rjsum+NgVAXNlQ4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D/ZzjNGKKq/mFOXnnnB1qNC6cX5B11c72qSc/2cVu4qzdKenhVIVKA1rDL8ShqBAH
	 8lqx4fGJ/C0r/ujvFFmYAk4Y2xSLs4jHvtmYLsp+Z6Iq7lRGeWB1MBhieIYUXyaWHQ
	 IdsCZ+DzJw5ooRGK0X0ZYFu0VyR4V7A84yLnLYCA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3518AF89733;
	Thu, 20 Jun 2019 11:26:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B989F89726; Thu, 20 Jun 2019 11:26:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37BD0F89730
 for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2019 11:26:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37BD0F89730
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oAThmCDz"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5K9QQje104807;
 Thu, 20 Jun 2019 04:26:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1561022786;
 bh=fjSRUBnPp+e697Nq4EEWOicmkYHRTye8b7EDJe0bHeg=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=oAThmCDzwJCFIqHduuXlpzU2A0P0iJgAjrCI5q67jyooU8Idb5uMQ267499iyZvIU
 twzZfc/SKnbv4DOAYI8x8B0HCN1hDvK3Ra0If9qGb/agvxgG3Mq+u4Nwh4w4XeJ/qn
 cXopSEIvQaHORmYZAJQNTDvlWv99gK1Tz5GOniTE=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5K9QQ6S052898
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 20 Jun 2019 04:26:26 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 20
 Jun 2019 04:26:24 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 20 Jun 2019 04:26:24 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5K9QJ0s061353;
 Thu, 20 Jun 2019 04:26:23 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Thu, 20 Jun 2019 12:26:56 +0300
Message-ID: <20190620092656.14759-3-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190620092656.14759-1-peter.ujfalusi@ti.com>
References: <20190620092656.14759-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com
Subject: [alsa-devel] [PATCH 2/2] ASoC: pcm3168a: Add support for multi
	DIN/DOUT with TDM slots parameter
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

The driver was wired to be only usable in DIN1/DOUT1 mode, switching
between TDM and non TDM modes based on the number of channels.

While keeping this functionality for compatibility add support for using
all DIN1/2/3/4 and DOUT1/2/3 if it is needed by setting the TDM slots to
2.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 sound/soc/codecs/pcm3168a.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index 861d24cc002e..f1104d7d6426 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -408,9 +408,11 @@ static int pcm3168a_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 		return -EINVAL;
 	}
 
-	pcm3168a->tdm_slots = slots;
-	pcm3168a->tdm_mask[SNDRV_PCM_STREAM_PLAYBACK] = tx_mask;
-	pcm3168a->tdm_mask[SNDRV_PCM_STREAM_CAPTURE] = rx_mask;
+	if (pcm3168a->tdm_slots && pcm3168a->tdm_slots != slots) {
+		dev_err(component->dev, "Not matching slots %d vs %d\n",
+			pcm3168a->tdm_slots, slots);
+		return -EINVAL;
+	}
 
 	if (pcm3168a->slot_width && pcm3168a->slot_width != slot_width) {
 		dev_err(component->dev, "Not matching slot_width %d vs %d\n",
@@ -418,7 +420,11 @@ static int pcm3168a_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 		return -EINVAL;
 	}
 
+	pcm3168a->tdm_slots = slots;
 	pcm3168a->slot_width = slot_width;
+	pcm3168a->tdm_mask[SNDRV_PCM_STREAM_PLAYBACK] = tx_mask;
+	pcm3168a->tdm_mask[SNDRV_PCM_STREAM_CAPTURE] = rx_mask;
+
 	return 0;
 }
 
@@ -431,11 +437,10 @@ static int pcm3168a_hw_params(struct snd_pcm_substream *substream,
 	bool tx, master_mode;
 	u32 val, mask, shift, reg;
 	unsigned int rate, fmt, ratio, max_ratio;
-	unsigned int chan;
+	unsigned int tdm_slots;
 	int i, slot_width;
 
 	rate = params_rate(params);
-	chan = params_channels(params);
 
 	ratio = pcm3168a->sysclk / rate;
 
@@ -492,8 +497,20 @@ static int pcm3168a_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	/* for TDM */
-	if (chan > 2) {
+	if (pcm3168a->tdm_slots)
+		tdm_slots = pcm3168a->tdm_slots;
+	else
+		tdm_slots = params_channels(params);
+
+	/*
+	 * Switch the codec to TDM mode when more than 2 TDM slots are needed
+	 * for the stream.
+	 * If pcm3168a->tdm_slots is not set or set to more than 2 (8/6 usually)
+	 * then DIN1/DOUT1 is used in TDM mode.
+	 * If pcm3168a->tdm_slots is set to 2 then DIN1/2/3/4 and DOUT1/2/3 is
+	 * used in normal mode, no need to switch to TDM modes.
+	 */
+	if (tdm_slots > 2) {
 		switch (fmt) {
 		case PCM3168A_FMT_I2S:
 		case PCM3168A_FMT_DSP_A:
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
