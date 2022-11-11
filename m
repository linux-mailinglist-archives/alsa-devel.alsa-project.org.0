Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C388625992
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 12:38:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD79B1670;
	Fri, 11 Nov 2022 12:37:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD79B1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668166728;
	bh=uxHpFAnyQFqcTwCcHzjOTefAgKyXV79W4JOWlgkDooQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NJo85Zr0FKQkLpryRcSXDuqFWTUdREEdD8AlbsXH5jDdG27AfMQh4kLOs5ovFpIlh
	 569H1ixIndF9b/pX3tYxdYGj4GbcDNUkkYE4JOMIS8l3J5tuZbH5l293q8ePYhXBU2
	 F0NLZS7h7MY993x5hGacpHNUWGvSJfYlbAJjKDnk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C678AF80571;
	Fri, 11 Nov 2022 12:36:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6095F8055A; Fri, 11 Nov 2022 12:36:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1406EF8028D
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 12:36:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1406EF8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="DPf9pv4B"
Received: by mail-lf1-x136.google.com with SMTP id d6so7889263lfs.10
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 03:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EB4I3WqkMG0ssDPCVcZC0Ysf3XgZOuA6bOA7vE338fY=;
 b=DPf9pv4Blnc4lpQ5nhDMbtzrHDpDPhl3i+pMnLqzqRL5Jz1nglnLY8GehobSi+9D+z
 awTpJAA8Acp0z1pL5cieOf8Bp0ICe2LVVV9l5xwpAhnnrO5k+Ok0CJwSSH13bhltmqNr
 J6MzlKPHfsLn3n3DwFkJX306e5TmfH4cPOxoKY+uQZesUC3mEfvshqzjVZrNUZRa65ud
 71iFSEhEI08KxAWlErEaul7veH7nGWnVsyCn8lZxtDgCrKWorrRBfZjvrlnfYF0XKAJb
 Ha+Z6G5N9kiqyOGybC26DAyvZocAm29rQD6hpXW0C0NfrGx5apy3JlH5Mm9rjWaxz54H
 GgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EB4I3WqkMG0ssDPCVcZC0Ysf3XgZOuA6bOA7vE338fY=;
 b=32Sd4LTiP26oatThTIQiUwWp3JOF99DRsX/z/vBV+y/rat7EU6AD27YEg7oGrOdDh1
 55Q9UYjewHy8MDX1a0sSkBM0UArqJlx5rh3YbH95ciXIt6IQ/l5kGbj6wLlMZlqKCssh
 N77hQQvjyxCNVlRX8lPLYzKjep0d4SJB6KzbeSaweOAZLbVsw5NwHi/5cu4aKZBgSP+d
 QxopJf5yC/3R5qRLZ1CfuD7Sr8KDYSPH1UIjYPcZ7MOYA/hqjb8jcjKcIm1ZzvjE14pn
 se/HQ5AgtqTJjzLAoBLi6oqR2EVFhapl8z8b9kvSc2IEMCjYICFM9zAFNno8RUmEFqRe
 mYRQ==
X-Gm-Message-State: ANoB5plPparTK3+Daf7A30+3adv+7xXpks2Bu99flUjsg/yhu9GTx1PU
 VyuBb65LzXHRz5BggMye18OrvQ==
X-Google-Smtp-Source: AA0mqf5oOhPgXEjn9JMms/293AHcWVE0ZsLElWgNb5bUqlb4jW7YvVdCR0Xcl91+irLXEz74dxa4zg==
X-Received: by 2002:a05:6512:478:b0:4a2:3d2c:34ac with SMTP id
 x24-20020a056512047800b004a23d2c34acmr568409lfd.41.1668166571013; 
 Fri, 11 Nov 2022 03:36:11 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 bi30-20020a0565120e9e00b004acb2adfa1fsm274970lfb.307.2022.11.11.03.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 03:36:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 02/10] ASoC: dt-bindings: qcom,
 apr: Split services to shared schema
Date: Fri, 11 Nov 2022 12:35:39 +0100
Message-Id: <20221111113547.100442-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111113547.100442-1-krzysztof.kozlowski@linaro.org>
References: <20221111113547.100442-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Patrick Lai <plai@qti.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Srinivasa Rao Mandadapu <srivasam@qti.qualcomm.com>
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
 .../bindings/soc/qcom/qcom,apr-services.yaml  |  54 +++++++++
 .../bindings/soc/qcom/qcom,apr.yaml           | 108 +-----------------
 MAINTAINERS                                   |   2 +-
 3 files changed, 58 insertions(+), 106 deletions(-)
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
index 0a7a34cb2497..9302ffe567d6 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
@@ -80,115 +80,13 @@ properties:
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
-
-    properties:
-      compatible:
-        enum:
-          - qcom,q6core
-          - qcom,q6asm
-          - qcom,q6afe
-          - qcom,q6adm
-          - qcom,q6apm
-          - qcom,q6prm
-
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
+      APR/GPR static port services.
 
 required:
   - compatible
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

