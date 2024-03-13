Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B991C87A684
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Mar 2024 12:04:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60CDE1E93;
	Wed, 13 Mar 2024 12:04:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60CDE1E93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710327887;
	bh=8dO/knddMZmgChwWbJp/fcjiVO5qSxhidYiSZvCNm60=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BEyyJmtFB8MzueztAyMypWbf7PYAccXEJfFAPgGgZhQPql1nm+vG6yprj5LEukdgf
	 T6/Zh4/ll954oZom5MXej7UD2/UHxqqZOB0MuWeMvhOsFehrumFTePLlBe3DZhOCVx
	 BNJmNhftDmmfipJlsIbBUXsKJa+nMKvFUj6s6HsU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58790F8069C; Wed, 13 Mar 2024 12:03:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F040F80697;
	Wed, 13 Mar 2024 12:03:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC70CF805C1; Wed, 13 Mar 2024 12:03:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8B1CFF8014B
	for <alsa-devel@alsa-project.org>; Wed, 13 Mar 2024 12:02:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B1CFF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=aWerTd/Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710327743;
	bh=8dO/knddMZmgChwWbJp/fcjiVO5qSxhidYiSZvCNm60=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aWerTd/QLQkShRMWlVUD4ZLpadSorfTGnZV09Vd//Hauslc2UEEbPHXgw2eoVwjjF
	 35brLSBgyp46gTPg0zuUj5X0NzsjuyHzgQcXHuAEsJs6z4fZCnH/Q+mm+eqSxW/XNQ
	 av5OvMtVJPYr/MsjzVfNTOJU1mx8kEoYdzCQdiLu+xdA29zBiFmvlkLuunYIFXg0i0
	 uPCzvhwaaNOEZvg4MrZJGf9RaP/yYH47Oqfkmh/ZMg89Eop1TVRS6TEU8oYSFA+73M
	 4MkwUQN24HVZluCRQuoxfoDBuVGdVOSdh/1e9jsP9Jkb+xU5e1Tqrtia1VAWeBdlT7
	 DbfCTpR2hdjow==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7BC0337810CD;
	Wed, 13 Mar 2024 11:02:21 +0000 (UTC)
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
Subject: [PATCH v3 11/22] ASoC: mediatek: Add common snd_soc_ops .startup()
 callback
Date: Wed, 13 Mar 2024 12:01:36 +0100
Message-ID: 
 <20240313110147.1267793-12-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: 
 <20240313110147.1267793-1-angelogioacchino.delregno@collabora.com>
References: <20240313110147.1267793-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DM3T4BGYABRBVOSGHLKK7YVTGINPSSBC
X-Message-ID-Hash: DM3T4BGYABRBVOSGHLKK7YVTGINPSSBC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DM3T4BGYABRBVOSGHLKK7YVTGINPSSBC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

MediaTek platforms are typically setting PCM rate and channels
constraints for playback, capture and HDMI/DisplayPort playback:
commonize the startup callback by adding the PCM constraints data
to the mtk_platform_card_data structure and by reusing the common
mtk_soundcard_startup() function for all of them by getting back
the parameters from the aforementioned struct.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek/common/mtk-soundcard-driver.c    | 51 +++++++++++++++++++
 .../mediatek/common/mtk-soundcard-driver.h    | 24 +++++++++
 2 files changed, 75 insertions(+)

diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc/mediatek/common/mtk-soundcard-driver.c
index b1db17e392d5..d344630f7851 100644
--- a/sound/soc/mediatek/common/mtk-soundcard-driver.c
+++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
@@ -139,6 +139,57 @@ void clean_card_reference(struct snd_soc_card *card)
 }
 EXPORT_SYMBOL_GPL(clean_card_reference);
 
+int mtk_soundcard_startup(struct snd_pcm_substream *substream,
+			  enum mtk_pcm_constraint_type ctype)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct mtk_soc_card_data *soc_card = snd_soc_card_get_drvdata(rtd->card);
+	const struct mtk_pcm_constraints_data *mpc = &soc_card->card_data->pcm_constraints[ctype];
+	int ret;
+
+	if (unlikely(!mpc))
+		return -EINVAL;
+
+	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
+					 SNDRV_PCM_HW_PARAM_RATE,
+					 &mpc->rates);
+	if (ret < 0) {
+		dev_err(rtd->dev, "hw_constraint_list rate failed\n");
+		return ret;
+	}
+
+	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
+					 SNDRV_PCM_HW_PARAM_CHANNELS,
+					 &mpc->channels);
+	if (ret < 0) {
+		dev_err(rtd->dev, "hw_constraint_list channel failed\n");
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mtk_soundcard_startup);
+
+static int mtk_soundcard_playback_startup(struct snd_pcm_substream *substream)
+{
+	return mtk_soundcard_startup(substream, MTK_CONSTRAINT_PLAYBACK);
+}
+
+const struct snd_soc_ops mtk_soundcard_common_playback_ops = {
+	.startup = mtk_soundcard_playback_startup,
+};
+EXPORT_SYMBOL_GPL(mtk_soundcard_common_playback_ops);
+
+static int mtk_soundcard_capture_startup(struct snd_pcm_substream *substream)
+{
+	return mtk_soundcard_startup(substream, MTK_CONSTRAINT_CAPTURE);
+}
+
+const struct snd_soc_ops mtk_soundcard_common_capture_ops = {
+	.startup = mtk_soundcard_capture_startup,
+};
+EXPORT_SYMBOL_GPL(mtk_soundcard_common_capture_ops);
+
 int mtk_soundcard_common_probe(struct platform_device *pdev)
 {
 	struct device_node *platform_node, *adsp_node;
diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.h b/sound/soc/mediatek/common/mtk-soundcard-driver.h
index 4fd2ffb7e486..c38e2ac09ad3 100644
--- a/sound/soc/mediatek/common/mtk-soundcard-driver.h
+++ b/sound/soc/mediatek/common/mtk-soundcard-driver.h
@@ -11,11 +11,26 @@
 
 struct mtk_sof_priv;
 struct mtk_soc_card_data;
+struct snd_pcm_hw_constraint_list;
+
+enum mtk_pcm_constraint_type {
+	MTK_CONSTRAINT_PLAYBACK,
+	MTK_CONSTRAINT_CAPTURE,
+	MTK_CONSTRAINT_HDMIDP,
+	MTK_CONSTRAINT_MAX
+};
+
+struct mtk_pcm_constraints_data {
+	const struct snd_pcm_hw_constraint_list channels;
+	const struct snd_pcm_hw_constraint_list rates;
+};
 
 struct mtk_platform_card_data {
 	struct snd_soc_card *card;
 	struct snd_soc_jack *jacks;
+	const struct mtk_pcm_constraints_data *pcm_constraints;
 	u8 num_jacks;
+	u8 num_pcm_constraints;
 	u8 flags;
 };
 
@@ -23,9 +38,18 @@ struct mtk_soundcard_pdata {
 	const char *card_name;
 	struct mtk_platform_card_data *card_data;
 	const struct mtk_sof_priv *sof_priv;
+
 	int (*soc_probe)(struct mtk_soc_card_data *card_data, bool legacy);
 };
 
+/* Common playback/capture card startup ops */
+extern const struct snd_soc_ops mtk_soundcard_common_playback_ops;
+extern const struct snd_soc_ops mtk_soundcard_common_capture_ops;
+
+/* Exported for custom/extended soundcard startup ops */
+int mtk_soundcard_startup(struct snd_pcm_substream *substream,
+			  enum mtk_pcm_constraint_type ctype);
+
 int parse_dai_link_info(struct snd_soc_card *card);
 void clean_card_reference(struct snd_soc_card *card);
 int mtk_soundcard_common_probe(struct platform_device *pdev);
-- 
2.44.0

