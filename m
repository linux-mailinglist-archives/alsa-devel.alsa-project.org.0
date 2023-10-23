Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 741537D39A9
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 16:41:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB292A4C;
	Mon, 23 Oct 2023 16:40:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB292A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698072064;
	bh=RwY3dDLpeAesLaiZlzIUY7BoWh1b7beYCEgejVK43Y8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aFzWEEq293aH4sIL4m7JZk6xCj0pCK4Q/QuAzeNF+UUFBD8F30PPAtA81wUjlvP65
	 8QXP08P0yVEY0Blrw7k10eUTiTGR87Fxyam/k2ukLFgOgrNyc0uAErSsvKIpENMmIU
	 z34pW/LYxzF06pE+3IAOv/bNLaIFBBf8IITNS/5E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74BC6F805AB; Mon, 23 Oct 2023 16:39:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A9564F80579;
	Mon, 23 Oct 2023 16:39:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 820C6F8061E; Mon, 23 Oct 2023 11:55:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1536F8060C
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 11:55:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1536F8060C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=XA0HCV06
X-UUID: 44c815d8718a11eea33bb35ae8d461a2-20231023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Jkw7gW1AVmrX/Nr58wDn+UzhFqI704qvqC+4AjLfSfk=;
	b=XA0HCV06g16G5cGuD7lwpieNY/w9MmEQD40b36NsbEBaDZcQQJphhre0qOIktGsewPPzD7H2wdInihYEfx0zjMBDwNpWHl39jFMfx6EdO5qrQ+vbnxAGHfHX8jYOxrG9K5BbXP04mFRcZwI9ZpRUevLfxKcXFO9IDyaL+DQemH0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:be9aa962-ec20-4742-a659-0ddef35e5e58,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:c8550b7d-ccd9-4df5-91ce-9df5fea3ae01,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 44c815d8718a11eea33bb35ae8d461a2-20231023
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com
	(envelope-from <maso.huang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1444177331; Mon, 23 Oct 2023 17:55:16 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Oct 2023 17:55:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Oct 2023 17:55:15 +0800
From: Maso Huang <maso.huang@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Maso Huang <maso.huang@mediatek.com>
Subject: [PATCH 2/2] ASoC: mediatek: mt7986: add sample rate checker
Date: Mon, 23 Oct 2023 17:54:53 +0800
Message-ID: <20231023095453.4860-3-maso.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231023095453.4860-1-maso.huang@mediatek.com>
References: <20231023095453.4860-1-maso.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.222300-8.000000
X-TMASE-MatchedRID: xvSVK/1RoEatDMl6rQjWQgPZZctd3P4B9DuzN5Up01sOUs4CTUgKyzDK
	cAWm/vH3OfAiJ/eonC1mJS6k736MTF+1yB6ph7kzngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPI34T
	9cYMsdwzHaTdqG3iWhhuHbDe2QawKVRjg2m4p6wZby31Am35MsCb7uY8ruzzlbTNil8EW6FkBjo
	g7tEcVQ80AvBonNwk5yqhYRUc589COh+wyNBrFXDJiNuKohDcKzKSG3JdyKAPqtV2AGMNPaiHWP
	YzouJUy
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.222300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 
 4D0FF03452DC1FE5C8A4082C1A7BBA4D960451FB6C3A5B663ADC3AABEF886F3E2000:8
X-MailFrom: maso.huang@mediatek.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: LKNBEJ4BCUNH4EEJZRM4YT5HHYKAEM2U
X-Message-ID-Hash: LKNBEJ4BCUNH4EEJZRM4YT5HHYKAEM2U
X-Mailman-Approved-At: Mon, 23 Oct 2023 14:39:47 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LKNBEJ4BCUNH4EEJZRM4YT5HHYKAEM2U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

mt7986 only supports 8/12/16/24/32/48/96/192 kHz

Signed-off-by: Maso Huang <maso.huang@mediatek.com>
---
 sound/soc/mediatek/mt7986/mt7986-dai-etdm.c | 22 +++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c b/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
index e523d33846fe..270852ce3dd9 100644
--- a/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
+++ b/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
@@ -237,12 +237,26 @@ static int mtk_dai_etdm_hw_params(struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params *params,
 				  struct snd_soc_dai *dai)
 {
+	unsigned int rate = params_rate(params);
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 
-	mtk_dai_etdm_config(afe, params, dai, SNDRV_PCM_STREAM_PLAYBACK);
-	mtk_dai_etdm_config(afe, params, dai, SNDRV_PCM_STREAM_CAPTURE);
-
-	return 0;
+	switch (rate) {
+	case 8000:
+	case 12000:
+	case 16000:
+	case 24000:
+	case 32000:
+	case 48000:
+	case 96000:
+	case 192000:
+		mtk_dai_etdm_config(afe, params, dai, SNDRV_PCM_STREAM_PLAYBACK);
+		mtk_dai_etdm_config(afe, params, dai, SNDRV_PCM_STREAM_CAPTURE);
+		return 0;
+	default:
+		dev_warn(afe->dev, "%s(), sample rate: %d is not supported\n", __func__, rate);
+		dev_warn(afe->dev, "%s(), only support 8/12/16/24/32/48/96/192 kHz\n", __func__);
+		return -EINVAL;
+	}
 }
 
 static int mtk_dai_etdm_trigger(struct snd_pcm_substream *substream, int cmd,
-- 
2.18.0

