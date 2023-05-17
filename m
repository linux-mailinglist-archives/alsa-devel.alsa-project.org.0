Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3C370667F
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 13:18:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 816A81F4;
	Wed, 17 May 2023 13:18:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 816A81F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684322330;
	bh=wcryNFiWJ/z/dbbmDBWb8KBzJkz3XzMTOzGmAQ7cHa0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rPCsU/W1cjgocyFDmGErO8206umV9cgDraefgq+hTisz66cVn1PBc4FllEGxiPzz6
	 WKFj1pcG0zxcOOtnyZvYmykeBz8TuPsYvqFH4TVOTn1iWPoh54CNA9OyVJSYSv54KO
	 J0SOVxadayPWvOUhqYUbp/JMDrNhW1LAh4yRcoAE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDBA4F80553; Wed, 17 May 2023 13:16:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 503A1F80557;
	Wed, 17 May 2023 13:16:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B27CDF8056F; Wed, 17 May 2023 13:15:59 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 123F6F805E6
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 13:15:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 123F6F805E6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=KqEQWkKt
X-UUID: 2647466ef4a411ed9cb5633481061a41-20230517
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=r/ynvpD56p320B6BbN2gG/8wM3GbWN7STgUsQ5UpneI=;
	b=KqEQWkKtmfot8OezVMYGgucItJO8e+4KfTMamiTh2WRW7TFhhxEAw44vNmxTcKgpnMlE4Qj0Ai8LCVH3OEnmBjQ45rMvwPeqshoVb2IZ2GjIxt2tHQ+ROvaZxjrZ3XW95260edU5FuhIsXD5ueENhGQmbVQtjCnmOFbU2b5SBB0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:de3a0acb-93cc-4bd6-a18b-ecb2235d5053,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:d5b0ae3,CLOUDID:8d7825c1-e32c-4c97-918d-fbb3fc224d4e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 2647466ef4a411ed9cb5633481061a41-20230517
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 640718673; Wed, 17 May 2023 19:15:37 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 17 May 2023 19:15:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 17 May 2023 19:15:35 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 2/5] ASoC: mediatek: mt8188-mt6359: register hdmi/dp jack pins
Date: Wed, 17 May 2023 19:15:31 +0800
Message-ID: <20230517111534.32630-3-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230517111534.32630-1-trevor.wu@mediatek.com>
References: <20230517111534.32630-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Message-ID-Hash: P76HDK2KRR6CEYQVWAG7GSLJGYTCY7MO
X-Message-ID-Hash: P76HDK2KRR6CEYQVWAG7GSLJGYTCY7MO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P76HDK2KRR6CEYQVWAG7GSLJGYTCY7MO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some userspace applications need jack control events, so register hdmi
and dp jack pins to activate jack control events.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 27 +++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 833bc362dad2..6c3f36e2fffd 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -151,6 +151,20 @@ struct mt8188_mt6359_priv {
 	struct snd_soc_jack hdmi_jack;
 };
 
+static struct snd_soc_jack_pin mt8188_hdmi_jack_pins[] = {
+	{
+		.pin = "HDMI",
+		.mask = SND_JACK_LINEOUT,
+	},
+};
+
+static struct snd_soc_jack_pin mt8188_dp_jack_pins[] = {
+	{
+		.pin = "DP",
+		.mask = SND_JACK_LINEOUT,
+	},
+};
+
 struct mt8188_card_data {
 	const char *name;
 	unsigned long quirk;
@@ -159,6 +173,8 @@ struct mt8188_card_data {
 static const struct snd_soc_dapm_widget mt8188_mt6359_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_SINK("HDMI"),
+	SND_SOC_DAPM_SINK("DP"),
 };
 
 static const struct snd_kcontrol_new mt8188_mt6359_controls[] = {
@@ -396,8 +412,10 @@ static int mt8188_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 	int ret = 0;
 
-	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
-				    &priv->hdmi_jack);
+	ret = snd_soc_card_jack_new_pins(rtd->card, "HDMI Jack",
+					 SND_JACK_LINEOUT, &priv->hdmi_jack,
+					 mt8188_hdmi_jack_pins,
+					 ARRAY_SIZE(mt8188_hdmi_jack_pins));
 	if (ret) {
 		dev_info(rtd->dev, "%s, new jack failed: %d\n", __func__, ret);
 		return ret;
@@ -417,8 +435,9 @@ static int mt8188_dptx_codec_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 	int ret = 0;
 
-	ret = snd_soc_card_jack_new(rtd->card, "DP Jack", SND_JACK_LINEOUT,
-				    &priv->dp_jack);
+	ret = snd_soc_card_jack_new_pins(rtd->card, "DP Jack", SND_JACK_LINEOUT,
+					 &priv->dp_jack, mt8188_dp_jack_pins,
+					 ARRAY_SIZE(mt8188_dp_jack_pins));
 	if (ret) {
 		dev_info(rtd->dev, "%s, new jack failed: %d\n", __func__, ret);
 		return ret;
-- 
2.18.0

