Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C77A65E936
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2019 18:34:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41AD416B3;
	Wed,  3 Jul 2019 18:34:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41AD416B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562171698;
	bh=GpglxQvuzUnVWmliEDwb3fO/ZyAEWo4kklvHmY4s5eA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M1mfO5xVnaH5ElLYrtzoJcnlUnZ2TqlLDWJQXcrurAMN6vAC4mR/qmDmTkGcDd84i
	 /tXlS/jdDAZV4UZFGCX6Y5vkynVijeIj408QuH/RxT9o1tJlF8iYyI4TC8K+Dm/YPg
	 2vRZCkkYC4Dz0SpVj3JS/KLTRQKC3S3NzgT4HGps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C946DF80114;
	Wed,  3 Jul 2019 18:32:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38E15F80112; Wed,  3 Jul 2019 18:32:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C310F80110
 for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2019 18:32:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C310F80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="A3/1i6PF"
Received: by mail-pg1-x541.google.com with SMTP id i18so1499417pgl.11
 for <alsa-devel@alsa-project.org>; Wed, 03 Jul 2019 09:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=l0364bIasEWF4u6q6PoJgdA0dWNvfPQBCr9kLEyFzmc=;
 b=A3/1i6PFKv8gEafTpu+DrcOtTvtUVbk5N0FhU3sAIRCeitnnDZl/16Vgwj94zhFZRw
 sloUEURPQeMMX4uVZq7nUxbncgxJJDxnsQEx5LGUxopH1IJ5oNMFuliVpw+YwjuTn0Hl
 hY7MHjdi8wl8/WsuuDcyV4wjpSseMOFafa32ggD5Q3LgDQHRgISniM1+DKZSTnFemvXw
 3wJWkS0e/SqzyUZST9Fj96yx55xRxQMtTonyNNuCWyeObU4YNYhx0jMt3uqIpSf3Defm
 btWbdptUzbuYrZ4cf/Q56RzBPSzsOSNjVzPMtbcFCHyFfcYSaXorV0t0OoOPb+dQEm7g
 CXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=l0364bIasEWF4u6q6PoJgdA0dWNvfPQBCr9kLEyFzmc=;
 b=Vzc15uVzv/1X+DsbAM5NZQ2oMOlweUfpNXYyOzutPnRpiNz82FmX0PKVHeoO1KoT02
 FoAdprI9acgXOzSLtW6lDZSQx48flsz9BTof3F/qkVP/BoQWTT7YedRW2hqKNQegjVEN
 +qTec09RqcAulHWC1terzvakLyiXK72przFDps3jTyXtimReFQJBpGZiRDeebXohZ2IH
 f+fcc5mOs1q3YZePU0hwHV1tFVuJV4C7IGYq0UNT0BhEsr9fltIVhhjtK+3OhgMufimO
 qmW21uA47HautmFmc+fziyDBpeb0aIG4qE8TND2n761+wsgmHOe0wuaAGsn6/0U8sDgY
 UL1Q==
X-Gm-Message-State: APjAAAUOD8lCpOr+FpgOmnfBPfSP8oRnkJ1qozn47S+eoFEg+tN7ivL1
 YEVcKDk+MbuMX4zmluxEuxE=
X-Google-Smtp-Source: APXvYqz95ExAz0RnIJX8vrhkHQw4WbHC6UJPq4iqb2Ol9St8WIphQDUOOlVKDM6wl0N9nBJSWgYktQ==
X-Received: by 2002:a17:90a:b883:: with SMTP id
 o3mr13734677pjr.50.1562171554721; 
 Wed, 03 Jul 2019 09:32:34 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id a3sm3042487pff.122.2019.07.03.09.32.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jul 2019 09:32:34 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Date: Thu,  4 Jul 2019 00:32:24 +0800
Message-Id: <20190703163224.1029-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Fuqian Huang <huangfq.daxian@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v2 34/35] sound/soc/codecs: Use kmemdup rather
	than duplicating its implementation
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

kmemdup is introduced to duplicate a region of memory in a neat way.
Rather than kmalloc/kzalloc + memcpy, which the programmer needs to
write the size twice (sometimes lead to mistakes), kmemdup improves
readability, leads to smaller code and also reduce the chances of mistakes.
Suggestion to use kmemdup rather than using kmalloc/kzalloc + memcpy.

Acked-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
Changes in v2:
  - Fix a typo in commit message (memset -> memcpy)
  - Split into two patches

 sound/soc/codecs/wm0010.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wm0010.c b/sound/soc/codecs/wm0010.c
index 727d6703c905..807826f30f58 100644
--- a/sound/soc/codecs/wm0010.c
+++ b/sound/soc/codecs/wm0010.c
@@ -515,7 +515,7 @@ static int wm0010_stage2_load(struct snd_soc_component *component)
 	dev_dbg(component->dev, "Downloading %zu byte stage 2 loader\n", fw->size);
 
 	/* Copy to local buffer first as vmalloc causes problems for dma */
-	img = kzalloc(fw->size, GFP_KERNEL | GFP_DMA);
+	img = kmemdup(&fw->data[0], fw->size, GFP_KERNEL | GFP_DMA);
 	if (!img) {
 		ret = -ENOMEM;
 		goto abort2;
@@ -527,8 +527,6 @@ static int wm0010_stage2_load(struct snd_soc_component *component)
 		goto abort1;
 	}
 
-	memcpy(img, &fw->data[0], fw->size);
-
 	spi_message_init(&m);
 	memset(&t, 0, sizeof(t));
 	t.rx_buf = out;
-- 
2.11.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
