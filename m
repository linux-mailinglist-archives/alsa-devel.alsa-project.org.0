Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B47B1473A9A
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 03:12:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 494C61945;
	Tue, 14 Dec 2021 03:11:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 494C61945
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639447922;
	bh=JUV2k0Ac8f5CFwKyLmmzIkIuQAoPasVSt/33y4wZItI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PJSMzhAlj2TUK9K6q2uzTjUi9CH9KmzXoifn3CtAeeqZ1jXGn+jM+1HNXJIsqxELT
	 uNT8blIvWFYMqYpXOf5hKAS9vJFinH5MrQLqrFKIDJnmtfdggrY9FUrLK3JAoA8pvl
	 u6ATyJeTEhIrfJhUDMHXUIFcg8xv8M7laWPWtOeI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43F7BF80524;
	Tue, 14 Dec 2021 03:09:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 003DDF8051E; Tue, 14 Dec 2021 03:09:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81032F8025A
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 03:09:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81032F8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bjpjzzeS"
Received: by mail-pl1-x634.google.com with SMTP id u17so12497585plg.9
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 18:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bnfUAs0V7JtpPn6OI4QrS36CkDViGktkiepn8bX3vT0=;
 b=bjpjzzeSxOgDTpovILWb5AC4NVhoqoF/2B4/YZVYpUALJnGa9m0LGJrw7R/JjCGl0h
 DJaIg+NZgzbrJVrLv19yjIKebmJqgOeGqgOFy6zEj4kthwsUkM936CmvKCR49iqa0JVO
 X91NhJ2s93mP8ucNA2nxhlXx+z90zIYnRVjcwcER43N0JSWow++zP+R3mLrC6Rciiv2C
 ER42FQMhggpDaVR900pvo5qUKc0WpSF/tOTYWATA1/SOnGOd+KwVY8/afs3jhN/3LJ8h
 umFavsFRogl+E5A2VqcLOs8X3yTptZOPl6WkcbOpRiJ5nlqe9g3IqhDuemFMm4ZJCXJn
 9s6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bnfUAs0V7JtpPn6OI4QrS36CkDViGktkiepn8bX3vT0=;
 b=TbzBDTeg9u6cfMDkzNIKsRWwhZ3/iRZCjrUj1uzFrYEwH28iXGGBKWyRkq9uWzOBa9
 si3RUKtysZF19v3JFkKeqss3H7jGloAPLOTlh7cfbDnv6Cmnt3PNFRpo6LpiLpQzFv/l
 FtytWEzQtfgiroP5rRYHMLszdmSisjW8nWU3iaHtdKVooGsv/g5aD6AM3ZEdcxhzzXCb
 xRdvx2q/WA7NS3qHmujy0MmfsTd0DMJEjI0Vf/octBKgPD0OaG98Ip/uWOIKr+SglzL/
 QBsfDoQ7yeWJVVB2yxkurnsiiXQyo0yYPguOH+ALi0y65v5MWVxM5MFFgQslvKzX73CL
 QLWw==
X-Gm-Message-State: AOAM533dFChw9yKcLV8rPvF6rpwqdFS2l2zvPAbCV2eNE5IpJ0VV/+S8
 umoR185O4Lwqb1SOYHB0ESg=
X-Google-Smtp-Source: ABdhPJzGZY+hAFiMohm0xRpF6CnN4a2EpOYUADJjYiV8hL8JrMBFyK5aD3Zsxo9u6BJKmvCJXEQbXw==
X-Received: by 2002:a17:902:6acb:b0:142:76c3:d35f with SMTP id
 i11-20020a1709026acb00b0014276c3d35fmr2529865plt.89.1639447768169; 
 Mon, 13 Dec 2021 18:09:28 -0800 (PST)
Received: from localhost.localdomain ([126.249.140.249])
 by smtp.gmail.com with ESMTPSA id b2sm14622296pfv.198.2021.12.13.18.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 18:09:27 -0800 (PST)
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 04/22] ASoC: codecs: max9860: Use dev_err_probe() helper
Date: Tue, 14 Dec 2021 11:08:25 +0900
Message-Id: <20211214020843.2225831-5-kuninori.morimoto.gx@renesas.com>
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
 sound/soc/codecs/max9860.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/max9860.c b/sound/soc/codecs/max9860.c
index dd29b183ecd6..7c9686be59d9 100644
--- a/sound/soc/codecs/max9860.c
+++ b/sound/soc/codecs/max9860.c
@@ -606,12 +606,9 @@ static int max9860_probe(struct i2c_client *i2c)
 		return -ENOMEM;
 
 	max9860->dvddio = devm_regulator_get(dev, "DVDDIO");
-	if (IS_ERR(max9860->dvddio)) {
-		ret = PTR_ERR(max9860->dvddio);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get DVDDIO supply: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(max9860->dvddio))
+		return dev_err_probe(dev, PTR_ERR(max9860->dvddio),
+				     "Failed to get DVDDIO supply\n");
 
 	max9860->dvddio_nb.notifier_call = max9860_dvddio_event;
 
@@ -643,8 +640,7 @@ static int max9860_probe(struct i2c_client *i2c)
 
 	if (IS_ERR(mclk)) {
 		ret = PTR_ERR(mclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get MCLK: %d\n", ret);
+		dev_err_probe(dev, ret, "Failed to get MCLK\n");
 		goto err_regulator;
 	}
 
-- 
2.25.1

