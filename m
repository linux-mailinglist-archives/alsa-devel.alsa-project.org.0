Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC97B21FE6A
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 22:18:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84C641665;
	Tue, 14 Jul 2020 22:17:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84C641665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594757885;
	bh=uS4NDf9jdPtYjtRJRo+arMLaIw2/mK3TYB6K9o8nsxE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tyHOHN1ZgtCZyb0KiMFwg3DKjRnJ1fAD2+tmeJ9MGTFTW/Nw6cZKMEFM8XQWZoUbk
	 D6kyNWcAhrIukjgD1vrX+BJqRCJIAel0PnEUFkA1aNDe55unq1aJ4SlWUsGMlQ+Sn0
	 KC7L52w9hlgtFTHJoQ/mmSnfvNrLcUEU1jNQ+FYA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB58FF800E5;
	Tue, 14 Jul 2020 22:16:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85B52F8019B; Tue, 14 Jul 2020 22:16:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53AB3F800E5
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 22:16:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53AB3F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kfJX8RRg"
Received: by mail-pf1-x444.google.com with SMTP id a14so8069509pfi.2
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 13:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=isacsWKlY2hogV7o0KRbs8AppWDN/iG8vIZCQlmiM8c=;
 b=kfJX8RRgL3w39hgg+eFWjqDIkMxIHuOqN9XY3bPq9N9g+jinxvkDkmvu10fWdrWzkF
 rlj0sh1ktttzaUUvdLHwZoHH8IsKgZjFLqMeEeI72DXuRmmKzacsqISPv9e4Z0DGiya2
 mAgSMVnRa6E8vJkyxMhwo1YRkEzY/NJo77QgqcmssBC3+psgls0rwCkY24T/u8BD5MRY
 LHJFfsPB235oyZYh8fmjQHMy6cHGfVaKoXFiYDJSWwgWT1OidYj1sc86fvR5OZS4ThuF
 7pZv+3xlydLI2ndjEph9mpL+1mEeas9+CnOaEMlwyjiIiyEmWdjyzYVjn8GgGH1T9Ec/
 OB5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=isacsWKlY2hogV7o0KRbs8AppWDN/iG8vIZCQlmiM8c=;
 b=tlQbtFKuoQIbtjJPugLd05rEq8l8p0nha3cuCiK8fg40Jm9vPMz9s/MmOSWjziM/H2
 r2zjEKG5lnYhHk6LxZNIwVQH7BXb7VWHjD46dyUgDq7buGY1XT6NkQ0JvI+6ZfdzAbPG
 4b8E0yJC2cLvE6iGmNLJEWHDi3aeUa1jdzoqWYLjOt3wJ8QtJmbvOmSwglOzW6HIbzof
 DiaV27PcFy09jPG/2xBm2ZliL719szc6JbwXsuaBP6htNGMelZutdHsos7boIxHJrjxt
 cXFAIZNVsb5WU7/SvhzEddmAc01FI1Z5zmmkaWQNpIlI6AdFwAyJQgL9dw/qnQcQaGt/
 LJLw==
X-Gm-Message-State: AOAM5339HDio6RIJBYuMUcdXIlwFGW5z1V+nMwdo6CC3mxViTwn0spUJ
 sF5/Jc0lxBy83BSHlbuXT6I=
X-Google-Smtp-Source: ABdhPJz4mHhE+EWHl0+c9gi56UeWi3Y28r21XTa3JlYyq0tBKwdN2h5M4l6Qs7kLwtkNK5cOaciEWQ==
X-Received: by 2002:a63:1a44:: with SMTP id a4mr4796308pgm.281.1594757769130; 
 Tue, 14 Jul 2020 13:16:09 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id e28sm37314pfm.177.2020.07.14.13.16.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 Jul 2020 13:16:08 -0700 (PDT)
Date: Tue, 14 Jul 2020 13:15:45 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Arnaud Ferraris <arnaud.ferraris@collabora.com>
Subject: Re: [PATCH 0/4] ASoC: fsl_asrc: allow selecting arbitrary clocks
Message-ID: <20200714201544.GA10501@Asurada-Nvidia>
References: <20200702142235.235869-1-arnaud.ferraris@collabora.com>
 <20200702184226.GA23935@Asurada-Nvidia>
 <3f39a0bb-a766-f646-28b3-a51cf9983c6b@collabora.com>
 <3fea8912-63df-ff27-0c29-6284a85107ab@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fea8912-63df-ff27-0c29-6284a85107ab@collabora.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 kernel@collabora.com, Fabio Estevam <festevam@gmail.com>
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

On Tue, Jul 14, 2020 at 06:20:32PM +0200, Arnaud Ferraris wrote:
> >>> The current ASRC driver hardcodes the input and output clocks used for
> >>> sample rate conversions. In order to allow greater flexibility and to
> >>> cover more use cases, it would be preferable to select the clocks using
> >>> device-tree properties.
> >>
> >> We recent just merged a new change that auto-selecting internal
> >> clocks based on sample rates as the first option -- ideal ratio
> >> mode is the fallback mode now. Please refer to:
> >> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20200702&id=d0250cf4f2abfbea64ed247230f08f5ae23979f0

> I finally got some time to test and debug clock auto-selection on my
> system, and unfortunately couldn't get it to work.
> 
> Here's some background about my use case: the i.MX6 board acts as a
> Bluetooth proxy between a phone and a headset. It has 2 Bluetooth
> modules (one for each connected device), with audio connected to SSI1 &
> SSI2. Audio sample rate can be either 8 or 16kHz, and bclk can be either
> 512 or 1024kHz, all depending of the capabilities of the headset and phone.
> In our case we want SSI2 to be the input clock to the ASRC and SSI1 the
> output clock, but there is no way to force that with auto-selection:
> both clocks are multiples of both 8k and 16k, so the algorithm will
> always select the SSI1 clock.

Anything wrong with ASRC selecting SSI1 clock for both cases? The
driver calculates the divisors based on the given clock rate, so
the final internal rate should be the same. If there's a problem,
I feel that's a separate bug.
