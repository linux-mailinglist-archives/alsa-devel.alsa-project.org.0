Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B773F832518
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jan 2024 08:40:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 948DA7F1;
	Fri, 19 Jan 2024 08:39:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 948DA7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705649999;
	bh=wnMv6grck/8JUvYsXcxoc9iHXWWkN00HXHmU8cOzKA8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=flNRce2HWHsoKpESPUoCjGXOkcIsjhcU97W8vqTGHenofGcdScactJmVm77ROLM1l
	 VBbHgfe71X6hFH2Dz+tBAXCGcA4kBydXozhf9tPjVublUWSkNStLPFxc1lTzyv7V/9
	 LM1G2NlZummKi8PuSe/n2RIcLmaqQXuj+b6ulgHM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C8A4F804E7; Fri, 19 Jan 2024 08:39:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 958A3F802BE;
	Fri, 19 Jan 2024 08:39:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECFA5F801F5; Fri, 19 Jan 2024 08:37:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E9C06F80074
	for <alsa-devel@alsa-project.org>; Fri, 19 Jan 2024 08:37:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9C06F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=rhb2mG6a
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40e8801221cso4181705e9.1
        for <alsa-devel@alsa-project.org>;
 Thu, 18 Jan 2024 23:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705649835; x=1706254635;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gRVEGEADVnU1rj2ZsZLhkpAgQRXYe6tlf4fK3vtgXN8=;
        b=rhb2mG6a+AW6D5TRHOcnONb47jI5TQZxMBNqP6QIQqTEIWHdwHVO4eF0uy86eVfHSZ
         1ggcm3PUyS9YpCBSc8uLYuh67AYhg/sKe+1F1La1a6CMIdJ2XmId6MPkE+dtBz049z6u
         Tst7MrHeowX9b4q4bXahv58WCiNoRy2yWMlNtWfg+gLSyFlhAj6L9jKk5by2y7Xug5Yp
         yDd4uJY4SC7vzjiyHgOuaCbKYHe6Qic5AeBMdrQEqnN6E6Fm/lnYYiXHgpGDr4soS02n
         Qy05lhzETTSrFUXQ6K0i/KbKbeJTyqCNNwltN7o9gU7lOMiH5s31bG7N3iT8OvYQIZfF
         Gn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705649835; x=1706254635;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gRVEGEADVnU1rj2ZsZLhkpAgQRXYe6tlf4fK3vtgXN8=;
        b=Im5NDNTLQCfWc9DWNEK/x/gvjdbtAl1AtZ7LX7Wz5pHHb/HIVeVgbg6bPq51Xb8Vlx
         kCrCB/c1oSaJUbG3bjXbaomxhtpSL4OQqo4oIV7jMf9/NXzHnwBzoVuL7pn1/d2iNtdr
         ZkVRuV6CAg6DwG+LCG2iq6jvgQLHF6qLZ4gYInXHeCQ/B2pX/8QtyVnPhixLgnZJWuPl
         VcZpDMuiJ1RgCbjRJRfDCyc4qVW58YsFPuC2Aeq8wsSs+eMQf1n2+HeEVYKhaW/nU7Qx
         U5gQSFoOsdJNxWVfKBmwQL03LpYIK+CkQ9t9HSl0iKKmWkByG3VrYnkW+auWhQCsBfWb
         pviQ==
X-Gm-Message-State: AOJu0YxHj+Kl/0EzoNn2Hg4SzugGd5O8vXXCvR9sCtipeEm1n5nTNxm4
	YNxuZDHYgkI0wPz9zujLBoAT/jtP9sy1DZ1u0VJRzzvy9BROrs+U4hcC7Ca9GKo=
X-Google-Smtp-Source: 
 AGHT+IGuGmikPGSsHZHY9FIadEyh4MkIKPIZmnPKnfXBLGan0KHUJRVxzqp0unv1usUGifgHR7kXog==
X-Received: by 2002:a7b:cbd7:0:b0:40d:87eb:fa98 with SMTP id
 n23-20020a7bcbd7000000b0040d87ebfa98mr1344916wmi.28.1705649835643;
        Thu, 18 Jan 2024 23:37:15 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 l22-20020a05600c4f1600b0040d6b91efd9sm31782328wmq.44.2024.01.18.23.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 23:37:15 -0800 (PST)
Message-ID: <ac6eb9f9-9a5c-472d-9a57-ee509d9589f9@linaro.org>
Date: Fri, 19 Jan 2024 07:37:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] ASoC: qcom: sc8280xp: limit speaker volumes
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20240118165811.13672-1-johan+linaro@kernel.org>
 <20240118165811.13672-4-johan+linaro@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240118165811.13672-4-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: W2NBIBMXY63LJPXKRZG3TUGOHSYKF6AZ
X-Message-ID-Hash: W2NBIBMXY63LJPXKRZG3TUGOHSYKF6AZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W2NBIBMXY63LJPXKRZG3TUGOHSYKF6AZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 18/01/2024 16:58, Johan Hovold wrote:
> The UCM configuration for the Lenovo ThinkPad X13s has up until now
> been setting the speaker PA volume to -3 dB when enabling the speakers,
> but this does not prevent the user from increasing the volume further.
> 
> Limit the PA volume to -3 dB in the machine driver to reduce the risk of
> speaker damage until we have active speaker protection in place.
> 
> Note that this will probably need to be generalised using
> machine-specific limits, but a common limit should do for now.
> 
> Cc: stable@vger.kernel.org	# 6.5
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   sound/soc/qcom/sc8280xp.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index ed4bb551bfbb..a19bfa354af8 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -32,12 +32,14 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
>   	case WSA_CODEC_DMA_RX_0:
>   	case WSA_CODEC_DMA_RX_1:
>   		/*
> -		 * set limit of 0dB on Digital Volume for Speakers,
> -		 * this can prevent damage of speakers to some extent without
> -		 * active speaker protection
> +		 * Set limit of 0 dB on Digital Volume and -3 dB on PA Volume
> +		 * to reduce the risk of speaker damage until we have active
> +		 * speaker protection in place.

I would prefer a 0dB here instead of -3dB, this could become issue if we 
are testing speakers without any pluseaudio or any software 
amplification. ex: console


>   		 */
>   		snd_soc_limit_volume(card, "WSA_RX0 Digital Volume", 84);
>   		snd_soc_limit_volume(card, "WSA_RX1 Digital Volume", 84);
> +		snd_soc_limit_volume(card, "SpkrLeft PA Volume", 1);
> +		snd_soc_limit_volume(card, "SpkrRight PA Volume", 1)

It would be nice to consider using component->name_prefix here.


thanks,
srini
;

>   		break;
>   	default:
>   		break;
