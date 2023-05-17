Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAB0706727
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 13:53:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 752DD1F7;
	Wed, 17 May 2023 13:53:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 752DD1F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684324435;
	bh=3qCdv1l2O09l8fy0bAYPNBIHMs36jBB+aD28b4tMfWY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ndilIOL7UbQoOwZF8HzSudAdfQ64GlWKiWNF6SzHmCBPYXwehI9Cxwacvc8k/hwIL
	 YJLnLWLvWsu6pHXwUen3QFEFw6hXNetgR3ZHRYRw2X3p7L+GTLfH4b4h6EKq556ZRB
	 ly+aHzIczx5eQg7ewe81Japa12zN5CnUc1tFaPvY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C2B9F80272; Wed, 17 May 2023 13:52:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CAFEF8025A;
	Wed, 17 May 2023 13:52:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88651F80542; Wed, 17 May 2023 13:52:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	RDNS_NONE,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B07A7F8016D
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 13:52:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B07A7F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=BUhnGqxX
X-UUID: 4885ce62f4a911ed9cb5633481061a41-20230517
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=lEcK41cF/2ml3/KbufJ41Q6kgd0u5/fZkFnkmWvxe/c=;
	b=BUhnGqxXmfJyc6OrXUX1LjNiLjBF4Wwe3n1f/iTGmQY18ctfGdAlIl39nEfy4QU/NwYXkPTqDzznhuAiSHIFTk7+aFIvEl06BImmS2XH77IJdyJKRCcVObiLMxbcrkVBv6PbtWNp5mbME/8mLJ1QnFbRQpjJYNNxZM65ykz/eHM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:b7775018-44d5-4310-8b9c-10479ed74075,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:751c26c1-e32c-4c97-918d-fbb3fc224d4e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 4885ce62f4a911ed9cb5633481061a41-20230517
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1937854713; Wed, 17 May 2023 19:52:22 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 17 May 2023 19:52:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 17 May 2023 19:52:20 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <bicycle.tsai@mediatek.com>,
	<ting-fang.hou@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [RESEND 4/4] ASoC: mediatek: mt6359: update route for lineout mux
Date: Wed, 17 May 2023 19:52:19 +0800
Message-ID: <20230517115219.532-5-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230517115219.532-1-trevor.wu@mediatek.com>
References: <20230517115219.532-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Message-ID-Hash: ONRWC7WH4SX4LAYM3UF6SP4CPZ5HY526
X-Message-ID-Hash: ONRWC7WH4SX4LAYM3UF6SP4CPZ5HY526
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ONRWC7WH4SX4LAYM3UF6SP4CPZ5HY526/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Originally, lineout playback source can only be DAC_3RD. Some SoC
masters only support stereo MTKAIF outputs, so lineout path can't be
used in such case.

MTKAIF connections are as follows.
MOSI0 -> DAC_L
MOSI1 -> DAC_R
MOSI2 -> DAC_3rd

In the patch, lineout playback source can be chosen between DAC_L and
DAC_3rd, so sound can be outputted via lineout even though SoC only
supports stereo MTKAIF outputs.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/codecs/mt6359.c | 44 +++++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/mt6359.c b/sound/soc/codecs/mt6359.c
index a37ad61a8253..30690479ec17 100644
--- a/sound/soc/codecs/mt6359.c
+++ b/sound/soc/codecs/mt6359.c
@@ -1159,9 +1159,10 @@ static int mt_lo_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
+	unsigned int mux = dapm_kcontrol_get_value(w->kcontrols[0]);
 
 	dev_dbg(priv->dev, "%s(), event 0x%x, mux %u\n",
-		__func__, event, dapm_kcontrol_get_value(w->kcontrols[0]));
+		__func__, event, mux);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -1199,14 +1200,29 @@ static int mt_lo_event(struct snd_soc_dapm_widget *w,
 		/* Enable AUD_CLK */
 		mt6359_set_decoder_clk(priv, true);
 
-		/* Enable Audio DAC (3rd DAC) */
-		regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON7, 0x3113);
-		/* Enable low-noise mode of DAC */
-		if (priv->dev_counter[DEVICE_HP] == 0)
-			regmap_write(priv->regmap,
-				     MT6359_AUDDEC_ANA_CON9, 0x0001);
-		/* Switch LOL MUX to audio 3rd DAC */
-		regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON7, 0x311b);
+		/* Switch LOL MUX to audio DAC */
+		if (mux == LO_MUX_L_DAC) {
+			if (priv->dev_counter[DEVICE_HP] > 0) {
+				dev_info(priv->dev, "%s(), can not enable DAC, hp count %d\n",
+					 __func__, priv->dev_counter[DEVICE_HP]);
+				break;
+			}
+			/* Enable DACL and switch HP MUX to open*/
+			regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON0, 0x3009);
+			/* Disable low-noise mode of DAC */
+			regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON9, 0xf200);
+			usleep_range(100, 120);
+			/* Switch LOL MUX to DACL */
+			regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON7, 0x0117);
+		} else if (mux == LO_MUX_3RD_DAC) {
+			/* Enable Audio DAC (3rd DAC) */
+			regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON7, 0x3113);
+			/* Enable low-noise mode of DAC */
+			if (priv->dev_counter[DEVICE_HP] == 0)
+				regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON9, 0x0001);
+			/* Switch LOL MUX to audio 3rd DAC */
+			regmap_write(priv->regmap, MT6359_AUDDEC_ANA_CON7, 0x311b);
+		}
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
 		/* Switch LOL MUX to open */
@@ -1218,6 +1234,15 @@ static int mt_lo_event(struct snd_soc_dapm_widget *w,
 		regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON0,
 				   0x000f, 0x0000);
 
+		if (mux == LO_MUX_L_DAC) {
+			/* Disable HP driver core circuits */
+			regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON0,
+					   0x3 << 4, 0x0);
+			/* Disable HP driver bias circuits */
+			regmap_update_bits(priv->regmap, MT6359_AUDDEC_ANA_CON0,
+					   0x3 << 6, 0x0);
+		}
+
 		/* Disable AUD_CLK */
 		mt6359_set_decoder_clk(priv, false);
 
@@ -2590,6 +2615,7 @@ static const struct snd_soc_dapm_route mt6359_dapm_routes[] = {
 
 	/* Lineout Path */
 	{"LOL Mux", "Playback", "DAC_3RD"},
+	{"LOL Mux", "Playback_L_DAC", "DACL"},
 	{"LINEOUT L", NULL, "LOL Mux"},
 
 	/* Headphone Path */
-- 
2.18.0

