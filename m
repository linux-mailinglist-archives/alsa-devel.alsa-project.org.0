Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D22701EDCFD
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jun 2020 08:12:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7ABEB1665;
	Thu,  4 Jun 2020 08:11:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7ABEB1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591251153;
	bh=LFtg9RzuoKnejyAbN4hKhSNzZuwiZe6IINBAPO/3C+4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QvnuXyHNybysFMm16Cq8hzvJnauRO5PWNw95cleRFu1o9TtKOpo5IDpRSpMWubPRU
	 5Cgse8BKihJpFKvmteo5zgAZCkAUkt7outVPmasjMsUs37Wn54d1XuKQz+W6QQdJyN
	 LLz2y4UzkkgJvL7iC9SUaWmoQebEWElV0+ybB6us=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E0F7F8026F;
	Thu,  4 Jun 2020 08:09:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71882F801ED; Wed,  3 Jun 2020 10:13:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77182F8013D
 for <alsa-devel@alsa-project.org>; Wed,  3 Jun 2020 10:13:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77182F8013D
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49cM9z6GlJz9tycK;
 Wed,  3 Jun 2020 10:13:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id kZZBBVha9ZBm; Wed,  3 Jun 2020 10:13:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49cM9z5B8Xz9tycD;
 Wed,  3 Jun 2020 10:13:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 158828B884;
 Wed,  3 Jun 2020 10:13:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id pnmsigv9jAd0; Wed,  3 Jun 2020 10:13:44 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 86D058B76A;
 Wed,  3 Jun 2020 10:13:42 +0200 (CEST)
Subject: Re: [PATCH v2 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Michal Simek <michal.simek@xilinx.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Takashi Iwai <tiwai@suse.de>
References: <cover.1585575111.git.michal.simek@xilinx.com>
 <87imikufes.fsf@mpe.ellerman.id.au>
 <12db51d6-d848-118e-5ec1-a4172bd47aa4@xilinx.com>
 <87y2rftrx7.fsf@mpe.ellerman.id.au> <s5hk12z4hj5.wl-tiwai@suse.de>
 <02e7f790-b105-de67-799c-0fe065e58320@xilinx.com>
 <c22540fb-1c54-b718-9045-3ee645c30322@monstr.eu>
 <87wo4yerom.fsf@mpe.ellerman.id.au>
 <4b807ebc-8d8f-ad76-f5e2-9ce8410dc70c@xilinx.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <aad5c6c5-b84a-7a6d-3f07-f45dd1dd85d1@csgroup.eu>
Date: Wed, 3 Jun 2020 10:13:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <4b807ebc-8d8f-ad76-f5e2-9ce8410dc70c@xilinx.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 04 Jun 2020 08:09:48 +0200
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-doc@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, Richard Fontana <rfontana@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Sasha Levin <sashal@kernel.org>,
 sfr@canb.auug.org.au, Jonathan Corbet <corbet@lwn.net>, maz@kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Allison Randal <allison@lohutok.net>,
 Matt Porter <mporter@kernel.crashing.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mark Brown <broonie@kernel.org>, git@xilinx.com, linux-fbdev@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dmitry Vyukov <dvyukov@google.com>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Wei Hu <weh@microsoft.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Enrico Weigelt <info@metux.net>,
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

Hi,

Le 03/06/2020 à 10:10, Michal Simek a écrit :
> Hi Michael,
> 
> On 26. 05. 20 15:44, Michael Ellerman wrote:
>> Michal Simek <monstr@monstr.eu> writes:
>>> Hi Michael,
>>>
>>> On 01. 04. 20 13:30, Michal Simek wrote:
>>>> On 01. 04. 20 12:38, Takashi Iwai wrote:
>>>>> On Wed, 01 Apr 2020 12:35:16 +0200,
>>>>> Michael Ellerman wrote:
>>>>>>
>>>>>> Michal Simek <michal.simek@xilinx.com> writes:
>>>>>>> On 01. 04. 20 4:07, Michael Ellerman wrote:
>>>>>>>> Michal Simek <michal.simek@xilinx.com> writes:
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> recently we wanted to update xilinx intc driver and we found that function
>>>>>>>>> which we wanted to remove is still wired by ancient Xilinx PowerPC
>>>>>>>>> platforms. Here is the thread about it.
>>>>>>>>> https://lore.kernel.org/linux-next/48d3232d-0f1d-42ea-3109-f44bbabfa2e8@xilinx.com/
>>>>>>>>>
>>>>>>>>> I have been talking about it internally and there is no interest in these
>>>>>>>>> platforms and it is also orphan for quite a long time. None is really
>>>>>>>>> running/testing these platforms regularly that's why I think it makes sense
>>>>>>>>> to remove them also with drivers which are specific to this platform.
>>>>>>>>>
>>>>>>>>> U-Boot support was removed in 2017 without anybody complain about it
>>>>>>>>> https://github.com/Xilinx/u-boot-xlnx/commit/98f705c9cefdfdba62c069821bbba10273a0a8ed
>>>>>>>>>
>>>>>>>>> Based on current ppc/next.
>>>>>>>>>
>>>>>>>>> If anyone has any objection about it, please let me know.
>>>>>>>>
>>>>>>>> Thanks for taking the time to find all this code and remove it.
>>>>>>>>
>>>>>>>> I'm not going to take this series for v5.7, it was posted too close to
>>>>>>>> the merge window, and doing so wouldn't give people much time to object,
>>>>>>>> especially given people are distracted at the moment.
>>>>>>>>
>>>>>>>> I'm happy to take it for v5.8, assuming there's no major objections.
>>>>>>>
>>>>>>> Sure. Just to let you know Christophe Leroy included this patch in his
>>>>>>> series about ppc405 removal. It should be the same.
>>>>>>>
>>>>>>> If you don't want to take that alsa patch I can send it separately and
>>>>>>> this patch can be taken from his series. I don't really mind but please
>>>>>>> let me know what way you prefer.
>>>>>>
>>>>>> It's better to keep it all together, so I'm happy take the alsa patch as
>>>>>> well, it's already been acked.
>>>
>>> Can you please take this series? I know that there is v5 from Christophe
>>> which has this 1/2 as 1/13. But I need this alsa patch too and I would
>>> like to close this because it is around for almost 2 months and none
>>> raised a concern about removing just these Xilinx platforms.
>>
>> Sorry I meant to reply to your last mail.
>>
>> I have Christophe's series in my testing branch, planning for it to be
>> in v5.8.
>>
>> Even if the rest of his series doesn't make it for some reason, as you
>> say the Xilinx removal is uncontroversial so I'll keep that in.
>>
>> I forgot about the sound patch, I'll pick that up as well.
> 
> I took a look at your
> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git repo
> and I can't see any branch with my patches.
> Also was checking linux-next and my patches are also not there.
> That's why I am curious if this will be go v5.8 in MW.

I see them in 
https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git in 
next-test branch.

Christophe
