Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB10E629814
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 13:04:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8704D168B;
	Tue, 15 Nov 2022 13:03:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8704D168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668513875;
	bh=L6MGAIjTQ5XI9Ew/xE+BIcucXkFu8KDb+n6LlcZFjr4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XU6/FgA/tkbuYuTX+u4I0IsadYFA7DlcDuUHUQ4nFaKfCwYVjLCNOonHB2b/FmW/s
	 f7fBdGNhHijrM+JJKmSKn/iptFvIjnpMsEWqlXmfCWVe/RJT8CgngEK29nbQv4UPtR
	 cu2OT1siuYi8587f+YYmnWXSprBeV0FnUxiLlsJU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CAECF800B5;
	Tue, 15 Nov 2022 13:02:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC9B8F80559; Tue, 15 Nov 2022 13:02:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6062F800B5
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 13:02:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6062F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="sJ6zc/nJ"
Received: by mail-lj1-x22b.google.com with SMTP id b9so17230760ljr.5
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 04:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=afNI0b/iz5bqmWxZzda65ypkON8o+45VDO2joMDytGk=;
 b=sJ6zc/nJho9IF7dHq+gwieTQIhLHXKfvXWlhjnTzuQUvJlGozSCJi56FtoaT8axaIH
 aTWIIynUt5esgSvZhKqI1KVLFjOhWRrzxvQPlUHkOUifCzEoj+0WFyFGsBJqDviIyM/s
 4Mf7cU4JjYYyTruJZM9Wpfm0sEryE56XnojkN+JL2mymS03V6SFp8rBsXv1vYL8MHkaD
 R4o3GO+JuHfiWofDZnSQk8mvaTg0J4cK29FG/Ffk7dsCGH8kDqkSfqLWXCsXnTuMAp1c
 0Uf8nwMgM0ZFXGw188kBeZPfWVnsg1YMf5U7L4qMMfD4sIXX6fGQeYw2i22PdHxdFHux
 DuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=afNI0b/iz5bqmWxZzda65ypkON8o+45VDO2joMDytGk=;
 b=L1sS6hdGm2P/5IMTFAVnD3rbkYTy8Cz+ko6Z0lx9a4Q1RmvL3nCJyU8V+AGi0csxil
 lB06aQbYDrG1kDZkQ7nOdMw8+qtMJVdC5EaqOZwLCyEEnpYZLcNNxZMmXJxLXu8tPbS0
 mNJmk5sR6NDTMmKWkO7Qw07LPKg36tU2PYVXLB/VNFTAxzwNMxqN6iOgkXeq+O97tpn+
 0lTroVisyG6MHDtWsL0hdXTjCD2wZeT/jjs80WLY0NoNjtPAsNJ77KNNyKReKLYs0smP
 xKRoMsn9UN4okvl4FQs5IfElq0PmCeYL4+MCN01kDZga/ILHyehm0G3St6q6OyaMDsqx
 YktA==
X-Gm-Message-State: ANoB5pmdUVOGfZOpXWxPdXrL6rbiLVDyVtrcmYXxqgyfIjieCtH3ANzV
 nyncTYyvqarHcGrrIfnswjKsSw==
X-Google-Smtp-Source: AA0mqf4YzrtWT56H/aAnBjsioD0paB87aXAv3INFtEJ/8KIqZpBzt+aOe67OmMq4u++GM5kX+lLZrQ==
X-Received: by 2002:a05:651c:1790:b0:26c:4e3a:516 with SMTP id
 bn16-20020a05651c179000b0026c4e3a0516mr6025476ljb.510.1668513766208; 
 Tue, 15 Nov 2022 04:02:46 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 i13-20020ac25d2d000000b004b0b2212315sm2176233lfb.121.2022.11.15.04.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 04:02:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/11] ASoC: dt-bindings: qcom,
 apr: Split services to shared schema
Date: Tue, 15 Nov 2022 13:02:26 +0100
Message-Id: <20221115120235.167812-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115120235.167812-1-krzysztof.kozlowski@linaro.org>
References: <20221115120235.167812-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: quic_plai@quicinc.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 quic_srivasam@quicinc.com
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

The APR/GPR nodes are organized like:

  apr-or-gpr-device-node <- qcom,apr.yaml
    apr-gpr-service@[0-9] <- qcom,apr.yaml
      service-specific-components <- /schemas/sound/qcom,q6*.yaml

The schema for services (apr-gpr-service@[0-9]) already grows
considerably and is still quite not specific.  It allows several
incorrect combinations, like adding a clock-controller to a APM device.
Restricting it would complicate the schema even more.  Bringing new
support for sound on Qualcomm SM8450 and SC8280XP SoC would grow it as
well.

Simplify the qcom,apr.yaml by splitting the services to a shared file
which will be:
1. Referenced by qcom,apr.yaml with additionalProperties:true,
2. Referenced by specific bindings for services with
   additionalProperties:false (not yet in this commit).

While moving the code, add also required 'reg' and
'qcom,protection-domain' to further constrain the bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Keep compatibles in qcom,apr.yaml

Cc: quic_srivasam@quicinc.com
Cc: quic_plai@quicinc.com
---
 .../bindings/soc/qcom/qcom,apr-services.yaml  | 54 ++++++++++
 .../bindings/soc/qcom/qcom,apr.yaml           | 98 +------------------
 MAINTAINERS                                   |  2 +-
 3 files changed, 58 insertions(+), 96 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,apr-services.yaml

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr-services.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr-services.yaml
new file mode 100644
index 000000000000..290555426c39
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr-services.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/qcom/qcom,apr-services.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm APR/GPR services shared parts
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description:
+  Common parts of a static service in Qualcomm APR/GPR (Asynchronous/Generic
+  Packet Router).
+
+properties:
+  reg:
+    minimum: 1
+    maximum: 13
+    description: |
+      APR Service ID
+        3 = DSP Core Service
+        4 = Audio  Front End Service.
+        5 = Voice Stream Manager Service.
+        6 = Voice processing manager.
+        7 = Audio Stream Manager Service.
+        8 = Audio Device Manager Service.
+        9 = Multimode voice manager.
+        10 = Core voice stream.
+        11 = Core voice processor.
+        12 = Ultrasound stream manager.
+        13 = Listen stream manager.
+      GPR Service ID
+        1 = Audio Process Manager Service
+        2 = Proxy Resource Manager Service.
+        3 = AMDB Service.
+        4 = Voice processing manager.
+
+  qcom,protection-domain:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description: |
+      Protection domain service name and path for APR service
+      possible values are::
+      "avs/audio", "msm/adsp/audio_pd".
+      "kernel/elf_loader", "msm/modem/wlan_pd".
+      "tms/servreg", "msm/adsp/audio_pd".
+      "tms/servreg", "msm/modem/wlan_pd".
+      "tms/servreg", "msm/slpi/sensor_pd".
+
+required:
+  - reg
+  - qcom,protection-domain
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
index 0a7a34cb2497..1fab1d9a2dad 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
@@ -80,12 +80,13 @@ properties:
   '#size-cells':
     const: 0
 
-#APR/GPR Services
 patternProperties:
   "^service@[1-9a-d]$":
     type: object
+    $ref: /schemas/soc/qcom/qcom,apr-services.yaml
+    additionalProperties: true
     description:
-      APR/GPR node's client devices use subnodes for desired static port services.
+      APR/GPR static port services.
 
     properties:
       compatible:
@@ -97,99 +98,6 @@ patternProperties:
           - qcom,q6apm
           - qcom,q6prm
 
-      reg:
-        minimum: 1
-        maximum: 13
-        description:
-          APR Service ID
-            3 = DSP Core Service
-            4 = Audio  Front End Service.
-            5 = Voice Stream Manager Service.
-            6 = Voice processing manager.
-            7 = Audio Stream Manager Service.
-            8 = Audio Device Manager Service.
-            9 = Multimode voice manager.
-            10 = Core voice stream.
-            11 = Core voice processor.
-            12 = Ultrasound stream manager.
-            13 = Listen stream manager.
-          GPR Service ID
-            1 = Audio Process Manager Service
-            2 = Proxy Resource Manager Service.
-            3 = AMDB Service.
-            4 = Voice processing manager.
-
-      clock-controller:
-        $ref: /schemas/sound/qcom,q6dsp-lpass-clocks.yaml#
-        description: Qualcomm DSP LPASS clock controller
-        unevaluatedProperties: false
-
-      dais:
-        type: object
-        oneOf:
-          - $ref: /schemas/sound/qcom,q6apm-dai.yaml#
-          - $ref: /schemas/sound/qcom,q6dsp-lpass-ports.yaml#
-          - $ref: /schemas/sound/qcom,q6asm-dais.yaml#
-        unevaluatedProperties: false
-        description: Qualcomm DSP audio ports
-
-      routing:
-        type: object
-        $ref: /schemas/sound/qcom,q6adm-routing.yaml#
-        unevaluatedProperties: false
-        description: Qualcomm DSP LPASS audio routing
-
-      qcom,protection-domain:
-        $ref: /schemas/types.yaml#/definitions/string-array
-        description: protection domain service name and path for apr service
-          possible values are
-          "avs/audio", "msm/adsp/audio_pd".
-          "kernel/elf_loader", "msm/modem/wlan_pd".
-          "tms/servreg", "msm/adsp/audio_pd".
-          "tms/servreg", "msm/modem/wlan_pd".
-          "tms/servreg", "msm/slpi/sensor_pd".
-
-    allOf:
-      - if:
-          properties:
-            compatible:
-              enum:
-                - qcom,q6afe
-        then:
-          properties:
-            dais:
-              properties:
-                compatible:
-                  const: qcom,q6afe-dais
-
-      - if:
-          properties:
-            compatible:
-              enum:
-                - qcom,q6apm
-        then:
-          properties:
-            dais:
-              properties:
-                compatible:
-                  enum:
-                    - qcom,q6apm-dais
-                    - qcom,q6apm-lpass-dais
-
-      - if:
-          properties:
-            compatible:
-              enum:
-                - qcom,q6asm
-        then:
-          properties:
-            dais:
-              properties:
-                compatible:
-                  const: qcom,q6asm-dais
-
-    additionalProperties: false
-
 required:
   - compatible
   - qcom,domain
diff --git a/MAINTAINERS b/MAINTAINERS
index 3df7b9a3f5ba..804e4a700477 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16893,7 +16893,7 @@ M:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 M:	Banajit Goswami <bgoswami@quicinc.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Supported
-F:	Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
+F:	Documentation/devicetree/bindings/soc/qcom/qcom,apr*
 F:	Documentation/devicetree/bindings/sound/qcom,*
 F:	drivers/soc/qcom/apr.c
 F:	include/dt-bindings/sound/qcom,wcd9335.h
-- 
2.34.1

