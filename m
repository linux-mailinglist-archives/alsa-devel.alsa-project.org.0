Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A22DEFCBB
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 12:53:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31AA51701;
	Tue,  5 Nov 2019 12:52:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31AA51701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572954798;
	bh=SzqGndOIHW2yLediw3PeSmTtqdfU/yxiSwECnF4ssSM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VXxIZb3yU74L1Rf1XiE8ZhlScGm4fJ9u77MT7x+8+d/s4nGv82itej/VkzoR1JmZ6
	 tZW5CAvAlFGvqQoq+ohtkhQNtsfKfsZU0FXQdJJd3/23CrBnpOJ59a5P0G7qkiSfJt
	 QGiHMhyRQO3e1Hcs7pF26w38FRBrCJMbkjPDyJJ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7785AF805FE;
	Tue,  5 Nov 2019 12:50:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96CC6F8049B; Tue,  5 Nov 2019 11:19:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11F2CF800F3
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 11:19:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11F2CF800F3
Received: by mail-lf1-f65.google.com with SMTP id j14so14665201lfb.8
 for <alsa-devel@alsa-project.org>; Tue, 05 Nov 2019 02:19:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hmymdAmmLz7/1ts3Oc63nVM1gU1OUHbrPD3E1JaeYNM=;
 b=uUWDfTRWq0P6u+XPDrc1L0lzEFNts55caQlv5nNu7wmqBWln5mTg+7a9vDxYMSHpys
 NQ/j24FleydwgbnPKHg/IvoiZJueU2XHaR6zmfBIgJDuP9hBID4bRM0Xn1jAatNKkWjb
 frCxRR0r2S/l9f10uOyP+n+H4fP40eez0lp2g5EaACXZLlK6lcAJGaXnodD7WG5APRyF
 bOtjC6sSKMTlhdHvlAZd6S6bb4qxfBdIMISq6FWwySxmpQjp5gaQUwm6WwLYqf5/5DH2
 F2j969LNv8yM7m1JcHFt9u/H1O5vORlrqqOM//zZSuDhkyiMc3UsxhQlBstMM34vBRhG
 8oZA==
X-Gm-Message-State: APjAAAXowS8KFLwj3RNdzziT7hOf3VTsRA/y+NrzH4URECEer25iXNET
 ZwaLxkB06p3zKp9KAIL5aJY=
X-Google-Smtp-Source: APXvYqwA3ByHsXKNFTqbUXeoIjiBwAvnWHc+B8RB60mVSLtRlUkTAzBu16JIPrIeS4QzEPOsnHHLbg==
X-Received: by 2002:a19:4314:: with SMTP id q20mr19474289lfa.146.1572949155808; 
 Tue, 05 Nov 2019 02:19:15 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
 by smtp.gmail.com with ESMTPSA id h16sm8502164ljb.10.2019.11.05.02.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 02:19:15 -0800 (PST)
Date: Tue, 5 Nov 2019 12:19:06 +0200
From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To: matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Message-ID: <313330e496479b15f6dbc59d95bfa08c280415f1.1572945780.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1572945780.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1572945780.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Tue, 05 Nov 2019 12:50:45 +0100
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 linux-gpio@vger.kernel.org, patches@opensource.cirrus.com,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [alsa-devel] [PATCH 20/62] gpio: gpio-madera: Use new
	GPIO_LINE_DIRECTION
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

It's hard for occasional GPIO code reader/writer to know if values 0/1
equal to IN or OUT. Use defined GPIO_LINE_DIRECTION_IN and
GPIO_LINE_DIRECTION_OUT to help them out.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/gpio/gpio-madera.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-madera.c b/drivers/gpio/gpio-madera.c
index 7086f8b5388f..8f38303fcbc4 100644
--- a/drivers/gpio/gpio-madera.c
+++ b/drivers/gpio/gpio-madera.c
@@ -34,7 +34,10 @@ static int madera_gpio_get_direction(struct gpio_chip *chip,
 	if (ret < 0)
 		return ret;
 
-	return !!(val & MADERA_GP1_DIR_MASK);
+	if (val & MADERA_GP1_DIR_MASK)
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int madera_gpio_direction_in(struct gpio_chip *chip, unsigned int offset)
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
