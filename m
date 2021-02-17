Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 226DE31DB46
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Feb 2021 15:16:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F63A1657;
	Wed, 17 Feb 2021 15:15:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F63A1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613571400;
	bh=MBSd8Mp4U8Mm13hXd3KzoHca8TnagcDQreVnkU4/QvQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a5XijVEwu0YMk1HWIuNMhO0Q/OKq8v59McfcHr+vu/55inpd3uv/uqv9veOq3kWtn
	 V15qNWNXVwL4CzMaEzPvgZ2xcHvFhGfIqzBP121p24y/ixAja0n8EwqPI3zERtHtlL
	 Ir8glELSsHvkdoMFywLq9vcD4z0J2xjzfKCotuLM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7ACCAF8025B;
	Wed, 17 Feb 2021 15:15:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80DBAF80258; Wed, 17 Feb 2021 15:15:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73E57F800E9
 for <alsa-devel@alsa-project.org>; Wed, 17 Feb 2021 15:14:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73E57F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="FMzIj+DJ"
Received: by mail-wr1-x431.google.com with SMTP id r21so17516014wrr.9
 for <alsa-devel@alsa-project.org>; Wed, 17 Feb 2021 06:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UDFCRTsuiZ3IiAm76Fu7UKNR+ruV15r3mLWBUKSRUYk=;
 b=FMzIj+DJ25ZBr9XVddM/3sw4Ehs2ShlUSy4+IsWMKw5/EiywQmPWCY+BijAzt40ZEf
 Mtyzv7WTU5/nktwY9Li/Lc9lCgMCkXMjgfWGtKroR5kUH8iVwslpgv/lVOUl7bwQw8Sj
 HjbciOmOvBoNm9YhGrNvkeSMLLl+0gKuN7RzSB0/6qXuykp+ZY9vZjJTI5S5kGgtBIYy
 NgoPxH4wFk7lo+xQoYpv80b1F4KqgwDFrMEcxqJbDcEwnSyF3JNhtEsMFX6kBP8e8g2r
 OBi8707/VxQnfjF4L3NU9A1iMG3vJGXS2V5ICBiRn2xFO1CYcyx7Oh2BMmTxioXRD3eK
 BiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UDFCRTsuiZ3IiAm76Fu7UKNR+ruV15r3mLWBUKSRUYk=;
 b=qhCAnQhnq8rDK4UKhmWQY5PIgn+CsfmqaMHTMzs8g75sfQTaPTNDqIh/Hs2nbJJ5wI
 kWJP7061Ijzvw0zb5kxbFbq7k1ZVruRhP5s+tIP8wcQi6J4MHR5iMrpkfWMHbL7GVZwG
 Rp01V+MJb5HMSQyQdL0mNJ51vQXYBOjZZX3NF84dLMtVM3K4+jG32vkI2adApUkA/+m4
 RKVkcLbo/zgzWTRDm1f2qQhD4rp/gHcwgtB5/56xaWE/7XF4A/82xWkEWOzHgE1FHVCB
 1nieU0cL96FiE6UyO6yyazTJIMlsY6qQsRiHKXi6Tu72yJUrnoqEjJJGMbroCpDpfSp5
 I0YQ==
X-Gm-Message-State: AOAM532hGv5YUSpGXiI9A+lCx3wIGIxA8v7zapsGGgB/OAarpM7JDC+i
 DFC0vS22Wi7ELQ91nD4jjuLPHw==
X-Google-Smtp-Source: ABdhPJwNxrY3w7dpix3j+g9HhjNKICiJJZam+Eh0j5KukroXDcYynUnVCkkLPfAbhQS67/4wu1zBxg==
X-Received: by 2002:a5d:4850:: with SMTP id n16mr29797243wrs.296.1613571292946; 
 Wed, 17 Feb 2021 06:14:52 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id m17sm3083820wmq.5.2021.02.17.06.14.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Feb 2021 06:14:52 -0800 (PST)
Subject: Re: [PATCH][next] ASoC: codecs: lpass-rx-macro: remove redundant
 initialization of variable hph_pwr_mode
To: Colin King <colin.king@canonical.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
References: <20210215200501.90697-1-colin.king@canonical.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <4e261a11-4577-4568-8ab3-f2ef1a9a8474@linaro.org>
Date: Wed, 17 Feb 2021 14:14:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210215200501.90697-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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



On 15/02/2021 20:05, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable hph_pwr_mode is being initialized with a value that is
> never read and it is being updated later with a new value.  The
> initialization is redundant and can be removed.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
Thanks for the patch!

LGTM,


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

>   sound/soc/codecs/lpass-rx-macro.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
> index 8c04b3b2c907..76909c50d7b9 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
> @@ -2038,7 +2038,7 @@ static int rx_macro_load_compander_coeff(struct snd_soc_component *component,
>   {
>   	u16 comp_coeff_lsb_reg, comp_coeff_msb_reg;
>   	int i;
> -	int hph_pwr_mode = HPH_LOHIFI;
> +	int hph_pwr_mode;
>   
>   	if (!rx->comp_enabled[comp])
>   		return 0;
> 
