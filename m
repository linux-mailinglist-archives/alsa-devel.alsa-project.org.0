Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7F44679A3
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Dec 2021 15:46:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65F4E2266;
	Fri,  3 Dec 2021 15:45:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65F4E2266
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638542792;
	bh=bX8Vfz6ADmVrRbqPqFvxhNjM5ked0Ex9KxYrlzf87UI=;
	h=Date:To:References:From:Subject:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EiyVxpGWdc1qP1IIipO0KdJX/fjRPJ8ECeWoU5x9V4K6d99DElGc7QNdCELrh/iw/
	 5Ehv3X+BL5iLInCxvTwPQg44HITt5UOs4GRHqt9b4IdN6QCaUEFCHHTJr3SoJe2eOa
	 aScuOUGDr7HC2/8V2kKeGzxiyjzwl9zT/bnb5Qn4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C944AF800A7;
	Fri,  3 Dec 2021 15:45:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 602DDF80246; Fri,  3 Dec 2021 15:45:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, NICE_REPLY_A, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3423EF800A7
 for <alsa-devel@alsa-project.org>; Fri,  3 Dec 2021 15:45:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3423EF800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QRVw533s"
Received: by mail-lf1-x132.google.com with SMTP id bu18so7212944lfb.0
 for <alsa-devel@alsa-project.org>; Fri, 03 Dec 2021 06:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=scZUqwoe/cvKGUS4d3voXFgyPguXwcuU4NvbWZlBd6k=;
 b=QRVw533su6nuyf2yzzNStUibspi0/SQyKG11/j8oyomM7ghfnl7s0ejroE0OL33L+0
 OyTxMd3Z9AXXUY4LeT/eUjMi1wjsS6leS6vEVAdgcgMLwT2YfGVGhNMnN18/0nvo1MkY
 EhmHBsuxQG0NoF9zb+GHNGzC7YhYj/DyvV+U53kIYxkLK+xIv8V3996aNbuLLsdPHkMq
 JS2WqjKHVs1Yw2JE0xTbbL2QxRhY/C2A79oz6hAF49bl9x/JTwqWDhH8vTWqL1lk5JH5
 MkPJR9C+tohlmjA2SnkVB20atly/sLRPRRRBGt+G5exGeq2epNbdq8rDPVeoOc/6J4Ee
 vl7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=scZUqwoe/cvKGUS4d3voXFgyPguXwcuU4NvbWZlBd6k=;
 b=vE/TnQZygu8ge2n99ayY7J21EZ16N2QnmN/Pbb+JuSSkc4XBUXHe+gMnU8n0k5ouAJ
 Xayo1xAuzG3F9zXYqxGBUcIvjEczbRC8nXNWsVgmJ2iZMhmIzF70TniMc6XJZw0aCJNV
 FyIJQBlMCaLs4Z3JilpGNRpfvqp8IO844IfXkGBAMkjd7lRJryeoQ1sv8n7eYwokch/T
 vCb4gIp8i4iiAjmZGNCavdVa3n609iur8xQUTtNizGv6W82Cm4aLNrE2oGTwDsP/3wBc
 kwJHlsn0hdB4ZLtHs7hY2Qnk8GyO61fMMwNu+tWncKCmygtohnYLBanFShC6luItX2kK
 lG6w==
X-Gm-Message-State: AOAM533rr8gs359yGAqdKyXwjQCzpzVQ0krMb4pAv36gRHRpKu2dWcsd
 ii/yiOOmma0y5jijWlGLCxc=
X-Google-Smtp-Source: ABdhPJxM5aAacDM0IWLjqUmhPGQbSAnERAMKy9fh66EWM/b4VlrQzk+6+hv6dA3YgRNZJFp1LpZBow==
X-Received: by 2002:a19:fc08:: with SMTP id a8mr18563847lfi.645.1638542704780; 
 Fri, 03 Dec 2021 06:45:04 -0800 (PST)
Received: from [10.0.0.115] (91-153-170-164.elisa-laajakaista.fi.
 [91.153.170.164])
 by smtp.gmail.com with ESMTPSA id u2sm395546lfi.108.2021.12.03.06.45.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 06:45:04 -0800 (PST)
Message-ID: <1a2831d2-49bb-f1fc-14e8-d6a0d53664cf@gmail.com>
Date: Fri, 3 Dec 2021 16:45:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20211202205612.76216-1-andriy.shevchenko@linux.intel.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Subject: Re: [PATCH v1 1/2] ASoC: ti: davinci-mcasp: Get rid of duplicate
 of_node assignment
In-Reply-To: <20211202205612.76216-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
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



On 02/12/2021 22:56, Andy Shevchenko wrote:
> GPIO library does copy the of_node from the parent device of
> the GPIO chip, there is no need to repeat this in the individual
> drivers. Remove assignment here.

Thanks, looks good,
Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> For the details one may look into the of_gpio_dev_init() implementation.

Which works after commit 1df62542e0161.

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  sound/soc/ti/davinci-mcasp.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
> index 56a19eeec5c7..81c1ccec5904 100644
> --- a/sound/soc/ti/davinci-mcasp.c
> +++ b/sound/soc/ti/davinci-mcasp.c
> @@ -2230,9 +2230,6 @@ static int davinci_mcasp_init_gpiochip(struct davinci_mcasp *mcasp)
>  	mcasp->gpio_chip = davinci_mcasp_template_chip;
>  	mcasp->gpio_chip.label = dev_name(mcasp->dev);
>  	mcasp->gpio_chip.parent = mcasp->dev;
> -#ifdef CONFIG_OF_GPIO
> -	mcasp->gpio_chip.of_node = mcasp->dev->of_node;
> -#endif
>  
>  	return devm_gpiochip_add_data(mcasp->dev, &mcasp->gpio_chip, mcasp);
>  }
> 

-- 
Péter
