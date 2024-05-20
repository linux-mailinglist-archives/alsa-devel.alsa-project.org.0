Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDD18C9EBB
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 16:23:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E99A486F;
	Mon, 20 May 2024 16:23:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E99A486F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716215003;
	bh=RVNDo+PUPNeV1sa0OC/s/rwZqNAdhw3yPx+40/ruZ0I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H5RCp88TgSVsBsoXA/Vq6h2LDzvlnFIORKDAqp9FlGAdH9JKDaXRtb5qiIAKmmN/S
	 Laz9NcCj0fYNYfY2LOORwouXqz07JzQBjzGNOVidzhXTBvZkqWdj9cEQAfMpsvz0qR
	 gTT3VytXNRbdROaBTt26aoA21t74hzdmreQcCm7c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62845F805AA; Mon, 20 May 2024 16:22:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A42EF805A1;
	Mon, 20 May 2024 16:22:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8988F8026A; Mon, 20 May 2024 16:22:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D90EF8020D
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 16:20:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D90EF8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Jw1z3n37
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4202ca70318so18968925e9.1
        for <alsa-devel@alsa-project.org>;
 Mon, 20 May 2024 07:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716214814; x=1716819614;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sm/iyvA/oRf8IDDwCG6199y51shfGYvzaBKbXuvmT5Q=;
        b=Jw1z3n370u8keFLLn6gZBEht6lXlPux/UJKjIi6OYAJQbVPKR0SMsycnyEoM1RUeyd
         Z+iKwxbIzwE71vbwy9Zgd5db5yW7TNp3NvnB3l1HCbCmERguQ8mH6+zvO0+UhNHtBgpP
         LdoigoVURvoEMpa2FcsJFLkmClZ+zM02aOGXMRB79S/AdZIRNi1LCNZ4VXdrNidx1uX5
         4lC/QZhX4Q0vIycJ28Rgaaa4kT3+afRa1Md59xGCxHvUtuUo4oZelGeqgOgjUd39nf2W
         +pBgF/oZRb+mEQ70J5o3d535mXvnjVjtEAqFlhxnHD+Uwxxcpz33997/1Km2nleBwnfb
         qBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716214814; x=1716819614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sm/iyvA/oRf8IDDwCG6199y51shfGYvzaBKbXuvmT5Q=;
        b=YTpvJPfY9JsPmZwPOOI5fUlO3JEZIk57+0SjmVNAcMGmxIYd8KCWiOS6lTnV6q7PI6
         RwWOApWtacujganR1Ef0OLWAPyrtnthoqfvPtM7T13hZqeAhOnyf//KGpJzHaUm11zz4
         XUlhTNqIafGdKurWx9tjXzyku2WcFzOL6VKq2noCxd77iDwfDiRctEZ5okcTn61ESmBi
         wlPHmlkC9kg3FN/qetSAZ0ViNz9Tf2mvjgWFxHvqKDNpToOg8R9gry9ZWeR4MR8RBP00
         NauwUb6QIpZ1e5jx7X8qCZETuEaHSyCGXFHjhVVbfNOJiEbrC3+sf9HygZ8/o3HxjtZ0
         yHbQ==
X-Gm-Message-State: AOJu0YyaOq+hDP3UFQr3iCp25u+E7ixQW5IO+Frxx0FFFZKW9pK8doJO
	MQVMLVXTkRVQL1d+UL3HHSd8Mr9iMrNipWLL7ZUenlT5a7j3S92x9+fG6saa2rM=
X-Google-Smtp-Source: 
 AGHT+IGVRyJJ7aHIZMec1RRFI1lujPx2Dl5vOFi8D3htETVzjOwcHTweLhfI2iYBMlx8IuAnYEGitQ==
X-Received: by 2002:a05:600c:ac1:b0:416:3f85:d49 with SMTP id
 5b1f17b1804b1-41feaa42cd6mr250592485e9.18.1716214813838;
        Mon, 20 May 2024 07:20:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccee962esm421612625e9.31.2024.05.20.07.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 07:20:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 20 May 2024 16:19:59 +0200
Subject: [PATCH v4 4/4] ASoC: qcom: x1e80100: Correct channel mapping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240520-asoc-x1e80100-4-channel-mapping-v4-4-f657159b4aad@linaro.org>
References: 
 <20240520-asoc-x1e80100-4-channel-mapping-v4-0-f657159b4aad@linaro.org>
In-Reply-To: 
 <20240520-asoc-x1e80100-4-channel-mapping-v4-0-f657159b4aad@linaro.org>
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
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmS1wVxsw/p+VXN2eP9N2OLCdsAbVUC+7yjp30j
 BFHMQJTguOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZktcFQAKCRDBN2bmhouD
 11RZD/9MxHl6NYGke5RtglSMF7GhedR5atNcAnGjmHO7nesbXV3GMuToOk7k49VmQaxlg5ly6IH
 Oy/wFsxxZrSJzd4ce+sjQXd32sRXnGipksKiB0wvIhFvY3973MiUP7xxLaMu4WxouANJiRp5FFD
 YxkuzSLXrekOrO5foULPEM1L38vcjOqveybopaNm5+vJWgKFqD/EF7WfXWgEJpErXbmP2oCTO5d
 2rxWiiHdabrrpD4yuMIjmm2P/HivHBx2LUra4m4HkRB0Wp/TAL7vKvtmgCJcY5pTgwm5IRyOoEV
 qz3kkoAKC90nAnRYvPdMRrDyRmorQvy5dK25BbUCnU+HO3fZT6VvNXMnwqu6+cHOs9h9tqXwrpl
 Qj72RqmdHOTEeoSCMbkqrhL/5z2C70E1wT31yLDDF3w2GfcGeVcQIDrPs2B1DdEvobRYezY0LGX
 46Mtxhuz/FJZHQC/uNQcJezBniMAa6HS29M9eJRqtbyVetJhH3qFhRyCuS+GR1jDXXJbA+uXm92
 PLAJwp0uW43HJKhO1gu1gobTm1ciyxwb8KawtkuolAxewb2CZFFz3PqGie23cgyAsLLPZmPLRl/
 iyCSH587Do9m4PT0jtp1RoT3AI9Kni5RNKgPAOY1Rp12Kt0gi2gWleqA5NYxMC7B9fiUhaiun9T
 Lgf6MaPNLe76WRQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: Z5342LYCQYYZQP3QIA7JX6UULMHNA24K
X-Message-ID-Hash: Z5342LYCQYYZQP3QIA7JX6UULMHNA24K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z5342LYCQYYZQP3QIA7JX6UULMHNA24K/>
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

