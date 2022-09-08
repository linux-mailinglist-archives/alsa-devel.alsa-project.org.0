Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 548685B1898
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 11:25:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E56C716FE;
	Thu,  8 Sep 2022 11:24:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E56C716FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662629111;
	bh=4ko06AIocHatO0IlA1fIGGEdjuw3yANxkRwDZ/3nW/c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KIWqE7tb9FQz7W8LHWoJMGdaEdRnYNh/yETZ/yFlVkwO+6GjA9Cd9XQGTzZvlhgcj
	 cCHc6GrHrp5WyQ2KiVCYIHdl7E0yV2Uh4dq0fE2igXmMerTqGVbb1SzIKTK0QdTMZZ
	 BSK1foNuHeI2anuDtAShWHzl64jjKGnwR7NDVGLI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29895F805C3;
	Thu,  8 Sep 2022 11:20:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E31DCF8057D; Thu,  8 Sep 2022 11:20:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51443F8057D
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 11:20:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51443F8057D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="YH94jeZa"
Received: by mail-lj1-x234.google.com with SMTP id x10so19148220ljq.4
 for <alsa-devel@alsa-project.org>; Thu, 08 Sep 2022 02:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=/9JIT1QugDrGf1OxGIQaaREkYREoMbYTQ7fht5bGWRo=;
 b=YH94jeZaGjiAt7N+BveeNhCjiyHS8gGpaC7ynzdJIJSi79FbinYrvwnS9chRBNsRKy
 e4hVRcwqpMWL6j3YXLpHBVA2IUVoo8onXqFgZfpN/v3E4JLZPb+TV/0+zd/vDyoBCPzt
 cO3c1Y7GUSJCq5Eb6jD23btbrl9YzLOoRnuMlPLwI6A4aHAvY0/1oyWTQjxtQXBry4+2
 xQb3kb9/quVSx8WaMQ7Nrp125M6wCbc5hV9UkxJRsCx/phtRVMlXD9LqmIT0ka+XQUyg
 qKqJVsjeYHT/N6adkR5Cmxq1swbUHq62aYTmN1T4MSzk6sQu4UbquUvAOK/vUfIGJ9gO
 Ff3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/9JIT1QugDrGf1OxGIQaaREkYREoMbYTQ7fht5bGWRo=;
 b=eiPBEX/Ko19aGfdY4HydS49JBPDnnHKDGNL6RZLmHpydnhQDyRhlQW22UgC87oUhPX
 Sr0y2bceSNYWHy+Dd52sMLWrZOQ/VBzkAbmFItPRT+yo1Uzz4C1SP82rYN3Z+eJDfYCn
 Sk2pegqZ1+ziVBuGC+8LFpGMe16ry6575HGr5fPiWZRiaz4hCoDUlIKgv3/ytZ1GBvYS
 cKHBzZAkSqsB1E2D9/Ffa9V+IXHGkMn6f+8FQdEWiR8noId7iGa0qCXpXY6+8IfpKGZp
 7lqGMfj1b6pbUb4J/VY9zlRB6rLd5xFtOIoADcZqh/V7qxEi16gjQHJTG6vzk7Djnae1
 0kUA==
X-Gm-Message-State: ACgBeo0/m6vJXMGO9okv9IlJkGgCtWPiEDR0t2g2JGPhikI4uhQYDF/o
 66G8OQuIp7bD6OQYRlyoQy0f3w==
X-Google-Smtp-Source: AA6agR5ZHgdochYVCe6yWvNjdCbg2QV60T6mhPC8fkxAHTK0UGiiIg6GTAhAHUqM+DMyuMBanE3Oug==
X-Received: by 2002:a2e:b6d3:0:b0:26b:ddd7:919 with SMTP id
 m19-20020a2eb6d3000000b0026bddd70919mr26695ljo.491.1662628808264; 
 Thu, 08 Sep 2022 02:20:08 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a056512211100b004946a758d21sm218219lfr.161.2022.09.08.02.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 02:20:07 -0700 (PDT)
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
Subject: [PATCH v3 14/14] dt-bindings: soc: qcom: apr: add missing properties
Date: Thu,  8 Sep 2022 11:19:46 +0200
Message-Id: <20220908091946.44800-15-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220908091946.44800-1-krzysztof.kozlowski@linaro.org>
References: <20220908091946.44800-1-krzysztof.kozlowski@linaro.org>
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
index a1a8f77beef7..4060bac759e1 100644
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
 
@@ -171,6 +194,30 @@ required:
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

