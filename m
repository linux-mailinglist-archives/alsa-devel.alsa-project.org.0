Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FC5527F2D
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 10:06:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A07216B0;
	Mon, 16 May 2022 10:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A07216B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652688401;
	bh=k0u+HRBkeRd+OVLZbZUTkf9bFGQwyccJ9MtC+QpTjvE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=flcKqY/jIDDx/EYX0NohfS/OdTlqxihkG+SW31Kyh7HQ7gVzM1mW6FZf+nzD+TC5t
	 jqaEDLlLRem9hTrKcnHZDBduVVD3oYXeuWRqnF6ENvF9LcE1Y+v2FbrtBAzOJ1Yi3J
	 zokZwM1UicQdVPYrN+A1sV9FSJ44kSRHONEqENzQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7C02F80535;
	Mon, 16 May 2022 10:03:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15E5FF80245; Thu, 12 May 2022 12:31:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29EFBF800BB
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 12:31:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29EFBF800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.b="n3ojiDL8"
Received: by mail-ej1-x62f.google.com with SMTP id i19so9250710eja.11
 for <alsa-devel@alsa-project.org>; Thu, 12 May 2022 03:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5MXfcUrY9hOKURYsbrGhzUx93Mf/JygzWXuJTExiX6A=;
 b=n3ojiDL8X/Z3JJpHeZ3KpwcIDtMK9lk+zxRPqOmiw9++VRYDa6HJvSv85Dym9DjNz3
 vpLDn0kYSFCR9bYfcJJrSI+uNVEyPOt0o1tTX7zrbYh0nDoYjdbHZx3Vg8Dgp0W7FnYC
 EAdWgVwLRyYTVlgCxl6Do4Hm0cuSFtuywRt2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5MXfcUrY9hOKURYsbrGhzUx93Mf/JygzWXuJTExiX6A=;
 b=z8Jukd2kpG05GXLtEko4bMcs56c+ak5yMB41WxrvNeTOgymtYvGoCIOTZm0iQRuwUN
 Hzzu4+KLxJ+YTrU9z41Ugm//15HUFsZ+LiByWUA/nZV6IqdPi3OPJpDBb94T9jzyHz7H
 tMGRQhzu2t8MYOI1MJT5P+SGqIBDs/uQEubPmSufHFsO6k4ou03ZWuRkRQNCmLCzEl0j
 dsPaUjDhHJ3+1B7HWCzuYzCMc4X3CX5rtwPB5KsBD1TRFoXIW7f4hFYzQi4D/+i52zcR
 vV7BxlxnE7NV+Ltp1ur1Qwvh5u2NAFcPGvQmdhAeuHAinNaE1HwBBKw79zje25JvNVwB
 Fk7A==
X-Gm-Message-State: AOAM531jl6Sm0VTddVfAqMCLF55Z8lAe0Fmq/p55Wdk1mhg8qFueKlnP
 t/ZkiLcmiOCcW6aIxlcfj3LwHg==
X-Google-Smtp-Source: ABdhPJw3/7SDvQibZnzyAqVT3zem9hMR5ZS5pek6KBOHUgS3MH78W6+hF3SfMcrkHz6sUmfeCF/nXg==
X-Received: by 2002:a17:907:960d:b0:6f4:3b68:8d55 with SMTP id
 gb13-20020a170907960d00b006f43b688d55mr29150808ejc.105.1652351495343; 
 Thu, 12 May 2022 03:31:35 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i
 (net-188-217-59-245.cust.vodafonedsl.it. [188.217.59.245])
 by smtp.gmail.com with ESMTPSA id
 n9-20020aa7c789000000b0042617ba63cbsm2370277eds.85.2022.05.12.03.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 03:31:35 -0700 (PDT)
Date: Thu, 12 May 2022 12:31:32 +0200
From: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: max98088: add support for reg_4a_cfg_bypass reg
Message-ID: <20220512103132.GC649073@tom-ThinkPad-T14s-Gen-2i>
References: <20220512074359.446999-1-tommaso.merciai@amarulasolutions.com>
 <YnzdcubW7m+CwnvN@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnzdcubW7m+CwnvN@sirena.org.uk>
X-Mailman-Approved-At: Mon, 16 May 2022 10:03:51 +0200
Cc: alsa-devel@alsa-project.org, linux-amarula@amarulasolutions.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linuxfancy@googlegroups.com, linux-kernel@vger.kernel.org
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

On Thu, May 12, 2022 at 11:12:02AM +0100, Mark Brown wrote:
> On Thu, May 12, 2022 at 09:43:58AM +0200, Tommaso Merciai wrote:
> 
> > Add mixer controls support for M98088_REG_4A_CFG_BYPASS register
> 
> > +++ b/sound/soc/codecs/max98088.c
> > @@ -486,6 +486,11 @@ static const struct snd_kcontrol_new max98088_snd_controls[] = {
> >         SOC_SINGLE("EQ1 Switch", M98088_REG_49_CFG_LEVEL, 0, 1, 0),
> >         SOC_SINGLE("EQ2 Switch", M98088_REG_49_CFG_LEVEL, 1, 1, 0),
> >  
> > +       SOC_SINGLE("SPK Bypass Switch", M98088_REG_4A_CFG_BYPASS, 0, 1, 0),
> > +       SOC_SINGLE("REC Bypass Switch", M98088_REG_4A_CFG_BYPASS, 1, 1, 0),
> > +       SOC_SINGLE("MIC2 Bypass Switch", M98088_REG_4A_CFG_BYPASS, 4, 1, 0),
> > +       SOC_SINGLE("INA Bypass Switch", M98088_REG_4A_CFG_BYPASS, 7, 1, 0),
> 
> These look like they should be DAPM controls since they're controlling
> audio routing but they're being added as regular controls.

Hi Mark,
Thanks for the review, I'll send v2.

Tommaso

-- 
Tommaso Merciai
Embedded Linux Engineer
tommaso.merciai@amarulasolutions.com
__________________________________

Amarula Solutions SRL
Via Le Canevare 30, 31100 Treviso, Veneto, IT
T. +39 042 243 5310
info@amarulasolutions.com
www.amarulasolutions.com
