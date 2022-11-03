Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E75C61875B
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Nov 2022 19:21:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1279086E;
	Thu,  3 Nov 2022 19:20:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1279086E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667499683;
	bh=7kexx5aSRDT78KBP5AfTUKfmCOUdDakZgxwkDab2+gs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JJA9tsP9LhCa8z65bAZUd7359UZSeJIMcTvdU8QCaRwj3dhYmOzZdSa++cKapUU+w
	 4CJY7QpEerTFfaX/+sy2oIZ9I8kLMCMRci2U5lvFuY2HFOSiqHWCVpiWV2WfLjzJb/
	 H7uNxf55eBpxxr27kBomzVKdVBS2m0B7u1dhtgqs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E99BF801D5;
	Thu,  3 Nov 2022 19:20:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8646F8051E; Thu,  3 Nov 2022 19:20:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20485F801D5
 for <alsa-devel@alsa-project.org>; Thu,  3 Nov 2022 19:20:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20485F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de
 header.b="ab735NtM"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2849683F4E;
 Thu,  3 Nov 2022 19:20:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1667499622;
 bh=n51u6LhFoceBViiV5/DmLIF5y/lACNEMtpDmoM1ErXc=;
 h=From:To:Cc:Subject:Date:From;
 b=ab735NtMzRYBxdhstvZORIGr01mtOwOhEMCz8Fbz1ff9sJNKPBqQapxV2fcrsxNcD
 wynSaiiR5UCr+ZM5qJys8B/3J45OoKAJwNgGO0YDgasAY4w7IpyCSr9IxLugN83WJ2
 0snxXbTsquw91C7WccW3Wxs3ZiFGBqblgP0337LlLL2eXsde4bsqXU4MGvpY2H8uyZ
 jokf3H8NLVisfOIPYY/lCpxjvnTi8GuK7dZBJospVxIcASonniORmYtaKCN2TUx3Wh
 BeuVICOP7ABTqPrDiy6DbJW5giqa1h0YYibKE+x6tvsaZCHNzc3vkW86kixk20hkGf
 ikvGff5Udw8cA==
From: Marek Vasut <marex@denx.de>
To: devicetree@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: fsl-sai: Convert to YAML DT schema
Date: Thu,  3 Nov 2022 19:20:16 +0100
Message-Id: <20221103182016.95808-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, alsa-devel@alsa-project.org,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Fabio Estevam <festevam@gmail.com>
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

Convert the SAI bindings to YAML DT schema to permit validation.
Add Shengjiu as maintainer, derived from sound/soc/fsl/fsl_sai.c
get_maintainer result.

Describe existing used combinations of compatible strings, add the
missing imx7d-sai compatible string which is used on i.MX7 .

Properties lsb-first, fsl,sai-synchronous-rx, fsl,sai-asynchronous,
fsl,dataline are no longer listed as required, since those are clearly
optional, even the description says so, so does their usage.

Fix the undefined edma channel macro per arch/arm/boot/dts/vfxxx.dtsi ,
use the value itself just like in the vfxxx.dtsi .

Document interrupts property, which was previously undocumented, but
it is required property of this IP.

Document #sound-sai-cells, which should be zero for this IP.

Document fsl,imx6ul-iomuxc-gpr and its dependency on MX6UL and
fsl,sai-mclk-direction-output .

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: alsa-devel@alsa-project.org
To: devicetree@vger.kernel.org
---
 .../devicetree/bindings/sound/fsl-sai.yaml    | 188 ++++++++++++++++++
 1 file changed, 188 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl-sai.yaml

diff --git a/Documentation/devicetree/bindings/sound/fsl-sai.yaml b/Documentation/devicetree/bindings/sound/fsl-sai.yaml
new file mode 100644
index 0000000000000..e6620a127f419
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl-sai.yaml
@@ -0,0 +1,188 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/fsl-sai.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale Synchronous Audio Interface (SAI).
+
+maintainers:
+  - Shengjiu Wang <shengjiu.wang@gmail.com>
+
+description:
+  The SAI is based on I2S module that used communicating with audio
+  codecs, which provides a synchronous audio interface that supports
+  fullduplex serial interfaces with frame synchronization such as I2S,
+  AC97, TDM, and codec/DSP interfaces.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,imx6ul-sai
+              - fsl,imx7d-sai
+          - const: fsl,imx6sx-sai
+
+      - items:
+          - enum:
+              - fsl,imx8mm-sai
+              - fsl,imx8mn-sai
+              - fsl,imx8mp-sai
+          - const: fsl,imx8mq-sai
+
+      - items:
+          - enum:
+              - fsl,imx6sx-sai
+              - fsl,imx7ulp-sai
+              - fsl,imx8mq-sai
+              - fsl,imx8qm-sai
+              - fsl,imx8ulp-sai
+              - fsl,vf610-sai
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 4
+    maxItems: 6
+
+  clock-names:
+    minItems: 4
+    items:
+      - const: bus
+      - const: mclk1
+      - const: mclk2
+      - const: mclk3
+      - const: pll8k
+      - const: pll11k
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+  interrupts:
+    maxItems: 1
+
+  lsb-first:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      Configures whether the LSB or the MSB is transmitted first for the
+      fifo data. If this property is absent, the MSB is transmitted first
+      as default, or the LSB is transmitted first.
+
+  fsl,sai-synchronous-rx:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      This is a boolean property. If present, indicating that SAI will
+      work in the synchronous mode (sync Tx with Rx) which means both
+      the transmitter and the receiver will send and receive data by
+      following receiver's bit clocks and frame sync clocks.
+      If both fsl,sai-asynchronous and fsl,sai-synchronous-rx are
+      absent, the default synchronous mode (sync Rx with Tx) will
+      be used, which means both transmitter and receiver will send
+      and receive data by following clocks of transmitter.
+      fsl,sai-asynchronous and fsl,sai-synchronous-rx are exclusive.
+
+  fsl,sai-asynchronous:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      If present, indicating that SAI will work in the asynchronous
+      mode, which means both transmitter and receiver will send and
+      receive data by following their own bit clocks and frame sync
+      clocks separately.
+      If both fsl,sai-asynchronous and fsl,sai-synchronous-rx are
+      absent, the default synchronous mode (sync Rx with Tx) will
+      be used, which means both transmitter and receiver will send
+      and receive data by following clocks of transmitter.
+      fsl,sai-asynchronous and fsl,sai-synchronous-rx are exclusive.
+
+  fsl,dataline:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description: |
+      Configure the dataline. It has 3 values for each configuration:
+      first one means the type: I2S(1) or PDM(2)
+      second one is dataline mask for 'rx'
+      third one is dataline mask for 'tx'.
+      for example: fsl,dataline = <1 0xff 0xff 2 0xff 0x11>;
+      means I2S type rx mask is 0xff, tx mask is 0xff, PDM type
+      rx mask is 0xff, tx mask is 0x11 (dataline 1 and 4 enabled).
+
+  fsl,sai-mclk-direction-output:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      If present, indicates that SAI will output the SAI MCLK clock.
+
+  fsl,imx6ul-iomuxc-gpr:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to MX6UL IOMUXC GPR shared register file.
+
+  big-endian:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+     Required if all the SAI registers are big-endian rather
+     than little-endian.
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - dmas
+  - dma-names
+  - interrupts
+
+unevaluatedProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx6ul-sai
+    then:
+      dependencies:
+        fsl,imx6ul-iomuxc-gpr: [ "fsl,sai-mclk-direction-output" ]
+
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - fsl,imx6ul-sai
+                - fsl,imx8mm-sai
+                - fsl,imx8mn-sai
+                - fsl,imx8mp-sai
+                - fsl,imx8mq-sai
+    then:
+      properties:
+        fsl,sai-mclk-direction-output: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/vf610-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    sai@40031000 {
+      compatible = "fsl,vf610-sai";
+      reg = <0x40031000 0x1000>;
+      interrupts = <86 IRQ_TYPE_LEVEL_HIGH>;
+      pinctrl-names = "default";
+      pinctrl-0 = <&pinctrl_sai2_1>;
+      clocks = <&clks VF610_CLK_PLATFORM_BUS>, <&clks VF610_CLK_SAI2>,
+               <&clks 0>, <&clks 0>;
+      clock-names = "bus", "mclk1", "mclk2", "mclk3";
+      dma-names = "tx", "rx";
+      dmas = <&edma0 0 21>, <&edma0 0 20>;
+      big-endian;
+      lsb-first;
+    };
-- 
2.35.1

