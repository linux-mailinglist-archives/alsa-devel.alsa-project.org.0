Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9D391AF51
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 20:50:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7A07211E;
	Thu, 27 Jun 2024 20:50:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7A07211E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719514212;
	bh=+loIEVQbiIvCdpK080P2B2BC20Dlavm8jb2rv/XemnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dL++7myARdiH2yChMRaTO2ZLgn8tG4eExSbZTUATsuUjqgQKhXHyEK6zUJ+39Pd++
	 kGKU6TVxapFGqmqDBh76r0H6SPwJp9Pdye1zNJF7sFXNQANgWXpqt2DlEyadL927Y0
	 53/kuSev27yGZysikIb9Z2VfAGWe78Bo/PWL5uz0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D2E6F805BD; Thu, 27 Jun 2024 20:49:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A492BF8049C;
	Thu, 27 Jun 2024 20:49:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 355C5F80423; Thu, 27 Jun 2024 20:49:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3782EF8013D
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 20:49:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3782EF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Qj+yOyuP
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52cdd893e5cso6567441e87.1
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 11:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719514164; x=1720118964;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dVlORxLyi+No4z6mzakpdO+uVb1Q8CeU42Yrc8ZopLA=;
        b=Qj+yOyuPNSlkShgDtfoaNY4dQQmAoz6yt5J0wC/GXlESoocvlQbpvFWpuvDTXhhAR4
         nH/cL6a45KyEKESqD3It9qifAAlQooN58Sk2mDicCfVdB391Ztkh6sW4Rq15VfKX5qlb
         PYraLNwTu7wJ2jzbyG6xfFU0xO70hkhQvSLSTR7In1zjdVNJlWLAIP4RdzMjOczfLK58
         jFoAmtPQl8GooQWPce+6sbC36UFs2UCRscORrS5L/ohmbu/mCK3WRNGvrQAv7diVlcgr
         yJNtHVibHehgjze4wgUD6F3sKuXYZMKi9nUSwDsSgak5f2WiiRro+BodnLdq9oHF2Klh
         PX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719514164; x=1720118964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVlORxLyi+No4z6mzakpdO+uVb1Q8CeU42Yrc8ZopLA=;
        b=YbDBdMSju2i6sUs4gj+gjA/KBicQHjP9O+go2py+SsWe9PB8SmAPWHNYM9t+6lYLGl
         Tn/7JB+6LRECCZuAgSELLYY/sPcynoDNRCEKkPPMm48ZIUwR4lolMYGzELNwc2LODpAQ
         DQVueqNIftMkjqoffo8UEtzTLDgeWf80svu7dfX81EiaPE1vmRZG7AmcIq2hMKDw0dIt
         lk9hp2i0J0v5JpSRde1P8M/0+Yd8XTtt3lggebn0gbWBbbxcYN7l6qDORQmWjI+/00bv
         mCK65P2Moyyhdar1eUBYtMKpDX5/FqvaKtstkJxbU2J/qIQwRLd9/2lrq2K6vUB9h1c7
         eDJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsPE1oozczTPREGaDHCyvVt1wkG81YQ6CqDJW7+6vSFXL0SCT3IYleX752zK7c7RNapIHBaZiZ0G/kevflo7m8R+PtS4VrsmgToZk=
X-Gm-Message-State: AOJu0YwfOzASPOgk3r70RYDecNifxRtMDXd6QcOuNmD8VoinS0e67HMS
	BJiQdlh4IkcXt20CDxHjrDKCMk8aTkDoBIgju/lpf0AoU+H6pszLUA3lBr8E0aI=
X-Google-Smtp-Source: 
 AGHT+IHjokj2V4brw5oo7jZhZncGgRxq7Wc7ZcWz0FJNgfC3Iqf86Brk3YH4RGDnAqwGbGyYRtJGkA==
X-Received: by 2002:ac2:464d:0:b0:52c:a88b:9997 with SMTP id
 2adb3069b0e04-52ce185d20dmr11430836e87.49.1719514164382;
        Thu, 27 Jun 2024 11:49:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab101c5sm20119e87.79.2024.06.27.11.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 11:49:23 -0700 (PDT)
Date: Thu, 27 Jun 2024 21:49:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ASoC: codecs: lpass-rx-macro: Simplify with devm
 allocations
Message-ID: <dalyp774uk4ugomvdtrjkjpenfogx6dkx4vtiq6serc4unzasw@xa4adquvcijn>
References: 
 <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-0-ede31891d238@linaro.org>
 <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-1-ede31891d238@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-1-ede31891d238@linaro.org>
Message-ID-Hash: HLGNV7KC2BN26KVY4VKWFXFEI6ULJQIJ
X-Message-ID-Hash: HLGNV7KC2BN26KVY4VKWFXFEI6ULJQIJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HLGNV7KC2BN26KVY4VKWFXFEI6ULJQIJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 27, 2024 at 05:23:43PM GMT, Krzysztof Kozlowski wrote:
> Allocate the default register values array with devm interface to reduce
> number of error paths.  The array is not used after initializing regmap,
> so move the freeing to place right after devm_regmap_init_mmio() to make
> it obvious.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/codecs/lpass-rx-macro.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
