Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE2E36C584
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Apr 2021 13:48:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5712816E9;
	Tue, 27 Apr 2021 13:47:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5712816E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619524084;
	bh=qVFuO6/tLhDwFKlIDVyEkkO3REEgMxsC6Lv0l1d3R3k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g2PjuHarMr1xsdoLRoSRfWDCmhbLgiWODY0M1uDK+TkeBTgTJ/Fvg0lI703PESs6k
	 1GC6OZwQOk957Ug5dzhiInzY4VVM+uWzosChLaSqNYUhIo0qv5zgQ8YOOAxaUxSf1X
	 feRZleFFjT6piaxvPe7yJApiHFdSrfU6HPCZzc0Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFFAAF800C0;
	Tue, 27 Apr 2021 13:46:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16C97F801EC; Tue, 27 Apr 2021 13:46:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89403F80117
 for <alsa-devel@alsa-project.org>; Tue, 27 Apr 2021 13:46:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89403F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZJ5BlTIC"
Received: by mail-pf1-x432.google.com with SMTP id y62so8543108pfg.4
 for <alsa-devel@alsa-project.org>; Tue, 27 Apr 2021 04:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iMMjjV+PTIV4vm6/IEmRAWhSVzJiCXiZU3/huO/x0nI=;
 b=ZJ5BlTICDUmG7DguAEd0jOWxjwIIhOaHp4R6eP8WhcGhNHC51J05uSg8I6KYz03BN7
 Gjdaf+CiMhQyG6HVJLl+RLDlLuxIyFICDTrM2iBH78c57SiT4P/QFvk4NhlTMWy0zsrz
 YZCmbyMFpX9+/2dUK3valgqZBYVthS6aZBo9554CiRGCJ93prSUyJSVjSbJq3pg/Kts7
 ZwIvwzkOgnEHhx+38D5EslxeSIcZNyFn/4If/iTP/5JwzQ6HQxGV1NL7yO9utIdh9fwP
 OIRyaTMRRni21LQU12CZ8qc3FLxRIDbNEbCf7SRpr2TRSPXm7b1fmptX1R4tYhEdtzTm
 Rkzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iMMjjV+PTIV4vm6/IEmRAWhSVzJiCXiZU3/huO/x0nI=;
 b=e6Wbjw+9vf2aCD46ZCa5GIcWnLWJysGOwtMs/PQ1uuvyZ/S7VKbq0UYCDAQWC+2uRz
 Mnvb02dhK7FNh2zFmedDNxREZ944UwoA5xRc9+QLpVaNrVh3lQqj8hx59hDJB5ljyJ+0
 rzIuK5pIjHgQcEuAkC6rDC9UMI9sBqQCcXOFkcCaWL/25KWF6o8IvKNoWWRYYfAz4uSw
 k/p7CZOAObTcKW51wlpTi0E6C7uWErH+P1BAF3nKIXZ8dRuC9XcPY/Vg02W6ExyQN6JM
 hD3H7PFrQJnLR6oMFBRyNwNt0bx5QwGLxUvLWDHle4XzlaZLlwQnNIb/FTjRUArfxD0U
 VrpQ==
X-Gm-Message-State: AOAM533K60kFcdGsJYLvonFN+nCVEbSyPzH6MaaxlGd8v+IqYBoLx7bo
 +p1ranUCgTbxQLK+2kvtFjd/O6lQay8aW0aDcQs=
X-Google-Smtp-Source: ABdhPJyGaaSUm4K/1Z1ekcXcdw6ghOy8irdARQN0sjPb9GGewDmareqf3Qe4B4ZpG2WE8B1kUCUoVXdCRvOb+eKZlf4=
X-Received: by 2002:a62:e50f:0:b029:214:8e4a:ae46 with SMTP id
 n15-20020a62e50f0000b02902148e4aae46mr22977757pff.73.1619523978223; Tue, 27
 Apr 2021 04:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210423182441.50272-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210423182441.50272-1-andriy.shevchenko@linux.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 27 Apr 2021 14:46:02 +0300
Message-ID: <CAHp75VeiHsk15QoG3X-OV8V8jqzCNeKkif9V=cx4nvKVHaKbKA@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] spi: pxa2xx: Set of cleanups
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 linux-spi <linux-spi@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>
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

On Fri, Apr 23, 2021 at 9:25 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Set of cleanups here and there related to the SPI PXA2xx driver.
> On top of them, adding the special type for Intel Merrifield.

Mark, are you accepting patches for v5.14 now, or should I resend
after v5.13-rc1 is out?

(I have few more in my queue :-)

> In v2:
> - cover letter (Mark)
> - drop moving the header in patch 5 (Mark)
>
> Andy Shevchenko (14):
>   spi: pxa2xx: Use one point of return when ->probe() fails
>   spi: pxa2xx: Utilize MMIO and physical base from struct ssp_device
>   spi: pxa2xx: Utilize struct device from struct ssp_device
>   spi: pxa2xx: Replace header inclusions by forward declarations
>   spi: pxa2xx: Unify ifdeffery used in the headers
>   spi: pxa2xx: Group Intel Quark specific definitions
>   spi: pxa2xx: Introduce int_stop_and_reset() helper
>   spi: pxa2xx: Reuse int_error_stop() in pxa2xx_spi_slave_abort()
>   spi: pxa2xx: Use pxa_ssp_enable()/pxa_ssp_disable() in the driver
>   spi: pxa2xx: Extract pxa2xx_spi_update() helper
>   spi: pxa2xx: Extract clear_SSCR1_bits() helper
>   spi: pxa2xx: Extract read_SSSR_bits() helper
>   spi: pxa2xx: Constify struct driver_data parameter
>   spi: pxa2xx: Introduce special type for Merrifield SPIs
>
>  drivers/spi/spi-pxa2xx-dma.c   |  37 +++----
>  drivers/spi/spi-pxa2xx-pci.c   |   4 +-
>  drivers/spi/spi-pxa2xx.c       | 190 +++++++++++++++++----------------
>  drivers/spi/spi-pxa2xx.h       |  52 ++++-----
>  include/linux/pxa2xx_ssp.h     |  42 +++++++-
>  include/linux/spi/pxa2xx_spi.h |   9 +-
>  sound/soc/pxa/pxa-ssp.c        |  16 ---
>  7 files changed, 185 insertions(+), 165 deletions(-)
>
> --
> 2.30.2
>


-- 
With Best Regards,
Andy Shevchenko
