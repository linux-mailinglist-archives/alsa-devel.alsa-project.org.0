Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D497D4AD7
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Oct 2023 10:49:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A23EDE5;
	Tue, 24 Oct 2023 10:48:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A23EDE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698137381;
	bh=JPs1KLu0WRdYJlmRszBJsFuKVbjuK2aTEu2v7DlZtbQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EtqSeolUStXEP2Du+y5yGs7i76E0P62HhL+4kKZ4NLTN0HfoN4e7ut4z1XgTArPVN
	 rJBCOMfyNhwEFxQmY8YbjpbxzODloPGg8OdBgVGf2NHOmMA6avqtFBaDBUF+E8fqgE
	 720xFmH5wcOlAVGGc6s64tRd8ThC6pDYsM0PBAgQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45357F805B4; Tue, 24 Oct 2023 10:47:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CFB7F805AE;
	Tue, 24 Oct 2023 10:47:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DE75F80157; Tue, 24 Oct 2023 05:51:56 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2FD9CF8019B
	for <alsa-devel@alsa-project.org>; Tue, 24 Oct 2023 05:51:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FD9CF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=ZAtbjqhL
X-UUID: 86e65fba722011eea33bb35ae8d461a2-20231024
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Hzi+kjq1QCG+TxJwfKjMZ8NZ7VLcxkHOjhgyuRv3grs=;
	b=ZAtbjqhLEC3Phj/sfE1wRmh7bYNDNxDQDQabtBKbODJfpmQkSqAbe7YLSOCz1/2tStXGtxgmFew7lArJYnNG1eS+NZIp6Mo44oeKdiQbZ4B+tDg8l+qplYQ0Nq8kurcegbjaYAr1x/n70y7HMAH7gzidwsF4mRHVsZup+q1xYZU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:24b6c52f-7136-465e-bf3f-a467d2bd27cb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:c4153dd7-04a0-4e50-8742-3543eab8cb8e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 86e65fba722011eea33bb35ae8d461a2-20231024
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com
	(envelope-from <maso.huang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1219510997; Tue, 24 Oct 2023 11:50:52 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 24 Oct 2023 11:50:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 24 Oct 2023 11:50:50 +0800
From: Maso Huang <maso.huang@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Maso Huang <maso.huang@mediatek.com>
Subject: [PATCH v2 3/3] ASoC: mediatek: mt7986: add sample rate checker
Date: Tue, 24 Oct 2023 11:50:19 +0800
Message-ID: <20231024035019.11732-4-maso.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231024035019.11732-1-maso.huang@mediatek.com>
References: <20231024035019.11732-1-maso.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.254500-8.000000
X-TMASE-MatchedRID: WkwGkWg/ZspKHSI+NapVgED6z8N1m1ALjZfFaL+4qfbfUZT83lbkEEFN
	G6vV64NpO3riJykx75rW3uke8Pv2jOF/B1jEjV+6syw+ZJnFumSO7tU+Bv65zZsoi2XrUn/Jn6K
	dMrRsL14qtq5d3cxkNRqXnrxrKCOXCZj5fT4j8U275XnfFOTeSbM3sLfmvJJnL8byqNXfKSxrcR
	mc7SDNwoCTKY6V6aLxs+jdM0RxJufk5os5jdQqLeFh/bIV6nmTF0aD5ljt43pMcHZD6gqu7wxMj
	fifIXfowkvVoA11Twp+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.254500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 
 D6FCDEDC649C83FF83C52FDACE0A28DEEB531C3639EE048AE42732BB07E90FCF2000:8
X-MailFrom: maso.huang@mediatek.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6BEBQWYCVT2ZRBOR6WQMB3JAPZRX3E6X
X-Message-ID-Hash: 6BEBQWYCVT2ZRBOR6WQMB3JAPZRX3E6X
X-Mailman-Approved-At: Tue, 24 Oct 2023 08:47:23 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6BEBQWYCVT2ZRBOR6WQMB3JAPZRX3E6X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

mt7986 only supports 8/12/16/24/32/48/96/192 kHz

Signed-off-by: Maso Huang <maso.huang@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt7986/mt7986-dai-etdm.c | 23 +++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c b/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
index e523d33846fe..d57971413a04 100644
--- a/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
+++ b/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
@@ -237,12 +237,27 @@ static int mtk_dai_etdm_hw_params(struct snd_pcm_substream *substream,
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
+		dev_err(afe->dev,
+			"Sample rate %d invalid. Supported rates: 8/12/16/24/32/48/96/192 kHz\n",
+			rate);
+		return -EINVAL;
+	}
 }
 
 static int mtk_dai_etdm_trigger(struct snd_pcm_substream *substream, int cmd,
-- 
2.18.0

