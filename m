Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 565AE7227F9
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 15:56:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CCCB847;
	Mon,  5 Jun 2023 15:55:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CCCB847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685973371;
	bh=TsvcyukdSS1lKPeAFb0MO21Iif9mAo0wy8+BZHk6XCA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HKaleOHFhPGz5s3hj/ylwyseR/u81t+8dlwyP2SbaJbQZphOGx8ZVxb5P1bsGoffB
	 BMO2xr6IzKfnjo1MCrR6G2tRKW+KMlzr2hbsOylzudtKrX4E+L3pAu+YdLlWDNGLPL
	 3WyQ1uZxMV7fM2QkkY9/+pLGNhos7RYSQiWXEXik=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B5E7F80551; Mon,  5 Jun 2023 15:54:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9A20F80527;
	Mon,  5 Jun 2023 15:54:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B3BFF80199; Sun,  4 Jun 2023 17:54:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DED52F80155
	for <alsa-devel@alsa-project.org>; Sun,  4 Jun 2023 17:54:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DED52F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=r9RnHmU6
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9700219be87so610653466b.1
        for <alsa-devel@alsa-project.org>;
 Sun, 04 Jun 2023 08:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685894070; x=1688486070;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TsvcyukdSS1lKPeAFb0MO21Iif9mAo0wy8+BZHk6XCA=;
        b=r9RnHmU6Pa0FtsM/qHVFqFiCYlBYyvtIkLeKoNPRIk8smrMsqYFJGWCQjT7VU72eDe
         BlragftM9BcqClhhfhrjXu+KMSBuqSe+KNwPFU0KBNJlL713GE9o6QJnGFo2MVVjPP+P
         tQT4bqbQqIIjRH39Ls+d3YC1mLwWHW3tHKnUmfhzbMfPeeq5TIZAMtwSAuYi3ZYPbltW
         zBx3Pm7HZhbXZBrcB4iAF+MkhkDQusDxPerLMNjJ9M9evb0iQB/WGEScO2q3pwVkwkGJ
         xiks1hYnTowy+2gYSWDJ+qp4ig7OfRGINcmiTLnuJchPscxcbqDF/ro1Gt8cNoeiUHiy
         SK0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685894070; x=1688486070;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TsvcyukdSS1lKPeAFb0MO21Iif9mAo0wy8+BZHk6XCA=;
        b=aoBPpGoMjwtfy2M2uprIiNuvjdVpXyzAZMPQji5IinPqvJf9z74iECed+DjhlZhNG9
         krpkqbV/d37Ab7vdMhMot8duvXfGu2MYWdUC+YzAiPjt1vPAITy1x9ousoAHFL6rhbV+
         9RNVS+qH9KsrrBVqxKfZIXstOaPWxpDejq56lxir3Elm1YzWKsw1gK6RyNRmovE4wjC8
         CBxltuoLu0jqj8xtwwYPlVcmve46fS5YfWL/1cKke7h6migI1T+Z7rnOpOmJXlJpyVmf
         eG0shZL0DygdbK4oCSRIJs+cf5nycrJqeUEXOgV3vHBYN5Ff2nEGN7wfaG4AKUq4/Wy8
         fa3Q==
X-Gm-Message-State: AC+VfDzcdVDeb89o+xjlHaCutzHSIaG+XBEZEY47gbmrmOzfu+gXllGw
	1OevZN7EW+eLqjL0Ea4GXso=
X-Google-Smtp-Source: 
 ACHHUZ6AHXuZcLeVYAiKN3Lakw7/5eyPw2g9gXmYKU2Z87ULJVZcNauonQPfi8yZtMpFNZvTXucpWg==
X-Received: by 2002:a17:907:6d08:b0:974:5e2c:8721 with SMTP id
 sa8-20020a1709076d0800b009745e2c8721mr4687955ejc.38.1685894070095;
        Sun, 04 Jun 2023 08:54:30 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8629:800:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id
 h21-20020a170906111500b00974530bd213sm3241020eja.143.2023.06.04.08.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 08:54:29 -0700 (PDT)
Message-ID: <1492a131cd474c47e2a2b14defd46284f695b0ef.camel@gmail.com>
Subject: Re: [PATCH v1 00/43] ep93xx device tree conversion
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>, Arnd Bergmann
 <arnd@arndb.de>,  Linus Walleij <linus.walleij@linaro.org>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Christophe Kerello <christophe.kerello@foss.st.com>, Conor Dooley
 <conor.dooley@microchip.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Florian Fainelli
 <f.fainelli@gmail.com>, Hartley Sweeten <hsweeten@visionengravers.com>,
 Heiko Stuebner <heiko@sntech.de>, Hitomi Hasegawa
 <hasegawa-hitomi@fujitsu.com>, Jean Delvare <jdelvare@suse.de>, Joel
 Stanley <joel@jms.id.au>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Jonathan =?ISO-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>,  Le Moal <dlemoal@kernel.org>,
 Liang Yang <liang.yang@amlogic.com>, Mark Brown <broonie@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Nathan Chancellor <nathan@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Richard Weinberger
 <richard@nod.at>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, Walker
 Chen <walker.chen@starfivetech.com>, Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Michael Peters <mpeters@embeddedTS.com>, Kris Bahnsen
 <kris@embeddedTS.com>,  alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org,  dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org,  linux-watchdog@vger.kernel.org,
 netdev@vger.kernel.org
Date: Sun, 04 Jun 2023 17:54:27 +0200
In-Reply-To: <20230601053546.9574-1-nikita.shubin@maquefel.me>
References: <20230601053546.9574-1-nikita.shubin@maquefel.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.2 
MIME-Version: 1.0
X-MailFrom: alexander.sverdlin@gmail.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: IT4EMFGMZRA2L7E5EYS7FUGQAUPJGST7
X-Message-ID-Hash: IT4EMFGMZRA2L7E5EYS7FUGQAUPJGST7
X-Mailman-Approved-At: Mon, 05 Jun 2023 13:54:33 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IT4EMFGMZRA2L7E5EYS7FUGQAUPJGST7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Nikita,

On Thu, 2023-06-01 at 08:33 +0300, Nikita Shubin wrote:
> This series aims to convert ep93xx from platform to full device tree supp=
ort.
>=20
> Alexander, Kris - there are some significant changes in clk and pinctrl s=
o can i ask you to tests all once again.

I have quickly tested network and sound on EDB9302 and I neither have probl=
ems with
these functions, nor did I spot any new error messages, overall looks good =
to me,
thanks for your efforts!

--=20
Alexander Sverdlin.

