Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43659467714
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Dec 2021 13:08:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 066A22281;
	Fri,  3 Dec 2021 13:07:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 066A22281
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638533315;
	bh=lwvyVU4BB2chCBWEDECVsOJTG45Gv5F7FGhpSH0c2Ro=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BVYA/yeNdU4Etg0ta9L6d0DYzrViHfKOQ3UE58aIzv4hIE1P4B/rPD+XWMHqEtRwf
	 hhrGoR7b0Ex2SRC+21Z48PxdxoKgXd0gFVfFRqCnUu8+9Wp22/zTyCYlw+WtERi/XZ
	 Rykq3mwZGElLfcIRWBLY+iiCJhMbhMbGQvqnZD7s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0204FF80482;
	Fri,  3 Dec 2021 13:06:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CC4BF80085; Fri,  3 Dec 2021 13:06:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33955F80085
 for <alsa-devel@alsa-project.org>; Fri,  3 Dec 2021 13:06:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33955F80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="XSgFhzuj"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1638533205; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=aFQ0MUAl5cmjx0RNq2c5kLd0FE+VoLrZgYdJ1DnA4z0=;
 b=XSgFhzujeSlKN/aSGcNV5XTdTWk2r7ztkF6iluvtu2dsGamoNgyC7zI8O3Zcy+I1Jol/IHxB
 AJAB23/mKayCiU5EVf+L2iZnHxFviggnulMcN1UoL73TvsPJ5iT9JoKnBf2E4MWHPczEvMEX
 YjC2AoHDtyYE3gbMFFbwP3ALAvg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 61aa08543553c354bed0f911 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 03 Dec 2021 12:06:44
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D3680C4361C; Fri,  3 Dec 2021 12:06:43 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E64E1C4361A;
 Fri,  3 Dec 2021 12:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E64E1C4361A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.com
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.com
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.com>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
Subject: [PATCH v7 1/2] ASoC: google: dt-bindings: Add sc7280-herobrine
 machine bindings
Date: Fri,  3 Dec 2021 17:36:22 +0530
Message-Id: <1638533183-19023-2-git-send-email-srivasam@codeaurora.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1638533183-19023-1-git-send-email-srivasam@codeaurora.com>
References: <1638533183-19023-1-git-send-email-srivasam@codeaurora.com>
Cc: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
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

From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>

Add devicetree bindings documentation file for sc7280 sound card
registration.

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 .../bindings/sound/google,sc7280-herobrine.yaml    | 171 +++++++++++++++++++++
 1 file changed, 171 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml

diff --git a/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
new file mode 100644
index 0000000..d1687b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/google,sc7280-herobrine.yaml
@@ -0,0 +1,171 @@
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
+      codec:
+        description: Holds subnode which indicates codec dai.
+        type: object
+        properties:
+          sound-dai: true
+
+    required:
+      - link-name
+      - cpu
+      - codec
+      - reg
+      - sound-dai
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
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

