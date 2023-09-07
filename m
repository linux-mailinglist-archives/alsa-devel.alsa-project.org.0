Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF2379A48F
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 09:32:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF36E852;
	Mon, 11 Sep 2023 09:31:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF36E852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694417557;
	bh=md4bvUTX1nPNpkTGazHYCPaSZXO+rkHrP+Y+Kg+Eecg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=clpZVxQvC8ULxAL2b+lG9U5mb9lKP2CVdtGlVzFlIU+PtsCtm0m/4NNx57YFRlOEC
	 G02sNiP47UFQ1ZpSdyDBNa2Hr9KULy9RLPjRYaH2O9Cd48OMjd8CuGYNdnjUDJDrKF
	 RZp6sTANkphTjWUHU/LezyEP08Vp507SS6C4/bfw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94241F801F5; Mon, 11 Sep 2023 09:31:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 663F1F801F5;
	Mon, 11 Sep 2023 09:31:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5206EF80494; Thu,  7 Sep 2023 18:22:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8DF7EF80431
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 18:22:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DF7EF80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=T9x54Mpw
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-400a087b0bfso12405935e9.2
        for <alsa-devel@alsa-project.org>;
 Thu, 07 Sep 2023 09:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694103736; x=1694708536;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V94N1ORYrLaXKL1qzREjQHJ4JwS/WOj3pdtg65MWaAk=;
        b=T9x54MpwxndS1DTYjao1e2H8Dnn11HjaviHXNTEHae2JBiTB+BxDp1rJCDhF+GVXpK
         2qGDUI0LYtJfRLxHRTwrSxSuqEtFVmrAWWDPX0mJIY86DgI4ZwbqXIBsw1giOPXm09b5
         /MJ/eETfwJmLpssBlypkEk0bCdNyNryGrtBP7w17YRmlmTxN+0gPhQ5O5f2xO07WmL7a
         EnrC9L3Jgxe7DJE+pcxehe2u5ARSEmA0utf+2YQswydqgy4zQd4fUXRuFcj0c6zU2g0B
         2FILYWjbER0qKRaUZJ3mI30frrYWigFvXdIWmFV+WsqlHoX+OpEiHWXkXA2MDmyOX15D
         i88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694103736; x=1694708536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V94N1ORYrLaXKL1qzREjQHJ4JwS/WOj3pdtg65MWaAk=;
        b=VHQAgF2fUYXoqWI1EXui2quqHqWcsFKUTdtladPZxmItIcikEaIoW0mfTO6aKo4ZmX
         95EndOoj3mH+MtjMi6YMLCl0tcrT1npBK+3/ztIDGufHR6n2ZxY4vU9fZNjuhj7i5wet
         h3KRYtkcPUsK53aOhzqmH/hnjdIuXDJIY3OuCIKPbtsn7Z7C+GE/qHbDGq2SIMhxqdDs
         cj205TTTZRv+Jx2OTwCBy0ri0RMbFsP8PKyziQoOVFiOY/fy+rvWxJkbwTjFKAPGpqhk
         tAHBTl81Q6K1p28FuvB2TtqNGvo7m/szfvZwcqoXkogdDgWu2w85iADGYBXDV+jIVubT
         rknQ==
X-Gm-Message-State: AOJu0Yzx5f+CXptyF343AJqas65+/4aHDJae2lkbwwIDlgSVD+bPFRrG
	RJF+1L7l/8u0I7SYAMo7pH8=
X-Google-Smtp-Source: 
 AGHT+IFSokuvidPb1pXREVhfaW7eDebj6W9QXi1Pae06YNBdw+btfNaTUKU6LAI1FFxmeA8DOiJk+A==
X-Received: by 2002:a7b:cb87:0:b0:401:cc0f:f866 with SMTP id
 m7-20020a7bcb87000000b00401cc0ff866mr149074wmi.12.1694103735822;
        Thu, 07 Sep 2023 09:22:15 -0700 (PDT)
Received: from ubuntu ([2a02:810d:1640:10d8:bdda:474a:9786:1e73])
        by smtp.gmail.com with ESMTPSA id
 l5-20020adfe585000000b0031c71693449sm23623180wrm.1.2023.09.07.09.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 09:22:15 -0700 (PDT)
Date: Thu, 7 Sep 2023 18:21:50 +0200
From: Joerg Schambacher <joerg.hifiberry@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: a-krasser@ti.com, joerg@hifiberry.com,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Zhang Qilong <zhangqilong3@huawei.com>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: Adds support for TAS575x to the pcm512x driver
Message-ID: <ZPn4nsypsSXdB3J7@ubuntu>
References: <20230907161207.14426-1-joerg.hifiberry@gmail.com>
 <a9c3d43a-af26-44a0-9352-4666107f9f56@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a9c3d43a-af26-44a0-9352-4666107f9f56@sirena.org.uk>
X-MailFrom: joerg.hifiberry@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: EG6TRKJA6DJB2YJPLXFHC4GOCNQT2HPT
X-Message-ID-Hash: EG6TRKJA6DJB2YJPLXFHC4GOCNQT2HPT
X-Mailman-Approved-At: Mon, 11 Sep 2023 07:31:20 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EG6TRKJA6DJB2YJPLXFHC4GOCNQT2HPT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Am 07.09.2023 um 15:21 hat Mark Brown geschrieben:
> On Thu, Sep 07, 2023 at 06:12:05PM +0200, Joerg Schambacher wrote:
> 
> > +		if (pcm512x->tas_device) {
> > +			/* set necessary PLL coeffs for amp
> > +			 * according to spec only 2x and 4x MCLKs
> > +			 * possible
> > +			 */
> > +			ret = regmap_write(pcm512x->regmap,
> > +					   PCM512x_PLL_COEFF_0, 0x01);
> > +			if (mck_rate > 25000000UL)
> > +				ret = regmap_write(pcm512x->regmap,
> > +						   PCM512x_PLL_COEFF_1, 0x02);
> > +			else
> > +				ret = regmap_write(pcm512x->regmap,
> > +						   PCM512x_PLL_COEFF_1, 0x04);
> 
> I would name this quirk something a bit more specific - it seems likely
> that there might be future TASxxxx devices which need different quirks.
> If it's a limited range of MCLK multipliers perhaps something about how
> the PLL is limited, or just make the quirk data being to specify min/max
> for the multiplier?
The spec allows a maximum input Clk of 50MHz. Useful for the concerned
mode are only clocks with 22.5792/45.1584MHz for the 44.1ksps family rates
and 24.576/49.152MHz for the 48ksps. The only thing we need
to make sure is to divide the master clock by 2 in case of a MCLK input
of >25MHz to use the the same settings hereafter.
And yes, we cannot be sure that future devices may require different
settings, but I can hardly imagine anything completely different than
this approach with the usual audio MCLK frequencies.
> 
> > +		if (!pcm512x->tas_device) {
> > +			ret = regmap_update_bits(pcm512x->regmap,
> > +						 PCM512x_PLL_EN, PCM512x_PLLE, 0);
> > +		} else {
> > +			/* leave PLL enabled for amp clocking */
> > +			ret = regmap_write(pcm512x->regmap,
> > +					   PCM512x_PLL_EN, 0x01);
> > +			dev_dbg(component->dev, "Enabling PLL for TAS575x\n");
> > +		}
> 
> This is probably a separate quirk?  I'm a bit concerned about what's
> turning the PLL off here...
The PLL should not be used in this specific case where all divisions are
just divide-by-2's. Your original code does reflect that and turns the
PLL off. It improves jitter and finally audio performance.
But in the case of the TAS-devices we even then need the PLL to
drive the AMP clocks.
My code changes only address the case 'TAS-device and external audio MCLK'.
All other constellations like clock slave mode or e.g. 12MHz MCLK input
require the PLL anyhow. THe 12MHz clock input even requires the FLEX mode
through the PLL using the GPIOs as PLL-in and -out.
I hope I could clarify things a bit.



-- 


