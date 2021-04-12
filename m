Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 237B635C1B3
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Apr 2021 11:40:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DF7F15F9;
	Mon, 12 Apr 2021 11:39:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DF7F15F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618220427;
	bh=pwGQmAxQq6yQWf4pgGToJ8R6PSKtUDdN8IYpaKkOQVI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Eb7UjXiYLBDTFD0c3KauHbnuquJrTE9CKh7qLEVfJBW2eE0WsybuLvJa8/qyWMFMM
	 KvKDFt37XotY+ikSSSmk81r9KSTcHld9CRGVw66alKN4Ab1/Vc1KmF7N0x7cCzS5DM
	 CLVx+joNawbU1/oBiLrl10GpziPgnh/anT9gg670=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF7F0F80271;
	Mon, 12 Apr 2021 11:38:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 486D5F80269; Mon, 12 Apr 2021 11:38:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BA47F800FF
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 11:38:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BA47F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="g8v5HrPp"
Received: by mail-ej1-x630.google.com with SMTP id g17so16397241ejp.8
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 02:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=l44rB0IYMxJ35sDa+nql8M4c9xSWgfebmgWtETnR9Rk=;
 b=g8v5HrPpDcZWCi5z1Vikc+xanmXnwDGaCf7pb+6ERjYz5V/8ty8WRI45YWfGtoUhix
 8YyfFlv7EMZtVtigcSpqkFq332BkhGZLyrw4O+kVCJR+kjRZm8q8cB6C9e0DMpS1JmTH
 jztE0gSlOJZ4TrGt7xRiInCX4a7my9CGB3YNKjE8WcuypZZSQk8bVUWgUhK824gz2AR9
 OKS48TuQYXQw8bsK2MZMkf9R8ffqcCqNLCSPaHTM0DvbFKO13LQUsSFVO3PklHaRP70X
 Ehsvc3zyjyGt6TwhW3KCr5LzkUAT0bzU9eDSsmUCedyD/LdabECYtm6iR5AIHrCMfPYX
 QcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l44rB0IYMxJ35sDa+nql8M4c9xSWgfebmgWtETnR9Rk=;
 b=SJzJ+tfW4uFA/H6sq+dlSZEO5EB+RTKUcLPyIoMbAcdl8PsOAL3N1iKtmFdBZaAO9K
 VLOxwZxeuqGagFPiJipSgEh8wFWqA7K+pMZAxOdhWPzsM2+yALbL+RtQ6JdcUgRExkIQ
 azmPLisiApcfYgXhla7pMqJTSO2lrifG3VjUfn5q39BTGtHg9bkJeZEMqFAFrBNNL4vn
 tYHM4yEd7Pu77Z12M3F43LZu+imcdSufHsPiFYceAg/ka8OTSMWXO4GXLPRjU5pSXqx2
 hC3aLhWXgRxqET26AZ9l8d+3MP++x9V2e+xy5l9vVpJEg0w77Iy4aaGMghLXFlozpL+5
 cCkQ==
X-Gm-Message-State: AOAM533D2S6Cy3Ww33bCp5LjWW795KgoJjO3XkjAe0NCMynXHX3A4GgU
 iEi4+91oMRd++j6qPOM/wlWvLw==
X-Google-Smtp-Source: ABdhPJyoKnOEf9yt/+OdqQdgKTrmiMUNMFKI8xCUhL1iNwpXrKhx02OazrbcOO2o7PPSGwWnyFqeMg==
X-Received: by 2002:a17:907:3e92:: with SMTP id
 hs18mr25824934ejc.396.1618220325317; 
 Mon, 12 Apr 2021 02:38:45 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id h24sm5342077ejl.9.2021.04.12.02.38.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Apr 2021 02:38:44 -0700 (PDT)
Subject: Re: [PATCH 4/5] ASoC: lpass: use the clock provider API
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
References: <20210410111356.467340-1-jbrunet@baylibre.com>
 <20210410111356.467340-5-jbrunet@baylibre.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <0c8c3b5d-891a-9bfa-3bbc-4982542df38a@linaro.org>
Date: Mon, 12 Apr 2021 10:38:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210410111356.467340-5-jbrunet@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Stephen Boyd <sboyd@kernel.org>, alsa-devel@alsa-project.org,
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

Thanks Jerome for the patch,


On 10/04/2021 12:13, Jerome Brunet wrote:
> Clock providers should be registered using the clk_hw API.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   sound/soc/codecs/lpass-va-macro.c  | 2 +-
>   sound/soc/codecs/lpass-wsa-macro.c | 9 +++------
>   2 files changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
> index 5294c57b2cd4..56b887301172 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -1343,7 +1343,7 @@ static int va_macro_register_fsgen_output(struct va_macro *va)
>   	if (ret)
>   		return ret;
>   
> -	return of_clk_add_provider(np, of_clk_src_simple_get, va->hw.clk);
> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &va->hw);

Now that we convert this to devm, You missed error path and driver 
remove where we delete clk provider. This should be removed as well as 
part of this patch.


This applies to both wsa and va macro.

Thanks,
srini
>   }
>   
>   static int va_macro_validate_dmic_sample_rate(u32 dmic_sample_rate,
> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
> index e79a70386b4b..acb95e83c788 100644
> --- a/sound/soc/codecs/lpass-wsa-macro.c
> +++ b/sound/soc/codecs/lpass-wsa-macro.c
> @@ -2337,10 +2337,9 @@ static const struct clk_ops swclk_gate_ops = {
>   	.recalc_rate = swclk_recalc_rate,
>   };
>   
> -static struct clk *wsa_macro_register_mclk_output(struct wsa_macro *wsa)
> +static int wsa_macro_register_mclk_output(struct wsa_macro *wsa)
>   {
>   	struct device *dev = wsa->dev;
> -	struct device_node *np = dev->of_node;
>   	const char *parent_clk_name;
>   	const char *clk_name = "mclk";
>   	struct clk_hw *hw;
> @@ -2358,11 +2357,9 @@ static struct clk *wsa_macro_register_mclk_output(struct wsa_macro *wsa)
>   	hw = &wsa->hw;
>   	ret = clk_hw_register(wsa->dev, hw);
>   	if (ret)
> -		return ERR_PTR(ret);
> -
> -	of_clk_add_provider(np, of_clk_src_simple_get, hw->clk);
> +		return ret;
>   
> -	return NULL;
> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, hw);
>   }
>   
>   static const struct snd_soc_component_driver wsa_macro_component_drv = {
> 
