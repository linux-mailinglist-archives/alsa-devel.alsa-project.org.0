Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 083018A64D9
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Apr 2024 09:19:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 664111909;
	Tue, 16 Apr 2024 09:19:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 664111909
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713251957;
	bh=u3zwsWj3FznMZF6fne2Y0gfUvSivJy3RgPglHp05FEw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d1AyKW/6LXoJtsA0mjDtAYxOWlZFJY/6PsxqsylRReEvEbi0McEd0lsdZuq2HP1/y
	 3UyF1xFKvAyDiXVqc9LwxL1eTL9SPVER5pFFnJNsdDEPvZo74KdyKBW9Ts43ixTCfi
	 ag64Y0pEokZAyXUoPDcdPF1ZGJkpmuAi5M35/qLo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 131F8F80799; Tue, 16 Apr 2024 09:16:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5333BF807A2;
	Tue, 16 Apr 2024 09:16:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1484DF805A1; Tue, 16 Apr 2024 09:15:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18B1BF80496
	for <alsa-devel@alsa-project.org>; Tue, 16 Apr 2024 09:14:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18B1BF80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=Y2leWYBu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713251687;
	bh=u3zwsWj3FznMZF6fne2Y0gfUvSivJy3RgPglHp05FEw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y2leWYBuNEq1AY1jsG3KjLCQUg4E/U6JNyFppUa/HaUwqjFQMU0XfdJIqjIplybOb
	 wlhJtRy2kje2ZaylqpEFo7DaBiEYV4toREZZLHBvvUDuAVdJc9RydIJXUcok7QrajB
	 HlWTU1hPifhcfB71Hz196Vr7Mf75fn7ARD6PLlJdMilbl2QklEBQt4Nfg+7V9lOi1k
	 0lgEcR3DcX2khoDL0UtDgYOWNqS9Pn+ItbqIaziLSZej24uKyh0H4cVIB3swfNw9oA
	 W/EKoAd2uPuBfp5rDx6aPxouURmkFlwM8pAUO5U5lzPGWOw873dUhVb+iNSki9lVL0
	 RbU0V8cp2H09w==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EE6F2378213F;
	Tue, 16 Apr 2024 07:14:44 +0000 (UTC)
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
Subject: [PATCH v5 12/18] ASoC: mediatek: Use common mtk_afe_pcm_platform with
 common probe cb
Date: Tue, 16 Apr 2024 09:14:04 +0200
Message-ID: <20240416071410.75620-13-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416071410.75620-1-angelogioacchino.delregno@collabora.com>
References: <20240416071410.75620-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: X5LQKDU5DJTAAHNWYW334D5I3JY3L67W
X-Message-ID-Hash: X5LQKDU5DJTAAHNWYW334D5I3JY3L67W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X5LQKDU5DJTAAHNWYW334D5I3JY3L67W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Since the mtk-afe-platform-driver generic mtk_afe_pcm_platform now has
a common .probe() callback, there is no reason to keep duplicating this
function over and over in the SoC specific AFE-PCM drivers: switch over
to register with the common bits instead.

Note that MT8186 was left out of this because it is registering some
extra sinegen controls in the AFE-PCM probe callback and needs extra
cleanups to be able to use the common bits.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c | 14 +-----------
 sound/soc/mediatek/mt7986/mt7986-afe-pcm.c | 14 +-----------
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 14 +-----------
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 21 +-----------------
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 25 ++--------------------
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 21 +-----------------
 6 files changed, 7 insertions(+), 102 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
index da7267c684b1..c1dee119e93a 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
@@ -704,18 +704,6 @@ static int mt6797_afe_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int mt6797_afe_component_probe(struct snd_soc_component *component)
-{
-	return mtk_afe_add_sub_dai_control(component);
-}
-
-static const struct snd_soc_component_driver mt6797_afe_component = {
-	.name		= AFE_PCM_NAME,
-	.probe		= mt6797_afe_component_probe,
-	.pointer	= mtk_afe_pcm_pointer,
-	.pcm_construct	= mtk_afe_pcm_new,
-};
-
 static int mt6797_dai_memif_register(struct mtk_base_afe *afe)
 {
 	struct mtk_base_afe_dai *dai;
@@ -852,7 +840,7 @@ static int mt6797_afe_pcm_dev_probe(struct platform_device *pdev)
 	pm_runtime_get_sync(&pdev->dev);
 
 	/* register component */
-	ret = devm_snd_soc_register_component(dev, &mt6797_afe_component,
+	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
 					      NULL, 0);
 	if (ret) {
 		dev_warn(dev, "err_platform\n");
diff --git a/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c b/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
index d497e1129889..c1c486e275b9 100644
--- a/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
+++ b/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
@@ -429,18 +429,6 @@ static int mt7986_afe_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int mt7986_afe_component_probe(struct snd_soc_component *component)
-{
-	return mtk_afe_add_sub_dai_control(component);
-}
-
-static const struct snd_soc_component_driver mt7986_afe_component = {
-	.name = AFE_PCM_NAME,
-	.probe = mt7986_afe_component_probe,
-	.pointer	= mtk_afe_pcm_pointer,
-	.pcm_construct	= mtk_afe_pcm_new,
-};
-
 static int mt7986_dai_memif_register(struct mtk_base_afe *afe)
 {
 	struct mtk_base_afe_dai *dai;
@@ -573,7 +561,7 @@ static int mt7986_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* register component */
 	ret = devm_snd_soc_register_component(&pdev->dev,
-					      &mt7986_afe_component,
+					      &mtk_afe_pcm_platform,
 					      NULL, 0);
 	if (ret)
 		return dev_err_probe(dev, ret, "Cannot register AFE component\n");
diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 9e432ed9124b..25348fdf75fa 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -1042,18 +1042,6 @@ static int mt8183_afe_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int mt8183_afe_component_probe(struct snd_soc_component *component)
-{
-	return mtk_afe_add_sub_dai_control(component);
-}
-
-static const struct snd_soc_component_driver mt8183_afe_component = {
-	.name		= AFE_PCM_NAME,
-	.probe		= mt8183_afe_component_probe,
-	.pointer	= mtk_afe_pcm_pointer,
-	.pcm_construct	= mtk_afe_pcm_new,
-};
-
 static int mt8183_dai_memif_register(struct mtk_base_afe *afe)
 {
 	struct mtk_base_afe_dai *dai;
@@ -1232,7 +1220,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* register component */
 	ret = devm_snd_soc_register_component(&pdev->dev,
-					      &mt8183_afe_component,
+					      &mtk_afe_pcm_platform,
 					      NULL, 0);
 	if (ret) {
 		dev_warn(dev, "err_platform\n");
diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 46d6a5540403..9647fe133dc8 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -3030,25 +3030,6 @@ static int mt8188_afe_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int mt8188_afe_component_probe(struct snd_soc_component *component)
-{
-	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
-	int ret;
-
-	snd_soc_component_init_regmap(component, afe->regmap);
-
-	ret = mtk_afe_add_sub_dai_control(component);
-
-	return ret;
-}
-
-static const struct snd_soc_component_driver mt8188_afe_component = {
-	.name = AFE_PCM_NAME,
-	.pointer       = mtk_afe_pcm_pointer,
-	.pcm_construct = mtk_afe_pcm_new,
-	.probe         = mt8188_afe_component_probe,
-};
-
 static int init_memif_priv_data(struct mtk_base_afe *afe)
 {
 	struct mt8188_afe_private *afe_priv = afe->platform_priv;
@@ -3350,7 +3331,7 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	}
 
 	/* register component */
-	ret = devm_snd_soc_register_component(dev, &mt8188_afe_component,
+	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
 					      afe->dai_drivers, afe->num_dai_drivers);
 	if (ret) {
 		dev_warn(dev, "err_platform\n");
diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index aed22baef9fb..424c5c68f78a 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -2125,22 +2125,6 @@ static int mt8192_afe_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int mt8192_afe_component_probe(struct snd_soc_component *component)
-{
-	return mtk_afe_add_sub_dai_control(component);
-}
-
-static const struct snd_soc_component_driver mt8192_afe_component = {
-	.name = AFE_PCM_NAME,
-	.probe = mt8192_afe_component_probe,
-	.pointer = mtk_afe_pcm_pointer,
-	.pcm_construct = mtk_afe_pcm_new,
-};
-
-static const struct snd_soc_component_driver mt8192_afe_pcm_component = {
-	.name = "mt8192-afe-pcm-dai",
-};
-
 static int mt8192_dai_memif_register(struct mtk_base_afe *afe)
 {
 	struct mtk_base_afe_dai *dai;
@@ -2302,16 +2286,11 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* register platform */
 	ret = devm_snd_soc_register_component(&pdev->dev,
-					      &mt8192_afe_component, NULL, 0);
-	if (ret)
-		return dev_err_probe(dev, ret, "Couldn't register AFE component\n");
-
-	ret = devm_snd_soc_register_component(&pdev->dev,
-					      &mt8192_afe_pcm_component,
+					      &mtk_afe_pcm_platform,
 					      afe->dai_drivers,
 					      afe->num_dai_drivers);
 	if (ret)
-		return dev_err_probe(dev, ret, "Couldn't register AFE-PCM component\n");
+		return dev_err_probe(dev, ret, "Couldn't register AFE component\n");
 
 	return 0;
 }
diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 620d7ade1992..64af9bf363fd 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -2944,25 +2944,6 @@ static int mt8195_afe_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int mt8195_afe_component_probe(struct snd_soc_component *component)
-{
-	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
-	int ret = 0;
-
-	snd_soc_component_init_regmap(component, afe->regmap);
-
-	ret = mtk_afe_add_sub_dai_control(component);
-
-	return ret;
-}
-
-static const struct snd_soc_component_driver mt8195_afe_component = {
-	.name = AFE_PCM_NAME,
-	.pointer = mtk_afe_pcm_pointer,
-	.pcm_construct = mtk_afe_pcm_new,
-	.probe = mt8195_afe_component_probe,
-};
-
 static int init_memif_priv_data(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
@@ -3164,7 +3145,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	}
 
 	/* register component */
-	ret = devm_snd_soc_register_component(dev, &mt8195_afe_component,
+	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
 					      afe->dai_drivers, afe->num_dai_drivers);
 	if (ret) {
 		dev_warn(dev, "err_platform\n");
-- 
2.44.0

