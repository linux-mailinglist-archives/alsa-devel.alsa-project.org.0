Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DA33DEB39
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Aug 2021 12:50:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00E08174E;
	Tue,  3 Aug 2021 12:49:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00E08174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627987836;
	bh=fj6VrdDKjYBr2H5V3uMn7tn4OrRRIu7fZlp2V/muoo8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TWiqG/gMFVb/HfwLKRHK0L4txB5D2v0I6rTs0b8rPD7BeAQ5tv+sttiNU/QHqUVod
	 Po7wjHK6J6MOyy23hDllghlVRaASXtRsNP09igh7OUjBZC6gjX46Te6fpAU6HPOiNr
	 0E/4dXk6Timl5MHg2jVnFxe5da7z2sAIL0nmOt2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 583CEF8032C;
	Tue,  3 Aug 2021 12:49:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76564F802E8; Tue,  3 Aug 2021 12:49:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FA27F8014D
 for <alsa-devel@alsa-project.org>; Tue,  3 Aug 2021 12:48:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FA27F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="oHG9HVmi"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627987735; x=1659523735;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fj6VrdDKjYBr2H5V3uMn7tn4OrRRIu7fZlp2V/muoo8=;
 b=oHG9HVmiZ4e/y8n8KKTmsrjucATDrDmhtOk5vxWcs1AAN1He2ICPpxgO
 Qs0eVpfoKeQuUWwdTQc4TSECvWm9/P8zKcYFcS6uyCfG6Ru8E8D1JhUAC
 +TfW0vmqJGLfuRR1XA4EmtcYaC/oLZ5MtYobafDBI42g7EyjTH4/OaruV
 /rIfA/MlT+xltbeHZzUe+hv917/gmyVYh92fb8A+k6rrnxAN92p6kbqCL
 rHiE8KfdKDx6WpLSSI7ZDcMEoglWj8tRJdbIc9/3rJh2pWCyJajMHJk6W
 xzWIFV09zk7DKmVC8RFwWM5BCJge2Hg3uuc1e4C2wXrN5Ha7zVLqDgGb4 A==;
IronPort-SDR: PZq8oaW6WFOnm+2gnd2jHrNrXcYAocTi1kJ3EP1MCTruJB5SmPyomzXQYjEA6aoUdOPtQ4FeO+
 m3ITu9zThV2uo56JvunytmOHkrHsob/9NuRvvW5m7utOrMTIaBUGHJZI4mC1MEjObXce+CeOqP
 ViN4PCWxqxD56expqNJyfwl6Lsp4zBrpKk0CIaUi1JWUJI0olx6BZMq1pTiOj1oDLGQL91ZnhP
 NycgXp+VWw5Z1B3VzMOyW6KRe34qxkD/yO6ehGB6hPclVt47dZ7YmFJUJL2bAVDrDztBwt1dxH
 ackwuIi8aJw7pKL3+7gFnXab
X-IronPort-AV: E=Sophos;i="5.84,291,1620716400"; d="scan'208";a="126895967"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Aug 2021 03:48:49 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 3 Aug 2021 03:48:48 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 3 Aug 2021 03:48:45 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: codecs: ad193x: add support for 96kHz and 192kHz
 playback rates
Date: Tue, 3 Aug 2021 13:48:25 +0300
Message-ID: <20210803104825.2198335-1-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: lars@metafoo.de, lgirdwood@gmail.com, nicolas.ferre@microchip.com,
 tiwai@suse.com, broonie@kernel.org,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, nuno.sa@analog.com
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

ad193x devices support 96KHz and 192KHz sampling rates, when PLL/MCLK is
referenced to 48kHz.
Tested on ad1934.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
 sound/soc/codecs/ad193x.c | 30 ++++++++++++++++++++++++++++--
 sound/soc/codecs/ad193x.h |  4 ++++
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/ad193x.c b/sound/soc/codecs/ad193x.c
index f37ab7eda615..278a55af158b 100644
--- a/sound/soc/codecs/ad193x.c
+++ b/sound/soc/codecs/ad193x.c
@@ -316,6 +316,13 @@ static int ad193x_hw_params(struct snd_pcm_substream *substream,
 	int word_len = 0, master_rate = 0;
 	struct snd_soc_component *component = dai->component;
 	struct ad193x_priv *ad193x = snd_soc_component_get_drvdata(component);
+	bool is_playback = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	u8 dacc0;
+
+	dev_dbg(dai->dev, "%s() rate=%u format=%#x width=%u channels=%u\n",
+		__func__, params_rate(params), params_format(params),
+		params_width(params), params_channels(params));
+
 
 	/* bit size */
 	switch (params_width(params)) {
@@ -346,6 +353,25 @@ static int ad193x_hw_params(struct snd_pcm_substream *substream,
 		break;
 	}
 
+	if (is_playback) {
+		switch (params_rate(params)) {
+		case 48000:
+			dacc0 = AD193X_DAC_SR_48;
+			break;
+		case 96000:
+			dacc0 = AD193X_DAC_SR_96;
+			break;
+		case 192000:
+			dacc0 = AD193X_DAC_SR_192;
+			break;
+		default:
+			dev_err(dai->dev, "invalid sampling rate: %d\n", params_rate(params));
+			return -EINVAL;
+		}
+
+		regmap_update_bits(ad193x->regmap, AD193X_DAC_CTRL0, AD193X_DAC_SR_MASK, dacc0);
+	}
+
 	regmap_update_bits(ad193x->regmap, AD193X_PLL_CLK_CTRL0,
 			    AD193X_PLL_INPUT_MASK, master_rate);
 
@@ -385,7 +411,7 @@ static struct snd_soc_dai_driver ad193x_dai = {
 		.stream_name = "Playback",
 		.channels_min = 2,
 		.channels_max = 8,
-		.rates = SNDRV_PCM_RATE_48000,
+		.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_192000,
 		.formats = SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S16_LE |
 			SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S24_LE,
 	},
@@ -407,7 +433,7 @@ static struct snd_soc_dai_driver ad193x_no_adc_dai = {
 		.stream_name = "Playback",
 		.channels_min = 2,
 		.channels_max = 8,
-		.rates = SNDRV_PCM_RATE_48000,
+		.rates = SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_192000,
 		.formats = SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_S16_LE |
 			SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S24_LE,
 	},
diff --git a/sound/soc/codecs/ad193x.h b/sound/soc/codecs/ad193x.h
index 377854712c20..61f4648861d5 100644
--- a/sound/soc/codecs/ad193x.h
+++ b/sound/soc/codecs/ad193x.h
@@ -37,6 +37,10 @@ int ad193x_probe(struct device *dev, struct regmap *regmap,
 #define AD193X_PLL_CLK_SRC_MCLK	(1 << 1)
 #define AD193X_DAC_CTRL0        0x02
 #define AD193X_DAC_POWERDOWN           0x01
+#define AD193X_DAC_SR_MASK           0x06
+#define AD193X_DAC_SR_48	(0 << 1)
+#define AD193X_DAC_SR_96	(1 << 1)
+#define AD193X_DAC_SR_192	(2 << 1)
 #define AD193X_DAC_SERFMT_MASK		0xC0
 #define AD193X_DAC_SERFMT_STEREO	(0 << 6)
 #define AD193X_DAC_SERFMT_TDM		(1 << 6)
-- 
2.30.2

