Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5463BF06F
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jul 2021 21:43:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A378B843;
	Wed,  7 Jul 2021 21:42:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A378B843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625687026;
	bh=wMnnYCWYZ/J6IA9WshC8iRV4qTdACyc9fojyp2FE81Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qCICzFdh7BFKuR5A9r9NagNIu4mbP/7ij53RoSGRujZPriyVxnQcfGB0h5tNQwR0E
	 B9sL2IqNW+bx7jhNcgGb3vigYqx9NtG4gjBmRJLCQEGOO5SOyGJxMQy8CoYqZ4dbbF
	 9LytRcJsF/+YdotIMY4/iE6ajI8l56MQeGI79Kfc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 043B3F8012F;
	Wed,  7 Jul 2021 21:42:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1F2DF80224; Wed,  7 Jul 2021 21:42:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66D46F8012F
 for <alsa-devel@alsa-project.org>; Wed,  7 Jul 2021 21:42:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66D46F8012F
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 7DC16200003;
 Wed,  7 Jul 2021 19:42:06 +0000 (UTC)
Date: Wed, 7 Jul 2021 21:42:06 +0200
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Codrin.Ciubotariu@microchip.com
Subject: Re: [PATCH v2] ASoC: atmel: ATMEL drivers depend on HAS_DMA
Message-ID: <YOYDjtStnw9CO5dR@piout.net>
References: <20210628211158.30273-1-rdunlap@infradead.org>
 <5613542b-a530-ebd8-11c6-ea515cb3f8a9@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5613542b-a530-ebd8-11c6-ea515cb3f8a9@microchip.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, mirq-linux@rere.qmqm.pl, broonie@kernel.org
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

On 07/07/2021 16:40:34+0000, Codrin.Ciubotariu@microchip.com wrote:
> On 29.06.2021 00:11, Randy Dunlap wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On a config (such as arch/sh/) which does not set HAS_DMA when MMU
> > is not set, several ATMEL ASoC drivers select symbols that cause
> > kconfig warnings. There is one "depends on HAS_DMA" here but several
> > more are needed to prevent kconfig warnings since 'select' does not
> > recognize any dependencies.
> > 
> > Fix the following kconfig warnings:
> > 
> > WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_PDC
> >    Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && HAS_DMA [=n]
> >    Selected by [m]:
> >    - SND_ATMEL_SOC_SSC [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m]
> >    - SND_ATMEL_SOC_SSC_PDC [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m]
> > 
> > WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_SSC_PDC
> >    Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m] && HAS_DMA [=n]
> >    Selected by [m]:
> >    - SND_AT91_SOC_SAM9G20_WM8731 [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && (ARCH_AT91 || COMPILE_TEST [=y]) && ATMEL_SSC [=m] && SND_SOC_I2C_AND_SPI [=m]
> > 
> > WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_SSC
> >    Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && HAS_DMA [=n]
> >    Selected by [m]:
> >    - SND_ATMEL_SOC_SSC_DMA [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m]
> > 
> > WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_SSC_DMA
> >    Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m] && HAS_DMA [=n]
> >    Selected by [m]:
> >    - SND_ATMEL_SOC_WM8904 [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && (ARCH_AT91 || COMPILE_TEST [=y]) && ATMEL_SSC [=m] && I2C [=m]
> >    - SND_AT91_SOC_SAM9X5_WM8731 [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && (ARCH_AT91 || COMPILE_TEST [=y]) && ATMEL_SSC [=m] && SND_SOC_I2C_AND_SPI [=m]
> 
> Hi Randy,
> 
> Sorry about my delayed response. I think it would be better to just 
> remove HAS_DMA from SND_ATMEL_SOC_PDC, since it seems to compile fine 
> without it. This should fix all the problems...
> 

I bet this is correct since m32r is gone.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
