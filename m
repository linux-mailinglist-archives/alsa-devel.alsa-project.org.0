Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C56E8C0BC6
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 08:55:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5865AE67;
	Thu,  9 May 2024 08:55:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5865AE67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715237737;
	bh=d+whTvaCUFBkWJxrgaqvE8kSJoAykKqRo1KOv90DlbU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u82xLGLUvsaQL4R9djpGxTO2J6eYM0uH1+QOgWsQBqEUUmfXbZH/gZiaxm9AT3PMg
	 LXta8jyosaa80c0zijtUQVXiCBgvD80qG/5l6sOcdTpgTDxOjcH6B9hgxkIiF4Gsur
	 zdihQQ+lRY8Dgy4aKTuaiWrPcRCbmC0w3wgZ4Fzk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 896DAF805D3; Thu,  9 May 2024 08:55:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3748AF805C1;
	Thu,  9 May 2024 08:55:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40A37F804E7; Thu,  9 May 2024 08:54:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE717F804F2
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 08:52:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE717F804F2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=KFwEvJif
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a59a352bbd9so98722866b.1
        for <alsa-devel@alsa-project.org>;
 Wed, 08 May 2024 23:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715237526; x=1715842326;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0J7Cge03mHzKytqfe46M5SWmiJDYT6L/0iD5WUZ2XNk=;
        b=KFwEvJifuQtF0UcMa6m2IKovUd2iAUShASefqzsGnu1It5Xb6xgAopkE8qqVFYpHjE
         esCGZwMncROqrtnQ3ypQ7+ujhCmHRuu4i8Bu2OniCB9kbic1eo0x/9lUeAQamKJuAtkC
         mHxp1AmST/LillC5nQLTxEOr18I0sy8bRnQpAUI8F2qlbmLkIVRuecKG1h9QXnv+Nnk/
         aXrVYUYEJLgthUa08mJhWM/6o/mggWHBM3E1VZVNUYAnJvCDKDqnR8d9fpaJ2U6Nq5kr
         AJKms27vEgg+oCq2dl3Ht3x5dRN3cXgjjJDiMsdNWef+Q9hbhI3vpNBR1MYMGMhF0J/j
         a3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715237526; x=1715842326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0J7Cge03mHzKytqfe46M5SWmiJDYT6L/0iD5WUZ2XNk=;
        b=sNBMT+dQj2C0CwvnMm3O3IsnGCe+lcN2CqNib+Ie9KX5GvgjdtG2ln6VWNXHgABIML
         /nEpCo6m+4OXq6j957FGQefjGxzSPW1MBUTAcfvCQnENdZAGTtYpkImvo5JJj3C0oGRo
         CAi5nRQClex7Q5rm5yWH2Tj2UdtQ2o/DXH12jsFIo5Kd/sC8zBfSbj8TpovWEsjT6TC9
         iiS8C3ISuv3MAvk5hGOyNRJMGlmbJc9zmPbdTUX5+qhPO/Ua+jluycx2NyCw5mdRLKdi
         ZwskMDszOCtSi6wmGFpEUasX7awAuJcXColtjp5ivpu9SMN+r6sgXqbzpisNJvCXRyvE
         KE6w==
X-Gm-Message-State: AOJu0YzINBn0C+wIL2RHazgcUi4umLFwbPd+M1cIQpfQjZuuEtyD6b4o
	4RootgnkqOtslWOzxz76j/VIc/oP2oT0KoN9msjlCKFso179s5M01wZYWk3kdDs=
X-Google-Smtp-Source: 
 AGHT+IH4IKNh6xpMCbzmAZuvEhTaQU2/vdq+j0ULoUFdsjxmj+MDwNstEIfCxKnQbGOb9UNNxYbSYw==
X-Received: by 2002:a17:906:1d59:b0:a59:bf27:5f2e with SMTP id
 a640c23a62f3a-a5a11682723mr138739566b.20.1715237526603;
        Wed, 08 May 2024 23:52:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c81b4sm40730966b.113.2024.05.08.23.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 23:52:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 09 May 2024 08:51:53 +0200
Subject: [PATCH v3 2/4] ASoC: qcom: q6apm-lpass-dais: Implement proper
 channel mapping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240509-asoc-x1e80100-4-channel-mapping-v3-2-6f874552d7b2@linaro.org>
References: 
 <20240509-asoc-x1e80100-4-channel-mapping-v3-0-6f874552d7b2@linaro.org>
In-Reply-To: 
 <20240509-asoc-x1e80100-4-channel-mapping-v3-0-6f874552d7b2@linaro.org>
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2494;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=d+whTvaCUFBkWJxrgaqvE8kSJoAykKqRo1KOv90DlbU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmPHKObjbPYBWnxiwlH8jsOSlJbKFmyvJBSfmlT
 eN8kByPWESJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjxyjgAKCRDBN2bmhouD
 18JbD/9TSwfYyfYQp7SbyFFtB/5vWzBB/5ob3Y49B4bnnmlY5PltbLl93/4+Yo1P7bJxbIEldpF
 w8rMSBJ3btQPJh/NCLQ3Q0+smAbIGO6JXLsSc5FqeZOz+wWRCkw4DCWOkSvDsNnFBsYM+JKe8e0
 FDwkrk/jt42QYhs9hq+Hga75z9QhSPDU7q/6at15xDiHzWTfNik8p3omeqXPPmJPe2YADmunJnV
 +h1LszPO9ae3mYoMXWTNVS48xHMAXZt0uDZcVXGTjB9R0Qk7/pBM6vSBufclDHu6VHBVGvAxe5O
 oSGbc+LyG1d+cqETUS8wmQMwcATzOF8VV061XMZ3nzA3x9HzvRg/+Mc+0SnlVmHbps+RqfHfGEh
 csSEq3Mu7t7Q+udgVovepeUAdgNRar7Lkz/AGPEsZ8DGtwJJedYTlLqtBqJrf/UYL+SYVHJfNAl
 KFOMFaUdDXtPmKaelga4R7Xb6xYbBdJWL4MNtw9LTbAyejDa6lJfHPt7Pz5FxV/YQYwIdDdoa0Q
 LD7BLTTFSHNZFsBoi/h1Bon/WIDdjRqYJfjds+7DT9fGqvO1ifHLM2Q57Vqu7fyUfgCcXMwjt2F
 1xPzwJbvAOGt+AiopgDaCB3s8DyqvXTUH1r1zed9B8bpSRrvlCNBzC/beCkYB0Q+mA0py9InfEZ
 jtI6YUTw1yQnUiw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: SSB5XXIS2IJFDAHJSYSZXUC64KWVJHMI
X-Message-ID-Hash: SSB5XXIS2IJFDAHJSYSZXUC64KWVJHMI
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SSB5XXIS2IJFDAHJSYSZXUC64KWVJHMI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The set_channel_map() implementation in q6apm-lpass-dais driver was
copying older pre-Audioreach code from q6afe-dai driver, but not really
using it.  The code sets active channel mask based on passed channel
mapping, but Audioreach code does not use that mask ever.  Audioreach
module configuration does have on the other hand proper channel mapping
field, which should supersed that active channel mask.

Drop the unused active channel mask and implement proper mapping of
channels in q6apm-lpass-dais driver.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Entirely replaced - now channel mapping is implemented in
   q6apm-lpass-dais.
---
 sound/soc/qcom/qdsp6/audioreach.h       |  1 -
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 10 +++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 2c82917b7162..eb9306280988 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -755,7 +755,6 @@ struct audioreach_module_config {
 
 	u16	data_format;
 	u16	num_channels;
-	u16	active_channels_mask;
 	u16	dp_idx;
 	u32	channel_allocation;
 	u32	sd_line_mask;
diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 6bfbb52345e1..a4ad1d0e6abd 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -33,7 +33,7 @@ static int q6dma_set_channel_map(struct snd_soc_dai *dai,
 
 	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
 	struct audioreach_module_config *cfg = &dai_data->module_config[dai->id];
-	int ch_mask;
+	int i;
 
 	switch (dai->id) {
 	case WSA_CODEC_DMA_TX_0:
@@ -58,7 +58,8 @@ static int q6dma_set_channel_map(struct snd_soc_dai *dai,
 				tx_num);
 			return -EINVAL;
 		}
-		ch_mask = *tx_ch_mask;
+		for (i = 0; i < tx_num; i++)
+			cfg->channel_map[i] = tx_ch_mask[i];
 
 		break;
 	case WSA_CODEC_DMA_RX_0:
@@ -81,7 +82,8 @@ static int q6dma_set_channel_map(struct snd_soc_dai *dai,
 				rx_num);
 			return -EINVAL;
 		}
-		ch_mask = *rx_ch_mask;
+		for (i = 0; i < rx_num; i++)
+			cfg->channel_map[i] = rx_ch_mask[i];
 
 		break;
 	default:
@@ -90,8 +92,6 @@ static int q6dma_set_channel_map(struct snd_soc_dai *dai,
 		return -EINVAL;
 	}
 
-	cfg->active_channels_mask = ch_mask;
-
 	return 0;
 }
 

-- 
2.43.0

