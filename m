Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 738DD1A23E0
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Apr 2020 16:16:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 188A3168B;
	Wed,  8 Apr 2020 16:16:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 188A3168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586355412;
	bh=L9bDeuINkbwt+1gDKXab4B6F1vKLDZzULirYwJ62tYc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CHnAyOQ5x8iJXg0khIHogitNyMMzNYvsCDGscsC7Ok3VMrSuMRb9Uc/xQ6RBy3jaR
	 6diSoCdaxe880aCFt6K5oXpqEkj3j133uGSZUS/dNNPyvMfXr76KSuAub94rowE5Zz
	 aIPTbuO51iwPfCRPu4y2R9IsDz+dngG6jPXpoW04=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E477F8029B;
	Wed,  8 Apr 2020 16:12:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF274F80143; Wed,  8 Apr 2020 15:23:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2252AF8011B
 for <alsa-devel@alsa-project.org>; Wed,  8 Apr 2020 15:23:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2252AF8011B
Received: from mail-qt1-f173.google.com ([209.85.160.173]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MOm9H-1jf4hk3uhj-00QFig for <alsa-devel@alsa-project.org>; Wed, 08 Apr
 2020 15:23:28 +0200
Received: by mail-qt1-f173.google.com with SMTP id m33so5525748qtb.3
 for <alsa-devel@alsa-project.org>; Wed, 08 Apr 2020 06:23:27 -0700 (PDT)
X-Gm-Message-State: AGi0PubjlQURLoivH7EOlnzbPqmjFd+NPEZuczwGcy2/YNnx4hdENyvK
 hGfNfmYh6FAAPX0RZaYFzdgYxOkPPQwH11L52Gg=
X-Google-Smtp-Source: APiQypIZqfyiKAf9iZweRfXbeG68flo58OpjYYdhdvQ5GWYcHF1GFWr0NIasaAFWu9U3CGPPywhiTEL6NA5dmjZoqSM=
X-Received: by 2002:a37:2714:: with SMTP id n20mr7421082qkn.138.1586352205739; 
 Wed, 08 Apr 2020 06:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585311091.git.michal.simek@xilinx.com>
 <CAK8P3a2mKPRFbRE3MWScr9GSiL4cpLg0wqv1Q28XDCZVPWgHfg@mail.gmail.com>
 <20200327131026.GT1922688@smile.fi.intel.com>
 <20200327131531.GU1922688@smile.fi.intel.com>
 <CAK8P3a1Z+ZPTDzgAjdz0a7d85R62BhUqkdEWgrwXh-OnYe6rog@mail.gmail.com>
 <20200327141434.GA1922688@smile.fi.intel.com>
 <b5adcc7a-9d10-d75f-50e3-9c150a7b4989@c-s.fr>
 <87mu7xum41.fsf@mpe.ellerman.id.au>
 <bac9af641140cf6df04e3532589a11c2f3bccd2f.camel@kernel.crashing.org>
 <87pncprwp9.fsf@mpe.ellerman.id.au>
 <5782f9a42ad8acd8b234fa9c15a09db93552dc6b.camel@kernel.crashing.org>
 <871roykwu6.fsf@mpe.ellerman.id.au>
In-Reply-To: <871roykwu6.fsf@mpe.ellerman.id.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 8 Apr 2020 15:23:09 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1XmeeP7FKfNwXZO8cXyJ_U_Jr0kjOaGZ6F=7OcoZ+0nw@mail.gmail.com>
Message-ID: <CAK8P3a1XmeeP7FKfNwXZO8cXyJ_U_Jr0kjOaGZ6F=7OcoZ+0nw@mail.gmail.com>
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:9eoE+M+8ze7wDHesVTObMWtFV5R8nICje0vq/0BE+SIi51UaoBn
 mvQQtiIswWKJECXN5dlgEhPoxalz37p2jzNUo7knSYyVoipJC6OUpEJiT1jzJ+zHcSytMYC
 JKgbmkxJCIX3wUT0sddjLZBoP7IqxcNOwZmxAB+jdQ0QceZU8g4qbqhn653IOtv8KcFD7UJ
 egeWFkPwbso/SNokySWgw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wu9Kq/x3vqY=:Ov92D41+LsKISG7/+losYo
 nKPQsk5cXvN+vpx1r+b/wXwa6KyFsXQQY46YRJqRMN2mihTvveHTPt5Oct3qDFEEdozYsEwzg
 u2JroQnSEuJmMAc7iP3QAmkxt4yEtfts6Ujc144r+cn4sj265+7+vAMWArz3W7mBgKSGW7F08
 xyZ+snephTUqscA+H1RbD9jdgTjBioI7BDGsBSd6IToD4cFxM8hkhVH3VKnP5bd051FLUEbqj
 Iz6dxwXpWWPocm/GItWxJnU+sl1jVa9EalqE96rg5dTpH5YXSOYC3tOd4hz5reAK9KcoJ1rV/
 84bc9BbqHYaS1Aj9QBgBlxZEnli0ydv6SVSF5efV4nnW+xURTg04+SIdBoN2Ca6/1zT/p9sSn
 /3Gyiv5TC/GjqCUgCR0DZfhF+rGsLzOHy/KxnGInzvv2hVyePXiqNQWnM1FoOB+nQEa7ug3PV
 YlL1QcxeYlNNXrDwef2sn1tp8K1qQV/X+RF4EmObU7YqvXHLiPgdYUqLMfwrLcqB7sXZGBNJY
 4oAmcA8Wyoi76CYSNP1V1opAegV+URwofqdzk6wya2sYx/KGN9Tdo5oDRLZsFTVwETf7ZGoM8
 CPueiA7Ns/InU3YFXzWUdY2qybBS1yjmqm3Kpn8VMfnqEaSdeK3cAeJ16dJa7JTqO8JxFAS6I
 pBcUDRBPm/Y1H5WQhRKeY1sVwKEP6mQDUesmf2fDhKk2a2MTtqBwk//MTIW0srzCey55N4Rac
 +vHBkUT0Aac7tZw3go6LPAMKgobj74vsHkILgJ8y9wyTWzVLp5MkhWADc47r0sMYzuxnY5bNq
 8IdT0+MCY8pPLOEnIRDaE8kGSg2wzwqVEF3HJYEGI4tzhbol1E=
X-Mailman-Approved-At: Wed, 08 Apr 2020 16:12:43 +0200
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Richard Fontana <rfontana@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Sasha Levin <sashal@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Jonathan Corbet <corbet@lwn.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, Michal Simek <michal.simek@xilinx.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Leonardo Bras <leonardo@linux.ibm.com>,
 Matt Porter <mporter@kernel.crashing.org>, DTML <devicetree@vger.kernel.org>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Marc Zyngier <marc.zyngier@arm.com>, Alistair Popple <alistair@popple.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mark Brown <broonie@kernel.org>, git@xilinx.com,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Allison Randal <allison@lohutok.net>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Michal Simek <monstr@monstr.eu>,
 Wei Hu <weh@microsoft.com>, Christian Lamparter <chunkeey@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Armijn Hemel <armijn@tjaldur.nl>, Rob Herring <robh+dt@kernel.org>,
 Enrico Weigelt <info@metux.net>, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

+On Wed, Apr 8, 2020 at 2:04 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
> Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:
> > On Fri, 2020-04-03 at 15:59 +1100, Michael Ellerman wrote:
> >> Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:
> > IBM still put 40x cores inside POWER chips no ?
>
> Oh yeah that's true. I guess most folks don't know that, or that they
> run RHEL on them.

Is there a reason for not having those dts files in mainline then?
If nothing else, it would document what machines are still being
used with future kernels.

Also, if that's the only 405 based product that is still relevant with
a 5.7+ kernel, it may be useful to know at which point they
move to a 476 core and stop updating kernels on the old ones.

          Arnd
