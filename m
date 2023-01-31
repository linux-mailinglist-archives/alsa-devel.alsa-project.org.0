Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D756829DF
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 11:03:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F2B81F1;
	Tue, 31 Jan 2023 11:02:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F2B81F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675159407;
	bh=jj8L4BxUMMq1yzSVhG+h97vckWR9TulYFJ6jg6NNbpQ=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ES7gFx0WIUr3ofatekntgCWBu8LUlVMxxK1sMfYmhYGnKNyKrzOZSTXgkyhGTXt73
	 lfKySmdPfavMRU5Zi9GaQ2uWAHT7Bbs/Ykq4LGiuBg8krwva31Nol3qkgHJE4m9n4F
	 DJmkA7iIS7e+8CKkd3o+4niFl2v4YH3Z0GWWCP6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2326F80245;
	Tue, 31 Jan 2023 11:02:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87482F804C2; Tue, 31 Jan 2023 11:02:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CA1AF80169
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 11:02:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CA1AF80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Xzw2nzSO
Received: by mail-wr1-x42f.google.com with SMTP id y1so13681751wru.2
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 02:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BQtD71MCuqdoYLyEkwguINUig+I6UC5jBNAWlEZAE74=;
 b=Xzw2nzSO1P6ENTdTvBc3HZWqUOTvaXqkGqa5xZniFKIVjoPM47DLx5iUVdPoYU0ePl
 /Y5UbUPocgpxeqkM1GodWs70YnnETJs7dJuicE4kGMZFK/i+fyETSyykEP2/KtrjITMv
 0qc++SMkUW7f9bz+HWY0AKGSmyWQcsQo3EWo99D5MDCWVELxnjEtyZYNNpugniWW4cjE
 LYhpqtwWuRT3M+cpMGZEY6Ty+qaIWSHB24UFR7up1AjAZzvjYXaN1PaAI1eXMGb5y8GB
 pBWhxFTMNXdqPwIoixuz5okvjoZBA3igr47ZS7oaa+JHk9XVm3uUnmHu4mq1pA4/rPND
 pevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BQtD71MCuqdoYLyEkwguINUig+I6UC5jBNAWlEZAE74=;
 b=QY79skVORgtFisTSniXpLFNCZwWC5DJM0HuMfxpg52N79eGJF47JsX+pJwXYE9kjoB
 D+YHXo42UY46MeMB9I3ZTHGucw1VVNlvcqy6QGs2aAJRa0sS/g9BcQyhbVR6BqQ5qO6o
 PuIheIx6MiGcFiMdki9VfW5ex4tXUp28giF3S3mb7uCH2CUE+k83TqJYyD1jICMCHJAq
 2IvLjypZaFcMuMRG0ceUze/P9C3amEQDvqEv3ZPBvjc+nv6nE/0MS7PainXyKOGvixoW
 gQO1sTvLgGn+b1Zma0pfnqaLrJYzRSTezIHqds4EWwGV0aQWdcuCqIZDgamDe4pY43FS
 Dd8w==
X-Gm-Message-State: AO0yUKWtZycKuRUwib+0inPQU/BAKdG5DLLKYrliK+86pvn/Y1Rbiv9a
 WNcCnOxdCYLfQmMUrsXsB0E=
X-Google-Smtp-Source: AK7set99zuDW29NEW4bzQ7VrmGv4iF1XLdL3T9STAFE1oa1tmi3iLOxWH3RviNrVkdbl73H2weHuug==
X-Received: by 2002:adf:dd84:0:b0:27a:d81:1137 with SMTP id
 x4-20020adfdd84000000b0027a0d811137mr2379364wrl.38.1675159338147; 
 Tue, 31 Jan 2023 02:02:18 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 y3-20020adff143000000b002be546f947asm14353360wro.61.2023.01.31.02.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 02:02:17 -0800 (PST)
Date: Tue, 31 Jan 2023 13:02:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v2] ALSA: pci: lx6464es: fix a debug loop
Message-ID: <Y9jnJTis/mRFJAQp@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This loop accidentally reuses the "i" iterator for both the inside and
the outside loop.  The value of MAX_STREAM_BUFFER is 5.  I believe that
chip->rmh.stat_len is in the 2-12 range.  If the value of .stat_len is
4 or more then it will loop exactly one time, but if it's less then it
is a forever loop.

It looks like it was supposed to combined into one loop where
conditions are checked.

Fixes: 8e6320064c33 ("ALSA: lx_core: Remove useless #if 0 .. #endif")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
v2: In the first version I just deleted the outside loop but that was
not the correct fix.  Combine the conditions instead.

 sound/pci/lx6464es/lx_core.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/pci/lx6464es/lx_core.c b/sound/pci/lx6464es/lx_core.c
index d3f58a3d17fb..b5b0d43bb8dc 100644
--- a/sound/pci/lx6464es/lx_core.c
+++ b/sound/pci/lx6464es/lx_core.c
@@ -493,12 +493,11 @@ int lx_buffer_ask(struct lx6464es *chip, u32 pipe, int is_capture,
 		dev_dbg(chip->card->dev,
 			"CMD_08_ASK_BUFFERS: needed %d, freed %d\n",
 			    *r_needed, *r_freed);
-		for (i = 0; i < MAX_STREAM_BUFFER; ++i) {
-			for (i = 0; i != chip->rmh.stat_len; ++i)
-				dev_dbg(chip->card->dev,
-					"  stat[%d]: %x, %x\n", i,
-					    chip->rmh.stat[i],
-					    chip->rmh.stat[i] & MASK_DATA_SIZE);
+		for (i = 0; i < MAX_STREAM_BUFFER && i < chip->rmh.stat_len;
+		     ++i) {
+			dev_dbg(chip->card->dev, "  stat[%d]: %x, %x\n", i,
+				chip->rmh.stat[i],
+				chip->rmh.stat[i] & MASK_DATA_SIZE);
 		}
 	}
 
-- 
2.35.1

