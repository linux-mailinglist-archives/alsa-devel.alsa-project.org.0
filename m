Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FB076E217
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Aug 2023 09:51:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2257827;
	Thu,  3 Aug 2023 09:50:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2257827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691049107;
	bh=cL+AuZfB4fFXglkz94EBGgG43OblrAvoUFk+TO3nuXI=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mjTFAa4nKV2ySmYbxC8H6tQuviDjtr++TNfseaEYNmsM6ZashI1OTsUVUrPcCduIp
	 DaCvU28ytDSLHo1z3xGtDtF+G6pJ/J7qDAUqTcvMp2ylJz7WV9kTte8JV1XLIA3JQ6
	 qzmBtU6toXUHCIgWAyrKVIV5ptGDrBs+aNy+UZHs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DD9CF80087; Thu,  3 Aug 2023 09:50:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E95EF80087;
	Thu,  3 Aug 2023 09:50:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B43B1F8025A; Thu,  3 Aug 2023 09:50:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RDNS_NONE,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 43D59F80087;
	Thu,  3 Aug 2023 09:50:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43D59F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=aRC1M50+
X-UUID: 6c018bae31d211ee9cb5633481061a41-20230803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=zXH6sbvQV5thKqmsP6yJ7hqCSFhMzTMFPJkhA6neuGg=;
	b=aRC1M50+4z2u8hhjg5ZGCDpTLDvwwdM4cwjxbOaHAftkM0zsgo93q9wNy5wb5c2sSCco3r7VvcDQIoBJUaV3q8qnRZQqCs1HwgkptSltHcd3YXVDg9AE0RJJAiBjo2ziiGVsdTTBJqXxSt8RFwB17xj22m8YJGoscSSm2GGAQrc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:51fb2311-386c-460e-8f2d-105528158e03,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.30,REQID:51fb2311-386c-460e-8f2d-105528158e03,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:1fcc6f8,CLOUDID:e211d8a0-0933-4333-8d4f-6c3c53ebd55b,B
	ulkID:23080315503407VZUZJE,BulkQuantity:2,Recheck:0,SF:19|48|38|29|28|17,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,
	TF_CID_SPAM_FAS
X-UUID: 6c018bae31d211ee9cb5633481061a41-20230803
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1813568689; Thu, 03 Aug 2023 15:50:31 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 3 Aug 2023 15:50:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 3 Aug 2023 15:50:30 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <pierre-louis.bossart@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<kai.vehmanen@linux.intel.com>, <daniel.baluta@nxp.com>,
	<broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <yc.hung@mediatek.com>,
	<allen-kh.cheng@mediatek.com>, <sound-open-firmware@alsa-project.org>,
	<alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: SOF: mediatek: mt8186 modify dram type as non-cache
Date: Thu, 3 Aug 2023 15:50:28 +0800
Message-ID: <20230803075028.32170-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Message-ID-Hash: L3EPT2MNZU6ANT3F4MCQ4PZNVMF32D6J
X-Message-ID-Hash: L3EPT2MNZU6ANT3F4MCQ4PZNVMF32D6J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L3EPT2MNZU6ANT3F4MCQ4PZNVMF32D6J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To prevent incorrect access between the host and DSP sides, we need to
modify DRAM as a non-cache memory type. Additionally, we can retrieve
the size of shared DMA from the device tree.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
Reviewed-by: Yaochun Hung <yc.hung@mediatek.com>
Reviewed-by: Kuan-Hsun Cheng <Allen-KH.Cheng@mediatek.com>
---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 40 +++++++++++++++-----------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index 3e0ea0e109e2..f587edf9e0a7 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -111,6 +111,14 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 
 	dev_dbg(dev, "DMA %pR\n", &res);
 
+	adsp->pa_shared_dram = (phys_addr_t)res.start;
+	adsp->shared_size = resource_size(&res);
+	if (adsp->pa_shared_dram & DRAM_REMAP_MASK) {
+		dev_err(dev, "adsp shared dma memory(%#x) is not 4K-aligned\n",
+			(u32)adsp->pa_shared_dram);
+		return -EINVAL;
+	}
+
 	ret = of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_err(dev, "of_reserved_mem_device_init failed\n");
@@ -244,23 +252,18 @@ static int adsp_shared_base_ioremap(struct platform_device *pdev, void *data)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_adsp_chip_info *adsp = data;
-	u32 shared_size;
 
 	/* remap shared-dram base to be non-cachable */
-	shared_size = TOTAL_SIZE_SHARED_DRAM_FROM_TAIL;
-	adsp->pa_shared_dram = adsp->pa_dram + adsp->dramsize - shared_size;
-	if (adsp->va_dram) {
-		adsp->shared_dram = adsp->va_dram + DSP_DRAM_SIZE - shared_size;
-	} else {
-		adsp->shared_dram = devm_ioremap(dev, adsp->pa_shared_dram,
-						 shared_size);
-		if (!adsp->shared_dram) {
-			dev_err(dev, "ioremap failed for shared DRAM\n");
-			return -ENOMEM;
-		}
+	adsp->shared_dram = devm_ioremap(dev, adsp->pa_shared_dram,
+					 adsp->shared_size);
+	if (!adsp->shared_dram) {
+		dev_err(dev, "failed to ioremap base %pa size %#x\n",
+			adsp->shared_dram, adsp->shared_size);
+		return -ENOMEM;
 	}
-	dev_dbg(dev, "shared-dram vbase=%p, phy addr :%pa, size=%#x\n",
-		adsp->shared_dram, &adsp->pa_shared_dram, shared_size);
+
+	dev_dbg(dev, "shared-dram vbase=%p, phy addr :%pa,  size=%#x\n",
+		adsp->shared_dram, &adsp->pa_shared_dram, adsp->shared_size);
 
 	return 0;
 }
@@ -307,9 +310,12 @@ static int mt8186_dsp_probe(struct snd_sof_dev *sdev)
 		return -ENOMEM;
 	}
 
-	sdev->bar[SOF_FW_BLK_TYPE_SRAM] = devm_ioremap_wc(sdev->dev,
-							  priv->adsp->pa_dram,
-							  priv->adsp->dramsize);
+	priv->adsp->va_sram = sdev->bar[SOF_FW_BLK_TYPE_IRAM];
+
+	sdev->bar[SOF_FW_BLK_TYPE_SRAM] = devm_ioremap(sdev->dev,
+						       priv->adsp->pa_dram,
+						       priv->adsp->dramsize);
+
 	if (!sdev->bar[SOF_FW_BLK_TYPE_SRAM]) {
 		dev_err(sdev->dev, "failed to ioremap base %pa size %#x\n",
 			&priv->adsp->pa_dram, priv->adsp->dramsize);
-- 
2.18.0

