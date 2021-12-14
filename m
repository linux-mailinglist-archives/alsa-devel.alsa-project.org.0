Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C735473AB1
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 03:17:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0B5D1F44;
	Tue, 14 Dec 2021 03:16:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0B5D1F44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639448248;
	bh=i/ozVA3TedLaoO1+Qxf6cKNDNgVnPGEG92p0OVprMoo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ceTMv2TkQsfhqir1QZj3mr5oWWVCuNJ9+eNZe5ikjMOlc5Ckev/HNypAesAo+/DVk
	 MvA1+cxFQWDl8tzREwbiI2Sqp+z5ruZg1xNbRQMx+6wGSaPRQtimmra3XpEDWNvJO+
	 Dd14+k40Twsjeiin3/MHPcCsCiE+oiYSx8+eev50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89093F805DF;
	Tue, 14 Dec 2021 03:10:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF007F805AF; Tue, 14 Dec 2021 03:10:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAE46F80568
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 03:09:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAE46F80568
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gHgti/dw"
Received: by mail-pj1-x1035.google.com with SMTP id
 nh10-20020a17090b364a00b001a69adad5ebso14882225pjb.2
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 18:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Im/kxi8TreIZVGv64UW7tjZVlq5FhrglWgFTRZnlSg=;
 b=gHgti/dwXowgi3XwWVQ3Xd2DgbpvCaa2X1VcP7leme46jRJ/CrqvPjv4rRT1ZyQkii
 bV9I/coDfx4MQPgighp1TnR1zi18rdwUnDd9FiPacqJDSOSs9MH5SCW5DrXoQaLg8/y7
 8BgxxkVk6JFnMUN3DO3b3POa+JeykCUryiGtnklaLsAsSqO4tYmOfILvZaGAzeM81op/
 uTvP7QkRh6WAyJCbftTzk/vdJsjBrHDxPc+3wmVqijrWVGdu44eHVr1U4/vkjM8UiUBX
 rGcR3vdEuyIx8+rjCZ6fbGCG6zQYvRpLlGMPXa8r3CvNNmV3F/YQGaBZ100RMQk9+lvm
 YKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/Im/kxi8TreIZVGv64UW7tjZVlq5FhrglWgFTRZnlSg=;
 b=mOClkbwJIhLqzESw5EyMT5AJRzjRv9WTjMWfQGc37pW+4AZsKENN+3jioF4N+N5sif
 5y/bbgw7TlTQyZrG1Qen5RevRvKzNRmYDzrVnZ007nvybnW4Jf6YLXE2C9UcYygERkZ3
 fhEh8Tw8rYqrdsfZPJX+KKb0VjSpxQlQnZ6blcWbP7ifblklu8P5fylhbQgzdR1DLk1k
 kj2dL3ATwggW0Yy/OOV22p96jQ9/ciMHBi2MMId1fq2DLLwnzw/lR62VKFu2jieRRVes
 2wvYzxZ68ROSCHJtbYSpMJ/7fgGYMrh6sOPbSDhBIrFYq8MFQMAdPfXl1SSd4WM/sXaL
 fofQ==
X-Gm-Message-State: AOAM532zyH17KdhObYmycJyxWfjIsYNCfjOaeiTO3Hsb+HrR1E2f0z4s
 Buaotclaq8sK+c8JEKMtR3k=
X-Google-Smtp-Source: ABdhPJxhySLGzHmCguuyN7qrZ4zIsSYYDCJBzcVWylSYcNk5XaXyQYplsmkQauBuX6KVXgibDxangw==
X-Received: by 2002:a17:90a:c58f:: with SMTP id
 l15mr2397674pjt.75.1639447793814; 
 Mon, 13 Dec 2021 18:09:53 -0800 (PST)
Received: from localhost.localdomain ([126.249.140.249])
 by smtp.gmail.com with ESMTPSA id b2sm14622296pfv.198.2021.12.13.18.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 18:09:53 -0800 (PST)
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 22/22] ASoC: sunxi: Use dev_err_probe() helper
Date: Tue, 14 Dec 2021 11:08:43 +0900
Message-Id: <20211214020843.2225831-23-kuninori.morimoto.gx@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214020843.2225831-1-kuninori.morimoto.gx@renesas.com>
References: <20211214020843.2225831-1-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Use the dev_err_probe() helper, instead of open-coding the same
operation.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sunxi/sun4i-codec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index da597e456beb..60712f24ade5 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -1752,8 +1752,7 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 						  GPIOD_OUT_LOW);
 	if (IS_ERR(scodec->gpio_pa)) {
 		ret = PTR_ERR(scodec->gpio_pa);
-		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Failed to get pa gpio: %d\n", ret);
+		dev_err_probe(&pdev->dev, ret, "Failed to get pa gpio\n");
 		return ret;
 	}
 
-- 
2.25.1

