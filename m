Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D4C59AC5B
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Aug 2022 09:55:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA15F16A0;
	Sat, 20 Aug 2022 09:54:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA15F16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660982147;
	bh=Rw4Y5Jx9PEQ7/Dtg3yghuvBpuIYBZ6HyQPuZuvxTlLE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cYSlMvZYHRri718dJjNCmAYFvwVhUh8fn0imRQvAvPWG0dx+gBQ3fh58W0N/CaNaM
	 FKjMmlH8vmV2CB7VWAIPT+zyqgIP2jYymMJ8HXd2Oxp6pNdwkCGxEAcHUT329hMGZg
	 oTQKqV2JztSCcg9FpfUmsfw89FzEdFlxUr6Eg6TU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5FB3F80524;
	Sat, 20 Aug 2022 09:54:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 097CCF804FB; Sat, 20 Aug 2022 09:54:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2224FF801F5
 for <alsa-devel@alsa-project.org>; Sat, 20 Aug 2022 09:54:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2224FF801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="CsWDZ2b8"
X-UUID: e6d62da6e7ff439190ba35d25ecc2fd2-20220820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=fJ9NfQcMD4SWm22U/8ZFi7fW6pAkd/2SmzzTkLIJaJs=; 
 b=CsWDZ2b8E+Ikk1bj/hLNQMfqOJZNZIpIRQMwk0ZUMLiBInwb8goF0SFSlcb3XbE2W3y6tvjj57rDAGIYGvLC4zlY+JiPc99qg2CSzLCuN+o1ui4EoJCRGRVhAAG05yDllwGw+yH/Sjqkf/GL64fF9uIpT/lh3Kg8MXAlVFcVAkM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:04efe667-cf04-44fd-9d5b-e1a2d8582270, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release
 _Ham,ACTION:release,TS:95
X-CID-INFO: VERSION:1.1.10, REQID:04efe667-cf04-44fd-9d5b-e1a2d8582270, OB:0,
 LOB
 :0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS98
 1B3D,ACTION:quarantine,TS:95
X-CID-META: VersionHash:84eae18, CLOUDID:ff6dc567-a9d9-4672-a3c8-12721739a220,
 C
 OID:523ba761d7bb,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e6d62da6e7ff439190ba35d25ecc2fd2-20220820
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <chunxu.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 300166858; Sat, 20 Aug 2022 15:53:50 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sat, 20 Aug 2022 15:53:48 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 20 Aug 2022 15:53:47 +0800
From: Chunxu Li <chunxu.li@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <nfraprado@collabora.com>, <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: mediatek: dt-bindings: modify machine bindings for
 SOF
Date: Sat, 20 Aug 2022 15:53:43 +0800
Message-ID: <20220820075343.13993-3-chunxu.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220820075343.13993-1-chunxu.li@mediatek.com>
References: <20220820075343.13993-1-chunxu.li@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 "chunxu.li" <chunxu.li@mediatek.com>, lgirdwood@gmail.com,
 jiaxin.yu@mediatek.com, linux-kernel@vger.kernel.org,
 project_global_chrome_upstream_group@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
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

From: "chunxu.li" <chunxu.li@mediatek.com>

Add SOF related field.
1. Add a property "mediatek,adsp", Only when adsp phandle could be
retrieved from DTS, the SOF related part of machine driver is executed.
2. Add a property "mediatek,dai-link" to support dai-links could be
specified from DTS

Signed-off-by: chunxu.li <chunxu.li@mediatek.com>
---
 .../bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml   | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
index 059a7629b2d3..0281984fc916 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
@@ -43,6 +43,16 @@ properties:
     required:
       - sound-dai
 
+  mediatek,adsp:
+    $ref: "/schemas/types.yaml#/definitions/phandle"
+    description: The phandle of MT8186 ADSP platform.
+
+  mediatek,dai-link:
+    $ref: /schemas/types.yaml#/definitions/string-array
+    description:
+      A list of the desired dai-links in the sound card. Each entry is a
+      name defined in the machine driver.
+
 additionalProperties: false
 
 required:
-- 
2.25.1

