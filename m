Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC17E1B4D
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 14:52:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A0A8166C;
	Wed, 23 Oct 2019 14:51:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A0A8166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571835167;
	bh=Q4aW7ZqHXkSCM9bArD2tjL5cR7dYmwQuztP8VHuDaak=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sDpIK28uvvgTf0RmNGCrO8C6yKcD7cCBmLNIw7G70Q+Om0+qpeGtPUS0Da57tt/6g
	 8NtOQQgTCWpBMy3qrwzdFhO1Xicld8aDA5vQHQOxSrffUaXHuy8JGMSqA52Lv5AWoU
	 KLCDEFglGx8lvsLM5VcwlW8pTC9hEkW4Ju70Fy1k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDD4FF80368;
	Wed, 23 Oct 2019 14:51:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C854F80368; Wed, 23 Oct 2019 14:51:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95878F80274
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 14:50:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95878F80274
Received: by mail-ed1-f68.google.com with SMTP id c4so15668359edl.0
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 05:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oT2q812vkwR6lQz5u4dP7bLM7jh35Rq8yHei8+lOv9w=;
 b=DHwgjVrzGy4EaDBB2XfkzgEnaGM1zda7ZHVbgkV4+qdO1gcyelrdclnF/DeCNNEeNb
 j02Re3kCkzum5SzpbA/gbE4x1q7SOC5Krwn3BRmjr6cGYt1AUNIiW+zPRsgeM1UJc0KW
 6aSW7ZOysgmeDlvBzYs8DuJp5yhwxpot5hksHBYlaEFeXJ2DQ48JuAZ34DkpQkAV8xRF
 LtEOoBH4k4ZXeO0E+Rwa7Sziq7zpdF2MaNOpiqF3Xhhda4fCBkX7TC1GxKH8DeFltQzx
 0LD3rwnQ0aiG2iHEV4cSX6nMZLCujpc9oIu72ro0+FVGXK9mXKJmcXnJ+IeV5QFTMGKw
 CY3g==
X-Gm-Message-State: APjAAAVd2/3Li4zgpvzAqtAZDDSPN6qyZWqoKhDQWO+iJhOSeB8AwGra
 U14SLFrmsVCky5sCSjc+CYY=
X-Google-Smtp-Source: APXvYqzLq1IwwtENOWtlyqBj9T2iqCV94L/4HoNoJFxSLjEVDtlX9NMAHQ1sSA9Bd3uXFYj6DR034w==
X-Received: by 2002:a05:6402:88c:: with SMTP id
 e12mr23305215edy.170.1571835056324; 
 Wed, 23 Oct 2019 05:50:56 -0700 (PDT)
Received: from pi3 ([194.230.155.217])
 by smtp.googlemail.com with ESMTPSA id i63sm780337edi.65.2019.10.23.05.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 05:50:55 -0700 (PDT)
Date: Wed, 23 Oct 2019 14:50:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20191023125053.GF11048@pi3>
References: <20191010202802.1132272-1-arnd@arndb.de>
 <20191010203043.1241612-1-arnd@arndb.de>
 <20191010203043.1241612-21-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191010203043.1241612-21-arnd@arndb.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-samsung-soc@vger.kernel.org,
 alsa-devel@alsa-project.org, Sangbeom Kim <sbkim73@samsung.com>,
 linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 21/36] ARM: s3c: move iis pinctrl config
	into boards
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Oct 10, 2019 at 10:30:05PM +0200, Arnd Bergmann wrote:
> The s3c_gpio_cfgall_range() function is an internal interface of
> the samsung gpio driver and should not be called directly by drivers,
> so move the iis pin initialization into the boards.
> 
> Note that the s3c2412-i2s driver has no boards using it in
> mainline linux, the driver gets selected for the jive machine
> but is never instantiated.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-s3c24xx/mach-gta02.c    | 4 ++++
>  arch/arm/mach-s3c24xx/mach-h1940.c    | 3 +++
>  arch/arm/mach-s3c24xx/mach-mini2440.c | 5 +++++
>  arch/arm/mach-s3c24xx/mach-n30.c      | 5 +++++
>  arch/arm/mach-s3c24xx/mach-nexcoder.c | 5 +++++
>  arch/arm/mach-s3c24xx/mach-otom.c     | 6 ++++++
>  arch/arm/mach-s3c24xx/mach-qt2410.c   | 3 +++
>  arch/arm/mach-s3c24xx/mach-rx1950.c   | 3 +++
>  arch/arm/mach-s3c24xx/mach-rx3715.c   | 4 ++++
>  arch/arm/mach-s3c24xx/mach-smdk2410.c | 5 +++++
>  arch/arm/mach-s3c24xx/mach-smdk2413.c | 4 ++++
>  arch/arm/mach-s3c24xx/mach-smdk2440.c | 6 +++++-
>  arch/arm/mach-s3c24xx/mach-vstms.c    | 6 +++++-
>  arch/arm/mach-s3c24xx/simtec-audio.c  | 6 ++++++
>  sound/soc/samsung/s3c2412-i2s.c       | 7 -------
>  sound/soc/samsung/s3c24xx-i2s.c       | 7 -------
>  16 files changed, 63 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c24xx/mach-gta02.c b/arch/arm/mach-s3c24xx/mach-gta02.c
> index 526fd0933289..1ca0460d82f4 100644
> --- a/arch/arm/mach-s3c24xx/mach-gta02.c
> +++ b/arch/arm/mach-s3c24xx/mach-gta02.c
> @@ -540,6 +540,10 @@ static void __init gta02_machine_init(void)
>  
>  	i2c_register_board_info(0, gta02_i2c_devs, ARRAY_SIZE(gta02_i2c_devs));
>  
> +	/* Configure the I2S pins (GPE0...GPE4) in correct mode */
> +	s3c_gpio_cfgall_range(S3C2410_GPE(0), 5, S3C_GPIO_SFN(2),
> +			      S3C_GPIO_PULL_NONE);

This is not entirely equivalent move as before this was probe (so being
executed also on rebinds) and now it is init. I guess it should not make
any difference so let it be.

Best regards,
Krzysztof

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
