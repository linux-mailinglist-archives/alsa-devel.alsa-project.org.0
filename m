Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9823794470A
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 10:51:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F1E3371B;
	Thu,  1 Aug 2024 10:50:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F1E3371B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722502264;
	bh=DT7Z/Dr7EC6wH3bHClnXwVde/S0OfRJ0y8xo3AP575Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gbWSt+UxxIZLpggPKqSK6WrK9AhuYkhfbZ7DFqjjz0+TZO9n9LpnVhiKlkdOhhAp3
	 B2SdvIER4E7SwmB/nx65oSvEMkGCW8rfUP9/w4ML42kMGrnW40sQmMDgjbDni5JzOz
	 X+RaNrigQ+Y0A00eYKd0b5DVdYXoCUtcHXZUUtvw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D06AAF806A6; Thu,  1 Aug 2024 10:49:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CEEB8F806A3;
	Thu,  1 Aug 2024 10:49:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 940C2F8026A; Thu,  1 Aug 2024 10:22:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8E08F8019B
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 10:22:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8E08F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=UNCZ4vwB
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2f025b94e07so86732851fa.0
        for <alsa-devel@alsa-project.org>;
 Thu, 01 Aug 2024 01:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722500574; x=1723105374;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LSGnD2DWNUSNtIkP15Czx/EJx9+uS/yBEuP8HGdsMsE=;
        b=UNCZ4vwBbtYUWVgBT3MMHnJlgZQUZGU/ixe9ivMZ0jTSwqNHkvqbPh/9YjQITL4bW9
         Jln7ElRMXup77+hH8+CYJ0Nsr4W0l1mW6DFJlUeo4u6xskXQQ/szbw8B8uK4IfJvCFO9
         3n3QqJi7MTm54FicjZv4z8Al5mHwYv0SCec4wm76zddTACvaKbMLbPABVf8qYtEehmf6
         1tlSk4vQTgbCpF2e3JD+Y5ngJPZ2e1m6GnafKyGy7JYVD4BNydFYTEh+d1hTp5Xbvc3l
         jb9f5shHYM2/6SknlVunPwN2GYvut4Lypu+QWjJqyVs/ydJR0jOCug3hjM1TLLjAAIGH
         t/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722500574; x=1723105374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSGnD2DWNUSNtIkP15Czx/EJx9+uS/yBEuP8HGdsMsE=;
        b=XDdf/WwBc1+jAJEnATSAQt5aXdxcm7FoW50AFLquSe3MX3d7y7bQtfC2eA4O9+psMH
         cxsx0PkxOS5HnivYokhHivrPlbxiDqShy3JBAeIuhD6ERjoH+hrE6lkOAvmecp2K0nX2
         N969SU57G2NI5ISOeJ8qeJqr7cUFWFgo6YBXhzTqJF7Yfa/HW2xLATGPyAlh87FVGJI4
         teuU90CdxssidEeSVCW7Oa8h1HulzLmLAHRhOy0exLj53zP+iLBLlQ6efPgnKkrB85sK
         WCDpqE70z7yiR50caH6kTveYss4cu9iZYPRhzJF1mcA5bhcXjM6+2APtHIdQaLyWVRCI
         0oww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVP+z7YI6D8kTcAXEg2Wsib0eoP2pRUJ6s1kcYEDRsHpzS+6fmo8rakGOoLCrB1GBIpa5SaB9DMPKbaGXqzAamO+sOojYlvtJwUSo4=
X-Gm-Message-State: AOJu0Yz7qimKQI9OUtF4g5vxCXavaRxQkorFq3p3NgT9EbO5oIu3aA8b
	6lvnHC4bmZ8JrB9wkOVShigeDcmzJnCqf6AR0T1jEsLS0bqZ+fFKG17NFBlHNDDzC5xSZOe0AJ8
	p
X-Google-Smtp-Source: 
 AGHT+IEWp6JLVNetkx76xZrMoBBE0Pp+5XNDbasSkEXbs7i9l6MQsrr7uyA9rchqJH6Db172CYonUQ==
X-Received: by 2002:ac2:41ca:0:b0:52c:d76f:7f61 with SMTP id
 2adb3069b0e04-530b61f3485mr858416e87.56.1722500574277;
        Thu, 01 Aug 2024 01:22:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530abeefd1bsm802326e87.179.2024.08.01.01.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 01:22:53 -0700 (PDT)
Date: Thu, 1 Aug 2024 11:22:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Adam Skladowski <a39.skl@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
	Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: Re: [PATCH v3 6/8] ASoC: qcom: apq8016_sbc: Add support for msm8953
 SoC
Message-ID: <hhz6m6mzvwh7q5hxbiitbwiicgi5gjv4mx7wnq4m7ihthw3qab@3dy7xddqfczh>
References: <20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com>
 <20240731-msm8953-msm8976-asoc-v3-6-163f23c3a28d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731-msm8953-msm8976-asoc-v3-6-163f23c3a28d@gmail.com>
Message-ID-Hash: FCWZGCWCHXRD7PC3B36RVYPDEXTXJEZQ
X-Message-ID-Hash: FCWZGCWCHXRD7PC3B36RVYPDEXTXJEZQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FCWZGCWCHXRD7PC3B36RVYPDEXTXJEZQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jul 31, 2024 at 05:25:30PM GMT, Adam Skladowski wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Introduce support for audio card on MSM8953 platform.
> Main difference between MSM8953 and MSM8916 is Q6AFE CLK API
> supported by firmware which influence way we set codec clocks.
> SoCs shipping on at least msm-3.18 should use v2 clocks.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> [Adam: rename functions, add msg]
> Co-developed-by: Adam Skladowski <a39.skl@gmail.com>
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  sound/soc/qcom/apq8016_sbc.c | 43 +++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 41 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
