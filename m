Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 601ED6A0CA
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jul 2019 05:26:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1CE81668;
	Tue, 16 Jul 2019 05:25:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1CE81668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563247576;
	bh=TgXpG6JIXBhXwTTHN3vULKL2NYx1QAQJ9eihmCIZvac=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rnqb6nRcmhAgZ976bWQyO9dv9CDMsevREqmJsg5RsqWz5NBbwTKLS0RDqnJIfviL2
	 Wq9CU5cKc+DTHUEdwofbOmsy6kn7pFnRDC9gqaaZA3U+GfL5eOme67A3kDYkVZVy2W
	 a2IuAfuYcNgestn4pxY1b8s1+Q/L831/igWPXIAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 324DEF802BC;
	Tue, 16 Jul 2019 05:24:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F5D9F80376; Tue, 16 Jul 2019 05:24:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-vk1-xa49.google.com (mail-vk1-xa49.google.com
 [IPv6:2607:f8b0:4864:20::a49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EB78F802BC
 for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2019 05:24:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EB78F802BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="stfwt9El"
Received: by mail-vk1-xa49.google.com with SMTP id g68so6001435vkb.1
 for <alsa-devel@alsa-project.org>; Mon, 15 Jul 2019 20:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=7b05BkvolhSE/ubLPt25XIO8y/mef1hcytV7DRdGElE=;
 b=stfwt9El0FCddOuWFoHny3chrkx81qH+1c9H1gAypoTtv8+TjRI2EIEnZd2uAYn+MA
 kRtsb5hehc/jkQGNrPxAMotFgGfoF376lomJfv//DQxlPLg0jwR/bgTPFHLwHvriERds
 QgJE1V+x+ybWy8RmxaTXi9kY0F7LiVbq7HGrElNy2rSikUjW/aqjZhajTgm0VFIj4Liw
 f/1MjOM1fPRpFN5JM2KgYVF8U1DfnAgzjkw/8tuYgdGGXdGcJnzVtqD9wwHNx85ilD5a
 /a+tx3h55iSbZyQvd0AnGshUQLnV2BjZD6RjlfDE9ZrvYXbPgq306GqzgVrZA6ZG63xC
 MnvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=7b05BkvolhSE/ubLPt25XIO8y/mef1hcytV7DRdGElE=;
 b=hZWvkUtLA8lZYnck+HbfqjT1gPV7FS02KP/GBtIwX5LbZonpV+Re8bM8Kfm5HIbTkY
 oNrmUBvHybh3ehf20hmr5OjJvTk0jzjSg429wM1Ry2dh1mLkA6iggEvEh6rk/h++mIOM
 6Kp+AVc5v5NY7J4F/7RGIWWn1g3BMOGKCoh60xc65S6/fOcnpmfplfZUG1dacWTEM5mN
 HWLXzOc6Rc0zD/8JVPu+ev7thahVtM7JDHvU+JlwjSlDIK66Xi3GedUlp2Sc/y2Yi6ea
 6AJXkhRZ2/+diaedu//Y01ntcz2Niz6Sae5JMQ5XzJIFh471oJnzuHu+4S9QS3vxMxmX
 /JTw==
X-Gm-Message-State: APjAAAUX+Mrjh+cB93/T1d/80dkZqh0+Ar34+DqNOTelhQzSmq5esmB+
 f/NyTou1J8i1iG/RdED6bWFvWRrgz2uC
X-Google-Smtp-Source: APXvYqzQQHFKAhGs0qsp0ksN4cL4KK/ajllYLQXUsi6BH0DJVisslGX/zrJmG0vAzFpjFhScf739HEXOuGau
X-Received: by 2002:a1f:2909:: with SMTP id p9mr11294602vkp.23.1563247464238; 
 Mon, 15 Jul 2019 20:24:24 -0700 (PDT)
Date: Tue, 16 Jul 2019 11:24:17 +0800
Message-Id: <20190716032417.19015-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [PATCH] ASoC: mediatek: mt8183: make headset codec
	optional
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Make headset codec optional because some variant machines may not
have an audio jack.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 887c932229d0..4c816c86844b 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -352,8 +352,6 @@ static struct snd_soc_card mt8183_mt6358_ts3a227_max98357_card = {
 	.owner = THIS_MODULE,
 	.dai_link = mt8183_mt6358_ts3a227_max98357_dai_links,
 	.num_links = ARRAY_SIZE(mt8183_mt6358_ts3a227_max98357_dai_links),
-	.aux_dev = &mt8183_mt6358_ts3a227_max98357_headset_dev,
-	.num_aux_devs = 1,
 };
 
 static int
@@ -404,10 +402,9 @@ mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 	mt8183_mt6358_ts3a227_max98357_headset_dev.codec_of_node =
 		of_parse_phandle(pdev->dev.of_node,
 				 "mediatek,headset-codec", 0);
-	if (!mt8183_mt6358_ts3a227_max98357_headset_dev.codec_of_node) {
-		dev_err(&pdev->dev,
-			"Property 'mediatek,headset-codec' missing/invalid\n");
-		return -EINVAL;
+	if (mt8183_mt6358_ts3a227_max98357_headset_dev.codec_of_node) {
+		card->aux_dev = &mt8183_mt6358_ts3a227_max98357_headset_dev;
+		card->num_aux_devs = 1;
 	}
 
 	default_pins =
-- 
2.22.0.510.g264f2c817a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
