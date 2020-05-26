Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E38061A23DD
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Apr 2020 16:16:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 866B116B3;
	Wed,  8 Apr 2020 16:15:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 866B116B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586355366;
	bh=6sGJZKVDnng9zkVvNLQaMC2QdaABiEArzNpdTqX8bmw=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N+Eiu7uUD+hps3ebjmFwiPpQgX7RSSKh3L2j/dW5jCjuEsU+Iguqeb1jHEYId/y5l
	 LyGQtJW87KxS/MkOnpOGN5sUuLQHcELbfVj95peoSmqrOyUH3205gNvGZ9truZSakl
	 R5z9ZDIH7oYcfmiJxPf0KNT8NJ2adstUKpcblkzE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BBAEF80291;
	Wed,  8 Apr 2020 16:12:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F3E7F80143; Wed,  8 Apr 2020 14:04:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62BEFF80105
 for <alsa-devel@alsa-project.org>; Wed,  8 Apr 2020 14:04:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62BEFF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="WgCLIiUS"
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48y2xf5jGrz9sRN;
 Wed,  8 Apr 2020 22:04:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1586347456;
 bh=6sGJZKVDnng9zkVvNLQaMC2QdaABiEArzNpdTqX8bmw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=WgCLIiUSpuBsBXqCPlZzidFYcoWAD1ZBafu6SLBHzZHI+KFxAv7gNGzohVSd3+CkZ
 IjvhKsP9osZnu3lCySdAybzilsNS5UuZVHP2nBng/RcjGp+I2iwlz3bGKgwdxSLfan
 RhhMHnZOWMh674CxamV9uQKAeJdSdBbIl7K9JR/0ZDotvPVrPq5/wwFcEiEoh3mmdU
 sR8oL6kx73gdZYGqcrQsBBazPSQJXlHsc69IbBSwlLt7NNI9qV7j1a3MoYAgnxAUdL
 oc/KwIMFjt+mCgfa7YMzF6zDhbuaisEd4kaeid/FO/VP19aJRTr51+VjFj5KwmoJ9p
 vxLrPhfdg8W9w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
In-Reply-To: <5782f9a42ad8acd8b234fa9c15a09db93552dc6b.camel@kernel.crashing.org>
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
Date: Wed, 08 Apr 2020 22:04:17 +1000
Message-ID: <871roykwu6.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Wed, 08 Apr 2020 16:12:43 +0200
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, "open
 list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
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
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 Michal Simek <monstr@monstr.eu>, Wei Hu <weh@microsoft.com>,
 Christian Lamparter <chunkeey@gmail.com>,
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

Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:
> On Fri, 2020-04-03 at 15:59 +1100, Michael Ellerman wrote:
>> Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:
>> > On Tue, 2020-03-31 at 16:30 +1100, Michael Ellerman wrote:
>> > > I have no attachment to 40x, and I'd certainly be happy to have
>> > > less
>> > > code in the tree, we struggle to keep even the modern platforms
>> > > well
>> > > maintained.
>> > > 
>> > > At the same time I don't want to render anyone's hardware
>> > > obsolete
>> > > unnecessarily. But if there's really no one using 40x then we
>> > > should
>> > > remove it, it could well be broken already.
>> > > 
>> > > So I guess post a series to do the removal and we'll see if
>> > > anyone
>> > > speaks up.
>> > 
>> > We shouldn't remove 40x completely. Just remove the Xilinx 405
>> > stuff.
>> 
>> Congratulations on becoming the 40x maintainer!
>
> Didn't I give you my last 40x system ? :-)

Probably, but my desk is nearly as messy as yours so it's probably
buried under some even more obscure hardware :P

> IBM still put 40x cores inside POWER chips no ?

Oh yeah that's true. I guess most folks don't know that, or that they
run RHEL on them.

cheers
