Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 638F420343
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 12:17:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFA3B16CE;
	Thu, 16 May 2019 12:16:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFA3B16CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558001841;
	bh=nAPiAGn5CfUsViIJ4SC678RziE0KrQ8KEivogtQCGTY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RaohFrykBZ6QmaqM7zIQ3ahv3VXmzaDPEH5S+gYA23FW8zSFMhqGqoPL1KNHC1qNd
	 z1rGIP9bKsPvwEc/EAITDr4/TCq9O5Wp76Mh77BxHSorEBAFm6elktEWhQAnKRImFc
	 BAUrp2OWSNCsu0uZiERQvzmnJbvHc/2buLglTnvc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20764F896B6;
	Thu, 16 May 2019 12:15:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DBB5F896B6; Thu, 16 May 2019 12:15:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_PASS,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E42EF80C18
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 12:15:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E42EF80C18
X-UUID: 516186f5294448eab4bed261ee0af6b6-20190516
X-UUID: 516186f5294448eab4bed261ee0af6b6-20190516
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <shunli.wang@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1227804446; Thu, 16 May 2019 18:15:21 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs03n2.mediatek.inc (172.21.101.182) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 16 May 2019 18:15:16 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 16 May 2019 18:15:16 +0800
From: Shunli Wang <shunli.wang@mediatek.com>
To: <broonie@kernel.org>
Date: Thu, 16 May 2019 18:15:15 +0800
Message-ID: <20190516101515.4127-1-shunli.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6AF5453248FE2E1C6E6DEC2DD50C6CDE7BF98C778BC5873F4C831E172C399DEC2000:8
X-MTK: N
Cc: alsa-devel@alsa-project.org, srv_heupstream@mediatek.com,
 garlic.tseng@mediatek.com, jiaxin.yu@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, shunli.wang@mediatek.com,
 kaichieh.chuang@mediatek.com
Subject: [alsa-devel] [PATCH] ASoC: Mediatek: MT8183: enable IIR filter
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

This patch is to enable IIR filter when DMIC of PMIC
is enabled.

Signed-off-by: Shunli Wang <shunli.wang@mediatek.com>
---
 sound/soc/mediatek/mt8183/mt8183-dai-adda.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-dai-adda.c b/sound/soc/mediatek/mt8183/mt8183-dai-adda.c
index 017d7d1d9148..2b758a18c2ea 100644
--- a/sound/soc/mediatek/mt8183/mt8183-dai-adda.c
+++ b/sound/soc/mediatek/mt8183/mt8183-dai-adda.c
@@ -176,9 +176,6 @@ static int mtk_adda_ul_event(struct snd_soc_dapm_widget *w,
 	case SND_SOC_DAPM_POST_PMD:
 		/* should delayed 1/fs(smallest is 8k) = 125us before afe off */
 		usleep_range(125, 135);
-
-		/* reset dmic */
-		afe_priv->mtkaif_dmic = 0;
 		break;
 	default:
 		break;
@@ -426,6 +423,17 @@ static int mtk_dai_adda_hw_params(struct snd_pcm_substream *substream,
 
 		ul_src_con0 |= (voice_mode << 17) & (0x7 << 17);
 
+		/* enable iir */
+		ul_src_con0 |= (1 << UL_IIR_ON_TMP_CTL_SFT) &
+			       UL_IIR_ON_TMP_CTL_MASK_SFT;
+
+		/* 35Hz @ 48k */
+		regmap_write(afe->regmap, AFE_ADDA_IIR_COEF_02_01, 0x00000000);
+		regmap_write(afe->regmap, AFE_ADDA_IIR_COEF_04_03, 0x00003FB8);
+		regmap_write(afe->regmap, AFE_ADDA_IIR_COEF_06_05, 0x3FB80000);
+		regmap_write(afe->regmap, AFE_ADDA_IIR_COEF_08_07, 0x3FB80000);
+		regmap_write(afe->regmap, AFE_ADDA_IIR_COEF_10_09, 0x0000C048);
+
 		regmap_write(afe->regmap, AFE_ADDA_UL_SRC_CON0, ul_src_con0);
 
 		/* mtkaif_rxif_data_mode = 0, amic */
-- 
2.18.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
