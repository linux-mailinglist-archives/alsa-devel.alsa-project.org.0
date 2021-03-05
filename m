Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B3132E4B4
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Mar 2021 10:23:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EE0917B4;
	Fri,  5 Mar 2021 10:23:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EE0917B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614936237;
	bh=AM87Q9rHBCKnCMxptJ2pZp2AcK901fh/YY3zCQkpfEE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vGdHXthUpUxyk3WlxGsATbCcY1UyszW4BiYbWbQLL3d/ae6t6X7u+YJqqH7AInhVL
	 KFj3OhV4KWm5BjS+SWq3uYa2fuWnGcNmP4iitFjm4vyNhVJpNSkDZjTMwx8A2549+l
	 P4rTeS/48GD3WXxD5hIoyotvODnMCCtYXWP+E97s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD14BF800F3;
	Fri,  5 Mar 2021 10:22:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0F8BF8025E; Fri,  5 Mar 2021 10:22:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7554F800F3
 for <alsa-devel@alsa-project.org>; Fri,  5 Mar 2021 10:22:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7554F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="HoyGLNY7"
Received: by mail-wm1-x32f.google.com with SMTP id
 w203-20020a1c49d40000b029010c706d0642so5693180wma.0
 for <alsa-devel@alsa-project.org>; Fri, 05 Mar 2021 01:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=URqG5L18cDBBwa4eOeQoxnZ8Y3fXypRiyHuYJ5+QuzE=;
 b=HoyGLNY7ohPCLRBEGZb5FPIUYBtc9xzKJZYixoFjiDRS45I46wdSoaCL7GNgYVFZg+
 E7JWOrqne/UdPWudNYXxJlC2G3q7mwUrsa3Txpk0aMKuaL++bi/QrJds6gHZf6LaqaZD
 Lxu7QP+OT5diVZWtlQcW2RG21ghUvUMmPgZ80myqMStadnBdoZeyTpgcyXmkRNU6SeQu
 FcG/dV7NUqO24jxHQb37R/y2VCP0/4h/M/uk0hfDMUAvPKIC4yOsEI0WQPwCYFHZ1VIC
 670r7GtkPT3gR1JlNNehohXTuHpFT7JGbLpUsPL06lM5Ywtss/1xuTmaesYQVbMybt54
 2/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=URqG5L18cDBBwa4eOeQoxnZ8Y3fXypRiyHuYJ5+QuzE=;
 b=NNB+gdgjcq6BFwYB7O1yxx6mkPLZybt9iNCjqPzBJv9eVJLNzEgCQb9ojpsyjFbesA
 IHVYwLWaaRvoR2wwew6FQsz7MooTA0aGXa4KO6axNJEI9cUNlysK4NeQ9bzZonQ7KHmO
 mNZHVVuiH4if/s25CpSmDQWrYPcJnHICQWR2f0D5BAARu8lPKJQQfi5qpkQqV2cC4slT
 DidvSgKWupMXlAenipD7qfeOxhM+WPhK6JNw9pJqcgZhPUiRrqN79uzmpKYN4/oozA3s
 QaK0C4xBRj8QFvgQ6DN8mgwgo0vpkENBrs13BJugYifPzD0OWGVjgJ+s4MavK0bP+rsW
 RGVw==
X-Gm-Message-State: AOAM531gfiWAb5MCVMSXT87Q1HPIvUOLMYEyG+9DQ54VvdYyVWNZhZZg
 AUw7besdYFrJsXnZFqWXElHS1g==
X-Google-Smtp-Source: ABdhPJwUyzXYupqpsGjWfl+dJhKYsjoKpRJUNtYpHzgqcAwJq4jNK52aor5/UOe45LmnyozCUn5UWw==
X-Received: by 2002:a7b:c209:: with SMTP id x9mr7839461wmi.92.1614936132969;
 Fri, 05 Mar 2021 01:22:12 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id d204sm3565418wmc.17.2021.03.05.01.22.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Mar 2021 01:22:12 -0800 (PST)
Subject: Re: [PATCH] ASoC: codecs: lpass-va-macro: mute/unmute all active
 decimators
To: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
References: <20210304215646.17956-1-jonathan@marek.ca>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <32f49fa9-136c-91a5-5790-373651719fda@linaro.org>
Date: Fri, 5 Mar 2021 09:22:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210304215646.17956-1-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "moderated list:QCOM AUDIO \(ASoC\) DRIVERS" <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
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

Thanks Jonathan for testing and fixing this use case!


On 04/03/2021 21:56, Jonathan Marek wrote:
> An interface can have multiple decimators enabled, so loop over all active
> decimators. Otherwise only one channel will be unmuted, and other channels
> will be zero. This fixes recording from dual DMIC as a single two channel
> stream.

> 
> Also remove the now unused "active_decimator" field.
> 
> Fixes: 908e6b1df26e ("ASoC: codecs: lpass-va-macro: Add support to VA Macro")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---

LGTM,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


--srini
>   sound/soc/codecs/lpass-va-macro.c | 28 +++++++++++++---------------
>   1 file changed, 13 insertions(+), 15 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
> index 91e6890d6efcb..3d6976a3d9e42 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -189,7 +189,6 @@ struct va_macro {
>   	struct device *dev;
>   	unsigned long active_ch_mask[VA_MACRO_MAX_DAIS];
>   	unsigned long active_ch_cnt[VA_MACRO_MAX_DAIS];
> -	unsigned long active_decimator[VA_MACRO_MAX_DAIS];
>   	u16 dmic_clk_div;
>   
>   	int dec_mode[VA_MACRO_NUM_DECIMATORS];
> @@ -549,11 +548,9 @@ static int va_macro_tx_mixer_put(struct snd_kcontrol *kcontrol,
>   	if (enable) {
>   		set_bit(dec_id, &va->active_ch_mask[dai_id]);
>   		va->active_ch_cnt[dai_id]++;
> -		va->active_decimator[dai_id] = dec_id;
>   	} else {
>   		clear_bit(dec_id, &va->active_ch_mask[dai_id]);
>   		va->active_ch_cnt[dai_id]--;
> -		va->active_decimator[dai_id] = -1;
>   	}
>   
>   	snd_soc_dapm_mixer_update_power(widget->dapm, kcontrol, enable, update);
> @@ -880,18 +877,19 @@ static int va_macro_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
>   	struct va_macro *va = snd_soc_component_get_drvdata(component);
>   	u16 tx_vol_ctl_reg, decimator;
>   
> -	decimator = va->active_decimator[dai->id];
> -
> -	tx_vol_ctl_reg = CDC_VA_TX0_TX_PATH_CTL +
> -				VA_MACRO_TX_PATH_OFFSET * decimator;
> -	if (mute)
> -		snd_soc_component_update_bits(component, tx_vol_ctl_reg,
> -					      CDC_VA_TX_PATH_PGA_MUTE_EN_MASK,
> -					      CDC_VA_TX_PATH_PGA_MUTE_EN);
> -	else
> -		snd_soc_component_update_bits(component, tx_vol_ctl_reg,
> -					      CDC_VA_TX_PATH_PGA_MUTE_EN_MASK,
> -					      CDC_VA_TX_PATH_PGA_MUTE_DISABLE);
> +	for_each_set_bit(decimator, &va->active_ch_mask[dai->id],
> +			 VA_MACRO_DEC_MAX) {
> +		tx_vol_ctl_reg = CDC_VA_TX0_TX_PATH_CTL +
> +					VA_MACRO_TX_PATH_OFFSET * decimator;
> +		if (mute)
> +			snd_soc_component_update_bits(component, tx_vol_ctl_reg,
> +					CDC_VA_TX_PATH_PGA_MUTE_EN_MASK,
> +					CDC_VA_TX_PATH_PGA_MUTE_EN);
> +		else
> +			snd_soc_component_update_bits(component, tx_vol_ctl_reg,
> +					CDC_VA_TX_PATH_PGA_MUTE_EN_MASK,
> +					CDC_VA_TX_PATH_PGA_MUTE_DISABLE);
> +	}
>   
>   	return 0;
>   }
> 
