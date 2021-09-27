Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD69F4195B3
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 16:00:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DA7016D7;
	Mon, 27 Sep 2021 15:59:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DA7016D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632751211;
	bh=rGnpjmDFV1wmhq/brOeQrLyWCt8iJXrJL9MieP0na84=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WGDbPJ4uyfHWh2YMyl6KQEPnv7Zmtrt3sXBFH5vdrDri0qXZpMW1RU7Dn9LPX3/6e
	 zpxy4aMRsazAGrQPND0lVWScSb052YvcNySEpxWgGXfDManXC4uA8gZRApuKqqvP5x
	 /cHOw6oItig9ZbyLy4Y/WtZFS86RwUn/JG3AZWWA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25731F8051A;
	Mon, 27 Sep 2021 15:56:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E326F80511; Mon, 27 Sep 2021 15:56:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D06E7F804CA
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 15:56:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D06E7F804CA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="fs9Py8Vb"
Received: by mail-wm1-x332.google.com with SMTP id
 r11-20020a1c440b000000b0030cf0f01fbaso30772wma.1
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 06:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9h1xMEiV0P0T+5NxtCB5k6xQoY2x3NNYvUmlcG7EV4s=;
 b=fs9Py8Vba258GUMG/a5i9mihEaYcyL/l3kGLAqfkXCEZyOIA4TrQsex3550mhMHqpa
 vZcj+jW65T6eJwqiCu8wl61NOaEnbhtF81tnggRsKPmeBuP4VCXJ9wkqKIr1qVJal9NA
 br9YOAYVxBrUXXNuaWrUS/lFPZmI1OrEu/xL/JSI9qiTGB4j6IzQcarq1M9X9hsICYzb
 oUNcOcrwGuh/oxpq7MaAx6gfACt3D2rIgehBDb3EkvaIClr9Kga/16Pf+EhoNggq82Jp
 X5s5HMnfhrgf9Gms00TQJxcHho1auoeLKOvFSBb4ozI6rpMlRtqvMj741Av47nmh7UzJ
 kDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9h1xMEiV0P0T+5NxtCB5k6xQoY2x3NNYvUmlcG7EV4s=;
 b=dVIVJVbQt3inau2ha59BuOvfO206vtx6mjnaBCxmv4dISWhWoEzLlArkYlkY8Jo7DQ
 f8RaBuWwW34+nUNGu1KiTpES2XQpKYm7Bd7feNXnl7SFHiJIQgSaZ8Qp8FTB2iG7rWn2
 Mj235cpe0XAti+nG4KFvBYtiqux8Neb5f9EDjzkylUhJ0PW2V9Qe/uwNKGBww7Kd7Sqa
 DWY1V3yTJR9i5quA4TbCAo3q7j14WTQnUPlW5zgViEwPnN/rIquJxULPOCQSphF8PJe5
 vGT2nkg75A2YPm46aKbsMo/pOjX6hgQaqPGnikolro4Vp6oorJ0QjQusWs2QGCoR0civ
 wBIQ==
X-Gm-Message-State: AOAM531sh4y1uw7Pdi0RxBHtNsx6yoi3eNwyPrqmqMMvMRucFFsbyLZV
 x4UieDW9ipsDePUgpszNUawYnQ==
X-Google-Smtp-Source: ABdhPJz0+Zx5EQE0hlqPGgVT9WvOsJ5HjvpBSeUC0Y7Z2qeo7PuSZfsiwyVa1g72fZsPCbgF/jf6rw==
X-Received: by 2002:a1c:4e19:: with SMTP id g25mr48355wmh.67.1632750987388;
 Mon, 27 Sep 2021 06:56:27 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id b7sm20485606wrm.9.2021.09.27.06.56.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 06:56:26 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v8 04/22] soc: dt-bindings: qcom: add gpr bindings
Date: Mon, 27 Sep 2021 14:55:41 +0100
Message-Id: <20210927135559.738-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210927135559.738-1-srinivas.kandagatla@linaro.org>
References: <20210927135559.738-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com, tiwai@suse.de,
 plai@codeaurora.org, pierre-louis.bossart@linux.intel.com
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/soc/qcom/qcom,apr.yaml           | 41 +++++++++++++++----
 include/dt-bindings/soc/qcom,gpr.h            | 19 +++++++++
 2 files changed, 53 insertions(+), 7 deletions(-)
 create mode 100644 include/dt-bindings/soc/qcom,gpr.h

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
index bfe04fca8aa3..028c5d105adb 100644
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
@@ -46,6 +47,10 @@ properties:
         5 = Application processor Domain
         6 = Modem2 Domain
         7 = Application Processor2 Domain
+      Selects the processor domain for gpr
+        1 = Modem Domain
+        2 = Audio DSP Domain
+        3 = Application Processor Domain
 
   '#address-cells':
     const: 1
@@ -53,12 +58,12 @@ properties:
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
@@ -67,9 +72,11 @@ patternProperties:
           - qcom,q6asm
           - qcom,q6afe
           - qcom,q6adm
+          - qcom,q6apm
+          - qcom,q6prm
 
       reg:
-        minimum: 3
+        minimum: 1
         maximum: 13
         description:
           APR Service ID
@@ -84,6 +91,11 @@ patternProperties:
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
@@ -148,3 +160,18 @@ examples:
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
index 000000000000..3107da59319c
--- /dev/null
+++ b/include/dt-bindings/soc/qcom,gpr.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+
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

