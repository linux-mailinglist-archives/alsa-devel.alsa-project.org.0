Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E20826660
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2019 16:56:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 196FB1669;
	Wed, 22 May 2019 16:55:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 196FB1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558536991;
	bh=0FVnEp1rTgYARbHu6im0hjlrSXn9tlRwImiS1uFoOxE=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=glUARHMmtkTgg+Wjkt+SF4+a3Ndo0ykB47uQFH1pItQgYEB/f7F/ZNOawRbZGcILS
	 buaC0fqDkeiWaFi/D9JOUa1cYBwJh2+HX6v2iV8l01NR5kXdgHK3MNObJqjO2CrgzY
	 7FXZmBRR+3KXh9aEA9Ka94zHZ9IMIYNBBbfnHfsM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97A66F89633;
	Wed, 22 May 2019 16:54:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 332BAF8962F; Wed, 22 May 2019 16:54:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1F68F80C20
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 16:54:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1F68F80C20
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="JRZG+kyP"
Received: by mail-qt1-x84a.google.com with SMTP id 28so2257510qtw.5
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 07:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=ntAeSC3tz3fZtB8V8PXV81BhYRh60p3xez9SWg7GxLQ=;
 b=JRZG+kyP5FzABXlyfcBF9DQAHNO+gN+WpRarq6JVggKCvShuFG+SF4kCkjDU4VDuEf
 EKCjNczOKpCPWzlIKB3BqCN9V9+AwtIQoJznj/AdEuNMZ69Fh0yUdsSzg3T6eiwfz5RL
 cAol2EFhAKGg0QvFV+WLjNyuN7mXdpxc7TkDyT2pepZ/6/ZAWmqKjdzyqKfCX56KQNRe
 z51x8ggk9wXiure8jYM4We5QOH2QZHFb//2blMDmGU/5lsdsd+WL7uuHTEDnWymLzpS/
 VIemUwWVtVWNrkJp8I40m3vpz53zBvgB3bhtyrueehpWGppPFXNT6HjLzzlBn2Of0DdH
 yq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=ntAeSC3tz3fZtB8V8PXV81BhYRh60p3xez9SWg7GxLQ=;
 b=oeQfelp9IVwYYSsU//AQD6BQ0jIyUx0iIYYEgGSE42S+hos5lWpwW6o5+fVlruIWQg
 mh/EC3hM3zsiHMHybTjz2orTosc2tavqWZ9ywvn1WIoIIdYSxHSC6hsnkJ6EfKeFlvfM
 Dg5oi1StvJ+cGjXFxM8NHk2M9PoZCC0Y7w+VUOisKz6nzcWicEC50nid8F1a8MvNBQpm
 jaX/jB4SDjYV81PrwVW2XglTAtFLr2EcQOnw9iHFqYDmi60QqmBAiwmN9p2nF1rVhPbn
 sgNp5+8VLfVOSakpFjouVMBsq09sHXAZRJsm/u4AOljw9jBcX9fsMZRXEuEGWIzB631p
 BieA==
X-Gm-Message-State: APjAAAWKdWxvkjPuHvAluPUC7L8azVqTNxaK1Hp4EIaIlfb33CzeXrjK
 QdyCo8DpO3FsUgl3gJzwaVw/fO+imShw
X-Google-Smtp-Source: APXvYqxmeoFMRYoM61l2k+D6ZmiS+nv8cmVHQXBMoJIyKZrxayUk0o0rO+ALb5z9havrENLidYY1ZXiNnqTY
X-Received: by 2002:a37:a894:: with SMTP id r142mr69000094qke.37.1558536881170; 
 Wed, 22 May 2019 07:54:41 -0700 (PDT)
Date: Wed, 22 May 2019 22:54:02 +0800
Message-Id: <20190522145402.256102-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com, jiaxin.yu@mediatek.com
Subject: [alsa-devel] [PATCH] ASoC: mediatek: mt8183: move card registration
	to the end of probe
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

mt8183_mt6358_ts3a227_max98357_dev_probe() does not return immediately
if devm_snd_soc_register_card() returns fail.  As a result, the rest of
code still get executed.

Two options to fix:
1. add an extra return statement if devm_snd_soc_register_card()
   returns fail
2. move devm_snd_soc_register_card() to the end of probe

Adopt option 2 which is more clear and common.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 4e44e5689d6f..1efc7f5d04e4 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -345,7 +345,7 @@ mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 	struct device_node *platform_node;
 	struct snd_soc_dai_link *dai_link;
 	struct pinctrl *default_pins;
-	int ret, i;
+	int i;
 
 	card->dev = &pdev->dev;
 
@@ -380,11 +380,6 @@ mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret)
-		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
-			__func__, ret);
-
 	default_pins =
 		devm_pinctrl_get_select(&pdev->dev, PINCTRL_STATE_DEFAULT);
 	if (IS_ERR(default_pins)) {
@@ -393,7 +388,7 @@ mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 		return PTR_ERR(default_pins);
 	}
 
-	return ret;
+	return devm_snd_soc_register_card(&pdev->dev, card);
 }
 
 #ifdef CONFIG_OF
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
