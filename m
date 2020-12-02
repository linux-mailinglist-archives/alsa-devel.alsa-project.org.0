Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0072CC166
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Dec 2020 16:56:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D037416EC;
	Wed,  2 Dec 2020 16:55:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D037416EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606924599;
	bh=Fz+XVGeuAorG6/2IKmHxlkQ8YNiepds68GlBGKaUcxE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UAfuYKlYDvimHg3yWfevDq/tsGWgh4jUVSfbSPCgkok0vpqAkirrBLTEcJ9k2rR29
	 r7hNCZFrjcAbTYjVgEzTz/t3dekkQ246Nfs7txGwbzdElcB6FmtGHxSzvVbQNUpahI
	 Jccrw80UboxDPn3JKpVHlCAIb5znelNgYRiy2x2k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1946DF80168;
	Wed,  2 Dec 2020 16:55:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C61EDF8025F; Wed,  2 Dec 2020 16:55:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6230BF80158
 for <alsa-devel@alsa-project.org>; Wed,  2 Dec 2020 16:54:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6230BF80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="bz7pVrUH"
Received: by mail-wm1-x341.google.com with SMTP id h21so9493464wmb.2
 for <alsa-devel@alsa-project.org>; Wed, 02 Dec 2020 07:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9wSfeNEgiqafNB08squR/RO3i+fVSAtbeRf4xlfoOdo=;
 b=bz7pVrUHwPtzzjD6kMxKQOPOXMXIJbwt0qyGNtJuLCV7WHkHz3FtwjEFuzmlFYhyfo
 mWIuY67ZYpCZzNlFArdYsfozCpZykf+9i6Zx57MvGrpAPDb0oagQoixuYgPre0Q5iRPN
 9My/+gS6DrrB4hqFt4vkqIBqRNiMB+t3B5wM8cds7auXL7i4ObSFypOv+R6KMruxz8Oo
 HYXjStNj7L9v/8md4wgpfaN4zW0SCDnw9IEBfPqxzO0vHOqpkKNCleoSHyLl3ngW326d
 b4rnbiY8ExhaLXfQeAbiqHE0qLTUEYYlDOsm1/6HuzrBH7I4JpWHogIoyGSU5LgDflzb
 M84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9wSfeNEgiqafNB08squR/RO3i+fVSAtbeRf4xlfoOdo=;
 b=PaprPobpmIm8rXmusOyoP2Ct0lzlrGUEnOhox+8QOlGGpuhy0nkK9bNA9za/FLX6wS
 5vMeFwq0xeh6lBEmR7yjtJF9SaWqIlkXoaIp/527soyz+J/Nf2N7sFBveCcKjsXkswES
 Eu+t1O0wJZel44k5CJ2lBq4uy82QNwE9qhiV6gLxXtwMdl3Vk/uliluQpXS4vyjaJlvd
 yRRmcj4+yxQLDzKqZb7pj6fbF7iMR8swG3h8nlBUkqlphYQOQ+IyZ7MJKutpbiXUvvC3
 1nELKqjM98bjym9untSC385WUJ8hLYPjCDNynWIhVCSzHLEc3/ZJAchPzmH9SndCjkfL
 H1xg==
X-Gm-Message-State: AOAM532aX8WrV4hrT/XUq5VQocl07FsBQNDP9Q1FIcJ+XqEhhY4mCKtZ
 A2VKnS31F8AcO6H+3eKmyH56YQ==
X-Google-Smtp-Source: ABdhPJyX2g86rZ8Ob/k4O48RvuqMC9+TIF5kVxAf3vcYk0Ut3B+GysUn9LRWJCDlMDNL5PxGG4ZXqA==
X-Received: by 2002:a7b:ca4c:: with SMTP id m12mr3797813wml.11.1606924494939; 
 Wed, 02 Dec 2020 07:54:54 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id h2sm2577163wrv.76.2020.12.02.07.54.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Dec 2020 07:54:54 -0800 (PST)
Subject: Re: [PATCH] ASoC: codecs: lpass-va-macro: remove some dead code
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Liam Girdwood <lgirdwood@gmail.com>
References: <X8c5gjZO7YN/CFsq@mwanda>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <7e06abb2-a969-aa1a-6adc-6cdd72e3355c@linaro.org>
Date: Wed, 2 Dec 2020 15:54:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <X8c5gjZO7YN/CFsq@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
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

Thanks Dan for the patch!

Do you use any tools to do this checks?


On 02/12/2020 06:51, Dan Carpenter wrote:
> The "decimator" variable is in the 0-7 range and it's unsigned so there
> is no need to check for negative values.
> 
> Fixes: 908e6b1df26e ("ASoC: codecs: lpass-va-macro: Add support to VA Macro")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   sound/soc/codecs/lpass-va-macro.c | 15 ++++-----------
>   1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
> index 3e6bbef26dcb..91e6890d6efc 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -844,17 +844,10 @@ static int va_macro_hw_params(struct snd_pcm_substream *substream,
>   
>   	for_each_set_bit(decimator, &va->active_ch_mask[dai->id],
>   			 VA_MACRO_DEC_MAX) {
> -		if (decimator >= 0) {
> -			tx_fs_reg = CDC_VA_TX0_TX_PATH_CTL +
> -				    VA_MACRO_TX_PATH_OFFSET * decimator;
> -			snd_soc_component_update_bits(component, tx_fs_reg,
> -						0x0F, tx_fs_rate);
> -		} else {
> -			dev_err(va_dev,
> -				"%s: ERROR: Invalid decimator: %d\n",
> -				__func__, decimator);
> -			return -EINVAL;
> -		}
> +		tx_fs_reg = CDC_VA_TX0_TX_PATH_CTL +
> +			    VA_MACRO_TX_PATH_OFFSET * decimator;
> +		snd_soc_component_update_bits(component, tx_fs_reg, 0x0F,
> +					      tx_fs_rate);
>   	}
>   	return 0;
>   }
> 
