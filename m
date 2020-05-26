Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DDB1E39F9
	for <lists+alsa-devel@lfdr.de>; Wed, 27 May 2020 09:12:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3684E17A8;
	Wed, 27 May 2020 09:12:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3684E17A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590563576;
	bh=niBO4BBw0xcWoDqxqo8yu/3cMlLVWMp9FLLaGmF8gxw=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EQLEy4aqAIZHC1OF4LF9xIrkAFTpWhHWFha30wMS0OsivqOfUA6ZA4fqNn/agzXN6
	 KwvggsQpOSnUdcy7LIvfRGroikY3k4blDsjzP95HBuxRMERLkwYkpm/S3E9M6YXWRH
	 697ZWSXXc22/1cpt4+jk0tkjsShl6GHzW9XLXQuw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48967F80278;
	Wed, 27 May 2020 09:10:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C02A3F80150; Tue, 26 May 2020 15:45:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91AF6F80131
 for <alsa-devel@alsa-project.org>; Tue, 26 May 2020 15:44:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91AF6F80131
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="dxxpYB0+"
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49WZvT3QWTz9sPF;
 Tue, 26 May 2020 23:44:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1590500685;
 bh=niBO4BBw0xcWoDqxqo8yu/3cMlLVWMp9FLLaGmF8gxw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=dxxpYB0+X5QlW36UmtTVARIDzR1CMMOTHjqUytJ5Y8EcdYvKzpntJpTS0eF2qYCKV
 tFu9p0QyrNotbGnP0FIarnpWASfJypqNF0JGo2uPHkQhgXcBd7fw2LCyxmr8XYj99n
 R7GgB1c4IwyJybQkVD2IK3BXdrtuKnLcrvA4BJF8r4Xn4qwqcVdm6ziTtF5mFUyHh0
 xA3fcj2bw8YCg1RpB0cJMcIqtisxKB6qcetZVFXMmgZVv62vdxanb2Ov0h/6Lao8LQ
 egwMqUK6p/cS/T5awknnrpKdEjn6myr4LassPeBuXUc13nul3eaHWZFbRJ7DVjz1DH
 ddBSGGc3jFUYQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>,
 Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
In-Reply-To: <c22540fb-1c54-b718-9045-3ee645c30322@monstr.eu>
References: <cover.1585575111.git.michal.simek@xilinx.com>
 <87imikufes.fsf@mpe.ellerman.id.au>
 <12db51d6-d848-118e-5ec1-a4172bd47aa4@xilinx.com>
 <87y2rftrx7.fsf@mpe.ellerman.id.au> <s5hk12z4hj5.wl-tiwai@suse.de>
 <02e7f790-b105-de67-799c-0fe065e58320@xilinx.com>
 <c22540fb-1c54-b718-9045-3ee645c30322@monstr.eu>
Date: Tue, 26 May 2020 23:44:57 +1000
Message-ID: <87wo4yerom.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Wed, 27 May 2020 09:10:26 +0200
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

Michal Simek <monstr@monstr.eu> writes:
> Hi Michael,
>
> On 01. 04. 20 13:30, Michal Simek wrote:
>> On 01. 04. 20 12:38, Takashi Iwai wrote:
>>> On Wed, 01 Apr 2020 12:35:16 +0200,
>>> Michael Ellerman wrote:
>>>>
>>>> Michal Simek <michal.simek@xilinx.com> writes:
>>>>> On 01. 04. 20 4:07, Michael Ellerman wrote:
>>>>>> Michal Simek <michal.simek@xilinx.com> writes:
>>>>>>> Hi,
>>>>>>>
>>>>>>> recently we wanted to update xilinx intc driver and we found that function
>>>>>>> which we wanted to remove is still wired by ancient Xilinx PowerPC
>>>>>>> platforms. Here is the thread about it.
>>>>>>> https://lore.kernel.org/linux-next/48d3232d-0f1d-42ea-3109-f44bbabfa2e8@xilinx.com/
>>>>>>>
>>>>>>> I have been talking about it internally and there is no interest in these
>>>>>>> platforms and it is also orphan for quite a long time. None is really
>>>>>>> running/testing these platforms regularly that's why I think it makes sense
>>>>>>> to remove them also with drivers which are specific to this platform.
>>>>>>>
>>>>>>> U-Boot support was removed in 2017 without anybody complain about it
>>>>>>> https://github.com/Xilinx/u-boot-xlnx/commit/98f705c9cefdfdba62c069821bbba10273a0a8ed
>>>>>>>
>>>>>>> Based on current ppc/next.
>>>>>>>
>>>>>>> If anyone has any objection about it, please let me know.
>>>>>>
>>>>>> Thanks for taking the time to find all this code and remove it.
>>>>>>
>>>>>> I'm not going to take this series for v5.7, it was posted too close to
>>>>>> the merge window, and doing so wouldn't give people much time to object,
>>>>>> especially given people are distracted at the moment.
>>>>>>
>>>>>> I'm happy to take it for v5.8, assuming there's no major objections.
>>>>>
>>>>> Sure. Just to let you know Christophe Leroy included this patch in his
>>>>> series about ppc405 removal. It should be the same.
>>>>>
>>>>> If you don't want to take that alsa patch I can send it separately and
>>>>> this patch can be taken from his series. I don't really mind but please
>>>>> let me know what way you prefer.
>>>>
>>>> It's better to keep it all together, so I'm happy take the alsa patch as
>>>> well, it's already been acked.
>
> Can you please take this series? I know that there is v5 from Christophe
> which has this 1/2 as 1/13. But I need this alsa patch too and I would
> like to close this because it is around for almost 2 months and none
> raised a concern about removing just these Xilinx platforms.

Sorry I meant to reply to your last mail.

I have Christophe's series in my testing branch, planning for it to be
in v5.8.

Even if the rest of his series doesn't make it for some reason, as you
say the Xilinx removal is uncontroversial so I'll keep that in.

I forgot about the sound patch, I'll pick that up as well.

cheers
