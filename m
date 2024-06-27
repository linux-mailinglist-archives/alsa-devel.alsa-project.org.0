Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F37D91A5E1
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 13:58:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 745FC21E0;
	Thu, 27 Jun 2024 13:57:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 745FC21E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719489484;
	bh=UkWKKOsTNz1C80xDz4hBzX/O51GwHLLmPnZ3RZsUr6g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vhOvVxVBuT4IRRJ+7gz7YLHhNf6wPwCRMyLvk/bzcoio0JtIziaaKR7eLh9LbKyiD
	 89fPPim30tzp/YRuanvTDqLRMB1Wmw0cZtPCMwL4rf5qSi/GDFCoyc0dM7t7clUgwG
	 RsJKcE5RQTouxA1Bjfr4W6Wd4qwYSpKpAdN2jbJw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 127D7F80589; Thu, 27 Jun 2024 13:56:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 33B58F80676;
	Thu, 27 Jun 2024 13:56:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9469BF805E8; Thu, 27 Jun 2024 13:56:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2AEFBF80495
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 13:56:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AEFBF80495
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=TIM59XXw
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-421b9068274so66683895e9.1
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 04:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719489362; x=1720094162;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eB7qTRAxnSkgE7t4FDRl+bpfSSJGxOmGp8nh0Nok6h0=;
        b=TIM59XXw9uPPZHfXV8y7X7wZReu2cdDRWMl5cXXD0Ibx8V7iSHBTGnOOjyHMmN4Knv
         DpyLPvpN5/+VmHRFKZxaadlQs3r8yTezEuzXSX1rWS+UbwQ7fqq9uwud1aUQaGp/u0Ie
         1hBCKCqjKOyEPsxVqwZrvg8JQ78p0da44NqPaCCc6i9cQsk9DRLfES5UqcVP0tPENMfT
         2EfrdqjrL5NdJ0XOfHJbyirz0jOI/Ah0zkY1o0aw8YAb9E6fCTbzkW76ldv8N6tdlqYQ
         68T2Kk/NpDs2oGmxMnwBA/O9p9nhRRg/n4T750RK27mpoUEidQZZJ/otv946rHWNwT+r
         K+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719489362; x=1720094162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eB7qTRAxnSkgE7t4FDRl+bpfSSJGxOmGp8nh0Nok6h0=;
        b=Mf9ehwgc3iqnOu0a5rA5on5dT+KBOBhfgU5HDZ0CkwnhcqVQWl0cLQASyaBMVbRqk2
         Pl1hyBAUKqCKstdAvH/34w6boV4If2CyUb12K9ffK3aSgQzOSp1bQ3hdtLFchiS98UhY
         E77S9IxSGZPo9TpqBwoajOsBC4/7I6tqqijrfUyoFVTw9ww4c+m/w4VVDnBsThGS7JDz
         d6qrVsE5yalDJiGrsXMrG8k2+4CQ+UL7My27uM5gNzL4qtQy7xrRkPKMvyklEpsi+Zgx
         kaSY/iDoKrCJUGnCViJfFtGO9AwCvyAIXMjvcZHst3HI/Zqnb9xgi2h9xGEKJEut/+zi
         rVKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVn0UQjrUvUGFFwcsqdxQr4O361A1UkK/nzJBhOm1DmqIWl9SH0VzZDT4BjG24hyUsz++Y/KNMCMhTe5sBh7WotESWF1rasOAt5SvQ=
X-Gm-Message-State: AOJu0Yy+5eqyyQN9JcOodolPHZzNYbo3l8n90weXTYyvzq4SFXrTf47m
	L2Oh1shyaz8ys1h9FXJo6lYONHVkh3T/iTRmvmKP5CxyjBG91172Dd/tmasL2PI=
X-Google-Smtp-Source: 
 AGHT+IElItNp3cSHKsJTKvy1VXuKu2eMXWGGPys9ZBSGpHUZHQxdJ4zDKyVCa4+CO6Sc9OuHVdXXdA==
X-Received: by 2002:a05:600c:6d8e:b0:425:656b:76ae with SMTP id
 5b1f17b1804b1-425656b7748mr9686195e9.23.1719489362352;
        Thu, 27 Jun 2024 04:56:02 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3674369980asm1597552f8f.80.2024.06.27.04.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 04:56:01 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Thu, 27 Jun 2024 12:55:19 +0100
Subject: [PATCH 3/6] ASoC: dt-bindings: wsa8840: Document port mapping
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-port-map-v1-3-bd8987d2b332@linaro.org>
References: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
In-Reply-To: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
To: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1157;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=UkWKKOsTNz1C80xDz4hBzX/O51GwHLLmPnZ3RZsUr6g=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmfVNNzIYgBD4wI/PAjnXHpOZClxrctCQtBgmud
 GG2+Eky/sSJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZn1TTQAKCRB6of1ZxzRV
 N9iDCACoqrzNg2bonxWWRPIlk9J/1IuSP15wQmt8YcvPWxi9MTepRJQPWXHxS1T+I6Ed6N8E/4N
 siF4aiQKS7sRkNPP2evMWdyZqxlxlEtpbakw/afA1Kom4IUNmr/PLJb9o6Q2A4d4i5pQmvuCb9L
 1qR9Gskw+nZszbxIjsQJPphvXkYJWBig549ZgMhQTIttc7XLohqNPj/pLEXYMzy6QzELCqA70E/
 SCoeVcc5H/RqwYYDhOJFjBPYFUCPnhHPQsdmZlCNY/qK7QyEFPNBAlpo+FYb17sZl9ey1s0X2o8
 LZFQxRULxG/4R4NU7W4ixlSBxc8IoPGu9jfwRWfztLfoY7y4
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Message-ID-Hash: G7JST73MH7WVDJMGSI3C6POUIRAPHNY7
X-Message-ID-Hash: G7JST73MH7WVDJMGSI3C6POUIRAPHNY7
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G7JST73MH7WVDJMGSI3C6POUIRAPHNY7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Document port mapping property for wsa884x. Port mapping is required
to be able map correct master ports.

All the device ports are not mapped in same order as master ports, so
there is a need for having static port mapping for WSA codecs.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
index 22798d22d981..83e0360301e1 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
@@ -32,6 +32,14 @@ properties:
     description: Powerdown/Shutdown line to use (pin SD_N)
     maxItems: 1
 
+  qcom,port-mapping:
+    description: |
+      Specifies static port mapping between slave and master ports.
+      In the order of slave port index.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 6
+    maxItems: 6
+
   '#sound-dai-cells':
     const: 0
 

-- 
2.25.1

