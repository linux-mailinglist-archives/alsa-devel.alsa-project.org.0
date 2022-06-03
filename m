Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C34A53C6CB
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jun 2022 10:14:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D62BD181A;
	Fri,  3 Jun 2022 10:13:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D62BD181A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654244064;
	bh=abnWwKkqq5PYGVK9R3FoNtS+jhsGrPxYlz2qgr4e6nU=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=k/1BY8pZQu9zoJSDUYmr1v/GLp1nsoAo6H27uBUkwfXiIn2NdrQCUodNgaljbDKdW
	 HNQY28vHL2h7AH0RGn+8ZQcxIDtx24NrgFPjeF6JXFb4ky1xFjYB1Wt9jqCWsAV5nj
	 lTAz2xRHSaWHLvdegaGnWwbU9Du1myR2JVzrc2Go=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54D8BF80124;
	Fri,  3 Jun 2022 10:13:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3CC1F804CC; Fri,  3 Jun 2022 10:13:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCB15F80124
 for <alsa-devel@alsa-project.org>; Fri,  3 Jun 2022 10:13:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCB15F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bCedhaJN"
Received: by mail-pf1-x436.google.com with SMTP id e11so6671604pfj.5
 for <alsa-devel@alsa-project.org>; Fri, 03 Jun 2022 01:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jJndwsNGJ35YpfT/6ZKzsPH00jUacPeRpJYnOHA8axY=;
 b=bCedhaJN+3BeY6a2bO0Sz6Cv+ieP/MqSu7rAmZaMfRV0u23z583tS5kcCsjcjlAbyg
 jW/S0/2riIakoh/gVc3nfWbOy9RS2cS56xFtDgTF4S4IFLoC7XIxBK1qQtDCYr1tFE1r
 Zq9SR8HzQfqaEYKZ1J+maSu0J0YxsMpOeNWqf1j4UxNGvi/NV7CFcxpstn4XHvB1odjN
 Tr3b5SNo1uQ3GhnHixh80GE2mNPrvXzs9MwTKVOLWLKtJ8NPvmQrJQPbHj8nNgVokgaL
 pJbrDWYC5kFIGL1jyWU59WagyhGwEHlOVgEVYQIChRG5/PwDfovy4efBiSR/iLBCmE9o
 X85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jJndwsNGJ35YpfT/6ZKzsPH00jUacPeRpJYnOHA8axY=;
 b=ieTUoY/+IHVKS3QdvU3wlBqEwJ9dVg0r23LHqXtfzs0lGppNTclywgHc0sXpdDA+2F
 9vhgYB0h9ShswifvfT78Op0meGiQg3cAIH0Mnvj72/xN/2yMbNISs5DwCN4uXWQTl8+/
 YLcO2RTCfup9W4UiLdfsFRykesXixrL/2JIEK32z7K230jRzp74nFhMpP5dwkMlMX5rX
 Dg9WMWU6mFtaZwcZ4PHDpSijCXWd+LHKPk5rJdZKrcNkMiOFLXjiag9BbLVRgDhDUU5d
 d7xX83Le5VnhioffU3eZBq7nVzZlrksTRkzzGp76vv9fpXYbg7lZs9LlSh8OcXxED59K
 qDdA==
X-Gm-Message-State: AOAM533bMVeGgFkWE22koq28wETCRrN1KYmdsGQWuGIjK6N8hmVfGWdq
 wWPoKQ0LG3pFWKNR8AMlrK8=
X-Google-Smtp-Source: ABdhPJzLhSSgE1fP7Y2/aGP4aExAqPKXsnEkw1E0WB57GnC/qOzY/ZO6hIqB9pDe+P7Zrd5CDEqevw==
X-Received: by 2002:a62:1744:0:b0:51b:ab76:e8c4 with SMTP id
 65-20020a621744000000b0051bab76e8c4mr9339294pfx.42.1654243999461; 
 Fri, 03 Jun 2022 01:13:19 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 g6-20020a170902c38600b00163de9e9342sm4829424plg.17.2022.06.03.01.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 01:13:18 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Miaoqian Lin <linmq006@gmail.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8173-rt5650: Fix refcount leak in
 mt8173_rt5650_dev_probe
Date: Fri,  3 Jun 2022 12:13:06 +0400
Message-Id: <20220603081308.1332-1-linmq006@gmail.com>
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

Fixes: format:0f83f9296d5c ("ASoC: mediatek: Add machine driver for ALC5650 codec")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
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

