Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EF63106D3
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Feb 2021 09:36:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 550D49F6;
	Fri,  5 Feb 2021 09:35:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 550D49F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612514161;
	bh=sgpuer02uct1M0Uf7jmui3+iWOIQSgppouxj7yCfZnM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tme2i3jHg8alHYlnCz/NPUS40WW3n0KjOMOWPqWFCO+qhrPpRffToFCyf4bAMlwpi
	 g5bKKR3mLXNazKlbsSVclSNfIzYwO5zyWkjs4REMNH7AY4WHbt9GMww3X4iMVVn7lJ
	 3Xhy1BWEP+wEJyQ+IJHgTYWoZnbEBJhMUDBGneSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92A7DF8016E;
	Fri,  5 Feb 2021 09:34:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75810F8015A; Fri,  5 Feb 2021 09:34:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57926F80139
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 09:34:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57926F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="CTDnrnQM"
Received: by mail-wm1-x330.google.com with SMTP id m1so5223370wml.2
 for <alsa-devel@alsa-project.org>; Fri, 05 Feb 2021 00:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=HHfAd0jRqxl9Kf+Um9ET57/jEyDsj3IKhyTUCMrpEZU=;
 b=CTDnrnQM7qmmnnZvHQPCdGrpgM/joh0kwHoiGqQN3K7HvYA5M7wPDDJeovg1fl+Zn2
 3Lg94szTZ7VrXAb0CgkcbqrHYOmhX5e12lNNCCE7ruWJ/UitZthWhS4y+S0hHkJKgH/T
 A7vIFAbEgka0i9LYWguUIC9rfUWMJ9t0EvwrnQqhcKTA+BI7Kw/LQC5370GUt0VQGlIf
 yZR6fO37+siVbiu2souUX3kW/rF9LLfDyDCJwypUCF/83EyJhjW2WQD4On0uVzdZamND
 5sHNemVh2o/ASn78BzXK/PoYo1VQq16aCqCHlQB7EFwvCQ4N2G8IM0OkTyqwyuKwuLim
 mong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=HHfAd0jRqxl9Kf+Um9ET57/jEyDsj3IKhyTUCMrpEZU=;
 b=NHqIO/RgGEa1wdYPdljTPhebiGnYdAgMGNEbYc2TQA0af62VaE70obP0Lbs/dbrk2Y
 J09zK6BMaqVvZ3X3Zef0QZsxgqfYkQFtqBPZhLx+y5KivoFx+CoPbLJmBi8LkP9KioO5
 BDwWHWVNXgWvmEfZ3zGKc7YFyXld3TcTLH1gcrJZVX+XsNRjfE/6Ywf8NcYSfZ5kPlSB
 xcCSpTdA9JTAdHlUpKsKawakGHfOtSk1BsyYcRUuN72VzFpTcsU5mysVhWAt2b2XLgqt
 FGUxgKetlo+mm08CwNPe4hZf+oSxs6nsW+eqAi9DceoCOlOYkuut5cXQwjDYda8kziXc
 ZuxQ==
X-Gm-Message-State: AOAM532RsSVhWNjwRgyVijLqNlh/v9LKW+8WJhDUQFqrGn3ExuvxMYUd
 nzTj0oiW2gvoy5B1Vhtl8as3jw==
X-Google-Smtp-Source: ABdhPJz17JjsWyci4e4xB1qYeMq8I1U9C4tvNzbHDmfHrivo4QRg3R2AccWKsjN6ESqU/VF+NvlE4g==
X-Received: by 2002:a1c:7c17:: with SMTP id x23mr2616892wmc.65.1612514058703; 
 Fri, 05 Feb 2021 00:34:18 -0800 (PST)
Received: from dell ([91.110.221.188])
 by smtp.gmail.com with ESMTPSA id u4sm10921969wrr.37.2021.02.05.00.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 00:34:18 -0800 (PST)
Date: Fri, 5 Feb 2021 08:34:16 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 4/5] ASoC: Intel: Add DMI quirk table to
 soc_intel_is_byt_cr()
Message-ID: <20210205083416.GR2789116@dell>
References: <20210120214957.140232-1-hdegoede@redhat.com>
 <20210120214957.140232-5-hdegoede@redhat.com>
 <20210204135616.GL2789116@dell>
 <20210204140515.GC4288@sirena.org.uk>
 <20210204150456.GN2789116@dell>
 <20210204151139.GE4288@sirena.org.uk>
 <20210204154058.GP2789116@dell>
 <20210204194213.GG4288@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210204194213.GG4288@sirena.org.uk>
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

> On Thu, Feb 04, 2021 at 03:40:58PM +0000, Lee Jones wrote:
> > On Thu, 04 Feb 2021, Mark Brown wrote:
> > > On Thu, Feb 04, 2021 at 03:04:56PM +0000, Lee Jones wrote:
> 
> > > > This set has all the Acks we need to proceed.  What's blocking?
> 
> > > There's the subsystem maintainer...
> 
> > I assume that was a question and you meant "where's"?
> 
> > Pierre is listed as the Maintainer.
> 
> I'm fairly sure you can see what I meant here and why there might be a
> concern.

So that should be a Reviewed-by and not an Acked-by then.  That's fine.

What do you want to happen with this set then?

You want it broken up?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
