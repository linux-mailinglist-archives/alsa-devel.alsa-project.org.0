Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1850430F157
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 11:59:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A92BD16EF;
	Thu,  4 Feb 2021 11:58:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A92BD16EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612436373;
	bh=QpD22JiDAXInB+bDmjHlntgdF4+3peX6P3h3J9qdNzQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S7FJ10IdeUDygGcn+/5gZyhRbxlXJ0PTJ1ugNnMOKRSk6BnAbVXhM5DsmdEykT5dS
	 ig0uByWsreie3+OgSiw4J+ppSKgpu0kzdKFwwt3fSGzqK3Qup6I9zzsasofdyL+qNC
	 QQkHTFb7qb8/9uerMKw9N1+5nkkDPezZAqoYOLd0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17334F80155;
	Thu,  4 Feb 2021 11:58:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24BA6F80171; Thu,  4 Feb 2021 11:57:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF974F80154
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 11:57:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF974F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Gnt4JV0G"
Received: by mail-wr1-x42e.google.com with SMTP id l12so2998838wry.2
 for <alsa-devel@alsa-project.org>; Thu, 04 Feb 2021 02:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=nocxNX1m/RmA6R84CLxOUSJCE+/r8BYx+U1OCnvydU0=;
 b=Gnt4JV0GxJ1vbcUCH/UT+8kOIyaCBPKS4C1FCFPOEho7+3g889pjnLpaXAgHiy9TKs
 SjeWaUtBp7FTtLzUg47knpAZhhUvOgy3hNUPHNqCG1DZYlAWvJYet/QouFveffmpVuMU
 vLUlidxRLXrUO0Wnbixs+T+zr2cj4YXcI4dp5112q3jny/dF/iWvCKvj6Fd2THnVW13n
 UcEuTgyniZ1LoniSe9hCyMYz+ANb6z4q5YZolF1bsWdu6DN5OeFH++5EylcYULDOsyDd
 ISwqvcJy4DElz339yuKbPNVNy74adJQ0gnyLT5pJhNxqBnJZXN6pQH82p/TKhc4GNKhF
 djDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=nocxNX1m/RmA6R84CLxOUSJCE+/r8BYx+U1OCnvydU0=;
 b=M071SS72YiJ9aZfd6GoU5JjioxD8XitxlVXCZfp9LxedrOAga3RzTtHxVJo8faVd1h
 B0hYkCiQ6qznhlkOK1B1qnHqc3PsfL9AxHkeXzSCi1TqltUQRLcfuqCM5FP3kqDm382K
 MOm/fBU41gcpBlZ3tvlb4+Dc8Gp9ayl1RPwmRBF2Nyrj0xNhQ56OuXJDseUhllRgdgz8
 g/oEInl8HjbzLN9VWt481P/x4XYpmBKep0q8dNPEnYYuOwwQvQQxslQZE968/It6zJmN
 jdogUk8gsFPgPlXQ48PMTWhJ06v8MovavRwViHpxgvYzf38hL9hXizozoYe3e+Olor4D
 23BA==
X-Gm-Message-State: AOAM530KwmagKWkiy+a7GHZPlr0OCT1bRv4pqYU7QL7OhNxfkeZqrCUF
 ds3gaLe/SnGzkotiQvcpkZgT7mlgvDxKOw==
X-Google-Smtp-Source: ABdhPJyPrp1TNZvAIM6xnfQzKB+NJLudNAYIGYbk6dBD3LYfnADWLY2wVrqxESzEld1Mkr2tXBePWg==
X-Received: by 2002:a5d:6510:: with SMTP id x16mr8388898wru.175.1612436270633; 
 Thu, 04 Feb 2021 02:57:50 -0800 (PST)
Received: from dell ([91.110.221.188])
 by smtp.gmail.com with ESMTPSA id k15sm5688943wmj.6.2021.02.04.02.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 02:57:50 -0800 (PST)
Date: Thu, 4 Feb 2021 10:57:48 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 0/5] MFD/ASoC: Add support for Intel Bay Trail boards
 with WM5102 codec
Message-ID: <20210204105748.GD2789116@dell>
References: <20210120214957.140232-1-hdegoede@redhat.com>
 <249f1a7c-048e-d255-d860-68a97a0092c8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <249f1a7c-048e-d255-d860-68a97a0092c8@redhat.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>
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

On Thu, 04 Feb 2021, Hans de Goede wrote:

> Hi all,
> 
> On 1/20/21 10:49 PM, Hans de Goede wrote:
> > Hi All,
> > 
> > Here is v4 of my series to add support for Intel Bay Trail based devices
> > which use a WM5102 codec for audio output/input.
> > 
> > This was developed and tested on a Lenovo Yoga Tablet 1051L.
> > 
> > The MFD and ASoC parts do not have any build-time dependencies
> > on each other. But the follow-up jack-detect series does have
> > patches depending on each-other and on this series. So IMHO it
> > would be best if this entire series would be merged through the
> > MFD tree to make merging the follow-up series easier.
> > 
> > Mark, if that is ok with you (and you are happy with the ASoC
> > changes) can you please Ack this ?
> 
> I believe that this series and the follow-up:
> 
> "[PATCH v4 00/13] MFD/extcon/ASoC: Rework arizona codec jack-detect support"
> 
> series are both ready for merging. All patches have Reviewed-by and/or
> Acked-by tags now.

I don't think they do.  You're missing ASoC and Extcon Acks.

Not sure why *this* set fell through the cracks though.  However, it's
now on my to-review list.

If I can work fast enough, maybe this series can get into 5.12, but
the follow-up still needs reviews.

It might be best to collect the *-bys you do have and [RESEND].

> I guess it is too late for 5.12, but it would be nice to at least formulate
> a plan for getting this merged after 5.12-rc1 is out. Given the
> interdependencies I still believe that it is best to merge all the patches
> through the mfd tree and then have Lee provide an immutable branch for the
> other subsystems to merge.

Yes, that's fine.

> Mark and extcon-maintainers (for the follow-up series) may we have your ack
> for merging these through the MFD tree ?

Ah, you noticed that too!

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
