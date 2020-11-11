Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 976DA2AEAD6
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Nov 2020 09:07:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A3C31742;
	Wed, 11 Nov 2020 09:06:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A3C31742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605082038;
	bh=z1TbW5VcK5BNxbjKz/mwL12SVlvmGpL6gudPZ04u34c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZVzKubd8mYmxfkb6JooPvgh/xf6iSk/ssObPtnMqhieotSfI4389DgJsJN2iCV3fS
	 G89nu+exIQBfq++/28sluv/YstGp+eJ0WPvQjQ/7QRa+62HpfiE3I+NxdXnPYIDzFz
	 wpuZUh4d8Jg2HX7l1erdD2+Ayy/yPKHbqUHUIMIo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E543F801F5;
	Wed, 11 Nov 2020 09:05:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49C64F8020C; Wed, 11 Nov 2020 09:05:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by alsa1.perex.cz (Postfix) with ESMTP id 11322F8007E
 for <alsa-devel@alsa-project.org>; Wed, 11 Nov 2020 09:05:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11322F8007E
X-UUID: 69970f2a4a424d2b89a8c6475aeb7f1f-20201111
X-UUID: 69970f2a4a424d2b89a8c6475aeb7f1f-20201111
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1177359857; Wed, 11 Nov 2020 16:05:27 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Nov 2020 16:05:21 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 11 Nov 2020 16:05:21 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <matthias.bgg@gmail.com>, <tzungbi@google.com>,
 <alsa-devel@alsa-project.org>, <robh+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] dt-bindings: mediatek: mt8192: revert "add audio afe document"
Date: Wed, 11 Nov 2020 16:05:20 +0800
Message-ID: <1605081920-11848-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: B6B60659D593C4E89EEF10AE1AB27A634A2912B517692252360D8B9598ABDC582000:8
X-MTK: N
Cc: shane.chien@mediatek.com, Trevor.Wu@mediatek.com,
 Jiaxin Yu <jiaxin.yu@mediatek.com>
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

This reverts commit 1afc60e00de3abbb6c559da409c5c1bb8c1d98ec.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 https://mailman.alsa-project.org/pipermail/alsa-devel/2020-November/176873.html
 These dependency are continuing to upstream, I will revert this patch first.
 After the dependencies are merged, I will send 'mt8192-afe-pcm.yaml' again.

 .../bindings/sound/mt8192-afe-pcm.yaml        | 100 ------------------
 1 file changed, 100 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml

diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
deleted file mode 100644
index 0170c93802d29..0000000000000
--- a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
+++ /dev/null
@@ -1,100 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/sound/mt8192-afe-pcm.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Mediatek AFE PCM controller for mt8192
-
-maintainers:
-   - Jiaxin Yu <jiaxin.yu@mediatek.com>
-   - Shane Chien <shane.chien@mediatek.com>
-
-properties:
-  compatible:
-      const: mediatek,mt8192-audio
-
-  interrupts:
-    maxItems: 1
-
-  resets:
-    maxItems: 1
-
-  reset-names:
-    const: audiosys
-
-  mediatek,apmixedsys:
-    $ref: "/schemas/types.yaml#/definitions/phandle"
-    description: The phandle of the mediatek apmixedsys controller
-
-  mediatek,infracfg:
-    $ref: "/schemas/types.yaml#/definitions/phandle"
-    description: The phandle of the mediatek infracfg controller
-
-  mediatek,topckgen:
-    $ref: "/schemas/types.yaml#/definitions/phandle"
-    description: The phandle of the mediatek topckgen controller
-
-  power-domains:
-    maxItems: 1
-
-  clocks:
-    items:
-      - description: AFE clock
-      - description: ADDA DAC clock
-      - description: ADDA DAC pre-distortion clock
-      - description: audio infra sys clock
-      - description: audio infra 26M clock
-
-  clock-names:
-    items:
-      - const: aud_afe_clk
-      - const: aud_dac_clk
-      - const: aud_dac_predis_clk
-      - const: aud_infra_clk
-      - const: aud_infra_26m_clk
-
-required:
-  - compatible
-  - interrupts
-  - resets
-  - reset-names
-  - mediatek,apmixedsys
-  - mediatek,infracfg
-  - mediatek,topckgen
-  - power-domains
-  - clocks
-  - clock-names
-
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/mt8192-clk.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/interrupt-controller/irq.h>
-    #include <dt-bindings/power/mt8192-power.h>
-    #include <dt-bindings/reset-controller/mt8192-resets.h>
-
-    afe: mt8192-afe-pcm {
-        compatible = "mediatek,mt8192-audio";
-        interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
-        resets = <&watchdog MT8192_TOPRGU_AUDIO_SW_RST>;
-        reset-names = "audiosys";
-        mediatek,apmixedsys = <&apmixedsys>;
-        mediatek,infracfg = <&infracfg>;
-        mediatek,topckgen = <&topckgen>;
-        power-domains = <&scpsys MT8192_POWER_DOMAIN_AUDIO>;
-        clocks = <&audsys CLK_AUD_AFE>,
-                 <&audsys CLK_AUD_DAC>,
-                 <&audsys CLK_AUD_DAC_PREDIS>,
-                 <&infracfg CLK_INFRA_AUDIO>,
-                 <&infracfg CLK_INFRA_AUDIO_26M_B>;
-        clock-names = "aud_afe_clk",
-                      "aud_dac_clk",
-                      "aud_dac_predis_clk",
-                      "aud_infra_clk",
-                      "aud_infra_26m_clk";
-    };
-
-...
-- 
2.18.0

