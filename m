Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 349D6381290
	for <lists+alsa-devel@lfdr.de>; Fri, 14 May 2021 23:05:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A32BD1755;
	Fri, 14 May 2021 23:04:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A32BD1755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621026348;
	bh=azr0uuglU7QwbwIqk9cdJBOwGa7z4toppWA9VvI6ZCA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JDyonV/3hrzThD4kk1L2bl5FqsixqDqwIcY/I0YRah/QH6HriH+SPhtW8pl1/OF51
	 NNyEd43weVa4ss9xzhNzj8FdV1augxZXauqBEec085IL9oMxP2tvEazpSu6nCx0dOo
	 VErpt5Ca02DRI1y46JwY2nuc+5oCq2kcmY/1hL9o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F3C1F8026B;
	Fri, 14 May 2021 23:04:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67574F80240; Fri, 14 May 2021 23:04:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7C03F800BF
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 23:04:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7C03F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gmg0uTvE"
Received: by mail-oo1-xc33.google.com with SMTP id
 o66-20020a4a44450000b029020d44dea886so163132ooa.5
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 14:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kPsrSGNLOizkCAKBiLnRmnyslOtMn2HPUetpjlj9ass=;
 b=gmg0uTvE+oR8hGseo5ZXul0Xt/uIiy78Qxwtv8aEV3EB41+Qmff2E8JFEaRU9rI8Se
 IfsVub1vxb/n/MBUcO+LpUmSZpdACFIdBeF4FCD0klz8/NEF6HhFmCCYg9dV27wVkXk4
 qYqoG0RcPpDdf/FVb9uYPL/6GeAsO64kz0msN2bG8S4RfwC5gt1nWypSUF0gA04rYnsf
 5CTmWJwLtAEdjDMLmmcpCW6PufLWt97gqiNHJjpvDjjUN2rYu8zX71cRyHvTcfCoU3MZ
 aup/3LoYV+7gzA8VW1kSKqvLMoEUbKPLnjj6MZNiNJ/tl7SARhjILFjjsnW4OWfsSS7Q
 j0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kPsrSGNLOizkCAKBiLnRmnyslOtMn2HPUetpjlj9ass=;
 b=JnF1oMaWBhibkOS1NoA8H7HlgoWiSkUvPUb7er4MBmZzmg9GVCmEiKjAXXsEfzZGR/
 muNDVkc91dv15Q0j5KMZPPucT4Rx4pe7cu60uzbG9eQPHNy8nqcZJpT0KGNk5nPHIKUZ
 SMpSY0LcHyCDEYCtzHUdXeUJXx//qAOSni/v2PzhTJZ/Rx7qdJVCZlVVyjvDC/t86iYd
 lwe8nh7hZXVbksrLHPjWOG4txV+Lv0adMF1Jif9kE6JkErmimAihoB/oxsilhTQIRAyG
 Ws6Add8/fqYJwDsqaW252vdzNn6hdTQdNrcxMsDyVJx+/AREZySohr3THaTxGE9oJlzB
 6TUg==
X-Gm-Message-State: AOAM531Z17Z6QuipHXE0R0ew2jle3UZjxfCEuSb4/LEL/CXmgDvOFHh2
 zG4SISC9U5j9qSgxK89Skyk=
X-Google-Smtp-Source: ABdhPJywA71X32l+efBN953nFSTeFQ8QaU2Msij6JPHZaQjR/Bplli3+ys66OBToEQLSKLHrVZXbNg==
X-Received: by 2002:a05:6820:611:: with SMTP id
 e17mr11158941oow.0.1621026251826; 
 Fri, 14 May 2021 14:04:11 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id c95sm1492964otb.80.2021.05.14.14.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 14:04:11 -0700 (PDT)
Date: Fri, 14 May 2021 16:04:09 -0500
From: Chris Morgan <macroalpha82@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v10 2/4] ASoC: Add Rockchip rk817 audio CODEC support
Message-ID: <20210514210409.GA4597@wintermute.localdomain>
References: <20210514171940.20831-1-macroalpha82@gmail.com>
 <20210514171940.20831-3-macroalpha82@gmail.com>
 <20210514174958.GC6516@sirena.org.uk>
 <20210514183324.GA20917@wintermute.localdomain>
 <20210514195835.GD6516@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210514195835.GD6516@sirena.org.uk>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 heiko@sntech.de, devicetree@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, jbx6244@gmail.com,
 lee.jones@linaro.org, maccraft123mc@gmail.com
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

On Fri, May 14, 2021 at 08:58:35PM +0100, Mark Brown wrote:
> On Fri, May 14, 2021 at 01:33:24PM -0500, Chris Morgan wrote:
> > On Fri, May 14, 2021 at 06:49:58PM +0100, Mark Brown wrote:
> 
> > > > +	if (!node) {
> > > > +		dev_err(dev, "%s() dev->parent->of_node is NULL\n",
> > > > +			__func__);
> 
> > > There's no need to fail the probe here, you won't be able to read any DT
> > > properties but that shouldn't stop the driver binding.
> 
> > If I'm not mistaken this is actually telling us to fail if the parent
> > device (the PMIC itself) isn't present. I think I'll remove this as not
> > necessary since if the parent node isn't present the mfd driver will
> > never load, meaning this driver will never load either.
> 
> So it is - I edited incorrectly when I went to reply.
> 
> > Below this line however we're failing if the codec node isn't present.
> > Are you telling me we want to bind the driver if the node isn't present
> > (such as in the edge case where the driver is present and the PMIC is a
> > rk817, but the CODEC is not in use)? I will remove the return code if
> 
> Yes.
> 
> > you think that is what needs to be done. My concern there though is if
> > we do that we'll either be in a position to again report a bunch of
> > errors for the edge case of users who want to use the PMIC but not the
> > codec (in this case missing clocks and whatnot) if we try to bind the
> 
> Why would there be any errors?

There won't be here. I'm thinking of the edge case where a user has
this driver but doesn't want to use this hardware again, but I'm
getting scatterbrained and thinking overall and not in the context of
this one section.

Once I remove these lines the last place for an error to occur is when
fetching/activating the mclk in the main probe function. A user who is
trying to use this hardware would want to get an error associated with
a missing clock or one that couldn't be activated, whereas a user who
does not want to use this hardware won't care. How do you think I
should handle that?

I'm assuming if the clock isn't present or working that's where we'd
want to stop the driver, since without the clock it's useless. I'm
thinking if the clock is not present we should simply exit out and drop
a dev_dbg message to aid in troubleshooting when someone wants to use
this hardware but forgets to define their clock. However, if either the
clock is present but fails to activate or the codec fails to register,
that should probably give an actual error message (and still prevent
the driver from binding successfully).

So I'll clean up the rk817_codec_parse_dt_property to not check for a
parent node (useless), and remove the return values from it since
neither of the remaining conditions should cause the driver to fail to
probe. I'll also remove checking for the device parent in
rk817_platform_probe, since its' not necessary. If you think it's the
best solution I'll then change the clock dev_err to a dev_dbg, and
leave everything else the same.

Thank you.
