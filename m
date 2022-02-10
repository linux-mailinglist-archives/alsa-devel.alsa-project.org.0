Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5121A4B0DD0
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 13:52:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E5FE172C;
	Thu, 10 Feb 2022 13:51:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E5FE172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644497546;
	bh=4+cZBPJaCFhhJiLOLCIW+RZORjzEkvkfr+ZwXZVeB/g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=os97J8MiU/DCZvt4MBbhl7WEffqYA5IORkmRZBwzjJD901861bBI1uf3lLWG88W5a
	 UeRK0raFKxfsh+2whdsXsl8RigD+lWjpa5u/aF6Kl8o9Q48yUKV3QG2Unirb6a+dlb
	 4h/WenzLLBvfmTntseX65E1LUxSOqdpGrrUd0n3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34994F804AC;
	Thu, 10 Feb 2022 13:51:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2060F804AB; Thu, 10 Feb 2022 13:50:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE7B5F80054
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 13:50:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE7B5F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="FLe49NEq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644497452; x=1676033452;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=uvmyX0p+rnyMVXJEqbR1Iu7STWLfWTBA0Njo1h26a58=;
 b=FLe49NEqiXJiaMVLRJSIiz/e0hivcf2hd4OhzuDxTYdizgrAZPTtLjYy
 07vn/859Tx0FRg3X0/AFZaV4vwct/zK/e7bS1d5yy+CCUkTRqdfA/DfLJ
 ukFFBT1bLuqrQFneUzoBEozSyyJEwIkN/AoV95onslfHm7gGmK1CTWcsv 8=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 10 Feb 2022 04:50:47 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 04:50:40 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 10 Feb 2022 04:50:39 -0800
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 10 Feb 2022 04:50:34 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <plai@codeaurora.org>,
 <bgoswami@codeaurora.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <rohitkr@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>
Subject: [PATCH v9 1/3] ASoC: google: dt-bindings: Add sc7280-herobrine
 machine bindings
Date: Thu, 10 Feb 2022 18:20:13 +0530
Message-ID: <1644497415-25291-2-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644497415-25291-1-git-send-email-quic_srivasam@quicinc.com>
References: <1644497415-25291-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

Add devicetree bindings documentation file for sc7280 sound card
registration.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
---
 .../bindings/sound/google,sc7280-herobrine.yaml    | 180 +++++++++++++++++++++
 1 file changed, 180 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml

diff --git a/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
new file mode 100644
index 0000000..869b403
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
@@ -0,0 +1,180 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/google,sc7280-herobrine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google SC7280-Herobrine ASoC sound card driver
+
+maintainers:
+  - Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
+  - Judy Hsiao <judyhsiao@chromium.org>
+
+description:
+  This binding describes the SC7280 sound card which uses LPASS for audio.
+
+properties:
+  compatible:
+    enum:
+      - google,sc7280-herobrine
+
+  audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description:
+      A list of the connections between audio components. Each entry is a
+      pair of strings, the first being the connection's sink, the second
+      being the connection's source.
+
+  model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: User specified audio sound card name
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^dai-link@[0-9a-f]$":
+    description:
+      Each subnode represents a dai link. Subnodes of each dai links would be
+      cpu/codec dais.
+
+    type: object
+
+    properties:
+      link-name:
+        description: Indicates dai-link name and PCM stream name.
+        $ref: /schemas/types.yaml#/definitions/string
+        maxItems: 1
+
+      reg:
+        maxItems: 1
+        description: dai link address.
+
+      cpu:
+        description: Holds subnode which indicates cpu dai.
+        type: object
+        properties:
+          sound-dai: true
+
+        required:
+          - sound-dai
+
+        additionalProperties: false
+
+      codec:
+        description: Holds subnode which indicates codec dai.
+        type: object
+        properties:
+          sound-dai: true
+
+        required:
+          - sound-dai
+
+        additionalProperties: false
+
+    required:
+      - link-name
+      - cpu
+      - codec
+      - reg
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - model
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+
+  - |
+    #include <dt-bindings/sound/qcom,lpass.h>
+    sound {
+        compatible = "google,sc7280-herobrine";
+        model = "sc7280-wcd938x-max98360a-4dmic";
+
+        audio-routing =
+            "IN1_HPHL", "HPHL_OUT",
+            "IN2_HPHR", "HPHR_OUT",
+            "AMIC1", "MIC BIAS1",
+            "AMIC2", "MIC BIAS2",
+            "VA DMIC0", "MIC BIAS3",
+            "VA DMIC1", "MIC BIAS3",
+            "VA DMIC2", "MIC BIAS4",
+            "VA DMIC3", "MIC BIAS4",
+            "TX SWR_ADC0", "ADC1_OUTPUT",
+            "TX SWR_ADC1", "ADC2_OUTPUT",
+            "TX SWR_ADC2", "ADC3_OUTPUT",
+            "TX SWR_DMIC0", "DMIC1_OUTPUT",
+            "TX SWR_DMIC1", "DMIC2_OUTPUT",
+            "TX SWR_DMIC2", "DMIC3_OUTPUT",
+            "TX SWR_DMIC3", "DMIC4_OUTPUT";
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dai-link@0 {
+            link-name = "WCD Playback";
+            reg = <LPASS_CDC_DMA_RX0>;
+            cpu {
+                sound-dai = <&lpass_cpu LPASS_CDC_DMA_RX0>;
+            };
+
+            codec {
+                sound-dai = <&wcd938x 0>, <&swr0 0>, <&rxmacro 0>;
+            };
+        };
+        dai-link@1 {
+            link-name = "WCD Capture";
+            reg = <LPASS_CDC_DMA_TX3>;
+            cpu {
+                sound-dai = <&lpass_cpu LPASS_CDC_DMA_TX3>;
+            };
+
+            codec {
+                sound-dai = <&wcd938x 1>, <&swr1 0>, <&txmacro 0>;
+            };
+        };
+
+        dai-link@2 {
+            link-name = "MI2S Playback";
+            reg = <MI2S_SECONDARY>;
+            cpu {
+                sound-dai = <&lpass_cpu MI2S_SECONDARY>;
+            };
+
+            codec {
+                sound-dai = <&max98360a>;
+            };
+        };
+
+        dai-link@3 {
+            link-name = "DMIC Capture";
+            reg = <LPASS_CDC_DMA_VA_TX0>;
+            cpu {
+                sound-dai = <&lpass_cpu LPASS_CDC_DMA_VA_TX0>;
+            };
+
+            codec {
+                sound-dai = <&vamacro 0>;
+            };
+        };
+
+        dai-link@5 {
+            link-name = "DP Playback";
+            reg = <LPASS_DP_RX>;
+            cpu {
+                sound-dai = <&lpass_cpu LPASS_DP_RX>;
+            };
+
+            codec {
+                sound-dai = <&mdss_dp>;
+            };
+        };
+    };
-- 
2.7.4

