Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E61048BF853
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 10:19:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 638C1E9D;
	Wed,  8 May 2024 10:18:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 638C1E9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715156339;
	bh=RVNDo+PUPNeV1sa0OC/s/rwZqNAdhw3yPx+40/ruZ0I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QSDH79R1RWd7q9RgGKDUHLu6n+5f3y7xOzqeXRTHqFoAQHrIJy0nKbjLglQCcnZyL
	 Gx+5WkSWKQQSduvQ3lh6t0r+LuPgxWXPfBLGT07bGU6PZs2aNeepJRzVkvbh14taUk
	 Q1y5x4UiqgjGQWbXG5o/efKf/VcIvHFBzVPGQRBc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF2CFF805C6; Wed,  8 May 2024 10:18:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B85DBF805B3;
	Wed,  8 May 2024 10:18:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A73F6F80579; Wed,  8 May 2024 10:18:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5547AF804E7
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 10:16:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5547AF804E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gAz2NRI/
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a59ab4f60a6so877662166b.0
        for <alsa-devel@alsa-project.org>;
 Wed, 08 May 2024 01:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715156204; x=1715761004;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sm/iyvA/oRf8IDDwCG6199y51shfGYvzaBKbXuvmT5Q=;
        b=gAz2NRI/haef/eILVdyC/1a7y35XepEmxso/2/jfEZiXAdkUJcfsvsQc1u2yJFQfIq
         7Iz5E/zc4BVAVhCf48qPDDyta4H5QE0JbM4og+/uNIhxFNsI+xnzyRtkrIyBZa9YIUfx
         RQpxiFo7l3xUXiO2weY1uqWqEuGSczilsu7ENAsvhjw3Q5tWhRocMPL+1Ruzvrs7iJVC
         3/k8WRhcoA7WF2cvULAD+SrmsAG/yd+TRW7VTX1r6VluY9lSxXOCXbVOOCUPqiNcPcBC
         n2/U09JHhWO7II0spmH5p5LoUOk7bALEcQnYDdmUszulXX/vnuYf8pSjlhuVNxLsBfTp
         kgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715156204; x=1715761004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sm/iyvA/oRf8IDDwCG6199y51shfGYvzaBKbXuvmT5Q=;
        b=IewgVJpXfDIdwkdvWV5nXy/ssrYqiJWlyNcI5GwTQN9xrnMhEY6PjUGJGxhH1sFnfM
         lHw+/P5mdRe1TNvmXjyi6dv92kCHdKETO/7Y4ZdDhDQlbjUCoeLchQ8eb/miTEpN11cJ
         nua2B7UB0k2uWstCB8auNBd86drXQU0qs4rI4DSGREBwZPTFTlO0nILRG11OpWTAnVPG
         55DUleWSQUgKrtuI9bHCeDaSsH6eWEio25onW51cQ9+IFbzPQyMszZlIjdo+QQaHNKNC
         LQP5KKYFxHM5Ac7pUQDf4Z4v34sgEIrTiNI6tzKoPDfPkMVu8A/CzN08oAsaKOCX+GRw
         2RGA==
X-Gm-Message-State: AOJu0YwcINmtuTmV+K3haiNeZyQqgHbXwWHNldtoYyEy9HcpJBpvsY9W
	sbcdTGbA8TyGq2fLmBLybkqzWrtFwgrXq4J6OKieJZzcCG09XEj7EQzv5bgerj4=
X-Google-Smtp-Source: 
 AGHT+IEcO03sXS25ca8HNMd80x92ztrXnHCfFufNC3oFOema6hx6ZWP/GUScP9uFCp2eEtc5nFXxgw==
X-Received: by 2002:a17:906:c2d9:b0:a59:c23d:85ce with SMTP id
 a640c23a62f3a-a59fb9c6b24mr143408066b.51.1715156204516;
        Wed, 08 May 2024 01:16:44 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id
 va28-20020a17090711dc00b00a59b87dd0d7sm4564734ejb.147.2024.05.08.01.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 01:16:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 08 May 2024 10:16:30 +0200
Subject: [PATCH v2 4/4] ASoC: qcom: x1e80100: Correct channel mapping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240508-asoc-x1e80100-4-channel-mapping-v2-4-ccef9a66a572@linaro.org>
References: 
 <20240508-asoc-x1e80100-4-channel-mapping-v2-0-ccef9a66a572@linaro.org>
In-Reply-To: 
 <20240508-asoc-x1e80100-4-channel-mapping-v2-0-ccef9a66a572@linaro.org>
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
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmOzTkOvfRHwYugcz1kWoAcP3RrYYVLFgYomUkd
 wIXaQGCsqWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjs05AAKCRDBN2bmhouD
 17MfD/9ppYgawBoat2rd8pJ2G9oUl2iFD/zoJ64d4jFm5+wgcwXzMQiTRfSf7oFG8U+a9tEP9Lz
 KIEJluX00tJicgT3dxM0fC1NxHgTQKdyRhCTgsyoYlIdMsM5ffGkaPXZpKUnbZLpvoKC5TS9l45
 XuZnc1CaiutElSV2WeOBZN055cBzSup7HUYMjrpjYw1ZjJodQmROFvIp6DC8ck09Eaivs1Faz4A
 pRgweZoMHmEmVlESPoHB574JtwtKaYnL3naL9Q9PxmReTPmIyHYXlQvao76rKgdsVaHcjuveRWM
 Se7RGCOp0csNhKv9bvu/U9+OUUUizlnwE1OktST9U9nZxrmM0kTURDj6kz7+84uVwf/dN3AUiq/
 akm0Zt99Wo5Jc3m2WwBRizlSMx7SIx6tM8tjNL6NDW296+M4Z4wlKD5o/Vm509RE5V/LSula/Qa
 G1OvZI53EqPpwlgGtESAYdfmmQl4pnz+mAIbhyevVgEjrpgLmVfUaPb6g9jc45jR8XBkkH+hs8A
 Pjg++CEL6W05MMiNzBediwzt5EYd8dvKeQB1Bj2P/Y3kfuPKUnW2tJ8b2bevnmE4DJwlHzyCVDT
 8sxPzgstpttuV5NNVaJjbbnJr1HFnS3lhLY61Y6JW/kmIRUoEj59SdrGb/tqhXXsz7lQPgYiRhl
 /HjRVehRnvlOnwg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: HFAZB7GAUMSVN4N5ALFT2K4AKQZNLQMX
X-Message-ID-Hash: HFAZB7GAUMSVN4N5ALFT2K4AKQZNLQMX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HFAZB7GAUMSVN4N5ALFT2K4AKQZNLQMX/>
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

