Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B800C79A5FE
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 10:26:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDE089F6;
	Mon, 11 Sep 2023 10:25:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDE089F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694420798;
	bh=FSlYlj1KG0nji8kkC1b1nGClknPc1v0yc/Fc3a1Sl20=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mFA3CdfFqk/kMFJKE0zhmZkhY5x6P6R3KUgVE/2VYhOuNDs/DAVpnEOJa+JHBHNGD
	 IymdxbLgRQUUCXnhRGXP1Ev7g7T05l9D0QPxrNGDpBX1J+FoDs/j334Cbca/u6VX4T
	 j0AIsMQqM/XJMwoVoWhlzdtZBUjUez5PLd8huy3k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B5ADF805B6; Mon, 11 Sep 2023 10:24:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72977F805BA;
	Mon, 11 Sep 2023 10:24:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5622F80568; Mon, 11 Sep 2023 10:24:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A591F800AA
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 10:23:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A591F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wKWunjpr
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-501bd164fbfso6672979e87.0
        for <alsa-devel@alsa-project.org>;
 Mon, 11 Sep 2023 01:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694420636; x=1695025436;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RoFqFLIfT/Pj/zYgo2TV8TIm3I2iaBuNZRSIlIfashI=;
        b=wKWunjprOpORdBoSk42WXGqEg88XN194T1jeNKDgAJz4h66Dex4vGk+aeXXTsBEEm1
         hRoRjecxHpM4xhU2219KOE4qpU9TFpL7iY15DAwlsPxuGKGwYXXa52qsD3pmRXrtEmDg
         sBTbrn3elJ+aE61I/GOkrbBjqOupQFmaufQin2ywYTlDNofc+FqShVtIrBO2aID0gD9B
         iGNwCQY653InUWAOfPMtSevSAfiMGp9ry1KYts0x8Ep+48lFjnkrgWFncEOhoPhZ1vfT
         NSjGWkimfKq+dfJevFvn3J841Kw4oS0OwPu5Jut2HOlEpUK+THFfO4Yu5nCQB8ly4ELY
         BSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694420636; x=1695025436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RoFqFLIfT/Pj/zYgo2TV8TIm3I2iaBuNZRSIlIfashI=;
        b=mzQHXYvzfWqHzjSSRfBYqkkolaSe+W909aLtJRg4D3WgtztQOJ2ruu9pqRmi0DbTkJ
         zGWoZgiVFNH8HH9KHolJUaLn283xn0i5t+lIvv2MdtTpDET0t4Ds3Fs8YrOOpn8ei1Za
         AA0KS0q6bqXLyOOL9cbrSUCs7ndKrbdDKsmhKF9hEzDMuTijiR1aVtWSiJCVNIdY9s1d
         CXEmRfAjSn0j7kJxZxrqIkL4RywFnSQzcO0XbwwlxhPpCUvp8JxFGbzMOApNQnAFHctf
         Wx0zX5Zdi7pupECxKjb6UTWt8Em7bl54sB3X7P1zoai03uCp7hP5TpsoC1dJ+P9tl4/F
         Xvug==
X-Gm-Message-State: AOJu0YxU5sm21zSJzLmH3l0wIZZgDdNXgAYffguGfDUAbBk7S7v/sYhn
	JrsX9Bt3kUXi913Jiavg7F933g==
X-Google-Smtp-Source: 
 AGHT+IH/CI+1Aa8xWX3l3qD+VArAvLQxWZ8YfL/GW2vDk7MBZhMam+A68zhQz0zu3t/vzQtZwPJeiA==
X-Received: by 2002:ac2:4c48:0:b0:500:c765:bbe with SMTP id
 o8-20020ac24c48000000b00500c7650bbemr8797463lfk.0.1694420635941;
        Mon, 11 Sep 2023 01:23:55 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 a8-20020a19f808000000b00500968ddca9sm1247712lff.136.2023.09.11.01.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 01:23:55 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Sep 2023 10:23:54 +0200
Subject: [PATCH v2 7/7] ASoC: max98927: Drop pointless includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-descriptors-asoc-max-v2-7-b9d793fb768e@linaro.org>
References: <20230911-descriptors-asoc-max-v2-0-b9d793fb768e@linaro.org>
In-Reply-To: <20230911-descriptors-asoc-max-v2-0-b9d793fb768e@linaro.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: KE2M4OPT5JNPAL3C425A6E4ILRNL73VH
X-Message-ID-Hash: KE2M4OPT5JNPAL3C425A6E4ILRNL73VH
X-MailFrom: linus.walleij@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KE2M4OPT5JNPAL3C425A6E4ILRNL73VH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver is already using solely GPIO descriptors and
do not need to include the legacy headers <linux/gpio.h>
or <linux/of_gpio.h>. Drop them.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/max98927.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/max98927.c b/sound/soc/codecs/max98927.c
index 776f23d38ac5..70db9d3ff5a5 100644
--- a/sound/soc/codecs/max98927.c
+++ b/sound/soc/codecs/max98927.c
@@ -15,9 +15,7 @@
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
-#include <linux/of_gpio.h>
 #include <sound/tlv.h>
 #include "max98927.h"
 

-- 
2.34.1

