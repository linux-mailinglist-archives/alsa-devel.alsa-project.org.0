Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04888198CE6
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 09:26:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A07A1655;
	Tue, 31 Mar 2020 09:25:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A07A1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585639563;
	bh=pKkg+QWz4Wa1wwxjQbxSJCqOMIsxA0+DOWLoRZGLn3U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QXpSS12WjAF+etCMOMEKEV/O/+wFbgPp5/B+P7ULQ1/WhPfp1KLi9EahnxDPs8MB1
	 GPsBxsOkoOdq2/pTNSIpzK7xQjmWL1fCrvUcQdqT1+0pnhpDESjX/HNtlsFy01LNG5
	 0u0lcHPsG3UQBpWiGuuZyrBDXIAJ3ntgNjiX+3DI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5907EF8028D;
	Tue, 31 Mar 2020 09:23:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1C0CF80146; Tue, 31 Mar 2020 08:56:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0144F8010D
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 08:56:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0144F8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="IzqkH+Ku"
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48s0VM3SVRz9tyhf;
 Tue, 31 Mar 2020 08:56:27 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=IzqkH+Ku; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ReBz4FGiQkHf; Tue, 31 Mar 2020 08:56:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48s0VM1wcxz9tyhY;
 Tue, 31 Mar 2020 08:56:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585637787; bh=O/pdOKyQoI5LHkYhdMKFbk8RIr6wmY568X2mLktXspE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=IzqkH+Ku1APk6gjzsUC1/DYvNxm6x78Mwd6JqIoS5s436A82mfvQxm8s/m5Z2Lyws
 ow0hIhv79EifdRBUXao9CV/R0Uk7TDWZYkhfOIsFgdju+SK9MldU1u+Uj7wqIvniPn
 e+Jh4rXFLThvHszin622sllo1B12s2cdYGEu5A0c=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 354728B784;
 Tue, 31 Mar 2020 08:56:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id TyGeYMHs_2kl; Tue, 31 Mar 2020 08:56:28 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AB6248B752;
 Tue, 31 Mar 2020 08:56:23 +0200 (CEST)
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Michael Ellerman <mpe@ellerman.id.au>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>
References: <cover.1585311091.git.michal.simek@xilinx.com>
 <CAK8P3a2mKPRFbRE3MWScr9GSiL4cpLg0wqv1Q28XDCZVPWgHfg@mail.gmail.com>
 <20200327131026.GT1922688@smile.fi.intel.com>
 <20200327131531.GU1922688@smile.fi.intel.com>
 <CAK8P3a1Z+ZPTDzgAjdz0a7d85R62BhUqkdEWgrwXh-OnYe6rog@mail.gmail.com>
 <20200327141434.GA1922688@smile.fi.intel.com>
 <b5adcc7a-9d10-d75f-50e3-9c150a7b4989@c-s.fr>
 <87mu7xum41.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <11765c82-bf1a-466c-760d-f9a4c4d1d5f1@c-s.fr>
Date: Tue, 31 Mar 2020 08:56:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <87mu7xum41.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 31 Mar 2020 09:23:19 +0200
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



Le 31/03/2020 à 07:30, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>> Le 27/03/2020 à 15:14, Andy Shevchenko a écrit :
>>> On Fri, Mar 27, 2020 at 02:22:55PM +0100, Arnd Bergmann wrote:
>>>> On Fri, Mar 27, 2020 at 2:15 PM Andy Shevchenko
>>>> <andriy.shevchenko@linux.intel.com> wrote:
>>>>> On Fri, Mar 27, 2020 at 03:10:26PM +0200, Andy Shevchenko wrote:
>>>>>> On Fri, Mar 27, 2020 at 01:54:33PM +0100, Arnd Bergmann wrote:
>>>>>>> On Fri, Mar 27, 2020 at 1:12 PM Michal Simek <michal.simek@xilinx.com> wrote:
>>> ...
>>>
>>>>>>> It does raise a follow-up question about ppc40x though: is it time to
>>>>>>> retire all of it?
>>>>>>
>>>>>> Who knows?
>>>>>>
>>>>>> I have in possession nice WD My Book Live, based on this architecture, and I
>>>>>> won't it gone from modern kernel support. OTOH I understand that amount of real
>>>>>> users not too big.
>>>>>
>>>>> +Cc: Christian Lamparter, whom I owe for that WD box.
>>>>
>>>> According to https://openwrt.org/toh/wd/mybooklive, that one is based on
>>>> APM82181/ppc464, so it is about several generations newer than what I
>>>> asked about (ppc40x).
>>>>
>>>>>> Ah, and I have Amiga board, but that one is being used only for testing, so,
>>>>>> I don't care much.
>>>>
>>>> I think there are a couple of ppc440 based Amiga boards, but again, not 405
>>>> to my knowledge.
>>>
>>> Ah, you are right. No objections from ppc40x removal!
>>
>> Removing 40x would help cleaning things a bit. For instance 40x is the
>> last platform still having PTE_ATOMIC_UPDATES. So if we can remove 40x
>> we can get rid of PTE_ATOMIC_UPDATES completely.
>>
>> If no one objects, I can prepare a series to drop support for 40x
>> completely.
>>
>> Michael, any thought ?
> 
> I have no attachment to 40x, and I'd certainly be happy to have less
> code in the tree, we struggle to keep even the modern platforms well
> maintained.
> 
> At the same time I don't want to render anyone's hardware obsolete
> unnecessarily. But if there's really no one using 40x then we should
> remove it, it could well be broken already.
> 
> So I guess post a series to do the removal and we'll see if anyone
> speaks up.
> 

Ok, series sent out, see 
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=167757


While we are at it, can we also remove the 601 ? This one is also full 
of workarounds and diverges a bit from other 6xx.

I'm unable to find its end of life date, but it was on the market in 
1994, so I guess it must be outdated by more than 10-15 yr old now ?

Christophe
