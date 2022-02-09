Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3904F4AF2B1
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Feb 2022 14:28:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA546188F;
	Wed,  9 Feb 2022 14:27:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA546188F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644413321;
	bh=pHcROop7Zv/JPb0WUWGiqArwr6+rsnE6Y4fSn+apuD0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aqCl/KpRmZUZewsWdfnk7QXkP9x/1mvfAe5S0Pclvdplurqysy/5536U9uRBN00j4
	 p6rlAlHvcuJ/7qQqgWSaYz0tGZ725tFyvO4WEq4RPhcA5rxX3bb5e95+3tAFCvDQcC
	 9ykN7AgmNdNbiNcF0/pcCbjyixXvZbKGC1e++A14=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEE07F8047B;
	Wed,  9 Feb 2022 14:27:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52FB6F8016B; Wed,  9 Feb 2022 14:27:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21183F800F0
 for <alsa-devel@alsa-project.org>; Wed,  9 Feb 2022 14:27:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21183F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="DQimbYyB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644413245; x=1675949245;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=bvKhpXeLkVZC1dxgHaHqweIjQnswdfTUA8NDWglpyno=;
 b=DQimbYyBwfUSz+CLj0vQHSQlmTsKcVtv+4WiiAnrm4nMPcKaRnmJ5Y7z
 MToMT681FDS0oAniOkSu/DILhQQ7tX3Gw6yuaord/cU0LBAFfQ2lJcrmY
 tREUBdWAe3vGn6ZT1SFbeP26PkrRtJTLj+aSNsNoZu7vvf3N74aNa21Fa I=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 09 Feb 2022 05:27:20 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 05:27:19 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 9 Feb 2022 05:26:47 -0800
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 9 Feb 2022 05:26:41 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <plai@codeaurora.org>,
 <bgoswami@codeaurora.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <rohitkr@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>
Subject: [RESEND v8 1/3] ASoC: google: dt-bindings: Add sc7280-herobrine
 machine bindings
Date: Wed, 9 Feb 2022 18:56:19 +0530
Message-ID: <1644413181-26358-2-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644413181-26358-1-git-send-email-quic_srivasam@quicinc.com>
References: <1644413181-26358-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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
2.7.4

