Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8B97606EC
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 05:58:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F89DA4E;
	Tue, 25 Jul 2023 05:57:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F89DA4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690257480;
	bh=HP3Y8plnGmEq3Q6KphLv3a3rhV+I3CPBtT9bB4fYjhU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kzY98XvfiooIgiZQTCu72DqvK6sAG3hbgDiy1QA3xVdXXlrsKKb4OI4jTJFi3caJk
	 MhQGHL8arE8z2A6VWbvuP1jPds+TOzO2CsBIXQ/ytGVhDfmKH/9es44WkQ2UWjknCe
	 baEdsYeLhl8+JOcbLibrj/7pt45rYwEVGc3GYX/8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 004EEF80520; Tue, 25 Jul 2023 05:57:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3082FF80163;
	Tue, 25 Jul 2023 05:57:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9653F8019B; Tue, 25 Jul 2023 05:57:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6235AF800C7
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 05:53:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6235AF800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=ClKAgkru
X-UUID: c41d3d142a9e11eeb20a276fd37b9834-20230725
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=fAaLTgr6h+D1sKWYDX9V6S08Z+V9P+dFrkTq+4rs0u4=;
	b=ClKAgkruxMTmMBBgU0+rX5FX7BHBrODIal2ey1dLLqOjDcpkiGwY3yZTJ9CTacQ3Sent+b7Cimhjs1TzsGM2NVKR001u91FXae9C15Xr8h2QaLfwfFPqVSwTck4K9hqMvibQMehhwdvWJ1svBCs423xJtSucwmcA8vUAokRkuzg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.29,REQID:6e73019e-d668-45a1-9789-6f0e8fcc5da6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7562a7,CLOUDID:3b08c0b3-a467-4aa9-9e04-f584452e3794,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c41d3d142a9e11eeb20a276fd37b9834-20230725
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1939560042; Tue, 25 Jul 2023 11:53:07 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 25 Jul 2023 11:53:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 25 Jul 2023 11:53:06 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] ASoC: mediatek: common: revise SOF common code
Date: Tue, 25 Jul 2023 11:53:03 +0800
Message-ID: <20230725035304.2864-3-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230725035304.2864-1-trevor.wu@mediatek.com>
References: <20230725035304.2864-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Message-ID-Hash: ZEMWXTV35LKIP3RNXMPDVBW5HTMAYCUU
X-Message-ID-Hash: ZEMWXTV35LKIP3RNXMPDVBW5HTMAYCUU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZEMWXTV35LKIP3RNXMPDVBW5HTMAYCUU/>
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
index 6fef16306f74..ef49c2c0e253 100644
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
+			if (mtk_dai_link == NULL)
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

