Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B1C8324FA
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jan 2024 08:18:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F08A205;
	Fri, 19 Jan 2024 08:17:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F08A205
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705648685;
	bh=+0T0th1rKcmyeEaP/OzGGn0TFYJ3ZGJGGrbEuBW5aoA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o+MJzhGEU7/lxQe7HjbaV/sX70Dld2jRFpcjIR0wgzLLQ4rLMvnOCuv0EMCiRSWPY
	 F6Z9VwBASwXawOkLlYTdBoNgR7dj80n7XeG80bC2NVFZM3HUIoMnd+X8R9EZvHL7Rm
	 xfbZaewkhYkHReNd2U788dss7zVmtTRKgNZMVq6E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE8EAF80588; Fri, 19 Jan 2024 08:17:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71E1FF8057D;
	Fri, 19 Jan 2024 08:17:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33FA3F801F5; Fri, 19 Jan 2024 08:14:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A7102F8003A
	for <alsa-devel@alsa-project.org>; Fri, 19 Jan 2024 08:14:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7102F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=X3eFQtWF
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40e7065b7bdso4890015e9.3
        for <alsa-devel@alsa-project.org>;
 Thu, 18 Jan 2024 23:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705648446; x=1706253246;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i72MfFyOZMrd+BSQwwi+n4pSqhokb64bOd5tJv0/2UM=;
        b=X3eFQtWFUcQwQArxZxlbC5inYX3r2yxeANnXGwzRoQesBpnh6aQdjOh7PkYaUxVnQJ
         LfqQ37aqqDthAqFwak4lIQN3QkOn0O7ZhiALRSP+sbupdwKbsE2sZKAHSc/baQ3ICkox
         E+WHdK5qCxeXazd+8/QhkBRCkG0VqIBYxX/9du1lqCaBlFlj9V2l0yjOYtisduD4b7V5
         MxREb1OKtUkCCGaoL7hvs6no+FBQk3WBiOU2VyS6PioTOIkzxLb8vsuaYFHZGb667CV2
         hhrii4h4kpZ21aWAOX41J9XhptW5tYE/xrAyAFscEmLy2tJCiswd6tCFJy+ZhosPrrJX
         H/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705648446; x=1706253246;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i72MfFyOZMrd+BSQwwi+n4pSqhokb64bOd5tJv0/2UM=;
        b=uzS/XU1JMKub87Q5mGCC4Y3PXGw/DqxMxQam/zP8DS4a+CZt8zajD81RFLVdt+lE9l
         6qyyIbE6faDn9koEOnkNGrmW4fQuE2L6ERycrnfE9td5G4aSMymtHIkc8ttNpvqRlosh
         jvblD63Ck/5b3N6doo1cKJnRlY2XXDSWm8zsGHpObWMdkVqGyJ6Yk6UPmbuTo//640jj
         ZOUJjFDpTy1WLlfyoA7BoYrQTgdkE+yD9xkZ3SOjpgc3dTw7xyiQ/mKATB3lEs2W68W0
         9VwXRWySGOvQK4pwL/w6vIFH3ejjVr0ICQcdd34T3r1ayBugs4dIe5uyTcaVSsYkrGWN
         k3NQ==
X-Gm-Message-State: AOJu0Yyg6+Y14Qh0xobj97S4p2+W4VgEaQZtZr1YOfB+nB8WW0t2p3Qn
	RFOa2pfhHR3Qa23S81TSWq3tdp5Dl3InnGMCX97vOWplKQHzIxFTzJGCnMehRH8=
X-Google-Smtp-Source: 
 AGHT+IHl2Kkada6JZ4n+CkhFjQG/uScWhBunryRyzHRlXDI9RMUkV5Irt0J4JgQHuxoC6mETq4UhQQ==
X-Received: by 2002:a05:600c:3b0f:b0:40e:9f2f:3590 with SMTP id
 m15-20020a05600c3b0f00b0040e9f2f3590mr102316wms.272.1705648446196;
        Thu, 18 Jan 2024 23:14:06 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 2-20020a05600c020200b0040ea00a0b75sm14034wmi.0.2024.01.18.23.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 23:14:05 -0800 (PST)
Message-ID: <3494d23f-2a56-4f13-a619-e240d208d300@linaro.org>
Date: Fri, 19 Jan 2024 07:14:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] ASoC: codecs: wsa883x: fix PA volume control
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20240118165811.13672-1-johan+linaro@kernel.org>
 <20240118165811.13672-2-johan+linaro@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240118165811.13672-2-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FCM32Z7MQ6HM7HGPNLUSSBME3TS2VGTV
X-Message-ID-Hash: FCM32Z7MQ6HM7HGPNLUSSBME3TS2VGTV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FCM32Z7MQ6HM7HGPNLUSSBME3TS2VGTV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 18/01/2024 16:58, Johan Hovold wrote:
> The PA gain can be set in steps of 1.5 dB from -3 dB to 18 dB, that is,
> in fifteen levels.
> 
> Fix the range of the PA volume control to avoid having the first
> sixteen levels all map to -3 dB.
TBH, we really don't know what unsupported values map to w.r.t dB.

> 
> Note that level 0 (-3 dB) does not mute the PA so the mute flag should
> also not be set.
> 
> Fixes: cdb09e623143 ("ASoC: codecs: wsa883x: add control, dapm widgets and map")
> Cc: stable@vger.kernel.org      # 6.0
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   sound/soc/codecs/wsa883x.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
> index cb83c569e18d..32983ca9afba 100644
> --- a/sound/soc/codecs/wsa883x.c
> +++ b/sound/soc/codecs/wsa883x.c
> @@ -1098,7 +1098,7 @@ static int wsa_dev_mode_put(struct snd_kcontrol *kcontrol,
>   	return 1;
>   }
>   
> -static const DECLARE_TLV_DB_SCALE(pa_gain, -300, 150, -300);
> +static const DECLARE_TLV_DB_SCALE(pa_gain, -300, 150, 0);
>   
>   static int wsa883x_get_swr_port(struct snd_kcontrol *kcontrol,
>   				struct snd_ctl_elem_value *ucontrol)
> @@ -1239,7 +1239,7 @@ static const struct snd_soc_dapm_widget wsa883x_dapm_widgets[] = {
>   
>   static const struct snd_kcontrol_new wsa883x_snd_controls[] = {
>   	SOC_SINGLE_RANGE_TLV("PA Volume", WSA883X_DRE_CTL_1, 1,
> -			     0x0, 0x1f, 1, pa_gain),
> +			     0x1, 0xf, 1, pa_gain),

gain field in register is Bit[5:1], so the max value of 0x1f is correct 
here. However the range of gains that it can actually support is only 0-15.

If we are artificially setting the max value of 0xf here, then somewhere 
we should ensure that Bit[5] is set to zero while programming the gain.

Whatever the mixer control is exposing is clearly reflecting what 
hardware is supporting.

--srini


>   	SOC_ENUM_EXT("WSA MODE", wsa_dev_mode_enum,
>   		     wsa_dev_mode_get, wsa_dev_mode_put),
>   	SOC_SINGLE_EXT("COMP Offset", SND_SOC_NOPM, 0, 4, 0,
