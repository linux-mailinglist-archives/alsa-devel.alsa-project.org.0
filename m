Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 993DC5F0E3F
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Sep 2022 16:58:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED95C16AB;
	Fri, 30 Sep 2022 16:58:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED95C16AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664549934;
	bh=xHF1iKVNgJe70trH7cgFDqD/bObygzK7r0RQL8iRKFs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YEcajqBxOcWpKAIUHGTzMKEddK/3YCHymzqD8oj9fIzTf4hg2p+pcnJw3fPy9aIFq
	 i2BLJsFbF2AoD/9PTEy/l11yB3H53ALQzQiA9gXXxgBCXqrtShZy55pIYarLDC/KEF
	 63SRjOTllO5tEtgKKsxIxyJ+ONtWIe1G3mvkXOwA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78563F80548;
	Fri, 30 Sep 2022 16:57:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76A94F804E5; Fri, 30 Sep 2022 16:57:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B53FFF800E8
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 16:57:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B53FFF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="rdMFW+uU"
X-UUID: e300753390f04e6b87c20ae6c7f92468-20220930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=1KsVmcC21V3+tfYOHCRgEq/NGum7kC4ACYWLIN7w6HM=; 
 b=rdMFW+uUAmp2hF84G5kvREZ+KRehK/Jy4PR3xInDxtqLWEMgfTCQ5vcBE0rDnWcvD+0jlR6Bp3zpLTKa3obotS1ExlTCujruabnh5jPa2j9VshGq/OCOyh0jQ5qe4MtsDEvpXf6qaXS1gbjzlUcO8tGXmWFsdNPFe/DkKdODzRU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:d06da9fb-3797-496d-9b31-a465b5b1dee5, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:90
X-CID-INFO: VERSION:1.1.11, REQID:d06da9fb-3797-496d-9b31-a465b5b1dee5, IP:0,
 URL
 :0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
 N:quarantine,TS:90
X-CID-META: VersionHash:39a5ff1, CLOUDID:ee0bcde4-87f9-4bb0-97b6-34957dc0fbbe,
 B
 ulkID:220930225711QLY7OQ5I,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48|823|
 824,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,
 COL:0
X-UUID: e300753390f04e6b87c20ae6c7f92468-20220930
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1542263875; Fri, 30 Sep 2022 22:57:09 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 30 Sep 2022 22:57:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 30 Sep 2022 22:57:07 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>
Subject: [PATCH 01/12] ASoC: mediatek: common: add SMC ops ID
Date: Fri, 30 Sep 2022 22:56:50 +0800
Message-ID: <20220930145701.18790-2-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220930145701.18790-1-trevor.wu@mediatek.com>
References: <20220930145701.18790-1-trevor.wu@mediatek.com>
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

SMC call is required to communicate with ATF for some secure operations,
so we add SMC ops IDs to common header.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/common/mtk-base-afe.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/mediatek/common/mtk-base-afe.h b/sound/soc/mediatek/common/mtk-base-afe.h
index ef83e78c22a8..d33c2a3f54a9 100644
--- a/sound/soc/mediatek/common/mtk-base-afe.h
+++ b/sound/soc/mediatek/common/mtk-base-afe.h
@@ -11,6 +11,22 @@
 
 #define MTK_STREAM_NUM (SNDRV_PCM_STREAM_LAST + 1)
 
+/* SMC CALL Operations */
+enum mtk_audio_smc_call_op {
+	MTK_AUDIO_SMC_OP_INIT = 0,
+	MTK_AUDIO_SMC_OP_DRAM_REQUEST,
+	MTK_AUDIO_SMC_OP_DRAM_RELEASE,
+	MTK_AUDIO_SMC_OP_SRAM_REQUEST,
+	MTK_AUDIO_SMC_OP_SRAM_RELEASE,
+	MTK_AUDIO_SMC_OP_ADSP_REQUEST,
+	MTK_AUDIO_SMC_OP_ADSP_RELEASE,
+	MTK_AUDIO_SMC_OP_DOMAIN_SIDEBANDS,
+	MTK_AUDIO_SMC_OP_BTCVSD_WRITE,
+	MTK_AUDIO_SMC_OP_BTCVSD_UPDATE_CTRL_CLEAR,
+	MTK_AUDIO_SMC_OP_BTCVSD_UPDATE_CTRL_UNDERFLOW,
+	MTK_AUDIO_SMC_OP_NUM
+};
+
 struct mtk_base_memif_data {
 	int id;
 	const char *name;
-- 
2.18.0

