Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8615474FFE8
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 09:10:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F17883B;
	Wed, 12 Jul 2023 09:09:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F17883B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689145822;
	bh=AxCX6VlYuz69xC2tDOM+eizlN//EdFtjwJYqUqeVLEA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WqwKbE37NgkmKJuKfvmUk8ifu5aR0V9tFTtt7RmtertvIsyAzfyP479CAD3rzirap
	 ic7Zt5jZZY+7+I3mY1S9UpWIaNoGdRy+g4FvYnLL3s3XL9WkEF938022INIFLzOjc8
	 bMcYkcCvpPf4VcEDud/z7HZXw6U5tKN9Fs1Mw7Zk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF0E5F80557; Wed, 12 Jul 2023 09:08:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A8DDF80549;
	Wed, 12 Jul 2023 09:08:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 071FFF80249; Wed, 12 Jul 2023 09:08:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RDNS_NONE,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 09D85F80236
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 09:08:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09D85F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=haLZc2Ax
X-UUID: e4515e9c208211eeb20a276fd37b9834-20230712
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=hvDstqe1uRa0w8Sz9h60Vtxybvd4PMZIKFhZ8k0ibOA=;
	b=haLZc2AxasHcL7wOXcwVwNubuwBW9oP74tOo1QSos4hKJ0HoRP7yq9DBjSYPLC+pvmyy0vgvkhOgF+F/h+47qUtJ5zC1Sa03Gx7r8Wsoxzqjos4Qangdoz2S2pLByd1PDKJTCLmdgGxLZ0GJTacdHBziFc8eBj61PjF4hHLzUgg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28,REQID:4bfdfa64-85fb-46f8-9fab-5bf1453f23a2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.28,REQID:4bfdfa64-85fb-46f8-9fab-5bf1453f23a2,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:176cd25,CLOUDID:7c2b240e-c22b-45ab-8a43-3004e9216b56,B
	ulkID:230712150825J3EIQWDX,BulkQuantity:2,Recheck:0,SF:17|19|48|38|29|28,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:43,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,
	TF_CID_SPAM_FSD
X-UUID: e4515e9c208211eeb20a276fd37b9834-20230712
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 826764262; Wed, 12 Jul 2023 15:08:24 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 12 Jul 2023 15:08:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 12 Jul 2023 15:08:23 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [RESEND 2/2] ASoC: dt-bindings: mediatek,mt8188-afe: add
 memory-region
Date: Wed, 12 Jul 2023 15:08:21 +0800
Message-ID: <20230712070821.23971-3-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230712070821.23971-1-trevor.wu@mediatek.com>
References: <20230712070821.23971-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Message-ID-Hash: 3MO6JRB2YDJ6KX36M7HNKNNYEMTIYMMS
X-Message-ID-Hash: 3MO6JRB2YDJ6KX36M7HNKNNYEMTIYMMS
X-MailFrom: trevor.wu@mediatek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3MO6JRB2YDJ6KX36M7HNKNNYEMTIYMMS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add memory-region property to utilize the reserved memory region.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/sound/mediatek,mt8188-afe.yaml     | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
index e6cb711ece77..0b92c71d8779 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
@@ -25,6 +25,12 @@ properties:
   reset-names:
     const: audiosys
 
+  memory-region:
+    maxItems: 1
+    description: |
+      Shared memory region for AFE memif.  A "shared-dma-pool".
+      See ../reserved-memory/reserved-memory.yaml for details.
+
   mediatek,topckgen:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of the mediatek topckgen controller
@@ -176,6 +182,7 @@ examples:
         interrupts = <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH 0>;
         resets = <&watchdog 14>;
         reset-names = "audiosys";
+        memory-region = <&snd_dma_mem_reserved>;
         mediatek,topckgen = <&topckgen>;
         mediatek,infracfg = <&infracfg_ao>;
         power-domains = <&spm 13>; //MT8188_POWER_DOMAIN_AUDIO
-- 
2.18.0

