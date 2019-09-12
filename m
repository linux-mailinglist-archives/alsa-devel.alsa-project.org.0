Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D43B0C17
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Sep 2019 11:57:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E24451743;
	Thu, 12 Sep 2019 11:56:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E24451743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568282269;
	bh=/OmtNFNdc6wbdcpLT/++QhBirliF4XsBHHou3kw5Ehw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vZj547zOpzXF4HrIQhHv9s7XUQtQ0YoHnS0ALORxFgo3pExXF70Qb4J05pSqMk6De
	 Cvn+FtWNpT6F6csrze4vG/nqZnUz0bHFyLDyREj9xJXg9ID/Ptnx6kfjSacC7CbbVe
	 Fnhyv9hbyruUtPFiyiy1Lzu5ByEr4bX5fMF/2HGM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E511BF805F6;
	Thu, 12 Sep 2019 11:55:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8BFCF80143; Thu, 12 Sep 2019 11:55:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by alsa1.perex.cz (Postfix) with ESMTP id 0D375F80321
 for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2019 11:55:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D375F80321
X-UUID: fcc8dc5bcb1e4836a51220321d6c95a5-20190912
X-UUID: fcc8dc5bcb1e4836a51220321d6c95a5-20190912
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1030287229; Thu, 12 Sep 2019 17:55:04 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 12 Sep 2019 17:55:02 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 12 Sep 2019 17:55:02 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>
Date: Thu, 12 Sep 2019 17:54:55 +0800
Message-ID: <1568282096-13821-2-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1568282096-13821-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1568282096-13821-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, jiaxin.yu@mediatek.com,
 tzungbi@google.com, linux-mediatek@lists.infradead.org, eason.yen@mediatek.com
Subject: [alsa-devel] [PATCH 1/2] ASoC: dt-bingdings: mediatek: mt8183: add
	a property "medaitek, toprgu"
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch adds a property "mediatek,toprgu" in example so that we could
use reset controller(usually we call it toprgu or watchdog) to reset audio
domain regs.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 Documentation/devicetree/bindings/sound/mt8183-afe-pcm.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8183-afe-pcm.txt b/Documentation/devicetree/bindings/sound/mt8183-afe-pcm.txt
index 396ba38619f6..45ca182a4ecc 100644
--- a/Documentation/devicetree/bindings/sound/mt8183-afe-pcm.txt
+++ b/Documentation/devicetree/bindings/sound/mt8183-afe-pcm.txt
@@ -4,6 +4,7 @@ Required properties:
 - compatible = "mediatek,mt68183-audio";
 - reg: register location and size
 - interrupts: should contain AFE interrupt
+- mediatek,toprgu: A phandle to the TOPRGU which for reset controller unit
 - power-domains: should define the power domain
 - clocks: Must contain an entry for each entry in clock-names
 - clock-names: should have these clock names:
@@ -20,6 +21,7 @@ Example:
 		compatible = "mediatek,mt8183-audio";
 		reg = <0 0x11220000 0 0x1000>;
 		interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_LOW>;
+		mediatek,toprgu = <&watchdog>;
 		power-domains = <&scpsys MT8183_POWER_DOMAIN_AUDIO>;
 		clocks = <&infrasys CLK_INFRA_AUDIO>,
 			 <&infrasys CLK_INFRA_AUDIO_26M_BCLK>,
-- 
2.18.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
