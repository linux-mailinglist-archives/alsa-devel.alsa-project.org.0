Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C5619C62E
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Apr 2020 17:44:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12D371671;
	Thu,  2 Apr 2020 17:43:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12D371671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585842246;
	bh=qQIlBAbDHbEuQ/+jAJk/dU9QjLEp9zeyEM3zw/6pW04=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=utUEcDiWp56HGCJ05Pp6LtSNNazYccCVwG4w/BhCZJwVMxKgDKDk52vWmaRYDfjCr
	 FN72MOM4eGtflJCxW/IIZ8YYkKEpJ1uGRUI48CFDzzAfganrwFGGwBQoHrxDCtb0IL
	 G/JkFt8XEFUIpRZxA7IBPazqHCCkD4B5+LGrBjqo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01B21F802E0;
	Thu,  2 Apr 2020 17:37:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AFFEF80146; Thu,  2 Apr 2020 13:05:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 870B1F80140
 for <alsa-devel@alsa-project.org>; Thu,  2 Apr 2020 13:05:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 870B1F80140
Received: from mail-qt1-f176.google.com ([209.85.160.176]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MplLZ-1iyhrU0DdN-00qDoJ for <alsa-devel@alsa-project.org>; Thu, 02 Apr
 2020 13:05:01 +0200
Received: by mail-qt1-f176.google.com with SMTP id i3so2808336qtv.8
 for <alsa-devel@alsa-project.org>; Thu, 02 Apr 2020 04:05:00 -0700 (PDT)
X-Gm-Message-State: AGi0Pubmn/Go+DmXisUJ1hO/OLLepaPWUfv7jH6hFNj74zHnTOuYBm2T
 J/m0ix0k9LRtxHhrbuJmwTxmsr12keUCDcuHI+0=
X-Google-Smtp-Source: APiQypJsUlmA/o2DdIvGggdD9+ibIYF6moE63pjwvb5CKhqtgTpUSWQDa2hc05O2VxKKurX3JMWriCkgA7smRY8JaYo=
X-Received: by 2002:ac8:7292:: with SMTP id v18mr2220674qto.304.1585825499828; 
 Thu, 02 Apr 2020 04:04:59 -0700 (PDT)
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
 <CAK8P3a34Tw+bH9bCBQ9HeDo4m4RE67fNOyL8cfUf-i09ur8seg@mail.gmail.com>
In-Reply-To: <CAK8P3a34Tw+bH9bCBQ9HeDo4m4RE67fNOyL8cfUf-i09ur8seg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 2 Apr 2020 13:04:42 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2FJ+Pr_FfetWfJkWv8Z2BGuAmwr7DtoyrkmoHfpFgQVg@mail.gmail.com>
Message-ID: <CAK8P3a2FJ+Pr_FfetWfJkWv8Z2BGuAmwr7DtoyrkmoHfpFgQVg@mail.gmail.com>
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Segher Boessenkool <segher@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6yV1NyU4AAIJ1CT52soAbRaLnzx74yblQeXFh4Cg5ueeYD/aTaV
 4CbalvXuKZZLZxGzEHi1iOccLQFKCwAFzDR7sfSCkqbkPzLQC3ew36PkzrrwbRfZiLIuabn
 NqcgKsp/KXpMxmnI+qTH3qcdF3BYt4mjFGwzLIOnMwt/UugKH0Q/6RdVTuxBMVyylppXXP7
 XXCoZuvMvskoaCpktBgzQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OJihJbYU6bw=:H3Xm3Erfanj1Awwdf38adk
 XLsAgwq+nYy96cEdrfkqqrB8uT/yTBgjaH/L0kgO5iwgiCJ81Yd2TawhHIZLZq4xw+JMHt7Lu
 fnzhIH6BUrjp9JWTZIyiESIze+Ooxlh3+jMOG3UhE62MJjS6OH+LpllZOGcD4q3BbtTrORdrr
 hd+WkEPt4e8EtmG0zfzDgUZdc4ucGmk2iYrx5ux/hbUrqLb+6mFkEYyHHsopb1KnvAYkdZYQO
 3T8YUK+9qcLJ5t7aH7pej/tHK/cCASJ6DZUkJGRYk6p11YLZESVaO+9JyxDhFQ22AxJJRCZe5
 Saq1KODORnWxytGVPFSWiqt9nlTKYLPH6050T0zOHi0Zfh/oVYhzwQ2n7aHqNa+DU+UfeCSCl
 LNiyiq5n7f2GTJlWnMuWlajFUMoQOXECD/f3zT2Cxi8aQCn97FVeZ0crKWC2YmYuPuZF4EV1c
 y1jPY67lgQctrEOPPexZV/4C4WUIbPYMMAQCjqjEgF2PO6SSszNHzd4nLvS2AK3WpSrh3u8c/
 OSMwPkJmBMaPjVO+O6dp7lYojyoBJmbKGn4I30baQvrJcNE2eWFs/ZQWCFzHhKnk6mI2smbPR
 Wb+J182l10nJjbYqJJPdXmGnLR9gKWDj7Ozk+LKxNOC5QN7e+TR9qofT9Ek+yxZrrS6klOduQ
 FSwbOMuo8Al5lABrJHLbcytOZ2hPws4Ujo+BS+WCJr8vX739YxhCJlIq19/4CBQ2YgeLEXi/Z
 Fb2JRA0NeegiQa/oJCoEABPuIWe67JgmmjoK0KCYNBPdxEUTxPNVVVX0jFqrIlsJrGucumeyr
 sLJQlwCqHIn20XXLmzxuMuF7VWqak1AsKBVSgfJLeDR/pBPxyk=
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

On Wed, Apr 1, 2020 at 11:07 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Mar 31, 2020 at 7:51 PM Segher Boessenkool
> <segher@kernel.crashing.org> wrote:
> >
> > On Tue, Mar 31, 2020 at 08:56:23AM +0200, Christophe Leroy wrote:
> > > While we are at it, can we also remove the 601 ? This one is also ful=
l
> > > of workarounds and diverges a bit from other 6xx.
> > >
> > > I'm unable to find its end of life date, but it was on the market in
> > > 1994, so I guess it must be outdated by more than 10-15 yr old now ?
> >
> > There probably are still some people running Linux on 601 powermacs.
>
> It could be marked as "BROKEN" for a year to find out for sure ;-)
>
> Apparently there were only two or three models that are old enough to
> have a 601 and new enough to run Linux with PCI and OF: 7200/8200
> and 7500. These were sold for less than 18 months around 1996,
> though one can still find them on eBay.

A. Wilcox said on IRC regarding 601 support in Ad=C3=A9lie Linux:

"right now we are primarily targeting G3, though 603 should be supported.
601/601e support is planned to be added for 2.0 (next year)."

      Arnd
