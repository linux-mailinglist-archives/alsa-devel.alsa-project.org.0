Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 129C86B4057
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 14:24:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41CA01891;
	Fri, 10 Mar 2023 14:24:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41CA01891
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678454695;
	bh=fKbiEXDschISZbDjW6hzu3bB/M7LVonJ1Y9FKmZPDpU=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nWKmqGtIpiFSBSBONPCAaOWfUlGxu+Kn3CZ0schaNzjpFYEY2k2odW625XyDHk/IV
	 ss1RhZL5FrZFRZWhfIsaxHBs6iddor4/90wsTZB2wURgw+qomWbOWlHWFivEh70PmG
	 5XOdr3uaXzHPS86J5u7z7+hKQUmvR9iBASGBJqT8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0FFDF80553;
	Fri, 10 Mar 2023 14:22:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E333FF80534; Fri, 10 Mar 2023 14:22:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28154F80236
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 14:22:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28154F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=JlQDMdsr
Received: by mail-ed1-x529.google.com with SMTP id u9so20408812edd.2
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 05:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678454532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZM2NPsZ49ia+Dqe6wkMeZpgWpRvBEKr1bmuDVGwMmU=;
        b=JlQDMdsrzCaAUa+EGwPt5baDL9e2sGUjcXtUdJmMtd7LdVysOe++LpLVZR62ZYEocf
         GGVu0LPvWKnC66Cv9zwZp3AKNIEU1IsV+efkj4Zdhpi1Qn705w49uz4Qt4ogxN68cuty
         0btX2P47p6t+EP6BHBkWAX6XjqGKRBGaLunRWDvwsqanUk9dOf8jvcK9ViDIqNgwdom1
         k4NSndhZRy4ftXOedg/VJHgTL8ZCB6pJHn7t6u1DrjNOUZWGxzBqnHKGkXTE5Fh27rvy
         b55y67Vv7B4MpMRYC+WHN+xQMbxaIMYtq4vueu0BPH6BTVqC6/qOMmKfnBkrNYJvSt06
         0T8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678454532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZM2NPsZ49ia+Dqe6wkMeZpgWpRvBEKr1bmuDVGwMmU=;
        b=8LZAqucyxjxAAJVKjG79o806Rkvf2d9c8fsPviWlNWoze9qxeqJI+gsXfuAK1t1dSs
         /J22hsXc3T8qgiIqx7xMgNl9umxudDtiV2VpvlmcvjS658CLWGO5UPOsNZA89QgY6WXa
         JcHrB/v5XJoyywKKddtY4PZpy8Zm4QuBkD3mVH8cjgpZZNO2XpxSwdZU/1Swl8iNova1
         qfu6v6zmaxRBRtYpzs7GuTntHqH8hS0EixTXAh+Q40uyBdd8pVPmdRpswC/MpqvoepQn
         02uOHukEnHZzmkS0jMDNFWtPQMUoPixT/aXAw8dSR476eBBlc7Cux+WDYyfKGqYKhFtX
         UH9g==
X-Gm-Message-State: AO0yUKXTuj9K84G2VoLJuFm/jUuIrVVmXLLCnSoko4ZSoDj65+6fvvp8
	42TOy48kJkDKmWV/EvL5NDi3qg==
X-Google-Smtp-Source: 
 AK7set8fTAqNDHmQ2vbdeXcsnUybj+MQE1TaFOBt/wDYcsvEaTyVp4p/mNTUNlPd4pLUH6uptZ5WVw==
X-Received: by 2002:a17:906:30d3:b0:878:7291:d558 with SMTP id
 b19-20020a17090630d300b008787291d558mr23731297ejb.34.1678454532716;
        Fri, 10 Mar 2023 05:22:12 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:45c4:46be:ec71:4a51])
        by smtp.gmail.com with ESMTPSA id
 zc4-20020a170906988400b008b17879ec95sm959124ejb.22.2023.03.10.05.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 05:22:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] ASoC: dt-bindings: qcom,lpass-wsa-macro: Add SM8550 WSA
 macro
Date: Fri, 10 Mar 2023 14:22:00 +0100
Message-Id: <20230310132201.322148-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310132201.322148-1-krzysztof.kozlowski@linaro.org>
References: <20230310132201.322148-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FVQ7KQNJGPNZUJQQXFVXPZLTZQ7AITU3
X-Message-ID-Hash: FVQ7KQNJGPNZUJQQXFVXPZLTZQ7AITU3
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FVQ7KQNJGPNZUJQQXFVXPZLTZQ7AITU3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the WSA macro codec on Qualcomm SM8550, which comes without NPL clock
exposed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/qcom,lpass-wsa-macro.yaml  | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
index 66cbb1f5e31a..eea7609d1b33 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
@@ -15,6 +15,7 @@ properties:
       - qcom,sc7280-lpass-wsa-macro
       - qcom,sm8250-lpass-wsa-macro
       - qcom,sm8450-lpass-wsa-macro
+      - qcom,sm8550-lpass-wsa-macro
       - qcom,sc8280xp-lpass-wsa-macro
 
   reg:
@@ -27,11 +28,11 @@ properties:
     const: 0
 
   clocks:
-    minItems: 5
+    minItems: 4
     maxItems: 6
 
   clock-names:
-    minItems: 5
+    minItems: 4
     maxItems: 6
 
   clock-output-names:
@@ -62,6 +63,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 5
           maxItems: 5
         clock-names:
           items:
@@ -89,6 +91,23 @@ allOf:
             - const: va
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm8550-lpass-wsa-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: macro
+            - const: dcodec
+            - const: fsgen
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1

