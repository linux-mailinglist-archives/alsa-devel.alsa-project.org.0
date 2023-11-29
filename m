Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 728497FD5BF
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 12:30:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00056AE9;
	Wed, 29 Nov 2023 12:30:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00056AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701257458;
	bh=HWLlJnoPOP/xD+Gekh217c4hdXCI0EtvIL6DsACq4mo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ndLoESQuZlkgTx9yUyK6PjgWONzYCkfZIRM/gMxlKmJhYT0SZF78XSYLNDiBeSAeD
	 XZHIujbgQt/k1hGgAqgUyIyxnlWHwebPB9HcoJssDDCaJ39fDjfXhSjDGT/vvkO6/E
	 Nh9NaVeizwzUE5pdPMES7YKTJGe1FibPsNMjzPng=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40C56F80570; Wed, 29 Nov 2023 12:30:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB4F2F80236;
	Wed, 29 Nov 2023 12:30:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30165F80246; Wed, 29 Nov 2023 12:30:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4509EF8007E
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 12:30:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4509EF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=dWrXnoGZ
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5094727fa67so9587610e87.3
        for <alsa-devel@alsa-project.org>;
 Wed, 29 Nov 2023 03:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701257420; x=1701862220;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYN9xq94tv9j8O0C0oRrYF7EmY0bODI5JT1t6FcrN0o=;
        b=dWrXnoGZ1K1Ep2DrWlhZRNRhTsrqw09ZspqsWgtZcxxPFBXjIE9uwYy3MHAchAHGx6
         eKkbCCkw3PWBNBxbhICZ6I/yCUJfwYuZZuSsGAzM9ECSUnvqBQbvCWX4ciVf5uQ5a0J4
         A6+2h6Td2yy09/A75NntLdGFXjhRkyETmcoG/LPWTSjPcvYQBtFk14PYpU6x4N0fr20e
         4M9kuPLEbp2y+IuMgkoUZDgzgezuQFNA6tuYZ9v9pg+02s1rRdLRbe+zc6bB799+2+Hc
         WO9a3OgQ5NlwsggH4Cx3NJuLyOWeOrnya8bHe2qIPatzcvfgw2lGRohRpiL5KoQhqGoX
         7P9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701257420; x=1701862220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYN9xq94tv9j8O0C0oRrYF7EmY0bODI5JT1t6FcrN0o=;
        b=hEIDtHYtVRSpDyEGaFsUS/ML3v9M4kS0r3mai/Flsvkjc4M/suGmbXLR1kL+5pv1L5
         6MnMJ7C3LWZMJJ149sc98WTWWu9zLGolYkm49tPqf78x3UZUcBInoVqNYXx+YhNrCQeL
         oW9S3suUTKf9Eo7seTnBwflnpz4uxtuGVC1og6YHdUEu/CloKFywd7iqYA6+vAU2aiBy
         W8pMTmSjKXpMDa6EIFisCU3EuLrhw/w6FUfwdGh2qWTuX3V/CXblbj4ymU7OmyV+1QUd
         mHELdlZwAC5BA4XwRtQ+Xi+swzD4XFjv0t0HuhuxvgXcnFTMGOllXW4SoZJuKqJL0ljr
         Syxw==
X-Gm-Message-State: AOJu0YwQG7L0gj/cqwdpyDD/lfStNhAKYMHnjhPlApqqLINgxJMa6Lct
	r5yih9e8105hfaor3qEVNh7KgQ==
X-Google-Smtp-Source: 
 AGHT+IGf+lYuB85sUBy5jbyCRa/bqNfCvJ7yJDrbtC4hGrUhQ8pWpqA2IgrGIJB3ZpyHP5KF9wLIMg==
X-Received: by 2002:a05:6512:3d1c:b0:50b:c630:13e7 with SMTP id
 d28-20020a0565123d1c00b0050bc63013e7mr1162086lfv.19.1701257420604;
        Wed, 29 Nov 2023 03:30:20 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id
 y5-20020a056402440500b0054af224a87bsm6213829eda.33.2023.11.29.03.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 03:30:20 -0800 (PST)
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
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 2/4] ASoC: dt-bindings: qcom,lpass-tx-macro: Add SM8650 LPASS
 TX
Date: Wed, 29 Nov 2023 12:30:12 +0100
Message-Id: <20231129113014.38837-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231129113014.38837-1-krzysztof.kozlowski@linaro.org>
References: <20231129113014.38837-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XSP7Y4KV5CHIR4V2NJ33SIKSABHLEGIX
X-Message-ID-Hash: XSP7Y4KV5CHIR4V2NJ33SIKSABHLEGIX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XSP7Y4KV5CHIR4V2NJ33SIKSABHLEGIX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add bindings for Qualcomm SM8650 Low Power Audio SubSystem (LPASS) TX
macro codec, which looks like compatible with earlier SM8550.

Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/qcom,lpass-tx-macro.yaml   | 23 +++++++++++--------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index 962701e9eb42..cee79ac42a33 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -11,13 +11,17 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - qcom,sc7280-lpass-tx-macro
-      - qcom,sm6115-lpass-tx-macro
-      - qcom,sm8250-lpass-tx-macro
-      - qcom,sm8450-lpass-tx-macro
-      - qcom,sm8550-lpass-tx-macro
-      - qcom,sc8280xp-lpass-tx-macro
+    oneOf:
+      - enum:
+          - qcom,sc7280-lpass-tx-macro
+          - qcom,sm6115-lpass-tx-macro
+          - qcom,sm8250-lpass-tx-macro
+          - qcom,sm8450-lpass-tx-macro
+          - qcom,sm8550-lpass-tx-macro
+          - qcom,sc8280xp-lpass-tx-macro
+      - items:
+          - const: qcom,sm8650-lpass-tx-macro
+          - const: qcom,sm8550-lpass-tx-macro
 
   reg:
     maxItems: 1
@@ -118,8 +122,9 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sm8550-lpass-tx-macro
+          contains:
+            enum:
+              - qcom,sm8550-lpass-tx-macro
     then:
       properties:
         clocks:
-- 
2.34.1

