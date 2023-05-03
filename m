Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 098306F5742
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 13:37:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 044631181;
	Wed,  3 May 2023 13:36:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 044631181
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683113854;
	bh=b/Wo7uHjgQOrEwVVZgpoUQepTXszMcx3B1Den7DJPtc=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=I4D+zeRLhsf5EFEWdsQt51eXNMgt1M2l7Yr5kldY+mbZ2aaUuD7Ne7If8dvXeuWov
	 prkL4F8m1tTc6LCe5EsUdrFTOePT93SYCjbVhwl27M9ZzDBaXppzzN4N7uB+bcWhKK
	 0VQ+KXrFaLlfTlQb67w+k1dPgp8Mx0+hEa1jVl0M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40291F80557;
	Wed,  3 May 2023 13:36:16 +0200 (CEST)
To: lgirdwood@gmail.com
Subject: [PATCH 5/5] ASoC: mediatek: mt8195-afe-pcm: Clean up unnecessary
 functions
Date: Wed,  3 May 2023 13:34:13 +0200
In-Reply-To: <20230503113413.149235-1-angelogioacchino.delregno@collabora.com>
References: <20230503113413.149235-1-angelogioacchino.delregno@collabora.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AGRU723BLPUKPUUL6OTFNNXUV26OEWKP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168311377598.26.3452821100839014797@mailman-core.alsa-project.org>
From: AngeloGioacchino Del Regno via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: broonie@kernel.org, tiwai@suse.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com,
 pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, daniel.baluta@nxp.com,
 nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de,
 chunxu.li@mediatek.com, tinghan.shen@mediatek.com, error27@gmail.com,
 ribalda@chromium.org, yc.hung@mediatek.com, Allen-KH.Cheng@mediatek.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sound-open-firmware@alsa-project.org, kernel@collabora.com
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52B2EF804B1; Wed,  3 May 2023 13:36:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9EE7F800EC;
	Wed,  3 May 2023 13:34:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9EE7F800EC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=nnSLnjd9
Received: from IcarusMOD.eternityproject.eu (unknown
 [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 743AE66056D4;
	Wed,  3 May 2023 12:34:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683113668;
	bh=oygimjOCk8FTKzESWYFnGtWGKI3xuJTfmDm18J1tugE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nnSLnjd9bpSYeCY/2/NZVqduUmxCHwexohgvPshz2JTllUkmyRo/njwEw9d4MwMJT
	 7WEzj0+RlugeL+084Qu1byhLz321QBuV8Sp92WcW9OzgyfZhtdh9RnF9AP4e5g/EHW
	 wZvTDMxTRy+WptLhVtHFLPGx8Ifv3Vg6GQiytY7PaF4r5l1Qti/S0P4uF6QHP4VZ0S
	 uYa3FmhoPtjBPdT4YwwzCHzPe8XQAyhTpqzOo4CW4+mImzfQm5qUEWB1WEordvvWqk
	 Onn4CAvpadjEBcP9u3b3WgmRzKWsJ3zxVdgaTHuF3A+t+/U+XHxKLbGXCt2O6Cov0N
	 i+M3I5tgi8W/A==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lgirdwood@gmail.com
Subject: [PATCH 5/5] ASoC: mediatek: mt8195-afe-pcm: Clean up unnecessary
 functions
Date: Wed,  3 May 2023 13:34:13 +0200
Message-Id: <20230503113413.149235-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230503113413.149235-1-angelogioacchino.delregno@collabora.com>
References: <20230503113413.149235-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AGRU723BLPUKPUUL6OTFNNXUV26OEWKP
X-Message-ID-Hash: AGRU723BLPUKPUUL6OTFNNXUV26OEWKP
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: broonie@kernel.org, tiwai@suse.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com,
 pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, daniel.baluta@nxp.com,
 nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de,
 chunxu.li@mediatek.com, tinghan.shen@mediatek.com, error27@gmail.com,
 ribalda@chromium.org, yc.hung@mediatek.com, Allen-KH.Cheng@mediatek.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sound-open-firmware@alsa-project.org, kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AGRU723BLPUKPUUL6OTFNNXUV26OEWKP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Function mt8195_afe_init_registers() performs just a single call to
regmap_multi_reg_write(), it returns int and it's not error checked;
move that call to the probe function and also add some error check.

While at it, also move the contents of mt8195_afe_parse_of() to the
probe function as well: since this is getting a handle to topckgen
and since that's optional, the ifdef for CONFIG_SND_SOC_MT6359 can
also be removed.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 32 ++++++----------------
 1 file changed, 8 insertions(+), 24 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 105db11eecec..d22cf1664d8a 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3030,28 +3030,6 @@ static const struct reg_sequence mt8195_cg_patch[] = {
 	{ AUDIO_TOP_CON1, 0xfffffff8 },
 };
 
-static int mt8195_afe_init_registers(struct mtk_base_afe *afe)
-{
-	return regmap_multi_reg_write(afe->regmap,
-			mt8195_afe_reg_defaults,
-			ARRAY_SIZE(mt8195_afe_reg_defaults));
-}
-
-static void mt8195_afe_parse_of(struct mtk_base_afe *afe,
-				struct device_node *np)
-{
-#if IS_ENABLED(CONFIG_SND_SOC_MT6359)
-	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-
-	afe_priv->topckgen = syscon_regmap_lookup_by_phandle(afe->dev->of_node,
-							     "mediatek,topckgen");
-	if (IS_ERR(afe_priv->topckgen)) {
-		dev_info(afe->dev, "%s() Cannot find topckgen controller: %ld\n",
-			 __func__, PTR_ERR(afe_priv->topckgen));
-	}
-#endif
-}
-
 static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe;
@@ -3160,7 +3138,10 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, afe);
 
-	mt8195_afe_parse_of(afe, pdev->dev.of_node);
+	afe_priv->topckgen = syscon_regmap_lookup_by_phandle(dev->of_node, "mediatek,topckgen");
+	if (IS_ERR(afe_priv->topckgen))
+		dev_dbg(afe->dev, "Cannot find topckgen controller: %ld\n",
+			PTR_ERR(afe_priv->topckgen));
 
 	/* enable clock for regcache get default value from hw */
 	afe_priv->pm_runtime_bypass_reg_ctl = true;
@@ -3219,7 +3200,10 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 		goto err_pm_put;
 	}
 
-	mt8195_afe_init_registers(afe);
+	ret = regmap_multi_reg_write(afe->regmap, mt8195_afe_reg_defaults,
+				     ARRAY_SIZE(mt8195_afe_reg_defaults));
+	if (ret)
+		goto err_pm_put;
 
 	ret = pm_runtime_put_sync(dev);
 	if (ret)
-- 
2.40.1

