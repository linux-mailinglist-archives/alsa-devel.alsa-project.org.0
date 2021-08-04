Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD7C3E040E
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Aug 2021 17:22:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59ABE16EA;
	Wed,  4 Aug 2021 17:21:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59ABE16EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628090539;
	bh=VzV2Lqb65WQu0XybYy0BAgKSCj+giKWsFPOpwDjugKQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G5XPFR71Qf2B6KtWgimhYbyPvoQx6ROi97D5VR3TmlkLd7qVEBnM7RBXrZicoYyVx
	 dOYDkw6YJXJaPLsgzvifR6AAmb5FjkORq8XPU9DYBVJj/IPSW/DN2g0VYmMKwp6Ku1
	 KjcQA50py9BJLs/63LGNOTsqFNXw+RVLiIyhLeUo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9F84F801F7;
	Wed,  4 Aug 2021 17:20:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FDB9F8025F; Wed,  4 Aug 2021 17:20:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BDF6F8014D
 for <alsa-devel@alsa-project.org>; Wed,  4 Aug 2021 17:20:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BDF6F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="qUZNQdiU"
Received: by mail-wm1-x32b.google.com with SMTP id u15so1435628wmj.1
 for <alsa-devel@alsa-project.org>; Wed, 04 Aug 2021 08:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wkTZ3Cvpq95tTZxxGhMCSQ7ZSKfjC1tE+mWWe/3jYYM=;
 b=qUZNQdiUlWR4fZqQO2qEpJtqRJQ4OvzIr7Kuz9UvfnzaGHos0+g8dvDCMYOlI5J7GU
 eeasVfDunhWAcLlMXsqm2G+7tMA4Tzwj+S8NId/qQa71KiYOCauH4JQ8SyB8aLK/YNdL
 B7NKOYK+N4ZYH9L7tlrd5tkaYuAnrJna9N6lZCUSpA4un6DJCTEZER4MySW9f2alcjoD
 adI9r0igmhMxhG98XiyJoix/FjnxEvEs+dyMVVkaJtjz/IVDBwkjCmEoDWcuW17yRy3X
 0AxR5OTFG6mqSwU6Vp0VkcNjL8y/xZlU5ihBkwmRic9rvY2yPICUqX80937llq8ad+Ob
 CjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wkTZ3Cvpq95tTZxxGhMCSQ7ZSKfjC1tE+mWWe/3jYYM=;
 b=NwxbXkdohsUTiGVKzzGzKV3C3L9oPBusTVrBVQo8qpCO7Nov4LflPnKqldvLXT10RT
 XjIvF7yrB38UYzohvD+5T6DMnISLbPP3QdYTTBd5etuS7xlZHZot9mxXK1ufeh0qQAhy
 30wR9zMQHr2B57/rlzYohuL3wRc26q8ZGyO4cViqQTma0oqJdZtWs7XGt19uVGSzMkB6
 T3YoGU5JLmDo8welG4RnIWsUtS841URH/ZtXqtxs9ufre7QdkYwnWjEGru3j4rqqZ+5f
 W6sf7sxUM9iDRuVVcFStFrROi/dHf41HRUNajzgoIdrCJknHw2ClBYS6YnHAlLShCmhe
 0rvg==
X-Gm-Message-State: AOAM532hx0OFytRwh1/Rw198CUTRkS3MH9wj8B5lF6ndycwKS7FnbuJ1
 uvyT8+Slhodc5JAlfJHa1UBugQ==
X-Google-Smtp-Source: ABdhPJxlJgsrspf5ejM/fhtSz3NsEDL5vJUuMjql93SBjwME2huq7rwsShUGxl7Fjxqnn1rhr3EBSw==
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr154955wmq.138.1628090440673; 
 Wed, 04 Aug 2021 08:20:40 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id l4sm2876434wrw.32.2021.08.04.08.20.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 08:20:40 -0700 (PDT)
Subject: Re: [PATCH] ASoC: qcom: apq8016_sbc: Add SEC_MI2S support
To: Vincent Knecht <vincent.knecht@mailoo.org>, tiwai@suse.com, perex@perex.cz
References: <20210801072951.1403241-1-vincent.knecht@mailoo.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <c1ef8096-0aa6-9b26-951d-cb673d03cf50@linaro.org>
Date: Wed, 4 Aug 2021 16:20:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210801072951.1403241-1-vincent.knecht@mailoo.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org, stephan@gerhold.net,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org
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



On 01/08/2021 08:29, Vincent Knecht wrote:
> This patch adds external codec support on secondary mi2s.
> It is used for headphones on some devices, eg. alcatel-idol347.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
>   sound/soc/qcom/apq8016_sbc.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
> index 08a05f0ecad7..53460272eb1e 100644
> --- a/sound/soc/qcom/apq8016_sbc.c
> +++ b/sound/soc/qcom/apq8016_sbc.c
> @@ -30,6 +30,11 @@ struct apq8016_sbc_data {
>   #define MIC_CTRL_QUA_WS_SLAVE_SEL_10	BIT(17)
>   #define MIC_CTRL_TLMM_SCLK_EN		BIT(1)
>   #define	SPKR_CTL_PRI_WS_SLAVE_SEL_11	(BIT(17) | BIT(16))
> +#define SPKR_CTL_TLMM_MCLK_EN		BIT(1)
> +#define SPKR_CTL_TLMM_SCLK_EN		BIT(2)
> +#define SPKR_CTL_TLMM_DATA1_EN		BIT(3)
> +#define SPKR_CTL_TLMM_WS_OUT_SEL	BIT(6)
> +#define SPKR_CTL_TLMM_WS_EN_SEL		BIT(18)

Can you please add suffix to these defines something like:
#define SPKR_CTL_TLMM_WS_EN_SEL_SECONDARY	BIT(18)
so it becomes more obvious, As we have 4 possible values for this field 
[18:19]
same for WS_OUT_SEL.

Also you should make sure that other bits in this fields are cleared 
before writing.

--srini

>   #define DEFAULT_MCLK_RATE		9600000
>   
>   static int apq8016_sbc_dai_init(struct snd_soc_pcm_runtime *rtd)
> @@ -53,6 +58,13 @@ static int apq8016_sbc_dai_init(struct snd_soc_pcm_runtime *rtd)
>   			MIC_CTRL_TLMM_SCLK_EN,
>   			pdata->mic_iomux);
>   		break;
> +	case MI2S_SECONDARY:
> +		/* Configure the Sec MI2S to TLMM */
> +		writel(readl(pdata->spkr_iomux) | SPKR_CTL_TLMM_MCLK_EN |
> +			SPKR_CTL_TLMM_SCLK_EN | SPKR_CTL_TLMM_DATA1_EN |
> +			SPKR_CTL_TLMM_WS_OUT_SEL | SPKR_CTL_TLMM_WS_EN_SEL,
> +			pdata->spkr_iomux);
> +		break;
>   	case MI2S_TERTIARY:
>   		writel(readl(pdata->mic_iomux) | MIC_CTRL_TER_WS_SLAVE_SEL |
>   			MIC_CTRL_TLMM_SCLK_EN,
> 
