Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D42483253D
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jan 2024 08:48:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 791A6826;
	Fri, 19 Jan 2024 08:47:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 791A6826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705650475;
	bh=8b0OH0xUnUIRqm4g1vnAVHY4vBjzdLIxY+MjcPSp0jc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FAfw5LvV1YAEeTZ0ZlLtHLelealo8WMnsZs5oQV8m+07LbNqnYmhrSopyEO3nlEhq
	 +57H97lKBRB1TfD1Apsi96gfHypXstVnGi12Og2thfz7oJbYm1gP3bIbtb4tgPvojX
	 jUukWPocP3Ju+aY6qRu36dtUWpqNjWZ55n56iyVw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9914FF8058C; Fri, 19 Jan 2024 08:47:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C5D5F80579;
	Fri, 19 Jan 2024 08:47:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4F2DF80236; Fri, 19 Jan 2024 08:47:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0376F80074
	for <alsa-devel@alsa-project.org>; Fri, 19 Jan 2024 08:47:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0376F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=XOlV8DcU
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-336c8ab0b20so399279f8f.1
        for <alsa-devel@alsa-project.org>;
 Thu, 18 Jan 2024 23:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705650418; x=1706255218;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CU1bMRxchSmRgivc/iAZKp78DVFdSvb1675ltw30IVs=;
        b=XOlV8DcU8bzoHiuinmkhgB0/PWgvEGJdwJdiCQFU9PKqTHypNoqxJqyy0OUcRZGE49
         /UEZbuO6lY18AAOCUOLBdWPInK36LHq1mh1Tq0wZU9aE7j5vMoN6a2Z3MGMovOfVBG9R
         V3rWgO2Vbd+i9SKrLJ1T4SNvQKiwtSUyWRgRrGHdMrZxNM+3+KUh98Xqa/BFIp4Cikje
         72ZniRinUC89LB3rFvO14Rkgj8hUGlCa2vHDPVMw0a8ta6SWpQsgVimS1Lopg7MDTFnl
         LyE+S1kRoAvUeL6hG6L+d1qWL1Q0ph1TXylGdl/C5ElD/0UUGjoolW4IpmINi3RPYEc/
         zf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705650418; x=1706255218;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CU1bMRxchSmRgivc/iAZKp78DVFdSvb1675ltw30IVs=;
        b=DxqjAbDrrvBQmYa2TwXSMehtSbFYtgroaqWxdhdC4CgVFVtP3jLqKPyhj1OsNmJoMu
         bQdIs2TDTyIH9d8CvaabfYcmcBOg6gjGNhYlRyn/808sci2cqYYJTV8nvH7wr2MmiiNY
         caFi6TWorYmk1L4MTVqhOU8tTipqeVryzv1utgr38xaTE/jOqM0X5VsK1YsghV1oXUte
         XUWRRff6xeCB+YTI7LRNNp+KcplE8+R7A+h0CJdLna/P7RbNgIZQH1Ag2xfYE+UjOQE6
         AgpUQRX+hTah7hn2hD3tV8pCi2j5bl7LiiXpCMc1UO2iF0DjNC3vjmRO+WsDKqTkw2fY
         zi0Q==
X-Gm-Message-State: AOJu0YyyidAlV8obiK4IGUP5nu8yC4M7A3gUEV7ADGQrkOoIKlwrDYCt
	28nLa2bYzgZ+SmZPv+fhqV9APBIDsdv0bxl/XKpt0v9ZrBNSaCHpcaXmi3lzhG0=
X-Google-Smtp-Source: 
 AGHT+IEhw6s1pS2VfA22BXnpQeWJC5uAZOEj3NPjFPfG9FpToVt7TF8T+6POBzJJ7OClzcaST60Xjg==
X-Received: by 2002:adf:b319:0:b0:336:6d62:7647 with SMTP id
 j25-20020adfb319000000b003366d627647mr1345275wrd.5.1705650418658;
        Thu, 18 Jan 2024 23:46:58 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 i6-20020adfb646000000b00337bc2176f6sm5800237wre.81.2024.01.18.23.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 23:46:58 -0800 (PST)
Message-ID: <456eaa3a-7f0c-4b28-aeca-2af60475011a@linaro.org>
Date: Fri, 19 Jan 2024 07:46:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] ASoC: codecs: wcd9335: drop unused gain hack
 remnant
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240118165811.13672-1-johan+linaro@kernel.org>
 <20240118165811.13672-6-johan+linaro@kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240118165811.13672-6-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: JDIEWGX4BBPWIPW55UBCMMJA5SDREHT2
X-Message-ID-Hash: JDIEWGX4BBPWIPW55UBCMMJA5SDREHT2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JDIEWGX4BBPWIPW55UBCMMJA5SDREHT2/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 18/01/2024 16:58, Johan Hovold wrote:
> The vendor driver appears to be modifying the gain settings behind the
> back of user space but these hacks never made it upstream except for
> some essentially dead code that adds a constant zero to the current gain
> setting on DAPM events.
> 
> Note that the volume registers still need to be written after enabling
> clocks in order for any prior updates to take effect.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

lgtm,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


--srini
>   sound/soc/codecs/wcd9335.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
> index 43c648efd0d9..deb15b95992d 100644
> --- a/sound/soc/codecs/wcd9335.c
> +++ b/sound/soc/codecs/wcd9335.c
> @@ -3033,7 +3033,6 @@ static int wcd9335_codec_enable_mix_path(struct snd_soc_dapm_widget *w,
>   {
>   	struct snd_soc_component *comp = snd_soc_dapm_to_component(w->dapm);
>   	u16 gain_reg;
> -	int offset_val = 0;
>   	int val = 0;
>   
>   	switch (w->reg) {
> @@ -3073,7 +3072,6 @@ static int wcd9335_codec_enable_mix_path(struct snd_soc_dapm_widget *w,
>   	switch (event) {
>   	case SND_SOC_DAPM_POST_PMU:
>   		val = snd_soc_component_read(comp, gain_reg);
> -		val += offset_val;
>   		snd_soc_component_write(comp, gain_reg, val);
>   		break;
>   	case SND_SOC_DAPM_POST_PMD:
> @@ -3294,7 +3292,6 @@ static int wcd9335_codec_enable_interpolator(struct snd_soc_dapm_widget *w,
>   	u16 gain_reg;
>   	u16 reg;
>   	int val;
> -	int offset_val = 0;
>   
>   	if (!(snd_soc_dapm_widget_name_cmp(w, "RX INT0 INTERP"))) {
>   		reg = WCD9335_CDC_RX0_RX_PATH_CTL;
> @@ -3337,7 +3334,6 @@ static int wcd9335_codec_enable_interpolator(struct snd_soc_dapm_widget *w,
>   	case SND_SOC_DAPM_POST_PMU:
>   		wcd9335_config_compander(comp, w->shift, event);
>   		val = snd_soc_component_read(comp, gain_reg);
> -		val += offset_val;
>   		snd_soc_component_write(comp, gain_reg, val);
>   		break;
>   	case SND_SOC_DAPM_POST_PMD:
