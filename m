Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F70F2AFAA9
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Nov 2020 22:43:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2D3817A4;
	Wed, 11 Nov 2020 22:42:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2D3817A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605131029;
	bh=B/EC/SW4GXpzYjKHFLZWTE7a6sGiybO6MtEBiqxWx/0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C+wAi2B04elBhHH+Yg8hwflCr5zXlxOD34CJ+2h1TN2EaK5SWU4Gx7jaE1nWcx/pF
	 Klkg1agoUMuw3hBAvHkW0omJyuiptyVaKiJt2DC8h8Kdrq38Deziv4a97B8Ir8dzAh
	 0ZM+L3zfSifrFNqBGIGzRZiZyIIzN5wDeeAXMJTo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C7F7F800AE;
	Wed, 11 Nov 2020 22:42:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68D7FF8020C; Wed, 11 Nov 2020 22:42:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from host.euro-space.net (host.euro-space.net [87.117.239.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84A8DF800AE
 for <alsa-devel@alsa-project.org>; Wed, 11 Nov 2020 22:42:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84A8DF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=birdec.com header.i=@birdec.com
 header.b="AAvQh4nh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=birdec.com; 
 s=default;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c0v6F6riTiMwK0+lQUA1qG9pskhNM22jO/yrK0zcXoA=; b=AAvQh4nhK5y9ZaSiRygevsE3tG
 CIB8uFkZ9K/g9OZm3a9rqHKKUqAjVu5qZV8K/aAjF+x2boX9S28nTwy6LMwew5ENEIz1HdyGQ5Hti
 yX9nznoPY6FiUXLILAcF/ZBBI/YCMUtu0S9kXtEBvLmatw3HffHAq1v2z2ICDrkviq1NsiSqC4xce
 EOMf/cQBVTXCD+NZ3tS2TDBj8CvhLmNF+NMgzE63GKKUIvNLDVIV6tM2gzkNlsFpZ/CQxJEklFaHL
 8FSe1PFV0rDw1Ro4rW0HaiijSIE6XH5myt9XcbVL3xPwlLKnsRp803zTKnmlI+zC4KrVrV4RJse+T
 wYwA92Gg==;
Received: from dynamic-078-055-099-142.78.55.pool.telefonica.de
 ([78.55.99.142]:59892 helo=gentoo0.localdomain)
 by host.euro-space.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <kmarinushkin@birdec.com>)
 id 1kcxsS-00074F-D7; Wed, 11 Nov 2020 21:42:04 +0000
From: Kirill Marinushkin <kmarinushkin@birdec.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH v2] ASoC: pcm512x: Add support for more data formats
Date: Wed, 11 Nov 2020 22:43:15 +0100
Message-Id: <20201111214315.26687-1-kmarinushkin@birdec.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <690508c7-7029-6781-a1a2-0609e37cb9e6@ti.com>
References: <690508c7-7029-6781-a1a2-0609e37cb9e6@ti.com>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - host.euro-space.net
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - birdec.com
X-Get-Message-Sender-Via: host.euro-space.net: authenticated_id:
 kmarinushkin@birdec.com
X-Authenticated-Sender: host.euro-space.net: kmarinushkin@birdec.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: Matthias Reichl <hias@horus.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kirill Marinushkin <kmarinushkin@birdec.com>
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

Currently, pcm512x driver supports only I2S data format.
This commit adds RJ, LJ, DSP_A and DSP_B as well.

I don't expect regression WRT existing sound cards, because:

* default value in corresponding register of pcm512x codec is 0 ==  I2S
* existing in-tree sound cards with pcm512x codec are configured for I2S
* i don't see how existing off-tree sound cards with pcm512x codec could be
  configured differently - it would not work
* tested explicitly, that there is no regression with Raspberry Pi +
  sound card `sound/soc/bcm/hifiberry_dacplus.c`

Signed-off-by: Kirill Marinushkin <kmarinushkin@birdec.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Matthias Reichl <hias@horus.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
---
 sound/soc/codecs/pcm512x.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index 8153d3d01654..e309227649e7 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -1167,6 +1167,8 @@ static int pcm512x_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 	int alen;
+	int afmt;
+	int offset = 0;
 	int gpio;
 	int clock_output;
 	int master_mode;
@@ -1195,6 +1197,28 @@ static int pcm512x_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
+	switch (pcm512x->fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		afmt = PCM512x_AFMT_I2S;
+		break;
+	case SND_SOC_DAIFMT_RIGHT_J:
+		afmt = PCM512x_AFMT_RTJ;
+		break;
+	case SND_SOC_DAIFMT_LEFT_J:
+		afmt = PCM512x_AFMT_LTJ;
+		break;
+	case SND_SOC_DAIFMT_DSP_A:
+		offset = 1;
+		fallthrough;
+	case SND_SOC_DAIFMT_DSP_B:
+		afmt = PCM512x_AFMT_DSP;
+		break;
+	default:
+		dev_err(component->dev, "unsupported DAI format: 0x%x\n",
+			pcm512x->fmt);
+		return -EINVAL;
+	}
+
 	switch (pcm512x->fmt & SND_SOC_DAIFMT_MASTER_MASK) {
 	case SND_SOC_DAIFMT_CBS_CFS:
 		ret = regmap_update_bits(pcm512x->regmap,
@@ -1236,6 +1260,20 @@ static int pcm512x_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
+	ret = regmap_update_bits(pcm512x->regmap, PCM512x_I2S_1,
+				 PCM512x_AFMT, afmt);
+	if (ret != 0) {
+		dev_err(component->dev, "Failed to set data format: %d\n", ret);
+		return ret;
+	}
+
+	ret = regmap_update_bits(pcm512x->regmap, PCM512x_I2S_2,
+				 0xFF, offset);
+	if (ret != 0) {
+		dev_err(component->dev, "Failed to set data offset: %d\n", ret);
+		return ret;
+	}
+
 	if (pcm512x->pll_out) {
 		ret = regmap_write(pcm512x->regmap, PCM512x_FLEX_A, 0x11);
 		if (ret != 0) {
-- 
2.13.6

