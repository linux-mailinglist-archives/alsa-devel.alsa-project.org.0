Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 771D87FD5C5
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 12:31:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37DF6E7B;
	Wed, 29 Nov 2023 12:31:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37DF6E7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701257512;
	bh=t62ACs0kNeD1U9FbFwgH5TdB9J8Y3coEvFOFwrYcEek=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=phAMbV1lazSXPF+pkf1JpWxRS8solJRTyZUNbWywFs4td3X7NhSMYB9Sv/9oYmgTA
	 jDKIGhy/kgyuLrDg81JXm2/1iNzwQvQWMbRCbGX+ShgTEmhWeFzYDyAGk9xlbZwoLa
	 tk0dVxjw1wO9TosSA6oBWtAvpN3Bzw9DItDHpO3I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A810F80610; Wed, 29 Nov 2023 12:30:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BC51F8060F;
	Wed, 29 Nov 2023 12:30:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57305F80166; Wed, 29 Nov 2023 12:30:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B55FF8016E
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 12:30:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B55FF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=T7YiTcdj
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-548f853fc9eso8555510a12.1
        for <alsa-devel@alsa-project.org>;
 Wed, 29 Nov 2023 03:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701257424; x=1701862224;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FuoTW5fNts47GPp/zz/U4BPEMqSdOcRJOpgotFGXLGo=;
        b=T7YiTcdj8Q1VtyENb9MRUMckDFz20IuRwHXFw0oKKdBV+ZRpj4LLxPlI81HN1ymGaM
         CjxC5PuZ3BHexcHTLDaqfJ2F6+dz8WfHCpWAA0AUkLsAvAOImsoP2GtV6GSTcNX9cKQ4
         qk3vnAe2z7kPOTe/AelGG8cx8o2TJFKoI6OtIqMZIte/sYMAt0IsJuS23BJFGlG5MTMN
         urv1oOHuZBkqDh86c2HZGYe9NSksfYP8pXcNI9ALmQU3PMFs2bF60hZqsKGDM4lmOlhh
         5P64dlK4Voi0xXSC/Mns0gYFQkjrJfMPr8fXg+g3bzdMM4rSXRH+OwpgJbgisbmmFyrz
         Chyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701257424; x=1701862224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FuoTW5fNts47GPp/zz/U4BPEMqSdOcRJOpgotFGXLGo=;
        b=saeXZ2QSb9l74DediwoTDrOhCtiRvNvXiVAvju+l6D6Xk5rd4wqGtqUKP0x6xVUl1y
         bB8rqz8VNaKt7TM4mqCalykveGysS5tGjbMCkQ6H94P9EWwQBKmV9p3dPN4pFc7MF/aa
         zheLMviPdVew7j3K397AXQlMiub+A15vEcxnL7BqiizjnATiGdUAS/OmD4gx1FWr4dMm
         kfnZ96a8sUHZjZTS+AfHtUb9Buxt0qX8yQgF76gpuyDiZsjZ2CKF8F4goeSMHgrxN54H
         oJkAPcxJmAjkk7TZXy1xhnEROnvZNhiivPINbIpmLhudmj+67ZwuGZXXBbRuGani+D7f
         XFng==
X-Gm-Message-State: AOJu0Yw7APEgkM6oVxjhBC4GnfaAXPufmV/V8LmyBoPRR8yBXpiFqw6k
	q7C31D3EI9G7TYDNm/eoou08og==
X-Google-Smtp-Source: 
 AGHT+IEHx5bvhNh2IGOAE7PXOlw27mYMxj7q8yRLiaQc1GYWBHE0clKsOrSLO7MzxHMzKLVRVjkuPw==
X-Received: by 2002:aa7:df0c:0:b0:54b:52c4:68a5 with SMTP id
 c12-20020aa7df0c000000b0054b52c468a5mr7456394edy.39.1701257424378;
        Wed, 29 Nov 2023 03:30:24 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id
 y5-20020a056402440500b0054af224a87bsm6213829eda.33.2023.11.29.03.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 03:30:24 -0800 (PST)
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
Subject: [PATCH 4/4] ASoC: dt-bindings: qcom,lpass-wsa-macro: Add SM8650 LPASS
 WSA
Date: Wed, 29 Nov 2023 12:30:14 +0100
Message-Id: <20231129113014.38837-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231129113014.38837-1-krzysztof.kozlowski@linaro.org>
References: <20231129113014.38837-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IQHLOOQBXRY4NSTR5DPDZKJ2BUD7PL26
X-Message-ID-Hash: IQHLOOQBXRY4NSTR5DPDZKJ2BUD7PL26
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IQHLOOQBXRY4NSTR5DPDZKJ2BUD7PL26/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add bindings for Qualcomm SM8650 Low Power Audio SubSystem (LPASS) WSA
macro codec, which looks like compatible with earlier SM8550.

Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/qcom,lpass-wsa-macro.yaml  | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
index eea7609d1b33..5fb39d35c8ec 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
@@ -11,12 +11,16 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - qcom,sc7280-lpass-wsa-macro
-      - qcom,sm8250-lpass-wsa-macro
-      - qcom,sm8450-lpass-wsa-macro
-      - qcom,sm8550-lpass-wsa-macro
-      - qcom,sc8280xp-lpass-wsa-macro
+    oneOf:
+      - enum:
+          - qcom,sc7280-lpass-wsa-macro
+          - qcom,sm8250-lpass-wsa-macro
+          - qcom,sm8450-lpass-wsa-macro
+          - qcom,sm8550-lpass-wsa-macro
+          - qcom,sc8280xp-lpass-wsa-macro
+      - items:
+          - const: qcom,sm8650-lpass-wsa-macro
+          - const: qcom,sm8550-lpass-wsa-macro
 
   reg:
     maxItems: 1
@@ -94,8 +98,9 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sm8550-lpass-wsa-macro
+          contains:
+            enum:
+              - qcom,sm8550-lpass-wsa-macro
     then:
       properties:
         clocks:
-- 
2.34.1

