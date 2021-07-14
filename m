Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 471ED3C87AB
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jul 2021 17:32:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE1881691;
	Wed, 14 Jul 2021 17:31:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE1881691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626276768;
	bh=hjHULgI99bddakh0tnHDdNTmWA8okgyS27nZjXH6asM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g/8bm1qhlhJNJjDZntD3olcN6jFbc1Wv0BRnh61oGIXtuqSCmunIWPH+vYluuxKFd
	 rDgCvwrC0asI0Wa+iEuHJ77Aq5yIE2A3qo6Ii0ew60aK/vw+ofFySrbrxaPurSTqwf
	 3oTtv0zZVMZPWOpRUDXkdNlYaoNFUi+ljHzRZ/Fg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30ACBF804DA;
	Wed, 14 Jul 2021 17:31:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF543F80269; Wed, 14 Jul 2021 17:31:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B1C5F8011C
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 17:30:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B1C5F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="SRhSOcNw"
Received: by mail-wm1-x32e.google.com with SMTP id
 f8-20020a1c1f080000b029022d4c6cfc37so2858639wmf.5
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 08:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xiCF2nRgXBkkZxRW+nKblAu8sGXdLERpAmm5UZ/e/m8=;
 b=SRhSOcNwWN+ksk7Vs4KchDJ5/wH8TgYYFftErjY+9pbOkYNwDha7sNoYZzFCOjEfZc
 lY1Dw+HqNQ8AeiorkcGTa5q2YsGSgM//zTCf4DONWjgNRuN8RgK9qSi6aMfR9NlapphG
 hsimlLmoze5ccvvySMp4Dou4BUjHp6MMGbXq2gvMyECV7Tfh+hBr+BQbAS0JFTM95Orz
 K46foeXTtB2XGa/aB9Ip4syGkC/ulMZba2MyYBBbp16TP+DN2i7yGM2Sbywp6AAzMuXq
 Gt2UJg2fWZAuRCMt+oX7eBebrMAi3BtUJIepBy4DNWc7s3A5IC+EknMgD7u8VlnUhOu4
 gpUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xiCF2nRgXBkkZxRW+nKblAu8sGXdLERpAmm5UZ/e/m8=;
 b=M8jX6PV0M8tp4eAw7BAUKToE4uDk29R1t8m2LrKBhTBxRYZTGo9xDH7U0e/oydhUdm
 ECaL11kMv32xUBRYzSu7ewDVmn1+B2iBnBUtVP6JAlDKv435Q5s4L55BCetxuXWSqef6
 CUerKtYUDBQWbEaC0+pDGwbT4a1S1WLKvcGBZx8b210k+lC1MPXGITZJal4rR2KEdILn
 S6138rFo242TbtCfeFqDzOWDvGa46kN/DmPAKNZhIPRj5dhVkcPgntQVl+BiFRSMH9Ij
 c1QzkIoCvsyP6rjAhiGEP1Ii0I1TlTrNCHAhiR6uOUQrKqJJPUtzaJbOMZ/B2m1g8b7M
 NOvg==
X-Gm-Message-State: AOAM530fJpdYdMFZGMqe8uHTQpbj+XKEfBZX4WHTl2+CiffsVBPuhWbJ
 8a/Qcgfxu+E0eFj3WZ/Yglk/Pg==
X-Google-Smtp-Source: ABdhPJxSHFnk5M8T9HV9b3Wlbx6jGLABuKYvfRmdDLOQGvZMCT8Q7DeavolQ7oLahZc5RlYjMxv/lQ==
X-Received: by 2002:a05:600c:3b93:: with SMTP id
 n19mr4770604wms.3.1626276655306; 
 Wed, 14 Jul 2021 08:30:55 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id y6sm2465174wma.48.2021.07.14.08.30.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:30:54 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v2 01/16] soc: dt-bindings: qcom: add gpr bindings
Date: Wed, 14 Jul 2021 16:30:24 +0100
Message-Id: <20210714153039.28373-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210714153039.28373-1-srinivas.kandagatla@linaro.org>
References: <20210714153039.28373-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com, tiwai@suse.de,
 plai@codeaurora.org, linux-kernel@vger.kernel.org
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

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/soc/qcom/qcom,gpr.yaml           | 83 +++++++++++++++++++
 include/dt-bindings/soc/qcom,gpr.h            | 18 ++++
 2 files changed, 101 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,gpr.yaml
 create mode 100644 include/dt-bindings/soc/qcom,gpr.h

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,gpr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,gpr.yaml
new file mode 100644
index 000000000000..d6dda44b655e
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,gpr.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/soc/qcom/qcom,gpr.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Generic Packet Router binding
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  This binding describes the Qualcomm Generic Packet Router,Shared Memory Manager,
+  used to send and receive packets between Audio DSP and Application processor.
+
+properties:
+  compatible:
+    const: qcom,gpr
+
+  qcom,glink-channels:
+    const: adsp_apps
+    description:
+      glink channel associated with gpr function
+
+  qcom,protection-domain:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description: protection domain service name and path for gpr service
+      has dependency on.
+    items:
+      - const: avs/audio
+      - const: msm/adsp/audio_pd
+
+  qcom,gpr-domain:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 3]
+    description:
+      Selects the processor domain for gpr
+        1 = Modem Domain
+        2 = Audio DSP Domain
+        3 = Application Processor Domain
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+#GPR Services
+patternProperties:
+  'gprservice@[0-9]+$':
+    type: object
+    description:
+      GPR node's client devices use subnodes for desired static port services.
+
+    properties:
+      reg:
+        maxItems: 1
+        description: Service port id
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - qcom,glink-channels
+  - qcom,gpr-domain
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/qcom,gpr.h>
+    gpr {
+        compatible = "qcom,gpr";
+        qcom,glink-channels = "adsp_apps";
+        qcom,gpr-domain = <GPR_DOMAIN_ID_ADSP>;
+        qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        gprservice@1 {
+          reg = <GPR_APM_MODULE_IID>;
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

