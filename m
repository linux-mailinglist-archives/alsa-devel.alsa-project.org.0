Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 407FD3F2734
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Aug 2021 09:04:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D324B169C;
	Fri, 20 Aug 2021 09:03:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D324B169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629443089;
	bh=tRSHPUbVmpLKNh3OA9sq5QPTYiD0X6XsWQStXc2Z0Mg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B0H0ApJrnHs6K+XDRn2azvqwZQemtMoPMnXWQnWLLXoy3c4BPlmM+/KNWMMXzTTVX
	 NZCAoxwz9t2s7PD1X51XZM4i0PZRj4Io69Ydwi/aDf98Uy20CzGOlTtiJ3WX7cHWuX
	 EG99meyGTWLSvYmrLCc88ILVArXECcjhetXntI0U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55E72F804EC;
	Fri, 20 Aug 2021 09:02:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B5AAF80111; Tue, 17 Aug 2021 12:12:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B7B2F80134
 for <alsa-devel@alsa-project.org>; Tue, 17 Aug 2021 12:12:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B7B2F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ERgDuTUB"
Received: by mail-ed1-x531.google.com with SMTP id cn28so18939032edb.6
 for <alsa-devel@alsa-project.org>; Tue, 17 Aug 2021 03:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NAZ3iHRhwDa0VlHkXe1bEIQ5yvY78DPN6f7/EwPF9pU=;
 b=ERgDuTUBHyA06UX4V6nQdVQ1RRdLdu5ViHA9SN3iAOnoJ5TxnKpVdkMqSihOCl6YOp
 drNLp8Qi1wwNoVXQDPtaCJfXgOCbJt3j8W8kgF9oYNjrfQkgLaHt+pFQKFGsHhBcyLUX
 +I+6ZKBd5xU+2k1v7OlD7pmbrSqUMpmIlSEnN8Wwh3PwAVCFULw5gywPjZLppu8WA7MC
 7XFh+TFhOyjqtYy9hBSW8y5xtqA5/HOHJ0TkeQbj+Th3z/Vdq0sjaCqrGaCr2TSJgVB5
 w684guCIgpwXdTTbpGb7PKj95Q74WEiY6i35HAuloDdkbQh5+f0PdU270Qv8+sI09sHp
 wy0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NAZ3iHRhwDa0VlHkXe1bEIQ5yvY78DPN6f7/EwPF9pU=;
 b=s9Nx1oTIbeizeuPWENOHggtxkyjvSdTLpA5HS+guiapStiq86w5a+xStmqhbsQ+IIt
 O7za8E+TVZZTsxoDVFxCyu7fsxeDuVHFVLC0aVt4+2PvpH87qM6XKishUepxFYiD75Gj
 8oqePGKe1JLYFbiK8zC3M4pLBw3QJfadvsD4GnbvT8Fs7EHIlmd4qxwdsXxIG2tRChHa
 TKLZBVtuI0e3NACWn2VHd9XIusnnQOqFnCx9k8OiDizg5IMx1X27TBpy3tB2mPt9X/TD
 c3/RV9ZAhZqqww/lMWw1tssESzWDrR4DqijDEm1TZhVbOtb+3JjV6oVqJ/GnDavm5CYB
 JP+Q==
X-Gm-Message-State: AOAM531MIun2qA+GIGediLiZ2ykhOPFge5p5QmsH08LD9Cl6lK4qF+0W
 pW9ax4c1psoyHikzCy8d3dU=
X-Google-Smtp-Source: ABdhPJxYz8f+mVFJRA/q2G+Cscc5uGswKuR6xxueeR30RVFhGSloF2s+aA6GlfdsmJfDhSZfrhgzeA==
X-Received: by 2002:a05:6402:b7a:: with SMTP id
 cb26mr3297856edb.33.1629195151747; 
 Tue, 17 Aug 2021 03:12:31 -0700 (PDT)
Received: from localhost.localdomain ([185.213.155.232])
 by smtp.gmail.com with ESMTPSA id m6sm822920edq.22.2021.08.17.03.12.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 03:12:31 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Subject: [PATCH 2/4] dt-bindings: sound: add rockchip i2s-tdm binding
Date: Tue, 17 Aug 2021 12:11:17 +0200
Message-Id: <20210817101119.423853-3-frattaroli.nicolas@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817101119.423853-1-frattaroli.nicolas@gmail.com>
References: <20210817101119.423853-1-frattaroli.nicolas@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 20 Aug 2021 09:02:12 +0200
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
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
 .../bindings/sound/rockchip,i2s-tdm.yaml      | 221 ++++++++++++++++++
 include/dt-bindings/sound/rockchip,i2s-tdm.h  |   9 +
 2 files changed, 230 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
 create mode 100644 include/dt-bindings/sound/rockchip,i2s-tdm.h

diff --git a/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml b/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
new file mode 100644
index 000000000000..c3022620b47f
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml
@@ -0,0 +1,221 @@
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
+    oneOf:
+      - const: rx
+      - items:
+          - const: tx
+          - const: rx
+
+  clocks:
+    items:
+      - description: clock for TX
+      - description: clock for RX
+      - description: clock for I2S bus
+
+  clock-names:
+    items:
+      - const: mclk_tx
+      - const: mclk_rx
+      - const: hclk
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
+      Required if both playback and capture are used, i.e. if rockchip,clk-trcm
+      is 0.
+
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of the syscon node for the GRF register.
+
+  rockchip,mclk-calibrate:
+    description:
+      Enable mclk source calibration.
+    type: boolean
+
+  rockchip,trcm-sync:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Which lrck/bclk clocks each direction will sync to. You should use the
+      constants in <dt-bindings/sound/rockchip,i2s-tdm.h>
+    oneOf:
+      - const: 0
+        description:
+          RK_TRCM_TXRX. Use both the TX and the RX clock for TX and RX.
+      - const: 1
+        description:
+          RK_TRCM_TX. Use only the TX clock for TX and RX.
+      - const: 2
+        description:
+          RK_TRCM_RX. Use only the RX clock for TX and RX.
+
+  "#sound-dai-cells":
+    const: 0
+
+  rockchip,no-dmaengine:
+    description:
+      If present, driver will not register a pcm dmaengine, only the dai.
+      If the dai is part of multi-dais, the property should be present.
+    type: boolean
+
+  rockchip,playback-only:
+    description: Specify that the controller only has playback capability.
+    type: boolean
+
+  rockchip,capture-only:
+    description: Specify that the controller only has capture capability.
+    type: boolean
+
+  rockchip,i2s-rx-route:
+    $ref: /schemas/types.yaml#/definitions/uint32
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
+    $ref: /schemas/types.yaml#/definitions/uint32
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
+  - rockchip,trcm-sync
+
+allOf:
+  - if:
+      properties:
+        rockchip,clk-trcm:
+          contains:
+            enum: [0]
+    then:
+      required:
+        - rockchip,cru
+
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/rk3568-cru.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/pinctrl/rockchip.h>
+    #include <dt-bindings/sound/rockchip,i2s-tdm.h>
+
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
+            dmas = <&dmac1 2>, <&dmac1 3>;
+            dma-names = "tx", "rx";
+            resets = <&cru SRST_M_I2S1_8CH_TX>, <&cru SRST_M_I2S1_8CH_RX>;
+            reset-names = "tx-m", "rx-m";
+            rockchip,trcm-sync = <RK_TRCM_TX>;
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
+            status = "disabled";
+        };
+    };
diff --git a/include/dt-bindings/sound/rockchip,i2s-tdm.h b/include/dt-bindings/sound/rockchip,i2s-tdm.h
new file mode 100644
index 000000000000..32494d64cf33
--- /dev/null
+++ b/include/dt-bindings/sound/rockchip,i2s-tdm.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _DT_BINDINGS_ROCKCHIP_I2S_TDM_H
+#define _DT_BINDINGS_ROCKCHIP_I2S_TDM_H
+
+#define RK_TRCM_TXRX 0
+#define RK_TRCM_TX 1
+#define RK_TRCM_RX 2
+
+#endif /* _DT_BINDINGS_ROCKCHIP_I2S_TDM_H */
-- 
2.32.0

