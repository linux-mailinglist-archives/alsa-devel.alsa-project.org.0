Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F191A3DEE66
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Aug 2021 14:57:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BD7517A1;
	Tue,  3 Aug 2021 14:57:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BD7517A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627995478;
	bh=hCjUd7YDRPl40h6fM6YgDI80rzVgqOXLul+2+ohnvf4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ed3sTgBvgzrTvEPiRLEK+fZ8KLqK0Vcv0O4xOJVf0pRgJkMaGtnsDT0ZIcl6azhL7
	 zFbXAAQENrPo0kPe6TU09NiRBWk32AtjhjSeI5LY0dtnXpIbVw2EIs4VDwz18K0t9M
	 lGpqtFfsBYNFAhbng02+LE08w3tDNGoCNnPRZFD8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4F09F804F1;
	Tue,  3 Aug 2021 14:54:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87F59F804FD; Tue,  3 Aug 2021 14:54:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A17ABF804E3
 for <alsa-devel@alsa-project.org>; Tue,  3 Aug 2021 14:54:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A17ABF804E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="GStMRf/o"
Received: by mail-wr1-x42c.google.com with SMTP id m12so20420510wru.12
 for <alsa-devel@alsa-project.org>; Tue, 03 Aug 2021 05:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GJlsWNgwKODDcwAuvO6G0kTnrLu0l5LAblYrz3XnMPQ=;
 b=GStMRf/ogaE5dL12vL2iDeYxz3gVXJOw0eaeMAflrNzwUdjFQMaYgd7igdUvdIIbDD
 Tw1cCYuPeHcdqeAUQXLWa+gzG7eFwZnMulEWkig+RcEZLzRNEiOvvl634k8a+0SZrFfp
 4SWZxd1e7gKx8X1A6E+i1fCpijVaWfpeR7ibXUuREtLPysrOIa5IT6I3FY0+Mswcpxhk
 4KyyKBS30DQyTuN6rGE2fBtxEMhH4AmICL9VBqxNqiVQeMslZGyq7NcetQlM20vQxLbW
 pIjDYrhOm7WuDZRGPwrapiZ9zb8UepSgQW1VzIiLjF5ScX+pB8ZkBjy98nWt/s1OC4Qh
 em7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GJlsWNgwKODDcwAuvO6G0kTnrLu0l5LAblYrz3XnMPQ=;
 b=miWA74m+BaHk6MHIAEg1yW9EZv8kZB9pFqO5RSfvSYjaROnrz1SDpr+zbnnDFeXdub
 dNs0Ma+98O1P7i9SJdJ1ssytgkmiAbpuMQRsoAUfE0nYXnej2hovPquezjkbvlxVQ2uG
 75vgVOs5HuiDR4qfzSsucJMWSrw52hbX0rTNkw76JGqHDCUD5deClg/XANkCdIgyQz2x
 X5Vn9cieu5kqsIAz3xeawgMGoM8ikhv19Mfs4pj3dtZbh7tdC1TN4JlSC5SmT3yrjXo6
 SxeSBv2BNHAvNnjtTkQkCoyv1TDyQDWHh5saJGpw9xHOXlhATRwUG8qGR1tpT2WkcOBW
 Ojcg==
X-Gm-Message-State: AOAM53273N+x+PjDanEW4/uroqMhDb9RZtb57KodMtNDoyLNtXa96Gnv
 Jv6IJcIm0VDUzExjO3ahFtExmw==
X-Google-Smtp-Source: ABdhPJwtKXA6qXVq2nMyL5vUeWv46+z8dMRWor6MqGbKG5NMzsy9KiBW6PwcGX6eGsxBpXiIVBF1ow==
X-Received: by 2002:a5d:4f8b:: with SMTP id d11mr22783713wru.351.1627995266610; 
 Tue, 03 Aug 2021 05:54:26 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id h14sm14695574wrp.55.2021.08.03.05.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 05:54:26 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v3 03/20] soc: dt-bindings: qcom: add gpr bindings
Date: Tue,  3 Aug 2021 13:53:54 +0100
Message-Id: <20210803125411.28066-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210803125411.28066-1-srinivas.kandagatla@linaro.org>
References: <20210803125411.28066-1-srinivas.kandagatla@linaro.org>
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
 .../bindings/soc/qcom/qcom,apr.yaml           | 92 ++++++++++++++++++-
 include/dt-bindings/soc/qcom,gpr.h            | 18 ++++
 2 files changed, 105 insertions(+), 5 deletions(-)
 create mode 100644 include/dt-bindings/soc/qcom,gpr.h

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
index 12650f7084f4..59d8b4dce8b5 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
@@ -4,14 +4,14 @@
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
@@ -19,6 +19,7 @@ properties:
     enum:
       - qcom,apr
       - qcom,apr-v2
+      - qcom,gpr
 
   qcom,apr-domain:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -33,13 +34,22 @@ properties:
         6 = Modem2 Domain
         7 = Application Processor2 Domain
 
+  qcom,gpr-domain:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 3]
+    description:
+      Selects the processor domain for gpr
+        1 = Modem Domain
+        2 = Audio DSP Domain
+        3 = Application Processor Domain
+
   '#address-cells':
     const: 1
 
   '#size-cells':
     const: 0
 
-#APR Services
+#APR/GPR Services
 patternProperties:
   "^apr-service@[0-9a-e]$":
     type: object
@@ -86,9 +96,66 @@ patternProperties:
 
     additionalProperties: false
 
+  "^gpr-service@[0-9a-e]$":
+    type: object
+    description:
+      GPR node's client devices use subnodes for desired static port services.
+
+    properties:
+      compatible:
+        enum:
+          - qcom,q6apm
+          - qcom,q6prm
+
+      reg:
+        enum: [1, 2, 3, 4]
+        description:
+          GPR Service ID
+            1 = Audio Process Manager Service
+            2 = Proxy Resource Manager Service.
+            3 = AMDB Service.
+            4 = Voice processing manager.
+
+      qcom,protection-domain:
+        $ref: /schemas/types.yaml#/definitions/string-array
+        description: protection domain service name and path for apr service
+          has dependency on.
+        items:
+          - const: avs/audio
+          - const: msm/adsp/audio_pd
+
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    additionalProperties: false
+
 required:
   - compatible
-  - qcom,apr-domain
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,apr-v2
+              - qcom,apr
+    then:
+      required:
+        - qcom,apr-domain
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,gpr
+    then:
+      required:
+        - qcom,gpr-domain
 
 additionalProperties: false
 
@@ -125,3 +192,18 @@ examples:
           qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
         };
     };
+
+  - |
+    #include <dt-bindings/soc/qcom,gpr.h>
+    gpr {
+        compatible = "qcom,gpr";
+        qcom,gpr-domain = <GPR_DOMAIN_ID_ADSP>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        gpr-service@1 {
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

