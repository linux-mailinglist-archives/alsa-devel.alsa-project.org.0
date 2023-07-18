Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CC9758011
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 16:48:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 855B6203;
	Tue, 18 Jul 2023 16:47:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 855B6203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689691713;
	bh=nntp6Z+Ep86PUlXEipRd0P/YkBhZWRuQ9y0VhLJYKOg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tTJ/YhwQi0Cudfhzhr+hdWIuobDTglo7b8xLYwYe5/J0geVDi4DA7jVGlokveR3dP
	 Cx7QkKJabgPlRDxxbvJrI14/30rDXHsZeAWN2p919WRzkZIhBw5soIgT2YzWgRmMfA
	 xo/ruI+pxu48qlpP/gg7pmRDSVQG+hSO8BHjd1ZU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1F8CF80557; Tue, 18 Jul 2023 16:47:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70CF0F80520;
	Tue, 18 Jul 2023 16:47:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43844F8032D; Tue, 18 Jul 2023 16:45:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FROM_FMBLA_NEWDOM,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C86FF8027B
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 16:45:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C86FF8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256
 header.s=google header.b=Lezb0Ief
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b7430bda8bso94303421fa.0
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Jul 2023 07:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1689691534; x=1692283534;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W2zwwCfkIozFWwLnA5jFpijFmfmyvTaUAGYURu2s/po=;
        b=Lezb0Ief4c6JjTpxuohSz0hqGuHGjxf1QdXV8geVM+D9npulzjiNanxjBN2RcCVPeY
         djlpd2XF1VdRmEv8mpvAx7Ff9LSQllankGgUDxyn3fgzOaqstufwOC6Dd9soUa7HBq/w
         Uipm1fiYHJJ3WEyrGgrZpKRzw8hfM4DYqRusHsKZE+MMyquSstz5Cr3uslwA5R3pxHIX
         3wxsOsQuGs3E+8ZEN4qtAsAbRX14EyJrgHhRPDa1hZnNZvwjCI/uE1w5cwxiWev5q/ZM
         o8ZEmRbqkj+47wYDwykmhTh1UffOPnhzgUeDT7GzBTxbgMrORoary4r/mzJZiedx2Zcl
         UZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689691534; x=1692283534;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W2zwwCfkIozFWwLnA5jFpijFmfmyvTaUAGYURu2s/po=;
        b=AOAL6JzuODOjMWONOFWKriigoDvH+Yt0FKg2qqCLh3XrrqYP+Bpd+YCZ9OTtu2MRHa
         3TOXw1CgYlbF4bQ9sBNRFqwFkFlSuXDUD3Wc6Xzjho1D6+CI4GLw+bQIvdar3k5F5xWI
         2zIv6nHDVK4gzIBK4eph/zYIFHQGDZ5N7XGP6cAEDjW6FbYj29zbeRPXKR4hVLTpnn+V
         bWFAPCsCoaih/WCwMQ8RvSrBh6asxt78lnOtS5o2CH+ywaoZoMXdmK2hD3Cul9dRFck6
         ittCX/JkIQoQrpu8Eb1p2UP+RXEjOPWgk0xNFLb428eHdbtvZhKSi6Rw4DanMyyiS16n
         VPag==
X-Gm-Message-State: ABy/qLZBZe53C95llRaDp5UnkoKj3MuIy0X9IHkZg9kVAywgabl834j4
	iY9jFJqyP6j41Kj6RRhQIivctQ==
X-Google-Smtp-Source: 
 APBJJlFt0um57HKV5iqSG5EAXXpTWqaxofl4/V8vxgmyPC9LAmOpuZWYnpdgbjb096PF/AK8UK3ZmA==
X-Received: by 2002:a2e:a0cd:0:b0:2b9:412a:111d with SMTP id
 f13-20020a2ea0cd000000b002b9412a111dmr5641714ljm.42.1689691534470;
        Tue, 18 Jul 2023 07:45:34 -0700 (PDT)
Received: from [10.0.2.15] ([82.78.167.79])
        by smtp.gmail.com with ESMTPSA id
 l13-20020a17090615cd00b00993150e5325sm1121623ejd.60.2023.07.18.07.45.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 07:45:34 -0700 (PDT)
Message-ID: <485f05e3-75a4-4cda-7a40-8efdeb3da9d7@tuxon.dev>
Date: Tue, 18 Jul 2023 17:45:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 03/11] ASoC: atmel: mchp-pdmc: Use snd_ctl_remove_id()
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Cc: Claudiu Beznea <claudiu.beznea@microchip.com>,
 Mark Brown <broonie@kernel.org>
References: <20230718141304.1032-1-tiwai@suse.de>
 <20230718141304.1032-4-tiwai@suse.de>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20230718141304.1032-4-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: claudiu.beznea@tuxon.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: EEQQINCM6LOWTFIZXZBMYU4GNACPM33T
X-Message-ID-Hash: EEQQINCM6LOWTFIZXZBMYU4GNACPM33T
X-Mailman-Approved-At: Tue, 18 Jul 2023 14:47:02 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EEQQINCM6LOWTFIZXZBMYU4GNACPM33T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 18.07.2023 17:12, Takashi Iwai wrote:
> Use the standard snd_ctl_remove_id() helper instead of open code for
> removing a kctl.  This helps for avoiding possible races.
> 
> Cc: Claudiu Beznea <claudiu.beznea@microchip.com>
> Cc: Mark Brown <broonie@kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
>   sound/soc/atmel/mchp-pdmc.c | 12 ++----------
>   1 file changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
> index c79c73e6791e..1a069f4cdcda 100644
> --- a/sound/soc/atmel/mchp-pdmc.c
> +++ b/sound/soc/atmel/mchp-pdmc.c
> @@ -386,7 +386,6 @@ static int mchp_pdmc_open(struct snd_soc_component *component,
>   	for (i = 0; i < ARRAY_SIZE(mchp_pdmc_snd_controls); i++) {
>   		const struct snd_kcontrol_new *control = &mchp_pdmc_snd_controls[i];
>   		struct snd_ctl_elem_id id;
> -		struct snd_kcontrol *kctl;
>   		int err;
>   
>   		if (component->name_prefix)
> @@ -400,17 +399,10 @@ static int mchp_pdmc_open(struct snd_soc_component *component,
>   		id.device = control->device;
>   		id.subdevice = control->subdevice;
>   		id.index = control->index;
> -		kctl = snd_ctl_find_id(component->card->snd_card, &id);
> -		if (!kctl) {
> -			dev_err(component->dev, "Failed to find %s\n", control->name);
> -			continue;
> -		}
> -		err = snd_ctl_remove(component->card->snd_card, kctl);
> -		if (err < 0) {
> +		err = snd_ctl_remove_id(component->card->snd_card, &id);
> +		if (err < 0)
>   			dev_err(component->dev, "%d: Failed to remove %s\n", err,
>   				control->name);
> -			continue;
> -		}
>   	}
>   
>   	return 0;
