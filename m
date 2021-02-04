Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C28730F5C7
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 16:06:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A47611676;
	Thu,  4 Feb 2021 16:05:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A47611676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612451197;
	bh=VcOgdJFGTG+IFtL7ztkCvv/9NV8deY9WTGBtzZQPRmk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kumY/vZ6zANp5PyuC1lj9Wp3gCiRNVWg8M8lj+GXFXLihczhHHoqaBTXfFFFQjDQU
	 xn98DnhbcukQ+GMoVVWh3x9Z8BDOfuUmdVwUGJpjRlSIscV/rw7rliCeh4MVrSmDVY
	 3YrZSoLDSVOYU3HEZPWnTvX97vFIzby/RsJWYj28=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19037F80152;
	Thu,  4 Feb 2021 16:05:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88E53F80171; Thu,  4 Feb 2021 16:05:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1334F80154
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 16:04:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1334F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="umCRXHSv"
Received: by mail-wr1-x429.google.com with SMTP id v15so3900864wrx.4
 for <alsa-devel@alsa-project.org>; Thu, 04 Feb 2021 07:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=iSl2Rcu9DFOJsdwvIuhfSkBsJm6uHIoCbqyE3izD8Ns=;
 b=umCRXHSvpM7g937dntndearYQJY+mUu/ZaxSaUl7Kw/eejgvhdIGVagmnDa1JXv7b0
 iyHPzn4TorRo/SVQTHOLsfCi3aZ1LzQVx0HEN3mePSg0QA3tlEyvaO98nhd03THsTV1N
 /P4OjKNA6tluuP9M5InIi0qkEtYjYHvL4h+HJ7ZERViE8kNDgClo6n6Aza2RTetjsa8r
 IikDheckgcbGLjHB7p3MSTNHi0TdIJfRtxtzzf0RrW/84Kaiq1jVnFebNMxDkb5eqNzh
 wemy/rmFEgFZz2OK2rNAh8SYApsd08VKGjD/C6gtkvxKwL5SRldh5IXUbcIwWvI+dxYG
 2LTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=iSl2Rcu9DFOJsdwvIuhfSkBsJm6uHIoCbqyE3izD8Ns=;
 b=ZqY5cP7uzPwWQRp2jY/aepljKrlLMmKpTGSe4qSL67Xf85p8pTZW1d6UkXEqNrFFo2
 5kQpuCVC9tHElDRbfD8b3uKR5bQkkofyR4iie8C7Lur7J2liIVxE+MBdE21sFNb81ydp
 ZVvuiw5W1TxOLVsOBzHkNSLZGbmtPsNU5miChvJcBM5/WLxQFcAye2aAALL+tadybzV4
 P3c1t67HNcYqFPGEC7/hI7/bX+Az+UnqM2RIIOFEiupDEq8v6BTGqmJgpRTDXbXQERuO
 exwy8akKI4qJCarwlrmlTIvOkNzM8CcQjz/+LckezyOyWOswehZSmEgiyB4U+ykWyGXE
 mr1Q==
X-Gm-Message-State: AOAM5337D/InNjCvkN9YTzoPW9WvWdewWm44Ro8OjVadRlVrX30ZGEjP
 JBktrqRyMjxX/FanbdH/GlOKww==
X-Google-Smtp-Source: ABdhPJzl01vkDs21Nl6eEVqqiXRHlolXUpJeugF2RjwAGsrJOyOZzOm6wNCOL3Ygcx9Ez8et69Y/7w==
X-Received: by 2002:a5d:4492:: with SMTP id j18mr9738199wrq.403.1612451098383; 
 Thu, 04 Feb 2021 07:04:58 -0800 (PST)
Received: from dell ([91.110.221.188])
 by smtp.gmail.com with ESMTPSA id d23sm6335346wmd.11.2021.02.04.07.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 07:04:57 -0800 (PST)
Date: Thu, 4 Feb 2021 15:04:56 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 4/5] ASoC: Intel: Add DMI quirk table to
 soc_intel_is_byt_cr()
Message-ID: <20210204150456.GN2789116@dell>
References: <20210120214957.140232-1-hdegoede@redhat.com>
 <20210120214957.140232-5-hdegoede@redhat.com>
 <20210204135616.GL2789116@dell>
 <20210204140515.GC4288@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210204140515.GC4288@sirena.org.uk>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
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

On Thu, 04 Feb 2021, Mark Brown wrote:

> On Thu, Feb 04, 2021 at 01:56:16PM +0000, Lee Jones wrote:
> 
> > > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> > Applied, thanks.
> 
> While we we were just having a discussion about what to do about this
> stuff...

We were?

This set has all the Acks we need to proceed.  What's blocking?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
