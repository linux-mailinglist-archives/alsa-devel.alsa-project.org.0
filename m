Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6F340F423
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Sep 2021 10:29:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA5EE17BD;
	Fri, 17 Sep 2021 10:29:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA5EE17BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631867393;
	bh=CxNXO+K7TJhkfxtLJmRvqrFplB+0Rludjgf2OQITzQ4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W3gNhp8utIsoB4R67+XUsUMCEfORXQxbknZ6fzPIJ29DFd4u73d3gtodTdjEP8r6l
	 RO57FKzTbIJ0sOumPgvbNwnwQ9ZYrgPJ+oWaBcpSnbzeABBfg3QDFylUT/kpBGHSCB
	 84gs+/7/gLnNrWZfKM27OVJKXd+5k8BSPgJqNyiw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66D85F80227;
	Fri, 17 Sep 2021 10:28:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B159AF8027C; Fri, 17 Sep 2021 10:28:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C712AF800E3
 for <alsa-devel@alsa-project.org>; Fri, 17 Sep 2021 10:28:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C712AF800E3
X-UUID: cc715626f5e348429c5db1cec25839aa-20210917
X-UUID: cc715626f5e348429c5db1cec25839aa-20210917
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1344244907; Fri, 17 Sep 2021 16:28:08 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Sep 2021 16:28:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 17 Sep 2021 16:28:07 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>
Subject: [PATCH] ASoC: mediatek: mt8195: remove wrong fixup assignment on
 HDMITX
Date: Fri, 17 Sep 2021 16:28:05 +0800
Message-ID: <20210917082805.30898-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
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

S24_LE params fixup is only required for DPTX.
Remove fixup ops assignment for HDMITX.

Fixes: 40d605df0a7b ("ASoC: mediatek: mt8195: add machine driver with mt6359, rt1019 and rt5682")
Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
index 8cd8450409e8..a3fa8efc8f81 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
@@ -424,8 +424,8 @@ static int mt8195_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
 	return snd_soc_component_set_jack(cmpnt_codec, &priv->hdmi_jack, NULL);
 }
 
-static int mt8195_hdmitx_dptx_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
-					      struct snd_pcm_hw_params *params)
+static int mt8195_dptx_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
+				       struct snd_pcm_hw_params *params)
 
 {
 	/* fix BE i2s format to 32bit, clean param mask first */
@@ -902,7 +902,7 @@ static struct snd_soc_dai_link mt8195_mt6359_rt1019_rt5682_dai_links[] = {
 		.no_pcm = 1,
 		.dpcm_playback = 1,
 		.ops = &mt8195_dptx_ops,
-		.be_hw_params_fixup = mt8195_hdmitx_dptx_hw_params_fixup,
+		.be_hw_params_fixup = mt8195_dptx_hw_params_fixup,
 		SND_SOC_DAILINK_REG(DPTX_BE),
 	},
 	[DAI_LINK_ETDM1_IN_BE] = {
@@ -953,7 +953,6 @@ static struct snd_soc_dai_link mt8195_mt6359_rt1019_rt5682_dai_links[] = {
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
 		.dpcm_playback = 1,
-		.be_hw_params_fixup = mt8195_hdmitx_dptx_hw_params_fixup,
 		SND_SOC_DAILINK_REG(ETDM3_OUT_BE),
 	},
 	[DAI_LINK_PCM1_BE] = {
-- 
2.18.0

