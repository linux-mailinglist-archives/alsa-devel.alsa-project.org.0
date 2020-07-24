Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2B822C45A
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jul 2020 13:25:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06FA91687;
	Fri, 24 Jul 2020 13:24:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06FA91687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595589901;
	bh=ZlI0fQGeSQwCgdDzGmLHae8jvYrsx3iToJo556rxcAA=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EfhLpvNfd1f/KOf8qMQFL4WchrtStUur6bwaitvkL2HUzM2l5S/f6HjMzws6/nHtX
	 8wtVf415bvNlmPo/tH5H2wBLgVOnY/NjYH3bcuzhbJ2t7UKlJVsIt6oj/ZS/WUtldv
	 X2eh23zlx6pEatXrkwszJoVuHFPrO1xICbDN33jg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 226B0F802BD;
	Fri, 24 Jul 2020 13:22:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BA87F802C4; Fri, 24 Jul 2020 13:22:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 059B4F802BD
 for <alsa-devel@alsa-project.org>; Fri, 24 Jul 2020 13:21:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 059B4F802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="p6tgPHcx"
Received: by mail-wm1-x341.google.com with SMTP id 3so1004874wmi.1
 for <alsa-devel@alsa-project.org>; Fri, 24 Jul 2020 04:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=QBcl5FK4EZqrtCnW5IQ5WndIaO7X61MMG438KlSxZ48=;
 b=p6tgPHcxw7s+eIybTuztyk5Zh+ndlxFsb6LnTlTsA4B+g8xpvXitbOzuaGmCgfqRZb
 giCezrtJy0QaopoXfIqaUbZHRnE5iVWB1cbawyhaA1ftF7mxE0rwYy54CkTF6S+TAbj9
 wsgoL474l8C+LiDYwSs3Xgm/H+Rcn5CwIrD4E/2UOexcF95TC2wuxTFtgOPRIhrHiZaB
 r2XvYlXNVFEuBXRInp4w/L4ZqgdCGK/k9GeraiDofbJx0KiZJOiz8wE1mUyIPccyoTEI
 eQxP/4c8TCL7l6vYkJkPI5RlS/Lkz/dSezmCs60Qr+Fg8exa7O1URKW7Gh89H61GSWkm
 ExhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QBcl5FK4EZqrtCnW5IQ5WndIaO7X61MMG438KlSxZ48=;
 b=eqDfnVwKUEAbifg7umXYtmlzGa29zgYus3KWTYIKVjfd7wEzNELjme8X9DHWfaUKfu
 v1xxjfCg8nfoSumJsjci1+UX05EwjU0iv8PAirz4BOjqmYxOZmxfmJipQvTAx8ELqOrs
 uDMkfKrFe21w+LAzMJ8rw2/r5TEUU3bOlz4AjALY0B0kEL6fB8FTkeSp3AaLo7+kQsRV
 IdP6JMOmgC4k6Teor2kW0lgKvnfliH+Viylk76gBtEyN8DNaYQy813hyM9AQz9akhaEV
 JzabkzhiQWe5Cc/Uv20hItoi2355o5aHTqTnUwcZ/14XfB1k8NmQP8Wg2pSctopjqONo
 9VLA==
X-Gm-Message-State: AOAM531eSgqF1Rz43OPVMd1bgZESWHGlX+i1LcpyRIIyY/FKzGL/a1wY
 E/pnF3Bn+oW/Glls2BhUu3o6KA==
X-Google-Smtp-Source: ABdhPJyIZOVHqR8IywjbnF4AfvsOTpXs4INYnuhL6MUOJ25g639wiz/73ibH9ilrBLAIG2rjP2oPBA==
X-Received: by 2002:a1c:4406:: with SMTP id r6mr8235833wma.161.1595589716944; 
 Fri, 24 Jul 2020 04:21:56 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id p14sm1020718wrx.90.2020.07.24.04.21.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Jul 2020 04:21:56 -0700 (PDT)
Subject: Re: [PATCH v4 06/12] ASoC: qcom: lpass-cpu: fix concurrency issue
To: Rohit kumar <rohitkr@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
 <1595413915-17867-7-git-send-email-rohitkr@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <eb3854ac-6480-f6ce-4325-bd00dd18be40@linaro.org>
Date: Fri, 24 Jul 2020 12:21:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1595413915-17867-7-git-send-email-rohitkr@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 22/07/2020 11:31, Rohit kumar wrote:
> i2sctl register value is set to 0 during hw_free(). This
> impacts any ongoing concurrent session on the same i2s
> port. As trigger() stop already resets enable bit to 0,
> there is no need of explicit hw_free. Removing it to
> fix the issue.
> 
> Fixes: 80beab8e1d86 ("ASoC: qcom: Add LPASS CPU DAI driver")
> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   sound/soc/qcom/lpass-cpu.c | 16 ----------------
>   1 file changed, 16 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index 6b86f16..5d84f63 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -266,21 +266,6 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
>   	return 0;
>   }
>   
> -static int lpass_cpu_daiops_hw_free(struct snd_pcm_substream *substream,
> -		struct snd_soc_dai *dai)
> -{
> -	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
> -	int ret;
> -
> -	ret = regmap_write(drvdata->lpaif_map,
> -			   LPAIF_I2SCTL_REG(drvdata->variant, dai->driver->id),
> -			   0);
> -	if (ret)
> -		dev_err(dai->dev, "error writing to i2sctl reg: %d\n", ret);
> -
> -	return ret;
> -}
> -
>   static int lpass_cpu_daiops_prepare(struct snd_pcm_substream *substream,
>   		struct snd_soc_dai *dai)
>   {
> @@ -350,7 +335,6 @@ const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops = {
>   	.startup	= lpass_cpu_daiops_startup,
>   	.shutdown	= lpass_cpu_daiops_shutdown,
>   	.hw_params	= lpass_cpu_daiops_hw_params,
> -	.hw_free	= lpass_cpu_daiops_hw_free,
>   	.prepare	= lpass_cpu_daiops_prepare,
>   	.trigger	= lpass_cpu_daiops_trigger,
>   };
> 
