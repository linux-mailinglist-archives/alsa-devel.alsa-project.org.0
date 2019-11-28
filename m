Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5EB10C151
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Nov 2019 02:16:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81F3C16DB;
	Thu, 28 Nov 2019 02:15:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81F3C16DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574903771;
	bh=cVPJxmyPTbO6T76VOd+K7V/zXvL627AfgSJxwH6g8mg=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hVVrovXr/2ZGZjGg0gKHYYA8ENiZ48h5PddNFult/VUYHi4jH6cn2X08NCD//S9pb
	 jpq4S9oCfEFaPh0LMsR+3gUaTdUJri8Wm0eBXo1+WOASACCLcTufvq8CKkM7w9QwMe
	 ZOXiC2yLapXKtf36ldz/ZNZwrxYdP2kIZRUoiwf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D44A0F80171;
	Thu, 28 Nov 2019 02:14:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A67DEF8014D; Thu, 28 Nov 2019 02:14:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5B54F800E9
 for <alsa-devel@alsa-project.org>; Thu, 28 Nov 2019 02:14:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5B54F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="i4E+5Kbm"
Received: by mail-pj1-x1041.google.com with SMTP id v93so7784596pjb.6
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 17:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H/z77siugxFai2DGg8YuPX5XdWKbHQr0asLcUn0m/8M=;
 b=i4E+5KbmcHbqZaV0UJCieaxfRtWtUv8LAYhyozd8HSQgAbr2n2QWZAydJQyNl6sFKJ
 x3hUrHeHWjiwnTR3QqgDZOOCSCtuIdnioIZRYsETB5XSJza1Ey/dsWXJ2fMmZQjfLkm9
 pcr6vncKDMVS3WeQ++mZWlFl1E4aqF/9z5ZZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H/z77siugxFai2DGg8YuPX5XdWKbHQr0asLcUn0m/8M=;
 b=OBdiDZGAPS+JqMci9NcvRxl+0p+MQotoY9B4vfpmYvPX8tsR8Gf6aIfi6SUy91tmOd
 yFmmaXeesGINHmWDfwol+DkRYhdRg9ZU6zeZ+9eP/zRj9UNWjb1eCJe0HCj//HuGM6S3
 wi7YSjNAM6yggpeQ/dWt/Pn6F0adPnKv36eFo46Ft8f1FIbbFBaUhZJGosTC7AA6YSt8
 g83l+QZYXIT+51s90D3EP/fDFOZqHU1fizXWO2W625Zd9J20WkjkX6b3Hy0Sk1AijXqy
 kg7eddBYEhoOzcYjOAi//k7TNXz6Qf/fIm7n29SMzxuL15dnAdzU2o72Ilu0SFh51/3z
 NOOA==
X-Gm-Message-State: APjAAAXK6Eul0eqQ2dV4blAmT+dU3mHzwPTogsLENNLFjuBfPWXbovJi
 qlgQfb+eResb0XTPDVOZu61PpUtP1g==
X-Google-Smtp-Source: APXvYqyuCim67UTcoR0q/YC9pCz6TxZRr7IzNBxXAg4xVYiJ64w3woMqenqcnoq2rmz+Z+lZsTjG4g==
X-Received: by 2002:a17:902:b585:: with SMTP id
 a5mr7051257pls.191.1574903659652; 
 Wed, 27 Nov 2019 17:14:19 -0800 (PST)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id a6sm8959990pja.30.2019.11.27.17.14.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2019 17:14:19 -0800 (PST)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Wed, 27 Nov 2019 17:13:58 -0800
Message-Id: <20191128011358.39234-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
MIME-Version: 1.0
Cc: Curtis Malainey <cujomalainey@chromium.org>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [alsa-devel] [PATCH] ASoC: core: only flush inited work during free
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

There are many paths to soc_free_pcm_runtime which can both have and
have not yet inited the workqueue yet. When we flush the queue when we
have not yet inited the queue we cause warnings to be printed.

An example is soc_cleanup_card_resources which is called by
snd_soc_bind_card which has multiple failure points before and after
soc_link_init -> soc_new_pcm which is where the queue is inited.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/soc-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 062653ab03a37..3bf702b874a6d 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -419,7 +419,8 @@ static void soc_free_pcm_runtime(struct snd_soc_pcm_runtime *rtd)
 
 	list_del(&rtd->list);
 
-	flush_delayed_work(&rtd->delayed_work);
+	if (delayed_work_pending(&rtd->delayed_work))
+		flush_delayed_work(&rtd->delayed_work);
 	snd_soc_pcm_component_free(rtd);
 
 	/*
-- 
2.24.0.393.g34dc348eaf-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
