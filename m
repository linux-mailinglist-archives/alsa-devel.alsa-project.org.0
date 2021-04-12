Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8352935C60E
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Apr 2021 14:19:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E15971607;
	Mon, 12 Apr 2021 14:18:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E15971607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618229987;
	bh=HyW/h6DaWaaJbQQMseT+/t7L0xVSKfPHypI823XVvsA=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=djDwEoDdGMDTKMjQzk+gTCn8qQTeHcE9rfSkuM98zvvqpssWxpkEYhMtNFrwU1V1M
	 tfaZts8druUGWDFPhTEH4ztCodQ/VQRl+3ZopthYxjLoTUpaJ/1im8lMnzVoZHTMb+
	 eCIGbHfKVXiXPpLRTD/R6Wec4EkkvG3cSEg+DEX4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59DC5F80271;
	Mon, 12 Apr 2021 14:18:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2B5BF80269; Mon, 12 Apr 2021 14:18:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71E4FF800FF
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 14:18:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71E4FF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="CfxEjZWJ"
Received: by mail-wr1-x431.google.com with SMTP id a4so12714365wrr.2
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 05:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=mD2WCI7vh6febNnOcdykE7h73ToD187sENDF2eGoMmA=;
 b=CfxEjZWJUxvLwhhaaCuCP5Rm4NIpWDecw4S39zdkc7TruMwOO4Ve0TcplR5/cGlFnI
 wJPSiUZ/1ZkCNBuDDPNviLxmJ5CAIyBz0yvHtrMRbJSKQELt+on2UW6Id3ZAbzqIcbPk
 tkrtMYQTr31H3aQ+4g+qNsUib6gF/Q3r6A0DXv/7X5+fHpyn2fpwlFtE53RpE7hW5MM4
 gSUlWLt4uhvCVuPOsuLE2basyeVS7dYQMCiwMV/bpGnDS+tQHkac4tNUECkMWHWdpE94
 ZueDbngMvTdyQW00SPRhLsYlTnuyc5l70Lj0xvRJJ6BdgdxoGKVH4OttdelV21e9iHYm
 cYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=mD2WCI7vh6febNnOcdykE7h73ToD187sENDF2eGoMmA=;
 b=HITX5HOnpYf2uf5nYGbyrIPQpUTOQ4HQsdhkO9yiCxcalCJwRLMoHGdjcSxz2H0jvG
 mvQ5I3MkTuySrY+qp93k4cChuCqhYwTNvwzR75wjwEK4oCiX90j4K+FN4JVN7s+ckI7e
 UxQ0qH+CIFunoyv22P8G6Ik4aV0t0V+OkssLjfS3S2lBrFTyHC4ZuXERKJX2m2yRTtlf
 r+X2/B9F1/x0Rmd2cHNx/Z9+mqFZqlFWv8zLzIRRm0kssHhV2AzrTYCgJDYgJgzicwJ6
 suX/7jmMX9fZbXS4NdDpRSq6MDPtcQVLdvGtBzIO1ZjpVknxB4D7E8fy5lzdbhfTdahI
 9K7A==
X-Gm-Message-State: AOAM531+3aXV2QH5fDbZ2YN1W/rfSoVkZBPyze+1LEaA9rUXUHvm/HbS
 CFamoM6Of8ElLj05Fb9B5foRLA==
X-Google-Smtp-Source: ABdhPJwOJVOh8tgBiNxX6i8lAXohBmpkRch6okXtGKxI10P/KPtK3enB/wU+qF76pJm2M1i4jnJPoQ==
X-Received: by 2002:adf:ea83:: with SMTP id s3mr7899651wrm.39.1618229879061;
 Mon, 12 Apr 2021 05:17:59 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id s21sm14984525wmc.10.2021.04.12.05.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 05:17:58 -0700 (PDT)
References: <20210410111356.467340-1-jbrunet@baylibre.com>
 <20210410111356.467340-5-jbrunet@baylibre.com>
 <0c8c3b5d-891a-9bfa-3bbc-4982542df38a@linaro.org>
User-agent: mu4e 1.4.10; emacs 27.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Mark Brown
 <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH 4/5] ASoC: lpass: use the clock provider API
In-reply-to: <0c8c3b5d-891a-9bfa-3bbc-4982542df38a@linaro.org>
Message-ID: <1jmtu38znu.fsf@starbuckisacylon.baylibre.com>
Date: Mon, 12 Apr 2021 14:17:57 +0200
MIME-Version: 1.0
Content-Type: text/plain
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


On Mon 12 Apr 2021 at 11:38, Srinivas Kandagatla <srinivas.kandagatla@linaro.org> wrote:

> Thanks Jerome for the patch,
>
>
> On 10/04/2021 12:13, Jerome Brunet wrote:
>> Clock providers should be registered using the clk_hw API.
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>   sound/soc/codecs/lpass-va-macro.c  | 2 +-
>>   sound/soc/codecs/lpass-wsa-macro.c | 9 +++------
>>   2 files changed, 4 insertions(+), 7 deletions(-)
>> diff --git a/sound/soc/codecs/lpass-va-macro.c
>> b/sound/soc/codecs/lpass-va-macro.c
>> index 5294c57b2cd4..56b887301172 100644
>> --- a/sound/soc/codecs/lpass-va-macro.c
>> +++ b/sound/soc/codecs/lpass-va-macro.c
>> @@ -1343,7 +1343,7 @@ static int va_macro_register_fsgen_output(struct va_macro *va)
>>   	if (ret)
>>   		return ret;
>>   -	return of_clk_add_provider(np, of_clk_src_simple_get, va->hw.clk);
>> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &va->hw);
>
> Now that we convert this to devm, You missed error path and driver remove
> where we delete clk provider. This should be removed as well as part of
> this patch.

Indeed. I should not have switched to devm here - It was not really the
purpose of the patch. Habits I guess.

Do you prefer I stick with devm (with the suggested fix) or revert to the
no-devm way for the v2 ? It makes no difference to me TBH.

>
>
> This applies to both wsa and va macro.
>
> Thanks,
> srini
>>   }
>>     static int va_macro_validate_dmic_sample_rate(u32 dmic_sample_rate,
>> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
>> index e79a70386b4b..acb95e83c788 100644
>> --- a/sound/soc/codecs/lpass-wsa-macro.c
>> +++ b/sound/soc/codecs/lpass-wsa-macro.c
>> @@ -2337,10 +2337,9 @@ static const struct clk_ops swclk_gate_ops = {
>>   	.recalc_rate = swclk_recalc_rate,
>>   };
>>   -static struct clk *wsa_macro_register_mclk_output(struct wsa_macro
>> *wsa)
>> +static int wsa_macro_register_mclk_output(struct wsa_macro *wsa)
>>   {
>>   	struct device *dev = wsa->dev;
>> -	struct device_node *np = dev->of_node;
>>   	const char *parent_clk_name;
>>   	const char *clk_name = "mclk";
>>   	struct clk_hw *hw;
>> @@ -2358,11 +2357,9 @@ static struct clk *wsa_macro_register_mclk_output(struct wsa_macro *wsa)
>>   	hw = &wsa->hw;
>>   	ret = clk_hw_register(wsa->dev, hw);
>>   	if (ret)
>> -		return ERR_PTR(ret);
>> -
>> -	of_clk_add_provider(np, of_clk_src_simple_get, hw->clk);
>> +		return ret;
>>   -	return NULL;
>> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, hw);
>>   }
>>     static const struct snd_soc_component_driver wsa_macro_component_drv
>> = {
>> 

