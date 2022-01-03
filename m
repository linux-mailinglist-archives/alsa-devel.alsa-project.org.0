Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A796F482DC6
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jan 2022 05:33:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12BFC1760;
	Mon,  3 Jan 2022 05:33:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12BFC1760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641184432;
	bh=K2Y8UTp8NsCgL/Gk+ncvVZBzdhr+LMFNVop8Xxo8BEM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oMfzjBCOr6cLB+a6IjRP8qf6qtZjvF1gsZHZnu6O9vBWqDv6FRnSJTTiTlEEVds80
	 jzszeO0q20zp6ihQZF83Dlx6v3dOUt6bpxYd7e4gpt7Yunnzc/sPpRU07ZPr2pjwn/
	 N8gFPl8XdbR6dC/lTAA+dwNmGooAUQiTpZLUNgMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BE04F8013F;
	Mon,  3 Jan 2022 05:32:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC0C9F80107; Mon,  3 Jan 2022 05:32:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0C19F800E3
 for <alsa-devel@alsa-project.org>; Mon,  3 Jan 2022 05:32:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0C19F800E3
X-UUID: 3d3d97554d14437abfc570b8cd0cce48-20220103
X-UUID: 3d3d97554d14437abfc570b8cd0cce48-20220103
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <yc.hung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1907919793; Mon, 03 Jan 2022 12:32:30 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 3 Jan 2022 12:32:29 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 3 Jan 2022 12:32:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 3 Jan 2022 12:32:29 +0800
From: YC Hung <yc.hung@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [PATCH v3] dt-bindings: dsp: mediatek: add mt8195 dsp document
Date: Mon, 3 Jan 2022 12:32:03 +0800
Message-ID: <20220103043202.6524-1-yc.hung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 allen-kh.cheng@mediatek.com, cezary.rojewski@intel.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, yc.hung@mediatek.com, daniel.baluta@nxp.com,
 linux-arm-kernel@lists.infradead.org
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

From: "YC Hung" <yc.hung@mediatek.com>

This patch adds mt8195 dsp document. The dsp is used for Sound Open
Firmware driver node. It includes registers,  clocks, memory regions,
and mailbox for dsp.

Signed-off-by: yc.hung <yc.hung@mediatek.com>
---
Changes since v2:
  Remove useless watchdog interrupt.
  Add commit message more detail description.

Changes since v1:
  Rename yaml file name as mediatek,mt8195-dsp.yaml
  Refine descriptions for mailbox, memory-region and drop unused labels
  in examples.
---
---
 .../devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
index bde763191d86..779daa786739 100644
--- a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
@@ -27,14 +27,6 @@ properties:
       - const: cfg
       - const: sram
 
-  interrupts:
-    items:
-      - description: watchdog interrupt
-
-  interrupt-names:
-    items:
-      - const: wdt
-
   clocks:
     items:
       - description: mux for audio dsp clock
@@ -75,8 +67,6 @@ required:
   - compatible
   - reg
   - reg-names
-  - interrupts
-  - interrupt-names
   - clocks
   - clock-names
   - memory-region
@@ -95,8 +85,6 @@ examples:
        reg = <0x10803000  0x1000>,
              <0x10840000  0x40000>;
        reg-names = "cfg", "sram";
-       interrupts = <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH 0>;
-       interrupt-names = "wdt";
        clocks = <&topckgen 10>, //CLK_TOP_ADSP
                 <&clk26m>,
                 <&topckgen 107>, //CLK_TOP_AUDIO_LOCAL_BUS
-- 
2.18.0

