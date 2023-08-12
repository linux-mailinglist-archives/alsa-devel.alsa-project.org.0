Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B3377A225
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Aug 2023 22:01:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3486BC0;
	Sat, 12 Aug 2023 22:00:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3486BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691870496;
	bh=qcdB8q1e9jO0jLCyRCY0N0RxRI/H//aApfvCZ1DE2Vg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DCOe0gyh7+5ONjGrykkyCckUsJpjXnLhM5ZsRPbV86f5hDPbnugRUVzbH5GNB35lA
	 Bd0g9NGYPNmLQxjVhAwacqpySIZfoVUDLX4UdfuHitiyQQ//ZCeEGAbj55Yj4do81p
	 RGU8dfvPnGtP45J2/jWcdHlIH7eVIduMfkSYmmSw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1271F805A0; Sat, 12 Aug 2023 21:59:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DBDE8F80589;
	Sat, 12 Aug 2023 21:59:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA52BF801EB; Sat, 12 Aug 2023 21:57:11 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 386F8F80536
	for <alsa-devel@alsa-project.org>; Sat, 12 Aug 2023 21:56:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 386F8F80536
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=frhNXcaW
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4fe7e1ef45dso4866106e87.1
        for <alsa-devel@alsa-project.org>;
 Sat, 12 Aug 2023 12:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691870212; x=1692475012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A288uWvza8eejmp10gXkLXEXmbjFh4d0tMdZ3gsN+gs=;
        b=frhNXcaWs5q+snf9myqLUyER93PKuzPFFDSAV/KOAW1npfWjJQnr+pfAFBJdvldRW7
         C3QecsstVixY0/MF6imRDUPvKVh+KFv+nbwmr5TDqrk4moYIT6sqNwJ7B/fE/1xKyJRI
         LR2jfdfQfRUF7abUzMJYevz1DY0+XyE31r79g42S3DZGblB0JBi7345MHViJtBVt4uD3
         3dMY72t/3mG3xJI8j+zQR9VCrWyuFxWddDZh0qXWlIC3jTuag8+hKyRzW3+kzF39Ff1E
         RO01fdmb8zvlDYizZkt544ZA7L0Te7OjtJWX826EtXtJXwSFv5TdW+7KGu0ZU5zVK7uZ
         EhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691870212; x=1692475012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A288uWvza8eejmp10gXkLXEXmbjFh4d0tMdZ3gsN+gs=;
        b=Hn6wg6J3YXq6+DRs3t3lDGw6K27+V5dq1V4w2yCvFvvhqKbV/IjNVeXCpiCjVCA96d
         4eONNTbOlZHNpas0Pic0aXG4um/+s/0KKlqUGtVZYbMqBcQJ6bn2dr4cSqBIuX9JQ0RF
         ktaTYwc9cayB++L/nMRFg0zpu3HJDX9egqmAjkg186Meo6/Ycx4hG5Pw28tq9C/qF8Pr
         BjwEeVlTg5vYmGZgr29FvYOUTpOoEjbvGno6JpFKI3eyMPgI9DmD4ohxLfYUs7KWf2N3
         1b29FamLLG58+QPSWWapHj9i+Lpa04JmelnS9Gr9iLYhdSa7lBFh+4d3AjqXnKw3+sWW
         zuew==
X-Gm-Message-State: AOJu0YzerUiQ1Y4q+SfjDv0NxNK3NPhluCBopRabw6fs/VEWOJr0ozfb
	A3GAjzJSatbEQbOrVErmrSNVdQ==
X-Google-Smtp-Source: 
 AGHT+IESvFQDyknsL/1Q8llGhTwhb3gq6hbf1VZM6TbirajqRanWcvi/ukFP+nvL5O2jiF069jpdCQ==
X-Received: by 2002:ac2:5303:0:b0:4fd:fadc:f1e with SMTP id
 c3-20020ac25303000000b004fdfadc0f1emr3238735lfh.44.1691870212048;
        Sat, 12 Aug 2023 12:56:52 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 n29-20020ac2491d000000b004f87893ce21sm1236182lfi.3.2023.08.12.12.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Aug 2023 12:56:51 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 12 Aug 2023 21:56:42 +0200
Subject: [PATCH 04/14] ASoC: rt1016: Drop GPIO include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230812-descriptors-asoc-v1-4-eb4dca1f68af@linaro.org>
References: <20230812-descriptors-asoc-v1-0-eb4dca1f68af@linaro.org>
In-Reply-To: <20230812-descriptors-asoc-v1-0-eb4dca1f68af@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: 5FIHRMU3RKF7XQ3U5W73DO7WWUTVS47V
X-Message-ID-Hash: 5FIHRMU3RKF7XQ3U5W73DO7WWUTVS47V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5FIHRMU3RKF7XQ3U5W73DO7WWUTVS47V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver include the GPIO legacy header <linux/gpio.h> yet
doesn't use symbols from it. Drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/rt1016.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rt1016.c b/sound/soc/codecs/rt1016.c
index b1e69fa290b2..919a1f25e584 100644
--- a/sound/soc/codecs/rt1016.c
+++ b/sound/soc/codecs/rt1016.c
@@ -16,7 +16,6 @@
 #include <linux/i2c.h>
 #include <linux/platform_device.h>
 #include <linux/firmware.h>
-#include <linux/gpio.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>

-- 
2.34.1

