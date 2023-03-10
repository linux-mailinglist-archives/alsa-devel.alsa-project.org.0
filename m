Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6E66B4053
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 14:24:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3DBE1838;
	Fri, 10 Mar 2023 14:23:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3DBE1838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678454645;
	bh=5gHnFM4rOILAVgKBZEHdZoPHi9yJjJVg8IX+esrrYSc=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QO/LCmgh6RoTnJNAh7yVYRP5Mvmb5te6CjJktTiTPDPtNluxrV1+F8if91ViDeQoZ
	 2d6KPpGir9CSebYvr5dsEVpR74j+tczZn3/hgYg2CcePAblcxZHkFbfydUH/T2jZQQ
	 sheb/3yT8dw8Dc4JGync2vbF3QFj28N2pgYMB3vU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A3B8F8051B;
	Fri, 10 Mar 2023 14:22:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12687F80520; Fri, 10 Mar 2023 14:22:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39627F8042F
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 14:22:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39627F8042F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=oLwGVvsu
Received: by mail-ed1-x534.google.com with SMTP id a25so20525575edb.0
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 05:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678454529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fDF0ZYXFDOllcKLsEzC0jJ5Ov6N9QuMsH10mVyhVQIQ=;
        b=oLwGVvsu4v/dczo8heTsQZTwVOKSatJ3guqetRKyIQUX0n+ilG+gjQ5StwZyfWd6Je
         ujoIULrFgb9ww6EtVZW332WURx5ePBT4fcrA6sb27dFmxxWQed5S80gDXdb+MmvOrTCv
         GtwGtcpS24mXGMserupwBs8l1e4X6PeV2x3C/PP6d131xKEdjZjB1VxAG/NZQJlFmq8E
         nh2rf+rCKWMz6TfrAJgtpoHYHYsKx2dn6Bz/VbHN96Lw+RruQJTNBPlSbp0QZRLgHKdx
         K8h7EpwJQxAlKggQUO5i/bgYylQv2h3J3Z7x+RSIQSRY75S7YosyQZHzrKArqjxfuT9f
         lH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678454529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fDF0ZYXFDOllcKLsEzC0jJ5Ov6N9QuMsH10mVyhVQIQ=;
        b=7k2Cxt429kKxtYqcKPsg5tMn9OjHLS3eNFE8gp6TPDF8+BrOKOARIkd84yaK8BwIMg
         GrN2rBJxmau+Kar1MTXHXW4XipD2Tykh+I9DFX4raWdtFJ/UUKQqQF4oLFQjbNT/dADS
         GNNhAiVBldSsgYNAxFV4EAXIACcTgx2HWzjHOACVxuUAR5rcKBXYzyzrF6moya48BDZd
         BFG+OaUQynMlEri/jEOqmHV3x+LQW8zauJbqYrQpgeNsop8jKhb3QTH5E2Y/l8r59yF9
         SaRswk0gic8BoRzqlaUdBU4jAkydrV+AS9V/frcZTdNwt4G4HQfZVHjBtlyIX73ohGTo
         /3dw==
X-Gm-Message-State: AO0yUKXewCHlV+kLxsqkLt5PG6I7Y1RyS3xxWsnQWwfMaHl/dW01Rk8I
	kHRC0cafQTvOYIHKxKA6o1cS0w==
X-Google-Smtp-Source: 
 AK7set89Qn/1m1aeZv+N9sciSUxqSHuGksR73sKrN3UIa/BGEEosLsI4sUmNPKBLS69d2ARaCBE5wg==
X-Received: by 2002:a17:907:7244:b0:8b1:78b6:bbd7 with SMTP id
 ds4-20020a170907724400b008b178b6bbd7mr31804262ejc.10.1678454529523;
        Fri, 10 Mar 2023 05:22:09 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:45c4:46be:ec71:4a51])
        by smtp.gmail.com with ESMTPSA id
 zc4-20020a170906988400b008b17879ec95sm959124ejb.22.2023.03.10.05.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 05:22:09 -0800 (PST)
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
Subject: [PATCH 5/9] ASoC: dt-bindings: qcom,lpass-tx-macro: Add SM8550 TX
 macro
Date: Fri, 10 Mar 2023 14:21:57 +0100
Message-Id: <20230310132201.322148-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310132201.322148-1-krzysztof.kozlowski@linaro.org>
References: <20230310132201.322148-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DIFQ7V3WWRPOZHY2VLIICQKJHIWEQMPN
X-Message-ID-Hash: DIFQ7V3WWRPOZHY2VLIICQKJHIWEQMPN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DIFQ7V3WWRPOZHY2VLIICQKJHIWEQMPN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the TX macro codec on Qualcomm SM8550, which comes without NPL clock
exposed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/qcom,lpass-tx-macro.yaml    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
index 559da2509d8d..9d6e67524daf 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -15,6 +15,7 @@ properties:
       - qcom,sc7280-lpass-tx-macro
       - qcom,sm8250-lpass-tx-macro
       - qcom,sm8450-lpass-tx-macro
+      - qcom,sm8550-lpass-tx-macro
       - qcom,sc8280xp-lpass-tx-macro
 
   reg:
@@ -96,6 +97,23 @@ allOf:
             - const: dcodec
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm8550-lpass-tx-macro
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

