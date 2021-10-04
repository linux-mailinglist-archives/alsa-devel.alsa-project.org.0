Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C18420822
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 11:19:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 166D41690;
	Mon,  4 Oct 2021 11:18:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 166D41690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633339161;
	bh=9tMvN49zPrT57IbYM90FjShLs1oeSPurf4ljUwYBb9c=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Hsh/g8e5C0VBbR4vTuSbT4XGESmR5bJCXUsojRbshEFbEgsYtpjU/bdQaelmRfQVp
	 YS52QWL5L0/YqxjSWfIru9WvSYxLEWw4IqgDEGh+hsOeuApEyYnn+4jIU9aFmIjK5e
	 4wMYBnUO2wYY7naprMjlYQS4Za3iNhZQpCuNjhXo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F1DBF80249;
	Mon,  4 Oct 2021 11:18:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36CFDF80240; Mon,  4 Oct 2021 11:18:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DD33F800BA
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 11:17:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DD33F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="bVrHGOIb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1633339076;
 x=1664875076;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=0Wu4i744/6iXHTLuDoXswWcc9XOBTNKv8Lp6XIYdjzY=;
 b=bVrHGOIb70DRXKQA+BrcUq+4ZD2tWejCkvrVHkhS9SbCprcSpNBxcki+
 4eGBGeg6zyaIYeo0gvb8LhU+k22148MXASWMtwMe0avKz2mznMHfKVEKC
 RrLvnJIZLkco+dF6C+3NOujjA1Mi3uqU6dL1drrGhS9CBz1vTNtL1gajw
 a1w2fD6/jl4LSNa4Z8SJF2JbMBW0r/BsyhSJbUiFoMZF/Alk8Kxakv3Wa
 usRrfXNwymgJP+QhByPBPTW7U+XI9bxxp+Wa3EBNjEAi+Hjg/b0r5+gJg
 /C+xG1nZNBpcv4vJ/Xz/esmW+RtzAOpHvcnJsWYrg3d60Fo0LItAmhPcS A==;
Date: Mon, 4 Oct 2021 11:17:47 +0200
From: Ricard Wanderlof <ricardw@axis.com>
X-X-Sender: ricardw@lnxricardw1.se.axis.com
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>
Subject: [PATCH 1/2] dt-bindings: sound: tlv320adc3xxx: New codec driver
Message-ID: <alpine.DEB.2.21.2110041115070.14472@lnxricardw1.se.axis.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail04w.axis.com (10.20.40.10) To se-mail07w.axis.com
 (10.20.40.13)
Cc: devicetree@vger.kernel.org, alsa-devel <alsa-devel@alsa-project.org>
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


DT bindings for tlv320adc3xxx driver, currently supporting
Texas Instruments TLV320ADC3001 and TLV320ADC3101 audio ADCs.

Signed-off-by: Ricard Wanderlof <ricardw@axis.com>
---
 .../bindings/sound/ti,tlv320adc3xxx.yaml      | 126 ++++++++++++++++++
 include/dt-bindings/sound/tlv320adc3xxx.h     |  33 +++++
 2 files changed, 159 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tlv320adc3xxx.yaml
 create mode 100644 include/dt-bindings/sound/tlv320adc3xxx.h

diff --git a/Documentation/devicetree/bindings/sound/ti,tlv320adc3xxx.yaml b/Documentation/devicetree/bindings/sound/ti,tlv320adc3xxx.yaml
new file mode 100644
index 000000000000..4720eac65177
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,tlv320adc3xxx.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,tlv320adc3xxx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments TLV320ADC3001/TLV320ADC3101 Stereo ADC
+
+maintainers:
+  - Ricard Wanderlof <ricardw@axis.com>
+
+description: |
+  Texas Instruments TLV320ADC3001 and TLV320ADC3101 Stereo ADC
+  https://www.ti.com/product/TLV320ADC3001
+  https://www.ti.com/product/TLV320ADC3101
+
+properties:
+  compatible:
+    enum:
+      - ti,tlv320adc3001
+      - ti,tlv320adc3101
+
+  reg:
+    maxItems: 1
+    description: I2C address
+
+  "#sound-dai-cells":
+    const: 0
+
+  gpios:
+    maxItems: 1
+    description: GPIO pin used for codec reset (RESET pin)
+
+  clocks:
+    maxItems: 1
+    description: Master clock (MCLK)
+
+  ti,pll-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0 # ADC3XXX_PLL_DONT_SET - leave mode unchanged
+      - 1 # ADC3XXX_PLL_ENABLE - use the on-chip PLL
+      - 2 # ADC3XXX_PLL_BYPASS - do not use the on-chip PLL
+      - 3 # ADC3XXX_PLL_AUTO - use on-chip PLL if possible
+    default: 0
+    description: |
+      Set on-chip PLL mode.
+      ADC3XXX_PLL_DONT_SET is intended for use when setting the clock mod
+      via the clock id in a machine driver and it is not to be changed
+      from the previous setting.
+      ADC3XXX_PLL_AUTO will enable  on-chip PLL if possible, depending on the
+      master clock and sample rate combination.
+
+  ti,dmdin-gpio1:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0 # ADC3XXX_GPIO_DISABLED       - I/O buffers powered down and not used
+      - 1 # ADC3XXX_GPIO_INPUT          - Various non-GPIO input functions
+      - 2 # ADC3XXX_GPIO_GPI            - General purpose input
+      - 3 # ADC3XXX_GPIO_GPO            - General purpose output
+      - 4 # ADC3XXX_GPIO_CLKOUT         - Clock source set in CLKOUT_MUX reg
+      - 5 # ADC3XXX_GPIO_INT1           - INT1 output
+      - 6 # ADC3XXX_GPIO_SECONDARY_BCLK - Codec interface secondary BCLK
+      - 7 # ADC3XXX_GPIO_SECONDARY_WCLK - Codec interface secondary WCLK
+    default: 0
+    description: |
+      Configuration for DMDIN/GPIO1 pin.
+
+      When ADC3XXX_GPIO_GPO is configured, this causes corresponding the
+      ALSA control "GPIOx Output" to appear, as a switch control.
+
+      Note that there is currently no support for reading the GPIO pins as
+      inputs.
+
+  ti,dmclk-gpio2:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0 # ADC3XXX_GPIO_DISABLED       - I/O buffers powered down and not used
+      - 1 # ADC3XXX_GPIO_INPUT          - Various non-GPIO input functions
+      - 2 # ADC3XXX_GPIO_GPI            - General purpose input
+      - 3 # ADC3XXX_GPIO_GPO            - General purpose output
+      - 4 # ADC3XXX_GPIO_CLKOUT         - Clock source set in CLKOUT_MUX reg
+      - 5 # ADC3XXX_GPIO_INT1           - INT1 output
+      - 6 # ADC3XXX_GPIO_SECONDARY_BCLK - Codec interface secondary BCLK
+      - 7 # ADC3XXX_GPIO_SECONDARY_WCLK - Codec interface secondary WCLK
+    default: 0
+    description: |
+      Configuration for DMCLK/GPIO2 pin.
+
+      When ADC3XXX_GPIO_GPO is configured, this causes corresponding the
+      ALSA control "GPIOx Output" to appear, as a switch control.
+
+      Note that there is currently no support for reading the GPIO pins as
+      inputs.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/sound/tlv320adc3xxx.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        tlv320adc3101: tlv320adc3101@18 {
+            compatible = "ti,tlv320adc3101";
+            reg = <0x18>;
+            gpios = <&gpio_pc 3 GPIO_ACTIVE_LOW>;
+            clocks = <&audio_mclk>;
+            ti,pll-mode = <ADC3XXX_PLL_BYPASS>;
+            ti,dmdin-gpio1 = <ADC3XXX_GPIO_GPO>;
+        };
+    };
+
+    audio_mclk: clock {
+        compatible = "fixed-clock";
+        #clock-cells = <0>;
+        clock-frequency = <24576000>;
+    };
+...
diff --git a/include/dt-bindings/sound/tlv320adc3xxx.h b/include/dt-bindings/sound/tlv320adc3xxx.h
new file mode 100644
index 000000000000..8d488a6c3186
--- /dev/null
+++ b/include/dt-bindings/sound/tlv320adc3xxx.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __DT_TLV320ADC3XXX_H
+#define __DT_TLV320ADC3XXX_H
+
+/* PLL modes, derived from clk_id of set_sysclk callback, or set in
+ * devicetree using the ti,pll-mode property.
+ *
+ * The default behavior is to take the first matching entry in the clock
+ * table, which is intended to be the PLL based one if there is more than one.
+ *
+ * Setting the clock source using simple-card (clocks or
+ * system-clock-frequency property) sets clk_id = 0 = ADC3XXX_CLK_DONT_SET,
+ * which doesn't change whatever clock setting was previously set up.
+ */
+#define ADC3XXX_PLL_DONT_SET	0 /* Don't change mode */
+#define ADC3XXX_PLL_ENABLE	1 /* Use PLL for clock generation */
+#define ADC3XXX_PLL_BYPASS	2 /* Don't use PLL for clock generation */
+#define ADC3XXX_PLL_AUTO	3 /* Use first available mode */
+
+#define ADC3XXX_GPIO_DISABLED		0 /* I/O buffers powered down */
+#define ADC3XXX_GPIO_INPUT		1 /* Various non-GPIO inputs */
+#define ADC3XXX_GPIO_GPI		2 /* General purpose input */
+#define ADC3XXX_GPIO_GPO		3 /* General purpose output */
+#define ADC3XXX_GPIO_CLKOUT		4 /* Source set in reg. CLKOUT_MUX */
+#define ADC3XXX_GPIO_INT1		5 /* INT1 output */
+#define ADC3XXX_GPIO_INT2		6 /* INT2 output */
+/* value 7 is reserved */
+#define ADC3XXX_GPIO_SECONDARY_BCLK	8 /* Codec interface secondary BCLK */
+#define ADC3XXX_GPIO_SECONDARY_WCLK	9 /* Codec interface secondary WCLK */
+#define ADC3XXX_GPIO_ADC_MOD_CLK	10 /* Clock output for digital mics */
+/* values 11-15 reserved */
+
+#endif /* __DT_TLV320ADC3XXX_H */
-- 
2.20.1


-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
