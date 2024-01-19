Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E898324FB
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jan 2024 08:18:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61E2D1F8;
	Fri, 19 Jan 2024 08:18:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61E2D1F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705648701;
	bh=bu6TtoDHXYj08cbRRnS9+PBQHmEtpwdovbn9SIGetKg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mt2niieF9t7zG34CT+II1wQZio0CZKMceOfMdvzgEVuq2KFs/4dNbj702g7ZwL4hS
	 LUnqM/i1NMHd6sc/3bob6OQZi8DPIUxZlGuQh8XbzpeEJl+9pzGTQvGvbBhUbnqAnZ
	 18VRT4v9YiD9dOpNC565TA4TXSIFI9rjUBg9lxbQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A02A2F805BB; Fri, 19 Jan 2024 08:17:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49EADF805AD;
	Fri, 19 Jan 2024 08:17:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 290C6F801F5; Fri, 19 Jan 2024 08:15:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C635CF8003A
	for <alsa-devel@alsa-project.org>; Fri, 19 Jan 2024 08:15:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C635CF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=USeCbpJs
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-337b583453bso401068f8f.2
        for <alsa-devel@alsa-project.org>;
 Thu, 18 Jan 2024 23:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705648535; x=1706253335;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OHFKB+KTysp6kwejewof3DWQa8w1eNlV5qVrsykVh5c=;
        b=USeCbpJsM+u1qv2LI9fNn2D+6CpE43UsWiMFgGzt/Yx+KwLr3jwR4J/35WNUJsDcc3
         +9gU1QaU7C/ixW5c8WuO9239LGwGiqRnc2JAHQnomk5pdEjylLbdnhDjrAHxvIJNFbFZ
         qJoqNfjWW6vrnh59/LwnQBjg38t7Qf0rXE3M8sFXgq7LdZCyQVJjFh8Zhz09oSW0rEQP
         AlNUzaCCzZZ8DtLGmRpwRmM83At2Qcjcfb+tV6Zoj9H1j8eiiIkZT0cL63MSCBKI+9wc
         LyAwkZl93H/6gUIRvTcww81UP8Anocsr49eCW3igm0gvNbHn4Yyc6/tMAfPzx/gNwjLN
         mu4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705648535; x=1706253335;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OHFKB+KTysp6kwejewof3DWQa8w1eNlV5qVrsykVh5c=;
        b=jbsiIEWoU2M2aogQxcdFxTgFBZhsbXl8L7lJsRgWhbHay3oKdr3cYRNcIUv8SS5qvv
         oAWr+Beor4mwfvsx932VfqZ0tAW8D1/s9VEaVLKoACukHgAh6ikCtJGKO+npWLeMLKM6
         IDL4Shq/52oNyO5tjCWidf9Bvk/vogzylhidEYtW8RfAHWvxwlCEn5YIP/D3KU2itDHz
         t6mQoIuIJCTfEttKs4/CWL6fSbtoT7Wa3HL8VmBc2GDsk4Ae8I3tUdbv2PMdGzhEfcXI
         PqBNq5yhKukhrVO/tmf97zpeemP25nbU6FD3AzeEZyv+AJW8IyzTzGmyqJ9f6MiCKDRR
         FO2A==
X-Gm-Message-State: AOJu0YxT+YODFQMr3sTCeDx27Tl3DspcIrA7sanyMY7FWFa7p1DP7EZ9
	Nn1ekZ+0Q7uMIAdWLlX72tnU+duWc2ZGVFx8LY6V7NTaI7SKdQcMaWbwp5TOMmE=
X-Google-Smtp-Source: 
 AGHT+IF+flK3TANqdZk9xzA4fDQ608SzAK+XwelcQRt5520BMqyeOX3b4lxpmwKeq2jytRjqDhs2ug==
X-Received: by 2002:a05:600c:54d2:b0:40d:5d07:55d3 with SMTP id
 iw18-20020a05600c54d200b0040d5d0755d3mr849828wmb.177.1705648535092;
        Thu, 18 Jan 2024 23:15:35 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 2-20020a05600c020200b0040ea00a0b75sm14034wmi.0.2024.01.18.23.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 23:15:34 -0800 (PST)
Message-ID: <63e000c7-deae-44df-8d82-a74ffe303e9a@linaro.org>
Date: Fri, 19 Jan 2024 07:15:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] ASoC: codecs: wsa883x: lower default PA gain
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20240118165811.13672-1-johan+linaro@kernel.org>
 <20240118165811.13672-3-johan+linaro@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240118165811.13672-3-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: OHT32WDXUN6CH6BKXLPD2YC7TP2ZMY4Q
X-Message-ID-Hash: OHT32WDXUN6CH6BKXLPD2YC7TP2ZMY4Q
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OHT32WDXUN6CH6BKXLPD2YC7TP2ZMY4Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 18/01/2024 16:58, Johan Hovold wrote:
> The default PA gain is set to a pretty high level of 15 dB. Initialise
> the register to the minimum -3 dB level instead.
> 
> This is specifically needed to allow machine drivers to use the lowest
> level as a volume limit.
> 
> Cc: stable@vger.kernel.org      # 6.5
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   sound/soc/codecs/wsa883x.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
> index 32983ca9afba..8942c88dee09 100644
> --- a/sound/soc/codecs/wsa883x.c
> +++ b/sound/soc/codecs/wsa883x.c
> @@ -722,7 +722,7 @@ static struct reg_default wsa883x_defaults[] = {
>   	{ WSA883X_WAVG_PER_6_7, 0x88 },
>   	{ WSA883X_WAVG_STA, 0x00 },
>   	{ WSA883X_DRE_CTL_0, 0x70 },
> -	{ WSA883X_DRE_CTL_1, 0x08 },

this is hw default value.

> +	{ WSA883X_DRE_CTL_1, 0x1e },
>   	{ WSA883X_DRE_IDLE_DET_CTL, 0x1F },
>   	{ WSA883X_CLSH_CTL_0, 0x37 },
>   	{ WSA883X_CLSH_CTL_1, 0x81 },
