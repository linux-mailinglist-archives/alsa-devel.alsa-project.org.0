Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DAEA3178
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 09:47:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20401166A;
	Fri, 30 Aug 2019 09:46:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20401166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567151231;
	bh=ZdLf+xTRSXRlFXi0J0cLgZ7eW0UfP1Ws9TYB+e92PJ4=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jVDIuJ4nxFYKFQPu+M4P9zPNK3WJ5Hrifu8XIrCVtByVbOiuoNaGfdM2F7Q90WSSp
	 9HISllBa56+AXT83//jMte/bKk6Zhn8eGesx3h69SFYT7VuMFC9rwZk32JH231UWKK
	 pV0DVw5JfX1d6UuvQPiFg53Ub46Jd3mjR73A1goo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5043FF80600;
	Fri, 30 Aug 2019 09:43:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0091BF805FE; Fri, 30 Aug 2019 09:43:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-ua1-x94a.google.com (mail-ua1-x94a.google.com
 [IPv6:2607:f8b0:4864:20::94a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A33BF805FC
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 09:43:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A33BF805FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="jsLPPzgz"
Received: by mail-ua1-x94a.google.com with SMTP id g25so824999uan.5
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 00:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=QkpFVGBsi9uV3+tI4cucGmcP2se44oABfy9yJ9m51tw=;
 b=jsLPPzgz8XzwERKcEyg5F0lPWQnbCiSAQKX4gWZdePlxhqI8wiHzbepzH8mF6inJ7g
 dC7y2AIxBi/l6FhfzvrSpcezIpQe9Yaw2PLYTXZIBnYUZzGwy4w5EJz9Fs/x+qwm06bt
 Jmwkfhi+cEsnB/oX7mCIS7ZfNeyKV4+R0ICHPojmgAM3fHiWdPT2d8hUdzTIA1FD5BY9
 iRaovEU00iJXMPz/0Pa7I/FB1NnHIZep8Oc7HgHBfsPDeqgJI5x41u3ay5sSQCf7I5yc
 dyRZZwpKz4taocNohbTj1Qcn/QyzkEhSsoJ1CUWrLq47b3Kja0h7HWGAJKaWm0P0Wj5L
 qgrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=QkpFVGBsi9uV3+tI4cucGmcP2se44oABfy9yJ9m51tw=;
 b=jTXscpGUuzroR6pdoXOg2K5FE7Yi03gQ1ma0i+gcoVqcmgu487uVOyzR6YPkAts+qe
 hViXqVoJj/Qt9PWLFHCseYwcM6d7p35D9RrOIiK9YLCgaMPVtubsevb30SdFSGRMalHh
 LA/pXtjjGHcGumjKqQJOTuDpzoWnIu+xXt4SGRTnA4nLB/sXGDWigz56THTptKas7Vzu
 PhIJeNq4GLr0IKZx5wFyxl04wpssy3YImBWK/Uuxh/QaJqrjGX/T1KoYDWUfTJP+wAhI
 LrkAuFR0IchW8LWAwt3qJLe4ex1DhitZjQ7kSwJFP0keHMABEEHA3hy3SyctBxLLSuaX
 VctA==
X-Gm-Message-State: APjAAAWZRqzuXNAIidsOcAuh8wtHJfqUybjEY3+ghUalgqeoAXCi664I
 8XjXXSRNlQGGkD0ks6CIge6za3O4w4oX
X-Google-Smtp-Source: APXvYqzJqUsg1jbkrZujmHhnT/Lb/G+9q7jTaeULN8RwqCe6+SLfUrA9o+s4b5wBHHKNED0tW215mk9EnapE
X-Received: by 2002:a67:ff19:: with SMTP id v25mr7440177vsp.74.1567150985870; 
 Fri, 30 Aug 2019 00:43:05 -0700 (PDT)
Date: Fri, 30 Aug 2019 15:42:40 +0800
In-Reply-To: <20190830074240.195166-1-tzungbi@google.com>
Message-Id: <20190830074240.195166-5-tzungbi@google.com>
Mime-Version: 1.0
References: <20190830074240.195166-1-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, dgreid@google.com,
 cychiang@google.com
Subject: [alsa-devel] [PATCH 4/4] ASoC: mediatek: mt8183: fix space issues
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

Fix space issues:
- No space before ';'.
- No trailing blank line.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 30a7735c4af3..bb9cdc0d6552 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -471,7 +471,7 @@ mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->pinctrl);
 	}
 
-	for (i = 0 ; i < PIN_STATE_MAX ; i++) {
+	for (i = 0; i < PIN_STATE_MAX; i++) {
 		priv->pin_states[i] = pinctrl_lookup_state(priv->pinctrl,
 							   mt8183_pin_str[i]);
 		if (IS_ERR(priv->pin_states[i])) {
@@ -526,4 +526,3 @@ MODULE_DESCRIPTION("MT8183-MT6358-TS3A227-MAX98357 ALSA SoC machine driver");
 MODULE_AUTHOR("Shunli Wang <shunli.wang@mediatek.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("mt8183_mt6358_ts3a227_max98357 soc card");
-
-- 
2.23.0.187.g17f5b7556c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
