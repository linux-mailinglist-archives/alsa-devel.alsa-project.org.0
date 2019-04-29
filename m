Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA6ADFC6
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2019 11:50:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 115761676;
	Mon, 29 Apr 2019 11:49:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 115761676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556531429;
	bh=0s2NsNld4sRsJXE9A0tW5uC7QERieVDZgZdaJtyLnGw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vLrLDHvAOX+ABgKyERvSdshoTBqozVrLwLoUffAqBkRhXUN3o1Hx5MS9Bp5Yex/Pa
	 +xhw0uZGMg1FO3U/0YKqn+WbhZHE6OUUGSPuoTd7Nwg0nz4iWXZis9bEi7/MFiuXPq
	 tueeW0xHFv2UwLQT3vKpO/29dLtMZJf1scpYnDMU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9606AF896FA;
	Mon, 29 Apr 2019 11:48:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F5D7F8962A; Mon, 29 Apr 2019 11:48:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C045F80C41
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 11:48:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C045F80C41
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="DHEEBsU1"
Received: by mail-wr1-x444.google.com with SMTP id k16so15041879wrn.5
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 02:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1vJi7jzhGksKSzSUALjvd5a/wT/QdGOfMu/ANjtuZHE=;
 b=DHEEBsU1qBAt9TXEXJ1V85pxD8WpW3If6DHzzZi4Hkhn5f5Pbe85cOLPEAMi29AOb2
 uofvyNQN+W1wNmV2zYC2Y5KawyC620cqLMa67v5FM0PGsR51yW3pvqZO5zPlcYGSDuvN
 mAOZrLCxN+uffrRq2Flq2BjKnPdoZACbiAQjwUuMelA6FB6p1S69w59uezspzBhpChBZ
 ovEmRyiAhMtLAiAo/6EiQJpcqQgVXI8xJbUqxZQiDoVdcDGu9QHwyt2p8SMEnCjAM4XF
 bEfnbq9JeCrrNxSZWHtyn0EQYI93hlqZxZV0UIq86aEvKP1l38cJoAnucKOIFvUpGZqX
 95lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1vJi7jzhGksKSzSUALjvd5a/wT/QdGOfMu/ANjtuZHE=;
 b=tmOiRgy9jdv/ZgGol1TpK1Dv/9/bjRVzuhLL99wbCpG0heUiMP8fKB5p7PcVIBe6Is
 fk1SHjJqlbN7NLGPk1V38GvKeXzX0MdrPNbEJkrFXsNI2QJhBndZQfeG0WyEIdvoAJHv
 o5eMjdkJBbjbhzpIcoTeQNX1vk1rSwTzxVs7e3+aES9MrRtF73+c7olwUqbvnpqPavxx
 J+T7a6Jlta6/3vAKa+5LCo1K2d9w59rCHSdQimEv3RpixkpmGDzVwpVWyl/Gottulx7G
 VvM5v7+j3ZrxZLQ8WPvpDk2Z/YLPDdVvvABYbldL2gtUOkgiuqUAi0ciCkBqmjzkluYw
 AFZA==
X-Gm-Message-State: APjAAAUhWUD8kRLu5azdtxGIs7EykhmRBYeFL10s0tEnCV/3WudoQ46D
 R3o4jfIc1wdP6VRvliaMamEfeg==
X-Google-Smtp-Source: APXvYqy37aX173M+03P7QBLkDx71CokTO8IGK+3sJKOpk4e5ax6NJ8Np4npqIkJGdOhMkgcVWidOkA==
X-Received: by 2002:a05:6000:45:: with SMTP id
 k5mr11840603wrx.261.1556531279788; 
 Mon, 29 Apr 2019 02:47:59 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id 192sm47987465wme.13.2019.04.29.02.47.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 02:47:59 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Mon, 29 Apr 2019 11:47:49 +0200
Message-Id: <20190429094750.1857-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190429094750.1857-1-jbrunet@baylibre.com>
References: <20190429094750.1857-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Cc: patchwork-bot+notify@kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 1/2] ASoC: fix valid stream condition
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

A stream may specify a rate range using 'rate_min' and 'rate_max', so a
stream may be valid and not specify any rates. However, as stream cannot
be valid and not have any channel. Let's use this condition instead to
determine if a stream is valid or not.

Fixes: cde79035c6cf ("ASoC: Handle multiple codecs with split playback / capture")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/soc-pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 99bbd724d2a6..263086af707d 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -42,8 +42,8 @@ static bool snd_soc_dai_stream_valid(struct snd_soc_dai *dai, int stream)
 	else
 		codec_stream = &dai->driver->capture;
 
-	/* If the codec specifies any rate at all, it supports the stream. */
-	return codec_stream->rates;
+	/* If the codec specifies any channels at all, it supports the stream */
+	return codec_stream->channels_min;
 }
 
 /**
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
