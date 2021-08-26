Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFEB3F89E2
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Aug 2021 16:15:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52B3116B4;
	Thu, 26 Aug 2021 16:14:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52B3116B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629987301;
	bh=18FrmFiXu/c/rjH9frcMy7N0n/uvEasDK0UqAAiIkDY=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=j6x7ffttO4Z2VS1A8tE5MXDoE2NwG/qPTWyi5z8se5NjwxLz1YxxZleILbziZu4SU
	 nXq/uKPeGaVwNRsWJSXf4P9/jg4zWxkknGOTmYigXXs95h4wPmwQhq5pO7fB0LGfYk
	 8grhVh/QHdcfmqGN5Ur14OMv2bH3zOK6hlPInTH8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1855F800FD;
	Thu, 26 Aug 2021 16:13:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A763BF801D8; Thu, 26 Aug 2021 16:13:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66FBBF80054
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 16:13:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66FBBF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="CsGke3pT"
Received: by mail-yb1-xb49.google.com with SMTP id
 b9-20020a5b07890000b0290558245b7eabso101553ybq.10
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 07:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=nm+oiHEoErhLfJkTgcszJpOfbpflkR0r1rY3Z0g5QV0=;
 b=CsGke3pT3fJP6JLQT+9VD+YgQExAPN4tlPZTSDIwom9RNnEjrP8ZgfHyk96mjzc1pa
 zSuj/5PAt0BwQIuVIrOoitm9EyZ6R7UP4a2lrQhtoW57Tear0WpfAtTOsX/RZadnyy8z
 WsORYtgLCbJ/QEwdxlMdfaK4iQc1MpIWbasm+v//tvB4pY1UvYFYgGXOSuan2uzqbF3m
 j+b0vIETiJZt0U+KpnhunkofN20OwfH+wBMye8XnWbSk6DcrbSko15CtLbTc8xodrryQ
 1VcZdvbavRM/j4VuwhuU5fPwdIvUq/4wp3M6jgTlF1RHS64y5+/Vd7C346nZ5G3fnCOY
 HZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=nm+oiHEoErhLfJkTgcszJpOfbpflkR0r1rY3Z0g5QV0=;
 b=PpaLHBoJqAO1+zZVPOlCdagDFF2lb0f2iTsN1pxkWA4OsSVlJyL8ifC2OezsjLrfYX
 c/8g5I4caMnyglAZIuBDTX+3shGhlz1A/g0Td44aCP8lceXJMJibitdDOekTmGAXuhMz
 Ne9uVYAzMETSACxTFpMUHJnNMfmfQybhkDkGiV/iu5qTra8do5lpiCqvxzoiQsPrnpzv
 fObZoMXO6gOqM+X5IifC8r199bYFq3BkeqiXr3fg3ENqUenAHZhq9VfEYTTlh9bn683w
 n2KDD7MkviF9v/X29mEpL/myQTQDqPXZ3NGBgrs4b24Gtp3T/9m7eO5lkOZqNjnPgjWV
 Aipg==
X-Gm-Message-State: AOAM531FmJQkLzdh7KCzSnc7M8ujmDn1nlciIdhn2GUVdowCAJCK70S7
 4uj1YsmYGkwfNrVXyR4bnYnhbHug4DhE
X-Google-Smtp-Source: ABdhPJyyldb60iXwXIUmLQ2NRoZGUEHnOlHcar0/lCfrUXEuWf+dZk4mQi7FUgmLBrmg7kr5Fef/Yjg8/K4s
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:2061:3627:c077:944c])
 (user=tzungbi job=sendgmr) by 2002:a25:4f55:: with SMTP id
 d82mr5579894ybb.365.1629987206815; Thu, 26 Aug 2021 07:13:26 -0700 (PDT)
Date: Thu, 26 Aug 2021 22:13:14 +0800
Message-Id: <20210826141314.3720975-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.rc2.250.ged5fa647cd-goog
Subject: [PATCH] ASoC: dt-bindings: mediatek: mt8192: re-add audio afe document
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, jiaxin.yu@mediatek.com,
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

The document was removed temporarily by commit 7d94ca3c8acd ("ASoC:
mt8192: revert add audio afe document") because the dependency
was not merged at that time.

The dependency has merged.  Re-adds back the document.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---

More context:
- [1] reported `dt_binding_check` was broken.
- [2] reverted.
- The dependency has merged in [3] and it can be found from linux-next.

[1]: https://patchwork.kernel.org/project/alsa-devel/patch/1604390378-23993-8-git-send-email-jiaxin.yu@mediatek.com/#23736701
[2]: https://patchwork.kernel.org/project/alsa-devel/patch/1605081920-11848-1-git-send-email-jiaxin.yu@mediatek.com/
[3]: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?h=clk-next&id=f35f1a23e0e12e3173e9e9dedbc150d139027189

 .../bindings/sound/mt8192-afe-pcm.yaml        | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml

diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
new file mode 100644
index 000000000000..0170c93802d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek AFE PCM controller for mt8192
+
+maintainers:
+   - Jiaxin Yu <jiaxin.yu@mediatek.com>
+   - Shane Chien <shane.chien@mediatek.com>
+
+properties:
+  compatible:
+      const: mediatek,mt8192-audio
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: audiosys
+
+  mediatek,apmixedsys:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description: The phandle of the mediatek apmixedsys controller
+
+  mediatek,infracfg:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description: The phandle of the mediatek infracfg controller
+
+  mediatek,topckgen:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description: The phandle of the mediatek topckgen controller
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: AFE clock
+      - description: ADDA DAC clock
+      - description: ADDA DAC pre-distortion clock
+      - description: audio infra sys clock
+      - description: audio infra 26M clock
+
+  clock-names:
+    items:
+      - const: aud_afe_clk
+      - const: aud_dac_clk
+      - const: aud_dac_predis_clk
+      - const: aud_infra_clk
+      - const: aud_infra_26m_clk
+
+required:
+  - compatible
+  - interrupts
+  - resets
+  - reset-names
+  - mediatek,apmixedsys
+  - mediatek,infracfg
+  - mediatek,topckgen
+  - power-domains
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8192-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mt8192-power.h>
+    #include <dt-bindings/reset-controller/mt8192-resets.h>
+
+    afe: mt8192-afe-pcm {
+        compatible = "mediatek,mt8192-audio";
+        interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
+        resets = <&watchdog MT8192_TOPRGU_AUDIO_SW_RST>;
+        reset-names = "audiosys";
+        mediatek,apmixedsys = <&apmixedsys>;
+        mediatek,infracfg = <&infracfg>;
+        mediatek,topckgen = <&topckgen>;
+        power-domains = <&scpsys MT8192_POWER_DOMAIN_AUDIO>;
+        clocks = <&audsys CLK_AUD_AFE>,
+                 <&audsys CLK_AUD_DAC>,
+                 <&audsys CLK_AUD_DAC_PREDIS>,
+                 <&infracfg CLK_INFRA_AUDIO>,
+                 <&infracfg CLK_INFRA_AUDIO_26M_B>;
+        clock-names = "aud_afe_clk",
+                      "aud_dac_clk",
+                      "aud_dac_predis_clk",
+                      "aud_infra_clk",
+                      "aud_infra_26m_clk";
+    };
+
+...
-- 
2.33.0.rc2.250.ged5fa647cd-goog

