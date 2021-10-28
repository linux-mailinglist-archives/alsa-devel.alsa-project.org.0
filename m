Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED14743E32B
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Oct 2021 16:10:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9390516B0;
	Thu, 28 Oct 2021 16:09:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9390516B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635430241;
	bh=msEMlCtFqC02wjDeVGqYx/e5dQv43awUeCaFeasnMUk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nVlOhDmsnq203p/A+mz11yKYPqnpYtB8QIRUGngBbgYArpybnOAsGiM0FIOLvgIjR
	 fPVdfXDe67Y9t7cBsUJXYbhOVe7k9az5A/2X+KvAnFhvWzfs+hlaBZ7yDt1qti9MrE
	 TjJpLuVAEMLruwW9Nx3cJoekSuPS2xCFTr6CE7dg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BE05F802C8;
	Thu, 28 Oct 2021 16:09:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C27F4F804AE; Thu, 28 Oct 2021 16:09:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55299F800D1
 for <alsa-devel@alsa-project.org>; Thu, 28 Oct 2021 16:09:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55299F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ac4P5ixF"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19S8422v008357; 
 Thu, 28 Oct 2021 09:09:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=ylyszxl6RmoDk5QKBwTk7IRZiZFRZuDT4K1m74zAvuA=;
 b=ac4P5ixF5zWnpuPsKQ959F1kqewm54po9vFdCnyCK0+YUa3mGJGM5PEXBMBM3zqe3AsZ
 9U3Sr3/qvG8w80yR8jTf2tyWa8tiSSb6abmKh/qbiee4txhqaIWbnl7H3etn5guiAFsX
 MMIKyvp3JZfMcoS7k/GX+gX3eEuc30DD+O01ZlyuYy44yWRRQy0t/W+ZJK0aVTqtJSR2
 IqWMxobdeW7qo8IdpGgh5fMBxIVuFnSM9nDR/VOeAFiQca+peggnRcna5ej5VXocAjiO
 gdQCS4Fotzn588XBLh535qcwq4keSm84+xAEzo5HnPFaOhpOjN1G76HKAwNQvFPDJt8m Ng== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3bya1wh98x-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 28 Oct 2021 09:09:11 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Thu, 28 Oct
 2021 15:09:08 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Thu, 28 Oct 2021 15:09:08 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.65.32])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CA15311DC;
 Thu, 28 Oct 2021 14:09:07 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>
Subject: [PATCH 3/3] ASoC: dt-bindings: cs42l42: Convert binding to yaml
Date: Thu, 28 Oct 2021 15:09:02 +0100
Message-ID: <20211028140902.11786-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211028140902.11786-1-rf@opensource.cirrus.com>
References: <20211028140902.11786-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: YTENUn3XB1bMF0zsdiuOeyte2ZGDs3ne
X-Proofpoint-ORIG-GUID: YTENUn3XB1bMF0zsdiuOeyte2ZGDs3ne
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
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

Replace the old .txt binding with a new schema binding.
At the same time, some of the descriptions are updated to make them
clearer, fix errors, or just make them fit better into the style
of schema binding.

The cirrus,hs-bias-ramp-rate property was missing from the old .txt
binding and has been added to the yaml.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 .../devicetree/bindings/sound/cirrus,cs42l42.yaml  | 225 +++++++++++++++++++++
 .../devicetree/bindings/sound/cs42l42.txt          | 115 -----------
 MAINTAINERS                                        |   1 +
 3 files changed, 226 insertions(+), 115 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/cs42l42.txt

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
new file mode 100644
index 000000000000..31800f70e9d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
@@ -0,0 +1,225 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cirrus Logic CS42L42 audio CODEC
+
+maintainers:
+  - patches@opensource.cirrus.com
+
+description:
+  The CS42L42 is a low-power audio codec designed for portable applications.
+  It provides a high-dynamic range, stereo DAC for audio playback and a mono
+  high-dynamic-range ADC for audio capture. There is an integrated headset
+  detection block.
+
+properties:
+  compatible:
+    enum:
+      - cirrus,cs42l42
+
+  reg:
+    description:
+      The I2C address of the CS42L42.
+    maxItems: 1
+
+  VP-supply:
+    description:
+      VP power supply.
+
+  VCP-supply:
+    description:
+      Charge pump power supply.
+
+  VD_FILT-supply:
+    description:
+      FILT+ power supply.
+
+  VL-supply:
+    description:
+      Logic power supply.
+
+  VA-supply:
+    description:
+      Analog power supply.
+
+  reset-gpios:
+    description:
+      This pin will be asserted and then deasserted to reset the
+      CS42L42 before communication starts.
+    maxItems: 1
+
+  interrupts:
+    description:
+      Interrupt for CS42L42 IRQ line.
+    maxItems: 1
+
+  cirrus,ts-inv:
+    description: |
+      Sets the behaviour of the jack plug detect switch.
+
+      0 - (Default) Shorted to tip when unplugged, open when plugged.
+      This is "inverted tip sense (ITS)" in the datasheet.
+
+      1 - Open when unplugged, shorted to tip when plugged.
+      This is "normal tip sense (TS)" in the datasheet.
+
+      The CS42L42_TS_INV_* defines are available for this.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 0
+    maximum: 1
+
+  cirrus,ts-dbnc-rise:
+    description: |
+      Debounce the rising edge of TIP_SENSE_PLUG. With no
+      debounce, the tip sense pin might be noisy on a plug event.
+
+      0 - 0ms
+      1 - 125ms
+      2 - 250ms
+      3 - 500ms
+      4 - 750ms
+      5 - 1s (Default)
+      6 - 1.25s
+      7 - 1.5s
+
+      The CS42L42_TS_DBNCE_* defines are available for this.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 0
+    maximum: 7
+
+  cirrus,ts-dbnc-fall:
+    description: |
+      Debounce the falling edge of TIP_SENSE_UNPLUG. With no
+      debounce, the tip sense pin might be noisy on an unplug event.
+
+      0 - 0ms
+      1 - 125ms
+      2 - 250ms
+      3 - 500ms
+      4 - 750ms
+      5 - 1s (Default)
+      6 - 1.25s
+      7 - 1.5s
+
+      The CS42L42_TS_DBNCE_* defines are available for this.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 0
+    maximum: 7
+
+  cirrus,btn-det-init-dbnce:
+    description: |
+      This sets how long to wait after enabling button detection
+      interrupts before servicing button interrupts, to allow the
+      HS bias time to settle. Value is in milliseconds.
+      There may be erroneous button interrupts if this debounce time
+      is too short.
+
+      0ms - 200ms,
+      Default = 100ms
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 0
+    maximum: 200
+
+  cirrus,btn-det-event-dbnce:
+    description: |
+      This sets how long to wait after receiving a button press
+      interrupt before processing it. Allows time for the button
+      press to make a clean connection with the bias resistors.
+      Value is in milliseconds.
+
+      0ms - 20ms,
+      Default = 10ms
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 0
+    maximum: 20
+
+  cirrus,bias-lvls:
+    description: |
+      For a level-detect headset button scheme, each button will bias
+      the mic pin to a certain voltage. To determine which button was
+      pressed, the voltage is compared to sequential, decreasing
+      voltages, until the compared voltage < bias voltage.
+      For different hardware setups, a designer might want to tweak this.
+      This is an array of descending values for the comparator voltage,
+      given as percent of the HSBIAS voltage.
+
+      Array of 4 values, each 0-63
+      < x1 x2 x3 x4 >
+      Default = < 15 8 4 1 >
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 4
+    maxItems: 4
+    items:
+      minimum: 0
+      maximum: 63
+
+  cirrus,hs-bias-ramp-rate:
+    description: |
+      If present this sets the rate that the HS bias should rise and fall.
+      The actual rise and fall times depend on external hardware (the
+      datasheet gives several rise and fall time examples).
+
+      0 - Fast rise time; slow, load-dependent fall time
+      1 - Fast
+      2 - Slow (default)
+      3 - Slowest
+
+      The CS42L42_HSBIAS_RAMP_* defines are available for this.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 0
+    maximum: 3
+
+  cirrus,hs-bias-sense-disable:
+    description: |
+      If present the HSBIAS sense is disabled. Configures HSBIAS output
+      current sense through the external 2.21-k resistor. HSBIAS_SENSE
+      is a hardware feature to reduce the potential pop noise when the
+      headset plug is removed slowly. But on some platforms ESD voltage
+      will affect it causing plug detection to fail, especially with CTIA
+      headset type. For different hardware setups, a designer might want
+      to tweak default behavior.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - VP-supply
+  - VCP-supply
+  - VD_FILT-supply
+  - VL-supply
+  - VA-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/sound/cs42l42.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      cs42l42: cs42l42@48 {
+          compatible = "cirrus,cs42l42";
+          reg = <0x48>;
+          VA-supply = <&dummy_vreg>;
+          VP-supply = <&dummy_vreg>;
+          VCP-supply = <&dummy_vreg>;
+          VD_FILT-supply = <&dummy_vreg>;
+          VL-supply = <&dummy_vreg>;
+
+          reset-gpios = <&axi_gpio_0 1 0>;
+          interrupt-parent = <&gpio0>;
+          interrupts = <55 8>;
+
+          cirrus,ts-inv = <CS42L42_TS_INV_DIS>;
+          cirrus,ts-dbnc-rise = <CS42L42_TS_DBNCE_1000>;
+          cirrus,ts-dbnc-fall = <CS42L42_TS_DBNCE_0>;
+          cirrus,btn-det-init-dbnce = <100>;
+          cirrus,btn-det-event-dbnce = <10>;
+          cirrus,bias-lvls = <0x0F 0x08 0x04 0x01>;
+          cirrus,hs-bias-ramp-rate = <CS42L42_HSBIAS_RAMP_SLOW>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/sound/cs42l42.txt b/Documentation/devicetree/bindings/sound/cs42l42.txt
deleted file mode 100644
index 3b7705623980..000000000000
--- a/Documentation/devicetree/bindings/sound/cs42l42.txt
+++ /dev/null
@@ -1,115 +0,0 @@
-CS42L42 audio CODEC
-
-Required properties:
-
-  - compatible : "cirrus,cs42l42"
-
-  - reg : the I2C address of the device for I2C.
-
-  - VP-supply, VCP-supply, VD_FILT-supply, VL-supply, VA-supply :
-  power supplies for the device, as covered in
-  Documentation/devicetree/bindings/regulator/regulator.txt.
-
-Optional properties:
-
-  - reset-gpios : a GPIO spec for the reset pin. If specified, it will be
-  deasserted before communication to the codec starts.
-
-  - interrupts : IRQ line info CS42L42.
-  (See Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
-  for further information relating to interrupt properties)
-
-  - cirrus,ts-inv : Boolean property. Sets the behaviour of the jack plug
-  detect switch.
-
-  0 = (Default) Shorted to tip when unplugged, open when plugged.
-      This is "inverted tip sense (ITS)" in the datasheet.
-
-  1 = Open when unplugged, shorted to tip when plugged.
-      This is "normal tip sense (TS)" in the datasheet.
-
-  - cirrus,ts-dbnc-rise : Debounce the rising edge of TIP_SENSE_PLUG. With no
-  debounce, the tip sense pin might be noisy on a plug event.
-
-  0 - 0ms,
-  1 - 125ms,
-  2 - 250ms,
-  3 - 500ms,
-  4 - 750ms,
-  5 - (Default) 1s,
-  6 - 1.25s,
-  7 - 1.5s,
-
-  - cirrus,ts-dbnc-fall : Debounce the falling edge of TIP_SENSE_UNPLUG.
-  With no debounce, the tip sense pin might be noisy on an unplug event.
-
-  0 - 0ms,
-  1 - 125ms,
-  2 - 250ms,
-  3 - 500ms,
-  4 - 750ms,
-  5 - (Default) 1s,
-  6 - 1.25s,
-  7 - 1.5s,
-
-  - cirrus,btn-det-init-dbnce : This sets how long the driver sleeps after
-  enabling button detection interrupts. After auto-detection and before
-  servicing button interrupts, the HS bias needs time to settle. If you
-  don't wait, there is possibility for erroneous button interrupt.
-
-  0ms - 200ms,
-  Default = 100ms
-
-  - cirrus,btn-det-event-dbnce : This sets how long the driver delays after
-  receiving a button press interrupt. With level detect interrupts, you want
-  to wait a small amount of time to make sure the button press is making a
-  clean connection with the bias resistors.
-
-  0ms - 20ms,
-  Default = 10ms
-
-  - cirrus,bias-lvls : For a level-detect headset button scheme, each button
-  will bias the mic pin to a certain voltage. To determine which button was
-  pressed, the driver will compare this biased voltage to sequential,
-  decreasing voltages and will stop when a comparator is tripped,
-  indicating a comparator voltage < bias voltage. This value represents a
-  percentage of the internally generated HS bias voltage. For different
-  hardware setups, a designer might want to tweak this. This is an array of
-  descending values for the comparator voltage.
-
-  Array of 4 values
-  Each 0-63
-  < x1 x2 x3 x4 >
-  Default = < 15 8 4 1>
-
-  - cirrus,hs-bias-sense-disable: This is boolean property. If present the
-  HSBIAS sense is disabled. Configures HSBIAS output current sense through
-  the external 2.21-k resistor. HSBIAS_SENSE is hardware feature to reduce
-  the potential pop noise during the headset plug out slowly. But on some
-  platforms ESD voltage will affect it causing test to fail, especially
-  with CTIA headset type. For different hardware setups, a designer might
-  want to tweak default behavior.
-
-Example:
-
-cs42l42: cs42l42@48 {
-	compatible = "cirrus,cs42l42";
-	reg = <0x48>;
-	VA-supply = <&dummy_vreg>;
-	VP-supply = <&dummy_vreg>;
-	VCP-supply = <&dummy_vreg>;
-	VD_FILT-supply = <&dummy_vreg>;
-	VL-supply = <&dummy_vreg>;
-
-	reset-gpios = <&axi_gpio_0 1 0>;
-	interrupt-parent = <&gpio0>;
-	interrupts = <55 8>
-
-	cirrus,ts-inv = <0x00>;
-	cirrus,ts-dbnc-rise = <0x05>;
-	cirrus,ts-dbnc-fall = <0x00>;
-	cirrus,btn-det-init-dbnce = <100>;
-	cirrus,btn-det-event-dbnce = <10>;
-	cirrus,bias-lvls = <0x0F 0x08 0x04 0x01>;
-	cirrus,hs-bias-ramp-rate = <0x02>;
-};
diff --git a/MAINTAINERS b/MAINTAINERS
index 6fc811cd86e9..38555c7f0ce4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4449,6 +4449,7 @@ M:	David Rhodes <david.rhodes@cirrus.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 L:	patches@opensource.cirrus.com
 S:	Maintained
+F:	Documentation/devicetree/bindings/sound/cirrus,cs*
 F:	sound/soc/codecs/cs*
 
 CIRRUS LOGIC DSP FIRMWARE DRIVER
-- 
2.11.0

