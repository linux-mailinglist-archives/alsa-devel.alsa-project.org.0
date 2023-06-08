Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 496A0727A6B
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 10:50:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38C5F6C0;
	Thu,  8 Jun 2023 10:49:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38C5F6C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686214201;
	bh=v2RbZsJIF8OTePPv81vl/VBbI91A/spCjRghtDBNM7Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S9OiDmfHr+YWHE+usGIvgYpAUS/TJYn+4G0inHR8a4ZerwwgPtR9XTK2g2EN9hmET
	 TmJpf09ZGzIMlYynPEEE1cpNqL4y58ezy6+iO1EqO6thv9UvTnJMSYFDCFSXJZNqkO
	 lnugt8yb7hcY2Jm2fnphuLL4bvNy7VBFeup0uDEI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFFB7F8059F; Thu,  8 Jun 2023 10:48:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26415F8057F;
	Thu,  8 Jun 2023 10:48:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99FF4F80570; Thu,  8 Jun 2023 10:47:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57DECF80544
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 10:47:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57DECF80544
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=Gf18HmSx
Received: from IcarusMOD.eternityproject.eu (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8072D6606F17;
	Thu,  8 Jun 2023 09:47:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686214058;
	bh=v2RbZsJIF8OTePPv81vl/VBbI91A/spCjRghtDBNM7Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gf18HmSx3F3dEulzyCcItyoErGryylnFIIreRlee5hstTnWvpZqirZdfVHhz8G197
	 kdkwZRySUDM8IkybCap5MZL0Tw6+iL3ERDCi0TIWFnPUkYszkTBXH09G8kFlBGr/Oh
	 gnr8RWhiYZtZ48wF1iRKRzcE0wE6JVyiWWbqEBDOPpbT5Rf7+hQJucVaVXJwPKQwni
	 hfPGvtjB3+QZkV0dTsL6I4bsAXw4kMonXZZbX4BSBPdvrPQBsTPOLE80/QfAPcM5uR
	 L7vnSMA3Fh4ZH9Vok4qVDmVI2Iv2tIjabo/pBR7gEx5bhxnmPLfl7L6G4Hfxacfdz3
	 +e+X/z2uFLSWA==
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
Subject: [PATCH 2/5] ASoC: mediatek: mt8188-mt6359: clean up a return in
 codec_init
Date: Thu,  8 Jun 2023 10:47:24 +0200
Message-Id: <20230608084727.74403-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
References: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6SLXC56WHTEAPI5A6CWORSZZSVL544UK
X-Message-ID-Hash: 6SLXC56WHTEAPI5A6CWORSZZSVL544UK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6SLXC56WHTEAPI5A6CWORSZZSVL544UK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Dan Carpenter <dan.carpenter@linaro.org>

This code triggers a Smatch static checker warning and does sort of
look like an error path.

sound/soc/mediatek/mt8188/mt8188-mt6359.c:597 mt8188_max98390_codec_init() warn: missing error code? 'ret'

However, returning 0 is intentional.  Make that explicit.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 643a7a12a96b..b2735496d140 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -594,7 +594,7 @@ static int mt8188_max98390_codec_init(struct snd_soc_pcm_runtime *rtd)
 	}
 
 	if (rtd->dai_link->num_codecs <= 2)
-		return ret;
+		return 0;
 
 	/* add widgets/controls/dapm for rear speakers */
 	ret = snd_soc_dapm_new_controls(&card->dapm, mt8188_rear_spk_widgets,
-- 
2.40.1

