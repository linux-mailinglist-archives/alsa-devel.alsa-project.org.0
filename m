Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E881BD58A
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 09:17:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21DE9168C;
	Wed, 29 Apr 2020 09:16:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21DE9168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588144668;
	bh=RAKuoQIfdcc/UC82IjYmcHsu5QvOicE6iClMRB3G2X4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IWTvsq0h6QlYb3X9ccgUJX7vfEFiVfZ8ZiVAvBmWGjdIFj0ZHWcNhr5alnaaEnhtg
	 WKiuhosluuWiitarkoCofPHSu7jnctXl9cAvQgmXgyCIEKTRAXgT3JJMP74m5e7D7G
	 uTaVkZRokXqx9ovDxzJqNHd1MHioxcuuT+owqm4o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43A33F80217;
	Wed, 29 Apr 2020 09:16:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D3D5F8022B; Wed, 29 Apr 2020 09:16:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BE1FF80109
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 09:15:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BE1FF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="GH4EWzGO"
Received: by mail-wr1-x444.google.com with SMTP id b11so1163116wrs.6
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 00:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=s7R4+bePxKlabVPpFBITsjKfStI3nEAUf2UOkiFno54=;
 b=GH4EWzGOe8RRh5tsgYno8jCZAkddtKCXTHS1m3yl7fQ+4NKt0g+PrVGf82frmw8iKl
 N+q3vfWwP5PPUHwsk2gmo0T9I2o6XsARZCFVfKvS/4aBlPYhYe5FUf0u1OEnHFZLBK/p
 lNnshae4PeebL2my9Ocn2J+xDhwX7Gz1iPlLmud/ZMAcUGVFJFYF6evbchwm8iwt9/mb
 /nYVCjFYkssRhdu3+25LC63wxryG7yABZ1eqhs5FZlPU3fQ5VtJGxyhzVFYohtLda3gP
 1RNGshKrilDAUMU5OM7CCY6EigpKYcz4EoqqyJa0e/41tylu2QZY/OOA5jup8cdqyh/I
 x7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=s7R4+bePxKlabVPpFBITsjKfStI3nEAUf2UOkiFno54=;
 b=nLGmwoIgTzKnZOwEm2l7wTcu85jLYYgjkCi09eQD7uqVARdydxzWVHia5qMKEN/41j
 C0RpRaq504dk+2qXAvIVcXJkHyE6ccRDf1mynuREYGudCowaVjajyawLekfOrZhWyizb
 O9gNw4yKquYYSl8wFkt1WKoCEFT1KUJzz6yFxJAKFguPXWnCfibs6NSgdAsLdXjtXPNa
 DVqiEMLeCShVSUYN9Eb5unwDITvgEU+KDxt+GVCkS5fk5K07m87b5nTA3JK8plzyzGOD
 UZXPuTFwvY3RkjVdAL2ol+++4DfGIY/MYewe9izyjW930nQHlE0iECucDyyTyrNsKg2w
 mfWw==
X-Gm-Message-State: AGi0Pubu+O7hYGUTQiQYLXhMTyesJHivrJD6A/BoPEehlNIrVu1b1ljC
 CsjNljvHxdZ3hUwlW3Hq0A+VYw==
X-Google-Smtp-Source: APiQypIxPrWKn+sWAYVxC4qIaHDqaWSjaUEw9shmYSoUSX1typND6hX5WdtJ3rxd3akJze/lgOcvxw==
X-Received: by 2002:adf:e944:: with SMTP id m4mr36984777wrn.366.1588144556218; 
 Wed, 29 Apr 2020 00:15:56 -0700 (PDT)
Received: from dell ([2.31.163.63])
 by smtp.gmail.com with ESMTPSA id h1sm6924529wme.42.2020.04.29.00.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 00:15:55 -0700 (PDT)
Date: Wed, 29 Apr 2020 08:15:53 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 4/4] ASoC: wm8994: Silence warnings during deferred probe
Message-ID: <20200429071553.GW3559@dell>
References: <20200427074832.22134-1-m.szyprowski@samsung.com>
 <CGME20200427074843eucas1p1a3a265df0c7f14b0aaec25eb65daf606@eucas1p1.samsung.com>
 <20200427074832.22134-5-m.szyprowski@samsung.com>
 <20200427112202.GB4272@sirena.org.uk> <20200428103638.GP3559@dell>
 <20200428111413.GD5677@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200428111413.GD5677@sirena.org.uk>
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
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

On Tue, 28 Apr 2020, Mark Brown wrote:

> On Tue, Apr 28, 2020 at 11:36:38AM +0100, Lee Jones wrote:
> > On Mon, 27 Apr 2020, Mark Brown wrote:
> 
> > > This completely eliminates the diagnostics which means that if the clock
> > > isn't there the user is a bit stuck trying to work out what's missing.
> > > There should still be a diagnostic.
> 
> > The driver won't defer forever though.  The final pass should fail
> > with a different error.  At which point the error will be released to
> > the system log, no?
> 
> One of the really common cases is that someone forgot to build the
> driver for the dependency so it'll just defer forever waiting for
> something that never loads.

Need to find another way to identify these failures.  There are 10's
if not 100's of cases of silently returning if -EPROBE_DEFER is
caught.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
