Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC83E08B3
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 18:22:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 590061616;
	Tue, 22 Oct 2019 18:21:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 590061616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571761369;
	bh=GZ9vjVyl8yyIl6l+opVmemuKPfMnL8sDS7V0fnVHNw8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vsUJoBw/LtD9rTlBeNiTVAZsefmsbmXmx3kEpWo/dvI2B3RzNzCV4QE56k4MeX2B6
	 h84vOwZATfpxGwCECUyhMHMOkQx6JjAQ8pOyp1Ti6lo9O0Oug/IS/nTeynW62oazm+
	 uusEYtzn8SbfueW2EuB0l0brRLZj/QwalEiZXRr0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3117F8031A;
	Tue, 22 Oct 2019 18:21:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AD67F8031A; Tue, 22 Oct 2019 18:21:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 620E0F800C0
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 18:20:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 620E0F800C0
Received: from mail-qt1-f173.google.com ([209.85.160.173]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M1HmG-1iKC0n0Aeo-002pHc for <alsa-devel@alsa-project.org>; Tue, 22 Oct
 2019 18:20:59 +0200
Received: by mail-qt1-f173.google.com with SMTP id w14so27592502qto.9
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 09:20:58 -0700 (PDT)
X-Gm-Message-State: APjAAAV7JniUzDlvgD5Kucu5EK8zUvMl4cReX9yw/z6zwDPvwcr9RhJX
 qRBz2Ndo+yP5pYq++L3WjooPhlMV4X9oieceyVE=
X-Google-Smtp-Source: APXvYqyoLKHktNxYMbHgU6oEzWDucDHxX3DzLUXc70BjhpXFB5K+Mcs4VGMIh8ghBPfcQzJ4zkTEBWIuMQ3o+13CFPs=
X-Received: by 2002:ac8:33d4:: with SMTP id d20mr4201539qtb.204.1571761258010; 
 Tue, 22 Oct 2019 09:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <20191010202802.1132272-1-arnd@arndb.de>
 <20191010203043.1241612-1-arnd@arndb.de>
 <20191010203043.1241612-11-arnd@arndb.de>
 <20191011055149.4dudr4tk2znpt65u@pengutronix.de>
 <CAK8P3a1st8gR7u+8-oyP6HrzZdmrzhq7PRonYuz0a5O8rfKaSA@mail.gmail.com>
 <20191022155307.izh4ryorm7thw7tq@pengutronix.de>
In-Reply-To: <20191022155307.izh4ryorm7thw7tq@pengutronix.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 22 Oct 2019 18:20:41 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1mvbss6Q-CQBYRAf7ozYgyOu3WFGkoaSaoJriUbuRACA@mail.gmail.com>
Message-ID: <CAK8P3a1mvbss6Q-CQBYRAf7ozYgyOu3WFGkoaSaoJriUbuRACA@mail.gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
X-Provags-ID: V03:K1:XRmaTAvEUlbg09c7dSw0mCW8LzGvL+fxDcc74wdQkSkRXr810vP
 GpkOi5r25w2Dm4DO6OsyYrOJ8a3AJxDORGy/zbbYX1D6VA2Q5JfgiekXHMmuN0bLfSI+0pO
 zhLhWjmp7BiDgaHdH51DF8N7dwbTjqLq78249LoT5FN17/hKDIKoBzk+YYxSkW+Va2hDZEA
 DYN9QFFp+z6TpIkbcHpWw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3zk/ENLgG6k=:fiO3wXqmAqgsXjX7LXkmk1
 AkHXvAJuJFGIW8/RogvLgnpr5gkKCJWzKYSKAvkTrIbM0w3hM/JBbqplxY+VFSWMft7hGX4x6
 iZ5s38/fprmztsxnjVUqu2cb6N9QG8oQzQ5wglhLKvy/nc9ee7++FxOuKvPT+FaaDR0eby/Bc
 /1/YWL9Px/78qBgGPg7kHnKGfS09+osnE7t4p5c/rw1Rv2oE6SVkcir3H0E+fCCKfKGjb83qM
 RRivu2G6XwEfwrtqPY5dlZUnhnRTbLbPyRwVwJ+xahygsMczYbEjaDYJcUk6sjqk3qIkN4KuT
 UfJ5kF5mfOdSjL0ZPvatBQ5bwCVski9fW8x4g8Zn+5ErtGVVnyq/LhOvwy+ANJsgwU/RV+xXy
 IZqdtU5PGUZCdQO7BWWoeVdGmD/nK0ugK/fhTER09LzMkpv03g7+OiqkFlke7NwaVyLtQ5hx6
 SPgCr9RyoAkzJDu0VWUD9xH01S2drOR2v43SmOrtqgg3sMG5IbGZucff8XD6abmeQkzwEIcgn
 ypSVLTOxdBB9Y6Sw5ydFCb7FRErjoB1LXo/+W7dDELowHDcbmdrTcOfOgbFz7+248zjFw4EdN
 Nxx4JbVsPtzwGIRBzkbuBtwJxge6w/xjmk9hGKTCzmK7pGcIgXQDQ2SajuGmnnwyIyOUh4Leb
 g/a+rZQLdtvhFhy6WJr3uSSBYFvujmYU+EIN1ZZr8KLKVIvReE7mqjQXPOfKsSMHuKR1Hnmac
 qR9H1bLWvAbiM/fIv+r2Rbte5YT/Iwux9x8HK7E4y698RJ4IvvfvWlATBXdh6hX9EA2Q7kIrg
 SP/nD17GnmClD4we+ICNJPY4b+ckH2fhhwQYZJAc8e6X4kFQG1J2//a/oz0R0tCw0eqLdSVU4
 gQsH/7e9owmq1ZARmDUQ==
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kukjin Kim <kgene@kernel.org>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 Linux PWM List <linux-pwm@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Sangbeom Kim <sbkim73@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 linux-spi <linux-spi@vger.kernel.org>, Faiz Abbas <faiz_abbas@ti.com>,
 Olof Johansson <olof@lixom.net>
Subject: Re: [alsa-devel] [PATCH 11/36] ARM: s5pv210: split from plat-samsung
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgNTo1MyBQTSBVd2UgS2xlaW5lLUvDtm5pZwo8dS5rbGVp
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPiBUaGUgYmFja2dyb3VuZCBvZiBteSBx
dWVzdGlvbiB3YXMgbWUgd29uZGVyaW5nIGlmIGJ1aWxkcwo+IGZvciBQTEFUX1MzQzI0WFg9eSAo
YmVmb3JlIHlvdXIgcGF0Y2ggc2VyaWVzKSBkb24ndCBuZWVkIHBsYXQtc2Ftc3VuZy4KCldoYXQg
SSBmb3VuZCBpcyB0aGF0IHRoZSBEVC1iYXNlZCBwbGF0Zm9ybXMgKGV4eW5vcyBhbmQgczVwKSBu
ZWVkIGFsbW9zdCBub3RoaW5nCmZyb20gcGxhdC1zYW1zdW5nLCB3aGlsZSB0aGUgYm9hcmQgZmls
ZXMgYW5kIHRoZSBzM2MyNHh4L3MzYzY0eHggcG93ZXIKbWFuYWdlbWVudApuZWVkcyBhbG1vc3Qg
YWxsIG9mIGl0LgoKICAgICAgQXJuZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJv
amVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbHNhLWRldmVsCg==
