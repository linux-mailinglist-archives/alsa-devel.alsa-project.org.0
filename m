Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 647066CA5C0
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 15:26:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65647E11;
	Mon, 27 Mar 2023 15:25:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65647E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679923560;
	bh=FfoahduL07n3X6HcOBGrU2nWbp1G0mNpDEkwnz9wZT0=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X/ML1ZV1NdLlJzKanfysfZzd3pxVky1MVeMJQupTVvCYGDaiIB+s1k3B4fF9Vn9iO
	 2WPwNHM20hqPcs40DKF9bRwh0zGox/qgqB+AZ1yPqkQVwps4slcsuV877C0EnaDcq5
	 Z2pH3hV4avLoxcDzUjGxHVAnvKp6whjK3HzbA3Pw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93510F80570;
	Mon, 27 Mar 2023 15:23:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FC42F80549; Mon, 27 Mar 2023 15:23:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5AF0AF80527
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 15:23:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AF0AF80527
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=iOLCw3e8
Received: by mail-ed1-x536.google.com with SMTP id i5so36361358eda.0
        for <alsa-devel@alsa-project.org>;
 Mon, 27 Mar 2023 06:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679923398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6C2oehD29mdvVUf/6YW/LF4OD+LurGgZwAXHRNOwNI=;
        b=iOLCw3e8jcrKj2cxEFSkhEBca6jq+IfluJjdDP8MQu/l33h0IohvFKmIcy9IkOryjG
         GvJwMwhdbsJmt1HXUj9LhKH0XngcDRYLciRZMfgOA1TvT8l8tjaiTbdsNjlobFB5cJu/
         tdI1ikQjZKJZ/2VUjp3nBYb/6eTA3Y0wFR1WmFlc5xkCrLbEDVxP8fn7Y5ap5FWAdIEW
         MucQZiaKDZKwbWLN8I077nTgcmmhRkTMwRf3/SJNi3V3Td+5aModmPAj1WXiU9zIhZVF
         Bc8/0L8qNRU3E7dSpbF5T+ch5r7BWwGXwBeaC2LG+pzM8Yxi9ofuA2jBlNp45jLyXgTd
         sQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679923398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6C2oehD29mdvVUf/6YW/LF4OD+LurGgZwAXHRNOwNI=;
        b=gqRyT2uAIu2WD3Fy/HWkqMh/JN13MKFc/p/PYO6g5h5q6W1fGw32q3ydPjwuIoPIqp
         cLldygRXSEPNqG60feJI1lMBpZZVXRNNHvs9ccIz78mRCcOICprBZbT8M5Fh9eEujbwB
         VZp8nHw/zxVdlj5lJSm3o02B+PO6IEtfKHcoiCydU6eZVUPjJpGSq6qkHsbsSWBifK5v
         D4gNlAy+FXq7QQAdbawhjfLxnrRwAFvvDK/c6oFvgK8yv9YsPna+N0n/5M6Qww6km9rW
         sRZIAT0LCy2VvX+9WG7ROGHjyeTAsh/Ocdwc4nKOfMN8z1vHke/y+h7Bh6met3E2gMkV
         ORJA==
X-Gm-Message-State: AAQBX9cp63NJ35o233L245p8xCOekPDpjFzYiyPppTXECrTu4bm1sigM
	tXqX2ah6Zn4Ipmq8tjtiXOFYMg==
X-Google-Smtp-Source: 
 AKy350bJk9HPKQFGqOqsrsC9SPm+Pem+SwXwgMWcjh2NW7nmdunmuYH86WBqFrDz9P78cDEKgaDkhg==
X-Received: by 2002:a17:906:3616:b0:931:19f8:d89c with SMTP id
 q22-20020a170906361600b0093119f8d89cmr12312627ejb.73.1679923398704;
        Mon, 27 Mar 2023 06:23:18 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:581e:789c:7616:5ee])
        by smtp.gmail.com with ESMTPSA id
 gy24-20020a170906f25800b00930445428acsm14286814ejb.14.2023.03.27.06.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 06:23:18 -0700 (PDT)
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
Subject: [PATCH v3 08/10] ASoC: dt-bindings: qcom,lpass-va-macro: Add SM8550
 VA macro
Date: Mon, 27 Mar 2023 15:22:52 +0200
Message-Id: <20230327132254.147975-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327132254.147975-1-krzysztof.kozlowski@linaro.org>
References: <20230327132254.147975-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EYP4X7DX64KYB4EESTR23PFTIUFQSO3N
X-Message-ID-Hash: EYP4X7DX64KYB4EESTR23PFTIUFQSO3N
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Patrick Lai <quic_plai@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EYP4X7DX64KYB4EESTR23PFTIUFQSO3N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the VA macro codec on Qualcomm SM8550, which comes without NPL clock
exposed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/sound/qcom,lpass-va-macro.yaml    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 528b677a439c..4a56108c444b 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -15,6 +15,7 @@ properties:
       - qcom,sc7280-lpass-va-macro
       - qcom,sm8250-lpass-va-macro
       - qcom,sm8450-lpass-va-macro
+      - qcom,sm8550-lpass-va-macro
       - qcom,sc8280xp-lpass-va-macro
 
   reg:
@@ -110,6 +111,23 @@ allOf:
             - const: dcodec
             - const: npl
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8550-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: mclk
+            - const: macro
+            - const: dcodec
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1

