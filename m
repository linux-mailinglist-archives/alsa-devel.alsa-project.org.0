Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 875E1393EE5
	for <lists+alsa-devel@lfdr.de>; Fri, 28 May 2021 10:38:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A80516EE;
	Fri, 28 May 2021 10:37:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A80516EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622191111;
	bh=GLVjW8XNpIusJDHdyIebIOwhee8MFhmV9XYfpciYEbQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=al6xTb8mE7KXQ7mWihg7Q6mumUbHKzVMDq5iEYZsKkovGDDN21hRx0a7B6Mg1OO8i
	 Ream35oZoetuQDUxspIYOZ8WGyadkBhUGYYg9iRp5+ZV98o6nChgXwWhRWzOGksjEh
	 BVDyZNDOQZ2OD+weSLIOoDAg0ifkeHJih38YkFWo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF7D8F8029B;
	Fri, 28 May 2021 10:37:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 708B4F80274; Fri, 28 May 2021 10:37:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95A9EF8013A
 for <alsa-devel@alsa-project.org>; Fri, 28 May 2021 10:37:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95A9EF8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="eCxTTDpQ"
Received: by mail-wr1-x432.google.com with SMTP id x8so2424459wrq.9
 for <alsa-devel@alsa-project.org>; Fri, 28 May 2021 01:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JIRtjIzGskNvRkjqhrSGu/TOKcOeVjAntp6g2x55agM=;
 b=eCxTTDpQelaF5VKo9Z6PrNKAhcprFauifycnFSy9xh8HbD4gtY1Sx/zf0hx5omPUss
 8SPVxKrdK9skGTnLhR9JZvM2fIaJpiSzL3T3HMJmXo/c7I899Wnw6cq2A12lgw7A6LUq
 HCZ7dnH7fxY9OtLhhhTKz/bS48DgPJRAHtpyMxDcBOq6jnd3mIXKFMQMWGD/A94G1Xe8
 emtBsERU2sR2W3YP4Z1REDHa+f6WM8kRwZVz4aY7g1e9Ic0SQal4TV65F2FM1oBG8wMJ
 ZHjCCzJa7aa86N0H6iI2xafaUIh6P7ylj3eYmb8CiqrxT11GlmVFdmWhs9yf2gM/1ZF4
 g7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JIRtjIzGskNvRkjqhrSGu/TOKcOeVjAntp6g2x55agM=;
 b=PN5kXVWHuA22sr1CU59Sc4yHl24mZ+mNHV2/3Jvz3mWFngaYZWqGVot8TPt5U5W0GL
 qEFfZxftzwRaJXvdGwm/4Yg5ZuD9Jd8AbZggCxmAnAtP8gZnlOvjqJgbFCqH19P9ysQm
 KfROxglk1qVlNtC9GbuV/v71uucKN8/pv6768z34CvvXzcZmwra+r61Q1JujpKbzU9oW
 Fg76rpiz+oHSoCr6l/ENznpGritaLTm0hEDB/GvfeaxypyRCzrRPpPftppHyhVdf2faP
 F5mMG6i05s0WUGxFpTWbW5Q1DJOAybh4VthY2cbN4TTkq6OcdHUPkpM8EqgwIUKVKPJi
 V4BA==
X-Gm-Message-State: AOAM532lToArboqZKUWxrMKAX8DNppiHojcXoQckEA0iM6j5XH8jXtZ8
 BOrp7Odyp1EC/066wzQ/nkpfp7P5Emdygg==
X-Google-Smtp-Source: ABdhPJw5NKRu7nGRD7H482yIuy9oXYSyXuPAHcI//JL1z90goZosB5wAFGeCCxbxaIjvpuPgVRZLPA==
X-Received: by 2002:a05:6000:cb:: with SMTP id
 q11mr7399883wrx.13.1622191033222; 
 Fri, 28 May 2021 01:37:13 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id 11sm6110413wmo.24.2021.05.28.01.37.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 May 2021 01:37:12 -0700 (PDT)
Subject: Re: [PATCH 4/5] ASoC: qcom: q6asm-dai: Constify static struct
 snd_compress_ops
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20210526231013.46530-1-rikard.falkeborn@gmail.com>
 <20210526231013.46530-5-rikard.falkeborn@gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <bd8348e2-7af9-c868-50d0-e359a6a9fb52@linaro.org>
Date: Fri, 28 May 2021 09:37:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210526231013.46530-5-rikard.falkeborn@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, Takashi Iwai <tiwai@suse.com>
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



On 27/05/2021 00:10, Rikard Falkeborn wrote:
> The snd_compress_ops structs are only stored in the compress_ops field
> of a snd_soc_component_driver struct, so make it const to allow the
> compiler to put it in read-only memory.
> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>   sound/soc/qcom/qdsp6/q6asm-dai.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
> index 9766725c2916..5ff56a735419 100644
> --- a/sound/soc/qcom/qdsp6/q6asm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
> @@ -1169,7 +1169,7 @@ static int q6asm_dai_compr_get_codec_caps(struct snd_soc_component *component,
>   	return 0;
>   }
>   
> -static struct snd_compress_ops q6asm_dai_compress_ops = {
> +static const struct snd_compress_ops q6asm_dai_compress_ops = {
>   	.open		= q6asm_dai_compr_open,
>   	.free		= q6asm_dai_compr_free,
>   	.set_params	= q6asm_dai_compr_set_params,
> 
