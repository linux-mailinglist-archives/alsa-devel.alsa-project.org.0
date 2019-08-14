Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3FF8CBD5
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 08:18:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 616151615;
	Wed, 14 Aug 2019 08:17:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 616151615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565763529;
	bh=3QSu/uMBJNboXdlmShAaMjbRNcMSrqE/auvxlghVlMU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jG6y0pHKTByQspyWtnVmd4V+NEzkyjDwu/I0HxAsqBxNkNfzfv7X2lZ9tiNUa2+Vz
	 6l5T6C9F4L2n9eAWKtDkBWYA/2Ad+4aN07HultXNi1sR1dY3j8O4iw3H9ussoGuuVT
	 ovOZeA45W+P2s1P5wDWIwaC0+bTfoSJ3v+95wC8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DF8AF80715;
	Wed, 14 Aug 2019 08:09:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D590F80671; Wed, 14 Aug 2019 08:09:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A61E2F80642
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 08:09:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A61E2F80642
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DB2uNyqK"
Received: by mail-lj1-x241.google.com with SMTP id m24so1257286ljg.8
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 23:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=go+1BvHiZ551s7lZZtvzU+7HaWl7o/QBHe+MvPdzMnE=;
 b=DB2uNyqKpzDzXvdgtr4TdYqx4FJ1xEsqNOfYwtyOdiyN8bmElVFNz5Y0QHN1tZwHJL
 ZXY6ddKq6RNyTtLEScnryGITuQ2rSc7wS22yci9vy2R9CSaQkY8MKwQFjpeteP/M/Omw
 tFid6mUmH+6ES71/fxOTcUTKhdvsMaMffcuT3R5VQabk+OkUA2QSwkWXOOuWJv5KDTW0
 6116/1ms5skkFH9i9nYOIHmFg9rbrfrl9fNN29VHkWjywexztmApeKsSGr0jpCHcZTk2
 dDqGTu0sAKnTbkJI25Cx1tuShn5R9x6mjRiPrbgg/FTD4nmEJRMr+CHxt3UqAKqmfSXN
 yzOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=go+1BvHiZ551s7lZZtvzU+7HaWl7o/QBHe+MvPdzMnE=;
 b=roo8xtKI3K2f5Jtsgd3QVObfLUldxCGewExuoq7jlosBxMCKwwFK/2GPXtiIMi7Kl5
 c8wTH5LzEvsTvFwY2DjXSYoyYiVJJCSDjG6M/CB3TzsH+uCtZae1Xx14JTBZnuGucNuh
 rpj4iZ8uhWfq/cWg9ycRSE4mi8LgW4qUeXo3cIs3eNS2BHdetx7MDyGJfjwgzJp8KWvs
 Oarhckp0BY0Tfp8Ow+kfWH9p49olgUNEIuhMUwmZVansyf1k62u4S1HHGz5VgqsjgurF
 H21uS9egg2X387xq7eRQbHvyc1oWsTrGt4+7mMUQTqrnI96Uwbw1uQleOd3XwQXV5ISl
 Dj9Q==
X-Gm-Message-State: APjAAAWxXo96F1egI7y6vgDXhsS8G7ALgzBgr8Dgvy44fkM3gFl/sb65
 xQuZwz+xZ1ZtfiuZ8IbRZ6Y=
X-Google-Smtp-Source: APXvYqxke6on79/JFb/mW5nqF0uOU5tx+pV8+KsdaUpiYfd+xIeG5MpxPdARsgAB0SJSFsZtf1z0sw==
X-Received: by 2002:a2e:9b84:: with SMTP id z4mr24044973lji.75.1565762952729; 
 Tue, 13 Aug 2019 23:09:12 -0700 (PDT)
Received: from localhost.localdomain (c213-102-74-69.bredband.comhem.se.
 [213.102.74.69])
 by smtp.gmail.com with ESMTPSA id s10sm3124235ljm.35.2019.08.13.23.09.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 23:09:11 -0700 (PDT)
From: codekipper@gmail.com
To: maxime.ripard@free-electrons.com, wens@csie.org,
 linux-sunxi@googlegroups.com
Date: Wed, 14 Aug 2019 08:08:48 +0200
Message-Id: <20190814060854.26345-10-codekipper@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190814060854.26345-1-codekipper@gmail.com>
References: <20190814060854.26345-1-codekipper@gmail.com>
MIME-Version: 1.0
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, be17068@iperbole.bo.it,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v5 09/15] clk: sunxi-ng: h6: Allow I2S to
	change parent rate
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

From: Jernej Skrabec <jernej.skrabec@siol.net>

I2S doesn't work if parent rate couldn't be change. Difference between
wanted and actual rate is too big.

Fix this by adding CLK_SET_RATE_PARENT flag to I2S clocks.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
index aebef4af9861..d89353a3cdec 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
@@ -505,7 +505,7 @@ static struct ccu_div i2s3_clk = {
 		.hw.init	= CLK_HW_INIT_PARENTS("i2s3",
 						      audio_parents,
 						      &ccu_div_ops,
-						      0),
+						      CLK_SET_RATE_PARENT),
 	},
 };
 
@@ -518,7 +518,7 @@ static struct ccu_div i2s0_clk = {
 		.hw.init	= CLK_HW_INIT_PARENTS("i2s0",
 						      audio_parents,
 						      &ccu_div_ops,
-						      0),
+						      CLK_SET_RATE_PARENT),
 	},
 };
 
@@ -531,7 +531,7 @@ static struct ccu_div i2s1_clk = {
 		.hw.init	= CLK_HW_INIT_PARENTS("i2s1",
 						      audio_parents,
 						      &ccu_div_ops,
-						      0),
+						      CLK_SET_RATE_PARENT),
 	},
 };
 
@@ -544,7 +544,7 @@ static struct ccu_div i2s2_clk = {
 		.hw.init	= CLK_HW_INIT_PARENTS("i2s2",
 						      audio_parents,
 						      &ccu_div_ops,
-						      0),
+						      CLK_SET_RATE_PARENT),
 	},
 };
 
-- 
2.22.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
