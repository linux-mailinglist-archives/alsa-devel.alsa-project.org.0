Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 176C47FD5C1
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 12:31:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D32DDEC;
	Wed, 29 Nov 2023 12:31:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D32DDEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701257499;
	bh=R5KHORMQyLjEfOXCuB6XWGSQbxlqnuhYIENnnQokBG8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n6MsV0ERuGt3T5wGpNjnQ0oknZLnkBMNpMamuL3l0OY61uUSHeD5dz0aBJ9QzdIc6
	 R4LakEr34Btk5Z0wX/HLyROtg96YRuUuj9or/mYcYQARSH0Q8Y6sfP3tnmxqLw56+/
	 egWQQ+JXeOLRMfIb2WnrEjPwA3Rsv/PRoVzWmvVg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E20E9F805EA; Wed, 29 Nov 2023 12:30:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2782F805DA;
	Wed, 29 Nov 2023 12:30:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E718EF801D5; Wed, 29 Nov 2023 12:30:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CF4BF80166
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 12:30:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CF4BF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=MsOU3JRJ
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50bc053a9a7so1969820e87.1
        for <alsa-devel@alsa-project.org>;
 Wed, 29 Nov 2023 03:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701257422; x=1701862222;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sE0OrQYvQYRAIUylzroozgbQ3n66QF638bXEaP+4RcU=;
        b=MsOU3JRJydkA8DiHUl2Z9LInwBMkrSgvy2VzaPvL5D3mX54AFKkYfr/SJ3KLlpHNtI
         cU0oBtCHkCHGzOY2xEHK/Cv5q+09Gqc9tPXjcDuL0gyBRuQK7UMB3hxrEdWtRegoBCk4
         ejUjmiLMzAPW41Ds8o2Ka9yGS+tFJMJacfCH89pskFXYruKwQr1vqXFQJfW4LboEdV9B
         Iiq3LcC2iuRInc5e+A156xIfZdHOARIEr+ASdexrl8iqxbmiYudbu/Gfqo4BFWgmzzmu
         7SX0g3Z5Bhd9RFG4Za0/2Zk7/4KzwRPfSC3BwnVchYfzpM0HjuCbz2XzeLryse9XV+kt
         URwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701257422; x=1701862222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sE0OrQYvQYRAIUylzroozgbQ3n66QF638bXEaP+4RcU=;
        b=NKHpg39Mur36W96688+V1UHKpIGK+1Vui7eLi4i1Ehq0rl58xQBeaobfscBi8SU16R
         G7s2yQsBkoen8goRBmm9tKZ+ZnF4aZ8wgOKVqmM84qlac7xtOt0osQHvbx+B8a2tBEs1
         ktwlbQDOmXI3cKPkwaL7uCYVtZ01CPUvz+RGxZYo3Zy2iCkqkF28tSU5e7/fh3COSgN8
         3qeJgdHOO5z/TMB6b5DmAKJg9McS+gNAE9vhH35YnUBUqsxQGWamjpWAbFOUh0bxs+gC
         WpuofXSU2WfPYPhD5IkG/pYsSUZD2s/TIFk3iDuEN0x7jOn4lwtHH1CFR9VriTRh3z9F
         BMIw==
X-Gm-Message-State: AOJu0YxEFvIUQTFAUDiPCcZRc7uX4lBgWN+XeixM87Df+AcGunxuQDmm
	Fo0S5UvJsfLwwB4bv0BB+2HW5Q==
X-Google-Smtp-Source: 
 AGHT+IFx/OuqHsBK+hMJdr07SQLkr3EDAgk7jXr5RH/RO4THw8pSPYhX8UDYDwx4TsNQj6H27OYWkw==
X-Received: by 2002:a05:6512:2002:b0:50b:b918:8065 with SMTP id
 a2-20020a056512200200b0050bb9188065mr2958530lfb.34.1701257422475;
        Wed, 29 Nov 2023 03:30:22 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id
 y5-20020a056402440500b0054af224a87bsm6213829eda.33.2023.11.29.03.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 03:30:22 -0800 (PST)
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
Subject: [PATCH 3/4] ASoC: dt-bindings: qcom,lpass-va-macro: Add SM8650 LPASS
 VA
Date: Wed, 29 Nov 2023 12:30:13 +0100
Message-Id: <20231129113014.38837-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231129113014.38837-1-krzysztof.kozlowski@linaro.org>
References: <20231129113014.38837-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3HJXT6BVBTZLX3RWLMXCZNNV32I2QLKX
X-Message-ID-Hash: 3HJXT6BVBTZLX3RWLMXCZNNV32I2QLKX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3HJXT6BVBTZLX3RWLMXCZNNV32I2QLKX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add bindings for Qualcomm SM8650 Low Power Audio SubSystem (LPASS) VA
macro codec, which looks like compatible with earlier SM8550.

Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/qcom,lpass-va-macro.yaml   | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 4a56108c444b..ca6b07d5826d 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -11,12 +11,16 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - qcom,sc7280-lpass-va-macro
-      - qcom,sm8250-lpass-va-macro
-      - qcom,sm8450-lpass-va-macro
-      - qcom,sm8550-lpass-va-macro
-      - qcom,sc8280xp-lpass-va-macro
+    oneOf:
+      - enum:
+          - qcom,sc7280-lpass-va-macro
+          - qcom,sm8250-lpass-va-macro
+          - qcom,sm8450-lpass-va-macro
+          - qcom,sm8550-lpass-va-macro
+          - qcom,sc8280xp-lpass-va-macro
+      - items:
+          - const: qcom,sm8650-lpass-va-macro
+          - const: qcom,sm8550-lpass-va-macro
 
   reg:
     maxItems: 1
@@ -115,8 +119,9 @@ allOf:
       properties:
         compatible:
           contains:
-            enum:
-              - qcom,sm8550-lpass-va-macro
+            contains:
+              enum:
+                - qcom,sm8550-lpass-va-macro
     then:
       properties:
         clocks:
-- 
2.34.1

