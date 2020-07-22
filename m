Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7534A22966C
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 12:41:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 208571670;
	Wed, 22 Jul 2020 12:40:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 208571670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595414490;
	bh=6x+s8Q2AxDbEOHu3dri2CJXIRxsZN8uSoMeOJL3rX/E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E6kBV82PaF2PvORwGZNamvDLiPARSa4F/51vXCt6uZkqYAbMgzhB4I68xBxt1PPIq
	 Yedmp+AcMnW8KheES0aQ6xpykWB5ZQi+rsoLSRy44Grj1Yor8P3yD1jl/Sqhc5uj0H
	 OgadLM3DEVapK6N9t1tpu1Yrd6QOhHIPR37fpqbA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC8F9F8014C;
	Wed, 22 Jul 2020 12:35:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60874F80338; Wed, 22 Jul 2020 12:35:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D24AF8014C
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 12:34:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D24AF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="kEmUJU8F"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1595414093; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=JG8mkzVcX0Gg43RaKrfKLGwnFc0DGEkRUtwaONvTcEY=;
 b=kEmUJU8F2Rsbaizq9/AMR2XSfAAy56JnADt5sICbP7GrziLrglRDx0c6n+Z7UOBTvG98Jiqb
 wTlkagLAKo5gmstTERPYygMflJEoedUhtzAtnr14G+7c0Ikfu3yg+n//TJOGgiU/VTux5XTX
 3k6Alu7VbGiOY5PFaSIj6HoKVs0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5f18164c5912b3a4056a3fae (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 22 Jul 2020 10:34:52
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 909D1C4339C; Wed, 22 Jul 2020 10:34:52 +0000 (UTC)
Received: from rohkumar-linux.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rohitkr)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0B352C433C6;
 Wed, 22 Jul 2020 10:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0B352C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=rohitkr@codeaurora.org
From: Rohit kumar <rohitkr@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 12/12] dt-bindings: sound: lpass-cpu: Move to yaml format
Date: Wed, 22 Jul 2020 16:01:55 +0530
Message-Id: <1595413915-17867-13-git-send-email-rohitkr@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
References: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
Cc: Rohit kumar <rohitkr@codeaurora.org>
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

Update lpass-cpu binding with yaml formats.

Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
---
 .../devicetree/bindings/sound/qcom,lpass-cpu.txt   | 130 ---------------
 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 185 +++++++++++++++++++++
 2 files changed, 185 insertions(+), 130 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
deleted file mode 100644
index c21392e..00000000
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
+++ /dev/null
@@ -1,130 +0,0 @@
-* Qualcomm Technologies LPASS CPU DAI
-
-This node models the Qualcomm Technologies Low-Power Audio SubSystem (LPASS).
-
-Required properties:
-
-- compatible		: "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu" or
-			  "qcom,lpass-cpu-sc7180"
-- clocks		: Must contain an entry for each entry in clock-names.
-- clock-names		: A list which must include the following entries:
-				* "ahbix-clk"
-				* "mi2s-osr-clk"
-				* "mi2s-bit-clk"
-			: required clocks for "qcom,lpass-cpu-apq8016"
-				* "ahbix-clk"
-				* "mi2s-bit-clk0"
-				* "mi2s-bit-clk1"
-				* "mi2s-bit-clk2"
-				* "mi2s-bit-clk3"
-				* "pcnoc-mport-clk"
-				* "pcnoc-sway-clk"
-			: required clocks for "qcom,lpass-cpu-sc7180"
-				* "audio-core"
-				* "mclk0"
-				* "mi2s-bit-clk0"
-				* "mi2s-bit-clk1"
-				* "pcnoc-sway-clk"
-				* "pcnoc-mport-clk"
-
-- interrupts		: Must contain an entry for each entry in
-			  interrupt-names.
-- interrupt-names	: A list which must include the following entries:
-				* "lpass-irq-lpaif"
-- pinctrl-N		: One property must exist for each entry in
-			  pinctrl-names.  See ../pinctrl/pinctrl-bindings.txt
-			  for details of the property values.
-- pinctrl-names		: Must contain a "default" entry.
-- reg			: Must contain an address for each entry in reg-names.
-- reg-names		: A list which must include the following entries:
-				* "lpass-lpaif"
-- #address-cells	: Must be 1
-- #size-cells		: Must be 0
-
-
-
-Optional properties:
-
-- qcom,adsp		: Phandle for the audio DSP node
-
-By default, the driver uses up to 4 MI2S SD lines, for a total of 8 channels.
-The SD lines to use can be configured by adding subnodes for each of the DAIs.
-
-Required properties for each DAI (represented by a subnode):
-- reg			: Must be one of the DAI IDs
-			  (usually part of dt-bindings header)
-- qcom,playback-sd-lines: List of serial data lines to use for playback
-			  Each SD line should be represented by a number from 0-3.
-- qcom,capture-sd-lines	: List of serial data lines to use for capture
-			  Each SD line should be represented by a number from 0-3.
-
-Note that adding a subnode changes the default to "no lines configured",
-so both playback and capture lines should be configured when a subnode is added.
-
-Examples:
-1)
-
-lpass@28100000 {
-	compatible = "qcom,lpass-cpu";
-	clocks = <&lcc AHBIX_CLK>, <&lcc MI2S_OSR_CLK>, <&lcc MI2S_BIT_CLK>;
-	clock-names = "ahbix-clk", "mi2s-osr-clk", "mi2s-bit-clk";
-	interrupts = <0 85 1>;
-	interrupt-names = "lpass-irq-lpaif";
-	pinctrl-names = "default", "idle";
-	pinctrl-0 = <&mi2s_default>;
-	pinctrl-1 = <&mi2s_idle>;
-	reg = <0x28100000 0x10000>;
-	reg-names = "lpass-lpaif";
-	qcom,adsp = <&adsp>;
-
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	/* Optional to set different MI2S SD lines */
-	dai@3 {
-		reg = <MI2S_QUATERNARY>;
-		qcom,playback-sd-lines = <0 1>;
-	};
-};
-
-2)
-
-#include <dt-bindings/sound/sc7180-lpass.h>
-
-lpass_cpu: lpass {
-	compatible = "qcom,lpass-cpu-sc7180";
-
-	reg = <0 0x62F00000 0 0x29000>;
-
-	iommus = <&apps_smmu 0x1020 0>;
-
-	power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
-	clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>,
-		<&lpasscorecc LPASS_AUDIO_CORE_CORE_CLK>,
-		<&lpasscorecc LPASS_AUDIO_CORE_EXT_MCLK0_CLK>,
-		<&lpasscorecc LPASS_AUDIO_CORE_SYSNOC_MPORT_CORE_CLK>,
-		<&lpasscorecc LPASS_AUDIO_CORE_LPAIF_PRI_IBIT_CLK>,
-		<&lpasscorecc LPASS_AUDIO_CORE_LPAIF_SEC_IBIT_CLK>;
-	clock-names = "pcnoc-sway-clk", "audio-core",
-			"mclk0", "pcnoc-mport-clk",
-			"mi2s-bit-clk0", "mi2s-bit-clk1";
-	interrupts = <0 160 IRQ_TYPE_LEVEL_HIGH>;
-	interrupt-names = "lpass-irq-lpaif";
-
-
-	#sound-dai-cells = <1>;
-
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	mi2s-primary@0 {
-		reg = <MI2S_PRIMARY>;
-		qcom,playback-sd-lines = <1>;
-		qcom,capture-sd-lines = <0>;
-	};
-
-	mi2s-secondary@1 {
-		reg = <MI2S_SECONDARY>;
-		qcom,playback-sd-lines = <0>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
new file mode 100644
index 00000000..03c598f
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
@@ -0,0 +1,185 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm LPASS CPU dai driver bindings
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+  - Rohit kumar <rohitkr@codeaurora.org>
+
+description: |
+  Qualcomm SOC Low-Power Audio SubSystem (LPASS) that consist of MI2S interface
+  for audio data transfer on external codecs. LPASS cpu driver is a module to
+  configure Low-Power Audio Interface(LPAIF) core registers across different
+  IP versions.
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,lpass-cpu
+        description: For IPQ806x
+
+      - const: qcom,apq8016-lpass-cpu
+        description: For APQ8016
+
+      - const: qcom,lpass-cpu-sc7180
+        description: For SC7180
+
+  reg:
+    maxItems: 1
+    description: LPAIF core registers
+
+  clocks:
+    minItems: 3
+    maxItems: 6
+
+  clock-names:
+    minItems: 3
+    maxItems: 6
+
+  interrupts:
+    maxItems: 1
+    description: LPAIF DMA buffer interrupt
+
+  qcom,adsp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle for the audio DSP node
+
+  iommus:
+    maxItems: 1
+    description: Phandle to apps_smmu node with sid mask
+
+  power-domains:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 1
+
+patternProperties:
+  "(^mi2s-[0-9a-f]$|mi2s)":
+    type: object
+    description: Required properties for each DAI
+
+    properties:
+      reg:
+        maxItems: 1
+        description: Must be one of the DAI ID
+
+    required:
+      - reg
+
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - '#sound-dai-cells'
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,lpass-cpu-sc7180
+
+    then:
+      required:
+        - iommus
+        - power-domains
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,lpass-cpu
+
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: ahbix-clk
+            - const: mi2s-osr-clk
+            - const: mi2s-bit-clk
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,apq8016-lpass-cpu
+
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: ahbix-clk
+            - const: mi2s-bit-clk0
+            - const: mi2s-bit-clk1
+            - const: mi2s-bit-clk2
+            - const: mi2s-bit-clk3
+            - const: pcnoc-mport-clk
+            - const: pcnoc-sway-clk
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,lpass-cpu-sc7180
+
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: pcnoc-sway-clk
+            - const: audio-core
+            - const: mclk0
+            - const: pcnoc-mport-clk
+            - const: mi2s-bit-clk0
+            - const: mi2s-bit-clk1
+
+examples:
+  - |
+    #include <dt-bindings/sound/sc7180-lpass.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        lpass@62f00000 {
+            compatible = "qcom,lpass-cpu-sc7180";
+
+            reg = <0 0x62f00000  0 0x29000>;
+
+            iommus = <&apps_smmu 0x1020 0>;
+            power-domains = <&lpass_hm 0>;
+
+            clocks = <&gcc 131>,
+                 <&lpasscorecc 6>,
+                 <&lpasscorecc 7>,
+                 <&lpasscorecc 10>,
+                 <&lpasscorecc 8>,
+                 <&lpasscorecc 9>;
+
+            clock-names = "pcnoc-sway-clk", "audio-core",
+                          "mclk0", "pcnoc-mport-clk",
+                          "mi2s-bit-clk0", "mi2s-bit-clk1";
+
+            interrupts = <0 160 1>;
+
+            #sound-dai-cells = <1>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+            /* Optional to set different MI2S SD lines */
+            mi2s-primary@0 {
+                reg = <MI2S_PRIMARY>;
+                qcom,playback-sd-lines = <1>;
+                qcom,capture-sd-lines = <0>;
+            };
+        };
+    };
+
+...
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

