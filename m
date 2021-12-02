Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BD246660C
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 16:00:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE5832763;
	Thu,  2 Dec 2021 15:59:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE5832763
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638457219;
	bh=Lid5Zr2Af92Z99XtwJpV1ecxQ+I+6PSg+oS8hwAVMcU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hHfSAwbRiRrpZVTT8/A+znIgSHk0LSNOLmI2OOmWMJSAu+8MXVQGLgLHhySjwa+Cf
	 b3L90lDP9kmSjL9ZoVX0Vb3fAozG+B5CDU8R7wJqdJOL7e5E0XQ+I7RYVQ/vc+iP4C
	 qipt5+17QeHbkGWfhm4rp7zAmlLJYrt57iqSJ3gg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F8C3F80517;
	Thu,  2 Dec 2021 15:57:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6DE5F80510; Thu,  2 Dec 2021 15:57:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D292EF802E0
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 15:57:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D292EF802E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="EaAZlmJP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1638457027;
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=69VoTyRpLpO98sh4C/ClvwoFOzZ+d0nmfaiGQQ9Sibo=;
 b=EaAZlmJPYhudVE2y+Py5PqORCJot2A2dYFSqIx0xSOPDwntGG7owYNNGVZL/249u8t
 zFwBQn3uH7phEnWIvbmT5ZP/MT2d+nEVaU1AGMzewqLmKKl6NjiZV0sSJC54siaukhQk
 k+1RFLkLxQ7FCm7tTSVV9/Bs3ALH/hVX1vjZNG4lv3D3WhwGHi0X6Z/LtxlPHuddFUjl
 LJGjya29oxL8IuhxN6ZQveFw1fpaZzFu5vDViNcqHO7J/HiLc3EaPNspRmCf7/WHYbqy
 WrWa2EYV1Dyv+446EBPT+DsysTYh4UnltU7wRopqlqh++ID1HckBG7woa1rvbY1Ri8Da
 ZHHw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fyLyu9s="
X-RZG-CLASS-ID: mo00
Received: from droid.. by smtp.strato.de (RZmta 47.34.10 AUTH)
 with ESMTPSA id j03bcbxB2Ev6pxy
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 2 Dec 2021 15:57:06 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/5] ASoC: dt-bindings: qcom: apq8016-sbc: Move to qcom,
 sm8250 DT schema
Date: Thu,  2 Dec 2021 15:55:03 +0100
Message-Id: <20211202145505.58852-4-stephan@gerhold.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211202145505.58852-1-stephan@gerhold.net>
References: <20211202145505.58852-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht
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

All the Qualcomm sound card drivers use the same common device tree
parsing code, so the allowed device tree nodes are almost the same
for all of them. Convert the qcom,apq8016-sbc-sndcard documentation
to a DT schema by adding it to the existing qcom,sm8250 schema.

The only speciality of qcom,apq8016-sbc-sndcard is that it has memory
resources for setting up an I/O mux. This can be handled using
a conditional if statement that only requires it for the apq8016-sbc
compatible.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Note: There will be a dtbs_check warning caused by this, because the
recommended naming for nodes is different in this DT schema (-dai-link
suffix). I will address this in a separate patch if this series is
accepted, simply by changing apq8016-sbc.dts to the example added
in this patch. The driver itself accepts any naming for those nodes.
---
 .../bindings/sound/qcom,apq8016-sbc.txt       | 96 -------------------
 .../bindings/sound/qcom,sm8250.yaml           | 83 +++++++++++++++-
 2 files changed, 81 insertions(+), 98 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt

diff --git a/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt b/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt
deleted file mode 100644
index 23998262a0a7..000000000000
--- a/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc.txt
+++ /dev/null
@@ -1,96 +0,0 @@
-* Qualcomm Technologies APQ8016 SBC ASoC machine driver
-
-This node models the Qualcomm Technologies APQ8016 SBC ASoC machine driver
-
-Required properties:
-
-- compatible		: "qcom,apq8016-sbc-sndcard"
-
-- pinctrl-N		: One property must exist for each entry in
-			  pinctrl-names.  See ../pinctrl/pinctrl-bindings.txt
-			  for details of the property values.
-- pinctrl-names		: Must contain a "default" entry.
-- reg			: Must contain an address for each entry in reg-names.
-- reg-names		: A list which must include the following entries:
-				* "mic-iomux"
-				* "spkr-iomux"
-- qcom,model		: Name of the sound card.
-
-- qcom,audio-routing	: A list of the connections between audio components.
-			  Each entry is a pair of strings, the first being the
-			  connection's sink, the second being the connection's
-			  source. Valid names could be power supplies, MicBias
-			  of msm8x16_wcd codec and the jacks on the board:
-
-			  Power supplies:
-			  * MIC BIAS External1
-			  * MIC BIAS External2
-			  * MIC BIAS Internal1
-			  * MIC BIAS Internal2
-
-			  Board connectors:
-			  * Headset Mic
-			  * Secondary Mic
-			  * DMIC
-			  * Ext Spk
-
-Optional properties:
-
-- aux-devs		: A list of phandles for auxiliary devices (e.g. analog
-			  amplifiers) that do not appear directly within the DAI
-			  links. Should be connected to another audio component
-			  using "qcom,audio-routing".
-
-Dai-link subnode properties and subnodes:
-
-Required dai-link subnodes:
-
-- cpu					: CPU   sub-node
-- codec					: CODEC sub-node
-
-Required CPU/CODEC subnodes properties:
-
--link-name		: Name of the dai link.
--sound-dai		: phandle/s and port of CPU/CODEC
-
-Example:
-
-sound: sound {
-	compatible = "qcom,apq8016-sbc-sndcard";
-	reg = <0x07702000 0x4>, <0x07702004 0x4>;
-	reg-names = "mic-iomux", "spkr-iomux";
-	qcom,model = "DB410c";
-
-	qcom,audio-routing =
-		"MIC BIAS External1", "Handset Mic",
-		"MIC BIAS Internal2", "Headset Mic",
-		"MIC BIAS External1", "Secondary Mic",
-		"AMIC1", "MIC BIAS External1",
-		"AMIC2", "MIC BIAS Internal2",
-		"AMIC3", "MIC BIAS External1",
-		"DMIC1", "MIC BIAS Internal1",
-		"MIC BIAS Internal1", "Digital Mic1",
-		"DMIC2", "MIC BIAS Internal1",
-		"MIC BIAS Internal1", "Digital Mic2";
-
-	/* I2S - Internal codec */
-	internal-dai-link@0 {
-		cpu { /* PRIMARY */
-			sound-dai = <&lpass MI2S_PRIMARY>;
-		};
-		codec {
-			sound-dai = <&lpass_codec 0>, <&wcd_codec 0>;
-		};
-	};
-
-	/* External Primary or External Secondary -ADV7533 HDMI */
-	external-dai-link@0 {
-		link-name = "ADV7533";
-		cpu { /* QUAT */
-			sound-dai = <&lpass MI2S_QUATERNARY>;
-		};
-		codec {
-			sound-dai = <&adv_bridge 0>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 3123382297b8..97f13a0a71a9 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -4,18 +4,19 @@
 $id: http://devicetree.org/schemas/sound/qcom,sm8250.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Technologies Inc. SM8250 ASoC sound card driver
+title: Qualcomm Technologies Inc. ASoC sound card drivers
 
 maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
 description:
-  This bindings describes SC8250 SoC based sound cards
+  This bindings describes Qualcomm SoC based sound cards
   which uses LPASS internal codec for audio.
 
 properties:
   compatible:
     enum:
+      - qcom,apq8016-sbc-sndcard
       - qcom,sm8250-sndcard
       - qcom,qrb5165-rb5-sndcard
 
@@ -37,6 +38,10 @@ properties:
     $ref: /schemas/types.yaml#/definitions/string
     description: User visible long sound card name
 
+  # Only valid for some compatibles (see allOf if below)
+  reg: true
+  reg-names: true
+
 patternProperties:
   ".*-dai-link$":
     description:
@@ -79,6 +84,33 @@ required:
   - compatible
   - model
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,apq8016-sbc-sndcard
+    then:
+      properties:
+        reg:
+          items:
+            - description: Microphone I/O mux register address
+            - description: Speaker I/O mux register address
+        reg-names:
+          items:
+            - const: mic-iomux
+            - const: spkr-iomux
+      required:
+        - compatible
+        - model
+        - reg
+        - reg-names
+    else:
+      properties:
+        reg: false
+        reg-names: false
+
 additionalProperties: false
 
 examples:
@@ -160,3 +192,50 @@ examples:
             };
         };
     };
+
+  - |
+    #include <dt-bindings/sound/qcom,lpass.h>
+    sound@7702000 {
+        compatible = "qcom,apq8016-sbc-sndcard";
+        reg = <0x07702000 0x4>, <0x07702004 0x4>;
+        reg-names = "mic-iomux", "spkr-iomux";
+
+        model = "DB410c";
+        audio-routing =
+            "AMIC2", "MIC BIAS Internal2",
+            "AMIC3", "MIC BIAS External1";
+
+        pinctrl-0 = <&cdc_pdm_lines_act &ext_sec_tlmm_lines_act &ext_mclk_tlmm_lines_act>;
+        pinctrl-1 = <&cdc_pdm_lines_sus &ext_sec_tlmm_lines_sus &ext_mclk_tlmm_lines_sus>;
+        pinctrl-names = "default", "sleep";
+
+        quaternary-dai-link {
+            link-name = "ADV7533";
+            cpu {
+                sound-dai = <&lpass MI2S_QUATERNARY>;
+            };
+            codec {
+                sound-dai = <&adv_bridge 0>;
+            };
+        };
+
+        primary-dai-link {
+            link-name = "WCD";
+            cpu {
+                sound-dai = <&lpass MI2S_PRIMARY>;
+            };
+            codec {
+                sound-dai = <&lpass_codec 0>, <&wcd_codec 0>;
+            };
+        };
+
+        tertiary-dai-link {
+            link-name = "WCD-Capture";
+            cpu {
+                sound-dai = <&lpass MI2S_TERTIARY>;
+            };
+            codec {
+                sound-dai = <&lpass_codec 1>, <&wcd_codec 1>;
+            };
+        };
+    };
-- 
2.34.1

