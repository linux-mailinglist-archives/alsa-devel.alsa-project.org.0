Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0477BEE0A
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Oct 2023 00:05:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8847EEEB;
	Tue, 10 Oct 2023 00:04:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8847EEEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696889103;
	bh=YLoht3xeCBXArzK27CK3iN9FT5xEkhsPIqQXKQLp84w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f4mTlFfGQXLfwHqToTtHXfG2PZ72S8ufZ58K3n2sg4C+SDv9lu/weN31SagVdMXRb
	 SmVX3CHw6eX8SdAiSeujUtyRsAzifyapfzmA5L/iIFaDMqZmUETMrSLHyMklSnjHxN
	 QDkxR4lPc602lmzn/UH5yywEoCMa0Xsv3P5/bJpA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13C89F80130; Tue, 10 Oct 2023 00:04:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7A92F8027B;
	Tue, 10 Oct 2023 00:04:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA2CDF802BE; Tue, 10 Oct 2023 00:04:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2153DF8019B
	for <alsa-devel@alsa-project.org>; Tue, 10 Oct 2023 00:04:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2153DF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=kdAoxgaG
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-690bf8fdd1aso3630605b3a.2
        for <alsa-devel@alsa-project.org>;
 Mon, 09 Oct 2023 15:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696889039; x=1697493839;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ys7O5oFEmO1QCviYjPEYrUnc2jO2bomITSGGcdISQfo=;
        b=kdAoxgaGf7EVIachbFh8y8VXKRuowTrC+q0RT1JarV62oZLNIQIHwe+oQkWfmV8MYn
         KYtpiVIAccdmt/bdE2jklrn4+wIe+Bicx67shHhOMwYn4INEInheMi0thh9DJ0Ddvur4
         0rYawPwYCMRYAuZG3xJ0thYlHvLSX6UhRDC1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696889039; x=1697493839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ys7O5oFEmO1QCviYjPEYrUnc2jO2bomITSGGcdISQfo=;
        b=PDwrKomqajHI+CVvukO+/ToEICGfJmwMKljY01H3mieQx9oWRX3YP6t1iAeBajxD16
         FmDL6X8K7amhitz4VXIjJYDB5IuMIKhPwLnhdAQ6G985euNIqAkmdUzYWV1ttWGgk53j
         SEGmsnwHNN2NcsACsdQ9Rms0sRIIl6e5Ad9t+wzZcodE5Z5Zdh99eIJavG5Tybj1AqSm
         joUhMaaLYabb8U1Wt09kIKN/2X0rvhGjfw91rtu6Enk0sEzXdU86HHveg1dFp7vO4NYi
         7VDCAbI8AM64hpcw7W7zjqZBo82mon3Tim6/5yGn9FkONrKy3uB+r1md/spkUtklcidS
         +lww==
X-Gm-Message-State: AOJu0YyMLDButi8xaSY3iQvwqCd/OiLf8yuGHyrm/HbD6opwf+S5xNKn
	5NL/lQBWvhU3woVRG3pCR9jmI4tAR/GdMAyaMC4=
X-Google-Smtp-Source: 
 AGHT+IFjPnCNTHgmoj8ii2/P0s9nH6rj/IoWKH7/YKY4P8GJP1oGAXAR6Ca7aG9HVdB+DAVpWTaDCg==
X-Received: by 2002:a05:6a21:338c:b0:159:e0b9:bd25 with SMTP id
 yy12-20020a056a21338c00b00159e0b9bd25mr16823979pzb.57.1696889039248;
        Mon, 09 Oct 2023 15:03:59 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id
 x5-20020a656aa5000000b0059b64b153fcsm120296pgu.17.2023.10.09.15.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 15:03:58 -0700 (PDT)
Date: Mon, 9 Oct 2023 15:03:56 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] ASoC: sigmadsp: Add __counted_by for struct
 sigmadsp_data and use struct_size()
Message-ID: <202310091503.E59363D14@keescook>
References: <ZSRvh1j2MVVhuOUv@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSRvh1j2MVVhuOUv@work>
Message-ID-Hash: UKEG6N4UDGVD3HKEP26S6U4HQZBXV3ZF
X-Message-ID-Hash: UKEG6N4UDGVD3HKEP26S6U4HQZBXV3ZF
X-MailFrom: keescook@chromium.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UKEG6N4UDGVD3HKEP26S6U4HQZBXV3ZF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Oct 09, 2023 at 03:24:23PM -0600, Gustavo A. R. Silva wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> While there, use struct_size() and size_sub() helpers, instead of the
> open-coded version, to calculate the size for the allocation of the
> whole flexible structure, including of course, the flexible-array
> member.
> 
> This code was found with the help of Coccinelle, and audited and
> fixed manually.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  sound/soc/codecs/sigmadsp.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/codecs/sigmadsp.c b/sound/soc/codecs/sigmadsp.c
> index b93c078a8040..56546e2394ab 100644
> --- a/sound/soc/codecs/sigmadsp.c
> +++ b/sound/soc/codecs/sigmadsp.c
> @@ -43,7 +43,7 @@ struct sigmadsp_data {
>  	uint32_t samplerates;
>  	unsigned int addr;
>  	unsigned int length;
> -	uint8_t data[];
> +	uint8_t data[] __counted_by(length);
>  };
>  
>  struct sigma_fw_chunk {
> @@ -270,7 +270,7 @@ static int sigma_fw_load_data(struct sigmadsp *sigmadsp,
>  
>  	length -= sizeof(*data_chunk);
>  
> -	data = kzalloc(sizeof(*data) + length, GFP_KERNEL);
> +	data = kzalloc(struct_size(data, data, length), GFP_KERNEL);
>  	if (!data)
>  		return -ENOMEM;
>  
> @@ -413,7 +413,8 @@ static int process_sigma_action(struct sigmadsp *sigmadsp,
>  		if (len < 3)
>  			return -EINVAL;
>  
> -		data = kzalloc(sizeof(*data) + len - 2, GFP_KERNEL);
> +		data = kzalloc(struct_size(data, data, size_sub(len, 2)),
> +			       GFP_KERNEL);

Since len was just size-checked before the alloc, size_sub() is a bit of
overkill, but it's not technically wrong. :P

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
