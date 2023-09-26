Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F47B7AEDFB
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 15:31:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C43A1E8;
	Tue, 26 Sep 2023 15:30:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C43A1E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695735062;
	bh=VZX7lHzYcH50gScj6Du2G4mI0CLftcbNVNeTUfrR5ok=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cht88B7aXCktPi6Drsovf1QCPesel896LbToDGIOm3sGBxDVZTBCiYHXbe3hFCpa1
	 GB41IcIKZkZDATm8zMlxRb30tCFAJtGNWWPSZU+0OTeEpVlNQcQfzPoPWEVGEJngNC
	 OxqAKbVc3gUFz/rwSHw5hUQO2tTb4vrta13pty2s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54974F80166; Tue, 26 Sep 2023 15:29:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01014F805B0;
	Tue, 26 Sep 2023 15:28:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28141F8016A; Tue, 26 Sep 2023 15:26:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A676F80166
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 15:25:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A676F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=GW0XRq4l
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-503012f4e71so12014041e87.0
        for <alsa-devel@alsa-project.org>;
 Tue, 26 Sep 2023 06:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695734739; x=1696339539;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hr5amuTNg43g84vy8vdnricessR4/d7Wx6XjZcS7tVE=;
        b=GW0XRq4lzPnKhhjYyubRXKNZxHDmbVOjxbXEFH284oBfB/QPfCSZIYR49ArOxm7rCY
         TbfisdVS63dOIn1aB1NZ5So9gByqbZTdz3n0Egk9GWfcjfUs+oQrmUQDrmquZvZFSw9k
         4Re46CCh6hY3+TKmzdlodd8pTwFXlaOHQuc0iYlbaS5mlEPd+IbKB2VbDx5Gkpqht1nZ
         e043VXchlQNvkbcB/XbJGcX+/q5s74IJB0SQGcG2ot9gdrjuNdYV4z6/y20IGa1Q5D94
         ND57cp9RqnvTTB8rgYoA3kmm55RXksaNcnuMTk1OyLNeGNIbyYzG2VfCYGtI29L1muP6
         bQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695734739; x=1696339539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hr5amuTNg43g84vy8vdnricessR4/d7Wx6XjZcS7tVE=;
        b=NCqIkNSHy0D6HePTonHJsGsFs+fbfo7kHTbdEFdJB4BGJf/X9v+cLtxvMGUQG/jgww
         7AJ8CunCTOyBMlEPyw9/UdEoIr3QmPW9cb8U+Ex2teXbQHEvSxR9GABnDAkjeHiXaivP
         r8tYpWN+PZpg/dipHY1zuni21PbyEiK9iGeUkBkS0G6zp2zfJazVj72uISTKHLHE10Xu
         n/5GHehd9B9TkItsQYWsVLHx1GgiVdRnapawkR3zh5wbzS4roYukX1Kpe6vOJVed2SjT
         USiI9lM2mwP/GmnChwsaayHQv9xaD+C/GxQ8rCa9QvsnxMS8o60/DWNKP/42xF1R7Xl8
         SYlg==
X-Gm-Message-State: AOJu0Yyxfy0IaY+v7wUVE67UPagaicAUAt0hLFZhhpMhslbPoh/wU/M1
	1Cvq03qv9CoMj6pQrkGBdkEZxQ==
X-Google-Smtp-Source: 
 AGHT+IGhCkADecUplAXbs0IyJ40nh2sd47gAxE7FjpqNC2VQj9VPtPn0k3sCnuX/N/x/fkycKRNmpg==
X-Received: by 2002:a05:6512:114d:b0:501:bf37:262a with SMTP id
 m13-20020a056512114d00b00501bf37262amr1239953lfg.32.1695734739514;
        Tue, 26 Sep 2023 06:25:39 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 eq25-20020a056512489900b0050307bf2bcdsm2221540lfb.247.2023.09.26.06.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 06:25:39 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 26 Sep 2023 15:25:33 +0200
Subject: [PATCH 5/5] ASoC: ti: osk5912: Drop unused include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230926-descriptors-asoc-ti-v1-5-60cf4f8adbc5@linaro.org>
References: <20230926-descriptors-asoc-ti-v1-0-60cf4f8adbc5@linaro.org>
In-Reply-To: <20230926-descriptors-asoc-ti-v1-0-60cf4f8adbc5@linaro.org>
To: Tony Lindgren <tony@atomide.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: NJCTBNPVBQUPQVM75XDCC3BHT5QZ5CDU
X-Message-ID-Hash: NJCTBNPVBQUPQVM75XDCC3BHT5QZ5CDU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NJCTBNPVBQUPQVM75XDCC3BHT5QZ5CDU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver includes the legacy header <linux/gpio.h> but doesn't
use it. Drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/ti/osk5912.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/ti/osk5912.c b/sound/soc/ti/osk5912.c
index 2790c8915f55..12f0c3a15201 100644
--- a/sound/soc/ti/osk5912.c
+++ b/sound/soc/ti/osk5912.c
@@ -14,7 +14,6 @@
 #include <sound/soc.h>
 
 #include <asm/mach-types.h>
-#include <linux/gpio.h>
 #include <linux/module.h>
 #include <linux/platform_data/asoc-ti-mcbsp.h>
 

-- 
2.34.1

