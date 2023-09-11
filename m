Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E8F79A5FF
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 10:26:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2498ADFA;
	Mon, 11 Sep 2023 10:26:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2498ADFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694420817;
	bh=Uz6E8HLxWI35ovCMD+J5so9kCTh/4AIEHtwt/doxIgs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HHTfrGiRH4zJ3Fe8P7TkDn5BlyNpc+WIqFzF19Q6d7tykbJ6AS/EXYcPpiGb/2AcV
	 QrqEHAw1OlSLjMcXU/kV93pxoxMPMLsMitZVEDsB/nJ83NzX0C2mr+iRjn7cyvNfET
	 GY0vfY2uSrZToZ/7EoACCVFnQ8ry23VyFohnqxlE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B183BF805C8; Mon, 11 Sep 2023 10:24:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D21CF805C5;
	Mon, 11 Sep 2023 10:24:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FFF3F8047D; Mon, 11 Sep 2023 10:24:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5BDADF80425
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 10:23:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BDADF80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=OHKKqAGe
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5029ace4a28so3604690e87.1
        for <alsa-devel@alsa-project.org>;
 Mon, 11 Sep 2023 01:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694420634; x=1695025434;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/HhJkYfqyaXs9yIGYFPPzlpsmAC+qKTgrrYF36b8es=;
        b=OHKKqAGeqPhss5IfEpDGVr7WWjbmCKvsiTQ9XxiKyJvJKKRCkjmJHw3OL2aV8n8C8p
         N75Z+kQCiduc1eQX9GM5fCw8bSphkry5maVbLFbm20P74+FXPaSHdASk41zVYQ+l2bYy
         4daHhjgRXhyCa8J0u/Z7KxAx+iTEOFEqCc9NXTy8M63FCQU0NQDYpItjZ3uhke4xyNi/
         EUdYjLydc2sjRz8mu+xN5SNd/DVs4l4ZR2jt7HGFxjnkdiaKX6FU+SEZbmty1D8IozKb
         EX1H7/7evATt79snmn5mYow+lwXpUl+aVwDsiTD9KiPZub1xeBGeC6bqWztaIfnSQ0pq
         QDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694420634; x=1695025434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/HhJkYfqyaXs9yIGYFPPzlpsmAC+qKTgrrYF36b8es=;
        b=LFT0S6PS4Vm5+rsuWYTpid/WBWHuIhXunxbF5tVKd5ikl9JODzwkz9WIfEpQnsvOhD
         4s+YV4ptDWYKMqdF2xRByB/xuzT9J51111Uu0udVtiW2b+QDCgu7r9jPA/aaTwu2DD2O
         BkQCqvf+pFuKsfqBFsR8DmBniccjWblFl7O4JMTLEXISZnvVxRAvVprY4wVIwv06/dnh
         O9wptP13uu0KH/m1JfbRmR4kwIxPXYybJAcu4ShGOiV7DgxcYGSCG6y/KV2fKNabyUMK
         Lkan+xBPUbql7EJz8pRfDzFOaDhkgnwYLWBR4dLX3Jdky/CoZC+gOpW/ajT9l0EbdkBI
         H+1w==
X-Gm-Message-State: AOJu0Yxy6UoO1PbACVkiF97aV9z/jXAjeArx99rHYev3rXrGkXmobNRk
	mHl3G/WYXk0S8IqKQod9IvJqmw==
X-Google-Smtp-Source: 
 AGHT+IE6WCFsa0bFZLixppvL9WUrXFO38to59wdYHxNCXTqD4Xc/xeONINSL8v0RojtmsjmZbNdCFA==
X-Received: by 2002:a05:6512:3f14:b0:500:d96e:f6eb with SMTP id
 y20-20020a0565123f1400b00500d96ef6ebmr3927961lfa.19.1694420634181;
        Mon, 11 Sep 2023 01:23:54 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 a8-20020a19f808000000b00500968ddca9sm1247712lff.136.2023.09.11.01.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 01:23:53 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Sep 2023 10:23:52 +0200
Subject: [PATCH v2 5/7] ASoC: max98396: Drop pointless include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-descriptors-asoc-max-v2-5-b9d793fb768e@linaro.org>
References: <20230911-descriptors-asoc-max-v2-0-b9d793fb768e@linaro.org>
In-Reply-To: <20230911-descriptors-asoc-max-v2-0-b9d793fb768e@linaro.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: 6UXVML3ZB4B3JGRK33IU5JZIFYOX5ICT
X-Message-ID-Hash: 6UXVML3ZB4B3JGRK33IU5JZIFYOX5ICT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6UXVML3ZB4B3JGRK33IU5JZIFYOX5ICT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver is already using solely GPIO descriptors and
do not need to include the legacy header <linux/gpio.h>.
Drop it.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/max98396.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/max98396.c b/sound/soc/codecs/max98396.c
index 3a1d8c211f3c..e52bb2266fa1 100644
--- a/sound/soc/codecs/max98396.c
+++ b/sound/soc/codecs/max98396.c
@@ -7,7 +7,6 @@
 #include <sound/pcm_params.h>
 #include <linux/regulator/consumer.h>
 #include <sound/soc.h>
-#include <linux/gpio.h>
 #include <sound/tlv.h>
 #include "max98396.h"
 

-- 
2.34.1

