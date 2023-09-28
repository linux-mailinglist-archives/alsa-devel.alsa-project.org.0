Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F6F7B2847
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Sep 2023 00:16:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CFA3DED;
	Fri, 29 Sep 2023 00:15:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CFA3DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695939405;
	bh=Q7iUCdUvNfTEfCOqAcI17p9d1/Rti3AJYWiZ3sN7n+0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gl7EMbUM52fo0pEHFM/cGm8cxqVFJ2SUGmCeeVkRhU9EtmlUmgzeNrA0PO4sUqFN1
	 oVSvhlzUGSSL5EJCzTAC/ZIY0urZTSlRtaECP1ir0c4+cymvGRTAYdtwMcXmYbUtJw
	 LAU2XFEbNP32Zd4pwdobs0CHgeJd5G0M39Vs60lI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CFA9F8007C; Fri, 29 Sep 2023 00:15:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EBEF2F8016A;
	Fri, 29 Sep 2023 00:15:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9181F8055A; Fri, 29 Sep 2023 00:13:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 24F73F80166
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 00:13:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24F73F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=QiVJuMvR
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50308217223so21136701e87.3
        for <alsa-devel@alsa-project.org>;
 Thu, 28 Sep 2023 15:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695939180; x=1696543980;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hm24NpX94JBemDRTScZMK9z0G78Go8UKUQZ7xueoWyk=;
        b=QiVJuMvRa7QI7wHBtndO9bpWyuC4AndXn/UBHqak9xEWfyIwR4gcu/cK693KXdZzKn
         56FSSRG1ZnGd1Q8u40U+dmvcK13NQReHzooYeyIffWEVv90czT1w1kJoM1/lRB3TdDPl
         X9jZLqkPbe/VBBYzG57Frsat3WRLAZVYrzU7YVBfXkFvo4CXqEITobTV/O6dNeUCl3Rb
         VbruSoqQ2qB3l2qOC4P4AJ42+f1Hs8+hSgxc21GeHnu5WsNw27LYhWFsSpwfr6Lczu7I
         Bqrpg30a6boSEsK45Asse9VBpFZ3j0l/vtFPs2LqNPzkwBvvAM+nL3O6lwRRgS7/Zp99
         weoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695939180; x=1696543980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hm24NpX94JBemDRTScZMK9z0G78Go8UKUQZ7xueoWyk=;
        b=mNUNHxDY4ZYbgZr0ZDcIsWPChpmrHl1tmry4Prqbsa66rMuSYwkH+m2LpgMKNWNBWJ
         v8Z6zTzL5C0z4lzsw9VaEr+EumbI4KMRSxu6K7aM07RH2QCll7lAs7YgL7CgGcHR1psd
         SeVCvR2tETCBx/NzsgWJk8TCeMVln68azF7wXHZPuQaIMj2HcP34Cx4b4LknC0GTTky5
         7d/YMbZo3VEtfT3WQK/xchhLG+Hvy1ay6OWZJm5FO8HiC2UZYARLDkDC3pSqylgRJFg5
         fM7osaYaUYd51aIPzPpUYRQpfgKugE1SOraj37X1NfEZo+tKRc2i1BBAblO9W1D2P6S7
         zsDA==
X-Gm-Message-State: AOJu0Yw4UpTJAgbqZbI3UYklI06n2Ab356ZzGIHF20l2wQIS5KrRTsb/
	hHjtctFgw/6IIKORkuiQ9XikPTvtELJ9pzg8cy8=
X-Google-Smtp-Source: 
 AGHT+IEcd7LSxKs1vQhEEohxk1j+l3rrDJD0tdrKzXWF996M/+vrMgyyTbA56OWL+2IlDzI4mvQOvA==
X-Received: by 2002:a05:6512:3b23:b0:500:acf1:b42f with SMTP id
 f35-20020a0565123b2300b00500acf1b42fmr2510533lfv.53.1695939180185;
        Thu, 28 Sep 2023 15:13:00 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 r27-20020ac25a5b000000b005030cef433esm3271964lfn.94.2023.09.28.15.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 15:12:59 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 29 Sep 2023 00:12:57 +0200
Subject: [PATCH v2 4/4] ASoC: rockchip: Drop includes from Rockchip RT5645
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230929-descriptors-asoc-rockchip-v2-4-2d2c0e043aab@linaro.org>
References: <20230929-descriptors-asoc-rockchip-v2-0-2d2c0e043aab@linaro.org>
In-Reply-To: <20230929-descriptors-asoc-rockchip-v2-0-2d2c0e043aab@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: alsa-devel@alsa-project.org, linux-gpio@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: RMAHCUDMFIUB3TGA2QTJFROE4AXX4GDS
X-Message-ID-Hash: RMAHCUDMFIUB3TGA2QTJFROE4AXX4GDS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RMAHCUDMFIUB3TGA2QTJFROE4AXX4GDS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Rockchip RT5645 ASoC driver includes two legacy GPIO
headers but doesn't use symbols from any of them. Delete
the includes.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/rockchip/rockchip_rt5645.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_rt5645.c b/sound/soc/rockchip/rockchip_rt5645.c
index ef9fdf0386cb..7d4d3a0ac5fd 100644
--- a/sound/soc/rockchip/rockchip_rt5645.c
+++ b/sound/soc/rockchip/rockchip_rt5645.c
@@ -8,8 +8,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
 #include <linux/delay.h>
 #include <sound/core.h>
 #include <sound/jack.h>

-- 
2.34.1

