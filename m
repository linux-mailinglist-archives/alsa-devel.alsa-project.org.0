Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA8F41A5DA
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Sep 2021 05:05:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAF9E16A6;
	Tue, 28 Sep 2021 05:04:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAF9E16A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632798317;
	bh=XUZA8Gfys6RXijUhb5Q0VCCKOVuJdIwSxNrAQz0fMKM=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WF3JLB3iBbfkM7PdnXQUlxgjHbCvBMrMNwZ4zejjAGHvK7/lxevjq1cPNGtSwJAtr
	 NjzSI6GArp7Tk9lNq0o6+laheWZK0Up8pXJBuLQUVL0WdoAbMi07xJ0OfVNbGoZh6m
	 PLU5fMxmWXeE5EkIc4i+GgFU+XrNdChSYZI1OtFw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47BCEF804BC;
	Tue, 28 Sep 2021 05:04:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B3E3F804AD; Tue, 28 Sep 2021 05:03:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F81CF80161
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 05:03:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F81CF80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="dL+4nAoZ"
Received: by mail-yb1-xb49.google.com with SMTP id
 q8-20020a056902150800b005b640f67812so14598367ybu.8
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 20:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=KsTiqLz5nah56eaJPdLQpIjEU/EofkShSKUy8lI2hyQ=;
 b=dL+4nAoZuGm4aNP5itgjzvN4wG8K9bftsbuyMiru+AJT59d5ORquQONcCClLp3l1ac
 0OpUJXuFJS+qEZzWO05pnDGFkXMk6Jcj/By1Gy+FgCQOVg5jtTv5fpsq52zdMjrE4GXu
 LdURoXk+nmB34mtCrsUc9Pd8mOqDSCuQaxmaAdZuMzBwy+lgz5dK4afD53nYDZVfWklw
 1ggxt0aAZf657UFXJJSl5gW3u8tvJCZaFA0raJfloxhiFhL05E32qeKBsUmMPKm+6BIs
 /YyN6mxHjg8JrXAAZg5CqjawkbffO6TqjIA9C2tUemKwZtcr+/lxatC+3enbnwSqivoh
 dBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=KsTiqLz5nah56eaJPdLQpIjEU/EofkShSKUy8lI2hyQ=;
 b=BDy/hoWgI2fNF0m6BOC0FkJ5lHNnkIFhWMVBLBFFrc/fmAxFJezGkAGkv8LGe5g99+
 EIYy7qxsKIxA4UqPH9y9gAjm2nA2JNpLENi14mb13CqDt45AhkbIQGnwIqrG4mgZfUDH
 N3V2U8brwZt6ycqIOXxthh+olp83JT4IZsAuwcGEGyLOpIFCXJRDmmnC8iwybXD9Zsus
 uZfEmIx+4z4u1Rb/8Id0oUUn9tHqrNSZaYuHXu4VdCY8cUUFoB74TLjWP1Nu1B3YSeqI
 MVjuw1J3Sj3XaaPhlYIk2fuaqSHRfDkJuqet4IDzukspRhVaseKKcRB80VW2e0g9AmgM
 OIXg==
X-Gm-Message-State: AOAM530E3tVpmk7PXHS1jLe58tqFlJFp5zjGhB3KIJmb8MXtk5X97hFE
 wQsMefaJaNcCL/5cdNlEqL2ROX3QUign
X-Google-Smtp-Source: ABdhPJz1nsrfytd99INIpMBDoXfiMBv7DoMihoInZPu47ZUCSKn6IO7K5b9oPkuXlLp7wdU6Hbc3u49FKYrh
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:17f:bc7f:958e:ac0b])
 (user=tzungbi job=sendgmr) by 2002:a25:b7d0:: with SMTP id
 u16mr3859570ybj.342.1632798229290; Mon, 27 Sep 2021 20:03:49 -0700 (PDT)
Date: Tue, 28 Sep 2021 11:03:43 +0800
Message-Id: <20210928030343.2200141-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
Subject: [RESEND PATCH v4] ASoC: dt-bindings: mediatek: mt8192: re-add audio
 afe document
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
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

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../bindings/sound/mt8192-afe-pcm.yaml        | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml

diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
new file mode 100644
index 000000000000..5e9fe067f440
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
+  - Jiaxin Yu <jiaxin.yu@mediatek.com>
+  - Shane Chien <shane.chien@mediatek.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8192-audio
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
2.33.0.685.g46640cef36-goog

