Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 679479071C9
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 14:40:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB747DE5;
	Thu, 13 Jun 2024 14:40:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB747DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718282456;
	bh=1huBxxS455lFb9lb95aj5aHQLKb1A7Gghj5h9+l71k0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZuhTyjiiSxYG516uHr7h/t4Pm1chD0+pgXkUrF7zXGf99qqq8cGGuvrhGkWYWh7HZ
	 c98Io7Vi+Eryg+QAT2eqS7i8/wA0r9osPVsV7dpYJSWCwd55gc9XQnYITbmkHVvrNb
	 sZN30wBv3yQdkG8ykW/CxCL77iYYu9PsSsML13jg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72FDDF805AD; Thu, 13 Jun 2024 14:40:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4D27F8057A;
	Thu, 13 Jun 2024 14:40:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98608F8057A; Thu, 13 Jun 2024 14:40:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 900CEF80578
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 14:40:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 900CEF80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Fc75JVC1
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ebeefb9a7fso9765491fa.0
        for <alsa-devel@alsa-project.org>;
 Thu, 13 Jun 2024 05:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718282416; x=1718887216;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U3ih0pRkamLgGn89/coTp+mG03B+Ar2meens0mN7r6I=;
        b=Fc75JVC1WKZ2DNHqcbkeBsJfkAEzV/D1H0ZB56QWkQ2XIEFbKf1QEeNH0ea5sGDP3l
         6QH9xLyr8IdH3T2tIw+Gmxd3lL5TVtPoxQntLSDC07I7GNyk+sgoAhGgA+r+TjbZmIrf
         mdoMH/2hfwF2Rj4SBo5vhoT2EGlLW39rJ3GtAHElIr/kxhtG4ogV9yrJ/NudopJOxi6I
         TD9mnfcm5I/T4GpQOF0EInBI9MT72w0cK684bcEzh8fo8zwACxNMbzCheByNDmpivIj1
         7+F0guzmE6jRpMwmy9jfxhAj9bULGNQgABWsSoAqwozhKpW65UnBZl3kq7Lk3iR+2Pn6
         ElBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718282416; x=1718887216;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3ih0pRkamLgGn89/coTp+mG03B+Ar2meens0mN7r6I=;
        b=TfGS8FYNGY4sEKYdP55hE4T3sYYYj8oTdOJ3eXsQKv3cTHwpGT6UfGZN6QwdZGvzoW
         y/clHzCPAjrYoWXhhYjPxq2Cfa9o9crieihXxHk/CDG2yC6rDwWDHBrcDTjw2Dy97jue
         PKAB6NihUAeB/S5cqmoxqRjHljYP3vE0ZZhAXyeTeJKYdw5hNSSimh31A7JxMX8jQY67
         tbdJ+2a3U5QXSi6j57vpMRmU0k6KdFSuBSyxCm8ULLPKjeT9vSDjeZQvnd+nrpqHXR4r
         CdoaYwlmTXZy2MKpb1coZA5/SB9xjD/boEfDV6Kjw89yedHb/NjDbt4qRhurXeW4a5Bf
         ZRaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVahh7Dcgh+Tvpm4KnIz8WSiWMawoAsduUV6HD2FOJ+BtH+KIIW6TEEjF/8ysX0wqF8NLqsnscyGWqjiMtmCtV9VHCjWkWCuVBnIs=
X-Gm-Message-State: AOJu0YyS7s+l7NIB/E5HnJjcxIqOtpsYdLY5NE/gI8Phv7HYvA9kxAo3
	Ez1+a6u52AZAvvpKSIqbKce7skfNDcbDpFOEoFrdstUE62ug87aAjjZm/lE19E8=
X-Google-Smtp-Source: 
 AGHT+IEqq49c8cGicA+OdVdYsOlsGoIcr/1WK+4fWR/h8LRWQ3o9Z/xoaT075/lNiMhPVaQRL6RyNA==
X-Received: by 2002:a05:651c:1258:b0:2eb:dd0b:b9ec with SMTP id
 38308e7fff4ca-2ebfc932783mr26945561fa.20.1718282415951;
        Thu, 13 Jun 2024 05:40:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c05d3csm2060981fa.43.2024.06.13.05.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 05:40:15 -0700 (PDT)
Date: Thu, 13 Jun 2024 15:40:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, perex@perex.cz, lgirdwood@gmail.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
	krzk+dt@kernel.org
Subject: Re: [PATCH v3 0/4] ASoC: qcom: display port changes
Message-ID: <3q77jowqtvnlsrskzbmt627mgoebnkld2tswjaby6tfluadszn@v7vcgkgagyiy>
References: <20240606104922.114229-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606104922.114229-1-srinivas.kandagatla@linaro.org>
Message-ID-Hash: ARWVJB5ZSZUWNCIL6HMAMNVJYARTEYK3
X-Message-ID-Hash: ARWVJB5ZSZUWNCIL6HMAMNVJYARTEYK3
X-MailFrom: dmitry.baryshkov@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ARWVJB5ZSZUWNCIL6HMAMNVJYARTEYK3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 06, 2024 at 11:49:18AM +0100, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> This patchset adds support for.
> 	1. parse Display Port module tokens from ASoC topology
> 	2. add support to DP/HDMI Jack events.
> 	3. fixes a typo in function name in sm8250
> 
> Verified these patches on X13s along with changes to tplg in 
> https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/tree/topic/x13s-dp?ref_type=heads
> and ucm changes from https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/topic/x13s-dp
> 
> x1e80100 is verified by Krzysztof with his changes in tplg 
> 
> https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/merge_requests/7/commits

Together with [1] and corresponding DT changes:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # X13s

Note, patch [1] is required to get the switching between Speakers and DP
work in a stable way, so I'd consider for it to be a dependency for this
series.

[1] https://lore.kernel.org/linux-sound/20240613-q6apm-fixes-v1-1-d88953675ab3@linaro.org/

> 
> Thanks,
> Srini
> 
> Changes since v2:
>  - remove hdmi references.
>  - added more DP jacks
>  - added some comments in code
>  - added x1e80100 patch to this series
> 
> Krzysztof Kozlowski (1):
>   ASoC: qcom: x1e80100: Add USB DisplayPort plug support
> 
> Srinivas Kandagatla (3):
>   ASoC: qcom: q6dsp: parse Display port tokens
>   ASoC: qcom: common: add Display port Jack function
>   ASoC: qcom: sc8280xp: add Display port Jack
> 
>  sound/soc/qcom/common.c         | 35 +++++++++++++++++++++++++++++++++
>  sound/soc/qcom/common.h         |  3 +++
>  sound/soc/qcom/qdsp6/topology.c | 26 ++++++++++++++++++++++++
>  sound/soc/qcom/sc8280xp.c       | 15 ++++++++++++++
>  sound/soc/qcom/x1e80100.c       | 20 +++++++++++++++++++
>  5 files changed, 99 insertions(+)
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
