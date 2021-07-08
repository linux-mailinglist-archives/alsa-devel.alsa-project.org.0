Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AB53C1772
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jul 2021 18:52:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD6C2827;
	Thu,  8 Jul 2021 18:51:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD6C2827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625763158;
	bh=2KRBL/3VXqzRrf8KkgYaIErb1oGT5+0L6qWOiAGkQqo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b/kWoSxDRuSSAlErSUH3V7WO2ISIIMLDKjm791goZvniiesap5hDspwOXG386LGL5
	 f0ZmOG86QhbFkPoMOz9u8H+E7BCN6RlzoTUHeZucWgHIMTWusCp8wdMqmUkoQKODU5
	 PDwh5DVJk0jB+YssWO09clb6sei3spmHTRZj8//A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 380A9F80249;
	Thu,  8 Jul 2021 18:51:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5283F80246; Thu,  8 Jul 2021 18:51:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3F4EF8012A
 for <alsa-devel@alsa-project.org>; Thu,  8 Jul 2021 18:51:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3F4EF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="dEEI2DJ2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=rRjw0MD5mNTCw5c7zVuaZpo/EngGyn3l6moiSAMWrZo=; b=dEEI2DJ2/5DjEr22QVGqIT5SK6
 cjFeYoY3XcdnNfSHkj2TkppKM5DwnQLrFLNoN1FohaDoUyekGg8vbQgM+a27yQsz6wi/G6gkKOuQ4
 eIFXNUwtRCZ9B24WAMX7oqppvjF5gd9Et55yKh6LjMghEtDPU5Q0+ukPJjyPJ4llJf2xJrxK90zu3
 NuPf21AmwPMZHxCkqRP/0KKpdRYcyiDYruJJf7Iz7IybeZt2wBdFCuPxY0PkqyY0dlLzL02wlBQDl
 hAZZ2ViJqfx6R2FrqAFNLC3tT0vUGiy0oUEPqfCFUsl9J7JTjYyIeSekGwgjI/zw12vZmz6z6l3eS
 rO8SL2tg==;
Received: from [2601:1c0:6280:3f0::aefb]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1XEi-00HX04-FP; Thu, 08 Jul 2021 16:50:52 +0000
Subject: Re: [PATCH v3] ASoC: atmel: ATMEL drivers don't need HAS_DMA
To: Codrin.Ciubotariu@microchip.com, linux-kernel@vger.kernel.org
References: <20210707214752.3831-1-rdunlap@infradead.org>
 <fca8f952-2be0-5c57-d60d-5c4f025abc4d@microchip.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <49495ab9-5039-f332-2895-1a79c034f58d@infradead.org>
Date: Thu, 8 Jul 2021 09:50:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fca8f952-2be0-5c57-d60d-5c4f025abc4d@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 alexandre.belloni@free-electrons.com, lgirdwood@gmail.com,
 mirq-linux@rere.qmqm.pl
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

On 7/8/21 1:19 AM, Codrin.Ciubotariu@microchip.com wrote:
> On 08.07.2021 00:47, Randy Dunlap wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On a config (such as arch/sh/) which does not set HAS_DMA when MMU
>> is not set, several ATMEL ASoC drivers select symbols that cause
>> kconfig warnings. There is one "depends on HAS_DMA" which is no longer
>> needed. Dropping it eliminates the kconfig warnings and still builds
>> with no problems reported.
>>
>> Fix the following kconfig warnings:
>>
>> WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_PDC
>>    Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && HAS_DMA [=n]
>>    Selected by [m]:
>>    - SND_ATMEL_SOC_SSC [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m]
>>    - SND_ATMEL_SOC_SSC_PDC [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m]
>>
>> WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_SSC_PDC
>>    Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m] && HAS_DMA [=n]
>>    Selected by [m]:
>>    - SND_AT91_SOC_SAM9G20_WM8731 [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && (ARCH_AT91 || COMPILE_TEST [=y]) && ATMEL_SSC [=m] && SND_SOC_I2C_AND_SPI [=m]
>>
>> WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_SSC
>>    Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && HAS_DMA [=n]
>>    Selected by [m]:
>>    - SND_ATMEL_SOC_SSC_DMA [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m]
>>
>> WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_SSC_DMA
>>    Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m] && HAS_DMA [=n]
>>    Selected by [m]:
>>    - SND_ATMEL_SOC_WM8904 [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && (ARCH_AT91 || COMPILE_TEST [=y]) && ATMEL_SSC [=m] && I2C [=m]
>>    - SND_AT91_SOC_SAM9X5_WM8731 [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && (ARCH_AT91 || COMPILE_TEST [=y]) && ATMEL_SSC [=m] && SND_SOC_I2C_AND_SPI [=m]
>>
>> Fixes: 3951e4aae2ce ("ASoC: atmel-pcm: dma support based on pcm dmaengine")
>> Fixes: 18291410557f ("ASoC: atmel: enable SOC_SSC_PDC and SOC_SSC_DMA in Kconfig")
>> Fixes: 061981ff8cc8 ("ASoC: atmel: properly select dma driver state")
> 
> I am not sure about these fixes tags. As Alexandre mentioned, it looks 
> like the reason for HAS_DMA in the first place was the COMPILE_TEST with 
> m32r arch. I dig a bit, and, if any, I think we should use:
> Fixes: eb17726b00b3 ("m32r: add simple dma")
> since this commit adds dummy DMA support for m32r and seems to fix the 
> HAS_DMA dependency.

Ah, I forgot to update the Fixes: tag(s).

I won't disagree with your Fixes: suggestion (good digging) but
I would probably have used 8d7d11005e930:
  ASoC: atmel: fix build failure
which is the commit that added "depends on HAS_DMA".

>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
>> Cc: alsa-devel@alsa-project.org
>> Cc: Liam Girdwood <lgirdwood@gmail.com>
>> Cc: Mark Brown <broonie@kernel.org>
>> Cc: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> 
> Other than that:
> Reviewed-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>

Thanks.  I'll send a v4 with your Fixes: suggestion.

