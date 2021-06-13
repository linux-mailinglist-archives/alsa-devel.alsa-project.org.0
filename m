Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4426A3A5B0C
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Jun 2021 01:33:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4347175F;
	Mon, 14 Jun 2021 01:32:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4347175F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623627189;
	bh=aFk4u+CZLlOFpjZ/s7mOyCwk+G3XoHQL+OzHYdHE+ko=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lQnODF22jqCa43pVQEpmy4+HB2fH1cfPmnlWGDLKXamZ2shAfGySHJGUCZQXVVPzz
	 /AZ+bMHji/7buig/+pdVoYhY+E9w8NWCk1JpL0e2urFzdvH3dcSZ+YTmsTTEEVIbqw
	 /nJQtaPaNzcNmM95r+HuBjhryNo1ADIUb3xmrVMY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AC47F802A9;
	Mon, 14 Jun 2021 01:31:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3698EF80171; Mon, 14 Jun 2021 01:31:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 845DDF800F8
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 01:31:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 845DDF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kTDezyeo"
Received: by mail-wm1-x336.google.com with SMTP id g204so11022938wmf.5
 for <alsa-devel@alsa-project.org>; Sun, 13 Jun 2021 16:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m0oGNH7E8tl8OaA4YPX5bbFuMWMnM1qZnDsgemwDFfg=;
 b=kTDezyeoKqDaGaMaOtpkBNskumEzfWsqZdJ1/VfH+DRRVJsv0jnKjMWP9LB7J6CkP+
 SdAlKxI1flmNEbdCXCwtEG2sLu6uro4rdO2Hh3cceJU84Z6MnDwB+pmtY+5bCYDZAZXy
 e1IfHaoqVtfY7tNyOKD+wqVfdT/WrbAXyuKAvlvJo14CByVF7V95DsmneV2pmXpW2YQS
 /78ct7Lnw6onpxSfu/4ypcDHlO31eCoWkQpIW+xp3Qjzp9w9V+goF9jkjRhcjvgNom+D
 s8m+qobuoaF0klVh6OClzVTUlHQygRbI4mj8F0JD8Beu9XJHPRnPqXarnl1JTmvrskmX
 iPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m0oGNH7E8tl8OaA4YPX5bbFuMWMnM1qZnDsgemwDFfg=;
 b=bd+zY1uOp4vqRWZU/I1dhz1sF95ri4F504622gVYHfy+Pm3Fm+A5PGeyfHFoQ62gxK
 mJlRVYzrY5mzk+lZQZRCH+sTsbyxPCUNG0SnfFyMRfwjQhS/jkANr7NpROClq0dLRKHz
 tVEcq2iiJkIlHqku4VFO7vjULsiqWxsN4kvt+WMms7q97buGiDhbIJF3k+vVpnHOqAjS
 zmx3hUzxnhuRstYl67WL/LgXeLeeFuQRDmYwu1htUfjllVZu0xCQJ0FsgJAKSdpEbrYl
 nKJo74yuNuRjy3Req6f6UbK2Zu81BidoVf400g7juHbjkesIA75rwgUAuBUHIt+IA12P
 JBRA==
X-Gm-Message-State: AOAM533SWiHAfxrHQm4xotgFyHBFcJLXPzzm6BKKoaqmn4PJHI+zkYEb
 oLvFLxQ8gdoHHL8EndkDnMg=
X-Google-Smtp-Source: ABdhPJzfQrtWDN9pWI29RJGrqSnPcg8YpkTKEZldXMea3qFjL+9dRI9AEEnzbRYIGAs3MW7p+9RmTA==
X-Received: by 2002:a05:600c:228d:: with SMTP id
 13mr13473663wmf.96.1623627084710; 
 Sun, 13 Jun 2021 16:31:24 -0700 (PDT)
Received: from localhost.localdomain ([195.245.23.224])
 by smtp.gmail.com with ESMTPSA id i9sm17882511wrn.54.2021.06.13.16.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 16:31:24 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Nikita Shubin <nikita.shubin@maquefel.me>, alsa-devel@alsa-project.org
Subject: [PATCH 6/7] ASoC: cirrus: i2s: Prepare clock before using it
Date: Mon, 14 Jun 2021 01:30:40 +0200
Message-Id: <20210613233041.128961-7-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210613233041.128961-1-alexander.sverdlin@gmail.com>
References: <20210613233041.128961-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
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

Use clk_prepare_enable()/clk_disable_unprepare() in preparation for switch
to Common Clock Framework, otherwise the following is visible:

WARNING: CPU: 0 PID: 97 at drivers/clk/clk.c:1011 clk_core_enable+0x9c/0xbc
Enabling unprepared mclk
CPU: 0 PID: 97 Comm: OPAL-Event:97 Not tainted 5.13.0-rc5-tekon #1
Hardware name: Cirrus Logic EDB9302 Evaluation Board
[<c000d5b0>] (unwind_backtrace) from [<c000c590>] (show_stack+0x10/0x18)
[<c000c590>] (show_stack) from [<c03a5fd8>] (dump_stack+0x20/0x2c)
[<c03a5fd8>] (dump_stack) from [<c03a2138>] (__warn+0x98/0xc0)
[<c03a2138>] (__warn) from [<c03a21f0>] (warn_slowpath_fmt+0x90/0xc0)
[<c03a21f0>] (warn_slowpath_fmt) from [<c01d8358>] (clk_core_enable+0x9c/0xbc)
[<c01d8358>] (clk_core_enable) from [<c01d8698>] (clk_core_enable_lock+0x18/0x30)
[<c01d8698>] (clk_core_enable_lock) from [<c0291568>] (ep93xx_i2s_hw_params+0x1a0/0x1c0)
[<c0291568>] (ep93xx_i2s_hw_params) from [<c0287488>] (snd_soc_dai_hw_params+0x54/0xb4)
[<c0287488>] (snd_soc_dai_hw_params) from [<c028b0a4>] (soc_pcm_hw_params+0x418/0x5bc)
[<c028b0a4>] (soc_pcm_hw_params) from [<c0275608>] (snd_pcm_hw_params+0x14c/0x448)
[<c0275608>] (snd_pcm_hw_params) from [<c02761ac>] (snd_pcm_ioctl+0x258/0x1114)
[<c02761ac>] (snd_pcm_ioctl) from [<c00e6d40>] (sys_ioctl+0x290/0xbc4)
[<c00e6d40>] (sys_ioctl) from [<c0008200>] (ret_fast_syscall+0x0/0x4c)

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 sound/soc/cirrus/ep93xx-i2s.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/cirrus/ep93xx-i2s.c b/sound/soc/cirrus/ep93xx-i2s.c
index 0d26550d0df8..4d3179f03202 100644
--- a/sound/soc/cirrus/ep93xx-i2s.c
+++ b/sound/soc/cirrus/ep93xx-i2s.c
@@ -111,9 +111,9 @@ static void ep93xx_i2s_enable(struct ep93xx_i2s_info *info, int stream)
 	if ((ep93xx_i2s_read_reg(info, EP93XX_I2S_TX0EN) & 0x1) == 0 &&
 	    (ep93xx_i2s_read_reg(info, EP93XX_I2S_RX0EN) & 0x1) == 0) {
 		/* Enable clocks */
-		clk_enable(info->mclk);
-		clk_enable(info->sclk);
-		clk_enable(info->lrclk);
+		clk_prepare_enable(info->mclk);
+		clk_prepare_enable(info->sclk);
+		clk_prepare_enable(info->lrclk);
 
 		/* Enable i2s */
 		ep93xx_i2s_write_reg(info, EP93XX_I2S_GLCTRL, 1);
@@ -156,9 +156,9 @@ static void ep93xx_i2s_disable(struct ep93xx_i2s_info *info, int stream)
 		ep93xx_i2s_write_reg(info, EP93XX_I2S_GLCTRL, 0);
 
 		/* Disable clocks */
-		clk_disable(info->lrclk);
-		clk_disable(info->sclk);
-		clk_disable(info->mclk);
+		clk_disable_unprepare(info->lrclk);
+		clk_disable_unprepare(info->sclk);
+		clk_disable_unprepare(info->mclk);
 	}
 }
 
-- 
2.32.0

