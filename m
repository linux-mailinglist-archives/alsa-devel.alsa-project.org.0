Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E21A76DFC0
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Aug 2023 07:28:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D7F7827;
	Thu,  3 Aug 2023 07:27:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D7F7827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691040495;
	bh=Wo96png5gUNb6mAW956Rv6eclPZPp01C1ES3D4kagA8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o6EaJPZRCUWzhFNwL/mcLoXsejKRg3DX3Gqs9b/AyuoUKxRvo0jjH6uqOB88Dv53e
	 nJJNn1QBhi7U670h29oafJK55t04aexRxzVBTQpd606t7AGDTd6sZ9hUbfVlMxW+ma
	 Lt8HFd186CgOebBB49j6ECrEOI9JFGog9VaeYJYY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43142F8055C; Thu,  3 Aug 2023 07:26:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A06C4F80549;
	Thu,  3 Aug 2023 07:26:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E86DF80552; Thu,  3 Aug 2023 07:26:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 79B6FF80087
	for <alsa-devel@alsa-project.org>; Thu,  3 Aug 2023 07:26:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79B6FF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=thj0WQaA
X-UUID: 4190a4b831be11ee9cb5633481061a41-20230803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=hdNd2iI6usUvtg78EpNlNcTUjKwOmFIOsg/VjAsZyFk=;
	b=thj0WQaAIzC2LPMGC89DToJ1GswKsRqFzw2Cmb28nM3aV331DFs/IrtNL/PK7lWJZciWvLvW2i98g6LrL76cqA1UCM0f9ifUVsgz5/0DP52Kdh0wazAxUmm/uJGEW2o64jaM15W6gRCCfK3sFXVyzT+mVdG3GRZEmnTY28vK/+M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:cbf08971-f146-4b4e-9c4f-db9ac12cea96,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:1fcc6f8,CLOUDID:b7cbd6a0-0933-4333-8d4f-6c3c53ebd55b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4190a4b831be11ee9cb5633481061a41-20230803
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1546330044; Thu, 03 Aug 2023 13:26:10 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 3 Aug 2023 13:26:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 3 Aug 2023 13:26:09 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/3] ASoC: mediatek: common: revise SOF common code
Date: Thu, 3 Aug 2023 13:26:06 +0800
Message-ID: <20230803052607.25843-3-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230803052607.25843-1-trevor.wu@mediatek.com>
References: <20230803052607.25843-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Message-ID-Hash: DTFVA4TNASHBHOZHKWS7IBU4R66YQBGR
X-Message-ID-Hash: DTFVA4TNASHBHOZHKWS7IBU4R66YQBGR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DTFVA4TNASHBHOZHKWS7IBU4R66YQBGR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Originally, normal dai link fixup callback is overwritten by sof fixup
callback on mtk_sof_card_late_probe and it relies on the mapping defined
on struct sof_conn_stream.

It's not flexible. When a new hardware connection is adopted, user needs
to update struct sof_conn_stream defined in machine driver which is used
to specify the mapping relationship of normal BE and SOF BE.

In the patch, mtk_sof_check_tplg_be_dai_link_fixup() is introduced for
all normal BEs. In mtk_sof_late_probe, back up normal BE fixup if it
exists and then overwrite be_hw_params_fixup by the new callback.

There are two cases for FE and BE connection.

case 1:
SOF FE -> normal BE
       -> SOF_BE

case 2:
normal FE -> normal BE

In the new fixup callback, it tries to find SOF_BE which connects to the
same FE, and then reuses the fixup of SOF_BE. If no SOF_BE exists,
it must be case 2, so rollback to the original fixup if it exists.

As a result, the predefined relation is not needed anymore. Hardware
connection can be controlled by the mixer control for AFE interconn.
Then, DPCM finds the BE mapping at runtime.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 .../soc/mediatek/common/mtk-dsp-sof-common.c  | 106 +++++++++++++++---
 .../soc/mediatek/common/mtk-dsp-sof-common.h  |   8 ++
 2 files changed, 99 insertions(+), 15 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-dsp-sof-common.c b/sound/soc/mediatek/common/mtk-dsp-sof-common.c
index 6fef16306f74..3fb193c1f0d9 100644
--- a/sound/soc/mediatek/common/mtk-dsp-sof-common.c
+++ b/sound/soc/mediatek/common/mtk-dsp-sof-common.c
@@ -54,6 +54,8 @@ int mtk_sof_card_probe(struct snd_soc_card *card)
 {
 	int i;
 	struct snd_soc_dai_link *dai_link;
+	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
+	struct mtk_sof_priv *sof_priv = soc_card_data->sof_priv;
 
 	/* Set stream_name to help sof bind widgets */
 	for_each_card_prelinks(card, i, dai_link) {
@@ -61,10 +63,74 @@ int mtk_sof_card_probe(struct snd_soc_card *card)
 			dai_link->stream_name = dai_link->name;
 	}
 
+	INIT_LIST_HEAD(&sof_priv->dai_link_list);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mtk_sof_card_probe);
 
+/* fixup the BE DAI link to match any values from topology */
+static int mtk_sof_check_tplg_be_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
+						struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
+	struct mtk_sof_priv *sof_priv = soc_card_data->sof_priv;
+	struct snd_soc_pcm_runtime *fe;
+	struct snd_soc_pcm_runtime *be;
+	struct snd_soc_dai_link *sof_dai_link = NULL;
+	struct mtk_dai_link *dai_link;
+	struct snd_soc_dpcm *dpcm;
+	int i, stream;
+	int ret = 0;
+
+	for_each_pcm_streams(stream) {
+		fe = NULL;
+		for_each_dpcm_fe(rtd, stream, dpcm) {
+			fe = dpcm->fe;
+			if (fe)
+				break;
+		}
+
+		if (!fe)
+			continue;
+
+		for_each_dpcm_be(fe, stream, dpcm) {
+			be = dpcm->be;
+			if (be == rtd)
+				continue;
+
+			for (i = 0; i < sof_priv->num_streams; i++) {
+				const struct sof_conn_stream *conn = &sof_priv->conn_streams[i];
+
+				if (!strcmp(be->dai_link->name, conn->sof_link)) {
+					sof_dai_link = be->dai_link;
+					goto FIXUP;
+				}
+			}
+		}
+	}
+
+FIXUP:
+	if (sof_dai_link) {
+		if (sof_priv->sof_dai_link_fixup)
+			ret = sof_priv->sof_dai_link_fixup(rtd, params);
+		else if (sof_dai_link->be_hw_params_fixup)
+			ret = sof_dai_link->be_hw_params_fixup(be, params);
+	} else {
+		list_for_each_entry(dai_link, &sof_priv->dai_link_list, list) {
+			if (strcmp(dai_link->name, rtd->dai_link->name) == 0) {
+				if (dai_link->be_hw_params_fixup)
+					ret = dai_link->be_hw_params_fixup(rtd, params);
+
+				break;
+			}
+		}
+	}
+
+	return ret;
+}
+
 int mtk_sof_card_late_probe(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd;
@@ -72,6 +138,8 @@ int mtk_sof_card_late_probe(struct snd_soc_card *card)
 	struct mtk_soc_card_data *soc_card_data =
 		snd_soc_card_get_drvdata(card);
 	struct mtk_sof_priv *sof_priv = soc_card_data->sof_priv;
+	struct snd_soc_dai_link *dai_link;
+	struct mtk_dai_link *mtk_dai_link;
 	int i;
 
 	/* 1. find sof component */
@@ -86,25 +154,37 @@ int mtk_sof_card_late_probe(struct snd_soc_card *card)
 		return 0;
 	}
 
-	/* 2. add route path and fixup callback */
+	/* 2. overwrite all BE fixups, and backup the existing fixup */
+	for_each_card_prelinks(card, i, dai_link) {
+		if (dai_link->be_hw_params_fixup) {
+			mtk_dai_link = devm_kzalloc(card->dev,
+						    sizeof(*mtk_dai_link),
+						    GFP_KERNEL);
+			if (!mtk_dai_link)
+				return -ENOMEM;
+
+			mtk_dai_link->be_hw_params_fixup = dai_link->be_hw_params_fixup;
+			mtk_dai_link->name = dai_link->name;
+
+			list_add(&mtk_dai_link->list, &sof_priv->dai_link_list);
+		}
+
+		if (dai_link->no_pcm)
+			dai_link->be_hw_params_fixup = mtk_sof_check_tplg_be_dai_link_fixup;
+	}
+
+	/* 3. add route path and SOF_BE fixup callback */
 	for (i = 0; i < sof_priv->num_streams; i++) {
 		const struct sof_conn_stream *conn = &sof_priv->conn_streams[i];
 		struct snd_soc_pcm_runtime *sof_rtd = NULL;
-		struct snd_soc_pcm_runtime *normal_rtd = NULL;
 
 		for_each_card_rtds(card, rtd) {
 			if (!strcmp(rtd->dai_link->name, conn->sof_link)) {
 				sof_rtd = rtd;
-				continue;
-			}
-			if (!strcmp(rtd->dai_link->name, conn->normal_link)) {
-				normal_rtd = rtd;
-				continue;
-			}
-			if (normal_rtd && sof_rtd)
 				break;
+			}
 		}
-		if (normal_rtd && sof_rtd) {
+		if (sof_rtd) {
 			int j;
 			struct snd_soc_dai *cpu_dai;
 
@@ -131,13 +211,9 @@ int mtk_sof_card_late_probe(struct snd_soc_card *card)
 				}
 			}
 
+			/* overwrite SOF BE fixup */
 			sof_rtd->dai_link->be_hw_params_fixup =
 				sof_comp->driver->be_hw_params_fixup;
-			if (sof_priv->sof_dai_link_fixup)
-				normal_rtd->dai_link->be_hw_params_fixup =
-					sof_priv->sof_dai_link_fixup;
-			else
-				normal_rtd->dai_link->be_hw_params_fixup = mtk_sof_dai_link_fixup;
 		}
 	}
 
diff --git a/sound/soc/mediatek/common/mtk-dsp-sof-common.h b/sound/soc/mediatek/common/mtk-dsp-sof-common.h
index dd38c4a93574..4bc5e1c0c8ed 100644
--- a/sound/soc/mediatek/common/mtk-dsp-sof-common.h
+++ b/sound/soc/mediatek/common/mtk-dsp-sof-common.h
@@ -18,11 +18,19 @@ struct sof_conn_stream {
 	int stream_dir;
 };
 
+struct mtk_dai_link {
+	const char *name;
+	int (*be_hw_params_fixup)(struct snd_soc_pcm_runtime *rtd,
+				  struct snd_pcm_hw_params *params);
+	struct list_head list;
+};
+
 struct mtk_sof_priv {
 	const struct sof_conn_stream *conn_streams;
 	int num_streams;
 	int (*sof_dai_link_fixup)(struct snd_soc_pcm_runtime *rtd,
 				  struct snd_pcm_hw_params *params);
+	struct list_head dai_link_list;
 };
 
 int mtk_sof_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
-- 
2.18.0

