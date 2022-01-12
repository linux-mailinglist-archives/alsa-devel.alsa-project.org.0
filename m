Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDF248C8BB
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jan 2022 17:47:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACA4D1B3D;
	Wed, 12 Jan 2022 17:46:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACA4D1B3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642006038;
	bh=2OOHq4w9/1Fr/BvFzES539TaADyx1KAvgQPGyYrM0+o=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=isiF5odBVNLcvcuA1WstFqebTSdyRHPaByPFyM/uqEa7WufU8MOqcn6TuA2WuAEO+
	 8vt7NrE12W5PIDuNvK/HljfuFWV59WCip5PK4uCU5DIaVt+SsRtZJPmXmOZok0Zme/
	 aYsj96MFg24jzv6PPNXdu9GBN0gDVd3QcezYKlAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77539F80510;
	Wed, 12 Jan 2022 17:45:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7D74F8026A; Wed, 12 Jan 2022 10:48:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89123F800B9
 for <alsa-devel@alsa-project.org>; Wed, 12 Jan 2022 10:48:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89123F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="qPgICBIw"
Received: by mail-wr1-x42e.google.com with SMTP id r28so3146636wrc.3
 for <alsa-devel@alsa-project.org>; Wed, 12 Jan 2022 01:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZvNdPw4A75PyvJZJhJ+BPOLK9/MSxsg60VQkLM65tgg=;
 b=qPgICBIwsAuQ1mjh5JgLh0eGoMrUhQKrlo4MV2YdySlBeeHB+POQad1H7CiUqxuS8O
 U+1Kajkl33THx+j+VFNYgF0NTzwxJfYSKfWZ19JKQLygMlJGY52ETkqGYKGTgS+DSG+d
 HKX7mMWAQ0rt45qMKIuof/rJnYn3z1SYaMoqS4K1QXEKg4LcXx9UV/VQrOYFB6JvOmO5
 VF1biEL6X5LiKhNgv3hcQ3C1VWy0FCenj+CQzgt3r3Ii3MMNIJGZhG6VZ2YSRmLq2z4a
 iVbZ/YMrmf3ThWxhjErjR2fCeYAOJ5hi3XXAW0knA3QMLeTtEYt3o2lPtt/2EgDIZgmW
 Bang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZvNdPw4A75PyvJZJhJ+BPOLK9/MSxsg60VQkLM65tgg=;
 b=DuVbX7sQX7qd9tiE/t/FP/e1izRJQLkEPfaLXWYzdIiW7jhkkOiT1tUbfD+TkfDU+G
 q3mcxagFwBKFFtqtDe53J/c30RmCirCBcud0QQ08qW75q+0BH9Odjc4QzaPYgnZ9+vAV
 ZxuRTYNBO1OwRcLUaY61H+jSlliyfCavQ6acWxl2PcHk5LQHOQEKY5KqUi30nov81x80
 HGsG6Ucih2vgzRj2Dk0StZCDN17SFgcU/Aemj5uw0Io7T3VGt4Vqg/Ogmfiv1qmBZOwW
 hFbebRFHPZZ0obC59LKnd+z9VJtveA83+c1nRsP0cd/RSgqARtpA+ebCOEbt3JX0poKU
 ShbQ==
X-Gm-Message-State: AOAM533MjzE/0Xwq6pFgN3w2FucGO4b5GEOys8ZV/FyAjIfaoefQWoJd
 NuIew8lSGOGhyhXvyyugl5CZJA==
X-Google-Smtp-Source: ABdhPJwxxZwVdV43gKiB2TyUPoD+VU3fvQnEiXCfMxT94G6fGkWA+CDZt+6ONQEfiW/WQTdGzINeEA==
X-Received: by 2002:adf:8023:: with SMTP id 32mr6168506wrk.136.1641980893667; 
 Wed, 12 Jan 2022 01:48:13 -0800 (PST)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 o13sm12390642wrc.111.2022.01.12.01.48.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 01:48:13 -0800 (PST)
Subject: Re: [PATCH] ASoC: codecs: Check for error pointer after calling
 devm_regmap_init_mmio
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, cezary.rojewski@intel.com,
 bgoswami@codeaurora.org, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
References: <20220111013215.494516-1-jiasheng@iscas.ac.cn>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <8be9a48c-6b61-9272-a2e4-0bd483e0544c@linaro.org>
Date: Wed, 12 Jan 2022 09:48:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220111013215.494516-1-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 12 Jan 2022 17:45:04 +0100
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



On 11/01/2022 01:32, Jiasheng Jiang wrote:
> The devm_regmap_init_mmio() may return error pointer under certain
> circumstances, for example the possible failure of the kzalloc() in
> regmap_mmio_gen_context(), which is called by devm_regmap_init_mmio().
> Then the error pointer will be dereferenced.
> For example rx->regmap will be used in rx_macro_mclk_enable().
> Therefore, it should be better to check it.
> 
> Fixes: af3d54b99764 ("ASoC: codecs: lpass-rx-macro: add support for lpass rx macro")
> Fixes: c39667ddcfc5 ("ASoC: codecs: lpass-tx-macro: add support for lpass tx macro")
> Fixes: 809bcbcecebf ("ASoC: codecs: lpass-wsa-macro: Add support to WSA Macro")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Thanks for the patch,

LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   sound/soc/codecs/lpass-rx-macro.c  | 2 ++
>   sound/soc/codecs/lpass-tx-macro.c  | 2 ++
>   sound/soc/codecs/lpass-wsa-macro.c | 2 ++
>   3 files changed, 6 insertions(+)
> 
> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
> index 07894ec5e7a6..2adbf2e2697f 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
> @@ -3542,6 +3542,8 @@ static int rx_macro_probe(struct platform_device *pdev)
>   		return PTR_ERR(base);
>   
>   	rx->regmap = devm_regmap_init_mmio(dev, base, &rx_regmap_config);
> +	if (IS_ERR(rx->regmap))
> +		return PTR_ERR(rx->regmap);
>   
>   	dev_set_drvdata(dev, rx);
>   
> diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
> index 27a0d5defd27..e4bbc6bd4925 100644
> --- a/sound/soc/codecs/lpass-tx-macro.c
> +++ b/sound/soc/codecs/lpass-tx-macro.c
> @@ -1803,6 +1803,8 @@ static int tx_macro_probe(struct platform_device *pdev)
>   		return PTR_ERR(base);
>   
>   	tx->regmap = devm_regmap_init_mmio(dev, base, &tx_regmap_config);
> +	if (IS_ERR(tx->regmap))
> +		return PTR_ERR(tx->regmap);
>   
>   	dev_set_drvdata(dev, tx);
>   
> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
> index d3ac318fd6b6..dd1a8b7bc794 100644
> --- a/sound/soc/codecs/lpass-wsa-macro.c
> +++ b/sound/soc/codecs/lpass-wsa-macro.c
> @@ -2405,6 +2405,8 @@ static int wsa_macro_probe(struct platform_device *pdev)
>   		return PTR_ERR(base);
>   
>   	wsa->regmap = devm_regmap_init_mmio(dev, base, &wsa_regmap_config);
> +	if (IS_ERR(wsa->regmap))
> +		return PTR_ERR(wsa->regmap);
>   
>   	dev_set_drvdata(dev, wsa);
>   
> 
