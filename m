Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F5B6EEDC3
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Apr 2023 07:53:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E16C21105;
	Wed, 26 Apr 2023 07:52:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E16C21105
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682488402;
	bh=zaPAmy253G5kd6QSiaU9sw2qCB6gEYc7IjJjMSlJYxw=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=joyoeoS18DQ2w7lVLarHeESB0h63kdDaC/gbt5Xt9rg1M7VkVfVsrJ2q594AomccK
	 7iVi9Bqnz97DfbQsa3ETmhTzcgVBeHrHHNmZO65bhxG2s53STbqHV/JXr5UQdFSFpn
	 A9sxycXtiiycH+nnxQ3WVAffOnH8YzRLlQka9pbk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E542CF8025F;
	Wed, 26 Apr 2023 07:51:46 +0200 (CEST)
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 5/7] ASoC: mediatek: mt8188: combine afe component
 registration
Date: Wed, 26 Apr 2023 13:51:22 +0800
In-Reply-To: <20230426055124.16529-1-trevor.wu@mediatek.com>
References: <20230426055124.16529-1-trevor.wu@mediatek.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VSWOZEXZ7W47YG2AZSG6CNZP57ASKKDN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168248830585.26.15572953776283528063@mailman-core.alsa-project.org>
From: Trevor Wu via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Trevor Wu <trevor.wu@mediatek.com>
Cc: trevor.wu@mediatek.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E595F80534; Wed, 26 Apr 2023 07:51:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	RDNS_NONE,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83B78F80236
	for <alsa-devel@alsa-project.org>; Wed, 26 Apr 2023 07:51:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83B78F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=kiIuCLck
X-UUID: 6235f4eae3f611edb6b9f13eb10bd0fe-20230426
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=iQxj2f8v6Hq2mM43K9p34deiZ+cOeCScETZMUSLPaL4=;
	b=kiIuCLckKOtluUlWv9w4O4pYIjgeulrzYmF4cPXRtyUKiaVwDFA8cgGFg8PQa6Ar6YgUEScvWvV1/5QaNCZtCElkmeBfrb56GJoKOZo5/GXDyXdgH9voY9v93e3kdQfcy5FP5QTSikif4aDrFCAi7hb41++RjJ8+4EM67saR1J8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:1d5a1158-31ac-4a8f-b758-8bc7bd345983,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.22,REQID:1d5a1158-31ac-4a8f-b758-8bc7bd345983,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:120426c,CLOUDID:5c472dec-db6f-41fe-8b83-13fe7ed1ef52,B
	ulkID:230426135128WJPHPIVF,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 6235f4eae3f611edb6b9f13eb10bd0fe-20230426
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 792603456; Wed, 26 Apr 2023 13:51:26 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 26 Apr 2023 13:51:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 26 Apr 2023 13:51:26 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 5/7] ASoC: mediatek: mt8188: combine afe component
 registration
Date: Wed, 26 Apr 2023 13:51:22 +0800
Message-ID: <20230426055124.16529-6-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230426055124.16529-1-trevor.wu@mediatek.com>
References: <20230426055124.16529-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Message-ID-Hash: VSWOZEXZ7W47YG2AZSG6CNZP57ASKKDN
X-Message-ID-Hash: VSWOZEXZ7W47YG2AZSG6CNZP57ASKKDN
X-MailFrom: trevor.wu@mediatek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: trevor.wu@mediatek.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VSWOZEXZ7W47YG2AZSG6CNZP57ASKKDN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is no benefit to separate two components for AFE, so DAI driver
registration is moved to dev_snd_soc_register_component to merge these
two components.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 37 ++--------------------
 1 file changed, 2 insertions(+), 35 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index e5f9373bed56..fecc891f892d 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -1898,10 +1898,6 @@ static const struct snd_kcontrol_new mt8188_memif_controls[] = {
 			    MT8188_AFE_MEMIF_UL10),
 };
 
-static const struct snd_soc_component_driver mt8188_afe_pcm_dai_component = {
-	.name = "mt8188-afe-pcm-dai",
-};
-
 static const struct mtk_base_memif_data memif_data[MT8188_AFE_MEMIF_NUM] = {
 	[MT8188_AFE_MEMIF_DL2] = {
 		.name = "DL2",
@@ -3142,9 +3138,8 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct mtk_base_afe *afe;
 	struct mt8188_afe_private *afe_priv;
 	struct device *dev;
-	int i, irq_id, ret;
-	struct snd_soc_component *component;
 	struct reset_control *rstc;
+	int i, irq_id, ret;
 
 	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(33));
 	if (ret)
@@ -3280,34 +3275,12 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* register component */
 	ret = devm_snd_soc_register_component(dev, &mt8188_afe_component,
-					      NULL, 0);
+					      afe->dai_drivers, afe->num_dai_drivers);
 	if (ret) {
 		dev_warn(dev, "err_platform\n");
 		goto err_pm_put;
 	}
 
-	component = devm_kzalloc(&pdev->dev, sizeof(*component), GFP_KERNEL);
-	if (!component) {
-		ret = -ENOMEM;
-		goto err_pm_put;
-	}
-
-	ret = snd_soc_component_initialize(component,
-					   &mt8188_afe_pcm_dai_component,
-					   &pdev->dev);
-	if (ret)
-		goto err_pm_put;
-#ifdef CONFIG_DEBUG_FS
-	component->debugfs_prefix = "pcm";
-#endif
-	ret = snd_soc_add_component(component,
-				    afe->dai_drivers,
-				    afe->num_dai_drivers);
-	if (ret) {
-		dev_warn(dev, "err_add_component\n");
-		goto err_pm_put;
-	}
-
 	mt8188_afe_init_registers(afe);
 
 	pm_runtime_put_sync(&pdev->dev);
@@ -3323,11 +3296,6 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static void mt8188_afe_pcm_dev_remove(struct platform_device *pdev)
-{
-	snd_soc_unregister_component(&pdev->dev);
-}
-
 static const struct of_device_id mt8188_afe_pcm_dt_match[] = {
 	{ .compatible = "mediatek,mt8188-afe", },
 	{},
@@ -3346,7 +3314,6 @@ static struct platform_driver mt8188_afe_pcm_driver = {
 		   .pm = &mt8188_afe_pm_ops,
 	},
 	.probe = mt8188_afe_pcm_dev_probe,
-	.remove_new = mt8188_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt8188_afe_pcm_driver);
-- 
2.18.0

