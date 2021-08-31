Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5913FC43E
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Aug 2021 10:41:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B017E1737;
	Tue, 31 Aug 2021 10:40:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B017E1737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630399294;
	bh=4NInJVLGLsJ6t5D3kpXQBQ2bcBirU3Y3x479RwH5rWc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fUE3qNuo10a5DONDPJLBMq8tdyKLyOW+sA9xTcppxn0eUBVXd3M1/1+AFtbgSNuQH
	 L51/37lPrvdaBTV9r8xFfV9PXzQsQl5n9W3PS1UX3mHW1FtZC8nqgpJ4jvTtgZZiaI
	 U4IQC+FoZnvfyQTpvrGz9BusfvgAfcEMCqdRP4Jk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 100ADF800BE;
	Tue, 31 Aug 2021 10:40:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 507D3F8025B; Tue, 31 Aug 2021 10:40:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1C08F800BE
 for <alsa-devel@alsa-project.org>; Tue, 31 Aug 2021 10:40:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1C08F800BE
X-UUID: c2bb3395cc704301b8105ff7d3b932e2-20210831
X-UUID: c2bb3395cc704301b8105ff7d3b932e2-20210831
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1722613409; Tue, 31 Aug 2021 16:39:59 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 16:39:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 31 Aug 2021 16:39:57 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [PATCH] ASoC: dt-bindings: mt8195: remove dependent headers in the
 example
Date: Tue, 31 Aug 2021 16:39:56 +0800
Message-ID: <20210831083956.9804-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, linux-arm-kernel@lists.infradead.org
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

Drop the use of the defines including clock and power id, so that
we can remove the headers which are not applied in the example.

Fixes: b5bac34fcfb4 ("dt-bindings: mediatek: mt8195: add audio afe document")
Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 .../bindings/sound/mt8195-afe-pcm.yaml        | 40 +++++++++----------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
index 53e9434a6d9d..dcf790b053d2 100644
--- a/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
@@ -130,36 +130,34 @@ additionalProperties: false
 
 examples:
   - |
-    #include <dt-bindings/clock/mt8195-clk.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interrupt-controller/irq.h>
-    #include <dt-bindings/power/mt8195-power.h>
 
     afe: mt8195-afe-pcm@10890000 {
         compatible = "mediatek,mt8195-audio";
         reg = <0x10890000 0x10000>;
         interrupts = <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH 0>;
         mediatek,topckgen = <&topckgen>;
-        power-domains = <&spm MT8195_POWER_DOMAIN_AUDIO>;
+        power-domains = <&spm 7>; //MT8195_POWER_DOMAIN_AUDIO
         clocks = <&clk26m>,
-                 <&topckgen CLK_TOP_APLL1>,
-                 <&topckgen CLK_TOP_APLL2>,
-                 <&topckgen CLK_TOP_APLL12_DIV0>,
-                 <&topckgen CLK_TOP_APLL12_DIV1>,
-                 <&topckgen CLK_TOP_APLL12_DIV2>,
-                 <&topckgen CLK_TOP_APLL12_DIV3>,
-                 <&topckgen CLK_TOP_APLL12_DIV9>,
-                 <&topckgen CLK_TOP_A1SYS_HP_SEL>,
-                 <&topckgen CLK_TOP_AUD_INTBUS_SEL>,
-                 <&topckgen CLK_TOP_AUDIO_H_SEL>,
-                 <&topckgen CLK_TOP_AUDIO_LOCAL_BUS_SEL>,
-                 <&topckgen CLK_TOP_DPTX_M_SEL>,
-                 <&topckgen CLK_TOP_I2SO1_M_SEL>,
-                 <&topckgen CLK_TOP_I2SO2_M_SEL>,
-                 <&topckgen CLK_TOP_I2SI1_M_SEL>,
-                 <&topckgen CLK_TOP_I2SI2_M_SEL>,
-                 <&infracfg_ao CLK_INFRA_AO_AUDIO_26M_B>,
-                 <&scp_adsp CLK_SCP_ADSP_AUDIODSP>;
+                 <&topckgen 163>, //CLK_TOP_APLL1
+                 <&topckgen 166>, //CLK_TOP_APLL2
+                 <&topckgen 233>, //CLK_TOP_APLL12_DIV0
+                 <&topckgen 234>, //CLK_TOP_APLL12_DIV1
+                 <&topckgen 235>, //CLK_TOP_APLL12_DIV2
+                 <&topckgen 236>, //CLK_TOP_APLL12_DIV3
+                 <&topckgen 238>, //CLK_TOP_APLL12_DIV9
+                 <&topckgen 100>, //CLK_TOP_A1SYS_HP_SEL
+                 <&topckgen 33>, //CLK_TOP_AUD_INTBUS_SEL
+                 <&topckgen 34>, //CLK_TOP_AUDIO_H_SEL
+                 <&topckgen 107>, //CLK_TOP_AUDIO_LOCAL_BUS_SEL
+                 <&topckgen 98>, //CLK_TOP_DPTX_M_SEL
+                 <&topckgen 94>, //CLK_TOP_I2SO1_M_SEL
+                 <&topckgen 95>, //CLK_TOP_I2SO2_M_SEL
+                 <&topckgen 96>, //CLK_TOP_I2SI1_M_SEL
+                 <&topckgen 97>, //CLK_TOP_I2SI2_M_SEL
+                 <&infracfg_ao 50>, //CLK_INFRA_AO_AUDIO_26M_B
+                 <&scp_adsp 0>; //CLK_SCP_ADSP_AUDIODSP
         clock-names = "clk26m",
                       "apll1_ck",
                       "apll2_ck",
-- 
2.18.0

