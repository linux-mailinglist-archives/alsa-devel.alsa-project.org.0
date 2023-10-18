Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE287CDBBE
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 14:33:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 970C8836;
	Wed, 18 Oct 2023 14:32:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 970C8836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697632384;
	bh=Vbs60ynYoJjGVaOHcuCE0XfFep4cR073V9lzTpaLsX0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=oNPcE/rrX6bvF9AEtYMd2LSZNJZmMXWmlK4c5DMOzs6XrlFprsZI242xJbBJm+ITW
	 RelI6eESBzubOK6rPw5MWumB2eiDxezT7eu29Yf875mEse47lgFAs72D7oD7f0/bZI
	 qeGZ7KwIjTNUvh+0G1VWulFOlxq7jUWW/w9oQF6M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17D79F80536; Wed, 18 Oct 2023 14:32:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 949CEF8024E;
	Wed, 18 Oct 2023 14:32:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16AEAF8025F; Wed, 18 Oct 2023 14:32:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3584BF800C9
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 14:32:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3584BF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=MmECVq33
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32dcd3e5f3fso617354f8f.1
        for <alsa-devel@alsa-project.org>;
 Wed, 18 Oct 2023 05:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697632319; x=1698237119;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6AC1mpiZBXNStM7oB6tiEEIW9Gl/xCSO0XdtqP4r9QI=;
        b=MmECVq33PsSQD5BlemZwjSh/7OGPUjkgkAsOBHqhAYn6EZVnngdXAcp9VeADribxbJ
         lHTdNkoDepdAez1JwZtXvI6FXcyFxRWDkXEL7P7hKPmv2Ty47kVLML4VVoAyQP964ze8
         Uf4zW+XHeCjuWSPs+7qbguoEA4/HWFRartm5Zhc9FRUCO/vZx6Kvn9hwJBis7qAPigvD
         OqzyAZdIqCOJFu9zNMj0U5hTJOD1or0LJh0O3cxrU+w5iofx2zBIjjPB/d3hunr3BJm3
         7Nh4qEPpAXg8Bs/lOY1UesbGHrFot/NMavpdXGkwU3bmlgzM7HqlOf0EHk+Df/yO+D19
         tcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697632319; x=1698237119;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6AC1mpiZBXNStM7oB6tiEEIW9Gl/xCSO0XdtqP4r9QI=;
        b=VSJ5BdDBnPmRQBZ0QMBTqcGh2CWbmHc5nt/JagoveSD84QFh4iPpqa0z7sxa9nU2t+
         LUCs8C7M7vhDbon4dOOMzZ1NPteVLxhdudhIUZwGiaJNjoCCqpbqTnTcSnVYdN4psxmw
         QLCBbXdvM7BOyxYRjhQsTsP7WEuxLKc6yccli7Z6T5kZMq65uoW2Qqs3NlWK+6bhf/3g
         X7NrOgXNlKW30AiiYseJD7huwiSmRcxa+TiOQDn4IKcdK/JPoOuahoRipsrIzoJ7i9ae
         eDSof0Fdqy9fbb4kKaj2cjzLuvypgJy6I9LdKqQ6KIq/u17Mqfg8CFc7K84f9tUEA2iP
         IijA==
X-Gm-Message-State: AOJu0YyInGHKPh5qDZW01xBL34zzSD50QcXRN6t//J9k/zygqJgdarVa
	Z2pCRunWL8D9Cmh5G2zmrGkrXw==
X-Google-Smtp-Source: 
 AGHT+IEKMMvf8PONXEFDRXM1+Ut4jcSZzuPmhpwwTC3gqdN5yY4vrMDr8Q0HEGp6r2Od+KtpVcDcVQ==
X-Received: by 2002:a5d:508f:0:b0:32d:8469:4f64 with SMTP id
 a15-20020a5d508f000000b0032d84694f64mr3502040wrt.18.1697632319170;
        Wed, 18 Oct 2023 05:31:59 -0700 (PDT)
Received: from [192.168.86.24] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 b17-20020a05600010d100b003197869bcd7sm2021292wrx.13.2023.10.18.05.31.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 05:31:58 -0700 (PDT)
Message-ID: <34d784f2-92d4-e06b-3596-36cf0d048f35@linaro.org>
Date: Wed, 18 Oct 2023 13:31:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] ASoC: codecs: wsa884x: allow sharing reset GPIO
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20231018100055.140847-1-krzysztof.kozlowski@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20231018100055.140847-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NQZVGVO5RW6LQ3CDEMSLOUX2UUQKPBQA
X-Message-ID-Hash: NQZVGVO5RW6LQ3CDEMSLOUX2UUQKPBQA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NQZVGVO5RW6LQ3CDEMSLOUX2UUQKPBQA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 18/10/2023 11:00, Krzysztof Kozlowski wrote:
> On some boards with multiple WSA8840/WSA8845 speakers, the reset
> (shutdown) GPIO is shared between two speakers.  Request it as
> GPIOD_FLAGS_BIT_NONEXCLUSIVE to allow such configurations.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


--srini
>   sound/soc/codecs/wsa884x.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
> index 993d76b18b53..bee6e763c700 100644
> --- a/sound/soc/codecs/wsa884x.c
> +++ b/sound/soc/codecs/wsa884x.c
> @@ -1844,7 +1844,7 @@ static int wsa884x_probe(struct sdw_slave *pdev,
>   		return ret;
>   
>   	wsa884x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
> -						GPIOD_OUT_HIGH);
> +						GPIOD_FLAGS_BIT_NONEXCLUSIVE | GPIOD_OUT_HIGH);
>   	if (IS_ERR(wsa884x->sd_n))
>   		return dev_err_probe(dev, PTR_ERR(wsa884x->sd_n),
>   				     "Shutdown Control GPIO not found\n");
