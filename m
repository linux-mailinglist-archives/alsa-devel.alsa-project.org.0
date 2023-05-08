Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A36906FA0CE
	for <lists+alsa-devel@lfdr.de>; Mon,  8 May 2023 09:17:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5CAD12B5;
	Mon,  8 May 2023 09:16:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5CAD12B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683530258;
	bh=Z4tBksOgv07lNGSQGF4qDG7INysDetZ6nWvGqMfDxSc=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=PWdqjRXRCPiNIeI36YaMXkYDm3U8/3eQn69cO5VzyCPNvgo0O0IqXkaUFYZWiAcqM
	 9MAG/Ch1+Sxgj5p6Le+f4WK2/d3p5n96Jg/tsf3Ir0Falirv9fGjWljcw+ShT4cjkV
	 hNe5j7+65I4VsF3nJ8IWXhJs++LAUhLOS3z496ss=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A446AF804B1;
	Mon,  8 May 2023 09:16:01 +0200 (CEST)
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
Subject: [PATCH 4/4] ASoC: mediatek: mt6359: update route for lineout mux
Date: Mon, 8 May 2023 15:15:32 +0800
In-Reply-To: <20230508071532.21665-1-trevor.wu@mediatek.com>
References: <20230508071532.21665-1-trevor.wu@mediatek.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5YCZNTVGAK77KKVSCW4FAHC4BTETYDC5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168353015996.26.3933976018546066076@mailman-core.alsa-project.org>
From: Trevor Wu via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Trevor Wu <trevor.wu@mediatek.com>
Cc: trevor.wu@mediatek.com, bicycle.tsai@mediatek.com,
 ting-fang.hou@mediatek.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FFD3F80534; Mon,  8 May 2023 09:15:56 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A12CF802E8
	for <alsa-devel@alsa-project.org>; Mon,  8 May 2023 09:15:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A12CF802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=TyYwJ8pR
X-UUID: 205b3ff2ed7011ed9cb5633481061a41-20230508
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=lEcK41cF/2ml3/KbufJ41Q6kgd0u5/fZkFnkmWvxe/c=;
	b=TyYwJ8pRMlaZ/UNpzAWzR3S7Phm3ON/5qjs3e9d8o5Nlqe0Rzp7P7d4kXGR8CHyCaXTRSbHQpsMIJ8BfGqmz/xV5JBWPuunIlu7f8J2JKoAL7plhqbezjBS1rfex9ET99VCEtj8LugJO5KniYOgnqzkqIoJtoa1biwCMzGyNLes=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.23,REQID:3e99be07-dc71-48a2-bc0b-c27595f2780e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.23,REQID:3e99be07-dc71-48a2-bc0b-c27595f2780e,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:697ab71,CLOUDID:0f8f1ec0-e32c-4c97-918d-fbb3fc224d4e,B
	ulkID:2305081515373MEH8N96,BulkQuantity:0,Recheck:0,SF:19|48|38|29|28|17,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 205b3ff2ed7011ed9cb5633481061a41-20230508
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 954417772; Mon, 08 May 2023 15:15:35 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 8 May 2023 15:15:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 8 May 2023 15:15:34 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
Subject: [PATCH 4/4] ASoC: mediatek: mt6359: update route for lineout mux
Date: Mon, 8 May 2023 15:15:32 +0800
Message-ID: <20230508071532.21665-5-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230508071532.21665-1-trevor.wu@mediatek.com>
References: <20230508071532.21665-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Message-ID-Hash: 5YCZNTVGAK77KKVSCW4FAHC4BTETYDC5
X-Message-ID-Hash: 5YCZNTVGAK77KKVSCW4FAHC4BTETYDC5
X-MailFrom: trevor.wu@mediatek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: trevor.wu@mediatek.com, bicycle.tsai@mediatek.com,
 ting-fang.hou@mediatek.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5YCZNTVGAK77KKVSCW4FAHC4BTETYDC5/>
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

