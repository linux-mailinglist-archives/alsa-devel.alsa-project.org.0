Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33359217F9C
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 08:33:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C14D5165D;
	Wed,  8 Jul 2020 08:32:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C14D5165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594189979;
	bh=ukl7KkBY26OZrWu4oNczxbvvnhszz/xkGlAlanUBzqc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pYS9zOUUDmBVTWUkDyRWYMnLLc1JcR52ljk8GEOLt7bb9yPdT5b+jE5OCJbF5vU1K
	 1GFP5lgapLiEG+RW9WQ2EYb2Jk8JZQqTWy9k6nFT4Ke+G/AygvRw26kahUnwd1WTxo
	 SM5YUN9lyGfWdLP/a28+XVY7ujmxLm5VRn/7h7EA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5B39F8015A;
	Wed,  8 Jul 2020 08:31:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9330CF8015A; Wed,  8 Jul 2020 08:31:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2CE1F800AE
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 08:31:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2CE1F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="kJXsGxGo"
Received: by mail-wm1-x342.google.com with SMTP id w3so1686114wmi.4
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 23:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=2Aqu7Lfs/p1g3htA0z8+2+r80uB3BtErHJ01UrBErAg=;
 b=kJXsGxGok52j7OoAzeFqK8zHhMkU5Rx/9OpwwjyMMVBes0uf48M4BIqXoNq+StaDxV
 kaqnWrhzXsAjVwMdXkFT/Td3/QgOHZwDiMjdKmgCDd7guGvwl1aK3v9wHRbiA6emaPT6
 yFqZubCfSupYaefseIzfXLkQgCza+ijrC8mziana0BplhA35YkTDkBEyQ2kMGtjyGshx
 pqGyJyXABUb7gQUjBKPZpJXJKTPRrqh3czsg96y9gpoabkrNpqlvyA0Scg0gRaoMTUQH
 5pMV3WbW5rQVSiZFPgFnKk2hQqFG7RLVQgjB7YfR6QmjZpBWtWAiow2GjmQ044FeAD/v
 eHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2Aqu7Lfs/p1g3htA0z8+2+r80uB3BtErHJ01UrBErAg=;
 b=b07OtICvO0QxOktsmRZDJADyfzsIBJcmHo+pwhosvrawkUs6RJf/qkxa8EK9h7k/y0
 mRDm9yVqTrq7nHbEd+KYWuLN+ywaLfjyIMrdIIc2IF/dk/pdxvT+0GFE1B+eR3/1AqTT
 EeQ4Q8UwOR2KDVpg994m2ZhWp0lSIZl7hcLLBkzKku1ok1c+12zd2v+FJ0x9YBEZcCA6
 tlIFh8pvmuOccEI9DIiNjRAtzez7LuEHLT3JgNDSjdU0+bzargB6/S32LFasBx8hPsC1
 57Ci92Azd3m9YjegmtCsQh4WC6tVN+hCz4DSgTUkGDe/k02RWCMzpXiy8pb0KoApVsHc
 o+hQ==
X-Gm-Message-State: AOAM531gNmUZQPhf4bvoYCqnsjS2dN9osm6G0sxwgto0fMmzaXp74KPg
 DB61C04ugg7z7GNiMKkAkA8FTA==
X-Google-Smtp-Source: ABdhPJxCZf1gERs5lje7p2rtCYKCe0KqPYd1eet733smFfyVtdHvTQ3Iq3RnTFSZKY1WkygeZni8DA==
X-Received: by 2002:a1c:668b:: with SMTP id a133mr7578253wmc.10.1594189863045; 
 Tue, 07 Jul 2020 23:31:03 -0700 (PDT)
Received: from dell ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id c20sm5181182wrb.65.2020.07.07.23.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 23:31:02 -0700 (PDT)
Date: Wed, 8 Jul 2020 07:31:00 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: Clean-up =?utf-8?Q?W?=
 =?utf-8?Q?=3D1_build_warnings=E2=80=8B?= - part3
Message-ID: <20200708063100.GH3500@dell>
References: <20200707192310.98663-1-pierre-louis.bossart@linux.intel.com>
 <1jo8ordshd.fsf@starbuckisacylon.baylibre.com>
 <951676be-fd0a-530a-d57b-d684b93efc70@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <951676be-fd0a-530a-d57b-d684b93efc70@linux.intel.com>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
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

On Tue, 07 Jul 2020, Pierre-Louis Bossart wrote:
> On 7/7/20 2:39 PM, Jerome Brunet wrote:
> > 
> > On Tue 07 Jul 2020 at 21:23, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com> wrote:
> > 
> > > This is a much smaller set of cleanups, all related to warnings thrown
> > > by the use of GENMASK() with an unsigned variable. I just made the
> > > warning go away but I wonder if there's a better fix in the definition
> > > of GENMASK() itself?
> > 
> > Looking at the patch I was going to ask the same thing.
> > It does not make much sense to me to force GENMASK arguments to be
> > integer (instead of unsigned integer) to then check there are positive ...
> 
> Agree, it's just that the following macro isn't exactly simple to change:
> 
> #define GENMASK_INPUT_CHECK(h, l) \
> 	(BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
> 		__builtin_constant_p((l) > (h)), (l) > (h), 0)))
> 
> I couldn't find a means to avoid the comparison.
> 
> I just realized this is a fairly recent addition in 295bcca84916
> ('linux/bits.h: add compile time sanity check of GENMASK inputs'), adding
> the author Rikard Falkeborn in CC:
> 
> include/linux/bits.h:26:28: warning: comparison of unsigned expression < 0
> is always false [-Wtype-limits]
>    26 |   __builtin_constant_p((l) > (h)), (l) > (h), 0)))

Linus recently complained about the type-limits warning, saying that
it was invalid.  He preferred the warning to be bumped from W=1 to
W=2, although I haven't seen a patch doing this yet.

Rikard also tried to fix GENMASK directly; however, Linus did not
approve of this either.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
