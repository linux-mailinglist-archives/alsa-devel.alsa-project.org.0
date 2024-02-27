Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E97E868FD7
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Feb 2024 13:12:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 578C5DEE;
	Tue, 27 Feb 2024 13:12:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 578C5DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709035934;
	bh=QN26t0rrc+NSqCdkkiNG9yykGnvaBYqQoqHRENbyT90=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qC5rGJXnrAyLNFPFvUYsT2JBwRjl+F71kp9IoSr0ogR6tNQ0gAS7gUL7tR5f4/SKD
	 dqTq4Q7CVo82Tv3kpMfwsovW4c5PBW9Na+/KUA5+1jv8ikYyi64xhJZcCb8UhUWbIE
	 S0tX85QvUMCLm4w/HdUIWFJUqobQ1/QMwuiZQGZ0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65F1FF80640; Tue, 27 Feb 2024 13:10:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55078F805A0;
	Tue, 27 Feb 2024 13:10:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D3D3F80614; Tue, 27 Feb 2024 13:10:33 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B955DF800F0
	for <alsa-devel@alsa-project.org>; Tue, 27 Feb 2024 13:10:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B955DF800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=g9KvYlR2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709035821;
	bh=QN26t0rrc+NSqCdkkiNG9yykGnvaBYqQoqHRENbyT90=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g9KvYlR2cSC9tcDF4hulWv+o8DLnFWaWStQWii1g75ridXJyNzWV7G2wyR74CCvEJ
	 jP2sKo4hLJ7Fjrdsl1+IqrU3v0ttXdgkyM1vKmbHAys1QQEmn43K6h2CNJXrFMaZae
	 jn5vycqfzLhX0l7dOMA16RESMBwnYZS3S7ipe1fqcVF3tA+ftSwnqA7Za65OfBGixS
	 913/ZA7gWPRd74wGOnSFKlHEJFsVQespvkvdel9/vEkGHCRhEsjHgzVUYtQf3ToKeD
	 FPhZzubIG5r2JSoAcrg28IGiYuH0zlp3Ejp6jY0eb1VdUHhy/I6elXj/AabSNgYAWQ
	 byX86kGBXsj1g==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7A70937820D3;
	Tue, 27 Feb 2024 12:10:19 +0000 (UTC)
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
Subject: [PATCH 05/22] ASoC: mediatek: Add common machine soundcard driver
 probe mechanism
Date: Tue, 27 Feb 2024 13:09:22 +0100
Message-ID: <20240227120939.290143-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240227120939.290143-1-angelogioacchino.delregno@collabora.com>
References: <20240227120939.290143-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GJOUTJXM63WDNXJSEAJN67J4UZNQADBR
X-Message-ID-Hash: GJOUTJXM63WDNXJSEAJN67J4UZNQADBR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GJOUTJXM63WDNXJSEAJN67J4UZNQADBR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a common machine soundcard driver probe function that supports both
DSP and AFE-direct usecases and also provides a hook for legacy machine
soundcard driver probe mechanisms.

Note that the hook is there because, even for legacy probe, a lot of the
actual code can still be commonized, hence still reducing duplication
for the legacy devicetree retrocompatibility cases.

This common probe function deprecates all of the inconsistent previous
probe mechanisms and aims to settle all of the MediaTek card drivers on
consistent and common devicetree properties describing wanted DAIs,
device specific DAI configuration and DAI links to codecs found on
each device/board.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/common/mtk-soc-card.h      |   7 +-
 .../mediatek/common/mtk-soundcard-driver.c    | 148 ++++++++++++++++++
 .../mediatek/common/mtk-soundcard-driver.h    |  18 +++
 3 files changed, 172 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/common/mtk-soc-card.h b/sound/soc/mediatek/common/mtk-soc-card.h
index eeda79370049..3f6e24dd22df 100644
--- a/sound/soc/mediatek/common/mtk-soc-card.h
+++ b/sound/soc/mediatek/common/mtk-soc-card.h
@@ -9,9 +9,14 @@
 #ifndef _MTK_SOC_CARD_H_
 #define _MTK_SOC_CARD_H_
 
+struct mtk_platform_card_data;
+struct mtk_sof_priv;
+
 struct mtk_soc_card_data {
+	const struct mtk_sof_priv *sof_priv;
+	struct list_head sof_dai_link_list;
+	struct mtk_platform_card_data *card_data;
 	void *mach_priv;
-	void *sof_priv;
 };
 
 #endif
diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc/mediatek/common/mtk-soundcard-driver.c
index 000a086a8cf4..b1db17e392d5 100644
--- a/sound/soc/mediatek/common/mtk-soundcard-driver.c
+++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
@@ -10,6 +10,8 @@
 #include <linux/of.h>
 #include <sound/soc.h>
 
+#include "mtk-dsp-sof-common.h"
+#include "mtk-soc-card.h"
 #include "mtk-soundcard-driver.h"
 
 static int set_card_codec_info(struct snd_soc_card *card,
@@ -136,3 +138,149 @@ void clean_card_reference(struct snd_soc_card *card)
 		snd_soc_of_put_dai_link_codecs(dai_link);
 }
 EXPORT_SYMBOL_GPL(clean_card_reference);
+
+int mtk_soundcard_common_probe(struct platform_device *pdev)
+{
+	struct device_node *platform_node, *adsp_node;
+	const struct mtk_soundcard_pdata *pdata;
+	struct mtk_soc_card_data *soc_card_data;
+	struct snd_soc_dai_link *orig_dai_link, *dai_link;
+	struct snd_soc_jack *jacks;
+	struct snd_soc_card *card;
+	int i, orig_num_links, ret;
+	bool needs_legacy_probe;
+
+	pdata = device_get_match_data(&pdev->dev);
+	if (!pdata)
+		return -EINVAL;
+
+	card = pdata->card_data->card;
+	card->dev = &pdev->dev;
+	orig_dai_link = card->dai_link;
+	orig_num_links = card->num_links;
+
+	ret = snd_soc_of_parse_card_name(card, "model");
+	if (ret)
+		return ret;
+
+	if (!card->name) {
+		if (!pdata->card_name)
+			return -EINVAL;
+
+		card->name = pdata->card_name;
+	}
+
+	needs_legacy_probe = !of_property_read_bool(pdev->dev.of_node, "audio-routing");
+	if (needs_legacy_probe) {
+		/*
+		 * If we have no .soc_probe() callback there's no way of using
+		 * any legacy probe mechanism, as that cannot not be generic.
+		 */
+		if (!pdata->soc_probe)
+			return -EINVAL;
+
+		dev_info_once(&pdev->dev, "audio-routing not found: using legacy probe\n");
+	} else {
+		ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
+		if (ret)
+			return ret;
+	}
+
+	soc_card_data = devm_kzalloc(&pdev->dev, sizeof(*soc_card_data), GFP_KERNEL);
+	if (!soc_card_data)
+		return -ENOMEM;
+
+	soc_card_data->card_data = pdata->card_data;
+
+	jacks = devm_kcalloc(card->dev, soc_card_data->card_data->num_jacks,
+			     sizeof(*jacks), GFP_KERNEL);
+	if (!jacks)
+		return -ENOMEM;
+
+	soc_card_data->card_data->jacks = jacks;
+
+	platform_node = of_parse_phandle(pdev->dev.of_node, "mediatek,platform", 0);
+	if (!platform_node)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "Property mediatek,platform missing or invalid\n");
+
+	/* Check if this SoC has an Audio DSP */
+	if (pdata->sof_priv)
+		adsp_node = of_parse_phandle(pdev->dev.of_node, "mediatek,adsp", 0);
+	else
+		adsp_node = NULL;
+
+	if (adsp_node) {
+		if (of_property_read_bool(pdev->dev.of_node, "mediatek,dai-link")) {
+			ret = mtk_sof_dailink_parse_of(card, pdev->dev.of_node,
+						       "mediatek,dai-link",
+						       card->dai_link, card->num_links);
+			if (ret) {
+				of_node_put(adsp_node);
+				of_node_put(platform_node);
+				return dev_err_probe(&pdev->dev, ret,
+						     "Cannot parse mediatek,dai-link\n");
+			}
+		}
+
+		soc_card_data->sof_priv = pdata->sof_priv;
+		card->probe = mtk_sof_card_probe;
+		card->late_probe = mtk_sof_card_late_probe;
+		if (!card->topology_shortname_created) {
+			snprintf(card->topology_shortname, 32, "sof-%s", card->name);
+			card->topology_shortname_created = true;
+		}
+		card->name = card->topology_shortname;
+	}
+
+	/*
+	 * Regardless of whether the ADSP is wanted and/or present in a machine
+	 * specific device tree or not and regardless of whether any AFE_SOF
+	 * link is present, we have to make sure that the platforms->of_node
+	 * is not NULL, and set to either ADSP (adsp_node) or AFE (platform_node).
+	 */
+	for_each_card_prelinks(card, i, dai_link) {
+		if (adsp_node && !strncmp(dai_link->name, "AFE_SOF", strlen("AFE_SOF")))
+			dai_link->platforms->of_node = adsp_node;
+		else if (!dai_link->platforms->name && !dai_link->platforms->of_node)
+			dai_link->platforms->of_node = platform_node;
+	}
+
+	if (!needs_legacy_probe) {
+		ret = parse_dai_link_info(card);
+		if (ret)
+			goto err_restore_dais;
+	} else {
+		if (adsp_node)
+			of_node_put(adsp_node);
+		of_node_put(platform_node);
+	}
+
+	if (pdata->soc_probe) {
+		ret = pdata->soc_probe(soc_card_data, needs_legacy_probe);
+		if (ret) {
+			if (!needs_legacy_probe)
+				clean_card_reference(card);
+			goto err_restore_dais;
+		}
+	}
+	snd_soc_card_set_drvdata(card, soc_card_data);
+
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
+
+	if (!needs_legacy_probe)
+		clean_card_reference(card);
+
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret, "Cannot register card\n");
+		goto err_restore_dais;
+	}
+
+	return 0;
+
+err_restore_dais:
+	card->dai_link = orig_dai_link;
+	card->num_links = orig_num_links;
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mtk_soundcard_common_probe);
diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.h b/sound/soc/mediatek/common/mtk-soundcard-driver.h
index d92cac1d7b72..44320efff5f8 100644
--- a/sound/soc/mediatek/common/mtk-soundcard-driver.h
+++ b/sound/soc/mediatek/common/mtk-soundcard-driver.h
@@ -9,6 +9,24 @@
 #ifndef _MTK_SOUNDCARD_DRIVER_H_
 #define _MTK_SOUNDCARD_DRIVER_H_
 
+struct mtk_sof_priv;
+struct mtk_soc_card_data;
+
+struct mtk_platform_card_data {
+	struct snd_soc_card *card;
+	struct snd_soc_jack *jacks;
+	u8 num_jacks;
+	u8 flags;
+};
+
+struct mtk_soundcard_pdata {
+	const char *card_name;
+	struct mtk_platform_card_data *card_data;
+	struct mtk_sof_priv *sof_priv;
+	int (*soc_probe)(struct mtk_soc_card_data *card_data, bool legacy);
+};
+
 int parse_dai_link_info(struct snd_soc_card *card);
 void clean_card_reference(struct snd_soc_card *card);
+int mtk_soundcard_common_probe(struct platform_device *pdev);
 #endif
-- 
2.44.0

