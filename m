Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FE72CD97D
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Dec 2020 15:44:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 779C71832;
	Thu,  3 Dec 2020 15:43:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 779C71832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607006673;
	bh=pr8u4v1L17lZmDmkKunrZiR8bd4aGYSZbRk51XB6i2c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LQ7V1fsENMV9eLiKUEOq3y/m2wEvHOOipPNBeeDl3wXB/8XnwioP/EWRi9gGGMSB9
	 SIpa1BucNkMCx8vGO03NVnxwvSgcm+AyaC2Db9BOxfKUX1uLkqdCPpDERSjkg85RSm
	 ktRnF6cgV80ogYvVgP4GVJVp3xVCxrqYcVZtRHWc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98165F80254;
	Thu,  3 Dec 2020 15:42:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F64EF8016D; Thu,  3 Dec 2020 15:42:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B837F80082
 for <alsa-devel@alsa-project.org>; Thu,  3 Dec 2020 15:42:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B837F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cu6WnOcz"
Received: by mail-pl1-x643.google.com with SMTP id t18so1268902plo.0
 for <alsa-devel@alsa-project.org>; Thu, 03 Dec 2020 06:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X1uEb0a/fmwKssKVnSrBR+CZio6TfcFmqrf9Oztpt7Q=;
 b=cu6WnOczavFxEWRHaoPN6CUs+gLeJUD2zGzQ3oh9c5iR2hkaIo6eCLeAyCHQ9qVdX0
 +6SqEnDvIX/LnqDjW0+zKMgXHeqMrj2YmqvtaJ3HE60MqEt76xPz3BSyGBfWOJej6DhW
 UPjXJFKQyZMgNe39xyHKjMeRh+VZvK31FGCF3X85utpQgNj9/vp1DriMUOgLiWhNJsjo
 OacopigFvwkfVyVw4+I1Ma4/tlsJROvjRth0fPCx2wZgEvHmDiGMl48jSeL2cUqztsaA
 +hESuv1xIEks0908Xa58SvcYZu+xwvfcqAoZaHIGF53ISWQrW2Q65kfJMaOpVOi+CRGg
 ECnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X1uEb0a/fmwKssKVnSrBR+CZio6TfcFmqrf9Oztpt7Q=;
 b=DYtDP99m4/uvl7lMt3EvP4TN0Xd6Bw9UHvcI1ssJq6O2Ep8NGJn3EpwV3XmkWhKLiI
 D1gUoJLSOKvH0ulyEduKHS5i+3fsflqp2GHbMcrOvtpYF3JUKhNfU9ELbRQg/gqHswgx
 zVUGiGOX2sdCc9GleiRv1AgQen3u8OCKkBhfbHo7Frq5N48s3y8EYT+WkTqpoLZlwqiB
 ToOe2dxHM+7XoRYcc/LaEVfriq7DkiIr5rtQLwiUDLHyEOUWSAZ1eoN+JMxUm04y9Ofv
 e3z6UYMAg+DToN7SCACllsyrLRzDeIV2jPJT6rycsR42Fk/hLrh7PeN9n0SmFVO3zkEq
 DSqw==
X-Gm-Message-State: AOAM531wdIZFzEHv9QMxQc4JUp2K6RuHf9gojT3DD9KUNu7bqFziYmc5
 4ny2e/fi2L4PtNFONe/44F4=
X-Google-Smtp-Source: ABdhPJxdHH4SAMRmQgv5v1Pp3rTzUgxcXuJOi/Qz3P0KNxhymGiQgf33YHqxGp+RmfcgepouNJlSXQ==
X-Received: by 2002:a17:902:860c:b029:da:1ba0:3979 with SMTP id
 f12-20020a170902860cb02900da1ba03979mr3490630plo.8.1607006558805; 
 Thu, 03 Dec 2020 06:42:38 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id d2sm1689322pji.7.2020.12.03.06.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 06:42:38 -0800 (PST)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] ASoC: jz4740-i2s: add missed checks for clk_get()
Date: Thu,  3 Dec 2020 22:42:27 +0800
Message-Id: <20201203144227.418194-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 linux-kernel@vger.kernel.org, Chuhong Yuan <hslester96@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Mark Brown <broonie@kernel.org>
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

jz4740_i2s_set_sysclk() does not check the return values of clk_get(),
while the file dereferences the pointers in clk_put().
Add the missed checks to fix it.

Fixes: 11bd3dd1b7c2 ("ASoC: Add JZ4740 ASoC support")
Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index c7bd20104b20..0793e284d0e7 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -312,10 +312,14 @@ static int jz4740_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
 	switch (clk_id) {
 	case JZ4740_I2S_CLKSRC_EXT:
 		parent = clk_get(NULL, "ext");
+		if (IS_ERR(parent))
+			return PTR_ERR(parent);
 		clk_set_parent(i2s->clk_i2s, parent);
 		break;
 	case JZ4740_I2S_CLKSRC_PLL:
 		parent = clk_get(NULL, "pll half");
+		if (IS_ERR(parent))
+			return PTR_ERR(parent);
 		clk_set_parent(i2s->clk_i2s, parent);
 		ret = clk_set_rate(i2s->clk_i2s, freq);
 		break;
-- 
2.26.2

