Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7063B7E0021
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 10:58:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF917829;
	Fri,  3 Nov 2023 10:57:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF917829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699005526;
	bh=+DAO21Vt/ubQnBX1kDNSGW+BSN/UOFPPkYEq9+UOXxQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vJKhDpCGqEE3V0NXGRJ/Yoc8MJ5B8jiqhSfBVGMVBVpvGn87sS1EUHsldzVYsGggy
	 JPjH6gVt6YzZSXbgGmLHKxDjW8hv26G1fFojNHHbquLhk3GGD9mRYNDNh08FTp9q+B
	 dKprLeobACCWFXcz/6sfsJjI1nEryqBeCt6/XgNg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E511F80494; Fri,  3 Nov 2023 10:57:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48DD4F8020D;
	Fri,  3 Nov 2023 10:57:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7A3EF80494; Fri,  3 Nov 2023 10:55:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
	RDNS_NONE,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A39B7F8020D;
	Fri,  3 Nov 2023 10:54:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A39B7F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=exflmBaW
X-UUID: 029a1fa07a2f11eea33bb35ae8d461a2-20231103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=1PNy4lQFDD/9P/cCBJ+oFYmFIxu9jH1NPA/0OOwYEBQ=;
	b=exflmBaW3pz4CX2PxrtXv6Ox93ybXp7gYvw0C2Hf/j+fmS20+kWNvHhUvRctBFoPr6UFcFvfBW/sOGZkhryEkqlFJxWagYg1nzRrrfIrNad1EdHdSzIXUoG/6C4APWhiIX3uWZB3w8lswXZMZKaTRlPBinusRfe3gTjnaSG4Cdo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:84f5920e-a7b2-4fae-8d45-4a812c825796,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:364b77b,CLOUDID:a75ea55f-c89d-4129-91cb-8ebfae4653fc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 029a1fa07a2f11eea33bb35ae8d461a2-20231103
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 859796463; Fri, 03 Nov 2023 17:54:42 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 3 Nov 2023 17:54:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 3 Nov 2023 17:54:40 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <pierre-louis.bossart@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<kai.vehmanen@linux.intel.com>, <daniel.baluta@nxp.com>,
	<broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <yc.hung@mediatek.com>,
	<sound-open-firmware@alsa-project.org>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 1/3] ASoC: SOF: mediatek: mt8195: clean up unused code
Date: Fri, 3 Nov 2023 17:54:30 +0800
Message-ID: <20231103095433.10475-2-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231103095433.10475-1-trevor.wu@mediatek.com>
References: <20231103095433.10475-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Message-ID-Hash: A746OTAEVJXTV4OFVR2746POPKWIE3KZ
X-Message-ID-Hash: A746OTAEVJXTV4OFVR2746POPKWIE3KZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A746OTAEVJXTV4OFVR2746POPKWIE3KZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Since there are some variables that are no longer being used, we remove
the code that was implemented for those variables.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
Reviewed-by: Yaochun Hung <yc.hung@mediatek.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 49 --------------------------
 1 file changed, 49 deletions(-)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index cac0a085f60a..8ee7ee246344 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -96,29 +96,6 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 	struct mtk_adsp_chip_info *adsp = data;
 	int ret;
 
-	mem_region = of_parse_phandle(dev->of_node, "memory-region", 0);
-	if (!mem_region) {
-		dev_err(dev, "no dma memory-region phandle\n");
-		return -ENODEV;
-	}
-
-	ret = of_address_to_resource(mem_region, 0, &res);
-	of_node_put(mem_region);
-	if (ret) {
-		dev_err(dev, "of_address_to_resource dma failed\n");
-		return ret;
-	}
-
-	dev_dbg(dev, "DMA %pR\n", &res);
-
-	adsp->pa_shared_dram = (phys_addr_t)res.start;
-	adsp->shared_size = resource_size(&res);
-	if (adsp->pa_shared_dram & DRAM_REMAP_MASK) {
-		dev_err(dev, "adsp shared dma memory(%#x) is not 4K-aligned\n",
-			(u32)adsp->pa_shared_dram);
-		return -EINVAL;
-	}
-
 	ret = of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_err(dev, "of_reserved_mem_device_init failed\n");
@@ -238,26 +215,6 @@ static int adsp_memory_remap_init(struct device *dev, struct mtk_adsp_chip_info
 	return 0;
 }
 
-static int adsp_shared_base_ioremap(struct platform_device *pdev, void *data)
-{
-	struct device *dev = &pdev->dev;
-	struct mtk_adsp_chip_info *adsp = data;
-
-	/* remap shared-dram base to be non-cachable */
-	adsp->shared_dram = devm_ioremap(dev, adsp->pa_shared_dram,
-					 adsp->shared_size);
-	if (!adsp->shared_dram) {
-		dev_err(dev, "failed to ioremap base %pa size %#x\n",
-			adsp->shared_dram, adsp->shared_size);
-		return -ENOMEM;
-	}
-
-	dev_dbg(dev, "shared-dram vbase=%p, phy addr :%pa,  size=%#x\n",
-		adsp->shared_dram, &adsp->pa_shared_dram, adsp->shared_size);
-
-	return 0;
-}
-
 static int mt8195_run(struct snd_sof_dev *sdev)
 {
 	u32 adsp_bootup_addr;
@@ -338,12 +295,6 @@ static int mt8195_dsp_probe(struct snd_sof_dev *sdev)
 	}
 	priv->adsp->va_dram = sdev->bar[SOF_FW_BLK_TYPE_SRAM];
 
-	ret = adsp_shared_base_ioremap(pdev, priv->adsp);
-	if (ret) {
-		dev_err(sdev->dev, "adsp_shared_base_ioremap fail!\n");
-		goto err_adsp_sram_power_off;
-	}
-
 	sdev->bar[DSP_REG_BAR] = priv->adsp->va_cfgreg;
 
 	sdev->mmio_bar = SOF_FW_BLK_TYPE_SRAM;
-- 
2.18.0

