Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FA7211D3
	for <lists+alsa-devel@lfdr.de>; Fri, 17 May 2019 03:45:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0277D16C3;
	Fri, 17 May 2019 03:45:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0277D16C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558057551;
	bh=LSwYWTa4SykEI1x2f8/jDEWHwS0inSxoX6VT9/xeQAY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=salZklDIjBEyoHjoKiuL3l2w7dPOd7wIOgT2DwzJECa763OLe6Xqe9Dfs08YOadRj
	 1GSz9GunMPLk2/KlnQnJ8ZpFxEF5beu/FL5oHpQcAy3jWKdFxIsPQYNT9b5kxaBTok
	 ma2QJcgNtyQ7CeNC76eNUJWwmHYsbNSoUc6iekG0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2BFEF896B8;
	Fri, 17 May 2019 03:44:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC17BF806E7; Fri, 17 May 2019 03:44:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43619F806E7
 for <alsa-devel@alsa-project.org>; Fri, 17 May 2019 03:43:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43619F806E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="GbRa3mxk"
Received: by mail-pl1-x643.google.com with SMTP id y3so2538713plp.0
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 18:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qd7xa2d3wWxl6eLKT6hEmiY5j3RXTTyS9l/Ym2orJXg=;
 b=GbRa3mxkWwK0jwgVy0y5gJSH/iPIJsWwPlzdEU/3qBdN8UyUjqzVAuduhynYhN6Pzd
 Ftvg/xwBM50HIpKGZhJFbImIsBX2hgvFlCY9IsCbfuCpc5p4xCAWNvJ1hKALHB2h/r5e
 Z3FrOGqMyQl83LeTRkrn1hutazJsDFr4zvqU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qd7xa2d3wWxl6eLKT6hEmiY5j3RXTTyS9l/Ym2orJXg=;
 b=dRPNep4VefCkWpgsSO+uBDTcRB8AKTzLUSq/wUKE85Bm9dopGtBOiKwLr0aUJ1MmO3
 7d8eY7zyAbP4o9hwcHpIJxTg+yESvwB02paO3tniwHqqCkNx/WLxLYnbfmE7MS5L9T9I
 ixcJqzJ75TzcMF60FFdrb6sJ0LjErTg+zZTP7dzTWAvyXiSxn7/6MRkWyk+b4B8DtshJ
 21QU05nqCZKEEGqLwIzprE+JIm5o8cfDOc++5o01o2k4QKoyhx4cjxZtVjK1sSDyrRzy
 2NY/P9zxWa32lMVIhIPe80AFElt1Ahta8NxYi1Yd/DcHoj5qh1LK7vN2r2jvM1QG95nU
 X8Vg==
X-Gm-Message-State: APjAAAWjryxQko7ayhMUHnshFAhYK+s5VujY0F4K4kB2ChjyN1zR5ND0
 pklzU3x4/Uh8WjAM3j4LJxMH5mlQng==
X-Google-Smtp-Source: APXvYqz4aMjf434OVq0psODxKd6PT/WGbIByciImaJC2fOLpm4caWDyiYAoGa4stddMYtaMXgxC20A==
X-Received: by 2002:a17:902:f20b:: with SMTP id
 gn11mr53908671plb.126.1558057435998; 
 Thu, 16 May 2019 18:43:55 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id w189sm8133796pfw.147.2019.05.16.18.43.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 May 2019 18:43:55 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Thu, 16 May 2019 18:43:40 -0700
Message-Id: <20190517014341.133938-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ben Zhang <benzh@chromium.org>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH] ASoC: rt5677-spi: Handle over reading when
	flipping bytes
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

There is a case when a we want to read a large number of bytes that
require a burst but is not a multiple of the word size (8). When this
happens rt5677_spi_reverse will run off the end of the buffer. The
solution is to tell spi_reverse the actual size of the destination and
stop if we reach it even if we have data left that we read.

Cc: Ben Zhang <benzh@chromium.org>
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/codecs/rt5677-spi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index 84b6bd8b50e1..a4dfa0345c6e 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -101,7 +101,7 @@ static void rt5677_spi_reverse(u8 *dst, u32 dstlen, const u8 *src, u32 srclen)
 	u32 word_size = min_t(u32, dstlen, 8);
 
 	for (w = 0; w < dstlen; w += word_size) {
-		for (i = 0; i < word_size; i++) {
+		for (i = 0; i < word_size && i + w < dstlen; i++) {
 			si = w + word_size - i - 1;
 			dst[w + i] = si < srclen ? src[si] : 0;
 		}
@@ -152,8 +152,9 @@ int rt5677_spi_read(u32 addr, void *rxbuf, size_t len)
 		status |= spi_sync(g_spi, &m);
 		mutex_unlock(&spi_mutex);
 
+
 		/* Copy data back to caller buffer */
-		rt5677_spi_reverse(cb + offset, t[1].len, body, t[1].len);
+		rt5677_spi_reverse(cb + offset, len - offset, body, t[1].len);
 	}
 	return status;
 }
-- 
2.21.0.1020.gf2820cf01a-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
