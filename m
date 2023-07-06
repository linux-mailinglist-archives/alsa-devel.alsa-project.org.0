Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F3D749A49
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jul 2023 13:10:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92FED210;
	Thu,  6 Jul 2023 13:09:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92FED210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688641818;
	bh=T1vO7+8qfBbroVwr/lZE7ekhro+zKzw6YbucJAsTakI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KADXjIWxEiuQORiivPxnd0Y3xQzBWc0hmBw9oTNUIh2eh7jJ8625o9+LtV0SdygjR
	 QNmwwD4Ajr/UJlptIiKNtiJfjp2UEi891XLuFQPhc5hoBzKezCMaq+9CbWrPZYQ4In
	 fPqPlEIUT/woyADOJ19FFzdcFtOF4h/t4weREYVk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B46FF80544; Thu,  6 Jul 2023 13:09:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6D6AF80124;
	Thu,  6 Jul 2023 13:09:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0527F80132; Thu,  6 Jul 2023 13:09:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F632F800E4
	for <alsa-devel@alsa-project.org>; Thu,  6 Jul 2023 13:09:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F632F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Qyt1S6dW
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3fbc12181b6so5871585e9.2
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jul 2023 04:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688641750; x=1691233750;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U4pJMNxdRYP6BWhbdIUrCN4Z4INLjW+mU8oEQ+C2oq0=;
        b=Qyt1S6dW0DJHS9Qwr6lQFv0KX6BIiN/hDvnwUc5Nob/8jVfskxy5bjk9zDFKVViUdL
         r0ZyxrGM75LdfQGVyoecfc/byaadeOsgN49+KyF5gckB4e1vDphVLF6eGpMBEj5OkvSw
         LGvnbohKEg+50mocgJaa0y7kOlSJYg5H3qcbh/3UyzcCxJA2ZyD8xHqk0tUNOx2lZouV
         M1sRZdBBy8prC14qbwYmVfetcRESsy0VKweU7LQjwq0D/vXBNzJNx7snLQczkCty/ITB
         S6XWZDZ+zErZHNLrhwt0WCjT7tScFvGVb3Iz7Y656IblYfY0bR7SlE/eTFX8xD6aCdSa
         hTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688641750; x=1691233750;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U4pJMNxdRYP6BWhbdIUrCN4Z4INLjW+mU8oEQ+C2oq0=;
        b=Ct29zzgt66x2yWFZjExfOCOOBVkxunJJcNVElRdytp61agyt3/xMbikeJ9oMwmcTW1
         XMZAiewP6Xe2RS02zmvClQ6nWU9lgxryBEd+NSM6IAHegxn5Nt0YZnPgcAchf+FXHRA9
         npZP+NLd0wG8MNIuolJaRZY0dGSLOYXjXyvR5BIon+y3BDDJKnmJXI00801cyrAi1dpi
         uNLh1twyqJKjms0XtJORWMBgEOO0XqDZUGH8MELMATBqSmh/mv7SAhkljirURt6u/p3M
         OMznb9yPM0iGqoJ4Pv/nT8vidv30Up/qVCEn+C+DA5EJiQGI4+Oq62nyEJaAdUoPAarB
         KYvQ==
X-Gm-Message-State: ABy/qLYNRfOnVaRTEUKVJ/dIFc7hrRyNQEuZojvG3D29G3BezRjYh6tr
	XpEBZ/wZqmFM2DKi9m4Oq7DdhztvVgOXFv4KAOF4vg==
X-Google-Smtp-Source: 
 APBJJlEwlWIIftTa7gVX+PL/PhpqiVsjsG9ggmBOPIkfwoJfsfs9brTOMymuBcGCGggJ5cVGxBm3AA==
X-Received: by 2002:a7b:cd08:0:b0:3fb:d81a:8b4 with SMTP id
 f8-20020a7bcd08000000b003fbd81a08b4mr2651wmj.16.1688641750542;
        Thu, 06 Jul 2023 04:09:10 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 z18-20020a5d6552000000b0030fd03e3d25sm1591490wrv.75.2023.07.06.04.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 04:09:10 -0700 (PDT)
Message-ID: <3819b919-b096-31c9-525b-03a8b52df3b7@linaro.org>
Date: Thu, 6 Jul 2023 12:09:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/8] ASoC: codecs: wcd938x: fix missing clsh ctrl error
 handling
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>, Mark Brown <broonie@kernel.org>,
 Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, Banajit Goswami
 <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20230705123018.30903-1-johan+linaro@kernel.org>
 <20230705123018.30903-4-johan+linaro@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230705123018.30903-4-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: DE2LWZJ2OX7CXZM6CS7MWMUUPCS4OH5C
X-Message-ID-Hash: DE2LWZJ2OX7CXZM6CS7MWMUUPCS4OH5C
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DE2LWZJ2OX7CXZM6CS7MWMUUPCS4OH5C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 05/07/2023 13:30, Johan Hovold wrote:
> Allocation of the clash control structure may fail so add the missing
> error handling to avoid dereferencing an error pointer.
> 
> Fixes: 8d78602aa87a ("ASoC: codecs: wcd938x: add basic driver")
> Cc: stable@vger.kernel.org	# 5.14
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


>   sound/soc/codecs/wcd938x.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
> index faa15a5ed2c8..2e342398d027 100644
> --- a/sound/soc/codecs/wcd938x.c
> +++ b/sound/soc/codecs/wcd938x.c
> @@ -3106,6 +3106,10 @@ static int wcd938x_soc_codec_probe(struct snd_soc_component *component)
>   						 WCD938X_ID_MASK);
>   
>   	wcd938x->clsh_info = wcd_clsh_ctrl_alloc(component, WCD938X);
> +	if (IS_ERR(wcd938x->clsh_info)) {
> +		pm_runtime_put(dev);
> +		return PTR_ERR(wcd938x->clsh_info);
> +	}
>   
>   	wcd938x_io_init(wcd938x);
>   	/* Set all interrupts as edge triggered */
