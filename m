Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A16A260A8A1
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 15:09:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5369B76C8;
	Mon, 24 Oct 2022 15:08:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5369B76C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666616955;
	bh=jeaQ+X3gmziuIixOGwDqUKXdvo29eBuGHkpVjOzerG8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aS0TiPWg3ssZ1AKUcdYg2/JSeIHzSNqrU9MRqm48icCa7TcOn5fH3yzcYCrtPTCWh
	 NNt7mejtSM1yDtAdxkeEY/Ot5/VSYv1+7hxlNloWrhEO8SnV/JpAJ/EvSnmsLePdiY
	 WxCW0ci1hAWuliihMITk5LMwzFHNxTFTRXYvQpjU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9354F8053D;
	Mon, 24 Oct 2022 15:08:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D3AAF80533; Mon, 24 Oct 2022 15:08:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4ADAAF80431
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 15:08:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4ADAAF80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="inKQ1QRQ"
Received: by mail-wm1-x32e.google.com with SMTP id
 c3-20020a1c3503000000b003bd21e3dd7aso9933118wma.1
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 06:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4ckwP6SZrttFwr6q/sGcNYSFGy/msNDVyZpAOWEeZ8w=;
 b=inKQ1QRQBd2kH0yamrljN5I7Tavh58rIwYt8BjFrJvvpqQnI87e5BM8m11dqOvATDX
 O0dN7xO2ogwyzHdwfIIF/9S+5JTqPihCSDcaLTTRNaMh+rsvRYK3pxMESywxnoDdd9O3
 Gbgvat5iOIZihcIdE5K7hGTgd9XXTmmb1P4Gq4FpQoG4Hdkx7MPWgBX+7/hacySY/7rk
 DGJwIKStLujvhDDabIJd/RC3d6DwMrDVuu0ne2UI49WcRHy8ghSWPydJedtmkpc6ToCe
 dujR1Bz3i65aZPdHRL27ttEwdIey8yWxuVKvKlbLE0kA8frWmyqkURU9Wzm8atEMgB6P
 rSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4ckwP6SZrttFwr6q/sGcNYSFGy/msNDVyZpAOWEeZ8w=;
 b=BXXTK95Vc8PGhFfh+zu1pjC/JQ7Ru2yxlYmN9ivg4iAUankargyG6Vn4ubD3uHkiDG
 aiE1yE9/4lNm2q0Vnnv2iLjSbU4WG7lkEcbxlTCnoKPVU0f8A2p6Xrhc4Z1kpvD26T6/
 EVitwNS+y1LjXSUaHW+ybFTBOGxhf1EsEEYGA2r3L3lxal8XO9IVnnjNhbsfKO5cJI80
 2691oikXjEF579QINdr8eFoBTJcnuZLWUUjXqQqlThCri6K+jXulF9nsdYyHB6rSiJdV
 Dko6e279Q1knN6EO41of2IZS2F7aOlr71n0n61mFiG9e1qHHuSSY8Il0lqcoMIm5Q54o
 XbdQ==
X-Gm-Message-State: ACrzQf12zJMXwroODAqaI9NUaMdBsajS4XsCOWpGvP6bh0mjLxKbmeHQ
 /a/ZQXdrExfwz4a+xO/wih4=
X-Google-Smtp-Source: AMsMyM4Eux5p6QGnnjdVJQNbuM9tL3KSnsNRcKXNy+skLIDyzqy4y86gJPUNpqIBsvvckFcimdUQGg==
X-Received: by 2002:a05:600c:4618:b0:3c6:bf28:ae64 with SMTP id
 m24-20020a05600c461800b003c6bf28ae64mr44399479wmo.51.1666616884152; 
 Mon, 24 Oct 2022 06:08:04 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 d1-20020adff2c1000000b0022ac1be009esm27228344wrp.16.2022.10.24.06.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:08:03 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: asihpi: remove variable loops
Date: Mon, 24 Oct 2022 14:08:03 +0100
Message-Id: <20221024130803.2156295-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

Variable loops is just being incremented and it's never used
anywhere else. The variable and the increment are redundant so
remove it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/pci/asihpi/asihpi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
index 8de43aaa10aa..001786e2aba1 100644
--- a/sound/pci/asihpi/asihpi.c
+++ b/sound/pci/asihpi/asihpi.c
@@ -725,7 +725,6 @@ static void snd_card_asihpi_timer_function(struct timer_list *t)
 	unsigned int pcm_buf_dma_ofs, min_buf_pos = 0;
 	unsigned int remdata, xfercount, next_jiffies;
 	int first = 1;
-	int loops = 0;
 	u16 state;
 	u32 buffer_size, bytes_avail, samples_played, on_card_bytes;
 	char name[16];
@@ -806,7 +805,6 @@ static void snd_card_asihpi_timer_function(struct timer_list *t)
 			(unsigned long)frames_to_bytes(runtime,
 						runtime->control->appl_ptr)
 		);
-		loops++;
 	}
 	pcm_buf_dma_ofs = min_buf_pos;
 
-- 
2.37.3

