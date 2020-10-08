Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 666F5286E08
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Oct 2020 07:20:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1DC516C7;
	Thu,  8 Oct 2020 07:19:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1DC516C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602134408;
	bh=39qNuveGcekF2/vDIxkkoYnWdjHbsYNvRygnnBh1EAA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pk7GCInuCr1vKzYM8ESHoVP/cBUALjGRJ3CqKlDKOW4VTGpBST6q+aKmKP+O1kdPd
	 XraNETMY9MUP+CdIuaDMreYYrZAdOQBcvHQJC2LuVZkBkkiJGuLIAhxqFIax3cX1fM
	 2/HCNnY4KWVCyFMeVejQt/qjqQFIFwn99g8y9Bi8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F1BBF80218;
	Thu,  8 Oct 2020 07:17:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72525F8016C; Thu,  8 Oct 2020 07:17:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B1D0F80090
 for <alsa-devel@alsa-project.org>; Thu,  8 Oct 2020 07:17:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B1D0F80090
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="r2BSNRHN"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1602134253; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Eue6OXobtSODzsRRtxONbVDKk/A4RNjBLFr7AI3Uwek=;
 b=r2BSNRHNswaBz1vtbwhkrKiK6ARl8W1XYAxqfV3Ki6h3ZQHQ/43TQ3x6XO7BGCcObk8X5fmh
 CnK6yBqLJv8wJ4U3Raa1CheAw4LRM63c3nGngQV9xaNoK0TDPAhBsO95X2L+MlhNnm0epbRT
 MoNeC8cYoxhhvNGOK0i63z0gxlQ=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f7ea0ed319d4e9cb550e33e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 08 Oct 2020 05:17:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 28080C433CB; Thu,  8 Oct 2020 05:17:33 +0000 (UTC)
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 05735C433F1;
 Thu,  8 Oct 2020 05:17:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 05735C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=srivasam@codeaurora.org
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v11 2/7] ASoC: dt-bindings: Add dt binding for lpass hdmi
Date: Thu,  8 Oct 2020 10:46:58 +0530
Message-Id: <1602134223-2562-3-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602134223-2562-1-git-send-email-srivasam@codeaurora.org>
References: <1602134223-2562-1-git-send-email-srivasam@codeaurora.org>
Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
 Srinivasa Rao <srivasam@codeaurora.org>
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

From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>

Adds bindings for lpass hdmi interface
which can support audio path over dp.

Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>
---
 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 74 +++++++++++++++-------
 1 file changed, 52 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
index 09c9bd2..f6f9fb4 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
@@ -24,9 +24,10 @@ properties:
       - qcom,sc7180-lpass-cpu
 
   reg:
-    maxItems: 1
+    maxItems: 2
     description: LPAIF core registers
-
+  reg-names:
+     maxItems: 2
   clocks:
     minItems: 3
     maxItems: 6
@@ -36,15 +37,16 @@ properties:
     maxItems: 6
 
   interrupts:
-    maxItems: 1
+    maxItems: 2
     description: LPAIF DMA buffer interrupt
-
+  interrupt-names:
+    maxItems: 2
   qcom,adsp:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: Phandle for the audio DSP node
 
   iommus:
-    maxItems: 1
+    maxItems: 2
     description: Phandle to apps_smmu node with sid mask
 
   power-domains:
@@ -60,10 +62,12 @@ properties:
     const: 0
 
 patternProperties:
-  "(^mi2s-[0-9a-f]$|mi2s)":
+  "^dai-link@[0-9a-f]$":
     type: object
-    description: Required properties for each DAI
-
+    description: |
+      LPASS CPU dai node for each I2S device. Bindings of each node
+      depends on the specific driver providing the functionality and
+      properties.
     properties:
       reg:
         maxItems: 1
@@ -85,9 +89,11 @@ patternProperties:
 required:
   - compatible
   - reg
+  - reg-names
   - clocks
   - clock-names
   - interrupts
+  - interrupt-names
   - '#sound-dai-cells'
 
 additionalProperties: false
@@ -134,13 +140,32 @@ allOf:
     then:
       properties:
         clock-names:
-          items:
-            - const: pcnoc-sway-clk
-            - const: audio-core
-            - const: mclk0
-            - const: pcnoc-mport-clk
-            - const: mi2s-bit-clk0
-            - const: mi2s-bit-clk1
+          oneOf:
+           - items:   #for I2S
+              - const: pcnoc-sway-clk
+              - const: audio-core
+              - const: mclk0
+              - const: pcnoc-mport-clk
+              - const: mi2s-bit-clk0
+              - const: mi2s-bit-clk1
+           - items:   #for HDMI
+              - const: pcnoc-sway-clk
+              - const: audio-core
+              - const: pcnoc-mport-clk
+        reg-names:
+          anyOf:
+            - items:   #for I2S
+              - const: lpass-lpaif
+            - items:   #for I2S and HDMI
+              - const: lpass-hdmiif
+              - const: lpass-lpaif
+        interrupt-names:
+          anyOf:
+            - items:   #for I2S
+              - const: lpass-irq-lpaif
+            - items:   #for I2S and HDMI
+              - const: lpass-irq-lpaif
+              - const: lpass-irq-hdmi
       required:
         - iommus
         - power-domains
@@ -152,12 +177,15 @@ examples:
     soc {
         #address-cells = <2>;
         #size-cells = <2>;
-        lpass@62f00000 {
+        lpass@62d80000 {
             compatible = "qcom,sc7180-lpass-cpu";
 
-            reg = <0 0x62f00000  0 0x29000>;
-
-            iommus = <&apps_smmu 0x1020 0>;
+            reg = <0 0x62d87000 0 0x68000>,
+                  <0 0x62f00000 0 0x29000>;
+            reg-names = "lpass-hdmiif",
+                        "lpass-lpaif";
+            iommus = <&apps_smmu 0x1020 0>,
+                     <&apps_smmu 0x1032 0>;
             power-domains = <&lpass_hm 0>;
 
             clocks = <&gcc 131>,
@@ -171,14 +199,16 @@ examples:
                           "mclk0", "pcnoc-mport-clk",
                           "mi2s-bit-clk0", "mi2s-bit-clk1";
 
-            interrupts = <0 160 1>;
-
+            interrupts = <0 160 1>,
+                         <0 268 1>;
+            interrupt-names = "lpass-irq-lpaif",
+                              "lpass-irq-hdmi";
             #sound-dai-cells = <1>;
 
             #address-cells = <1>;
             #size-cells = <0>;
             /* Optional to set different MI2S SD lines */
-            mi2s-primary@0 {
+            dai-link@0 {
                 reg = <MI2S_PRIMARY>;
                 qcom,playback-sd-lines = <1>;
                 qcom,capture-sd-lines = <0>;
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

