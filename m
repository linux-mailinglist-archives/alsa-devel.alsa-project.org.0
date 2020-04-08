Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A101A23D8
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Apr 2020 16:15:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49CA41691;
	Wed,  8 Apr 2020 16:14:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49CA41691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586355311;
	bh=vVmeARIL9t4m60auqXqiLtb+4l3Cg1q6PiHqSsCOcNI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fEKZLbEE5caGWakMzwDTJ6Cnc/tHmSejw4obWkB1ibBKRNH7ouEIik9bpzJcPernP
	 HjgV6FCRl6tGOrqlN0e6wxtqufBuc7QTVxkOPZL2l/40T3sCVgkXrSV9u3CTAoSPdo
	 00OEe+BZfPKui8Ky5p7iW6oAvjSdmk9D7jek3l8w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 415ABF8015D;
	Wed,  8 Apr 2020 16:12:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69F18F80143; Wed,  8 Apr 2020 08:29:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87D20F80105
 for <alsa-devel@alsa-project.org>; Wed,  8 Apr 2020 08:29:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87D20F80105
Received: by mail-oi1-f195.google.com with SMTP id l22so3754267oii.12
 for <alsa-devel@alsa-project.org>; Tue, 07 Apr 2020 23:29:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BZyxSe1F9CEekbeEkcnl4DCUrszNmMjMax7bRV4fmFk=;
 b=RPJmBxW/IB4Nu8UrcSHXdN+Ko/ml/6KPwISSMvThu0gUs0iV6YIcwB9l95lAjTmkcb
 Z1G0g9J+PO+MrjPw5uSs2nokwKAdAoTGB75o0Z1HtcfW5MPYhGczZoMMOuCNfJjO+4SR
 azw9OGDuAtwiH0vqX8H8XbTA2XFusUaHvnqTKxBrHL1AcDeizwmUfZzoAtYyE8dhhPZB
 Uja/L1yVrYJJq1a1upb8M8YhdPvTW46tscJ56uLCumtrdyBqoOCJ8qjJL0qfhtcxa6AA
 pyX/lw6APJAcTTlGNYk02J8OKvksv0sM8ZeYawrBJmHaHdCECejlLInIwBR6PB+hjk39
 qTTg==
X-Gm-Message-State: AGi0PuYcNkBR5xfy6y7Y9t+7UsIsPTWBgwLtxVM72PDBxCaKlV3CbQs9
 LroNrxDV845jDQfb56EtGBk1n9Q2xYAi/8jfACU=
X-Google-Smtp-Source: APiQypL2H0+76KoauaUo4b9NNZhymcHNW+vj4EBMTBKwnkZS2xjRBEdU1EaFq/Qm0sL2SKQ6wSNTquXtK4QZ4u2dRx0=
X-Received: by 2002:aca:ac09:: with SMTP id v9mr497636oie.148.1586327345628;
 Tue, 07 Apr 2020 23:29:05 -0700 (PDT)
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
In-Reply-To: <5782f9a42ad8acd8b234fa9c15a09db93552dc6b.camel@kernel.crashing.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2020 08:28:54 +0200
Message-ID: <CAMuHMdUkwy8GkXrud2EjUvu8nWn=y=RDXk3b6YK0=NMkPWgVEg@mail.gmail.com>
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 08 Apr 2020 16:12:43 +0200
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Mark Rutland <mark.rutland@arm.com>,
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
 Takashi Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 Michal Simek <michal.simek@xilinx.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Leonardo Bras <leonardo@linux.ibm.com>,
 Matt Porter <mporter@kernel.crashing.org>, DTML <devicetree@vger.kernel.org>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
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

Hi Ben,

On Wed, Apr 8, 2020 at 1:34 AM Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> On Fri, 2020-04-03 at 15:59 +1100, Michael Ellerman wrote:
> > Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:
> > > On Tue, 2020-03-31 at 16:30 +1100, Michael Ellerman wrote:
> > > > I have no attachment to 40x, and I'd certainly be happy to have
> > > > less
> > > > code in the tree, we struggle to keep even the modern platforms
> > > > well
> > > > maintained.
> > > >
> > > > At the same time I don't want to render anyone's hardware
> > > > obsolete
> > > > unnecessarily. But if there's really no one using 40x then we
> > > > should
> > > > remove it, it could well be broken already.
> > > >
> > > > So I guess post a series to do the removal and we'll see if
> > > > anyone
> > > > speaks up.
> > >
> > > We shouldn't remove 40x completely. Just remove the Xilinx 405
> > > stuff.
> >
> > Congratulations on becoming the 40x maintainer!
>
> Didn't I give you my last 40x system ? :-) IBM still put 40x cores
> inside POWER chips no ?

Good to know!

Are they still big-endian, or have they been corrupted by the LE frenzy,
too? ;)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
