Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62133490D62
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jan 2022 18:02:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E87F918AA;
	Mon, 17 Jan 2022 18:01:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E87F918AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642438969;
	bh=grTelnkSX6Y12cAJ2c2Z7iI+CF/lO3oFNnwSui4aYhQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iIR5kK/r2A/GWKoywgwEdu1rRjlTD58GLWFRxIKPEYvi+nZkJOQUwydoeRaNXuQUa
	 8RklSfx5A8Tv4ETqhwxE/ZIrK14UX39TV+zZhLsSgixZUuQLSaOh+iiFGrxRX4NOV8
	 FMpCPvSOkJ72rFedHhBys8J+fbGFVOMvZ0EALKkg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C3BDF80249;
	Mon, 17 Jan 2022 18:01:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E40DF80507; Mon, 17 Jan 2022 18:01:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E0DAF80525
 for <alsa-devel@alsa-project.org>; Mon, 17 Jan 2022 18:01:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E0DAF80525
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FAwRg9Fj"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8BB52611CC;
 Mon, 17 Jan 2022 17:01:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EBA2C36AE3;
 Mon, 17 Jan 2022 17:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642438863;
 bh=grTelnkSX6Y12cAJ2c2Z7iI+CF/lO3oFNnwSui4aYhQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FAwRg9FjhEZO6YeRXgFcKaOLTmqRwTe94xPkcObvK8OLJ22fjhIJCqCYTKBMAs2Dk
 3zKNQ6ZxCf/kTRzSYDD3RNaf2i1Vdl/tERgqkH2JNLK/y4eL8DKK46D6OwoMkDpfjV
 aq45jBkRb5piZfENjohw1zLQzWINAPy3p0lx35qF6V+RDwK8SOgKR6q8qwB8s8Q81K
 HqsraVngMF2o8C+6d7K9dhGRAvUH+nLbGSDuYIa3Kb3cfaaHo5Zuu1FBNpk/hhWeQJ
 FGRylGb8w5lJ3QtJjrVO0036MRQgu8NmDGPy8gFEgT16qsmF5F2Nfi0qvgeZ59ewWC
 hrCc3etzubmVg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 46/52] ASoC: mediatek: mt8183: fix device_node
 leak
Date: Mon, 17 Jan 2022 11:58:47 -0500
Message-Id: <20220117165853.1470420-46-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117165853.1470420-1-sashal@kernel.org>
References: <20220117165853.1470420-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 tiwai@suse.com, jiaxin.yu@mediatek.com, lgirdwood@gmail.com,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, rikard.falkeborn@gmail.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
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

From: Tzung-Bi Shih <tzungbi@google.com>

[ Upstream commit cb006006fe6221f092fadaffd3f219288304c9ad ]

Fixes the device_node leak.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Link: https://lore.kernel.org/r/20211224064719.2031210-3-tzungbi@google.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c         | 6 +++++-
 sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c | 7 ++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index a4d26a6fc8492..bda103211e0bd 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -781,7 +781,11 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	return devm_snd_soc_register_card(&pdev->dev, card);
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
+
+	of_node_put(platform_node);
+	of_node_put(hdmi_codec);
+	return ret;
 }
 
 #ifdef CONFIG_OF
diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index aeb1af86047ef..9f0bf15fe465e 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -780,7 +780,12 @@ mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 				 __func__, ret);
 	}
 
-	return devm_snd_soc_register_card(&pdev->dev, card);
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
+
+	of_node_put(platform_node);
+	of_node_put(ec_codec);
+	of_node_put(hdmi_codec);
+	return ret;
 }
 
 #ifdef CONFIG_OF
-- 
2.34.1

