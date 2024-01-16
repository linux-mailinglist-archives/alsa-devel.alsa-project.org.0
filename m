Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4C882EF15
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jan 2024 13:34:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C420D828;
	Tue, 16 Jan 2024 13:33:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C420D828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705408434;
	bh=mGdkX3pddEwwJdJ42S9B2Mmlq5Jtq9cqOqa7xV/tgdI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F9PvssC6DfD4fcqK3Vy4XO9wh0j4O+cLZACrxhU0Q1W45aPZ45XMGmyEeFkVHO2Vi
	 lrQQb9hzh0BwIEvu/3hJISq3G2V0P5Ae8odwukz/g4c1wkGCRtmayjWji9tm8SePUF
	 5mbj4om5MtpxG1nv5nVAbf7DCvcSH9tbvf5x8OcA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E62D5F80588; Tue, 16 Jan 2024 13:33:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10370F80563;
	Tue, 16 Jan 2024 13:33:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D080F801F5; Tue, 16 Jan 2024 13:33:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7BCD2F80074
	for <alsa-devel@alsa-project.org>; Tue, 16 Jan 2024 13:33:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BCD2F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=hhUuEl4m
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-336897b6bd6so9462577f8f.2
        for <alsa-devel@alsa-project.org>;
 Tue, 16 Jan 2024 04:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705408389; x=1706013189;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OhwDIlaEEN6IPWd1oZ/unSnl3T485q1gaJvRsEwi2vU=;
        b=hhUuEl4mWkQU/qkD8i1ZaVDkmEJ6AfLIC4fnWy1sTQ44wHPXH93IxSfIvbKPN1ZfIp
         niTdK1FtO1XamLfG9Hy9JBDulzjbNCm+KOc6foNOhONEu8U/95mBiK1sPq5+OeIHT9Ss
         SDqgMzLw4ZWHKnW4QP/NctONRJ5dKvP3evZKjRTuCbJDiQXS+VcKkarYVXtUZn8kf+iA
         L8a2+33nVJqfvFxtdp2omYvv03MAPKQJZo8pjMpg4oO37LCBGZGDBVut6z52taIqs5Nl
         Xoj4aBukcVjpWFX8dCtAJSSmQUX5jajOhPt6LwnxQfkipHVK79nG1BpsJy5uP/YxeA+N
         KtxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705408389; x=1706013189;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OhwDIlaEEN6IPWd1oZ/unSnl3T485q1gaJvRsEwi2vU=;
        b=EsZXTkAXn8rl/cn1CJcPH+8YdARpfgUhoZlzaCSoVN2vClrnpuqKPgVvxZoTVlYBlN
         QydlekWAjiXbFL4LIj+wKtlCn3y/O2Rm5JWPGgd5vnuIMn5nqQBGre22f4RAP2DUPsBv
         6ySM3443shsIkHi5UaL8PuI1yz6wY2ynfGr3VdO1UQY9HsCMTlItMDNj1Oy0iXMWMR+p
         ZLLVOZDO/XXyNa5eM7iHrMKFkSMaM0gg0IDd7e3jsweuqor0FepqsSqS0YYJxWDo5G97
         Vrw/dmauJ9GvnMMXz7xkv6hTN1hk16CZ5FpLlN/6oZ1MOWrCr+go3iKIcq6fl8d8/b3z
         3TIA==
X-Gm-Message-State: AOJu0YzEErPV8e0y8SFlhVRBfVwhFmi2QJO2jnCuP3RZF9Q2SDDLBi2+
	H4LNbA+mLmrc5rmzZ2rFmUDBMDyQ75EqxA==
X-Google-Smtp-Source: 
 AGHT+IFgwZ7izOeDPTthu6pYyW2p4PI/uPvVFhtOSZUOvCWzjb3MxbacVOYISzw2xSeZlOWjyex6jA==
X-Received: by 2002:a05:600c:45d0:b0:40e:6ee8:c13e with SMTP id
 s16-20020a05600c45d000b0040e6ee8c13emr2391947wmo.197.1705408388946;
        Tue, 16 Jan 2024 04:33:08 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 p12-20020a05600c430c00b0040e596320bfsm6855662wme.0.2024.01.16.04.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 04:33:08 -0800 (PST)
Message-ID: <dda000cb-9d3d-40d8-9a6c-170d491f48f1@linaro.org>
Date: Tue, 16 Jan 2024 12:33:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] ASoC: codecs: msm8916-wcd-digital: drop dead gain
 hacks
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240116093903.19403-1-johan+linaro@kernel.org>
 <20240116093903.19403-8-johan+linaro@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240116093903.19403-8-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: D32RQ6WVUF6LF6QFVSVVKYSYRKT22PD2
X-Message-ID-Hash: D32RQ6WVUF6LF6QFVSVVKYSYRKT22PD2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D32RQ6WVUF6LF6QFVSVVKYSYRKT22PD2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Johan,

did you see any issue with this codec?

These are not really hacks, to make the gains effective it has to be 
applied in a particular order.


On 16/01/2024 09:39, Johan Hovold wrote:
> -		/* apply the digital gain after the interpolator is enabled */

As you noticed in the comments, the gains have to be reprogrammed after 
interpolator and its clks are enabled.


> -		usleep_range(10000, 10100);
> -		snd_soc_component_write(component, rx_gain_reg[w->shift],
> -			      snd_soc_component_read(component, rx_gain_reg[w->shift]));
> -		break;
>   	case SND_SOC_DAPM_POST_PMD:
>   		snd_soc_component_update_bits(component, LPASS_CDC_CLK_RX_RESET_CTL,
>   					      1 << w->shift, 1 << w->shift);
> @@ -630,9 +613,6 @@ static int msm8916_wcd_digital_enable_dec(struct snd_soc_dapm_widget *w,
>   		snd_soc_component_update_bits(component, tx_mux_ctl_reg,
>   				    TX_MUX_CTL_HPF_BP_SEL_MASK,
>   				    TX_MUX_CTL_HPF_BP_SEL_NO_BYPASS);
> -		/* apply the digital gain after the decimator is enabled */
same here.

> -		snd_soc_component_write(component, tx_gain_reg[w->shift],
> -			      snd_soc_component_read(component, tx_gain_reg[w->shift]));
