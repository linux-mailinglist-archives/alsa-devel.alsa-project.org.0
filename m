Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3424C196BC0
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Mar 2020 09:57:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D81AF1682;
	Sun, 29 Mar 2020 09:56:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D81AF1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585468662;
	bh=q/15saBkCw6pCFBPuc5+EOuTM4y00iXo9pmW6vbOhc0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KwhjvN3BO+NEx43ElQ9F6Bc5FR/ktGnAp0B822PDh8mG9aI5Je7RtVU2nM0VlvSg3
	 IZl7GNB8EIoQNSJBTlw74AEWu8avCqnuDebmSyMDdxOP+ZAtvbgfcqUQARMWEGHEax
	 qbGeBjv9CJj8oHyeCohzy+lcoi6yXJU2EifQo0Jw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E33D8F8013F;
	Sun, 29 Mar 2020 09:54:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FC48F80234; Sat, 28 Mar 2020 12:18:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 897E7F800EA
 for <alsa-devel@alsa-project.org>; Sat, 28 Mar 2020 12:18:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 897E7F800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="kJCrULvp"
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48qGRj63y9zB09ZW;
 Sat, 28 Mar 2020 12:18:09 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=kJCrULvp; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Aqeer9tOyAxc; Sat, 28 Mar 2020 12:18:09 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48qGRj4XtLzB09ZR;
 Sat, 28 Mar 2020 12:18:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585394289; bh=VyBwgOCzEkUZrjyWnViNMulwr9dgKuVbNjydDE7N0r0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=kJCrULvpRXmm5Q3uP6c+IQAHQXHFkw9+Us6HF2mcW2XMH5WBcPUPhSF1avLjMqZTy
 EHlYoMQgjvfXBgtOc9qWFZnCf+4BPtaQRIP6sMw1o97qkggpKN2pDkxdIwj3MdqzMT
 2kv5P4RiMiZFEH9Z8pAGeoajZtpFJdyJEFPBiANM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C74EE8B76C;
 Sat, 28 Mar 2020 12:18:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id UaW4AG2lp2bR; Sat, 28 Mar 2020 12:18:10 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0D1928B75B;
 Sat, 28 Mar 2020 12:18:06 +0100 (CET)
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>
References: <cover.1585311091.git.michal.simek@xilinx.com>
 <CAK8P3a2mKPRFbRE3MWScr9GSiL4cpLg0wqv1Q28XDCZVPWgHfg@mail.gmail.com>
 <20200327131026.GT1922688@smile.fi.intel.com>
 <20200327131531.GU1922688@smile.fi.intel.com>
 <CAK8P3a1Z+ZPTDzgAjdz0a7d85R62BhUqkdEWgrwXh-OnYe6rog@mail.gmail.com>
 <20200327141434.GA1922688@smile.fi.intel.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <b5adcc7a-9d10-d75f-50e3-9c150a7b4989@c-s.fr>
Date: Sat, 28 Mar 2020 12:17:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200327141434.GA1922688@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 29 Mar 2020 09:54:16 +0200
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



Le 27/03/2020 à 15:14, Andy Shevchenko a écrit :
> On Fri, Mar 27, 2020 at 02:22:55PM +0100, Arnd Bergmann wrote:
>> On Fri, Mar 27, 2020 at 2:15 PM Andy Shevchenko
>> <andriy.shevchenko@linux.intel.com> wrote:
>>> On Fri, Mar 27, 2020 at 03:10:26PM +0200, Andy Shevchenko wrote:
>>>> On Fri, Mar 27, 2020 at 01:54:33PM +0100, Arnd Bergmann wrote:
>>>>> On Fri, Mar 27, 2020 at 1:12 PM Michal Simek <michal.simek@xilinx.com> wrote:
> 
> ...
> 
>>>>> It does raise a follow-up question about ppc40x though: is it time to
>>>>> retire all of it?
>>>>
>>>> Who knows?
>>>>
>>>> I have in possession nice WD My Book Live, based on this architecture, and I
>>>> won't it gone from modern kernel support. OTOH I understand that amount of real
>>>> users not too big.
>>>
>>> +Cc: Christian Lamparter, whom I owe for that WD box.
>>
>> According to https://openwrt.org/toh/wd/mybooklive, that one is based on
>> APM82181/ppc464, so it is about several generations newer than what I
>> asked about (ppc40x).
>>
>>>> Ah, and I have Amiga board, but that one is being used only for testing, so,
>>>> I don't care much.
>>
>> I think there are a couple of ppc440 based Amiga boards, but again, not 405
>> to my knowledge.
> 
> Ah, you are right. No objections from ppc40x removal!
> 

Removing 40x would help cleaning things a bit. For instance 40x is the 
last platform still having PTE_ATOMIC_UPDATES. So if we can remove 40x 
we can get rid of PTE_ATOMIC_UPDATES completely.


If no one objects, I can prepare a series to drop support for 40x 
completely.

Michael, any thought ?

Christophe
