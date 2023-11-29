Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 116777FE1FA
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 22:31:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97356DE5;
	Wed, 29 Nov 2023 22:31:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97356DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701293508;
	bh=/KmdbiDqrVroAl/1B3P2XmoeTE0qtjMki/JNv1gQXwI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nyGnuXh3WsIQYuLumj/hm2xAuand4fVK24wveiS+b1G44UJlUDinpQumwZRFrFz7Z
	 8IIdEeYlYPVhWldd6uTxNHJym0/Vi9+axMZ4leIwQw40eLY0rHKxEeEDW8L958XP8t
	 HtGppTX9pkuRe1HhyBSoPffflfevn2hHQiqFwvwU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9341DF805B0; Wed, 29 Nov 2023 22:29:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EFA4FF805A8;
	Wed, 29 Nov 2023 22:29:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FF70F80246; Wed, 29 Nov 2023 22:29:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D3274F80246
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 22:28:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3274F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=cbJGrbcd
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c9c82a976bso1631541fa.3
        for <alsa-devel@alsa-project.org>;
 Wed, 29 Nov 2023 13:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701293327; x=1701898127;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BhewE5OJd+lUpEbKMUw+a2p3lLwyC+mccGsAap2s2vQ=;
        b=cbJGrbcdjO0JJOWaynYx4lVLSx2rgP580UQQ80HChBK5ySsoMdmkaF5ROO1ZyP17U+
         XyGhdDu+VJtQwvXQ5VqnikBcgzRvipFM4Ora/9y/+c51TSSYlcxEHlIBS7u6e/QCcYVy
         lxoZMsae6Y9umyR/SgKJo26mcqxDOJTDQA1I7+FCixAqehOdiht9zesEgQ+DxEaM0RTF
         YYGIPd27BvstsMSIWtA+0vadbHHTq9pgmrnbcsgBEMODd+tQJa6bIfTZSaZYJYSL97jJ
         CWSE+KKe3xoE2nc1jFJd9i5qDYQ3JuLL+PGNKv6Gk3BGUfEFTconbDkdSfze8xswXGyB
         OA/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701293327; x=1701898127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BhewE5OJd+lUpEbKMUw+a2p3lLwyC+mccGsAap2s2vQ=;
        b=OEh6NBmpluUVEFNSU6YLnaaCN73QOc6SqMTB4bXjJ9d5pOWgJ8okt/kwotSZBgt+AA
         XiLX3/vsJ+EiViKxx9rjT4ddIPR6G3Henr8a8G1ffqCiTayN72YstVaQn/nD2TW566u6
         UAe1HabYBn7Y1TaEZmL6b9tmBmm52vs8UsYVnZvXJyyNdOEqMDsDwaUhNaqA4du7IDtS
         LQwxL+HmJm2ArV1+IaCKBg4IMooXa75ggbia3v0v33XTXqYtELzG0SYLtHnziGKUegjL
         SbE1fAnwVlNrxkpZKx21hToBv0JTBdqZlp1eFmZ9tii5XDwhovfVKMnpLWX7TQMSB36x
         JwNA==
X-Gm-Message-State: AOJu0YzyWgfUi792/f67oqL50WZI6B2qKUZqPVIsxxzaWx8HiLJPsRVJ
	bczo9xpDB/1c8pjaSsdZ9oJOaw==
X-Google-Smtp-Source: 
 AGHT+IGxbQDzbtRllfk3uIL9CtkIkPKjX8R74m1/levpV4rcuCDOPksrJ0QcmNJ3lIdNQ3SMD2Q4bg==
X-Received: by 2002:a2e:8e27:0:b0:2c9:9a87:6683 with SMTP id
 r7-20020a2e8e27000000b002c99a876683mr8118803ljk.1.1701293327016;
        Wed, 29 Nov 2023 13:28:47 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 b5-20020a05651c032500b002bcdbfe36b9sm2106196ljp.111.2023.11.29.13.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 13:28:46 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 22:28:41 +0100
Subject: [PATCH 05/10] ASoC: cs35l36: Drop legacy includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231129-descriptors-sound-cirrus-v1-5-31aa74425ff8@linaro.org>
References: <20231129-descriptors-sound-cirrus-v1-0-31aa74425ff8@linaro.org>
In-Reply-To: <20231129-descriptors-sound-cirrus-v1-0-31aa74425ff8@linaro.org>
To: Paul Handrigan <Paul.Handrigan@cirrus.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Nikita Shubin <nikita.shubin@maquefel.me>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4
Message-ID-Hash: HRDPPTVBSTODODY6NRICJUD7WQB6XJIK
X-Message-ID-Hash: HRDPPTVBSTODODY6NRICJUD7WQB6XJIK
X-MailFrom: linus.walleij@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HRDPPTVBSTODODY6NRICJUD7WQB6XJIK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver includes the legacy GPIO APIs <linux/gpio.h> and
<linux/of_gpio.h> but does not use any symbols from any of
them.

Drop the includes.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/cs35l36.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
index f2fde6e652b9..ec407aca33e9 100644
--- a/sound/soc/codecs/cs35l36.c
+++ b/sound/soc/codecs/cs35l36.c
@@ -18,14 +18,12 @@
 #include <linux/regulator/consumer.h>
 #include <linux/gpio/consumer.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/regmap.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
-#include <linux/gpio.h>
 #include <sound/initval.h>
 #include <sound/tlv.h>
 #include <sound/cs35l36.h>

-- 
2.34.1

