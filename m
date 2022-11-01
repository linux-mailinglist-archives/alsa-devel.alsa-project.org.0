Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B980261448C
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Nov 2022 07:13:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BC5E16A5;
	Tue,  1 Nov 2022 07:12:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BC5E16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667283220;
	bh=hE1Mcq7G3SnCewGCseGWv5smbbr5rTTtK7yJhZkPIv4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vkXPJRxrCbucz4yPD+GEAqZShVJDSSjZHqHpqt42cqi+DoPEyZbFZVCxN9wpr0D5X
	 PMN+Be/Tt1rxBe0IiGJkSwB1sMCkjQ3K+L/e5S361clGCxE6xCXu9fm3cExQeKAZOe
	 3rw+2sD0GNpC8sOOTdDTzM2SdiY9RtX9hVSpslQY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CC8AF80568;
	Tue,  1 Nov 2022 07:12:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D2FBF80564; Tue,  1 Nov 2022 07:12:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEF64F80564;
 Tue,  1 Nov 2022 07:12:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEF64F80564
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="sCWJbizk"
X-UUID: 160aec99e83f4ba3bf889cedd7bfe111-20221101
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=kA5JNRTKDV1dAItHbDmK5oovg/tPz2PC0c+hpfEzm2c=; 
 b=sCWJbizksz+qi5+bJn5rAGUPje8tRQ9RHy4Cytoaqy3AccI7HU02K8QBYYRp3UgxBmlyNR+fyXdzNnOXloSM3wPqMQAczE4hnGy9++i1l0wwc5ePChFDLF12/5F3/ApTwaRjKC7NkbAB6RDhbtVI1PMOyuYnUWARxjEpZaJbkIk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12, REQID:ea80708a-db00-4f5f-95c5-95b8b37a27b6, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:90
X-CID-INFO: VERSION:1.1.12, REQID:ea80708a-db00-4f5f-95c5-95b8b37a27b6, IP:0,
 URL
 :0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
 N:quarantine,TS:90
X-CID-META: VersionHash:62cd327, CLOUDID:77433590-1a78-4832-bd08-74b1519dcfbf,
 B
 ulkID:221101141142JXVKS36F,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48,TC:n
 il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 160aec99e83f4ba3bf889cedd7bfe111-20221101
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com (envelope-from <tinghan.shen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2019377883; Tue, 01 Nov 2022 14:11:40 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 1 Nov 2022 14:11:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 1 Nov 2022 14:11:39 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, Mark
 Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Tinghan Shen <tinghan.shen@mediatek.com>, Yaochun Hung
 <yc.hung@mediatek.com>
Subject: [PATCH v1 1/2] dt-bindings: dsp: mediatek: Add default clock sources
 for mt8186 dsp
Date: Tue, 1 Nov 2022 14:11:36 +0800
Message-ID: <20221101061137.25731-2-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221101061137.25731-1-tinghan.shen@mediatek.com>
References: <20221101061137.25731-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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

Add the default clock sources used by mt8186 dsp.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 .../devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml b/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
index 3e63f79890b4..4cc0634c876b 100644
--- a/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml
@@ -35,11 +35,15 @@ properties:
     items:
       - description: mux for audio dsp clock
       - description: mux for audio dsp local bus
+      - description: default clock source for dsp local bus
+      - description: default clock source for dsp core
 
   clock-names:
     items:
       - const: audiodsp
       - const: adsp_bus
+      - const: mainpll_d2_d2
+      - const: clk26m
 
   power-domains:
     maxItems: 1
@@ -82,9 +86,11 @@ examples:
               <0x1068f000 0x1000>;
         reg-names = "cfg", "sram", "sec", "bus";
         clocks = <&topckgen CLK_TOP_AUDIODSP>,
-                 <&topckgen CLK_TOP_ADSP_BUS>;
-        clock-names = "audiodsp",
-                      "adsp_bus";
+                 <&topckgen CLK_TOP_ADSP_BUS>,
+                 <&topckgen CLK_TOP_MAINPLL_D2_D2>,
+                 <&clk26m>;
+        clock-names = "audiodsp", "adsp_bus",
+                      "mainpll_d2_d2", "clk26m";
         power-domains = <&spm 6>;
         mbox-names = "rx", "tx";
         mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
-- 
2.18.0

