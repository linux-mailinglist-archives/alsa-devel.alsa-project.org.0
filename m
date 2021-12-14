Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 910A8473A9D
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 03:12:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B8AA1947;
	Tue, 14 Dec 2021 03:11:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B8AA1947
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639447964;
	bh=AQ0dvlvQSlbFJjCocKBgZKhyGkmQXHb/i1P+2SXhkjk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vXzoXRmZmhu+PLF7GVW2MAVqwKUquO9d8UorYC+B6yAdFSXLPC7lm9tj71qLF/ba2
	 Fcjs4UdEFSVi72hA9BXVgLZ0lT9D5kdB6Sw/c4RpE/jsUR0IJBe7lvKaVEbFJFyfwd
	 j0q/wTvBke0N/L41ez6fFC5+mjErnkMtLnP2KmAY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 168BBF8053A;
	Tue, 14 Dec 2021 03:09:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76AE0F8051F; Tue, 14 Dec 2021 03:09:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1F08F8025E
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 03:09:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1F08F8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GhzxIeFK"
Received: by mail-pl1-x629.google.com with SMTP id y7so12554300plp.0
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 18:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SBpXQEs+oH4Ppm8Ru8mfhKAnVJsRKcfqE3wHGNI1Azo=;
 b=GhzxIeFKXWlOcI90cA7d58ZcRE5YdCUi6tTS9RBVMJK8mj4YnevQGnzBSFlcgkvceF
 yvWrRqSzdj+ltcmS/5oIbwImN/TmkCYwGQgRob34fvQP+4wlTCEyNRwf1ZieCByUAACC
 D3VBJYZrsKlUirT/jvG5BGjJkO6Z2IHSdgoznj6KM9s+unAb0ADx5gzuPRC1v1PIEuob
 sr0XPWcFq1PDRnDnDP6NdJF2nL8kNG6hrSQmvPofu+GEr1+aRlWmvVqMews33arCuWFx
 c2k+nA96F08A3FFJ2trW+EWOdn/3TgKuvrgXDN8CXBTBvWada2+1OxhxsZqdJyeVQ9Mo
 c1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SBpXQEs+oH4Ppm8Ru8mfhKAnVJsRKcfqE3wHGNI1Azo=;
 b=JWZMBYIij630NJ7OvVPi4EK/pHxPbAzPPUvzSQnXiWVlh7PvNVqCfOvQUGi2QKMPCj
 0lY8gXYU/JQkNb6/b6fQENM9+F5si2S+GTzyJrAZWSI+cPlVHuefm8j7OwXaBWuNzfSs
 qvBX44Uu1d31aWhGI65Y/T6iTWyxCyra7PYnaazsoHYC6+gn7NNIodJJpqe0uaINdDmd
 tJ+2hYSTT0ZkvZNpG1Ctdg4R2Nn4twu1+LUuDbCpBdA11cooVkja21tQvC1xVvxSqapE
 WBiGTaOlg1N4HYOEJFWrGsuMYujJCn1vj3TEvQM1o9asxyZPhR2BVgJPGmhcB5/ieZXp
 rO4w==
X-Gm-Message-State: AOAM533YKn6T2SDVViEsVHRGiW6cSLUJykkZP21AaoSDrvKrT8b4Y+SJ
 0+OfxEyn/5gld+gnEyIkY0oePyvLWjg=
X-Google-Smtp-Source: ABdhPJzfXLJHrMRn8QfIGrRsJ0Or4g2nP6vA73AplW8HtwJkfdpZYcTF8xad9BuRJ4AhfjBP3G1DsA==
X-Received: by 2002:a17:902:e5d1:b0:141:cd4a:f318 with SMTP id
 u17-20020a170902e5d100b00141cd4af318mr2156741plf.47.1639447771145; 
 Mon, 13 Dec 2021 18:09:31 -0800 (PST)
Received: from localhost.localdomain ([126.249.140.249])
 by smtp.gmail.com with ESMTPSA id b2sm14622296pfv.198.2021.12.13.18.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 18:09:30 -0800 (PST)
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 06/22] ASoC: codecs: sgtl5000: Use dev_err_probe() helper
Date: Tue, 14 Dec 2021 11:08:27 +0900
Message-Id: <20211214020843.2225831-7-kuninori.morimoto.gx@renesas.com>
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
 sound/soc/codecs/sgtl5000.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
index 97bf1f222805..8eebf27d0ea2 100644
--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c
@@ -1612,9 +1612,8 @@ static int sgtl5000_i2c_probe(struct i2c_client *client,
 		if (ret == -ENOENT)
 			ret = -EPROBE_DEFER;
 
-		if (ret != -EPROBE_DEFER)
-			dev_err(&client->dev, "Failed to get mclock: %d\n",
-				ret);
+		dev_err_probe(&client->dev, ret, "Failed to get mclock\n");
+
 		goto disable_regs;
 	}
 
-- 
2.25.1

