Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D19E3C87BF
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jul 2021 17:34:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C627916A0;
	Wed, 14 Jul 2021 17:33:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C627916A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626276854;
	bh=AlzMxlwuF+wSsqgefmW6jncCmxkO2gzJ8iMrjk8sNpU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JGLjwJn4QuRnanVWkZpNgeSSM4oM85y3wIW6Jj+oaoZeklUHAkKl/kF9IEEs5Z9r5
	 /JZhIbKtgC9KZG+ZKRBj3CmCgM8fNUe4/8G0ij8hYFQJnnycG3Lr7ent50rqfKjGcw
	 RFKykCuYiwLOgHzCWmVcOPZaWSnStU2vh1zB3JVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03767F80515;
	Wed, 14 Jul 2021 17:31:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A29FF804F3; Wed, 14 Jul 2021 17:31:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CF72F804E5
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 17:31:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CF72F804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="c7nJy1CC"
Received: by mail-wm1-x32d.google.com with SMTP id n4so1862935wms.1
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 08:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UrNm6WC6FkrE8NCfyfqxMMW9r3LTd4X3kSslIi+iafU=;
 b=c7nJy1CCafNyk5ARpsiv/GYzpBo97LDBfVc80FFOF4i68EHkl2hENl466304IAHD8G
 yYw0pOQteFnLeco5tvonZN3X7BTWQ5jaHKJ14BbQ/WCwLCVoYKxy9Vsjpkvtvs1vx7yO
 Cn3OI4BJYMEfNhV2v4gMq1XRf/S8GGP7iOFeVjbWbHeeSWjrDQuUJE7gfLsnqV1lFXXu
 YuXkFpwNiDhAqTr+v/XPB6gzozxExO5smbc2rCTIKbYhxoMqyoE3vqoSHRDSR5eAGExG
 49UK23sNKp85mVjdOIe6eOn5fmmypNRHCJQ5/18mPeqLuqp0A8Dhev+MDg0aSSIpdwQw
 z21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UrNm6WC6FkrE8NCfyfqxMMW9r3LTd4X3kSslIi+iafU=;
 b=J8XW+Lgx1zlzIYMIpnLDEHHcbSY7Y4C2wMNkKI9GH6g/0NUP8dgRzp3kArobQDb++8
 7g42bBm7qmIzintxcSyvDGPc01Rt2MAsASBIuZDdDiYvJHfzIvOYh/JYyHyDpZuTM+F/
 /cjOukxrFqGFyhgvDWrsxEKV/pGlMwf++ZA6ZoOKMLscA3LTTeGka6Q6uhM/M2MBjLe9
 Tp1wA3HaA/l1zkNQGopqRQfZLcKmvTy+wP9j0mrci768CXfmKJ3q5SzFwAbRsjAG3sRQ
 uTgH/FeOolTDYqFDZetj1N8ncJTL3/KJq7z1o0RgWhvuZ2c+iPSNY0uKV9pJv+geZshG
 4SzQ==
X-Gm-Message-State: AOAM532pbH3fHCxinhdHcGU3+R4pJwZvNp3io9m+BlON7bVvbNQcnfQB
 EbV7T23fKZVagRNbtcY1Bwfy5A==
X-Google-Smtp-Source: ABdhPJx3HVOA/QLWBWfKgrRTOHSvk6i+9bN+9/LmB4lQSx1wfvv3b6xCndGB0fIYxP+dnpcXcgknRw==
X-Received: by 2002:a1c:143:: with SMTP id 64mr11940913wmb.187.1626276658727; 
 Wed, 14 Jul 2021 08:30:58 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id y6sm2465174wma.48.2021.07.14.08.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:30:58 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v2 04/16] ASoC: qcom: dt-bindings: add bindings Audio
 Processing manager
Date: Wed, 14 Jul 2021 16:30:27 +0100
Message-Id: <20210714153039.28373-5-srinivas.kandagatla@linaro.org>
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

This patch adds bindings support for Qualcomm Audio Processing Manager
service in Audio DSP.

Audio Process Manager is one of the static service in DSP which is
responsible for Command/response handling, graph Management
and Control/Event management between modules.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../devicetree/bindings/sound/qcom,q6apm.yaml | 87 +++++++++++++++++++
 include/dt-bindings/sound/qcom,q6apm.h        |  8 ++
 2 files changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
 create mode 100644 include/dt-bindings/sound/qcom,q6apm.h

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
new file mode 100644
index 000000000000..6f27567523a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/sound/qcom,q6apm.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Audio Process Manager binding
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  This binding describes the Qualcomm Audio Process Manager service in DSP
+
+properties:
+  compatible:
+    const: qcom,q6apm
+
+  reg:
+    maxItems: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+#APM Services
+patternProperties:
+  'apm@[0-9]+$':
+    type: object
+    description:
+      APM devices use subnodes for services.
+
+    properties:
+      compatible:
+        enum:
+          - qcom,q6apm-dais
+          - qcom,q6apm-bedais
+
+      iommus:
+        maxItems: 1
+
+      "#sound-dai-cells":
+        const: 1
+
+      reg:
+        maxItems: 1
+
+    required:
+      - compatible
+      - reg
+      - '#sound-dai-cells'
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    gpr {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        gprservice@1 {
+          compatible = "qcom,q6apm";
+          reg = <1>;
+
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          apm@1 {
+            compatible = "qcom,q6apm-dais";
+            #sound-dai-cells = <1>;
+            reg = <1>;
+          };
+
+          apm@2 {
+            compatible = "qcom,q6apm-bedais";
+            #sound-dai-cells = <1>;
+            reg = <2>;
+          };
+        };
+    };
diff --git a/include/dt-bindings/sound/qcom,q6apm.h b/include/dt-bindings/sound/qcom,q6apm.h
new file mode 100644
index 000000000000..3c3987eb6e95
--- /dev/null
+++ b/include/dt-bindings/sound/qcom,q6apm.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __DT_BINDINGS_Q6_APM_H__
+#define __DT_BINDINGS_Q6_APM_H__
+
+/* Audio Process Manager (APM) virtual ports IDs */
+#include <dt-bindings/sound/qcom,q6afe.h>
+
+#endif /* __DT_BINDINGS_Q6_APM_H__ */
-- 
2.21.0

