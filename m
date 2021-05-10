Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C58D37829F
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 12:35:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 921CF16BA;
	Mon, 10 May 2021 12:35:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 921CF16BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620642952;
	bh=JVYVCkbKW06rQCtt32Bk2o+IH2AylLrIaWNK5THcp10=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ez6cccAKREsjvsplK8gWlwDr4dIKzRcu6Hhuz2fuFCLLkIQO75VVHm11YkSNNO1hc
	 8Qdb9fr0/Iw3VKT/K02Fha92hZl3U7aCY/fZnOame7fFypg8RX7lNKyRAF2vQywhqU
	 vT0RFer2tmp/XLCa6gMIYyOP8YxgfgK25tOKznhI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29072F8027D;
	Mon, 10 May 2021 12:34:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F320F800E9; Mon, 10 May 2021 12:34:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E8F6F800B4
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 12:33:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E8F6F800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Cgd2xNWI"
Received: by mail-wr1-x42d.google.com with SMTP id l2so16049414wrm.9
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 03:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j9ho1FshsaBSAwzsRsNW4z/HT3Epd7NSpGM7BhSuMLI=;
 b=Cgd2xNWIsVDX4Xl20RjyyQ4FGNgdzGAty8TF4bAjIR0WhTqWum0+aJAgcxHj/EQ8Ed
 kDakR2SDvRtBWuRixHYp/j0hzYlo6YAVJZq3Z2kDwbpdEqvJycsoZLAYZhrww98iCXV/
 n4Yf0tuTto88YwF1sF3qOkEu+oN7mnkb+gV7kZqQfc+skszrqg6qeYhyV1Oa+HmEuH4a
 wsmW7GZg5wSzl12Pl3A3ClNCy6BB2XmYTvIPLmLPnR6khRt1HB51EpoHwVN7j7MCD6lE
 tLNrUiGKTV1wBU1CupexdnUzO3u0g59DHsXwdTswYMzb/nhiXR3LVDGCsRgIIcvP9/Qz
 8udQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j9ho1FshsaBSAwzsRsNW4z/HT3Epd7NSpGM7BhSuMLI=;
 b=aML2onNzZRtfVVqDT0Tc6o2AMXSRLuXz1n/gB3L6sN77b31zOunrsQc7Ao6d1HfB3/
 CHHNTq7ZHGy4yUaxQaBgBiKbeXklYelxjhacZnrhCRlDfshyk73CddFDGMkhjTP6nFF4
 SQjqKhneJgdt6NGmegsw0uE5WEBX23kQPQdkrAnSDzRQL75Z6arHvUs0IKclIQhqtVHT
 cywBlPdgclGnJ/jte5aMPn7rM17Xjw5AS2pedEXjyINAT1zX9kl56FmN5huIAo3e5lLG
 GUmUvpxowgzPdH9x3+VZdXhhs0aYTKLGebIFpLwuYY0OsDJ3lQH2Io50H2MC+dBql0Ck
 O7jw==
X-Gm-Message-State: AOAM530vr8SWUVeO5iyKOk5ppOHhpFC7MQC/+It1EsYgVIIowAzhjoLj
 sjC+r/ktCB6tJcYXH1i8pkcliA==
X-Google-Smtp-Source: ABdhPJy1SqFJjzZtiLqFnniXN1gwxbdOhOTKoi7KDq80pgXVVv02TOIdIAi3Odqa4ZJaLPJtSKzYcw==
X-Received: by 2002:a05:6000:1b06:: with SMTP id
 f6mr29460986wrz.339.1620642833642; 
 Mon, 10 May 2021 03:33:53 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id g6sm25938797wrr.63.2021.05.10.03.33.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 May 2021 03:33:53 -0700 (PDT)
Subject: Re: [PATCH -next] ASoC: codecs: lpass-tx-macro: add missing
 MODULE_DEVICE_TABLE
To: Bixuan Cui <cuibixuan@huawei.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Ye Bin <yebin10@huawei.com>
References: <20210508031512.53783-1-cuibixuan@huawei.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <a4bbe07e-eed6-4667-3efc-c9307782c05b@linaro.org>
Date: Mon, 10 May 2021 11:33:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210508031512.53783-1-cuibixuan@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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



On 08/05/2021 04:15, Bixuan Cui wrote:
> This patch adds missing MODULE_DEVICE_TABLE definition which generates
> correct modalias for automatic loading of this driver when it is built
> as an external module.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


> ---
>   sound/soc/codecs/lpass-tx-macro.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
> index acd2fbc0ca7c..27a0d5defd27 100644
> --- a/sound/soc/codecs/lpass-tx-macro.c
> +++ b/sound/soc/codecs/lpass-tx-macro.c
> @@ -1846,6 +1846,7 @@ static const struct of_device_id tx_macro_dt_match[] = {
>   	{ .compatible = "qcom,sm8250-lpass-tx-macro" },
>   	{ }
>   };
> +MODULE_DEVICE_TABLE(of, tx_macro_dt_match);
>   static struct platform_driver tx_macro_driver = {
>   	.driver = {
>   		.name = "tx_macro",
> 
