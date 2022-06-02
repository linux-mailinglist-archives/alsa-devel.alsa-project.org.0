Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0053C53B230
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 05:43:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53D8D173E;
	Thu,  2 Jun 2022 05:42:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53D8D173E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654141384;
	bh=7xppU03VeU8jRWLCHZujauCj5/DD8LOBmGHD6HeSSgc=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DThvpaG3pcxWiTWcuHWSPucC+r9aUXNedbSebPyXEGdOSkhwiSjQaTl2Wz6XhNZmh
	 +gK9SjVYiFwsbKi/YN39mbPzDVY65HbSmXpxlbj1ipe2pPoaRpbRMsqNEEKfuHDYnh
	 E9LAotJJ8xzEYRYY28TfEcvbF2DlFkZvv39PtlsE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC77BF8025E;
	Thu,  2 Jun 2022 05:42:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F906F80236; Thu,  2 Jun 2022 05:42:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9D99F80124
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 05:41:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9D99F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XUstNAd+"
Received: by mail-pg1-x534.google.com with SMTP id 137so3656740pgb.5
 for <alsa-devel@alsa-project.org>; Wed, 01 Jun 2022 20:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=96Q41uk4y6XbcZl1Zsx4+krpYFpttRN8NWnLOQ9e608=;
 b=XUstNAd+TkZxYOg2nB0/CnWOe031scydaaFy5ujX6N9OPZ4fDymvFtAI9RQ5HtU9xy
 1mPG+WzesqN4xw/HI+17JlvYsYombwEsWJy+zxHHswmhFSXNKdx6fgFhpGGP8juPpFz6
 5bYIBgfJW5l3glxrFfHyFw6eCaCdbe7URRR2yAselbs8VOuEWjwsNBowqmT0TzePPjrk
 Ld7vQMAppj2mohHZqCfIoa3gjuGIyvzm8iFMAru5vGPmAqdIAAqkceY9mie5fLcqPv0s
 PbLdcJQIxOxrsBdXRC9VtP5+lnuaZfIbA1QDX2XuCNqjoLaG7zeTvavawY9e5kh8Ku/c
 CAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=96Q41uk4y6XbcZl1Zsx4+krpYFpttRN8NWnLOQ9e608=;
 b=tUHZSlRk7rmOVMQj2JsQX82KqiVfge9Fg8UQHTITYVe1p9SfL2pkw7gG7tEDhbfHMT
 BbdclfI72SjrYm7Fwy5ueEh8c3OB4KU9n+Q9w2PnUfJbHXutRgMaoIJjPVaU3OZjg1dM
 8oNmnFDmyNKWPen1fqmudXHAbd1GOPTQ5xsE7d5yYxofPlCi9LC2JgUP/iFRTBFVEaDk
 8+zDJc4tMRiQSm7ch1L/4idKMILHWZNhhdGcTvxe5HKd/CQZMlVtktxqxGplcdOpD7IL
 bBbsBuy9k2mvb2FPxFPSgIqBAFhcH7Wiq/CoBR3BCI+hLCVu56vUiZlC8D9AifdB1dQo
 yfdw==
X-Gm-Message-State: AOAM531cfcSu/fh3APG6ZvNd70m37rjPf2COk0nKqRoEh2NfsyFlJNIT
 UqMKD2Z6IN9ExTcdcpQeehM=
X-Google-Smtp-Source: ABdhPJyPyKsY1RQq4rtR0YQcNAGzw5ULWmM3dgngCbyE+JjqSgZREIGNeNy4NwVWNPsBK4RJSAeXyg==
X-Received: by 2002:a63:7e4e:0:b0:3db:945a:2575 with SMTP id
 o14-20020a637e4e000000b003db945a2575mr2354037pgn.227.1654141315261; 
 Wed, 01 Jun 2022 20:41:55 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 o24-20020a17090ac09800b001e2f578560csm2104137pjs.45.2022.06.01.20.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 20:41:54 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Miaoqian Lin <linmq006@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Koro Chen <koro.chen@mediatek.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8173: Fix refcount leak in
 mt8173_rt5650_rt5676_dev_probe
Date: Thu,  2 Jun 2022 07:41:42 +0400
Message-Id: <20220602034144.60159-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

of_parse_phandle() returns a node pointer with refcount
incremented, we should use of_node_put() on it when not need anymore.
Fix missing of_node_put() in error paths.

Fixes: 94319ba10eca ("ASoC: mediatek: Use platform_of_node for machine drivers")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
index 70bf312e855f..8794720cea3a 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650-rt5676.c
@@ -256,14 +256,16 @@ static int mt8173_rt5650_rt5676_dev_probe(struct platform_device *pdev)
 	if (!mt8173_rt5650_rt5676_dais[DAI_LINK_CODEC_I2S].codecs[0].of_node) {
 		dev_err(&pdev->dev,
 			"Property 'audio-codec' missing or invalid\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_node;
 	}
 	mt8173_rt5650_rt5676_dais[DAI_LINK_CODEC_I2S].codecs[1].of_node =
 		of_parse_phandle(pdev->dev.of_node, "mediatek,audio-codec", 1);
 	if (!mt8173_rt5650_rt5676_dais[DAI_LINK_CODEC_I2S].codecs[1].of_node) {
 		dev_err(&pdev->dev,
 			"Property 'audio-codec' missing or invalid\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_node;
 	}
 	mt8173_rt5650_rt5676_codec_conf[0].dlc.of_node =
 		mt8173_rt5650_rt5676_dais[DAI_LINK_CODEC_I2S].codecs[1].of_node;
@@ -276,13 +278,15 @@ static int mt8173_rt5650_rt5676_dev_probe(struct platform_device *pdev)
 	if (!mt8173_rt5650_rt5676_dais[DAI_LINK_HDMI_I2S].codecs->of_node) {
 		dev_err(&pdev->dev,
 			"Property 'audio-codec' missing or invalid\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_node;
 	}
 
 	card->dev = &pdev->dev;
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 
+put_node:
 	of_node_put(platform_node);
 	return ret;
 }
-- 
2.25.1

