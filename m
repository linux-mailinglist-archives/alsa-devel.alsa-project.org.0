Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AA84EC0D5
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 13:54:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A71D18C7;
	Wed, 30 Mar 2022 13:53:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A71D18C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648641255;
	bh=CdMizYcg0vqRMBZy3nZIQsY6pEwDwVuUydNu+uhIk38=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HyP4v81k3VdbY9ZKcr8nYGjRZuzauKYWsatebI883IQTJqnQv/3ZQnxYaVtxhb5rT
	 09LYqJwXaWvNVMjCzqmpe26hKYQ9PJw7eaopDzf6fR7n3WlcDQox87mGK2zTQd+WyY
	 4ySW8WIziSsVEGPOACS75kOXvtj7LXCS07GKzIi8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1BE0F805BB;
	Wed, 30 Mar 2022 13:48:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A6FAF805AB; Wed, 30 Mar 2022 13:48:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3751AF8057A
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:48:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3751AF8057A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hxx23rJV"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E080861637;
 Wed, 30 Mar 2022 11:48:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2FD1C34112;
 Wed, 30 Mar 2022 11:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648640905;
 bh=CdMizYcg0vqRMBZy3nZIQsY6pEwDwVuUydNu+uhIk38=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hxx23rJVV3pAQMX36J9gEjQqNIY2BS7XRvHlsJCvjgWmhEunErpOxX979TXFCFdOK
 wkK+GQVSZCjLlP/ffm0wvStIxm1AUpZUjCwtwGFNEsA3X5Q+3G3LZChLls5d9E1LMf
 K4XxoZP1jOUeqJaeYk0wn/naNR/+qyKWT0JZRbKyoIDGQAnrPG4+XD/l2lmA4+Q/C3
 LlQyXEGhlP9XqmLdGHEGVggNIRyoFQnSMHBhgEmP2nkHR8U8BSqZPL7RMbUvPU9+N3
 A8t0G9yeBC5PX87x4FGy+qokDiaYxnGIzx4MlcBFsvOJ1WX+YcdtwO53c+9oprCNQ3
 VKt7VkUqBuZtw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 63/66] ASoC: mediatek: Fix error handling in
 mt8183_da7219_max98357_dev_probe
Date: Wed, 30 Mar 2022 07:46:42 -0400
Message-Id: <20220330114646.1669334-63-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330114646.1669334-1-sashal@kernel.org>
References: <20220330114646.1669334-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, Miaoqian Lin <linmq006@gmail.com>,
 alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Tzung-Bi Shih <tzungbi@kernel.org>, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Miaoqian Lin <linmq006@gmail.com>

[ Upstream commit 28a265a1ee11febeec5ea73a804f30dcec3181ca ]

The device_node pointer is returned by of_parse_phandle()  with refcount
incremented. We should use of_node_put() on it when done.

This function only calls of_node_put() in the regular path.
And it will cause refcount leak in error paths.
Fix this by calling of_node_put() in error handling too.

Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Link: https://lore.kernel.org/r/20220316014059.19292-1-linmq006@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 23 +++++++++++++------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index 718505c75418..f090dee0c7a4 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -695,8 +695,11 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 	}
 
 	card = (struct snd_soc_card *)of_device_get_match_data(&pdev->dev);
-	if (!card)
-		return -EINVAL;
+	if (!card) {
+		ret = -EINVAL;
+		goto put_platform_node;
+	}
+
 	card->dev = &pdev->dev;
 
 	hdmi_codec = of_parse_phandle(pdev->dev.of_node,
@@ -761,12 +764,15 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 	if (!mt8183_da7219_max98357_headset_dev.dlc.of_node) {
 		dev_err(&pdev->dev,
 			"Property 'mediatek,headset-codec' missing/invalid\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_hdmi_codec;
 	}
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
+	if (!priv) {
+		ret = -ENOMEM;
+		goto put_hdmi_codec;
+	}
 
 	snd_soc_card_set_drvdata(card, priv);
 
@@ -775,13 +781,16 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 		ret = PTR_ERR(pinctrl);
 		dev_err(&pdev->dev, "%s failed to select default state %d\n",
 			__func__, ret);
-		return ret;
+		goto put_hdmi_codec;
 	}
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 
-	of_node_put(platform_node);
+
+put_hdmi_codec:
 	of_node_put(hdmi_codec);
+put_platform_node:
+	of_node_put(platform_node);
 	return ret;
 }
 
-- 
2.34.1

