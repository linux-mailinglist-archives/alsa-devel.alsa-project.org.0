Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2677E3FA62F
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Aug 2021 16:04:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5AFE1707;
	Sat, 28 Aug 2021 16:03:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5AFE1707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630159458;
	bh=zxp4ub2TI4T1UZ56E2T4+ZpQFvZxxvYVfCIeYaCQDSo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VDM2CKKrr3fIiTXmpKpC06XvJeBuyq+203PKMTInou81PzJjDfAA82b7HCHF4N/qO
	 gIDYN7JcDiWKibtDTczVNKtPY+vggdvzl1gLf82SLwBFHZm97IL9o6Q9lQSmve8JPK
	 zkznM9Gk08ReGUfUpCkixhGcrAT3pcd9r3oQnhaw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65DC5F804D6;
	Sat, 28 Aug 2021 16:02:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D09ABF804E6; Sat, 28 Aug 2021 16:02:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 027B8F804D6
 for <alsa-devel@alsa-project.org>; Sat, 28 Aug 2021 16:02:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 027B8F804D6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LiBbEEI4"
Received: by mail-ed1-x534.google.com with SMTP id s25so14350729edw.0
 for <alsa-devel@alsa-project.org>; Sat, 28 Aug 2021 07:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/HwvasmqWTeaBN7HIdpoZgoqAcwnUTfnLYi+w6FCWyc=;
 b=LiBbEEI49LqvFweuIGCWs+mxPZLxlpGk4gcL0Lt0mj4+xLGCzNBhqO90Mn2sp8O8dE
 B3562wA0y0ddaoqc7nLkEVE3g0xTz144MhYgfApp6QIJf9Nm8rjEe75W1YsFgNoOfhKm
 ti85tkUk6+1C6ADu1F19urVsrUm11rV6B0gXy54XtW5MSnsgXaXPVaycRMv+WO4hU4I7
 d3UzCpcKbYZ3jXiMWUlzijoA7r0UYOki8CVX+4VOqZnBRwlPvYoSvUksNCejfVvavAKP
 +XpdeTSSPXDOZxJ59kvNoUSWsh/SfKemLX0VixN10GKYzhitxU+jbXlWvPrYo5B2pX73
 hZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/HwvasmqWTeaBN7HIdpoZgoqAcwnUTfnLYi+w6FCWyc=;
 b=W1962qa2e1Z3d5r64eKFODs1Hr7qpwDB1z62bCsMHKVBdtjZGfq1XhO0JON/Lgpnha
 /r2SJEiSYrHcy896n/2HebQmkBYOtTX2c7csjxP/+UTG1bylIstVGIVV2pE5YJ3jGJHK
 fdUfILc7uDpjuTmrLGb4PEcwixjaLUZJFHOfN44Pluh950RfjHeuhSTqLHi66Unv2Apm
 3dUHNKEUXZRRYpbsB5Kd7stOBGfDpaGRUh3eSPOa7ozmCy8hEkozyGygGxKVghUjLtX6
 gihIffs1dOy+zx+JoggF/de33aVzzuYCaL4tD6geamGwrsdt7OfFhwfbdI6moQB2V6uq
 RA2w==
X-Gm-Message-State: AOAM530/9YRqHSgQByCzQqdEmKotCDq4w2XkO7U8dcGXIWV5JPYzBtbC
 fxNY55/JdMyqZ9ejg3mbKZH688YGLozEEXzs
X-Google-Smtp-Source: ABdhPJzH3S+Y3NHfuXZM5Ir87DyKg2zfCCWNg5KaxMNUIgRuMqbXx3RlYDhall/te3ioSxFZCUUVSQ==
X-Received: by 2002:a50:eb95:: with SMTP id y21mr3138318edr.139.1630159352639; 
 Sat, 28 Aug 2021 07:02:32 -0700 (PDT)
Received: from localhost.localdomain (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84])
 by smtp.gmail.com with ESMTPSA id cn16sm4953982edb.87.2021.08.28.07.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Aug 2021 07:02:32 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v3 2/4] dt-bindings: sound: add rockchip i2s-tdm binding
Date: Sat, 28 Aug 2021 16:02:02 +0200
Message-Id: <20210828140205.21973-3-frattaroli.nicolas@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210828140205.21973-1-frattaroli.nicolas@gmail.com>
References: <20210828140205.21973-1-frattaroli.nicolas@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
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

This adds the YAML bindings for the Rockchip I2S/TDM audio driver.

Signed-off-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
---
 .../bindings/sound/rockchip,i2s-tdm.yaml      | 218 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 219 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml

diff --git a/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml b/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
new file mode 100644
index 000000000000..ab8731779805
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
@@ -0,0 +1,218 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/rockchip,i2s-tdm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip I2S/TDM Controller
+
+description:
+  The Rockchip I2S/TDM Controller is a Time Division Multiplexed
+  audio interface found in various Rockchip SoCs, allowing up
+  to 8 channels of audio over a serial interface.
+
+maintainers:
+  - Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - rockchip,px30-i2s-tdm
+      - rockchip,rk1808-i2s-tdm
+      - rockchip,rk3308-i2s-tdm
+      - rockchip,rk3568-i2s-tdm
+      - rockchip,rv1126-i2s-tdm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  dmas:
+    minItems: 1
+    maxItems: 2
+
+  dma-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      enum:
+        - rx
+        - tx
+
+  clocks:
+    minItems: 3
+    items:
+      - description: clock for TX
+      - description: clock for RX
+      - description: AHB clock driving the interface
+      - description:
+          Parent clock for mclk_tx (only required when using mclk-calibrate)
+      - description:
+          Parent clock for mclk_rx (only required when using mclk-calibrate)
+      - description:
+          Clock for sample rates that are an integer multiple of 8000
+          (only required when using mclk-calibrate)
+      - description:
+          Clock for sample rates that are an integer multiple of 11025
+          (only required when using mclk-calibrate)
+
+  clock-names:
+    minItems: 3
+    items:
+      - const: mclk_tx
+      - const: mclk_rx
+      - const: hclk
+      - const: mclk_tx_src
+      - const: mclk_rx_src
+      - const: mclk_root0
+      - const: mclk_root1
+
+  rockchip,frame-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 64
+    minimum: 32
+    maximum: 512
+    description:
+      Width of a frame, usually slot width multiplied by number of slots.
+      Must be even.
+
+  resets:
+    items:
+      - description: reset for TX
+      - description: reset for RX
+
+  reset-names:
+    items:
+      - const: tx-m
+      - const: rx-m
+
+  rockchip,cru:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of the cru.
+      Required if neither trcm-sync-tx-only nor trcm-sync-rx-only are specified.
+
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of the syscon node for the GRF register.
+
+  rockchip,mclk-calibrate:
+    description:
+      Switch between two root clocks depending on the audio sample rate.
+      For integer multiples of 8000 (e.g. 48000 Hz), mclk_root0 is used.
+      For integer multiples of 11025 (e.g. 44100 Hz), mclk_root1 is used.
+    type: boolean
+
+  rockchip,trcm-sync-tx-only:
+    type: boolean
+    description: Use TX BCLK/LRCK for both TX and RX.
+
+  rockchip,trcm-sync-rx-only:
+    type: boolean
+    description: Use RX BCLK/LRCK for both TX and RX.
+
+  "#sound-dai-cells":
+    const: 0
+
+  rockchip,i2s-rx-route:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Defines the mapping of I2S RX sdis to I2S data bus lines.
+      By default, they are mapped one-to-one.
+    items:
+      - description: which sdi to connect to data line 0
+      - description: which sdi to connect to data line 1
+      - description: which sdi to connect to data line 2
+      - description: which sdi to connect to data line 3
+
+  rockchip,i2s-tx-route:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description:
+      Defines the mapping of I2S TX sdos to I2S data bus lines.
+      By default, they are mapped one-to-one.
+    items:
+      - description: which sdo to connect to data line 0
+      - description: which sdo to connect to data line 1
+      - description: which sdo to connect to data line 2
+      - description: which sdo to connect to data line 3
+
+  rockchip,tdm-fsync-half-frame:
+    description: Whether to use half frame fsync.
+    type: boolean
+
+  rockchip,io-multiplex:
+    description:
+      Specify that the GPIO lines on the I2S bus are multiplexed such that
+      the direction (input/output) needs to be dynamically adjusted.
+    type: boolean
+
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - dmas
+  - dma-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - rockchip,grf
+  - "#sound-dai-cells"
+
+allOf:
+  - if:
+      properties:
+        rockchip,trcm-sync-tx-only: false
+        rockchip,trcm-sync-rx-only: false
+    then:
+      required:
+        - rockchip,cru
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3568-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/pinctrl/rockchip.h>
+
+    foo {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        i2s@fe410000 {
+            compatible = "rockchip,rk3568-i2s-tdm";
+            reg = <0x0 0xfe410000 0x0 0x1000>;
+            interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&cru MCLK_I2S1_8CH_TX>, <&cru MCLK_I2S1_8CH_RX>,
+                     <&cru HCLK_I2S1_8CH>;
+            clock-names = "mclk_tx", "mclk_rx", "hclk";
+            dmas = <&dmac1 3>, <&dmac1 2>;
+            dma-names = "rx", "tx";
+            resets = <&cru SRST_M_I2S1_8CH_TX>, <&cru SRST_M_I2S1_8CH_RX>;
+            reset-names = "tx-m", "rx-m";
+            rockchip,trcm-sync-tx-only;
+            rockchip,cru = <&cru>;
+            rockchip,grf = <&grf>;
+            #sound-dai-cells = <0>;
+            pinctrl-names = "default";
+            pinctrl-0 =
+                <&i2s1m0_sclktx
+                &i2s1m0_sclkrx
+                &i2s1m0_lrcktx
+                &i2s1m0_lrckrx
+                &i2s1m0_sdi0
+                &i2s1m0_sdi1
+                &i2s1m0_sdi2
+                &i2s1m0_sdi3
+                &i2s1m0_sdo0
+                &i2s1m0_sdo1
+                &i2s1m0_sdo2
+                &i2s1m0_sdo3>;
+            status = "okay";
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 5d459d42672c..d2be16a85009 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16053,6 +16053,7 @@ ROCKCHIP I2S TDM DRIVER
 M:	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
 L:	linux-rockchip@lists.infradead.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
 F:	sound/soc/rockchip/rockchip_i2s_tdm.*
 
 ROCKCHIP ISP V1 DRIVER
-- 
2.33.0

