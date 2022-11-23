Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAD6636581
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Nov 2022 17:13:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D01DF168B;
	Wed, 23 Nov 2022 17:12:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D01DF168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669219987;
	bh=1lVDTHpf2Z+zb8tzmKQlKvO5WDbDV+2VKKugxC60jZI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lEeNnxSuh3R4ElqlXMDf/sxQaEyYo260toQVMGElVpqUkrNDhgUn0GtbXuuIRC/+3
	 R0OTy6EWr7CofCd+TOQNlY3lNUP3UAlrNcMt1Cjy7rQ/DraXBBaGVLNxP+fh9P+tx9
	 N5/SMZZ/5BcZtLvFEEdUPLX1kN2zQodszdQ2mLNg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C18CF8030F;
	Wed, 23 Nov 2022 17:12:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C2ABF8025D; Wed, 23 Nov 2022 17:12:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 760A8F80115
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 17:12:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 760A8F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="p4VLr+SE"
X-UUID: 15bada5f46b14464b981ddf348d3374c-20221124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=8A6kZpQfDSl4/cDetG79790P+krnVeu6HEhxkBieDgQ=; 
 b=p4VLr+SEgq4FNws4k6TiIj1/SAWT06UCAxf1xMFl3+8OFK+q55khJU/LT5BTeAfrnJU05/WeqEZ6K91b6IqeJxUnVVodTaYmoEXOEBZO9cVAWTCSKVkSd6LyBzY7vTEQs8SnMNptS2GTInXdIlA9NvVSar46eSmcZ91CbO8/0m8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12, REQID:24d7345d-3e86-40db-ac70-42190bcfc3b8, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:62cd327, CLOUDID:d0e5a02f-2938-482e-aafd-98d66723b8a9,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 15bada5f46b14464b981ddf348d3374c-20221124
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 209792170; Thu, 24 Nov 2022 00:11:34 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 24 Nov 2022 00:11:33 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via
 Frontend Transport; Thu, 24 Nov 2022 00:11:32 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <angelogioacchino.delregno@collabora.com>,
 <nfraprado@collabora.com>
Subject: [PATCH] ASoC: mediatek: mt8186: Correct I2S shared clocks
Date: Thu, 24 Nov 2022 00:11:30 +0800
Message-ID: <20221123161130.543-1-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
Cc: alsa-devel@alsa-project.org, chunxu.li@mediatek.com,
 linux-kernel@vger.kernel.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, ajye_huang@compal.corp-partner.google.com,
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

In mt8186 platform, I2S2 should be the main I2S port that will provide the
clock, on the contrary I2S3 should be the second I2S port that will use
this clock.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c | 2 +-
 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
index d8c93d66b4e6..970b980a81e6 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
@@ -192,7 +192,7 @@ static int mt8186_mt6366_da7219_max98357_hdmi_init(struct snd_soc_pcm_runtime *r
 	struct mt8186_mt6366_da7219_max98357_priv *priv = soc_card_data->mach_priv;
 	int ret;
 
-	ret = mt8186_dai_i2s_set_share(afe, "I2S3", "I2S2");
+	ret = mt8186_dai_i2s_set_share(afe, "I2S2", "I2S3");
 	if (ret) {
 		dev_err(rtd->dev, "Failed to set up shared clocks\n");
 		return ret;
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
index e59d92e2afa3..8f77a0bc1dc8 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
@@ -260,7 +260,7 @@ static int mt8186_mt6366_rt1019_rt5682s_hdmi_init(struct snd_soc_pcm_runtime *rt
 	struct mt8186_mt6366_rt1019_rt5682s_priv *priv = soc_card_data->mach_priv;
 	int ret;
 
-	ret = mt8186_dai_i2s_set_share(afe, "I2S3", "I2S2");
+	ret = mt8186_dai_i2s_set_share(afe, "I2S2", "I2S3");
 	if (ret) {
 		dev_err(rtd->dev, "Failed to set up shared clocks\n");
 		return ret;
-- 
2.18.0

