Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E1B196BC8
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Mar 2020 10:01:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B5921679;
	Sun, 29 Mar 2020 10:00:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B5921679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585468901;
	bh=UwQG7cvQMdM5Umv9fqkFmGMz6+LtWkYgOhLkvTAHHes=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hGHSh4v0UdwtVe1LAYudnFiEItvHeHrMUbdhUvLoh74rBfBdyckNi+05hkMLXoRKv
	 pl1efqurPkzv5Qe3wQq3iPvP//Y0YcpVG729hh4AOlgP9GCayIGmgNi0tT8m2NosiU
	 Wyl7gEg1KAJXYrc+lEl6DxPY3mpX+400xH3nnd1c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27AF7F802E8;
	Sun, 29 Mar 2020 09:54:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AFE0F80292; Fri, 27 Mar 2020 14:23:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=PRX_BODY_30,PRX_BODY_65,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 167FAF80290
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 14:23:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 167FAF80290
Received: from mail-io1-f45.google.com ([209.85.166.45]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MBDrM-1j6DqW3oZ4-00CemH for <alsa-devel@alsa-project.org>; Fri, 27 Mar
 2020 14:23:15 +0100
Received: by mail-io1-f45.google.com with SMTP id k9so9790369iov.7
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 06:23:14 -0700 (PDT)
X-Gm-Message-State: ANhLgQ1hC3MEXQwNwACMQL7AWg5YJdd6ik1QMiQQbdZ4e3NZFnDAHBtU
 5ia8A5Fhbml48uJwTcsfu+wk8adSW1KKa9HFpTE=
X-Google-Smtp-Source: ADFU+vulNA+7BxZ8KynFjYc9GnYqAH2MuhhxSGrAnAMTyGPWxL6I9KWAa8nLPHSfN4FBnPkXk6FuMsvBVm3MWAXJwGU=
X-Received: by 2002:a37:6455:: with SMTP id y82mr14033725qkb.286.1585315392272; 
 Fri, 27 Mar 2020 06:23:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585311091.git.michal.simek@xilinx.com>
 <CAK8P3a2mKPRFbRE3MWScr9GSiL4cpLg0wqv1Q28XDCZVPWgHfg@mail.gmail.com>
 <20200327131026.GT1922688@smile.fi.intel.com>
 <20200327131531.GU1922688@smile.fi.intel.com>
In-Reply-To: <20200327131531.GU1922688@smile.fi.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 27 Mar 2020 14:22:55 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1Z+ZPTDzgAjdz0a7d85R62BhUqkdEWgrwXh-OnYe6rog@mail.gmail.com>
Message-ID: <CAK8P3a1Z+ZPTDzgAjdz0a7d85R62BhUqkdEWgrwXh-OnYe6rog@mail.gmail.com>
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:EQrKGgxlQby1X2j8sB689SZoFhMV8uRF9LMpYHoYJlmcMPZ0fjd
 PfL7jh/C8zFEdRYRqmNIDKtJbGcNI0XniRKYQFfN4tD9epo0+wKmOg/0JfNR1ZPs8fybf8L
 q0YW+IwGm/dJ7leFjBc2cF4YUvplOtdOEQ/lB5jABh8AFA4ClyaHraIbpMErJuk+IJLHo04
 T7ODJ5RTYbJXQ75n5uDQg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7QHxLA/8jUo=:4r6/jKhVwN0cJzIBD1m+Pt
 aSTKX/RKa7ob0RUFxIiZuPozpAwDV7ahfOTEzuTm9mA+MFLc0g5NQ/u9CN0dRm9QKAz8Ti62v
 nF9aFE9qS15KKKZMfOcmajqfUhz3rSTjBRAn5AbcQ6HPLHkHqwFO1qGf6vQvh6ddm/ANnYQsg
 2lWemMzRCt9FbXeFzQRJK/gR1mbM7Pj790pYeEbgf2B1kfK2xkLTYZENIpd1Wmbn0TRB68/BA
 8VZg/iz9+sa2gwKegmgNFh0DB7Gu5xgjbJDzzDVbUXvhtp9DBI013/QIJXPXZkPVDr1Kqywbl
 fif4+fy8Arnq7Ib4XMlLAplYoxCtpSulWptRzyR6Cw+LOXzobnAAiv9IStfygA/NdQvdhZyVu
 ZbOBQ0+sOK4j9r8nCX6GkComgiawMfo0TnCY72VIUmtdo2lGMwLmK+t4mNYMz+3G2yAfr7wKe
 xUhG4R4uznFrIr9U2wp0QvPtd0nVmRfUHSXN16oxq8NoQBaqHXOyNDL7FWKCZyTBVvs/o2CdJ
 A7jN0lxOg8WYGz4ZH3bJqbPhKn1sdpdkAe/sJl2UPCXbzSn04HPugrpqFkcK0edkd/6TWFCPz
 5ybEPlnpfByS+I2Zyvh0pjbFgvw/JG5gf0K1G02B9bR38fwjFTcqv+Z7HtwEjvpfCgosN002z
 i9+xumm3OqvhwK3EcuTRr5pf/VEKZAtvlTOccI0g46lvBllp9CexcPjyMB2gk7SKaa0MUvj7N
 jZkx1TwtBByLIE3agF5Z4J7HjfrdXHtGQntOnSdFHeX6bwEa2nj6Eq2y0cNVSjhTC/rHhGRVU
 JWXS6mmvfeSAG3KFQKwl2R3JuTiegabkWk4mmO0AZX0G0p3Zhg=
X-Mailman-Approved-At: Sun, 29 Mar 2020 09:54:17 +0200
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
 Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada <masahiroy@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 Michal Simek <michal.simek@xilinx.com>, Krzysztof Kozlowski <krzk@kernel.org>,
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
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
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

On Fri, Mar 27, 2020 at 2:15 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Fri, Mar 27, 2020 at 03:10:26PM +0200, Andy Shevchenko wrote:
> > On Fri, Mar 27, 2020 at 01:54:33PM +0100, Arnd Bergmann wrote:
> > > On Fri, Mar 27, 2020 at 1:12 PM Michal Simek <michal.simek@xilinx.com> wrote:
> > > >
> > > > recently we wanted to update xilinx intc driver and we found that function
> > > > which we wanted to remove is still wired by ancient Xilinx PowerPC
> > > > platforms. Here is the thread about it.
> > > > https://lore.kernel.org/linux-next/48d3232d-0f1d-42ea-3109-f44bbabfa2e8@xilinx.com/
> > > >
> > > > I have been talking about it internally and there is no interest in these
> > > > platforms and it is also orphan for quite a long time. None is really
> > > > running/testing these platforms regularly that's why I think it makes sense
> > > > to remove them also with drivers which are specific to this platform.
> > > >
> > > > U-Boot support was removed in 2017 without anybody complain about it
> > > > https://github.com/Xilinx/u-boot-xlnx/commit/98f705c9cefdfdba62c069821bbba10273a0a8ed
> > > >
> > > > Based on current ppc/next.
> > > >
> > > > If anyone has any objection about it, please let me know.
> > >
> > > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > >
> > > This looks reasonable to me as well, in particular as the code only
> > > supports the two
> > > ppc44x virtex developer boards and no commercial products.
> > >
> > > It does raise a follow-up question about ppc40x though: is it time to
> > > retire all of it?
> >
> > Who knows?
> >
> > I have in possession nice WD My Book Live, based on this architecture, and I
> > won't it gone from modern kernel support. OTOH I understand that amount of real
> > users not too big.
>
> +Cc: Christian Lamparter, whom I owe for that WD box.

According to https://openwrt.org/toh/wd/mybooklive, that one is based on
APM82181/ppc464, so it is about several generations newer than what I
asked about (ppc40x).

> > Ah, and I have Amiga board, but that one is being used only for testing, so,
> > I don't care much.

I think there are a couple of ppc440 based Amiga boards, but again, not 405
to my knowledge.

      Arnd
