Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B8753CA20
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 14:43:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 556F91845;
	Fri,  3 Jun 2022 14:43:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 556F91845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654260238;
	bh=cb91Tr6shEd6dRMJCypSU+6I9YcgAYDwCu77wXjZiT4=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s0b/mMSvdVTdaGmkGzhcakEtktFwSB9kgLh6Zzf6GmxcR6liZxX7vHX1fjqDnK0Wp
	 0ltv7OSsrqNLk3b3EhsDr0+jEmOMeo/bJmigKmaiWuP3RJWQYv1WikcB5GWvV5zcK/
	 ZS5/uVKQNryfqPVaJCeiLQzegq5xpS5e/HYfNkyw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7D28F804D1;
	Fri,  3 Jun 2022 14:43:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35A1CF804CC; Fri,  3 Jun 2022 14:43:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FA5AF80089
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 14:42:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FA5AF80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="buW7IdY3"
Received: by mail-pg1-x530.google.com with SMTP id e66so7117801pgc.8
 for <alsa-devel@alsa-project.org>; Fri, 03 Jun 2022 05:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jCaeN99qbe80XdllZmNt/NTUfNqd3MU7NsYrWBRHqB8=;
 b=buW7IdY3iqfdV6Y6qR7TYjHvNuMvA/L04H0R8YSMDhiClFymdVYWGX8PmytWGvqRxh
 FOhWxuHje/Jlz6IoOzONeQaXPpN2OLDgyHokkR6JrZC94wWxXvaVQTIHnbw0oOX3bOBJ
 o82+3Iy/EtwXNT2MraVUNLfAyO3D/+DFTDiO1kq0lD1Lkylufvdn/Ze2kfaoynZmHJwI
 8Th8yW3GWOeE3s/f0D+uH7C5WB6Kdhq76q/f8XTbJc3w4jj3aTtKy4oc+5TLENSp4Ocv
 GtuMF1vcGj13EZEPNCpl5iJ7uysZn6ExNB9pXJqf1qwmyYAvAsZjxu5eQqlSu0KAnvRl
 7Bng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jCaeN99qbe80XdllZmNt/NTUfNqd3MU7NsYrWBRHqB8=;
 b=Q2JreD5/CHSNL5sJNPSpk1Lm0ZsGblVXy25kqED+5Apw7PeWZL1HScje6NxXpcWRhr
 9fPrVLxAl2had/0JqALoFXAxxR0+pHpXZkGrfDEJsx9cmgNxSv3yJgJA6DA4IR17Ri3O
 DaLVYLtfwFAk+wlJEA3R6mBEZMfbyyUtaioyrG7+40VXCWLTp2T8N3ItofFHTDAYFlKH
 A+jnM71fVZkfNXmJWYXMItdRV/quc7jTEHdicwj00top495GNwbpGMSqb43irzFJlf3w
 5UY4DYW4xC46ria/WZo3zCH8+fi0S+doC0l9uWLOcDa0Zi+49th8OtS5irXgqYgxFAoL
 /TfQ==
X-Gm-Message-State: AOAM531Z3vOoxyiiqXcYYhdYvFMIopCacgnlXpkoTVjeDIR+s9/Yor2M
 bTHFfIjUIsawNqjpaDw4hgc=
X-Google-Smtp-Source: ABdhPJxtjqcZQQnfkaDUcq0d4BxEe41StW6Nl7kFFyr+bh4ai1NO4S9DbH8MfP9DcPew/6oFyFwHRw==
X-Received: by 2002:aa7:8008:0:b0:51a:cae3:7563 with SMTP id
 j8-20020aa78008000000b0051acae37563mr33507197pfi.16.1654260175367; 
 Fri, 03 Jun 2022 05:42:55 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 v22-20020a17090ad59600b001e281acb2f1sm5079719pju.57.2022.06.03.05.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 05:42:54 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Miaoqian Lin <linmq006@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 PC Liao <pc.liao@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>,
 Koro Chen <koro.chen@mediatek.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: mediatek: mt8173-rt5650: Fix refcount leak in
 mt8173_rt5650_dev_probe
Date: Fri,  3 Jun 2022 16:42:41 +0400
Message-Id: <20220603124243.31358-1-linmq006@gmail.com>
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
Fix refcount leak in some error paths.

Fixes: 0f83f9296d5c ("ASoC: mediatek: Add machine driver for ALC5650 codec")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
- update fixes tag.
v1 Link: https://lore.kernel.org/r/20220603081308.1332-1-linmq006@gmail.com
---
 sound/soc/mediatek/mt8173/mt8173-rt5650.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650.c b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
index d1c94acb4516..e05f2b0231fe 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
@@ -280,7 +280,8 @@ static int mt8173_rt5650_dev_probe(struct platform_device *pdev)
 	if (!mt8173_rt5650_dais[DAI_LINK_CODEC_I2S].codecs[0].of_node) {
 		dev_err(&pdev->dev,
 			"Property 'audio-codec' missing or invalid\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_platform_node;
 	}
 	mt8173_rt5650_dais[DAI_LINK_CODEC_I2S].codecs[1].of_node =
 		mt8173_rt5650_dais[DAI_LINK_CODEC_I2S].codecs[0].of_node;
@@ -293,7 +294,7 @@ static int mt8173_rt5650_dev_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev,
 				"%s codec_capture_dai name fail %d\n",
 				__func__, ret);
-			return ret;
+			goto put_platform_node;
 		}
 		mt8173_rt5650_dais[DAI_LINK_CODEC_I2S].codecs[1].dai_name =
 			codec_capture_dai;
@@ -315,12 +316,14 @@ static int mt8173_rt5650_dev_probe(struct platform_device *pdev)
 	if (!mt8173_rt5650_dais[DAI_LINK_HDMI_I2S].codecs->of_node) {
 		dev_err(&pdev->dev,
 			"Property 'audio-codec' missing or invalid\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_platform_node;
 	}
 	card->dev = &pdev->dev;
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 
+put_platform_node:
 	of_node_put(platform_node);
 	return ret;
 }
-- 
2.25.1

