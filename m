Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 377FA1D36B3
	for <lists+alsa-devel@lfdr.de>; Thu, 14 May 2020 18:41:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5523B1670;
	Thu, 14 May 2020 18:40:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5523B1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589474498;
	bh=wp7tiOgtUqxAW7ExDlqhtQuwmTvk1+2WlDXNZ+N2VXI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y/e66jPDtMzmg1jngopsY4VCSho8VUmu1Q8BagEeXMzkVOQx1FY3g2wtFA6XVPv7n
	 Q1yHKGkf7ej9ol9d2aI0d2EsBRCx7RsBFcn7nlsyKJimLDf/52Uze5YO/XPKgvKx4n
	 0989siWPFhITdd9IISEKBOTRyp0f5VqfuLarYZ0g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FB9AF80227;
	Thu, 14 May 2020 18:39:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48D59F800E3; Thu, 14 May 2020 18:39:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D197CF800E3
 for <alsa-devel@alsa-project.org>; Thu, 14 May 2020 18:39:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D197CF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="b0+bkHjC"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1589474341; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=aDeKRezL2ohe2S555iUVc3znEAdHBbjAEbkLy8uaS6A=;
 b=b0+bkHjC8isyDeCP9BYsKGGOv1fI6OmdyFfve8aQQg6whCD8KPQOdmraLvllJkg3/gW18AP5
 Jognd6/29kkNr9AJ90DiN7YoeRBAyK3xmpV7QgoD7UuR4jYQcigs10uI6mgfFi0F7KzNsTM5
 Pn/MhSvJ8pkJ5fDQTTGrFasSfWg=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebd7422.7ff4c7055fb8-smtp-out-n04;
 Thu, 14 May 2020 16:38:58 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A01D9C432C2; Thu, 14 May 2020 16:38:58 +0000 (UTC)
Received: from c-ajitp-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: ajitp)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7CE18C433D2;
 Thu, 14 May 2020 16:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7CE18C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=ajitp@codeaurora.org
From: Ajit Pandey <ajitp@codeaurora.org>
To: broonie@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 srinivas.kandagatla@linaro.org
Subject: [PATCH v2 1/7] Documentation: device-tree: sound: Update lpass-cpu
 driver binding
Date: Thu, 14 May 2020 22:08:12 +0530
Message-Id: <1589474298-29437-2-git-send-email-ajitp@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589474298-29437-1-git-send-email-ajitp@codeaurora.org>
References: <“1586592171-31644-1-git-send-email-ajitp@codeaurora.org”>
 <1589474298-29437-1-git-send-email-ajitp@codeaurora.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Ajit Pandey <ajitp@codeaurora.org>
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

Done the required cleanups to update lpass-cpu binding with newer
yaml formats.

Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
---
 .../devicetree/bindings/sound/qcom,lpass-cpu.txt   |  79 -------------
 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 131 +++++++++++++++++++++
 2 files changed, 131 insertions(+), 79 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
deleted file mode 100644
index 32c2cdb..0000000
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
+++ /dev/null
@@ -1,79 +0,0 @@
-* Qualcomm Technologies LPASS CPU DAI
-
-This node models the Qualcomm Technologies Low-Power Audio SubSystem (LPASS).
-
-Required properties:
-
-- compatible		: "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu"
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
-Example:
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
diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
new file mode 100644
index 0000000..f2bcafc
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
@@ -0,0 +1,131 @@
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
+  - Ajit Pandey <ajitp@codeaurora.org>
+
+description:
+  Qualcomm SOC Low-Power Audio SubSystem (LPASS) that consist of MI2S interface
+  for audio data transfer on external codecs. LPASS cpu driver is a module to
+  configure Low-Power Audio Interface(LPAIF) core registers across different
+  IP versions.
+
+properties:
+  compatible:
+    enum:
+      - qcom,lpass-cpu
+      - qcom,apq8016-lpass-cpu
+
+  reg:
+    items:
+      - description: LPAIF core registers
+
+  reg-names:
+    items:
+      - const: lpass-lpaif
+
+  clocks:
+    items:
+      - description: AHBIX core clock for IPQ806X
+      - description: oscillator clock for MI2S external interfaces
+      - description: Bit clock for single MI2S dai in IPQ806X
+      - description: Bit clock for MI2S_PRIMARY dai interface
+      - description: Bit clock for MI2S_SECONDARY dai interface
+      - description: Bit clock for MI2S_TERTIARY dai interface
+      - description: Bit clock for MI2S_QUATERNARY dai interface
+      - description: NOC MPORT clock of LPASS core
+      - description: NOC SWAY clock of LPASS core
+
+  clock-names:
+    items:
+      - const: ahbix-clk
+      - const: mi2s-osr-clk
+      - const: mi2s-bit-clk
+      - const: mi2s-bit-clk0
+      - const: mi2s-bit-clk1
+      - const: mi2s-bit-clk2
+      - const: mi2s-bit-clk3
+      - const: pcnoc-mport-clk
+      - const: pcnoc-sway-clk
+
+  interrupts:
+    items:
+      - description: LPAIF DMA buffer interrupt
+
+  interrupt-names:
+    items:
+      - const: lpass-irq-lpaif
+
+  qcom,adsp:
+    maxItems: 1
+    description: Phandle for the audio DSP node
+
+  '#sound-dai-cells':
+    const: 1
+
+  child-node:
+    description: Required properties for each DAI
+    type: object
+    properties:
+      reg:
+        description: Must be one of the DAI ID
+                     (Usually part of dtbindings header)
+      qcom,playback-sd-lines:
+        description: List of serial data lines to use for playback
+                     Each SD line should be represented by a number from 0-3.
+      qcom,capture-sd-lines :
+        description: List of serial data lines to use for capture
+                     Each SD line should be represented by a number from 0-3.
+    required:
+      -reg
+    # Note that adding a subnode changes the default to "no lines configured",
+    # so both playback and capture lines should be configured when a subnode
+    # is added.
+
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - sound-dai-cells
+
+optional:
+  - qcom,adsp
+
+examples:
+  lpass@28100000 {
+	compatible = "qcom,lpass-cpu";
+	clocks = <&lcc AHBIX_CLK>,
+		 <&lcc MI2S_OSR_CLK>,
+		 <&lcc MI2S_BIT_CLK>;
+
+	clock-names = "ahbix-clk",
+		      "mi2s-osr-clk",
+		      "mi2s-bit-clk";
+
+	interrupts = <0 85 1>;
+	interrupt-names = "lpass-irq-lpaif";
+
+	reg = <0x28100000 0x10000>;
+	reg-names = "lpass-lpaif";
+	#sound-dai-cells = <1>;
+	qcom,adsp = <&adsp>;
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	/* Optional to set different MI2S SD lines */
+	mi2s-quaternary@3 {
+		reg = <MI2S_QUATERNARY>;
+		qcom,playback-sd-lines = <0 1>;
+  };
-- 
('The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project')
