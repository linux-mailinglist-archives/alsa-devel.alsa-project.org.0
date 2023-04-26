Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DF06F2EDA
	for <lists+alsa-devel@lfdr.de>; Mon,  1 May 2023 08:45:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E263A17A7;
	Mon,  1 May 2023 08:44:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E263A17A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682923549;
	bh=PeyZTvE2qao9z3HUKls5t/zNMEefQNyhwIh3dGLQJIU=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ef11AudiY+VpKqofhMZEGfCSX+kU3plBlZP3VZslYNeycUNpAYMyDiD0BwtJxlE3/
	 cneCVzeyO7cMh7ReWpS034W5BDj1G3i/aM5wK7HzOpXYlmR0TUjUyGnpe6o0lWBqLu
	 cF9FwrQ2DSrnL3JAN3oSd2TRLutOD3IC7JXKsRKI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53815F805BE;
	Mon,  1 May 2023 08:40:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 729D1F80236; Wed, 26 Apr 2023 22:57:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 416EDF800AC
	for <alsa-devel@alsa-project.org>; Wed, 26 Apr 2023 22:57:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 416EDF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=S7XPiZYL
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-54f9e41dfa7so59597057b3.3
        for <alsa-devel@alsa-project.org>;
 Wed, 26 Apr 2023 13:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682542626; x=1685134626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PeyZTvE2qao9z3HUKls5t/zNMEefQNyhwIh3dGLQJIU=;
        b=S7XPiZYLMIoR7xsU/wXB5RDbPa2jeVL9HKShuDxQCbIPu/HZMjrE5vuCAGbMYlqazO
         y1LcAZt8Gr0//F1/TONPb1gUmNEYmGar/QoKFxFOncs74sFIH4TslUdsOtZh1zsnR/5h
         MjAn8Vq7g4CP0HpEd+sApnPMI1MyyUkMtXAAht9vPhKX8jqYxTOmpwj2OF8/mdce/PhM
         iJxCYgIAr2Xu32JtwJiVOXgSXyyR2zndz91oOwLfA+13RmpqY0isHhbzK5vwXYWnIi2Q
         F/FsDok/XXYk+LPpnN440+QMQf1+yR7o5g0KsgEDw2LXStnLVy4hkb5Ez/bEknfUnKs+
         H0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682542626; x=1685134626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PeyZTvE2qao9z3HUKls5t/zNMEefQNyhwIh3dGLQJIU=;
        b=laW4JIPgLD19WxV65E8v/hN8wLwSDOb3d9S56LftJjuajW0rNYkyA2nPCmeo7l/Yvc
         lGG+j7mAhvMHLjwHZrD7+b3HzQBQpar3Yb/3X+UdYPku5vjHdNDQnwPb6oZraIjxTdzN
         3K4GSyUPUtDZkmFejbs1231PAbOpNBb6TFJT7cdTDnEiwIvt5U0oEy87lgTPWS8ndJwf
         FozvuyO3bHjOMWP+8jnk/hJPbx68SSwa1I2aoz8sYhsONcJzQ7ajPpLKHzD0p0YkHKEB
         8CgXhzGx3yx2AuSHhwa4d4/Zs1PbmBFX4nCzJf+67IdHQdrYgktcRcIMe53rX9jJy8zL
         F5og==
X-Gm-Message-State: AAQBX9c4pPjvNopSh38TxIwaVRtPAPVuWy4TDHBW2ST8zEGWqVwvkM17
	9zdA8U62JyN0YUB4TqOUw8VpBYi+z7A1oIGkiWs72g==
X-Google-Smtp-Source: 
 AKy350ajEJHyhyynqyOl0isjddMpiNdULElT/xAxUEM8cmGuE9kOk2QPH86dypmLR0gOJToVISGwrFvJLTDtak1EsDI=
X-Received: by 2002:a0d:ea0d:0:b0:552:a2e2:684e with SMTP id
 t13-20020a0dea0d000000b00552a2e2684emr13680157ywe.52.1682542625695; Wed, 26
 Apr 2023 13:57:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230424123522.18302-1-nikita.shubin@maquefel.me>
In-Reply-To: <20230424123522.18302-1-nikita.shubin@maquefel.me>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Apr 2023 22:56:53 +0200
Message-ID: 
 <CACRpkdarANFQ7-p=-Pi_iuk6L=PfSLDsD3_w4dEVqarwXkEGMQ@mail.gmail.com>
Subject: Re: [PATCH 00/43] ep93xx device tree conversion
To: Nikita Shubin <nikita.shubin@maquefel.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: linus.walleij@linaro.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: 23X4UJWVJAKFAUETHUBFQOTRUZJ7MBCF
X-Message-ID-Hash: 23X4UJWVJAKFAUETHUBFQOTRUZJ7MBCF
X-Mailman-Approved-At: Mon, 01 May 2023 06:40:39 +0000
CC: Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Brian Norris <briannorris@chromium.org>, Chuanhong Guo <gch981213@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Damien Le Moal <dlemoal@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
 Jakub Kicinski <kuba@kernel.org>, Jean Delvare <jdelvare@suse.de>,
 Joel Stanley <joel@jms.id.au>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Le Moal <damien.lemoal@opensource.wdc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Liang Yang <liang.yang@amlogic.com>,
 Lukasz Majewski <lukma@denx.de>, Lv Ruyi <lv.ruyi@zte.com.cn>,
 Mark Brown <broonie@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Olof Johansson <olof@lixom.net>,
 Paolo Abeni <pabeni@redhat.com>, Qin Jian <qinjian@cqplus1.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Russell King <linux@armlinux.org.uk>, Sebastian Reichel <sre@kernel.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Stephen Boyd <sboyd@kernel.org>,
 Sumanth Korikkar <sumanthk@linux.ibm.com>, Sven Peter <sven@svenpeter.dev>,
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vasily Gorbik <gor@linux.ibm.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Walker Chen <walker.chen@starfivetech.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-watchdog@vger.kernel.org, netdev@vger.kernel.org, soc@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/23X4UJWVJAKFAUETHUBFQOTRUZJ7MBCF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Apr 24, 2023 at 11:35=E2=80=AFAM Nikita Shubin
<nikita.shubin@maquefel.me> wrote:

> This series aims to convert ep93xx from platform to full device tree supp=
ort.
>
> Tested on ts7250 64 RAM/128 MiB Nand flash, edb9302.

Neat, I'd say let's merge this for 6.5 once the final rough edges are
off. The DT bindings should be easy to fix.

This is a big patch set and the improvement to the ARM kernel it
brings is great, so I am a bit worried about over-review stalling the
merged. If there start to be nitpicky comments I would prefer that
we merge it and let minor comments and "nice-to-haves" be
addressed in-tree during the development cycle.

I encourage you to use b4 to manage the patch series if you
have time to learn it, it could help you:
https://people.kernel.org/monsieuricon/sending-a-kernel-patch-with-b4-part-=
1

Yours,
Linus Walleij
