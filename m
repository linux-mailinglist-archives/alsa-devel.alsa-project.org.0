Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A37E54FE8C
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 22:54:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34C141F0B;
	Fri, 17 Jun 2022 22:53:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34C141F0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655499288;
	bh=GQ3BujEZNe0aD2Ml/Mek3m+8J2jG8gNeXYr5qlJfzko=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p0LCtHezM616QnSWu0A9MymeSy8U2ULWUkNT5bcAYuT5qAq3sOp3yZN35IX25TdpP
	 mmNQKsnz2NqERIF5PjFuzX6xqGv+vcXF8DBeC6BxALvzK7hUwA1ng5owIvwAD5zOE8
	 D/XO5eS5bQQeHgIrsNKTvzgYvZdGHBXa1p8xfVPI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94F54F8052E;
	Fri, 17 Jun 2022 22:53:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDDE4F800B0; Fri, 17 Jun 2022 22:53:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E516F800B0
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 22:53:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E516F800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="WWM7psGs"
Received: by mail-pg1-x52f.google.com with SMTP id 193so2151201pgc.2
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 13:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Gk5x1jCh3cBaZdr+I2YroVIlBVqwNBM6ZD+Wwafw4ck=;
 b=WWM7psGs0QH1ShTqqeM8WSlVG4uF2enBj2PRdmP7NHwvAC7ZSQxDmKxMyU1oOIOhzX
 FOBlEvqochqZBjEQQhgwxInHMa4gJFM39cABp1vCBrWx/m2VTv3ODDYz+b0sqLRlGrgq
 C85SdT/BF+iTCimXOTcrZ5unKBRggLztCNO1/Rucw2W58CjjsjqdlFBxcStwWk3fMmOt
 zSjgRdlns8M41Kr/jam6BvYL7ejzsf+isUB/4BLMeAtLirmbgP3cYRkmvNJZaWj5mex/
 25lY6zR8jsFhJn/ivTMI9Hm0Wgp7/UHPCTD9B6rO/E2cQ677OOCy9vw69r4Ie4MZalX3
 5w1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Gk5x1jCh3cBaZdr+I2YroVIlBVqwNBM6ZD+Wwafw4ck=;
 b=GvWmfOwKSRcwy1kePzoq4ucRQXLDmD8ieQs8y6WnIWLb/osWkvo3DYReiz4dYwdKT+
 IL5EK3YmG3HVNQ7sRiJWEzqzmQEHvHGpTVjkfYJk6Q9X4dgxQfSBYxvIqb/QEf+/65O1
 zokMQajfKdZedLed9EHIbWVamOVBjLKjAXdkqzoqj17d71bosLxXU4zYSQa9ES0+Jo81
 r1IpCwf+p4Hp06st7wStNf+xrrz88NY3iVi6bOjbiIOuA21vd0RUmBil2IW7N+I1sLsi
 Z0RMT0+Mo9N8vXBg/Hi7K9DAeMNS9AUfNvcJPlN0IB5NBS18R7r1KTv3TyWClyABTWRf
 wiyw==
X-Gm-Message-State: AJIora/rVpiefbuwyTf9HrxRNV7Mw9EpYgYCEbqR5d7xABrDDeolvm5y
 siRglcdPmtvyoE3dy6aD4mQCHMmeWrtk9Q==
X-Google-Smtp-Source: AGRyM1vQWI/PczVCbdS6/Rd6XdpcbnewF7gplMuHiRn1jmWqVz8dsXS7FwdRM4q7fg/r68ZW6RI+NQ==
X-Received: by 2002:a63:814a:0:b0:3fc:ee2c:340f with SMTP id
 t71-20020a63814a000000b003fcee2c340fmr10645882pgd.380.1655499219487; 
 Fri, 17 Jun 2022 13:53:39 -0700 (PDT)
Received: from [172.31.214.180] ([216.9.110.13])
 by smtp.googlemail.com with ESMTPSA id
 g4-20020a17090a67c400b001ec7ba41fe7sm1367233pjm.48.2022.06.17.13.53.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 13:53:39 -0700 (PDT)
Message-ID: <edb78d7b-8ca5-f03c-7ba1-558279cb6d69@linaro.org>
Date: Fri, 17 Jun 2022 13:53:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 04/11] ASoC: wcd-mbhc-v2: use pm_runtime_resume_and_get()
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20220616220427.136036-1-pierre-louis.bossart@linux.intel.com>
 <20220616220427.136036-5-pierre-louis.bossart@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220616220427.136036-5-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, broonie@kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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



On 16/06/2022 15:04, Pierre-Louis Bossart wrote:
> simplify the flow. No functionality change, except that on -EACCESS
> the reference count will be decreased.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> ---
Thanks Pierre,

LGTM,
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini

>   sound/soc/codecs/wcd-mbhc-v2.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
> index 31009283e7d4a..98baef594bf31 100644
> --- a/sound/soc/codecs/wcd-mbhc-v2.c
> +++ b/sound/soc/codecs/wcd-mbhc-v2.c
> @@ -714,12 +714,11 @@ static int wcd_mbhc_initialise(struct wcd_mbhc *mbhc)
>   	struct snd_soc_component *component = mbhc->component;
>   	int ret;
>   
> -	ret = pm_runtime_get_sync(component->dev);
> +	ret = pm_runtime_resume_and_get(component->dev);
>   	if (ret < 0 && ret != -EACCES) {
>   		dev_err_ratelimited(component->dev,
> -				    "pm_runtime_get_sync failed in %s, ret %d\n",
> +				    "pm_runtime_resume_and_get failed in %s, ret %d\n",
>   				    __func__, ret);
> -		pm_runtime_put_noidle(component->dev);
>   		return ret;
>   	}
>   
> @@ -1097,12 +1096,11 @@ static void wcd_correct_swch_plug(struct work_struct *work)
>   	mbhc = container_of(work, struct wcd_mbhc, correct_plug_swch);
>   	component = mbhc->component;
>   
> -	ret = pm_runtime_get_sync(component->dev);
> +	ret = pm_runtime_resume_and_get(component->dev);
>   	if (ret < 0 && ret != -EACCES) {
>   		dev_err_ratelimited(component->dev,
> -				    "pm_runtime_get_sync failed in %s, ret %d\n",
> +				    "pm_runtime_resume_and_get failed in %s, ret %d\n",
>   				    __func__, ret);
> -		pm_runtime_put_noidle(component->dev);
>   		return;
>   	}
>   	micbias_mv = wcd_mbhc_get_micbias(mbhc);
