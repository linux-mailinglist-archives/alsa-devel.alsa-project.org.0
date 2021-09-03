Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0003FFF14
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 13:23:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AA5C1836;
	Fri,  3 Sep 2021 13:22:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AA5C1836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630668222;
	bh=SiPpm5TAh38588+qt2rglCmsJGJNmzjDQvW523L2kRA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=frE+KvEOhwiBne2lPekXXKste4f5xjqY2HCNRIo//XT3BPeyRuXcdGjxfrpBd27dV
	 K5Dlm0iJAnQ+tIFkJthtLHgvzPwubDum4cYobOVGQBwSwqIbVDTa6tqHsV6uq2VsT9
	 PPWKYOjrvzbJMeG3oLU5EMlci0FA09/7iJywGDq4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB9C8F804F3;
	Fri,  3 Sep 2021 13:21:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E6A9F804F3; Fri,  3 Sep 2021 13:21:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F59CF80227
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 13:21:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F59CF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="CVAXc/zX"
Received: by mail-wr1-x431.google.com with SMTP id z4so7726624wrr.6
 for <alsa-devel@alsa-project.org>; Fri, 03 Sep 2021 04:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oIR90abl/sfH0/3DyNtRoQ8W4nkCYWxgXrfABfULtXI=;
 b=CVAXc/zX9vEav2VQvgoDC8dPYDc3W748VQ0PehfC9sjMqCVhP0F4LASBJnqWL511Tb
 CgEmYFJlgiU3X+sz9+iZGixzp0M2zKOjzvv7mZD3962fZ8bb7OGecY8h24p8/cF5JxD5
 NKdLkHQflrXBCttI5eM134nItRcs3G3Ylt/4VNnFYpLwEbLqtSL2F+brYKxyu1M4uIYa
 kQkwkPebrICT64XpEAAOFvlxdCYJpcCLtjl2JQaef+tytBnyDaGo8clDtag7gkstALAK
 jbRneawn5xyIUD7dMax2bwG5PJIA0UdeO0wHGEGuCxj35on66f7lNP6fBhYxUU7fwLEz
 i4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oIR90abl/sfH0/3DyNtRoQ8W4nkCYWxgXrfABfULtXI=;
 b=eodlrmqVcd8i+e0FWqyZ7gIP7RKFqfONRZURxFoiFAU4YyOsK06BPzA0wt592EEar2
 NC3gE3flUR3TCXZzqIYPBm8gu1ooQE4BBJN1uYR3X7Bwq6MjsCYGl76whjWA8pBk+lP5
 r2OGuZWE8Q3u0QsX1EIVsAOE/SM3fT7sUwBRdKS5DB6OyqcI9D3vN+FsjQ7wRM62Z/dO
 KPTbguZKhJH7sY9TiLEBukm8Ruf0CENMcmD1fsyc29bH0muJCehb3eRYS+4XQr9Y1bEZ
 zyQcYjosVCzXgWeCVe01hBeFNCoBuVH30K/X6YebOo4jE8XCBZfhe1HavqT4x62Dv5/B
 3G7A==
X-Gm-Message-State: AOAM531ntg0hX/RQ1N0iquC7He6lV/LZqSVjqCwSssvaU0Zu8iXSKD3s
 AEb2Oq4fcZxxcY2kIjz7+P7q4Q==
X-Google-Smtp-Source: ABdhPJytDaDGeJG/cmR9NCL+XRcdKTrmZNjIxwCqvaSPY/9YonjkIby0wBE5LE4gqijdQ1U4W5qxpQ==
X-Received: by 2002:a5d:67c3:: with SMTP id n3mr3454870wrw.201.1630668096971; 
 Fri, 03 Sep 2021 04:21:36 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id f20sm3881877wmb.32.2021.09.03.04.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:21:36 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v5 04/21] soc: dt-bindings: qcom: add gpr bindings
Date: Fri,  3 Sep 2021 12:20:15 +0100
Message-Id: <20210903112032.25834-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210903112032.25834-1-srinivas.kandagatla@linaro.org>
References: <20210903112032.25834-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com
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

Qualcomm Generic Packet router aka GPR is the IPC mechanism found
in AudioReach next generation signal processing framework to perform
command and response messages between various processors.

GPR has concepts of static and dynamic port, all static services like
APM (Audio Processing Manager), PRM (Proxy resource manager) have
fixed port numbers where as dynamic services like graphs have dynamic
port numbers which are allocated at runtime. All GPR packet messages
will have source and destination domain and port along with opcode
and payload.

This support is added using existing APR driver to reuse most of
the code.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/soc/qcom/qcom,apr.yaml           | 41 +++++++++++++++----
 include/dt-bindings/soc/qcom,gpr.h            | 18 ++++++++
 2 files changed, 52 insertions(+), 7 deletions(-)
 create mode 100644 include/dt-bindings/soc/qcom,gpr.h

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
index 922c8567c134..14d75f6a556e 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
@@ -4,20 +4,21 @@
 $id: "http://devicetree.org/schemas/soc/qcom/qcom,apr.yaml#"
 $schema: "http://devicetree.org/meta-schemas/core.yaml#"
 
-title: Qualcomm APR (Asynchronous Packet Router) binding
+title: Qualcomm APR/GPR (Asynchronous/Generic Packet Router) binding
 
 maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
 description: |
-  This binding describes the Qualcomm APR, APR is a IPC protocol for
-  communication between Application processor and QDSP. APR is mainly
+  This binding describes the Qualcomm APR/GPR, APR/GPR is a IPC protocol for
+  communication between Application processor and QDSP. APR/GPR is mainly
   used for audio/voice services on the QDSP.
 
 properties:
   compatible:
     enum:
       - qcom,apr-v2
+      - qcom,gpr
 
   qcom,apr-domain:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -45,6 +46,10 @@ properties:
         5 = Application processor Domain
         6 = Modem2 Domain
         7 = Application Processor2 Domain
+      Selects the processor domain for gpr
+        1 = Modem Domain
+        2 = Audio DSP Domain
+        3 = Application Processor Domain
 
   '#address-cells':
     const: 1
@@ -52,12 +57,12 @@ properties:
   '#size-cells':
     const: 0
 
-#APR Services
+#APR/GPR Services
 patternProperties:
-  "^service@[3-9a-d]$":
+  "^service@[1-9a-d]$":
     type: object
     description:
-      APR node's client devices use subnodes for desired static port services.
+      APR/GPR node's client devices use subnodes for desired static port services.
 
     properties:
       compatible:
@@ -66,9 +71,11 @@ patternProperties:
           - qcom,q6asm
           - qcom,q6afe
           - qcom,q6adm
+          - qcom,q6apm
+          - qcom,q6prm
 
       reg:
-        enum: [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
+        enum: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
         description:
           APR Service ID
             3 = DSP Core Service
@@ -82,6 +89,11 @@ patternProperties:
             11 = Core voice processor.
             12 = Ultrasound stream manager.
             13 = Listen stream manager.
+          GPR Service ID
+            1 = Audio Process Manager Service
+            2 = Proxy Resource Manager Service.
+            3 = AMDB Service.
+            4 = Voice processing manager.
 
       qcom,protection-domain:
         $ref: /schemas/types.yaml#/definitions/string-array
@@ -140,3 +152,18 @@ examples:
           qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
         };
     };
+
+  - |
+    #include <dt-bindings/soc/qcom,gpr.h>
+    gpr {
+        compatible = "qcom,gpr";
+        qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        service@1 {
+          compatible = "qcom,q6apm";
+          reg = <GPR_APM_MODULE_IID>;
+          qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+        };
+    };
diff --git a/include/dt-bindings/soc/qcom,gpr.h b/include/dt-bindings/soc/qcom,gpr.h
new file mode 100644
index 000000000000..1c68906e079c
--- /dev/null
+++ b/include/dt-bindings/soc/qcom,gpr.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __DT_BINDINGS_QCOM_GPR_H
+#define __DT_BINDINGS_QCOM_GPR_H
+
+/* DOMAINS */
+
+#define GPR_DOMAIN_ID_MODEM	1
+#define GPR_DOMAIN_ID_ADSP	2
+#define GPR_DOMAIN_ID_APPS	3
+
+/* Static Services */
+
+#define GPR_APM_MODULE_IID		1
+#define GPR_PRM_MODULE_IID		2
+#define GPR_AMDB_MODULE_IID		3
+#define GPR_VCPM_MODULE_IID		4
+
+#endif /* __DT_BINDINGS_QCOM_GPR_H */
-- 
2.21.0

