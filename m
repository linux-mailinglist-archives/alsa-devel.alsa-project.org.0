Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE23F198CE8
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 09:27:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F2D6166E;
	Tue, 31 Mar 2020 09:26:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F2D6166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585639647;
	bh=kwtf+XD3FczE4UOHDSfnd0mqXUsc4FaAc5Fs4KiL87E=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pusX2c98LHxQIW1fU+LhDtohhhrqwPolN0OiGjEdBp3IGTsnA9MNh+vnZjz6J4GGr
	 QMd3+3DQjjJEnmoj182G2Qu+sK/+i6pMeRPoYACOggg/LbgJjsyffsoYNxfk1uV4JK
	 3R43L5B1nggr4XfBO0pz0bLv42MnSSWYwJ8mS+dM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76DE2F800AA;
	Tue, 31 Mar 2020 09:23:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92C3BF80146; Tue, 31 Mar 2020 09:20:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97E08F8010D
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 09:20:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97E08F8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="tkse4wf5"
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48s11Y6fV3z9tyhY;
 Tue, 31 Mar 2020 09:20:01 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=tkse4wf5; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ZrkTbL7_Ux86; Tue, 31 Mar 2020 09:20:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48s11Y5CJZz9tyhV;
 Tue, 31 Mar 2020 09:20:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585639201; bh=BB2WAnR/RfA1f4Xoybmw0xokvJpghbjoh9sqycNr04c=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=tkse4wf5SpLn1GDdrvqyQylNxwZ4FqL1qATv602lU3gfO/TC7PzG+pT9caHFWpjVc
 gU4koLC0X4296XGphEDC310yYUl0j9pe/ocy7Vs/jqST78Cxq8T05ws/t0rvszVHVY
 FAYTcCfM2hZEFhmdht0cCGjZ51OXvS3xorw9y7lM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7C1688B787;
 Tue, 31 Mar 2020 09:20:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id HPnYfWf4OHLz; Tue, 31 Mar 2020 09:20:02 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4B1E08B752;
 Tue, 31 Mar 2020 09:19:57 +0200 (CEST)
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Michal Simek <michal.simek@xilinx.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
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
 <11765c82-bf1a-466c-760d-f9a4c4d1d5f1@c-s.fr>
 <adb18d3b-fd30-c328-cedd-bac5d8611fa2@xilinx.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <a1212105-3894-c282-0f1e-a1ac9a35cd4e@c-s.fr>
Date: Tue, 31 Mar 2020 09:19:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <adb18d3b-fd30-c328-cedd-bac5d8611fa2@xilinx.com>
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
 YueHaibing <yuehaibing@huawei.com>, Krzysztof Kozlowski <krzk@kernel.org>,
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



Le 31/03/2020 à 08:59, Michal Simek a écrit :
> On 31. 03. 20 8:56, Christophe Leroy wrote:
>>
>>
>> Le 31/03/2020 à 07:30, Michael Ellerman a écrit :
>>> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>>>> Le 27/03/2020 à 15:14, Andy Shevchenko a écrit :
>>>>> On Fri, Mar 27, 2020 at 02:22:55PM +0100, Arnd Bergmann wrote:
>>>>>> On Fri, Mar 27, 2020 at 2:15 PM Andy Shevchenko
>>>>>> <andriy.shevchenko@linux.intel.com> wrote:
>>>>>>> On Fri, Mar 27, 2020 at 03:10:26PM +0200, Andy Shevchenko wrote:
>>>>>>>> On Fri, Mar 27, 2020 at 01:54:33PM +0100, Arnd Bergmann wrote:
>>>>>>>>> On Fri, Mar 27, 2020 at 1:12 PM Michal Simek
>>>>>>>>> <michal.simek@xilinx.com> wrote:
>>>>> ...
>>>>>
>>>>>>>>> It does raise a follow-up question about ppc40x though: is it
>>>>>>>>> time to
>>>>>>>>> retire all of it?
>>>>>>>>
>>>>>>>> Who knows?
>>>>>>>>
>>>>>>>> I have in possession nice WD My Book Live, based on this
>>>>>>>> architecture, and I
>>>>>>>> won't it gone from modern kernel support. OTOH I understand that
>>>>>>>> amount of real
>>>>>>>> users not too big.
>>>>>>>
>>>>>>> +Cc: Christian Lamparter, whom I owe for that WD box.
>>>>>>
>>>>>> According to https://openwrt.org/toh/wd/mybooklive, that one is
>>>>>> based on
>>>>>> APM82181/ppc464, so it is about several generations newer than what I
>>>>>> asked about (ppc40x).
>>>>>>
>>>>>>>> Ah, and I have Amiga board, but that one is being used only for
>>>>>>>> testing, so,
>>>>>>>> I don't care much.
>>>>>>
>>>>>> I think there are a couple of ppc440 based Amiga boards, but again,
>>>>>> not 405
>>>>>> to my knowledge.
>>>>>
>>>>> Ah, you are right. No objections from ppc40x removal!
>>>>
>>>> Removing 40x would help cleaning things a bit. For instance 40x is the
>>>> last platform still having PTE_ATOMIC_UPDATES. So if we can remove 40x
>>>> we can get rid of PTE_ATOMIC_UPDATES completely.
>>>>
>>>> If no one objects, I can prepare a series to drop support for 40x
>>>> completely.
>>>>
>>>> Michael, any thought ?
>>>
>>> I have no attachment to 40x, and I'd certainly be happy to have less
>>> code in the tree, we struggle to keep even the modern platforms well
>>> maintained.
>>>
>>> At the same time I don't want to render anyone's hardware obsolete
>>> unnecessarily. But if there's really no one using 40x then we should
>>> remove it, it could well be broken already.
>>>
>>> So I guess post a series to do the removal and we'll see if anyone
>>> speaks up.
>>>
>>
>> Ok, series sent out, see
>> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=167757
> 
> ok. I see you have done it completely independently of my patchset.
> Would be better if you can base it on the top of my 2 patches because
> they are in conflict now and I need to also remove virtex 44x platform
> also with alsa driver.
> 

I can't see your first patch, only the second one shows up in the 
series, see 
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=167757

Christophe
