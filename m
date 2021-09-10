Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B9E406575
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Sep 2021 03:54:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9ADC316A9;
	Fri, 10 Sep 2021 03:53:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9ADC316A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631238878;
	bh=hP/8peeuDujt/DVH1/Jf4/6Lh3fiD1jEnAw6hOqjNUY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uDpPy0+slVbC7KYS3huMWBM1cAPK5X4cg0nkkHyzIe7EnFiRcwXf7etuj3gzmH2YO
	 1wZqdngT0hAI90I9ZGRo9M23veYpmSQ6sQQOff+THsQ3r/bfZ2yDiQw2kXnv8UY/GD
	 I47UFBQ+noWgo9uOkrMz3PYaVFfTL9UVrkMDxpG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16912F8049C;
	Fri, 10 Sep 2021 03:53:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B225FF802E7; Fri, 10 Sep 2021 03:53:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97E62F80166
 for <alsa-devel@alsa-project.org>; Fri, 10 Sep 2021 03:53:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97E62F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="VNfFVaiU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=jDrcNASQTZ7plQw94gPD6p6PfoIysJxfSlp6f5+ftkw=; b=VNfFVaiUbbpo/gdddKn6azjMDY
 6u2xY0vf1bytqaBLe2lUZ2/4DiSOAkvrC5AMgOnnTzh4EG4+eIZF2Rp2Bn3vBJv6HXYDJfU4bnQ33
 JH1lURXpXz8WzjN2S2ejZcttMvkdmE6cjtuPIP5WYfj7lFQQ7aX4gzwzDGSUTimrpA2uF8hO2e2Gg
 oJ1ubg3I/A7oUdgtLG705KtwGp8Bc49iDp3f3ntjKrI8K424+1881pwKUTGLCDRNV9/+XAoir4487
 PfWbgm5IAProRZYgeYKPomWZO5htmuGLWjzbqB+6rmSLNQ6TlNfRphUhjpVrek18Gjzi+oglFWzm2
 QFMnxYTg==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOViy-00BYeZ-Ko; Fri, 10 Sep 2021 01:53:04 +0000
Subject: Re: [PATCH v3] ASoC: atmel: ATMEL drivers don't need HAS_DMA
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20210707214752.3831-1-rdunlap@infradead.org>
 <fca8f952-2be0-5c57-d60d-5c4f025abc4d@microchip.com>
 <49495ab9-5039-f332-2895-1a79c034f58d@infradead.org>
 <CAMuHMdU=ODKZJ0OOsuCeJnTWuM3fP5DE7coSzB=fvAbxPQWDcg@mail.gmail.com>
 <a94c9788-0415-ffe3-9dd4-e6ed8d7ee96a@infradead.org>
 <CAMuHMdWUcaC-xiW0UiVdTpx-R=e_i8eHSNc8JF_wqbcO6FynWw@mail.gmail.com>
 <f5cf4155-785f-9ec7-1f59-be5c92911b0a@infradead.org>
 <CAMuHMdXcmW27KhQEgxmVSDgR8GDnb_5mYNPYepa15F_tKqk9-A@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <9c1bbf15-ebba-e754-8fac-9cc7b218651c@infradead.org>
Date: Thu, 9 Sep 2021 18:53:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXcmW27KhQEgxmVSDgR8GDnb_5mYNPYepa15F_tKqk9-A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 mirq-linux@rere.qmqm.pl, Mark Brown <broonie@kernel.org>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Codrin.Ciubotariu@microchip.com
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

On 9/9/21 12:22 AM, Geert Uytterhoeven wrote:
> Hi Randy,
> 
> On Wed, Sep 8, 2021 at 10:14 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>> On 9/6/21 12:14 AM, Geert Uytterhoeven wrote:
>>> On Fri, Sep 3, 2021 at 9:53 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>>> On 9/2/21 9:44 AM, Geert Uytterhoeven wrote:
>>>>> On Thu, Jul 8, 2021 at 6:51 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>>>>> On 7/8/21 1:19 AM, Codrin.Ciubotariu@microchip.com wrote:
>>>>>>> On 08.07.2021 00:47, Randy Dunlap wrote:
>>>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>>>>
>>>>>>>> On a config (such as arch/sh/) which does not set HAS_DMA when MMU
>>>>>>>> is not set, several ATMEL ASoC drivers select symbols that cause
>>>>>>>> kconfig warnings. There is one "depends on HAS_DMA" which is no longer
>>>>>>>> needed. Dropping it eliminates the kconfig warnings and still builds
>>>>>>>> with no problems reported.
>>>>>>>>
>>>>>>>> Fix the following kconfig warnings:
>>>>>>>>
>>>>>>>> WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_PDC
>>>>>>>>       Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && HAS_DMA [=n]
>>>>>>>>       Selected by [m]:
>>>>>>>>       - SND_ATMEL_SOC_SSC [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m]
>>>>>>>>       - SND_ATMEL_SOC_SSC_PDC [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m]
>>>>>>>>
>>>>>>>> WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_SSC_PDC
>>>>>>>>       Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m] && HAS_DMA [=n]
>>>>>>>>       Selected by [m]:
>>>>>>>>       - SND_AT91_SOC_SAM9G20_WM8731 [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && (ARCH_AT91 || COMPILE_TEST [=y]) && ATMEL_SSC [=m] && SND_SOC_I2C_AND_SPI [=m]
>>>>>>>>
>>>>>>>> WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_SSC
>>>>>>>>       Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && HAS_DMA [=n]
>>>>>>>>       Selected by [m]:
>>>>>>>>       - SND_ATMEL_SOC_SSC_DMA [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m]
>>>>>>>>
>>>>>>>> WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_SSC_DMA
>>>>>>>>       Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m] && HAS_DMA [=n]
>>>>>>>>       Selected by [m]:
>>>>>>>>       - SND_ATMEL_SOC_WM8904 [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && (ARCH_AT91 || COMPILE_TEST [=y]) && ATMEL_SSC [=m] && I2C [=m]
>>>>>>>>       - SND_AT91_SOC_SAM9X5_WM8731 [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && (ARCH_AT91 || COMPILE_TEST [=y]) && ATMEL_SSC [=m] && SND_SOC_I2C_AND_SPI [=m]
>>>>>>>>
>>>>>>>> Fixes: 3951e4aae2ce ("ASoC: atmel-pcm: dma support based on pcm dmaengine")
>>>>>>>> Fixes: 18291410557f ("ASoC: atmel: enable SOC_SSC_PDC and SOC_SSC_DMA in Kconfig")
>>>>>>>> Fixes: 061981ff8cc8 ("ASoC: atmel: properly select dma driver state")
>>>>>>>
>>>>>>> I am not sure about these fixes tags. As Alexandre mentioned, it looks
>>>>>>> like the reason for HAS_DMA in the first place was the COMPILE_TEST with
>>>>>>> m32r arch. I dig a bit, and, if any, I think we should use:
>>>>>>> Fixes: eb17726b00b3 ("m32r: add simple dma")
>>>>>>> since this commit adds dummy DMA support for m32r and seems to fix the
>>>>>>> HAS_DMA dependency.
>>>>>>
>>>>>> Ah, I forgot to update the Fixes: tag(s).
>>>>>>
>>>>>> I won't disagree with your Fixes: suggestion (good digging) but
>>>>>> I would probably have used 8d7d11005e930:
>>>>>>      ASoC: atmel: fix build failure
>>>>>> which is the commit that added "depends on HAS_DMA".
>>>>>
>>>>> M32r was not the only platform NO_DMA, so I guess the build would
>>>>> have failed for the others, too (e.g. Sun-3).
>>>>>
>>>>> So the real fix was probably commit f29ab49b5388b2f8 ("dma-mapping:
>>>>> Convert NO_DMA get_dma_ops() into a real dummy"), or one of the
>>>>> related commits adding dummies to subsystems.
>>>>
>>>> Does this mean that some other actions are needed here?
>>>> E.g. revert + a different kind of fix?
>>>
>>> While we can now compile drivers using DMA features on NO_DMA
>>> platforms, thanks to the dummies, it does mean many of these drivers
>>> cannot work on such platforms.  So I think it makes sense to replace
>>> "depends on HAS_DMA" by "depends on HAS_DMA || COMPILE_TEST" if DMA
>>> is not optional to the driver.
>>
>> Hi Geert,
>>
>> Is this what you had in mind?  It seems to work with my (limited)
>> testing.
> 
> Yes. And also for other symbols for drivers that now compile fine
> if !HAS_DMA, thanks to the dummies.
> 
>> --- linux-next-20210907.orig/sound/soc/atmel/Kconfig
>> +++ linux-next-20210907/sound/soc/atmel/Kconfig
>> @@ -11,6 +11,7 @@ if SND_ATMEL_SOC
>>
>>    config SND_ATMEL_SOC_PDC
>>          bool
>> +       depends on HAS_DMA || COMPILE_TEST
>>
>>    config SND_ATMEL_SOC_DMA
>>          bool

Well. Addressing only sound/, only one more patch is needed AFAICT.
For Kconfigs outside of sound/, that would be more of a medium-length
project.


Lightly/successfully build-tested.

---
  sound/soc/fsl/Kconfig |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20210907.orig/sound/soc/fsl/Kconfig
+++ linux-next-20210907/sound/soc/fsl/Kconfig
@@ -5,7 +5,7 @@ comment "Common SoC Audio options for Fr
  
  config SND_SOC_FSL_ASRC
  	tristate "Asynchronous Sample Rate Converter (ASRC) module support"
-	depends on HAS_DMA
+	depends on HAS_DMA || COMPILE_TEST
  	select REGMAP_MMIO
  	select SND_SOC_GENERIC_DMAENGINE_PCM
  	help

