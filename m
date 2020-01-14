Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3CE13B21A
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 19:28:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2889717F6;
	Tue, 14 Jan 2020 19:27:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2889717F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579026508;
	bh=EeeJkNtBVXiXoB10Ixuk7XO25OfvSonBrt/0Lnt8F8Q=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nyl4YeyN2DDYJXiMiEJeBbGc7DhzS06t72b/su+74pX4801bXseqadiBBSATKi7Gt
	 5ZAFX4xhCC9hi0mBrizr4sJWzKsvbuxiZNbxPFoLA83AYyoNh0XeZIKryhR5bTi1x3
	 fMq9pXhIlpMrPlAwbOJfU6EH3RUxq9YE/l1sElAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2236F80272;
	Tue, 14 Jan 2020 19:25:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64D70F80273; Tue, 14 Jan 2020 19:25:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E0B4F8014E
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 19:25:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E0B4F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="yhinihnr"
Received: by mail-wm1-x344.google.com with SMTP id p17so14926798wma.1
 for <alsa-devel@alsa-project.org>; Tue, 14 Jan 2020 10:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KIRc2jUD/PVXWZnjk3r0uk0JWD7pC3M5orejig0emL0=;
 b=yhinihnrCMIeqRKyquW5Li7Wx6zEeJURvF88Z4vUdG7xZewaXbQfsi71rO8QWMruI7
 4CKuDTpsy0MSNOjgaE0K+lV1GKqns5IsrBPYZGuQz+6ZWcpxon7ERxYRnjVJOB5v53O8
 kokKZFGZQ5NRBFOVcWsqcjOJDwLVCRXJYYLCt7dVXRncwHUSvxy2MPBGxdVpHISN9D4s
 elsuUtkIVWe3a/tJieTNfGTgqiH0kdBSxUBQOxwRrEeeIhgc2GdZCwCPPSe03xyp7+yO
 60/Wxc3oLEndPhi8xaqjFVaV0vo50S4idQtVojSdGLaUmHH/bt9gkuUzN19vkIPMH+mG
 wXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KIRc2jUD/PVXWZnjk3r0uk0JWD7pC3M5orejig0emL0=;
 b=uN0fto7soYf+I9IFfV3wTQ26iD0xG0Q+I+PXv0VOBG9anlF955MjBYS7WnSfxggkVh
 nubtsil3+4MPUk0oFqzoQMVLmBwM/4rVVxQv9dpKg3MC81AK4LDxifeqyI6gMfbuQhIL
 S+kpgFL7QBt8JDYdTk38R6dcIlkCIlDH9IurTEs+BlenK91fNkCR08BbzBiFIlhzmM45
 kJi/Jib/24pfWqyL6nfhnWbzygJ5RgmbAnDvk1CTxjWmFJaBXR1tHDe57Eq44ZQg8K2U
 2JtoIqMWEvrurNypiiQf6OT54fSQ89lPWsGfFofF3pGob1gfV9YiBqJMHmjOGboMLaTX
 1RIg==
X-Gm-Message-State: APjAAAUfJZbzFbpxYFShpEtucDuDMMqUk20JXXxdV3xdDNipjN0eGQKq
 A2XCc7mXngDhQWcGdX9mZFJiRw==
X-Google-Smtp-Source: APXvYqycUnMcsprbHwRhYVmjckW9Sv6+w0Fe7jN7oZ+8+LDkoZ9l0XjlVFwKx+eJSbRgSKJP8NRlSw==
X-Received: by 2002:a1c:7d93:: with SMTP id
 y141mr29675327wmc.111.1579026353164; 
 Tue, 14 Jan 2020 10:25:53 -0800 (PST)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id c2sm20653507wrp.46.2020.01.14.10.25.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 Jan 2020 10:25:52 -0800 (PST)
To: Stephan Gerhold <stephan@gerhold.net>, Mark Brown <broonie@kernel.org>
References: <20200114181229.42302-1-stephan@gerhold.net>
 <20200114181229.42302-2-stephan@gerhold.net>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ce743e56-bcc7-8636-7204-a12d1a304862@linaro.org>
Date: Tue, 14 Jan 2020 18:25:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200114181229.42302-2-stephan@gerhold.net>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, ~postmarketos/upstreaming@lists.sr.ht,
 Nikita Travkin <nikitos.tr@gmail.com>
Subject: Re: [alsa-devel] [PATCH v2 2/2] ASoC: msm8916-wcd-analog: Add MIC
	BIAS Internal3
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 14/01/2020 18:12, Stephan Gerhold wrote:
> PM8916 has three TX inputs that each have an (optional) internal
> RBIAS resistor. MIC BIAS Internal1/2 (for TX1/2) are already supported.
> TX3 does not have its own MIC BIAS supply, instead it is also supplied
> from MIC_BIAS1.
> 
> Now that we have simplified the MIC BIAS Internal* implementation
> we can easily add support for it:
> 
> Add a MIC BIAS Internal3 supply that enables the internal RBIAS
> resistor on TX3, and make sure to also enable the MIC_BIAS1 supply.
> 
> Tested-by: Nikita Travkin <nikitos.tr@gmail.com> # longcheer-l8150
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
> v1: https://lore.kernel.org/alsa-devel/20200111164006.43074-5-stephan@gerhold.net/
> Changes in v2:
>    - Update for changes in previous patch
>      (Use new "MIC_BIAS1" supply instead of "MIC BIAS External1")
> ---
>   sound/soc/codecs/msm8916-wcd-analog.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
> index d6d727f5bae5..85bc7ae4d267 100644
> --- a/sound/soc/codecs/msm8916-wcd-analog.c
> +++ b/sound/soc/codecs/msm8916-wcd-analog.c
> @@ -856,6 +856,7 @@ static const struct snd_soc_dapm_route pm8916_wcd_analog_audio_map[] = {
>   	{"MIC BIAS Internal1", NULL, "MIC_BIAS1"},
>   	{"MIC BIAS External2", NULL, "MIC_BIAS2"},
>   	{"MIC BIAS Internal2", NULL, "MIC_BIAS2"},
> +	{"MIC BIAS Internal3", NULL, "MIC_BIAS1"},
>   };
>   
>   static const struct snd_soc_dapm_widget pm8916_wcd_analog_dapm_widgets[] = {
> @@ -924,6 +925,9 @@ static const struct snd_soc_dapm_widget pm8916_wcd_analog_dapm_widgets[] = {
>   			    pm8916_wcd_analog_enable_micbias_int2,
>   			    SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
>   			    SND_SOC_DAPM_POST_PMD),
> +	SND_SOC_DAPM_SUPPLY("MIC BIAS Internal3", CDC_A_MICB_1_INT_RBIAS, 1, 0,
> +			    pm8916_wcd_analog_enable_micbias_int,
> +			    SND_SOC_DAPM_PRE_PMU),
>   
>   	SND_SOC_DAPM_ADC_E("ADC1", NULL, CDC_A_TX_1_EN, 7, 0,
>   			   pm8916_wcd_analog_enable_adc,
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
