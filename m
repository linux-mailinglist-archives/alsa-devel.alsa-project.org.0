Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8805C312BE0
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 09:35:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B1571616;
	Mon,  8 Feb 2021 09:34:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B1571616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612773339;
	bh=bccaAgfQeK0F46WfliG2FHAR0QnJ1RCGGKqFObtQ3p0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qc6czkaasrCa9I/j8lyvol4Ww9OkVsRIzmeBA3WehT8CJeIiWe5mcExP01U6KDO7j
	 rVVmEuRjXRyCFihzSjkAJpEMkZYB9w1YmFxO2vR4LV4Ca7n/Kv7VVyOBxgtBHU4Od9
	 pE4aBJ7obfBoTRfqitWNp07pAwBbRbagksouT6zc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BDEAF80169;
	Mon,  8 Feb 2021 09:34:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1D4CF8022B; Mon,  8 Feb 2021 09:34:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE72CF8013A
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 09:33:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE72CF8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xRoKiOu2"
Received: by mail-wr1-x42b.google.com with SMTP id b3so16042403wrj.5
 for <alsa-devel@alsa-project.org>; Mon, 08 Feb 2021 00:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=dzjEN7YVqtaqujbmGYSzD3fjsYLPescY0ifkDBXkqLg=;
 b=xRoKiOu2+Jjnk8RdzCfADbsl30nmGTuZ25PnHaVNy9IPtE+SMpyLz05zta/V+TXk2L
 3Snk9K1/beMrfzFOmEGycXni6ruIfzt2A229bO0/ZS6tQXnO/GhQSzhsdsiFJK9E2VBz
 wQ4BCB9Y66TgNvHI+oUt+w879mPpRFGQe4RRjAwR+rrv9vUqy0VtEmRoYePZ4Xngos+D
 oSjF9KHPmbPIIih+toMXyIPOc0eSokDNhtP45NuUJnIZc+4m61nRJSRclrxvzykvYX/n
 F5ydFlQGMWh1pFfQSaFQy1E/hNfpsQuuMQdS66Rvu1GJQHOgz+LHcYNUmfDKCF+wjgLZ
 zjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=dzjEN7YVqtaqujbmGYSzD3fjsYLPescY0ifkDBXkqLg=;
 b=fzNr4nDC3O6cM4g+zM9LbvNdvLyLahVqAXN7hiwkqEPbcFG3Tn1jLjX6Lt6d7smCWS
 1ggcyl19CN1FG9GH3Xq4H//gtISkZkyOtn+tlpQCtz+x1WIwoXkZueXXPVAQGQmw9OVl
 jTcyaP9olZWi9tYhXMJ/sASssC+o1ClmFGSxg1QmoPwZ8cw8eU8mAWWwEoyKcKDnN49U
 UbOCqFIEdrOi06gno7OTvPVuWVdUSoSJU5QsX4Cgy/TIt89jqfJJ3ZQ58Aubua5Clv0s
 Gm6vvi25UYOME1hI/ZSnXmwCQsm+YuAwFePYwaas3sb02jy+HEcbJ7urWaoBcFaQD+PG
 LDNA==
X-Gm-Message-State: AOAM5313R0GUwDY2jmXNJuxn8sxMqCQPufEUPMFKBmYT+lIs1zvnjevN
 LuymD5luHABDy5Zzhy/03DPugg==
X-Google-Smtp-Source: ABdhPJwZGtkWXy3XxqyySRsvK8yAbf1VqsSaowxqAHFyvXDRFGKSdrHBj876+06i47XwvXOOK4AuXQ==
X-Received: by 2002:adf:8b47:: with SMTP id v7mr18339833wra.133.1612773233172; 
 Mon, 08 Feb 2021 00:33:53 -0800 (PST)
Received: from dell ([91.110.221.246])
 by smtp.gmail.com with ESMTPSA id l11sm26193998wrt.23.2021.02.08.00.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 00:33:52 -0800 (PST)
Date: Mon, 8 Feb 2021 08:33:50 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 4/5] ASoC: Intel: Add DMI quirk table to
 soc_intel_is_byt_cr()
Message-ID: <20210208083350.GA4766@dell>
References: <20210120214957.140232-1-hdegoede@redhat.com>
 <20210120214957.140232-5-hdegoede@redhat.com>
 <20210204135616.GL2789116@dell>
 <20210204140515.GC4288@sirena.org.uk>
 <20210204150456.GN2789116@dell>
 <20210204151139.GE4288@sirena.org.uk>
 <20210204154058.GP2789116@dell>
 <20210204194213.GG4288@sirena.org.uk>
 <20210205083416.GR2789116@dell>
 <20210205211101.GL4720@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210205211101.GL4720@sirena.org.uk>
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

On Fri, 05 Feb 2021, Mark Brown wrote:

> On Fri, Feb 05, 2021 at 08:34:16AM +0000, Lee Jones wrote:
> > On Thu, 04 Feb 2021, Mark Brown wrote:
> > 
> > > On Thu, Feb 04, 2021 at 03:40:58PM +0000, Lee Jones wrote:
> > > > On Thu, 04 Feb 2021, Mark Brown wrote:
> > > > > On Thu, Feb 04, 2021 at 03:04:56PM +0000, Lee Jones wrote:
> 
> > > > > > This set has all the Acks we need to proceed.  What's blocking?
> 
> > > > > There's the subsystem maintainer...
> 
> > > > I assume that was a question and you meant "where's"?
> 
> > > > Pierre is listed as the Maintainer.
> 
> > > I'm fairly sure you can see what I meant here and why there might be a
> > > concern.
> 
> > So that should be a Reviewed-by and not an Acked-by then.  That's fine.
> 
> No, it's that there's plenty of drivers like this that are listed in
> MAINTAINERS but still generally go through subsystem trees - this is
> also true of for quite a few MFD drivers, you tend to get a bit annoyed
> (quite reasonably) whenever I mistakenly pull MFD changes for them into
> one of my trees without syncing with you.

Driver Maintainers in MFD don't sent Acks.

> > What do you want to happen with this set then?
> 
> > You want it broken up?
> 
> I guess, or at least a pull request so it's in my tree and I'll notice
> any coverage issues.

Okay, I'll process it.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
