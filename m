Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D45563BF184
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jul 2021 23:45:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59C0F850;
	Wed,  7 Jul 2021 23:44:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59C0F850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625694324;
	bh=lc5WWHslCHAzEAUkeJQLyHm2Lk4UIBvwSliqFmLqUhE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EFwYzT1dqZub27xft+jsVbrObvyH+KfBDGOuTtU1uvllo0W0dRWduBA8hUrjtzJUY
	 ovaWoYrFhafWj01E5H9WGpZmbeuyGlzcdLCWBuRJw5CPZYNpo87Zjx3H9O+EUIP8gf
	 v/2VC+1zGuwo+35Fxz0m/1IpR9x0eSlBFAFe2pNI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A24D9F8025C;
	Wed,  7 Jul 2021 23:43:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A973BF80224; Wed,  7 Jul 2021 23:43:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7238F8012A
 for <alsa-devel@alsa-project.org>; Wed,  7 Jul 2021 23:43:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7238F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="XUMof7ci"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=YNgeYfPK9ovjzJBwdzS6vQtuS1rTuTNOeG0uEP7N+Hs=; b=XUMof7cikcltAkqq+p07WegWcy
 V1qVaWoe+R1LEbgOqNC0dhBbawBP+h4WUf7SdbOtF9Eeeg5rPS9EyFoTbwElisx8l8tmmEbHkpStd
 4vZ5+Kyj/VGfHZ9GJG9/bRHgQpTgWiXTyhyMzMf/ylGbwAdVeeTL7glQJUy0HbvTOZhAetJZMuXdg
 xB9YVmZnn+qGgOgBVLJXwD1omedUOHAh9N30BcAVjZo7nLYNgnBq8+j+iIQ6sjx7WLKzPvIXXprBU
 twhJg6qSx13Gp6RyO9aqP2Oq/GlxQBt26LUuVAgQak75dl+WbwwH0i9iO5+BiWNjaab6Nnt0sj0C5
 vu4W4cWg==;
Received: from c-73-157-219-8.hsd1.or.comcast.net ([73.157.219.8]
 helo=[10.0.0.82])
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1FKP-00FmXL-GY; Wed, 07 Jul 2021 21:43:33 +0000
Subject: Re: [PATCH v2] ASoC: atmel: ATMEL drivers depend on HAS_DMA
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Codrin.Ciubotariu@microchip.com
References: <20210628211158.30273-1-rdunlap@infradead.org>
 <5613542b-a530-ebd8-11c6-ea515cb3f8a9@microchip.com>
 <YOYDjtStnw9CO5dR@piout.net>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <fb33b720-14c1-9346-82ac-0da2e8fd0584@infradead.org>
Date: Wed, 7 Jul 2021 14:43:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOYDjtStnw9CO5dR@piout.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: mirq-linux@rere.qmqm.pl, alsa-devel@alsa-project.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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

On 7/7/21 12:42 PM, Alexandre Belloni wrote:
> On 07/07/2021 16:40:34+0000, Codrin.Ciubotariu@microchip.com wrote:
>> On 29.06.2021 00:11, Randy Dunlap wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On a config (such as arch/sh/) which does not set HAS_DMA when MMU
>>> is not set, several ATMEL ASoC drivers select symbols that cause
>>> kconfig warnings. There is one "depends on HAS_DMA" here but several
>>> more are needed to prevent kconfig warnings since 'select' does not
>>> recognize any dependencies.
>>>
>>> Fix the following kconfig warnings:
>>>
>>> WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_PDC
>>>    Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && HAS_DMA [=n]
>>>    Selected by [m]:
>>>    - SND_ATMEL_SOC_SSC [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m]
>>>    - SND_ATMEL_SOC_SSC_PDC [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m]
>>>
>>> WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_SSC_PDC
>>>    Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m] && HAS_DMA [=n]
>>>    Selected by [m]:
>>>    - SND_AT91_SOC_SAM9G20_WM8731 [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && (ARCH_AT91 || COMPILE_TEST [=y]) && ATMEL_SSC [=m] && SND_SOC_I2C_AND_SPI [=m]
>>>
>>> WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_SSC
>>>    Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && HAS_DMA [=n]
>>>    Selected by [m]:
>>>    - SND_ATMEL_SOC_SSC_DMA [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m]
>>>
>>> WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_SSC_DMA
>>>    Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m] && HAS_DMA [=n]
>>>    Selected by [m]:
>>>    - SND_ATMEL_SOC_WM8904 [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && (ARCH_AT91 || COMPILE_TEST [=y]) && ATMEL_SSC [=m] && I2C [=m]
>>>    - SND_AT91_SOC_SAM9X5_WM8731 [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && (ARCH_AT91 || COMPILE_TEST [=y]) && ATMEL_SSC [=m] && SND_SOC_I2C_AND_SPI [=m]
>>
>> Hi Randy,
>>
>> Sorry about my delayed response. I think it would be better to just 
>> remove HAS_DMA from SND_ATMEL_SOC_PDC, since it seems to compile fine 
>> without it. This should fix all the problems...
>>
> 
> I bet this is correct since m32r is gone.

Yes, that builds for me with no problems.
I'll submit that patch soon.

Thanks.

