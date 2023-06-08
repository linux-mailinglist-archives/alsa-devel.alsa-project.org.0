Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C7D727A69
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 10:49:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C502E3E8;
	Thu,  8 Jun 2023 10:48:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C502E3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686214177;
	bh=Kw2e/m/DW7+RkOYVIurLc9HONlxzUhzrCDaVnDSwbXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eXo01+U58M7gfeei9XOgAuI9DIMABYH+0fEihvquVRCGUlC6mFie39aVyPtNaF8oD
	 WxE7hN0QoPeMWdpDHZN855xSWWnugPHDuPpc+Z9zezzz4/45RLFYDGHth9xkTQgNMq
	 a8GMU+ldyDMJBCs7HR5z68PqDBd4h2BsHMMuaDOQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F15AF80564; Thu,  8 Jun 2023 10:47:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50D3BF80254;
	Thu,  8 Jun 2023 10:47:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B788EF80199; Thu,  8 Jun 2023 10:47:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59F45F800ED
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 10:47:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59F45F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=TNT6KiJA
Received: from IcarusMOD.eternityproject.eu (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 90D486606F18;
	Thu,  8 Jun 2023 09:47:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686214059;
	bh=Kw2e/m/DW7+RkOYVIurLc9HONlxzUhzrCDaVnDSwbXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TNT6KiJAsUrDi/3k9KcOmGH5ZM5Uhfc30b149HprEzgpAJbGgaRnivt5RZXNd6d4t
	 5l3r54Hc4AF6CjDDj5sYvWltAHeLBuOtZCO2qtqf/DWyOAxHwCsEuVh3CmyLvXeIi1
	 T6W3g2fzVTjc0VJbxRng+yKIB08xpOf36Oiv5OSSXluYzD3kQfvV6X0QvkniGtBDgK
	 mRiCl3wLhVvhSmR9SE9dpo9wt0gKkHqvjw/91v01SyP4zOMFw6vj8rBNGn06ANBB/c
	 vRVY1jDJQbUUx1HAgBHUqRAqNT7/MpdlWcyf5zOeU6XECXyw1JbO5IAmn64rZzhV8J
	 JpUaTJ4Idy22Q==
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
Subject: [PATCH 3/5] ASoC: mediatek: mt8188-mt6359: Cleanup return 0 disguised
 as return ret
Date: Thu,  8 Jun 2023 10:47:25 +0200
Message-Id: <20230608084727.74403-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
References: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MRL2LUUD6RW5QFA7BDVNCVZ63HI5FY6A
X-Message-ID-Hash: MRL2LUUD6RW5QFA7BDVNCVZ63HI5FY6A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MRL2LUUD6RW5QFA7BDVNCVZ63HI5FY6A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Change all instances of `return ret` to `return 0` at the end of
functions where ret is always zero and also change functions
mt8188_{hdmi,dptx}_codec_init to be consistent with how other
functions are returning errors

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index b2735496d140..260cace408b9 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -491,11 +491,13 @@ static int mt8188_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
 	}
 
 	ret = snd_soc_component_set_jack(component, &priv->hdmi_jack, NULL);
-	if (ret)
+	if (ret) {
 		dev_info(rtd->dev, "%s, set jack failed on %s (ret=%d)\n",
 			 __func__, component->name, ret);
+		return ret;
+	}
 
-	return ret;
+	return 0;
 }
 
 static int mt8188_dptx_codec_init(struct snd_soc_pcm_runtime *rtd)
@@ -513,11 +515,13 @@ static int mt8188_dptx_codec_init(struct snd_soc_pcm_runtime *rtd)
 	}
 
 	ret = snd_soc_component_set_jack(component, &priv->dp_jack, NULL);
-	if (ret)
+	if (ret) {
 		dev_info(rtd->dev, "%s, set jack failed on %s (ret=%d)\n",
 			 __func__, component->name, ret);
+		return ret;
+	}
 
-	return ret;
+	return 0;
 }
 
 static int mt8188_dumb_amp_init(struct snd_soc_pcm_runtime *rtd)
@@ -539,7 +543,7 @@ static int mt8188_dumb_amp_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	return ret;
+	return 0;
 }
 
 static int mt8188_max98390_hw_params(struct snd_pcm_substream *substream,
@@ -612,7 +616,7 @@ static int mt8188_max98390_codec_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	return ret;
+	return 0;
 }
 
 static int mt8188_nau8825_codec_init(struct snd_soc_pcm_runtime *rtd)
@@ -660,7 +664,7 @@ static int mt8188_nau8825_codec_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	return ret;
+	return 0;
 };
 
 static void mt8188_nau8825_codec_exit(struct snd_soc_pcm_runtime *rtd)
@@ -697,7 +701,7 @@ static int mt8188_nau8825_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	return ret;
+	return 0;
 }
 
 static const struct snd_soc_ops mt8188_nau8825_ops = {
-- 
2.40.1

