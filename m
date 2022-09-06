Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C01C5AE7CE
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 14:21:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA3A684D;
	Tue,  6 Sep 2022 14:20:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA3A684D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662466887;
	bh=NimpxDQcRHmBsKiCBw/Z1T9Gjg5AZ1D4dLoTmmbI56Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m8IlHvVgX50ykq3B2iZ9pHNWOgOAzUq8QiHY6UQxR2JbifCVEfm6qN/qsDETFNKFg
	 ft37aRM5dEc5vwm5TVEiYVBrV5mQWh8uMHwNFa6tkYoYPrFKvRDpB8xRjjpZMZ0gkE
	 nqZ8Mnq6miQq8rpRzAtvgxIUOM6K+6bEiwXBz/bk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5F1AF805A9;
	Tue,  6 Sep 2022 14:17:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57148F8059F; Tue,  6 Sep 2022 14:17:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24CEDF80571
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 14:17:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24CEDF80571
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ugvZDhjw"
Received: by mail-lf1-x129.google.com with SMTP id f11so3065775lfa.6
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 05:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=2dRasoeQYKD9lUuxkX3Pwyaj6+42wbyoBHrZ4mafH0E=;
 b=ugvZDhjwi+o/CKjP/IouRer9hsKQE/IShwDJWX2GVCE0PsTYTc8kggr3pxLqnmLddt
 6lm897j+lI3p2SvZIESDsd7EVSlDuQaFn+mSAy5zMux387PBcHci3kEobDhY7RkLEjJ1
 zJTC2yoRRCGzJMxTwoRztiMfSYDv6Kdd22WUOFGBkqH0/FcRf1cBg/e/Lw5Jcw/w7m1B
 UBJ+VSCJnNVnm6dQVEdzzu3GquO0DRL002Mj+0EO6MNNGFBSzB+tF5pkV0eAVPTOavvN
 YrIZxDgFHe88J0d7DNGy981BzjJE6dd68PguQT/6koo30iWg8sI0AtwbGyBDeveJpKMZ
 aW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=2dRasoeQYKD9lUuxkX3Pwyaj6+42wbyoBHrZ4mafH0E=;
 b=A3zIgbwkq7ehIHoOTKt0GmWLjxNGO1s1PhmDOJOiceKEphfZEn9clsDjXcsQiJgHIV
 9CLRbMOYY8HU08o9SlGq3XzfyfZYfupopgadXa1wpncnmJpjxeyoaZpfPM01pl7iMJTU
 CCA/rWBAPryw9tr70LVBiXzBwAduqkXdEOu/56cyDScDrPgWYi0Xu3JL5g95Du2XrWSt
 vNcA1RUnCexzQZkCzwxKCIbvG72yTV4ixQGbZq/MUz8jYDtO71rMQiKDhOM161DOmPdR
 3qrtzj9lr/VhFfbXMa5OOExyt9Mb7xwXK9tXX5m+bWYKy/CExL3lNPRYBvjHWno23ZIN
 mi7w==
X-Gm-Message-State: ACgBeo1P1wvVT7gaiHuDPPNxlFbuDLBXrWWsI/VYq/tmvGyRNs1kbBwM
 /vll8QJU7KbpKvf6oRQl9n6eMhZ/eGAcCg==
X-Google-Smtp-Source: AA6agR5uRpN2fHqICsz6h6L0l+NvT3OMWQHWviqg02DAMxCixLCtyjK14itmG3vaM0ZZDnwo4510og==
X-Received: by 2002:ac2:5d6e:0:b0:494:8b61:f778 with SMTP id
 h14-20020ac25d6e000000b004948b61f778mr9182527lft.568.1662466634204; 
 Tue, 06 Sep 2022 05:17:14 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a05651c131100b0025df5f38da8sm1882802lja.119.2022.09.06.05.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 05:17:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH 12/12] dt-bindings: soc: qcom: apr: add missing properties
Date: Tue,  6 Sep 2022 14:16:55 +0200
Message-Id: <20220906121655.303693-13-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
References: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
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
---
 .../bindings/soc/qcom/qcom,apr.yaml           | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
index 61b010793fca..9d8ab28b7ea6 100644
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
 
@@ -141,6 +164,30 @@ required:
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

