Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C85BE1CA5
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 15:32:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 916171671;
	Wed, 23 Oct 2019 15:31:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 916171671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571837526;
	bh=MXM9H8qi8RJa8phygtH0eY5fhxhtIp+ssbaD14XDrEU=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WkwSZ391cIxhICfhG9pRiEbCABit84HR8p4tDWsr5bd+jBktfQXWtD9oEIHAlMxdb
	 XwUirBriuwv6Azeoc9Gdb5x7WzUZU+Fm5D5+tJaQiEC8Ihczxvy9Svm8QGJifU1UFl
	 XJDKanvjzdTO7LgB1Q8gqM/BlNT98XSp1gnqr/+Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A386CF805E2;
	Wed, 23 Oct 2019 15:30:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F1CFF803D7; Wed, 23 Oct 2019 15:30:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D16C0F80393
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 15:29:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D16C0F80393
Received: from mail-qk1-f175.google.com ([209.85.222.175]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MN4ux-1igATI1p25-00J15m for <alsa-devel@alsa-project.org>; Wed, 23 Oct
 2019 15:29:57 +0200
Received: by mail-qk1-f175.google.com with SMTP id u22so19696883qkk.11
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 06:29:57 -0700 (PDT)
X-Gm-Message-State: APjAAAXnqeV7vYwfoR4NiN3jWQOVhr6QNDYq75K6bQiskqExxVafibJ2
 nmg2SWZgdlsc1VmmG54/p18Q8HcNuMgVPeQKzq0=
X-Google-Smtp-Source: APXvYqzGCvORTP+HJikmS9n+sLPhWUfQgJCCEYKmJ03DZvSC0gT0L7hZhZ7lqgzmTpFpBJ2WhE68gjxgaObVawX07k4=
X-Received: by 2002:a37:a50f:: with SMTP id o15mr7091533qke.3.1571837396079;
 Wed, 23 Oct 2019 06:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <20191010202802.1132272-1-arnd@arndb.de>
 <20191010203043.1241612-1-arnd@arndb.de>
 <20191010203043.1241612-21-arnd@arndb.de> <20191023125053.GF11048@pi3>
In-Reply-To: <20191023125053.GF11048@pi3>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 23 Oct 2019 15:29:40 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3x1_eB4GT7qvhgVnq-sU8a=wkSf4FP18p7pVHmtrfWFA@mail.gmail.com>
Message-ID: <CAK8P3a3x1_eB4GT7qvhgVnq-sU8a=wkSf4FP18p7pVHmtrfWFA@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:dzPyK+rMRYEmzyjc4Yg7MkOu5ZYhWHLRlGVVp4ekcfNiaj9kOw2
 8lkWW7qJGqwgtfhQYUcnBQc7WS1cekAZzpNcQ7E1TTglzlTjwQKED/hBxdSkJkFgX8cQrMb
 qQ7ATDIKWKAKUgZdgl1BOn3yVp1bx5liPqqK5P0OXv3GqKzWnyBWHf0Z1i0GnUygpCiZYde
 mr/sRnua5PzPxT83nwsYA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LOAoViBu40E=:PLT0rAEkyCoLegmPw6fmq5
 pc9LNYgAfSqDqweHuU6T7RGacPYfibOpzc7KZgPthe2atIrubZPXW+YTMOMw37xVsymcbtHeD
 NuJCIylMX1dAjidToga9Ms8I0rJqD6CRrC/jiJoDN+1aXyBznplDT5NrMmCb2XjVmIkiKGkvR
 ZIvaNOx8Yo2JKLvWDMaC9IsIOh6k8iHaj5mTAYhzMcvui/5czkJrFBIsHvOgN64DWzo1Xm7cE
 J1fEoU6tdwieOPLSBEdN8m5d9wTckrIxKPm0O7Olvog5Y4ngNfrmxsJxPIE0ocAhzN/n0MBhH
 3N7K0WOsEJdMwzNg7Nc3PbwyIRuawCAYJa1J5eFZzuZTISaihBe0WW7yjlWltxOLT0qUsfO1p
 L6GevaUPG36FG37+kjHIEHHebp27yOyK3PwgLHvJDUos3B+Tk6jPKhX0evYdSTWE5nBYrQLOg
 n4u+33cu5aLjYv+ftC5DpX6RaRHY2Jvx8VAu2ZBCPiGtqqlB2SwPpCSHI674Ipr7H8Sv3Z8nz
 9fFnhNeNz+YwmRFpcy27I/PJr6hr+QJa+v2oFjJcN7inR4y0JU+92rUOZNS2xQF0WPWGiQvT5
 v4A0dCtitsNi+JnxZIpBbCSfYJoObCcdt/ikc+kiR4ShosRtCLW2CuOy5nOXMMv2/aVIVv2kT
 8AkR48rANSRuCNobIAX8sMavMjMrQOuPDr19+RcQlyrm8X4i1/aokbz+9DZUQ9pyJ4JIqQ3Ra
 lk0iYjqEaRFGCD7aoibvc6NXy8sUSg16AWy3o23WarisvX3ZbFL/gXQoy4eunwj/7oYhippbz
 o0ukMM3KCeld57eln9W79hFe+4TwzE3TPpdRdvAv6SnE2scINz9rCRRXIfJWV4d2KOR/KdHTA
 WJjer4AERjxtwctHlJhQ==
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Sangbeom Kim <sbkim73@samsung.com>, Linus Walleij <linus.walleij@linaro.org>,
 Takashi Iwai <tiwai@suse.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH 21/36] ARM: s3c: move iis pinctrl config
	into boards
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Oct 23, 2019 at 2:51 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Thu, Oct 10, 2019 at 10:30:05PM +0200, Arnd Bergmann wrote:
> > The s3c_gpio_cfgall_range() function is an internal interface of
> > the samsung gpio driver and should not be called directly by drivers,
> > so move the iis pin initialization into the boards.
> >
> > Note that the s3c2412-i2s driver has no boards using it in
> > mainline linux, the driver gets selected for the jive machine
> > but is never instantiated.

> This is not entirely equivalent move as before this was probe (so being
> executed also on rebinds) and now it is init. I guess it should not make
> any difference so let it be.

Right, I've added an explanation in the changelog text now:

 The s3c_gpio_cfgall_range() function is an internal interface of the
 samsung gpio driver and should not be called directly by drivers, so
 move the iis pin initialization into the boards.

+This means the pin configuration is only run once at early boot, rather
+than each time the driver binds, but the effect should be the same.

        Arnd
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
