Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 308F63F8C4A
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Aug 2021 18:35:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4A0E16C7;
	Thu, 26 Aug 2021 18:34:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4A0E16C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629995712;
	bh=IBrkcc5moenIKRVt7UfM/k9gJibNBsuRYSv+QEgfKQY=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KQuEVBYcm3FH3g8eTDWWvPdbXuYgJs5LPWcLkRDxuDieIkfiBIV9sxCox89a7DMkf
	 ofdT+G6Z4NH1D64EqqEXdTOE1bx8bLXpNCPQH4bvGBAkT3gY3jrIvWOxfTHh6BYwg3
	 sGem7rFmAgpnSek4SzuGmx3PIGL2rdS/NWTJrYmk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2011EF80224;
	Thu, 26 Aug 2021 18:33:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AC65F801D8; Thu, 26 Aug 2021 18:33:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com
 [IPv6:2607:f8b0:4864:20::44a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5D74F8013F
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 18:33:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5D74F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="GzIEp3/6"
Received: by mail-pf1-x44a.google.com with SMTP id
 g17-20020a056a00079100b003e1010a1ad4so778517pfu.5
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 09:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=H30b6LzNg0OHS6v2pMLtjQ9Qa3GaaOYpmdNMxAiioqM=;
 b=GzIEp3/6sSrIXD4uBUq8GTvlkveyNjCr2sam5+z8FAnP5prWE0Kh8V/mnFZmmF8X4J
 b/9tnc8wjxo2rVYcYRnZr8djt/UyW5Z52hqZY3pfSq8dbd6iS74aJI8sKfOZHRy266UZ
 rHA4KRUwGO9aSDCaJK1tS3pWFG8WPgH92Fkl8+/dCj9z6FVeOBnuzfzK8nY0palLbMPE
 kN9CNbniqiWEOkaPbjUX1d/ebIP0WMP+4O6S572hqFg8F1jxrTlCBHxRs1dSeNd9uHjX
 QOm3t5i2ulg95R0TnHycmCtNSXC3b0CVHsHIOwhlkwt4Au4SNTgrlUwm8CQ1myTw0/Rq
 cqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=H30b6LzNg0OHS6v2pMLtjQ9Qa3GaaOYpmdNMxAiioqM=;
 b=W73tY1dcgJK5beYiuSu9zYHCqzKQLm5Q69Xyfa5Jp8FRSObEG1omptoUC8DFS8bzD5
 a0TylvOc4fONTVsT/anK0+Tk7IMTMximIR8IQa7U6lhQ/NDYpLA47pK3gKPje8oEMjyp
 ZeKAMy96Nr2SyiC4Fx6YIVwU3kPTanVmBms3PTTs2peOaDiTMesUy5NVpLKUBHTg+ySJ
 TAZ/1rvRYsjGZAD8VeZBQvpVZ+KLcQXsuOG94N0xRKs1LrBi1J6KSiVFGvBVA0PGedtl
 AAndlqzDhpVweypXFTq9Tn/KCO6kNpZoXJpPAxz4kn14e8xwX+6FhKzJnJuhKA//HBCu
 9Aug==
X-Gm-Message-State: AOAM5329H2biG/H/VDxNYPMCf8uv8gky75SpXj5UGy9a6QTqQq5noeKw
 64q5ywBBCkUt2uUbzqk/2dSUXLZGMA47
X-Google-Smtp-Source: ABdhPJxJI2a1EQZQHU97ZvLgn3AQXTSRHyn8TOb8KHqA4uBo7gJv/2Dss8k64w25x+X8yw367ZxWtM9GHZ+E
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:2061:3627:c077:944c])
 (user=tzungbi job=sendgmr) by 2002:a17:90b:ed7:: with SMTP id
 gz23mr85887pjb.1.1629995618409; Thu, 26 Aug 2021 09:33:38 -0700 (PDT)
Date: Fri, 27 Aug 2021 00:33:29 +0800
Message-Id: <20210826163329.3903340-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.rc2.250.ged5fa647cd-goog
Subject: [PATCH v2] ASoC: dt-bindings: mediatek: mt8192: re-add audio afe
 document
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

The document was sent in [1] and merged to ASoC for-next branch as
commit 1afc60e00de3 ("dt-bindings: mediatek: mt8192: add audio afe
document").

However, [2] revealed that the commit 1afc60e00de3 breaks
dt_binding_check in linux-next due to dt-bindings/clock/mt8192-clk.h
doesn't exist.

[3] reverted the commit 1afc60e00de3 and merged as commit
7d94ca3c8acd ("ASoC: mt8192: revert add audio afe document").

dt-bindings/clock/mt8192-clk.h now can be found in linux-next per [4],
re-adds the document back.

[1]: https://mailman.alsa-project.org/pipermail/alsa-devel/2020-November/176577.html
[2]: https://mailman.alsa-project.org/pipermail/alsa-devel/2020-November/176873.html
[3]: https://mailman.alsa-project.org/pipermail/alsa-devel/2020-November/176897.html
[4]: https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/commit/?h=clk-next&id=f35f1a23e0e12e3173e9e9dedbc150d139027189

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
Changes from v1 (https://patchwork.kernel.org/project/alsa-devel/list/?series=537817):
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
2.33.0.rc2.250.ged5fa647cd-goog

