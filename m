Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAC93FFF2A
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 13:27:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8E4F17F7;
	Fri,  3 Sep 2021 13:26:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8E4F17F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630668442;
	bh=fndkAEZkKGN195dwQTh5pz4PJrIPoDVHnw38+upRSl0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eFjRuvz9NbxCTMuC/MA9rja4060U8WjkPE+TDZoYeUsFnSAzaVn71YlRBurbOD3RX
	 Dc9Z34hYJ464ZBEz4rTM6O6B1NNgRmwYby+axwa8R+blw534NgscvRsL7K8jfN9H3m
	 sVzg45CcxzQ+ZzWxlZ/dWZaq8Y9yYEr0A/JyRLNw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B3FFF8051C;
	Fri,  3 Sep 2021 13:22:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE3F7F80520; Fri,  3 Sep 2021 13:21:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05039F80510
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 13:21:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05039F80510
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="nnDuaGdz"
Received: by mail-wr1-x433.google.com with SMTP id v10so7727804wrd.4
 for <alsa-devel@alsa-project.org>; Fri, 03 Sep 2021 04:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RwkBekoVHbR6mINfcBzFLlTHGm7nkcct6qC3KOCM4UE=;
 b=nnDuaGdzIo6q/ktDdSQ5oNq6FAVQxDKNm3vpvhidfJ+W0+arnzzt8T0i4adPPle3Na
 /X2embjE5Zrfp2eYUGZKthxtgIFJfdh6JECxWbeyOLoyF1HCdyggBvrKPL9qM+gF8Ks+
 bGKG/dV4gKwN8ghzywLXFa2v6ZtgdDKstEDQj06MyO2/L0Dg0rwNGSWRo7B40PIBTlmH
 25fyCDiQ4/0UwMPTwH5WSDIZVo4UrY69fHfEXkcqe6+D9N4Kj4zO9UQti/sgvpm437BN
 2n6mExwvWjbXzLLG1kKfp82UmGZpfvSATTOjL6TKLWpVyRg40QKuu5wSq9j1zJX6ybi7
 G6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RwkBekoVHbR6mINfcBzFLlTHGm7nkcct6qC3KOCM4UE=;
 b=T+CJM8o/ZlFFWsuC+TQW9zF0ijNY13uLdpk1cZusic3WcSh2azOCbYBr9n5p6vmpNO
 auc+yGhyrVgQSoEUr3mTcoyld4ZsoWrWyh86yqTi19oYaQvnWNPMrOi5GH5pMzbukbGF
 LHs39yUAU6s7AyaOJJjtfzjMjI20SOWXTxGx4lMmejxP9SCawrnqDOB+oAle5vkfXnM2
 2k1YsWANG/WIN5dVqg50w50011ZMCe0sxrcHogrHBPZ3QQA0+jJHRYUrn84eOe2Mi6kg
 invHf7tauobiey+pJ8t2r5aF7+BDzhsdsNAYlwJfky6mOuT92rhN2+WQZ328WcdyO8TC
 G7Hw==
X-Gm-Message-State: AOAM532dqPyl2dAluKpd9D32ncZ8wWnUFZVY9E7SdqwTwaxTVUrN5X/X
 oCY/cncz8NNCPbyHen0NyCDWMA==
X-Google-Smtp-Source: ABdhPJzwBsuoA054xPFPRaAoZeV82ZrjBVhXF2UfSP+zszzIu2WwjBzQ1sQL90BX/skDPztfsvcUKw==
X-Received: by 2002:adf:80e5:: with SMTP id 92mr3506130wrl.300.1630668108623; 
 Fri, 03 Sep 2021 04:21:48 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id f20sm3881877wmb.32.2021.09.03.04.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:21:48 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v5 13/21] ASoC: dt-bindings: add q6apm digital audio stream
 bindings
Date: Fri,  3 Sep 2021 12:20:24 +0100
Message-Id: <20210903112032.25834-14-srinivas.kandagatla@linaro.org>
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

On AudioReach audio Framework, Audio Streams (PCM/Compressed) are managed by
Q6APM(Audio Process Manager) service. This patch adds bindings for this DAIs
exposed by the DSP.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/sound/qcom,q6apm-dai.yaml        | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
new file mode 100644
index 000000000000..75431d1c0b2a
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/sound/qcom,q6apm-dai.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm Audio Process Manager Digital Audio Interfaces binding
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  This binding describes the Qualcomm APM DAIs in DSP
+
+properties:
+  compatible:
+    const: qcom,q6apm-dais
+
+  reg:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+required:
+  - compatible
+  - iommus
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
+            iommus = <&apps_smmu 0x1801 0x0>;
+            reg = <1>;
+          };
+        };
+    };
-- 
2.21.0

