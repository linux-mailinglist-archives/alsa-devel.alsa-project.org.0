Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E21C198CE5
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 09:25:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A77491607;
	Tue, 31 Mar 2020 09:24:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A77491607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585639546;
	bh=wBZTBGwXUKd1W8rXBvklBLNI6VWNJG7y8+GiwKSfwyw=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cH9Qk2mNhA3JQHTZsNpM+zOcSrXjE+HMF8KGo4mX8kQVAAhyAEnNH4NDpJvY02PoE
	 O/h//g8YLKCOOrNS08sxVeBxUwBgm0QlcH6UBS+xZmMrL/K003XtV9LH6tnsm8YaeG
	 4l8pjKWc9B0KxHT0gOoH9+tjvulm0bMA/vIfgbcs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CC2BF80254;
	Tue, 31 Mar 2020 09:23:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5680EF80140; Tue, 31 Mar 2020 07:31:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70BB3F800AA
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 07:31:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70BB3F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="OXuI0kpZ"
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48rybT5bWHz9sQt;
 Tue, 31 Mar 2020 16:30:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1585632657;
 bh=wBZTBGwXUKd1W8rXBvklBLNI6VWNJG7y8+GiwKSfwyw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=OXuI0kpZye/5Qq3R/+8SAFSe9LUM7PwBmIdxrYytUIHSuRxmANIxjUadBh+6TrUAG
 0/scSdRqozxwIvGpx5YAoqaas6zyYNu1ofRUtDLL9xankqQA8NRoSKsovNe2d8T2ox
 EE+pYrp5vhw+njgE6sz4hE0xSoG5qd1kM70abPp0iLw+8xrK7rbT+X72WYJkdznwIR
 vylvZwmwhjEsCOYWDAkyokOTl5I0EDHTpAOQtvrJic+I553FsdUe6lUqqhTTKeOKtJ
 bEGAgXICIQ9Dnq442VWtcXsV5MEBEXK6DSfOfoTC1imS12aITD0LH3toDAD0wzjxgU
 0uub9n396MWgw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
In-Reply-To: <b5adcc7a-9d10-d75f-50e3-9c150a7b4989@c-s.fr>
References: <cover.1585311091.git.michal.simek@xilinx.com>
 <CAK8P3a2mKPRFbRE3MWScr9GSiL4cpLg0wqv1Q28XDCZVPWgHfg@mail.gmail.com>
 <20200327131026.GT1922688@smile.fi.intel.com>
 <20200327131531.GU1922688@smile.fi.intel.com>
 <CAK8P3a1Z+ZPTDzgAjdz0a7d85R62BhUqkdEWgrwXh-OnYe6rog@mail.gmail.com>
 <20200327141434.GA1922688@smile.fi.intel.com>
 <b5adcc7a-9d10-d75f-50e3-9c150a7b4989@c-s.fr>
Date: Tue, 31 Mar 2020 16:30:54 +1100
Message-ID: <87mu7xum41.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 31 Mar 2020 09:23:19 +0200
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, "open
 list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
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

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> Le 27/03/2020 =C3=A0 15:14, Andy Shevchenko a =C3=A9crit=C2=A0:
>> On Fri, Mar 27, 2020 at 02:22:55PM +0100, Arnd Bergmann wrote:
>>> On Fri, Mar 27, 2020 at 2:15 PM Andy Shevchenko
>>> <andriy.shevchenko@linux.intel.com> wrote:
>>>> On Fri, Mar 27, 2020 at 03:10:26PM +0200, Andy Shevchenko wrote:
>>>>> On Fri, Mar 27, 2020 at 01:54:33PM +0100, Arnd Bergmann wrote:
>>>>>> On Fri, Mar 27, 2020 at 1:12 PM Michal Simek <michal.simek@xilinx.co=
m> wrote:
>> ...
>>=20
>>>>>> It does raise a follow-up question about ppc40x though: is it time to
>>>>>> retire all of it?
>>>>>
>>>>> Who knows?
>>>>>
>>>>> I have in possession nice WD My Book Live, based on this architecture=
, and I
>>>>> won't it gone from modern kernel support. OTOH I understand that amou=
nt of real
>>>>> users not too big.
>>>>
>>>> +Cc: Christian Lamparter, whom I owe for that WD box.
>>>
>>> According to https://openwrt.org/toh/wd/mybooklive, that one is based on
>>> APM82181/ppc464, so it is about several generations newer than what I
>>> asked about (ppc40x).
>>>
>>>>> Ah, and I have Amiga board, but that one is being used only for testi=
ng, so,
>>>>> I don't care much.
>>>
>>> I think there are a couple of ppc440 based Amiga boards, but again, not=
 405
>>> to my knowledge.
>>=20
>> Ah, you are right. No objections from ppc40x removal!
>
> Removing 40x would help cleaning things a bit. For instance 40x is the=20
> last platform still having PTE_ATOMIC_UPDATES. So if we can remove 40x=20
> we can get rid of PTE_ATOMIC_UPDATES completely.
>
> If no one objects, I can prepare a series to drop support for 40x=20
> completely.
>
> Michael, any thought ?

I have no attachment to 40x, and I'd certainly be happy to have less
code in the tree, we struggle to keep even the modern platforms well
maintained.

At the same time I don't want to render anyone's hardware obsolete
unnecessarily. But if there's really no one using 40x then we should
remove it, it could well be broken already.

So I guess post a series to do the removal and we'll see if anyone
speaks up.

cheers
