Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8076F19C62A
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Apr 2020 17:43:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 321161672;
	Thu,  2 Apr 2020 17:42:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 321161672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585842187;
	bh=VPMcgIBZw/qZ9qiugBiPTif6XCiVXeHsRZR7cPsGp94=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bc4f9+WP1OvGL6lo3J/pFkFvahDXI/C1zkP5aSJlz0mnEwQGpdeQu/ig/0a/JDssx
	 7YlzZo10fftugMfP0SDOXmlTyVs2XRe0hOZTA4pJ79UKUVjTEqrsAlSNPSW+R0qVZ7
	 5uTIcoVrYmY7wSWrPUdPhUWfxohGe4KsaKzDVLqk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DEAB6F802D2;
	Thu,  2 Apr 2020 17:37:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92919F8014A; Wed,  1 Apr 2020 23:07:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9AC48F80110
 for <alsa-devel@alsa-project.org>; Wed,  1 Apr 2020 23:07:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AC48F80110
Received: from mail-qk1-f173.google.com ([209.85.222.173]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MybX9-1j7c553sfl-00yzhM for <alsa-devel@alsa-project.org>; Wed, 01 Apr
 2020 23:07:35 +0200
Received: by mail-qk1-f173.google.com with SMTP id u4so1611659qkj.13
 for <alsa-devel@alsa-project.org>; Wed, 01 Apr 2020 14:07:34 -0700 (PDT)
X-Gm-Message-State: AGi0Pub/UGJjcZO9kUUAngzMD5WXxxhvzW3n7s06cCQLdlfhg8emivz0
 L1wuf69BM6AEFoZ8FP12IzBpDvBHw4d8PLE/2Ss=
X-Google-Smtp-Source: APiQypK2VxbgsBQWN5zZRldfRvjgPaI6APWLNh/n01B0qErpj4ZP7Mfk8XFNqdw3+ssCzEIWikyHqTkJEucg147IwkM=
X-Received: by 2002:a37:d85:: with SMTP id 127mr236136qkn.3.1585775253692;
 Wed, 01 Apr 2020 14:07:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585311091.git.michal.simek@xilinx.com>
 <CAK8P3a2mKPRFbRE3MWScr9GSiL4cpLg0wqv1Q28XDCZVPWgHfg@mail.gmail.com>
 <20200327131026.GT1922688@smile.fi.intel.com>
 <20200327131531.GU1922688@smile.fi.intel.com>
 <CAK8P3a1Z+ZPTDzgAjdz0a7d85R62BhUqkdEWgrwXh-OnYe6rog@mail.gmail.com>
 <20200327141434.GA1922688@smile.fi.intel.com>
 <b5adcc7a-9d10-d75f-50e3-9c150a7b4989@c-s.fr>
 <87mu7xum41.fsf@mpe.ellerman.id.au>
 <11765c82-bf1a-466c-760d-f9a4c4d1d5f1@c-s.fr>
 <20200331175123.GV22482@gate.crashing.org>
In-Reply-To: <20200331175123.GV22482@gate.crashing.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 1 Apr 2020 23:07:16 +0200
X-Gmail-Original-Message-ID: <CAK8P3a34Tw+bH9bCBQ9HeDo4m4RE67fNOyL8cfUf-i09ur8seg@mail.gmail.com>
Message-ID: <CAK8P3a34Tw+bH9bCBQ9HeDo4m4RE67fNOyL8cfUf-i09ur8seg@mail.gmail.com>
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Segher Boessenkool <segher@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Zv8caBl1SIag0tB7l7NIYAMY9wFregkBv091MxLvhjpY3gq7J2b
 icVuv5HGIrFPmnw7to8glalz2bLqz9rnFDJomI+TASPYjrdCz1GRJdh1lHF1D6uRZSjkvtv
 aT9fHiA8RjBpeBk3I0JcPOxk+nKkJ1wJcINE8Z8WIL4Cz7m2m1caLFmAIzUY2VMpDWw9GNk
 p0HuMYXTnmi4/VxGxQabw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BwC8uR/wSXQ=:5+yGOIwer1dr6cRVIZQy3x
 UxJCS35/u64Wa29MCCMC+LElKBakajfIV0ZwbKgPMRTUpCELvCbtDIEM0xc8PFuDHqsEYzg1S
 HT8K17otJR1j7Uw6O7qEqMYAXMa6qalntci1xTmrJ2N7UuEHgqzXH7gFwj0N2MfM+/di97cz8
 iOOfY6nNXjXaV0VO29DRzPxbGQQNNT9p1SXz/WuAlUB5bDQSMIkdbhQEW6Q/9ZVFq8UD7rVxS
 A1d4b88hA56/PaT91tRh4I7pLOHLRfPwYKkeCF3E5dsnKHr7qUplp2dDQAbHRGSyOdpTCbH9t
 Q+7Sdz4lOCj2PoJlw+bV8pTDOSzLar/Eb+YtjFaeoCdF2W7Fl/V0qq/lek8DtDpf5u8Na2pg2
 8qynRKu35Hw3qEFp4ANpenN4x55kosxlCFDdiXF2pYivu6e7TVoc3kLx7mWHpU5pOnkQQV5ps
 zQlynV2qoewYQkJpnbSn1Tqglm+wMalttZy/qN9eHvvzV/432Qjuy65VcTuHezpobSUEWT5f2
 tehTsp4U+Nc+NOJvGR2VV4FjES5AmPEl3ZdpFLePe5JGaXIHB+eUvR4VxJ0+CKnRoxO6MBAgg
 erlXIAeoh0MB8HzQuTfyoxag5YyyCUfyXL0FzPMcIRNN4rU+7noqhUZeDjM7fEB4GkUJqyUhi
 e2hnLTyxDYStmVZZeUyKdG33Nu2aCBrAZCgT7P2gON7m6gEorQYQmTDdoT0/+l3rd9wEpxX12
 7jGbLmFLw/UNIhsn8cEr6JjRJSnAToMUyrQzMyk4bqj5Qj6oGwPKBhGh3NP3WPy2agVwavbnE
 OuWGkV2MJqbv7OpWqLYWVPCV056/Nra1zVX7k13FWasWaswbjo=
X-Mailman-Approved-At: Thu, 02 Apr 2020 17:37:21 +0200
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Richard Fontana <rfontana@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Sasha Levin <sashal@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Jonathan Corbet <corbet@lwn.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada <masahiroy@kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Michal Simek <michal.simek@xilinx.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Allison Randal <allison@lohutok.net>,
 Leonardo Bras <leonardo@linux.ibm.com>, DTML <devicetree@vger.kernel.org>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Marc Zyngier <marc.zyngier@arm.com>, Alistair Popple <alistair@popple.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mark Brown <broonie@kernel.org>, git@xilinx.com,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Enrico Weigelt <info@metux.net>,
 Michal Simek <monstr@monstr.eu>, Wei Hu <weh@microsoft.com>,
 Christian Lamparter <chunkeey@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Armijn Hemel <armijn@tjaldur.nl>, Rob Herring <robh+dt@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
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

On Tue, Mar 31, 2020 at 7:51 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Tue, Mar 31, 2020 at 08:56:23AM +0200, Christophe Leroy wrote:
> > While we are at it, can we also remove the 601 ? This one is also full
> > of workarounds and diverges a bit from other 6xx.
> >
> > I'm unable to find its end of life date, but it was on the market in
> > 1994, so I guess it must be outdated by more than 10-15 yr old now ?
>
> There probably are still some people running Linux on 601 powermacs.

It could be marked as "BROKEN" for a year to find out for sure ;-)

Apparently there were only two or three models that are old enough to
have a 601 and new enough to run Linux with PCI and OF: 7200/8200
and 7500. These were sold for less than 18 months around 1996,
though one can still find them on eBay.

           Arnd
