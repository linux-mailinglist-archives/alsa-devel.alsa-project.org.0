Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C0C8C0BC3
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 08:53:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 029B3839;
	Thu,  9 May 2024 08:53:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 029B3839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715237622;
	bh=RVNDo+PUPNeV1sa0OC/s/rwZqNAdhw3yPx+40/ruZ0I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PFvpZLahR1Yp9F/lETqYAI7ZoG0EmEhPWUFNTbTfFgYGZSoiI7XEesSZTtpFtghDq
	 E9kxBbBga3oCX6HFgZRaZNqju04Wd7VEXAOptqCx0nJ7AMwlqQVH7/X/VWFu8IGkd5
	 Ji9BZ4ZBbtw2iflkNnCvG4r76Z/IUiczWkQThWwE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD307F805F7; Thu,  9 May 2024 08:52:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15F1AF805F1;
	Thu,  9 May 2024 08:52:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9EF7F805C7; Thu,  9 May 2024 08:52:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56B9EF804E7
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 08:52:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56B9EF804E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=T7i/eeCj
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a59a8f0d941so116291966b.2
        for <alsa-devel@alsa-project.org>;
 Wed, 08 May 2024 23:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715237529; x=1715842329;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sm/iyvA/oRf8IDDwCG6199y51shfGYvzaBKbXuvmT5Q=;
        b=T7i/eeCj0uNrf/mh5YBiCbIUiW2sD9vC4R8f2d36hWZVkY9frlxGfQAyJ/BPC733W1
         yUcudJ1v7Nx2UvepZoE4/iwufj9MzFNzq7NH2JX2G/xmN+Msj9AQezk0XusqeTZESEIb
         tCrjSualAYjAzvBSZXPV74mSyWl+V/X84ieuow4Ox1crIJg7KlOQ9Qz+6u4NBFxuIhn3
         57tM7Fd/d1pvYg8sOcv/Y5qa9RXtafXP00oZUz8mO/s7z+RRNv/ROFqoish1RHGP2dSt
         LjGC/SLpMuADttdlupScdy5jVWqot3p2qx6pCg42I1lVPsiBGbAWm5YiHCHESWRvyF1z
         RhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715237529; x=1715842329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sm/iyvA/oRf8IDDwCG6199y51shfGYvzaBKbXuvmT5Q=;
        b=OBfWOm06HAiYWWhHjCpJK1O4/3Uiu+HV2i0F5CFrUpB9uAmazxrkU1rjbLtXWewYSr
         wdQOA9zPjeZzVff2596gyIL0+dsJtN5nzwjGT85WttLAuU8g/YwVurEXKm64C7Du+FBW
         6w6T8nV6VCAkKOCqBsr9ZQLKQGG3QwwkuqhOxCpYt+U565Y20FiH4OncfRJw3cJux2ff
         GPkpoDUC46xGWxjrvlxdLZJUEf1S9ra4PKzk0Qzv2mc+t0sBYOB5dEnQMx6h4k6diM7W
         L07uvdKblFwrT2VG8HMr6BU7Cz6tZ50AvX1GdRttJeprhZwIZWJjNB/aLI7VU32CUChw
         Aj/Q==
X-Gm-Message-State: AOJu0Ywt6WR8CUUEPmsIdX5x9Wn0zc7K/CAY5zx9X3NjF4LmyR9N8E+x
	VAvB6dSQPI31s9jGwicmFNULxAlUFAyd8blus2kKSfo/hsbTkmP9mmLAiGPxrJU=
X-Google-Smtp-Source: 
 AGHT+IEMC0ilJJg70QPm8lCy30IW4I4keeEdeUIMfIvXhDrQwwAW7AyVSUXqZdNZWj/o+Uu0TeE/GQ==
X-Received: by 2002:a17:906:4f90:b0:a55:9dec:355f with SMTP id
 a640c23a62f3a-a59fb9f33ebmr248070566b.70.1715237529734;
        Wed, 08 May 2024 23:52:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c81b4sm40730966b.113.2024.05.08.23.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 23:52:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 09 May 2024 08:51:55 +0200
Subject: [PATCH v3 4/4] ASoC: qcom: x1e80100: Correct channel mapping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240509-asoc-x1e80100-4-channel-mapping-v3-4-6f874552d7b2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=RVNDo+PUPNeV1sa0OC/s/rwZqNAdhw3yPx+40/ruZ0I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmPHKQ6q9dlK6QeYXKuhYX2fKXvqRW/b0nGYjRh
 2E7JweWLsOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjxykAAKCRDBN2bmhouD
 1ykRD/9phzYxpFTOlOqgN9zWlD7Rfrfe3bxuQU5kFU+icEpDFo8F2hCsSFLI6uQ4Z2cf41uaO/8
 g+xLf4Xze1eJsiPrInQunZIDKmC4SmmNTgLUYEr8fz9Y4ZVy598pMWb7OwcaIJgz0bF2x8YlvJ6
 l0uTy0KvJsjOgob1sCevdxjc+fOIrsMhCJj6HkwiZqKqkG97A+/hywM1gUietOPg7RoLBIxTpBv
 Dcgthuky0Tx2XwVYvJVnvpJkGfxsZeNFe4vsd5+i4ssCusVsceNk5MnyuKRs0qLvG5t9MB+61Vr
 x9h3Sq22Zh0wzNINkwmeAWFgxUp4YoFi2IeppBIMeGNAC9PulfGEXkA7KtNBA7YrWm+9dEbpZNA
 H0H69uHC2QLIVM35t9oW2CBABgYrBA9HIfHMPR6lse8TYEtE0tQLQd6JS6EqOYNPYqxcgcUIEQL
 qgtWHgYcVkAwbSQS9aJRA8A729jSf6ilIVP9e9K0LumKdC8lrf1Ivt1q4UmK24EAZLspjfKazFM
 EUJWFcCP7h3y/S3Q3jHZmOHv68J6EEN6v5ZjLBvGA/yEaOIRMKPr6y8Q7zpLsJzIhpcC8IFNhUa
 uHVltcm89oAAtDJ8TCAWRvRSBfp7qNuORz2hIsR60MQ5tf4Z6A7/1uDaLsNKw35Gz/p0BBty/Dz
 NFTTxIY5KEnSu1g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: JZJMNS4ZKWBZDXAF4ZDWKYP4MTPXGEPH
X-Message-ID-Hash: JZJMNS4ZKWBZDXAF4ZDWKYP4MTPXGEPH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JZJMNS4ZKWBZDXAF4ZDWKYP4MTPXGEPH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

X1E80100 CRD board comes with four speakers arranged as left front+back
and then right front+back.  Using default channel mapping causes front
right speaker to play left back stream.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Rework significantly, because only backend DAIs is now affected.
---
 sound/soc/qcom/x1e80100.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index c3c8bf7ffb5b..27f34c0873ab 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -12,6 +12,7 @@
 
 #include "common.h"
 #include "qdsp6/q6afe.h"
+#include "qdsp6/q6dsp-common.h"
 #include "sdw.h"
 
 struct x1e80100_snd_data {
@@ -80,6 +81,23 @@ static int x1e80100_snd_prepare(struct snd_pcm_substream *substream)
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
+	const unsigned int rx_slot[4] = { PCM_CHANNEL_FL,
+					  PCM_CHANNEL_LB,
+					  PCM_CHANNEL_FR,
+					  PCM_CHANNEL_RB };
+	int ret;
+
+	switch (cpu_dai->id) {
+	case WSA_CODEC_DMA_RX_0:
+	case WSA_CODEC_DMA_RX_1:
+		ret = snd_soc_dai_set_channel_map(cpu_dai, 0, NULL,
+						  ARRAY_SIZE(rx_slot), rx_slot);
+		if (ret)
+			return ret;
+		break;
+	default:
+		break;
+	}
 
 	return qcom_snd_sdw_prepare(substream, sruntime,
 				    &data->stream_prepared[cpu_dai->id]);

-- 
2.43.0

