Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03279853DD5
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 22:59:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DB8BEDB;
	Tue, 13 Feb 2024 22:58:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DB8BEDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707861545;
	bh=fG6Q1QiFR6PmovjVj2fEe8hauDiQX9AI9JtszF3W1lk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JZliQblcJJ7Dc+qzGPQRaB6lJP2srOnXSEvgc/c4j/RimOH11CWn1AdPb6EL6nJ9K
	 APbA68d2vaxU5oiQLRW37No5sHdaK63ILXxM8fMJLSD5/1OBYHIqPKTooK6+NdQ9y6
	 YOW1oDJK1QLtfooOot+pGW2RYLscUFWYh0XS2SLg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 709F6F805AB; Tue, 13 Feb 2024 22:58:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 896B4F804CC;
	Tue, 13 Feb 2024 22:58:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBD50F804CC; Tue, 13 Feb 2024 22:58:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 09E3EF800BF
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 22:58:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09E3EF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=SFVMUJBq
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33aea66a31cso2852823f8f.1
        for <alsa-devel@alsa-project.org>;
 Tue, 13 Feb 2024 13:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707861496;
 x=1708466296; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JTFkdUvqDHeua3DO9ZE8KGhtt+pXkN0o9OOhcSIs5kI=;
        b=SFVMUJBqjR+5bblSg8NVTOe74j+XPfunm/jRV6kSNsOQhYsTtUYF0zwIuhiT4yeJcZ
         lnEKURjmYA37ZrhKnXx/VPpSuK+56L69NNFihDQ7QviBGhz+qElac9LQqEmb0mMiLu3y
         du8lvYjklUzPvd+lgAhJ5gZ/LxA3GvDU2cQlHTv/ZzpwJM0QSUivlP0/kjyoHNPlI38S
         Q5QodRb00Yujispurl1R7L5d1nD2adm6THJx8XSHxkKxdQq/HDjsPF7aR03PMfW40M+9
         OLriNdPk5/SH7lqnIhaUDcB6RXZYPPwcS8n6AJjRE5KGh7k87z5UQChTW2G+oJE9qLH9
         FjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707861496; x=1708466296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JTFkdUvqDHeua3DO9ZE8KGhtt+pXkN0o9OOhcSIs5kI=;
        b=ECGai7bnhF4gkHvtcWT6cuDzXS0dC+cxe3eeoEkn4OjSr42yEU2C7ki6uOWQmOz/wm
         BNB4YC9D2MvWxDlq2BkLbs36uSost2WKduu+zE9S/jWsYZ2UkhtAyVkSOv5kktF0wyv+
         X2JxRQykQJ6rk5NFQ6kQC1lvbjzTwPZ5yWowBUPnhx8mjO9YFVlmSTRph6QSYty7DiEk
         564CQozZ7q56cupcyqDAwt5/vUqZd1Bz6ERd3EraI9V7ho8IHDIANvTXuhl0ZLkZSKN4
         e1XUcG7HiWNWWZtDG3hnjpUeHr1sXve5rbgd5sV6+U/xYjx1y9vm2plvtDibSSYd+YWq
         jlDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1kvDgJSLDojJxB+EE7a8+Tc6qBEFeGwMPrxI3vHDoE4vNDA2gk8ONB43pUUSE1D6e1I+U8+fPJnJ8d0m98PufgRC0Re8mn53KPMI=
X-Gm-Message-State: AOJu0YyGfg3lBYoRVSV5Yyu24oA0XjZpfoq3e+cC/TVPkpjmUxem7egQ
	0CVU6kk5iWwFuf3JpVF3pQRY5TTLOqTXNpSjxi1glrSfAbrdE8vpNGtwSiJj/l0=
X-Google-Smtp-Source: 
 AGHT+IEvF9YysnB+h9yQmXedxh2DZ1klO9I/GaHAGPGFJ/xyzrf4xPser0a/xrJw7KqwTxEY1n/K1Q==
X-Received: by 2002:a05:6000:1e84:b0:33c:dec9:a269 with SMTP id
 dd4-20020a0560001e8400b0033cdec9a269mr403220wrb.57.1707861495863;
        Tue, 13 Feb 2024 13:58:15 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUDhr6+e+5qjE0+9Mw4cEpFjAFXBxy7lvahl/dXNLc4oKDO+uMl+AqZFDqC/VhnfJ2IXWUNIqwOxedeeZ+wjrmUZc1Fe2gpVedxuJNN5OlaRbtIaAP4oPoW3QmhRzlxky9J/Ovv/Es2NvK6bzgsP/Tz2sps2oihr/qvKiqyZ5Puv+B1RAWJlXgOguK7mCZFVDtV7zwLXtxQCQjqUPKqv5+cGOqetxhWGEWgpxTM52qr2B+WyDUin1UvGQp45l7cJ4Ke8Q53c4b9lNfJQctutivgKWXGXWKQMnX/AVO73GxFgBsfY7iFPj8RbGDNOqID4sWqOubeVd93IM/Mh0BJ5J6oe9GTFDwiIjZcu1bQwWUY6Yfi9wBaSaiM8gs6eM3zYjxPRzeQ7AwLqQ3iu0FUPuXcfBHtuWVL0yqORytKv6KuGmrqsva+lnxTYKgm54WQtmUuURzwV3QouQiA4wtrTdk3uSf0AptwXWMXM3R/iCUWSJqBDAMf7Mu1BmnvnJdz6t/rDMkViAkdhWAQVIthhnjPAMyFqW4BFbsWCWbJgM9TfxNzdN9tCCAyTJYO8zqP6+2ZX1fda/Wmf1xc0uoCeB4M5wYHHTNAKcEdLnk1cT38hgOq7mc=
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:af6b:4350:776e:dcda])
        by smtp.googlemail.com with ESMTPSA id
 r3-20020adfca83000000b0033cdbe335bcsm2415244wrh.71.2024.02.13.13.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 13:58:15 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 0/2] ASoC: meson: aiu: fix function pointer type mismatch
Date: Tue, 13 Feb 2024 22:58:02 +0100
Message-ID: <20240213215807.3326688-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ISJIJNXPTHSD2HFD5AJXBI5HJYQQRFBZ
X-Message-ID-Hash: ISJIJNXPTHSD2HFD5AJXBI5HJYQQRFBZ
X-MailFrom: jbrunet@baylibre.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ISJIJNXPTHSD2HFD5AJXBI5HJYQQRFBZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patchset fixes 2 -Wcast-function-type-strict warning in amlogic
audio drivers with clang 16.

Changes since v1: [0]
* use devm_clk_get_enabled() instead of adding a dedicated helper in each
  driver.
* Split the patch, 1 per fixed commit to make it easier for stable.

[0]: https://lore.kernel.org/lkml/20240213101220.459641-1-arnd@kernel.org/

Jerome Brunet (2):
  ASoC: meson: aiu: fix function pointer type mismatch
  ASoC: meson: t9015: fix function pointer type mismatch

 sound/soc/meson/aiu.c   | 19 ++++---------------
 sound/soc/meson/aiu.h   |  1 -
 sound/soc/meson/t9015.c | 20 ++++----------------
 3 files changed, 8 insertions(+), 32 deletions(-)

-- 
2.43.0

