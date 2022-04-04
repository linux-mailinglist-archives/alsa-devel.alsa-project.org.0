Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6363B4F1202
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Apr 2022 11:30:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 102CE16C1;
	Mon,  4 Apr 2022 11:29:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 102CE16C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649064616;
	bh=0Lo+OEo6QeTVMIYWkrOb6qU6sgubXGRiVOiMAlZgNpc=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YY1PG4EkI8J/IzFGZMbX2h0gBFWi0Jycv1qJ3Nq7FmlocB+jTc7ri+ZrJLl+5NOQd
	 GmTM0T3Nfxc0H+x4DGoWoqT13LrR2oplj032hn5iZVFDQaBf5Ad5bvpj5LDh1mOdzH
	 OLbB65M4Zmy6J1m0TXkuU9xQLJwuCjxYKoVZ/js0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 859FDF801F7;
	Mon,  4 Apr 2022 11:29:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26D5BF8010B; Mon,  4 Apr 2022 11:29:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A0E9F8010B
 for <alsa-devel@alsa-project.org>; Mon,  4 Apr 2022 11:29:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A0E9F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nBv0RJtY"
Received: by mail-pg1-x52e.google.com with SMTP id q19so7856984pgm.6
 for <alsa-devel@alsa-project.org>; Mon, 04 Apr 2022 02:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id;
 bh=25rklRbKCPsv/fRQUYfQLO06IirkCoUcr/CH2yXPlg0=;
 b=nBv0RJtYmfjSnEU9JW7F8vPjVAc38XVKIiB+Nv1Pyj/2Kl3CbuQTBfdZsewPPKnt6m
 eRu9uOkrg/e9NhZhQ15shTFSGJfOzGjQatHbtfehqNJ5f4GhoTGlVd3F/RrWhucFZneO
 WU6vJl0X1XI03mve7bJACyyr2/piw3Ai+Xh/ApNfdN6YuT2F0+o/kbmFKiRRrXd5ibzz
 S0mgTCO0YWRYrIhQbc+xuAnvYmZHWVRzAdljZuvh3i2qDf4JPYR7qGxiVal1ii7mWz76
 t/V8vil3Q32bQhtdLFQNEN8AHLnhaZ1LIXIdbvZDLNmkwEpWugRXsYsJYgrUa9u9h+mi
 /+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=25rklRbKCPsv/fRQUYfQLO06IirkCoUcr/CH2yXPlg0=;
 b=Ah8AoX07YDVhnIEmeP/LCiG0/5b7dP5qulzgQX6bqQaxCQ0iJvx69LXUj0zAN4S1C7
 l3kZ2FukUTOxlBeCpCM3tnT4Bqmf0gabRPwow6iMrG2HpzMzWaK16dSLi5HseKVIftHv
 eqWsSsW/rZp9dpkzDBANwlgj6HMzXm9xkHHqTgpiA0/frn8DUhHC+YgXhruNN7oOM9EV
 nf2CauL5jKtyRTMV/MtBSykdLBSfv4Sl+dtQ9/++ng0hIf9pof8SMl4Hab972WGlaFbr
 pBs/hJy2dWrdqK8RbfLuJ2fzZ2QZZ49RYyAeFXLVTS7zSQ+d+pq2AApEEDDmi4Mlb94Q
 hwCg==
X-Gm-Message-State: AOAM532FejwEKRe5GWw2lZyDH5rS5HVenUJiT629NwFkWaEJ29maBH5f
 CfJw/OjgrJSEApivdRX1PKE=
X-Google-Smtp-Source: ABdhPJzDhNqYIqvfdG6d/FBo1eOl6xSsWZwI4Iti4exghBFyDjhz9X/Fg/iKNHzjDK0eLF6hNJVhjA==
X-Received: by 2002:a63:3344:0:b0:398:2527:a122 with SMTP id
 z65-20020a633344000000b003982527a122mr25559649pgz.140.1649064549916; 
 Mon, 04 Apr 2022 02:29:09 -0700 (PDT)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 h189-20020a636cc6000000b0039841f669bcsm10063032pgc.78.2022.04.04.02.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 02:29:09 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Miaoqian Lin <linmq006@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Koro Chen <koro.chen@mediatek.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: Fix error handling in
 mt8173_max98090_dev_probe
Date: Mon,  4 Apr 2022 09:29:01 +0000
Message-Id: <20220404092903.26725-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
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

Call of_node_put(platform_node) to avoid refcount leak in
the error path.

Fixes: 94319ba10eca ("ASoC: mediatek: Use platform_of_node for machine drivers")
Fixes: 493433785df0 ("ASoC: mediatek: mt8173: fix device_node leak")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/mediatek/mt8173/mt8173-max98090.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-max98090.c b/sound/soc/mediatek/mt8173/mt8173-max98090.c
index 4cb90da89262..58778cd2e61b 100644
--- a/sound/soc/mediatek/mt8173/mt8173-max98090.c
+++ b/sound/soc/mediatek/mt8173/mt8173-max98090.c
@@ -167,7 +167,8 @@ static int mt8173_max98090_dev_probe(struct platform_device *pdev)
 	if (!codec_node) {
 		dev_err(&pdev->dev,
 			"Property 'audio-codec' missing or invalid\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_platform_node;
 	}
 	for_each_card_prelinks(card, i, dai_link) {
 		if (dai_link->codecs->name)
@@ -179,6 +180,8 @@ static int mt8173_max98090_dev_probe(struct platform_device *pdev)
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 
 	of_node_put(codec_node);
+
+put_platform_node:
 	of_node_put(platform_node);
 	return ret;
 }
-- 
2.17.1

