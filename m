Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C5D21781C
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 21:41:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E267616B9;
	Tue,  7 Jul 2020 21:41:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E267616B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594150911;
	bh=M43v0gd+uSekS2gQUhCS//g4LNogr/GyDps08IuaxQs=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=leXvxdp/aoq4jKchb8guZXX9tZn0tMBp8ZuFOylTeShYU/ZbV4RwYICUWOJKSMdL5
	 ohb/du9sDAm7L7UO4xMV5zx1g68Ium7lqNnJpyLYbWTyutVo+eSnnmmApEPHZsjpSP
	 K90yweqiWWgqIqsg3Clf/GyG6chsnL0Byb/2QXxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 100BFF800DF;
	Tue,  7 Jul 2020 21:40:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C4FAF80216; Tue,  7 Jul 2020 21:40:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90A34F8011F
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 21:40:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90A34F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="jYK4PQc0"
Received: by mail-wr1-x443.google.com with SMTP id r12so46423177wrj.13
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 12:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=sn/hyqlGHoF7HzKab8KEAFa9SvAmm95QsUFB3rNTFeU=;
 b=jYK4PQc07DGOpduBUmmcgkloEdwV3fsfj6KXw4j8k70nZUZE3muR0K7YfkfqO3PaJ7
 WQfkGsjxGC4mxGK2Jrecw/Dzi0G/c+BddtuyClrM/ibKOQ8CrnQGu6ootLEGmBJk/A6E
 fgsQXbNUCL8LMWWy+LB/Julj8wcEv8gaUGj5wOgWdLmSzdkQGa7Clrr7CBP+Q8qCJ6h1
 VSC8OBvqz117SY5DCw3PEm6VVD4WvaeVPHXDkZ4t9f/EXtMGemrOYFxiX968QvTKzdJW
 iNr67UgUUbBwPTW5VafeOHnRAU/BQCmW0gl+VpksIjCqEd0urgQB2tNgA3gSeTPqiq/r
 CPfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=sn/hyqlGHoF7HzKab8KEAFa9SvAmm95QsUFB3rNTFeU=;
 b=U0NGFlCfz3Rb58recId4w+ftHwtr7oaCWIi41jbwDdyl20VJcNWemAPLIWQGOCvHbk
 P3PlUobknq2lRYgo7B3FYSvg/ohOOr2JwJRE0lZb9jCQSICkXkhDcfbojZzmOx5owvwq
 ++Wu9hHahDIiynjMuqv5QDc0bSXPpTIVeMI2VpgrJNyDColk+UQBnQtkcOFQ8x8GIOv6
 j1SItgM0Gvow3ORVtj2TivgED3WN5nFFbYM2pM5gLwHZMXPRMaXyeXhm5VGRblCfOjzk
 TnnwMu2R0ltNcKpOyLroCbYuQ19Jrz9X4B36K7Cedje1eJ6L8BMLPiJdu8y62vhekqKs
 emoA==
X-Gm-Message-State: AOAM530NTjlWL7a09NFyZY8OCbXlXUtqbzvP71VfMKiCu1EVePH0PJWw
 EY2ioDJBRGblT3bVKFdSSPP4Mg==
X-Google-Smtp-Source: ABdhPJyDAd6tgd/AvndrFnLfOgaQK5G4pYOk3RIapEqzwnwXc74htm13815c4U1/DHlLqZ2IBBDI1g==
X-Received: by 2002:a5d:63ce:: with SMTP id c14mr59198294wrw.254.1594150800370; 
 Tue, 07 Jul 2020 12:40:00 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id u2sm2168807wml.16.2020.07.07.12.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 12:39:59 -0700 (PDT)
References: <20200707192310.98663-1-pierre-louis.bossart@linux.intel.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH 0/3] ASoC: Clean-up W=1 build =?utf-8?Q?warnings?=
 =?utf-8?Q?=E2=80=8B?= - part3
In-reply-to: <20200707192310.98663-1-pierre-louis.bossart@linux.intel.com>
Date: Tue, 07 Jul 2020 21:39:58 +0200
Message-ID: <1jo8ordshd.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: tiwai@suse.de, broonie@kernel.org, Lee Jones <lee.jones@linaro.org>
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


On Tue 07 Jul 2020 at 21:23, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com> wrote:

> This is a much smaller set of cleanups, all related to warnings thrown
> by the use of GENMASK() with an unsigned variable. I just made the
> warning go away but I wonder if there's a better fix in the definition
> of GENMASK() itself?

Looking at the patch I was going to ask the same thing.
It does not make much sense to me to force GENMASK arguments to be
integer (instead of unsigned integer) to then check there are positive ...

>
> Pierre-Louis Bossart (3):
>   ASoC: Intel: Skylake: remove comparison always false warning
>   ASoC: meson: axg-pdm: remove comparison always false warning
>   ASoC: meson: axg-spdifin: remove comparison always false warning
>
>  sound/soc/intel/skylake/skl-sst-dsp.c | 2 +-
>  sound/soc/meson/axg-pdm.c             | 2 +-
>  sound/soc/meson/axg-spdifin.c         | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

