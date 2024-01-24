Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3D083A1A7
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 06:58:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 624253E8;
	Wed, 24 Jan 2024 06:58:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 624253E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706075920;
	bh=3n6qbepBC/quy189WMpUt5s0sJ7FlfcHVamtdO7egM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AUE2HktwB2WZvAMEkqXFm1Cnp3De8AHqoiKQV0JSRaUi5++VF8gkONCA92DAlIjJe
	 yxyVGtyAWRiQHg1WujDtyxUJS9LAzDYSSPkeGZjoCOEEaNTAH8Z0tEv1J5jCL5kFz+
	 +s+oJXek85z6E1Usrqr7KvHKJkBmltyWJw8GpDI8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7AAFF805BE; Wed, 24 Jan 2024 06:57:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF85CF805BE;
	Wed, 24 Jan 2024 06:57:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EED6BF8028D; Wed, 24 Jan 2024 06:56:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A57F0F8003A
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 06:56:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A57F0F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=bQC5JGMJ
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-3bb9d54575cso3551882b6e.2
        for <alsa-devel@alsa-project.org>;
 Tue, 23 Jan 2024 21:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706075782; x=1706680582;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F7SahGLtspE/3Wi9Cd+JOw7KlfpX4OF2RIxiyIP7SV0=;
        b=bQC5JGMJ9gGsXxgzN+kPbvCvqME1EFjj5wVpConbU104wQQQQY5twa7QM5KuEscdGJ
         rQOA3wayio8ZMUxL36rsIS4ws31RRNsVD3vK2LnGAMTMP1kMhgx8LJhglcIfenex3K42
         SiaTInkDvz8G3PX7PUh5hnxwXO2fRRIh/c3rIsFtiuac3ocfiB1biJ4v1UTNaQbGKcTX
         SEdQmF7p+yK8QX/L1l4oCS+8O6WuyT9/bb35qt51cSmva2i3ZW8mldu/CievgggvPB/6
         lVoEtB/Yg1+rvlxhdZU6o2MRAataNMX51IREEcoCu+wCPDtcyHR6jPO2b2C+CjLX3u7P
         VG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706075782; x=1706680582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7SahGLtspE/3Wi9Cd+JOw7KlfpX4OF2RIxiyIP7SV0=;
        b=HHIYUb2PAlCQsAblmCJYFxUnMvO1FfWLM7XIEm4lOd+cdvxYXxQYgqAnd/Rc/aJgxA
         +DyBtaJTHj0/5xaVhbq/CfWwnEzoVvaqfRXCX6XjetliTMBn0kahjrCY9OOWogDNyrEx
         uboD0CRZySA+H6taEjnQVHMJBuU8ThN3m2cKJT6OODsYPmJ5AsD5h5Vvg8VNI3Qj4qT5
         c3Ua/mi9iDt7eHV5zYjPiX95dzQnhWMGFp1MCehA15SFGuZDL0IGQPXmL6uToWllMY9r
         KMJ0vKSbZ/VU4ffqZ3eeIj7Gi+KOGnFz0B1bWdYfJHuWRaLeV8WnKzKAXNkyW1ShaAgB
         7uoQ==
X-Gm-Message-State: AOJu0YxHo/hmVAed7SSL70jFKxGbv9dpwBTJDzV3UaCb/LvjHM3KrFcA
	vZC+8aofOG9UYK7OtOoYYIkZxIuncYoVb4DRDJSD4dwna8cLmwTsfCqo29nhFJE=
X-Google-Smtp-Source: 
 AGHT+IGiCI/sj/mAtB23fTMLULvqgI87+dSZUJXZCXN7hV/stz02CWQa7d9iE2R5I1NHRIlUItj1Gw==
X-Received: by 2002:a05:6808:10c2:b0:3bd:a6ea:1c6c with SMTP id
 s2-20020a05680810c200b003bda6ea1c6cmr1180274ois.116.1706075782222;
        Tue, 23 Jan 2024 21:56:22 -0800 (PST)
Received: from localhost ([122.172.81.83])
        by smtp.gmail.com with ESMTPSA id
 ko18-20020a056a00461200b006dab0d72cd0sm12721062pfb.214.2024.01.23.21.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 21:56:20 -0800 (PST)
Date: Wed, 24 Jan 2024 11:26:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 2/6] cpufreq: do not open-code of_phandle_args_equal()
Message-ID: <20240124055618.5xppexdpvwnv6zng@vireshk-i7>
References: <20240123141311.220505-1-krzysztof.kozlowski@linaro.org>
 <20240123141311.220505-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240123141311.220505-3-krzysztof.kozlowski@linaro.org>
Message-ID-Hash: VKGBLE2MAPNS4CDKIISGK63SVRKVO3JV
X-Message-ID-Hash: VKGBLE2MAPNS4CDKIISGK63SVRKVO3JV
X-MailFrom: viresh.kumar@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VKGBLE2MAPNS4CDKIISGK63SVRKVO3JV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23-01-24, 15:13, Krzysztof Kozlowski wrote:
> Use newly added of_phandle_args_equal() helper to compare two
> of_phandle_args.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Depends on previous of change.
> ---
>  include/linux/cpufreq.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
> index afda5f24d3dd..3cd06dafb04b 100644
> --- a/include/linux/cpufreq.h
> +++ b/include/linux/cpufreq.h
> @@ -1149,8 +1149,7 @@ static inline int of_perf_domain_get_sharing_cpumask(int pcpu, const char *list_
>  		if (ret < 0)
>  			continue;
>  
> -		if (pargs->np == args.np && pargs->args_count == args.args_count &&
> -		    !memcmp(pargs->args, args.args, sizeof(args.args[0]) * args.args_count))
> +		if (of_phandle_args_equal(pargs, &args))
>  			cpumask_set_cpu(cpu, cpumask);
>  
>  		of_node_put(args.np);

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
