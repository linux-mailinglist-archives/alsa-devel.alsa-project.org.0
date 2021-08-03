Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9BB3DEE60
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Aug 2021 14:55:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D3F31734;
	Tue,  3 Aug 2021 14:55:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D3F31734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627995359;
	bh=qIrcVPEyfMZj5UrqZH5jm6gJcLVtsHpiC8HGBz8cSLo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eK4582COPHal9u5kySqymxXOLXwocTPBDjMOqPidL0AEBgpBz01cPd2lggaFrQV7I
	 GJVmio95dhp/WTPZ5vpAWJy/BvW5MtM5L8la3Rc+ceE5NcFe8w0RLXMiMSg7NTV4rW
	 MjRKUWEEeFRzi871QqYHGtkA7dcqxKwd4sLNnN2c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F21F0F8049E;
	Tue,  3 Aug 2021 14:54:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23AEEF804AB; Tue,  3 Aug 2021 14:54:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54E08F80082
 for <alsa-devel@alsa-project.org>; Tue,  3 Aug 2021 14:54:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54E08F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="QfPV8EjP"
Received: by mail-wr1-x42e.google.com with SMTP id b11so19877295wrx.6
 for <alsa-devel@alsa-project.org>; Tue, 03 Aug 2021 05:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R63M4/FB38pewmBv4s/N5td47VGDDzMLbJRs6dsaRiY=;
 b=QfPV8EjPppCafTLVUplYcb8Nlzr0zmuaN8uVB0pRSGhxmwR5jyitnRFk+vCYWxJWkt
 SRib0cB+vVE49idQJuEriX5sqXsIufGlt2ICdmlCBQHO2vmWeTVeHvzSrPdtaW6NjkLX
 57wxHgTlKq2zckcnXZ8bb0Aa4oMFt5LQzEh9X92vVN1ApJNFgU8rab7HdZ/DkyoWTa67
 XG4s4Vhha2mLio6XgzhAuCM5jL12XUifErq8+E7dUnZKEEXhyQTBpHsCzOyjyJ2tdrpY
 yCcomYItFQAYGTPTp53xIelhu6ejXdxZCl2Et1NyhA4hTRA52WblBUedcNgLMilzokSA
 ei8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R63M4/FB38pewmBv4s/N5td47VGDDzMLbJRs6dsaRiY=;
 b=U3ynG1H0scem78g0IeNn9gV+Wc5rL9nKmaU7v3OEBPE5MNKfALYTs2jTpzoVreUMn3
 V2QIz6pbqOacre7BzvFFPXXVbyhVbWih89ON7pSV3gQk1gXIn+QIHyjZOQFZc3cwpWve
 4vqzV0Dh/NPcqwntTso8//TWK219Rf1JNXbPuQbjv9WXmsKrKqaiVaru0P/fOU47OVYI
 bRHezsohXElSyUOSBSXlebbUNXyuwkQl+Lu6KZ6MxMpWkWbSjL+mxOfeZ198TI1QtZbS
 qonlGC85TELVC6gzwuQ3ymWecBXnQeGElW8getCECvJH/PXaehAQBNNhsRv6iMqGrqXA
 55MA==
X-Gm-Message-State: AOAM532WNKC7qeqUTcSPKYJKfAob3KGMa4JEpsDBKiiWWCmHYirSzHaY
 fjTMmrl+nedfaPRwEPfWwIOEkw==
X-Google-Smtp-Source: ABdhPJx30CZD4igDjJWM+LtF4zhAhZZXT45MHAffXZ9GnbI2INdffzUWYOlf5dtCTspuq+cfNAerAw==
X-Received: by 2002:adf:ed50:: with SMTP id u16mr22854265wro.174.1627995264309; 
 Tue, 03 Aug 2021 05:54:24 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id h14sm14695574wrp.55.2021.08.03.05.54.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 05:54:23 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v3 01/20] soc: dt-bindings: qcom: apr: convert to yaml
Date: Tue,  3 Aug 2021 13:53:52 +0100
Message-Id: <20210803125411.28066-2-srinivas.kandagatla@linaro.org>
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

Convert APR bindings to yaml format so that we could add new bindings support.

All the dsp services bindings are now part of apr bindings instead
of adding them to audio bindings.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../devicetree/bindings/soc/qcom/qcom,apr.txt | 134 ------------------
 .../bindings/soc/qcom/qcom,apr.yaml           | 127 +++++++++++++++++
 2 files changed, 127 insertions(+), 134 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
deleted file mode 100644
index 2e2f6dc351c0..000000000000
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
+++ /dev/null
@@ -1,134 +0,0 @@
-Qualcomm APR (Asynchronous Packet Router) binding
-
-This binding describes the Qualcomm APR. APR is a IPC protocol for
-communication between Application processor and QDSP. APR is mainly
-used for audio/voice services on the QDSP.
-
-- compatible:
-	Usage: required
-	Value type: <stringlist>
-	Definition: must be "qcom,apr-v<VERSION-NUMBER>", example "qcom,apr-v2"
-
-- qcom,apr-domain
-	Usage: required
-	Value type: <u32>
-	Definition: Destination processor ID.
-	Possible values are :
-			1 - APR simulator
-			2 - PC
-			3 - MODEM
-			4 - ADSP
-			5 - APPS
-			6 - MODEM2
-			7 - APPS2
-
-= APR SERVICES
-Each subnode of the APR node represents service tied to this apr. The name
-of the nodes are not important. The properties of these nodes are defined
-by the individual bindings for the specific service
-- All APR services MUST contain the following property:
-
-- reg
-	Usage: required
-	Value type: <u32>
-	Definition: APR Service ID
-	Possible values are :
-			3 - DSP Core Service
-			4 - Audio Front End Service.
-			5 - Voice Stream Manager Service.
-			6 - Voice processing manager.
-			7 - Audio Stream Manager Service.
-			8 - Audio Device Manager Service.
-			9 - Multimode voice manager.
-			10 - Core voice stream.
-			11 - Core voice processor.
-			12 - Ultrasound stream manager.
-			13 - Listen stream manager.
-
-- qcom,protection-domain
-	Usage: optional
-	Value type: <stringlist>
-	Definition: Must list the protection domain service name and path
-		    that the particular apr service has a dependency on.
-	Possible values are :
-			"avs/audio", "msm/adsp/audio_pd".
-			"kernel/elf_loader", "msm/modem/wlan_pd".
-			"tms/servreg", "msm/adsp/audio_pd".
-			"tms/servreg", "msm/modem/wlan_pd".
-			"tms/servreg", "msm/slpi/sensor_pd".
-
-= EXAMPLE
-The following example represents a QDSP based sound card on a MSM8996 device
-which uses apr as communication between Apps and QDSP.
-
-	apr {
-		compatible = "qcom,apr-v2";
-		qcom,apr-domain = <APR_DOMAIN_ADSP>;
-
-		apr-service@3 {
-			compatible = "qcom,q6core";
-			reg = <APR_SVC_ADSP_CORE>;
-		};
-
-		apr-service@4 {
-			compatible = "qcom,q6afe";
-			reg = <APR_SVC_AFE>;
-
-			dais {
-				#sound-dai-cells = <1>;
-				dai@1 {
-					reg = <HDMI_RX>;
-				};
-			};
-		};
-
-		apr-service@7 {
-			compatible = "qcom,q6asm";
-			reg = <APR_SVC_ASM>;
-			...
-		};
-
-		apr-service@8 {
-			compatible = "qcom,q6adm";
-			reg = <APR_SVC_ADM>;
-			...
-		};
-	};
-
-= EXAMPLE 2
-The following example represents a QDSP based sound card with protection domain
-dependencies specified. Here some of the apr services are dependent on services
-running on protection domain hosted on ADSP/SLPI remote processors while others
-have no such dependency.
-
-	apr {
-		compatible = "qcom,apr-v2";
-		qcom,glink-channels = "apr_audio_svc";
-		qcom,apr-domain = <APR_DOMAIN_ADSP>;
-
-		apr-service@3 {
-			compatible = "qcom,q6core";
-			reg = <APR_SVC_ADSP_CORE>;
-		};
-
-		q6afe: apr-service@4 {
-			compatible = "qcom,q6afe";
-			reg = <APR_SVC_AFE>;
-			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-			...
-		};
-
-		q6asm: apr-service@7 {
-			compatible = "qcom,q6asm";
-			reg = <APR_SVC_ASM>;
-			qcom,protection-domain = "tms/servreg", "msm/slpi/sensor_pd";
-			...
-		};
-
-		q6adm: apr-service@8 {
-			compatible = "qcom,q6adm";
-			reg = <APR_SVC_ADM>;
-			qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
-			...
-		};
-	};
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
new file mode 100644
index 000000000000..12650f7084f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
@@ -0,0 +1,127 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/qcom/qcom,apr.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm APR (Asynchronous Packet Router) binding
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  This binding describes the Qualcomm APR, APR is a IPC protocol for
+  communication between Application processor and QDSP. APR is mainly
+  used for audio/voice services on the QDSP.
+
+properties:
+  compatible:
+    enum:
+      - qcom,apr
+      - qcom,apr-v2
+
+  qcom,apr-domain:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 3, 4, 5, 6, 7]
+    description:
+      Selects the processor domain for apr
+        1 = APR simulator
+        2 = PC Domain
+        3 = Modem Domain
+        4 = ADSP Domain
+        5 = Application processor Domain
+        6 = Modem2 Domain
+        7 = Application Processor2 Domain
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+#APR Services
+patternProperties:
+  "^apr-service@[0-9a-e]$":
+    type: object
+    description:
+      APR node's client devices use subnodes for desired static port services.
+
+    properties:
+      compatible:
+        enum:
+          - qcom,q6core
+          - qcom,q6asm
+          - qcom,q6afe
+          - qcom,q6adm
+
+      reg:
+        enum: [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
+        description:
+          APR Service ID
+            3 = DSP Core Service
+            4 = Audio  Front End Service.
+            5 = Voice Stream Manager Service.
+            6 = Voice processing manager.
+            7 = Audio Stream Manager Service.
+            8 = Audio Device Manager Service.
+            9 = Multimode voice manager.
+            10 = Core voice stream.
+            11 = Core voice processor.
+            12 = Ultrasound stream manager.
+            13 = Listen stream manager.
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
+required:
+  - compatible
+  - qcom,apr-domain
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/qcom,apr.h>
+    apr {
+        compatible = "qcom,apr-v2";
+        qcom,apr-domain = <APR_DOMAIN_ADSP>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        q6core: apr-service@3 {
+          compatible = "qcom,q6core";
+          reg = <APR_SVC_ADSP_CORE>;
+          qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+        };
+
+        q6afe: apr-service@4 {
+          compatible = "qcom,q6afe";
+          reg = <APR_SVC_AFE>;
+          qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+        };
+
+        q6asm: apr-service@7 {
+          compatible = "qcom,q6asm";
+          reg = <APR_SVC_ASM>;
+          qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+        };
+
+        q6adm: apr-service@8 {
+          compatible = "qcom,q6adm";
+          reg = <APR_SVC_ADM>;
+          qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+        };
+    };
-- 
2.21.0

