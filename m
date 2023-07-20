Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DB075C246
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:58:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E32DEBB;
	Fri, 21 Jul 2023 10:57:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E32DEBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689929912;
	bh=/+O/muW1Nk3sbzumyk3oSyUNsgXn5aAFedNJT9XhjpY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i5fS7RNw+18ndvTdEIXq/wH+umSTldNKmd9x1J3YQeu0DLd/ZfMQWt1d4O0Iu4RcE
	 x1uglF6gD5NE9AWAduqJQe4C3sAU6n9Yy2RfU72CuO/+WWVKsDvQKzQ4q/ncwNrQPR
	 xVZF/2TzHLFynkQm/n0MB+CGGdMNK0Q+VL8G10jA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67231F80558; Fri, 21 Jul 2023 10:54:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B302F80619;
	Fri, 21 Jul 2023 10:54:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51A9EF8047D; Thu, 20 Jul 2023 16:51:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com
 [IPv6:2607:f8b0:4864:20::a36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5DD86F8027B
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 16:51:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DD86F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bgdev-pl.20221208.gappssmtp.com
 header.i=@bgdev-pl.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=qHklILRY
Received: by mail-vk1-xa36.google.com with SMTP id
 71dfb90a1353d-481389cd087so311960e0c.2
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Jul 2023 07:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689864679;
 x=1690469479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+O/muW1Nk3sbzumyk3oSyUNsgXn5aAFedNJT9XhjpY=;
        b=qHklILRYK8e+9ECBbaFZ7M9L25U5jR9UnSBshRGFdRVHmqpzNlXreFLJxybGBGyMLA
         JjOIhtWXcXsFXDkQWzdryG/qS0K+qMEB1GG285OY5nANiF5bBiiZqSfRjpAq4JN3qO/G
         VE1wh3ub6GNTxKYli8B9etbv3Syi4YaZAm8ewJzKDcudPtWv+mpGQnUWLOEpUyVi77HA
         L1nzjHd9LR1jd0d99mpisIGonQLildHSrZJKuMS/WToklyjf8Qvdn/zjfWDpMZSAG7cZ
         /maT4QCA9HKlmwzmuyLH+08Sr6TprdvFrIAJ1FYorUt4VLFQyyL7VA770EhWjclKTvfj
         KjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689864679; x=1690469479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/+O/muW1Nk3sbzumyk3oSyUNsgXn5aAFedNJT9XhjpY=;
        b=Gi+TAdj/Jv+2wLWOgmRJqm6l4vcHJLyYMBY3F7h4mBvFYdY/nXbuDfwvdr/6Sf0hwD
         zec80nvUmUGiBFqw4r5NSKesfk7Ls92d0+Vn0rMPDMk03dQ3l8MMIWPgD33py5Qlgj05
         Whfbtnm0oepbDlA6szvGOR4eCjs3UmY3nPSE3LYqVeb80LieFp0gdPQTlbLxcquunhiX
         bCj6tVoA3S+FTmlEJofhYXjuOMlC/lKaNElfWhFCVZrYhYsHJLJo7vwi4f1334Y/6ll4
         bxqH+28oXBXpPyx5Y3qhdOuNtxwj0hxCFKS+aplnIm+GvsEra985BT4/BEYo9HRUOvQJ
         SQog==
X-Gm-Message-State: ABy/qLbmyJ5uwMsRpc7/1EbTo/I1tGMV+vJqhAwg5hfzYkVO64YpM3+B
	y09kns8ESKEpcCSDZVGTS49GHSi8i4uuJ2ScvUuFwg==
X-Google-Smtp-Source: 
 APBJJlHzLfxkreBCbbsehsgY/9oCLGFmqhlHHCGSC7psLizhDkF/J99lwZeHjlYsqKv5zg/EMj03GOKDYYgPtq4NGEY=
X-Received: by 2002:a1f:3d44:0:b0:481:4092:99c with SMTP id
 k65-20020a1f3d44000000b004814092099cmr2773384vka.0.1689864676288; Thu, 20 Jul
 2023 07:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
 <20230605-ep93xx-v3-1-3d63a5f1103e@maquefel.me>
In-Reply-To: <20230605-ep93xx-v3-1-3d63a5f1103e@maquefel.me>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Jul 2023 16:51:05 +0200
Message-ID: 
 <CAMRc=MeXCLzwjPEap_OD7tA+xVsMOU1DNxMbxbZVPaWg4Xdr8w@mail.gmail.com>
Subject: Re: [PATCH v3 01/42] gpio: ep93xx: split device in multiple
To: nikita.shubin@maquefel.me
Cc: Hartley Sweeten <hsweeten@visionengravers.com>,
 Lennert Buytenhek <kernel@wantstofly.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
	Lukasz Majewski <lukma@denx.de>, Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
	Sebastian Reichel <sre@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Mark Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Damien Le Moal <dlemoal@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	Andy Shevchenko <andy@kernel.org>, Michael Peters <mpeters@embeddedts.com>,
	Kris Bahnsen <kris@embeddedts.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-spi@vger.kernel.org, netdev@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
	linux-input@vger.kernel.org, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: brgl@bgdev.pl
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: CJTGQEZW4RYYWG5EADKSAH2FKX3OR4SW
X-Message-ID-Hash: CJTGQEZW4RYYWG5EADKSAH2FKX3OR4SW
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:54:07 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CJTGQEZW4RYYWG5EADKSAH2FKX3OR4SW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jul 20, 2023 at 10:29=E2=80=AFAM Nikita Shubin via B4 Relay
<devnull+nikita.shubin.maquefel.me@kernel.org> wrote:
>
> From: Nikita Shubin <nikita.shubin@maquefel.me>
>
> This prepares ep93xx SOC gpio to convert into device tree driver:
> - dropped banks and legacy defines
> - split AB IRQ and make it shared
>
> We are relying on IRQ number information A, B ports have single shared
> IRQ, while F port have dedicated IRQ for each line.
>
> Also we had to split single ep93xx platform_device into multiple, one
> for each port, without this we can't do a full working transition from
> legacy platform code into device tree capable. All GPIO_LOOKUP were
> change to match new chip namings.
>
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
