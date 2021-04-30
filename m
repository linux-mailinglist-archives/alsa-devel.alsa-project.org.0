Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3F336FEBB
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Apr 2021 18:38:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 898F61695;
	Fri, 30 Apr 2021 18:37:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 898F61695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619800710;
	bh=uo28kKt0l2g54jVjY7xWMWIiyCIpBWPQvQDxd7aYfKM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b8yKbiXdXZMY2YhDD87RJ+o+nfW7fdYnUm/ld9k6yVZ79ap9ckmKM+s6Hl7ZnURyz
	 f6rgcXsaUAWLgd8m4cCAlTNfRpI2d4GIfmb2DfLHujuK26Bw6UkxV/r0FqEkvFr/MQ
	 ELiYj1nygcASElPchCTvDz6jLnDt9deEMcpmgG8g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D348CF80171;
	Fri, 30 Apr 2021 18:37:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF1E6F8016C; Fri, 30 Apr 2021 18:36:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB171F800E4
 for <alsa-devel@alsa-project.org>; Fri, 30 Apr 2021 18:36:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB171F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="akR6FJa9"
Received: by mail-wr1-x42b.google.com with SMTP id n2so18088678wrm.0
 for <alsa-devel@alsa-project.org>; Fri, 30 Apr 2021 09:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/Ukke2EarrCZ6LZGmPgLhnaE6LpNng0t5cCCCGZbWno=;
 b=akR6FJa9nUWRslrIQI8F8HEmUFR/xRFaENe0ub5k2+RSDZs09JwEAr7X9IQQj2W7Er
 KbS5j4k69UG19d2R/es3nGN2LK3kSl5iaLhNIVnQUhcf3ppIz6v5VVRQhjqZU3NwjKr2
 6Pz096l/+ePpuTTQ0eLYORC+tkx9vKy0Kr9kyaEVQIhtvgYjeXBVf+spDntvfSd0D1ZV
 6oMgS/3y8tM88XezCt3XqFkdd4JJQN9kxUu/iRLGF6uicngLh6DuBEAyD4d+ZXLDVPAr
 qd8YZtKsVjT/JtCBzlS0TU64Jo4bYKUmH841Q8kuss4HXxOKdHM4KYv9eeI0y0LjLaPe
 ojKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/Ukke2EarrCZ6LZGmPgLhnaE6LpNng0t5cCCCGZbWno=;
 b=lA81WCPsrfVts+PvGhKYmYUU2Yhi3S/0YsVK6b9a40WyM5M9qLoidQ9tEZ037wOyVl
 EIMpKjTnIhVKLrP9Bcv5LoTTCW7y8+f/PKzlSoeMuyzbCFbWSu9Ntb8z7D2W8JS/4Eew
 +KDV25H7JQ81EgxFWDPjZgrgBSJMzE5VGGurrdayADNBXSRa1g4HW/OGlCoKdhNBk4Uy
 tCqxvLGK+YxQlmFBOlJeRSUPhGrpKGF1o5ItSu069+43heLJhVkaGEqYwL9HOX8OpD6k
 uXUpSFqzymXnmD1dckkL9XBmkH2Yz9cGOmpwTQIhOLFEna7VKR1keVePvBsO5fWvkgFv
 2oug==
X-Gm-Message-State: AOAM530h2b/YjOBJt/8H1cy58aeQ6xiS9PWNjLDBg7MDVL1tuVJIOjfO
 tbXmbDS/PDGnE75JphURyBcJIg==
X-Google-Smtp-Source: ABdhPJyJU+B1+ATEMQ+DZYinDU4nZ4BEMacdGMARtzR6/CSdMCzk3r7QR+wKBz5nlJ49wvt59sQpGQ==
X-Received: by 2002:a5d:4707:: with SMTP id y7mr8196116wrq.137.1619800611233; 
 Fri, 30 Apr 2021 09:36:51 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id n3sm3464730wmi.7.2021.04.30.09.36.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Apr 2021 09:36:49 -0700 (PDT)
Subject: Re: [PATCH v2] ASoC: codecs: lpass-wsa-macro: handle unexpected input
To: trix@redhat.com, bgoswami@codeaurora.org, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com
References: <20210430142117.3272772-1-trix@redhat.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <647db8c8-2ee0-0dee-51e5-41120566bb5e@linaro.org>
Date: Fri, 30 Apr 2021 17:36:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210430142117.3272772-1-trix@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Thanks Tom for fixing this.

On 30/04/2021 15:21, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Static analysis reports this problem
> 
> lpass-wsa-macro.c:1732:6: warning: Array subscript is undefined
>          if (wsa->ec_hq[ec_tx]) {
>              ^~~~~~~~~~~~~~~~~
> 
> The happens because 'ec_tx' is never initialized and there is
> no default in switch statement that sets ec_tx.  Add a default
> case that returns an error before the array is accessed.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
> v2:
>    - handle the input error, keep switch
> ---
>   sound/soc/codecs/lpass-wsa-macro.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
> index 1a7fa5492f28..d3ac318fd6b6 100644
> --- a/sound/soc/codecs/lpass-wsa-macro.c
> +++ b/sound/soc/codecs/lpass-wsa-macro.c
> @@ -1727,6 +1727,10 @@ static int wsa_macro_enable_echo(struct snd_soc_dapm_widget *w,
>   		val = val & CDC_WSA_RX_MIX_TX1_SEL_MASK;
>   		ec_tx = (val >> CDC_WSA_RX_MIX_TX1_SEL_SHFT) - 1;
>   		break;
> +	default:
> +		dev_err(component->dev,	"%s: Invalid shift %u\n",
> +			__func__, w->shift);
> +		return -EINVAL;

With the existing code we should never even touch this default path,

However the changes look safe to me,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


--srini


>   	}
>   
>   	if (wsa->ec_hq[ec_tx]) {
> 
