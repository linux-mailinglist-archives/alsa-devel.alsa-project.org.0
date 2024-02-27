Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0744868FD2
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Feb 2024 13:11:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25439A4D;
	Tue, 27 Feb 2024 13:11:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25439A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709035894;
	bh=vQR9qqzg7f24D5INSZmDMVsHt5lOvfpnX0PySknmEws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IR/Nm4yismLKRs8KkMx0HVorNSSrJWB2mfqG/Oe1E0Qx4dLwHA6y2e84aX0LpGqfr
	 NPQ49I4liqcHtZIb1PGBTpb1U8RRsmapbfuX9s4rFbsz3JHCkE03Dijv2lhTcLsv1v
	 h4CmUZVFEA5O1rD4DfHw2cvneVLf6BadRoQdmH1M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BAD8F80606; Tue, 27 Feb 2024 13:10:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5089F805FB;
	Tue, 27 Feb 2024 13:10:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D6CDF8026D; Tue, 27 Feb 2024 13:10:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75D22F8013D
	for <alsa-devel@alsa-project.org>; Tue, 27 Feb 2024 13:10:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75D22F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=WMp4I5B+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709035814;
	bh=vQR9qqzg7f24D5INSZmDMVsHt5lOvfpnX0PySknmEws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WMp4I5B+khbQR/koSdRYOWKvun1r2PpA+LpgA6x1tgp9emsB1Y7o/a5lKyarnMyCM
	 DtozzhMGWDLGdd4qn/Htu5TmvO7OwWTmQUOErWHS8eel5nZv+FF+QHLZirwW9a42Tr
	 ao1z8nrg/pu34CT50vsqAwMTLc9pyH9bcKkPhEmkQMkXcFprmS4M6jNDZraSgMzrDa
	 hmcq1JzjiPh60DzKVm/Xvf9QqRNp/FjVOWytI9Ih/SJ6LXV8MuuX/9P7qoTEnj5mr0
	 3zppsMev4bX6aP9DLxUxPV6xLvnnrX9zG/+l0f0m8sZpYy18qCS87+90BEz9nrInsw
	 MQlo1Uh8Gatew==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EFF1737820CF;
	Tue, 27 Feb 2024 12:10:11 +0000 (UTC)
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
Subject: [PATCH 02/22] ASoC: mediatek: mt8192-afe-pcm: Simplify with
 dev_err_probe()
Date: Tue, 27 Feb 2024 13:09:19 +0100
Message-ID: <20240227120939.290143-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240227120939.290143-1-angelogioacchino.delregno@collabora.com>
References: <20240227120939.290143-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JAVTBLKSFBT6WJRAEIPF6EEEHDMKLARW
X-Message-ID-Hash: JAVTBLKSFBT6WJRAEIPF6EEEHDMKLARW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JAVTBLKSFBT6WJRAEIPF6EEEHDMKLARW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Simplify the probe function by switching error prints to return
dev_err_probe(), lowering the lines count; while at it, also
beautify some messages and change some others' level from warn
to error.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 65 ++++++++--------------
 1 file changed, 22 insertions(+), 43 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index 794419d16b01..aed22baef9fb 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -2205,17 +2205,12 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* reset controller to reset audio regs before regmap cache */
 	rstc = devm_reset_control_get_exclusive(dev, "audiosys");
-	if (IS_ERR(rstc)) {
-		ret = PTR_ERR(rstc);
-		dev_err(dev, "could not get audiosys reset:%d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(rstc))
+		return dev_err_probe(dev, PTR_ERR(rstc), "could not get audiosys reset\n");
 
 	ret = reset_control_reset(rstc);
-	if (ret) {
-		dev_err(dev, "failed to trigger audio reset:%d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to trigger audio reset\n");
 
 	ret = devm_pm_runtime_enable(&pdev->dev);
 	if (ret)
@@ -2223,25 +2218,21 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* regmap init */
 	afe->regmap = syscon_node_to_regmap(dev->parent->of_node);
-	if (IS_ERR(afe->regmap)) {
-		dev_err(dev, "could not get regmap from parent\n");
-		return PTR_ERR(afe->regmap);
-	}
+	if (IS_ERR(afe->regmap))
+		return dev_err_probe(dev, PTR_ERR(afe->regmap),
+				     "could not get regmap from parent");
+
 	ret = regmap_attach_dev(dev, afe->regmap, &mt8192_afe_regmap_config);
-	if (ret) {
-		dev_warn(dev, "regmap_attach_dev fail, ret %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "regmap_attach_dev fail\n");
 
 	/* enable clock for regcache get default value from hw */
 	afe_priv->pm_runtime_bypass_reg_ctl = true;
 	pm_runtime_get_sync(&pdev->dev);
 
 	ret = regmap_reinit_cache(afe->regmap, &mt8192_afe_regmap_config);
-	if (ret) {
-		dev_err(dev, "regmap_reinit_cache fail, ret %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "regmap_reinit_cache fail\n");
 
 	pm_runtime_put_sync(&pdev->dev);
 	afe_priv->pm_runtime_bypass_reg_ctl = false;
@@ -2281,30 +2272,22 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq_id, mt8192_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret) {
-		dev_err(dev, "could not request_irq for Afe_ISR_Handle\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
 
 	for (i = 0; i < ARRAY_SIZE(dai_register_cbs); i++) {
 		ret = dai_register_cbs[i](afe);
-		if (ret) {
-			dev_warn(afe->dev, "dai register i %d fail, ret %d\n",
-				 i, ret);
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(afe->dev, ret, "dai %d register fail", i);
 	}
 
 	/* init dai_driver and component_driver */
 	ret = mtk_afe_combine_sub_dai(afe);
-	if (ret) {
-		dev_warn(afe->dev, "mtk_afe_combine_sub_dai fail, ret %d\n",
-			 ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(afe->dev, ret, "mtk_afe_combine_sub_dai fail\n");
 
 	/* others */
 	afe->mtk_afe_hardware = &mt8192_afe_hardware;
@@ -2320,19 +2303,15 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* register platform */
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					      &mt8192_afe_component, NULL, 0);
-	if (ret) {
-		dev_warn(dev, "err_platform\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Couldn't register AFE component\n");
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					      &mt8192_afe_pcm_component,
 					      afe->dai_drivers,
 					      afe->num_dai_drivers);
-	if (ret) {
-		dev_warn(dev, "err_dai_component\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Couldn't register AFE-PCM component\n");
 
 	return 0;
 }
-- 
2.44.0

