Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E3D4665CB
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 15:50:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 816972615;
	Thu,  2 Dec 2021 15:49:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 816972615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638456605;
	bh=QT+3P8wB4vSLCIvaAsOOHmJGJSdX4WMQ1f5mXc27gCw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SBI+12Loo1/sb7jFLSVLysU7A8jLpnaO5Q2QxMImk/QpDQSApDH6iyt63d6V075ab
	 pDftIIh5KqpSqmyjUhy50G4EEhdGlm/6tXaxigbLTKdzWgQqOTVlsx0t+7FJS22zUY
	 N5uExc9cdRDhcXg+SClwJe98Gxw31elNdxxR7Cd8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2EE0F802E0;
	Thu,  2 Dec 2021 15:48:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3732F802A0; Thu,  2 Dec 2021 15:48:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 364F1F800CE
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 15:48:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 364F1F800CE
X-UUID: ae4405b584ea4faca627ac9c06bf4d62-20211202
X-UUID: ae4405b584ea4faca627ac9c06bf4d62-20211202
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <yc.hung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 120807078; Thu, 02 Dec 2021 22:48:25 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 2 Dec 2021 22:48:24 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 2 Dec 2021 22:48:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 2 Dec 2021 22:48:23 +0800
From: YC Hung <yc.hung@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [PATCH v6] dt-bindings: dsp: mediatek: Add mt8195 DSP binding support
Date: Thu, 2 Dec 2021 22:48:18 +0800
Message-ID: <20211202144818.31626-1-yc.hung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 allen-kh.cheng@mediatek.com, linux-kernel@vger.kernel.org,
 peter.ujfalusi@intel.com, linux-mediatek@lists.infradead.org,
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

From: "yc.hung" <yc.hung@mediatek.com>

This describes the mt8195 DSP device tree node.

Signed-off-by: yc.hung <yc.hung@mediatek.com>
---
Changes since v5:
    Remove sub node "sound" and "mediatek,platform", "mediatek,dptx-codec",
    "mediatek,hdmi-codec" properties. Let dsp node as an individual node and
    sound card has phandle of this dsp node per discussion in 
    https://github.com/thesofproject/linux/pull/3239

Changes since v4:
  - remove patch 1 with clocks as it will be reviewed and merged to SOF tree.
    https://github.com/thesofproject/linux/pull/3237
  - refine DT file binding files with Rob's comments.
---  
 .../bindings/dsp/mtk,mt8195-dsp.yaml          | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml b/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
index f8bacd50b018..33db11ee2336 100644
--- a/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
@@ -70,22 +70,6 @@ properties:
       - description: A phandle to a reserved memory region is used for dma buffer between host and DSP.   
       - description: A phandle to a reserved memory region is used for DSP system memory.
 
-  model:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: User specified audio sound card name
-
-  mediatek,platform:
-    $ref: "/schemas/types.yaml#/definitions/phandle"
-    description: The phandle of MT8195 ASoC platform.
-
-  mediatek,dptx-codec:
-    $ref: "/schemas/types.yaml#/definitions/phandle"
-    description: The phandle of MT8195 Display Port Tx codec node.
-
-  mediatek,hdmi-codec:
-    $ref: "/schemas/types.yaml#/definitions/phandle"
-    description: The phandle of MT8195 HDMI codec node.
-
 required:
   - compatible
   - reg
@@ -98,7 +82,6 @@ required:
   - power-domains
   - mbox-names
   - mboxes
-  - mediatek,platform
 
 additionalProperties: false
 
@@ -130,6 +113,4 @@ examples:
        power-domains = <&spm 6>; //MT8195_POWER_DOMAIN_ADSP
        mbox-names = "mbox0", "mbox1";
        mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
-       mediatek,dptx-codec = <&dp_tx>;
-       mediatek,platform = <&afe>;
        };
-- 
2.18.0

