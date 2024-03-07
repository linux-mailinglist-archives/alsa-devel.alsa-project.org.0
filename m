Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F61874DFA
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Mar 2024 12:47:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F3CBB65;
	Thu,  7 Mar 2024 12:47:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F3CBB65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709812046;
	bh=Q5qeA/4VKo3m34OedvzdenwOitJzicH0e47gxUWBDYI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HY2g1YG6n4e2zIYAg64WX7gUZnoyFbB6haxnd3fgQCkV0DQU8h0fmUvzhWRDfe+Hg
	 clb9FvFk8BjV7Js0iovPYp7VZ6VKA6a1Enprw+vxh01Vzg2WPnhsGyRNAbr16KEeb5
	 9YNPm6oZ08oXm39600nP8MjYYwyaR6zIsGGsSBcA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B115F806A1; Thu,  7 Mar 2024 12:45:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71737F8069A;
	Thu,  7 Mar 2024 12:45:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F0A5F80608; Thu,  7 Mar 2024 12:45:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5494BF8057B
	for <alsa-devel@alsa-project.org>; Thu,  7 Mar 2024 12:45:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5494BF8057B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=JqwirFZw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709811907;
	bh=Q5qeA/4VKo3m34OedvzdenwOitJzicH0e47gxUWBDYI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JqwirFZwh0BgvmYTxqaANA3HITTv0VzUAY8+kbMu4sdtBiIrXz1qCqusQXHQflEcK
	 jlCstICf9mbP8r0Yn73RUYbqcOQYFPvm5YRRmXOM/nJQRCMZq7ERaxJff3WhTDWgYo
	 OvI7QKdIFOol0mSOW9a9e3Uhd/M0TmOShD++GZabqMPvEPZyc3JMj7AGyChG+EujUJ
	 F2EEMTRXTCab2mOSz8bqnN4Q7fJUFDBLhcZymORhUvCxJt5y/jXlhXtt1CCQECblNL
	 AX4Iq/q/UA+prbHS5rplGxe5mx4lt/K4I8mpxkaPcf1PnnYySgnEMUgZarwKQ0l4DM
	 TpNnAEjeUSzfQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3326537820EC;
	Thu,  7 Mar 2024 11:45:05 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: wenst@chromium.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	trevor.wu@mediatek.com,
	maso.huang@mediatek.com,
	xiazhengqiao@huaqin.corp-partner.google.com,
	arnd@arndb.de,
	kuninori.morimoto.gx@renesas.com,
	shraash@google.com,
	amergnat@baylibre.com,
	nicolas.ferre@microchip.com,
	u.kleine-koenig@pengutronix.de,
	dianders@chromium.org,
	frank.li@vivo.com,
	allen-kh.cheng@mediatek.com,
	eugen.hristev@collabora.com,
	claudiu.beznea@tuxon.dev,
	jarkko.nikula@bitmer.com,
	jiaxin.yu@mediatek.com,
	alpernebiyasak@gmail.com,
	ckeepax@opensource.cirrus.com,
	zhourui@huaqin.corp-partner.google.com,
	nfraprado@collabora.com,
	alsa-devel@alsa-project.org,
	shane.chien@mediatek.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 06/22] ASoC: mediatek: common: Constify struct mtk_sof_priv
Date: Thu,  7 Mar 2024 12:44:29 +0100
Message-ID: <20240307114445.196981-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240307114445.196981-1-angelogioacchino.delregno@collabora.com>
References: <20240307114445.196981-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4YJJYUFVNBNO4HRLOOFWLDZ5NX746ZBL
X-Message-ID-Hash: 4YJJYUFVNBNO4HRLOOFWLDZ5NX746ZBL
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4YJJYUFVNBNO4HRLOOFWLDZ5NX746ZBL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Apart from a dai_link_list variable, the mtk_sof_priv currently holds
data that never gets modified during runtime.

Constify the mtk_sof_priv structure and move the SOF dai_link_list as
sof_dai_link_list in struct mtk_soc_card_data, which is a structure
that already holds the card's machine specific, runtime modified data.

This allows to safely pass the mtk_sof_priv structure as platform data
for the commonized card probe mechanism.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/common/mtk-dsp-sof-common.c   | 15 +++++++--------
 sound/soc/mediatek/common/mtk-dsp-sof-common.h   |  1 -
 sound/soc/mediatek/common/mtk-soundcard-driver.h |  2 +-
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-dsp-sof-common.c b/sound/soc/mediatek/common/mtk-dsp-sof-common.c
index 7ec8965a70c0..bca758dca2c9 100644
--- a/sound/soc/mediatek/common/mtk-dsp-sof-common.c
+++ b/sound/soc/mediatek/common/mtk-dsp-sof-common.c
@@ -15,7 +15,7 @@ int mtk_sof_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
-	struct mtk_sof_priv *sof_priv = soc_card_data->sof_priv;
+	const struct mtk_sof_priv *sof_priv = soc_card_data->sof_priv;
 	int i, j, ret = 0;
 
 	for (i = 0; i < sof_priv->num_streams; i++) {
@@ -55,7 +55,6 @@ int mtk_sof_card_probe(struct snd_soc_card *card)
 	int i;
 	struct snd_soc_dai_link *dai_link;
 	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
-	struct mtk_sof_priv *sof_priv = soc_card_data->sof_priv;
 
 	/* Set stream_name to help sof bind widgets */
 	for_each_card_prelinks(card, i, dai_link) {
@@ -63,7 +62,7 @@ int mtk_sof_card_probe(struct snd_soc_card *card)
 			dai_link->stream_name = dai_link->name;
 	}
 
-	INIT_LIST_HEAD(&sof_priv->dai_link_list);
+	INIT_LIST_HEAD(&soc_card_data->sof_dai_link_list);
 
 	return 0;
 }
@@ -73,7 +72,7 @@ static struct snd_soc_pcm_runtime *mtk_sof_find_tplg_be(struct snd_soc_pcm_runti
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
-	struct mtk_sof_priv *sof_priv = soc_card_data->sof_priv;
+	const struct mtk_sof_priv *sof_priv = soc_card_data->sof_priv;
 	struct snd_soc_pcm_runtime *fe;
 	struct snd_soc_pcm_runtime *be;
 	struct snd_soc_dpcm *dpcm;
@@ -113,7 +112,7 @@ static int mtk_sof_check_tplg_be_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_soc_card *card = rtd->card;
 	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
-	struct mtk_sof_priv *sof_priv = soc_card_data->sof_priv;
+	const struct mtk_sof_priv *sof_priv = soc_card_data->sof_priv;
 	struct snd_soc_pcm_runtime *sof_be;
 	struct mtk_dai_link *dai_link;
 	int ret = 0;
@@ -125,7 +124,7 @@ static int mtk_sof_check_tplg_be_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 		else if (sof_be->dai_link->be_hw_params_fixup)
 			ret = sof_be->dai_link->be_hw_params_fixup(sof_be, params);
 	} else {
-		list_for_each_entry(dai_link, &sof_priv->dai_link_list, list) {
+		list_for_each_entry(dai_link, &soc_card_data->sof_dai_link_list, list) {
 			if (strcmp(dai_link->name, rtd->dai_link->name) == 0) {
 				if (dai_link->be_hw_params_fixup)
 					ret = dai_link->be_hw_params_fixup(rtd, params);
@@ -144,7 +143,7 @@ int mtk_sof_card_late_probe(struct snd_soc_card *card)
 	struct snd_soc_component *sof_comp = NULL;
 	struct mtk_soc_card_data *soc_card_data =
 		snd_soc_card_get_drvdata(card);
-	struct mtk_sof_priv *sof_priv = soc_card_data->sof_priv;
+	const struct mtk_sof_priv *sof_priv = soc_card_data->sof_priv;
 	struct snd_soc_dai_link *dai_link;
 	struct mtk_dai_link *mtk_dai_link;
 	int i;
@@ -173,7 +172,7 @@ int mtk_sof_card_late_probe(struct snd_soc_card *card)
 			mtk_dai_link->be_hw_params_fixup = dai_link->be_hw_params_fixup;
 			mtk_dai_link->name = dai_link->name;
 
-			list_add(&mtk_dai_link->list, &sof_priv->dai_link_list);
+			list_add(&mtk_dai_link->list, &soc_card_data->sof_dai_link_list);
 		}
 
 		if (dai_link->no_pcm)
diff --git a/sound/soc/mediatek/common/mtk-dsp-sof-common.h b/sound/soc/mediatek/common/mtk-dsp-sof-common.h
index 4bc5e1c0c8ed..8784ee471132 100644
--- a/sound/soc/mediatek/common/mtk-dsp-sof-common.h
+++ b/sound/soc/mediatek/common/mtk-dsp-sof-common.h
@@ -30,7 +30,6 @@ struct mtk_sof_priv {
 	int num_streams;
 	int (*sof_dai_link_fixup)(struct snd_soc_pcm_runtime *rtd,
 				  struct snd_pcm_hw_params *params);
-	struct list_head dai_link_list;
 };
 
 int mtk_sof_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.h b/sound/soc/mediatek/common/mtk-soundcard-driver.h
index 44320efff5f8..4fd2ffb7e486 100644
--- a/sound/soc/mediatek/common/mtk-soundcard-driver.h
+++ b/sound/soc/mediatek/common/mtk-soundcard-driver.h
@@ -22,7 +22,7 @@ struct mtk_platform_card_data {
 struct mtk_soundcard_pdata {
 	const char *card_name;
 	struct mtk_platform_card_data *card_data;
-	struct mtk_sof_priv *sof_priv;
+	const struct mtk_sof_priv *sof_priv;
 	int (*soc_probe)(struct mtk_soc_card_data *card_data, bool legacy);
 };
 
-- 
2.44.0

