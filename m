Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1E1909021
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2024 18:25:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04155AE8;
	Fri, 14 Jun 2024 18:24:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04155AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718382311;
	bh=nDYX78s666lmvDzBJf45D8iEKOdkkaUkatUIYyWZVnU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gp4FTP64F0cjSvuKnX8GPhlsy8u81HbKTlj4b7mQu9HcBmILYiHtJy16tiizVeB1l
	 j5ZFC2iQg5LDLhIAEyr7PkrX/HmzI6M3d1cqa1/3NCPCH2wJAToVTf6izSq4hBsL6X
	 nVHKYivb8dxKWwCJ8EA4sntefh9YLVtLn8gsZaKA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56A01F805CA; Fri, 14 Jun 2024 18:24:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8797CF805D9;
	Fri, 14 Jun 2024 18:24:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2BD4F80578; Fri, 14 Jun 2024 18:24:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D65BF800ED
	for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2024 18:24:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D65BF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=EXNpHDUq
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-35f223e7691so1517560f8f.1
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Jun 2024 09:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718382250; x=1718987050;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ms3akv2NcjLsPvbUoYiATp1OV1bkvK609lQrIE0+ce0=;
        b=EXNpHDUqUA6bvm6yMGcs4aDIA1L4MmZ09yOHiB4TTyoUXEiHeWJORnNVvOOXxoKTui
         ju0PISOSWgPg39OR2VEo98+J2XgTD99qORcWojvysSKZhhRRxE6XFCBEsQ1tA/HGZMPF
         Xx/e3nPQmEk4ejj7FmU8sY9Gd2xDVIn/jyrbaxwZjD0D6ifLyCdQVtt3sjFXb3luIRVT
         mriAZL+QOcwj3GFxTEOlpefMwobncleS+J3E8k9irVFrSY2PenTvepU5NiadGRbx3/zo
         wcJjCvFPXypHv25y+ClpxJXZmA6BNe2/OCWoLqEo9zHILZK4qTp9zkFrYjWf6fylzzsR
         jCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718382250; x=1718987050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ms3akv2NcjLsPvbUoYiATp1OV1bkvK609lQrIE0+ce0=;
        b=mMOnqT+5wSLxHliJXtCAQkItBv5MUuImHcNEsYDl6hPbC+csFTguRbKjMWGYIADS4E
         1FYldRNFFUOLIvlvniM6Q3chpD2MiFhL27cm+ilGWrGXwdqJ3ytGUISdYhGck1HKtA/t
         3yQ45OBknx/fg9nc+yqxXn35swDUYyadzfE8qYsL/zEAm9TwOWPzx3moWXEigMGpCexK
         w9D8LDt/x2/6LQrpUDLZUVy8T2Fhg8vMLlrtBixRrM0dhPsc+86H2sKOF0ULPjXoxQ7A
         faE23D2ZXOh/pM5IkpIWjxu2pwNJ2NjQzuuqEzjryWw919hRhDzpE9Oi+734z5KIOslY
         yUmw==
X-Gm-Message-State: AOJu0YxyVGOvpu2jfejjfsNgSHKTUgrOleWGm+WuFfUtQqre4DRO6fI/
	JebwQebPxVtkwnhg0zJIMXWE56oqOwHHSJUmIJvFOl3kL97cGqFVEdjvfiis5tw=
X-Google-Smtp-Source: 
 AGHT+IGubE2KBTAuJluvEZeX/JZ1C1o/BuDtJFqq9WxuCqZs7reywce3tZSwQNvzmAj/9g8N03KusQ==
X-Received: by 2002:a5d:4b4e:0:b0:360:872e:391a with SMTP id
 ffacd0b85a97d-360872e397fmr482102f8f.16.1718382249730;
        Fri, 14 Jun 2024 09:24:09 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36074e0e5adsm4931165f8f.0.2024.06.14.09.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 09:24:09 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 14 Jun 2024 18:24:02 +0200
Subject: [PATCH RFC 2/3] ASoC: dt-bindings: amlogic,gx-sound-card: document
 clocks and clock-names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240614-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v1-2-9f57d9e01834@linaro.org>
References: 
 <20240614-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v1-0-9f57d9e01834@linaro.org>
In-Reply-To: 
 <20240614-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v1-0-9f57d9e01834@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1801;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=nDYX78s666lmvDzBJf45D8iEKOdkkaUkatUIYyWZVnU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmbG6lLfrAQbnERIchEIXh2IvUxxAmbWE6wnoxfpN0
 aW/iCjKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZmxupQAKCRB33NvayMhJ0a2hD/
 43Zo1fD1Wz3M0L4WUEK9GJMCkzoW9XuWapOWFR60gH6pkFJMo1Fi/AKl0lF2M5/nh543sZN5YPG6lU
 QN7x59WZJ/uyuH8LDSrv2TE+c3yYs9l0F8XIc18gxVZpQAANDFPEdn+LIN71aG8QdVIbPXmMkS/Alt
 Ytftz2OGJ2/kbcNasK1Quv2oD42dTOx0oJ3KxwXyUgmM4Y/t6vDISq87aT0glCnR1qIir2LYeYOucV
 UYqY8hLOJ8nPXRY1ps1rAPemUikvFU043nuWhd0riAGvQ6XL9GR95qLYFBHYrwNYpunLzCp8MVfWvW
 qY5XgJD5ityLHxy17MLOXR3tm8j7yoTLXyfgfKO2/draeksgj+hSQsP0ADZpp8G1YdSo3NoOkkmJv5
 1Gtx8nC5gK4fQeTcMfEZe7WRLlzHPTNb5TODXzYt2kwTHlfqaGS3IQh5I/7XzJzliH9QjPR1Wnj30H
 ebu3jhZyWdvRDiY/0SgaI3IJibtkvjlhkj90PTQMc7tLDyUW9hMMkfkBQrBNvkoEe8wPLOBhJfZ7ZC
 ZM37Bm33KJ84qj6+9xo0+by9yWwDYhKjy2etn4ZxjdMhWu60TJVEt/Ne0uiHLe21aM3L1XvLQlOurc
 SWXEv60anpe89DxwdaWuQ80YQK3PTIJPgWisYRpS/dEm2QXbR6zZaZqI2RsQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Message-ID-Hash: P7LYZQZKOLSVLJGBVZLZBQ42QJRPYPDG
X-Message-ID-Hash: P7LYZQZKOLSVLJGBVZLZBQ42QJRPYPDG
X-MailFrom: neil.armstrong@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P7LYZQZKOLSVLJGBVZLZBQ42QJRPYPDG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The sound card design is based on 3 reference PLL frequencies that
are the root of all clock rates calculations.

Today, those 3 frequencies are specified in DT via assigned-clocks,
because they correspond to the basic audio use-case.

It makes no sense to setup clock rates for a sound card without
referencing the clocks for the sound card, mainly because at
some point more complex audio use cases will be supported
and those root rates would need to change.

To solve this situation, let's legitimize the presence of assigned-clocks
in the sound card by documenting those clocks, as it describes a true
dependency of the sound card and paths the way of more complex
audio uses-cases involving those root frequencies.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/sound/amlogic,gx-sound-card.yaml     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
index 0ecdaf7190e9..d29dbca9ccc9 100644
--- a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
+++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
@@ -27,6 +27,18 @@ properties:
       A list off component DAPM widget. Each entry is a pair of strings,
       the first being the widget type, the second being the widget name
 
+  clocks:
+    maxItems: 3
+    description:
+      Base PLL clocks of audio susbsytem, used to configure base clock
+      frequencies for different audio use-cases.
+
+  clock-names:
+    items:
+      - const: mpll0
+      - const: mpll1
+      - const: mpll2
+
 patternProperties:
   "^dai-link-[0-9]+$":
     type: object

-- 
2.34.1

