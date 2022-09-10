Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 211DB5B459F
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Sep 2022 11:18:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB70916BE;
	Sat, 10 Sep 2022 11:17:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB70916BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662801484;
	bh=vFRsZ2ayLbXEGaWA5+PUUGTepFYpvuL5w8eFeyp6o8w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BnmqUISm8PX9gGsTV87fcweIAuDo5pFDgQkx84NdkdX5umNENX8TSFxVZZpi9hTsU
	 EkVez55p+Al1LFCf9x8iCRpbqKSXEH9VjeXldvPckvGX66uSBAw9SSLhJBPZaBK29C
	 gOsGx5Q2/kpnsbmvL/tAJ6RZ+idq+pkVTFWtEikg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9439AF8057C;
	Sat, 10 Sep 2022 11:15:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3EE2F80568; Sat, 10 Sep 2022 11:15:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81D83F8016C
 for <alsa-devel@alsa-project.org>; Sat, 10 Sep 2022 11:14:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81D83F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Vjv2svew"
Received: by mail-lf1-x132.google.com with SMTP id q21so6786803lfo.0
 for <alsa-devel@alsa-project.org>; Sat, 10 Sep 2022 02:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=rmqQ4kjPWFQWglKjigsMWHNac7/x7IFTq30UtYcnmqY=;
 b=Vjv2svewyIN2U5P6rvQjir03D+g6EpmVV3R6ajRIKLNBxcpOyr4c4UkbjxSM2TJMEy
 X+uE+EHNFtIz8QgvKTsrOU9PktlAgLEH22tw6yVTmv7GIFcDbPr/VtOqGgwfR1NMwfOw
 vILCk45ixAfgzYbW3ggWvrPOSHlJ+0h1N+FUZ4ufHrp0bz93hydaUtQ+mvXQWkWA2Yco
 jcSuqcQkHn1OD5ndnsaPbY5cBFgLLZfKrWIP8iWBBpslUS75Qv0MYRM9aseg1myl8LLC
 VBFGtXf/oWA1EA23L2E/nbzjOC7v0tGI2rZjT0BPoK0wLpfKqFt7jRFs4M9tO7pnq/sy
 i6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=rmqQ4kjPWFQWglKjigsMWHNac7/x7IFTq30UtYcnmqY=;
 b=y8vLjE54kTUtN71nsDln1YC+RohE/ro4xeGpnJ4cqouta72TwXoJl9mW8Wz0E2YOLA
 5Nt0DM1RDTg/LKsigUcGpqfsIYILhJ7bNAYfprLT9dM0n7n0oQrT4Lbz0B0K5cvtLknz
 ymyOBdKmN0b24veBcJRqyyTEcFHmYYwoK2VQyf2jXAwJRwqR5X1t8gQfgqtFP5fp5nzr
 94Hy3Qfb5sDdMyKKtzH7v22m+MlHOZHsc3mBZexhlIFtxeLx99FNrfPvYap3nnmHIO3p
 aOI0/45a8Ak+n7rAfIDxSOINxhv66j6PnrBm32HWKIjovveCwNu0SwUvy2t9hWZXn9ge
 168Q==
X-Gm-Message-State: ACgBeo2fASPWn9nF45sL3pMG/vfoVEhxIxB0+q6Tz0vkA+jybFl0lsRc
 zqrEsMlovEXeyx05ghxyE4emag==
X-Google-Smtp-Source: AA6agR5M2+DIslDj5uqNrZ+M/RK85p19Fiy/OF3lTqm4PY6EnhQ2RxNj9gfL7c/DjWGFWotv07lyEA==
X-Received: by 2002:a05:6512:4002:b0:499:280:9c5b with SMTP id
 br2-20020a056512400200b0049902809c5bmr1753800lfb.593.1662801295116; 
 Sat, 10 Sep 2022 02:14:55 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a19e016000000b0048b26d4bb64sm201552lfg.40.2022.09.10.02.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Sep 2022 02:14:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 15/15] dt-bindings: soc: qcom: apr: add missing properties
Date: Sat, 10 Sep 2022 11:14:28 +0200
Message-Id: <20220910091428.50418-16-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220910091428.50418-1-krzysztof.kozlowski@linaro.org>
References: <20220910091428.50418-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The APR bindings were not describing all properties already used in DTS:
1. Add qcom,glink-channels, qcom,smd-channels and qcom,intents (widely
   used).
2. Add power-domains for MSM8996.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/soc/qcom/qcom,apr.yaml           | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
index 54328d74af85..f47491aab3b1 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
@@ -20,6 +20,9 @@ properties:
       - qcom,apr-v2
       - qcom,gpr
 
+  power-domains:
+    maxItems: 1
+
   qcom,apr-domain:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [1, 2, 3, 4, 5, 6, 7]
@@ -52,6 +55,26 @@ properties:
         2 = Audio DSP Domain
         3 = Application Processor Domain
 
+  qcom,glink-channels:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description: Channel name used for the communication
+    items:
+      - const: apr_audio_svc
+
+  qcom,intents:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      List of (size, amount) pairs describing what intents should be
+      preallocated for this virtual channel. This can be used to tweak the
+      default intents available for the channel to meet expectations of the
+      remote.
+
+  qcom,smd-channels:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description: Channel name used for the communication
+    items:
+      - const: apr_audio_svc
+
   '#address-cells':
     const: 1
 
@@ -172,6 +195,30 @@ required:
   - compatible
   - qcom,domain
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,gpr
+    then:
+      properties:
+        power-domains: false
+
+  - if:
+      required:
+        - qcom,glink-channels
+    then:
+      properties:
+        qcom,smd-channels: false
+
+  - if:
+      required:
+        - qcom,smd-channels
+    then:
+      properties:
+        qcom,glink-channels: false
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

