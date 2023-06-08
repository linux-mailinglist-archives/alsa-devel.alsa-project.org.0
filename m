Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CE8727A66
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 10:48:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 114EE6C0;
	Thu,  8 Jun 2023 10:47:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 114EE6C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686214128;
	bh=GnnvLVruG/Y33qFCquYPrGvofADRKh+faHOxi3VmkPI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eh6JpHXCRHOviGBs/7qSCZ635+VcIhLuflTiz0bVq3E5bJH7BcSboVy0geLsRW3bh
	 f7Y3WUySOnM6FISdtdJrA8Koj6u5GIZviRWB0YlZrlvJeCX+1+7oqYi7k9jup3vRB3
	 tQBWltbEIIDvdtLe54Ov94DWynIxDQTa2KDzfr2M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91DF6F80290; Thu,  8 Jun 2023 10:47:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C911EF80254;
	Thu,  8 Jun 2023 10:47:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B65CF80254; Thu,  8 Jun 2023 10:47:51 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F524F80130
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 10:47:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F524F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=K3FR3YDR
Received: from IcarusMOD.eternityproject.eu (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9D7766606F19;
	Thu,  8 Jun 2023 09:47:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686214060;
	bh=GnnvLVruG/Y33qFCquYPrGvofADRKh+faHOxi3VmkPI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K3FR3YDRoNDC3LYRTZPIk5Rn0nu9jgsm8EPFVdYkLRCBkIRuQVlLT9BdgMshZzk9D
	 2S8qEh6Y/Wl0WGnCL51l/+Vl0bg1d64uivRaGNfXfpmFY+OqFtYV9hfUg+XJiZ7xVV
	 LQt1KyKn/DLUA9gRc5j+Rv5OXwIfmUftXMLZxkRYnBzWvZXFxB5Ek1BwzJhHhtJK66
	 OwOpZYksqB7grpu1ZNzENrQNmTDGNrgs7Q9mbyVQFalxRnPhlhYuGGUpGmAI9xn10J
	 gYb9Q42zm03N+gmDaJyOJjPOkFBF/BDgUdnD77G1mc/3nPXa5pv4guep0tu3gjgzfg
	 ZGZ/uzDnU0zcA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	trevor.wu@mediatek.com,
	amergnat@baylibre.com,
	dan.carpenter@linaro.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 4/5] ASoC: mediatek: mt8188-mt6359: Clean up log levels
Date: Thu,  8 Jun 2023 10:47:26 +0200
Message-Id: <20230608084727.74403-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
References: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XYXNE26E6DJ6LTI2SVXDWE7OTKHDV4SN
X-Message-ID-Hash: XYXNE26E6DJ6LTI2SVXDWE7OTKHDV4SN
X-MailFrom: angelogioacchino.delregno@collabora.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XYXNE26E6DJ6LTI2SVXDWE7OTKHDV4SN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Change some dev_info prints to dev_err() and some to dev_dbg(),
depending on the actual severity of them.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 260cace408b9..5b2660139421 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -337,9 +337,8 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 
 			/* handle if never test done */
 			if (++counter > 10000) {
-				dev_info(afe->dev, "%s(), test fail, cycle_1 %d, cycle_2 %d, monitor 0x%x\n",
-					 __func__,
-					 cycle_1, cycle_2, monitor);
+				dev_err(afe->dev, "%s(), test fail, cycle_1 %d, cycle_2 %d, monitor 0x%x\n",
+					__func__, cycle_1, cycle_2, monitor);
 				mtkaif_calibration_ok = false;
 				break;
 			}
@@ -398,8 +397,8 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 	for (i = 0; i < MT8188_MTKAIF_MISO_NUM; i++)
 		param->mtkaif_phase_cycle[i] = mtkaif_phase_cycle[i];
 
-	dev_info(afe->dev, "%s(), end, calibration ok %d\n",
-		 __func__, param->mtkaif_calibration_ok);
+	dev_dbg(afe->dev, "%s(), end, calibration ok %d\n",
+		__func__, param->mtkaif_calibration_ok);
 
 	return 0;
 }
@@ -486,14 +485,14 @@ static int mt8188_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
 					 mt8188_hdmi_jack_pins,
 					 ARRAY_SIZE(mt8188_hdmi_jack_pins));
 	if (ret) {
-		dev_info(rtd->dev, "%s, new jack failed: %d\n", __func__, ret);
+		dev_err(rtd->dev, "%s, new jack failed: %d\n", __func__, ret);
 		return ret;
 	}
 
 	ret = snd_soc_component_set_jack(component, &priv->hdmi_jack, NULL);
 	if (ret) {
-		dev_info(rtd->dev, "%s, set jack failed on %s (ret=%d)\n",
-			 __func__, component->name, ret);
+		dev_err(rtd->dev, "%s, set jack failed on %s (ret=%d)\n",
+			__func__, component->name, ret);
 		return ret;
 	}
 
@@ -510,14 +509,14 @@ static int mt8188_dptx_codec_init(struct snd_soc_pcm_runtime *rtd)
 					 &priv->dp_jack, mt8188_dp_jack_pins,
 					 ARRAY_SIZE(mt8188_dp_jack_pins));
 	if (ret) {
-		dev_info(rtd->dev, "%s, new jack failed: %d\n", __func__, ret);
+		dev_err(rtd->dev, "%s, new jack failed: %d\n", __func__, ret);
 		return ret;
 	}
 
 	ret = snd_soc_component_set_jack(component, &priv->dp_jack, NULL);
 	if (ret) {
-		dev_info(rtd->dev, "%s, set jack failed on %s (ret=%d)\n",
-			 __func__, component->name, ret);
+		dev_err(rtd->dev, "%s, set jack failed on %s (ret=%d)\n",
+			__func__, component->name, ret);
 		return ret;
 	}
 
-- 
2.40.1

