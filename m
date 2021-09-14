Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA82D40AA67
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Sep 2021 11:13:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D346717A6;
	Tue, 14 Sep 2021 11:12:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D346717A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631610813;
	bh=7JP8kqSCH6c1uIhR/ixbmGD+BCr+igr9n92aRObkOWs=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GDEj/2QYAuEwSZuEAnDXiiLDaM1AVVjl4hpHvSc0CsrIxlFrIG/sp7espdcCOIVhS
	 m5PMn4OCAdHQgKke/2Re6NYewn5POFNtxuhGITXSVW74WYvSR6C0kn58Nhu4eoAc96
	 m1kCpLsaN6v4bdPNFvBYWFkcVLUGYjBZr10GUNpk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3A2FF80169;
	Tue, 14 Sep 2021 11:12:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0585F8032B; Tue, 14 Sep 2021 11:12:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81C47F80169
 for <alsa-devel@alsa-project.org>; Tue, 14 Sep 2021 11:12:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81C47F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="mvSW9aVG"
Received: by mail-qt1-x849.google.com with SMTP id
 f34-20020a05622a1a2200b0029c338949c1so59185007qtb.8
 for <alsa-devel@alsa-project.org>; Tue, 14 Sep 2021 02:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=JN3m/MpfuUecWmdVnxg//YZchm1bk52GTAi9/UcnHho=;
 b=mvSW9aVGQkSnDPqgFlIEhRrskk/XsDMv7zGEJcmlMiMw3UIjbvjT3YHPheQwS3Ac84
 crsyy0R1UgGQAte3/n81DQxS5NbbjZjwuNcHdQn0OUTE/AOaW45byfwYD/uY4BDNPdYd
 N/yUnFsAmlB9jtokJLpGQFuE0SrgTFkR07HXH3hQopvcoilv9g8xzz04T9+9Djm73IBa
 OiJcEEZ1xVQgj6jYbilktyqAJSd2DP2/JV6sylpSJrpbQzSzc6KaLp5maSGdJ+/PvupL
 0YZl9+47Q/HFd3X6zlvBCGlM6WJarV0u10q3Zvmysd8gzmz3fs7Sp0qhcOglZhzRYI6h
 x5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=JN3m/MpfuUecWmdVnxg//YZchm1bk52GTAi9/UcnHho=;
 b=aBIfJmdveG6QEWjNkHCRsuLeia5FNhTnsyl5HOHc4X5qL1+jW2u5Ol2C41W+Z0IZ9L
 WiukeqxZF3I9Riw8d+/EO8+59rfELKeL0XX65XiXmuC0pKpTbZ3aOdU4yJ9goNrH5wiC
 c32IqGKKcGYSmHD4DDg5XHo/aWwaOkIAD417rhNscAGGOAHq0Mw+g076+NggAU5+6530
 +pA/qSplN4iYX/1vMNgsMIhj/E8MzD7a4XwjT3+d3YGQJV9p7nhuyes8pclL2TUDyuJK
 wCRGwoq6raC6/j8pAcWIwTBr3oxoFkC+PDmaoPcJSNvDoJC02eue7zSNiiPaoGf04PbC
 DOUQ==
X-Gm-Message-State: AOAM533LuMj7D9ys/hzqlnwyZ7HerhupSn5i2u7+Mbt4s9dJkhP6NhZK
 wC5YaU/2CGRKVSRyn5/MfmFtjXF/t+OC
X-Google-Smtp-Source: ABdhPJzazYfOZJLl/NCPeXGQ5GECIjOdSMhDfyy+2k7Lq6XVBHpCh8g4CHrfzAPXlC9v2GvJYAr8FqCEgbLc
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1d24:4827:7125:1e19])
 (user=tzungbi job=sendgmr) by 2002:a05:6214:1271:: with SMTP id
 r17mr4114073qvv.48.1631610735139; Tue, 14 Sep 2021 02:12:15 -0700 (PDT)
Date: Tue, 14 Sep 2021 17:12:04 +0800
Message-Id: <20210914091204.2204278-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
Subject: [PATCH v3] ASoC: dt-bindings: mediatek: mt8192: re-add audio afe
 document
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org
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

The document was merged as commit 1afc60e00de3 ("dt-bindings:
mediatek: mt8192: add audio afe document").

However, [1] revealed that the commit 1afc60e00de3 breaks
dt_binding_check due to dt-bindings/clock/mt8192-clk.h doesn't
exist.

As a temporary fix, commit 7d94ca3c8acd ("ASoC: mt8192: revert
add audio afe document") reverted commit 1afc60e00de3.

dt-bindings/clock/mt8192-clk.h is in mainline per commit
f35f1a23e0e1 ("clk: mediatek: Add dt-bindings of MT8192 clocks").
Re-adds the document back.

[1]: https://mailman.alsa-project.org/pipermail/alsa-devel/2020-November/176873.html

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
Changes from v2 (https://mailman.alsa-project.org/pipermail/alsa-devel/2021-August/189058.html):
- Simplify the commit message.

Changes from v1 (https://mailman.alsa-project.org/pipermail/alsa-devel/2021-August/189048.html):
- Add more context to the commit message.

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
2.33.0.309.g3052b89438-goog

