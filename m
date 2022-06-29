Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B99655FE05
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 13:01:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD561E12;
	Wed, 29 Jun 2022 13:00:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD561E12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656500492;
	bh=iS0YrHGYAIstQYiqJZYz3J4HMHUQsGi2N/0LbmUMa84=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eM5Z+FkprT77ix8EZzRdjRtGZ9LGXiamGdXtSz7k+ViqkV0R11mS1gP3lnC+8KtS1
	 SPtBlSMbLO6YWWLLXsvEztsAbixe7ITemG1RwXFD9bJQU2SfvcSNCORQ0xWh9NTxOU
	 M+u3H7SPc3rybY5g+wmxK3bd2zC9WW2hiLpvMSyo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D713F80115;
	Wed, 29 Jun 2022 13:00:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B46E4F8020D; Wed, 29 Jun 2022 13:00:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F87EF80115
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 13:00:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F87EF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="GdzGE2XF"
Received: by mail-wr1-x42a.google.com with SMTP id k22so21866163wrd.6
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 04:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xGLyHh+8Mbf3/i/p0tGrUiVabNI3mp8YOPBN1Q5tKu8=;
 b=GdzGE2XFNE7YJK5ZCHvfLcGKwcL706RxrQqunB/BY7BN0UqlMiLNKOe2zxEi3M0zQG
 Sxjo6mIJ2Gp3YS0mACIuQkm2gxcnHjh3bZAF3VxAB8RArqfJri99f0L4pBJxsX8eYBNj
 OaPc7xN+zRrzRPkjHGgTqe0Xjeoe1xchJgqyVjPC/YbH4gq29Jy3ljwMXij1mFZleYpY
 xG5WwiIqC73Q35tU5tJJ1vSZGYJ8CEGFgYrT8MI7jtXOqBdWm5CEKjpnzIwVTPA+4NYG
 6Spky0UTeSDkkzS9kEOYIIro0h3f3Y6WYBdCGcYvklkZV47KzTLH5ulbvyeVfGg+CWVX
 GzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xGLyHh+8Mbf3/i/p0tGrUiVabNI3mp8YOPBN1Q5tKu8=;
 b=1/RGoHfVPNcHFmXA2IFmgQAne3k0JEN6DIKfFvtaCZcO9BLEMLwA255ahgs8Gh9Tkt
 pIpm/HSQeSiEmHqWQp3fug+f3S4ANW/E3I8Kos3GG6YaDgx89jjyrQPxii3dBDvd/ikB
 mnf3s9rt3LRfD9wnvIkp42nM9kM95qK32xSk2wHul6/u4kmhvJInmSrsjddNEZolxWtQ
 24JuwaFtMxYfd26ElqR1Q3a6GVbgVNtkto7vjE8kCMMqaOIrhP2S1Z7jmRykeVr4F4cD
 9x48FAnNZDZrr+xOlvvoCpRpqa0+WuXuhnACkCe+1BA3K+ZSWf9RjUhNA1FOv/sLz/U+
 3x0A==
X-Gm-Message-State: AJIora+ysl+Dgt9E41YtMjjnOWlWLzb0ypbOZ9U79WI1L6A6khdvpDBu
 2YF70TV+fWrl+7Smz1DKgDCLvQ==
X-Google-Smtp-Source: AGRyM1sXOvu7BWkXbVkxcM2Z3K2+CaIXfm93SpksVZR0kqbEytL1fxmvD4PEGj9wntgztWrybr0smA==
X-Received: by 2002:adf:e30f:0:b0:21b:a39c:cb40 with SMTP id
 b15-20020adfe30f000000b0021ba39ccb40mr2439283wrj.180.1656500425448; 
 Wed, 29 Jun 2022 04:00:25 -0700 (PDT)
Received: from [192.168.86.238]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 m2-20020adffa02000000b0021d163daeb0sm8581792wrr.108.2022.06.29.04.00.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jun 2022 04:00:24 -0700 (PDT)
Message-ID: <2fdd0847-5102-ea9f-cfbb-f3dd378d3a8a@linaro.org>
Date: Wed, 29 Jun 2022 12:00:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/4] ASoC: codecs: wsa883x: add control, dapm widgets and
 map
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20220629090644.67982-1-srinivas.kandagatla@linaro.org>
 <20220629090644.67982-4-srinivas.kandagatla@linaro.org>
 <YrwwPbm0sL1RGwjO@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <YrwwPbm0sL1RGwjO@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
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

Thanks Mark,

On 29/06/2022 11:58, Mark Brown wrote:
> On Wed, Jun 29, 2022 at 10:06:43AM +0100, Srinivas Kandagatla wrote:
> 
>> +static int wsa_dev_mode_put(struct snd_kcontrol *kcontrol,
>> +			    struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
>> +	struct wsa883x_priv *wsa883x = snd_soc_component_get_drvdata(component);
>> +
>> +	if (wsa883x->dev_mode == ucontrol->value.enumerated.item[0])
>> +		return 0;
>> +
>> +	wsa883x->dev_mode = ucontrol->value.enumerated.item[0];
>> +
>> +	return 0;
>> +}
> 
> This isn't returning 1 when the value changes so will miss generating
> events, please test the driver with mixer-test.
Yes my bad..

> 
>> +	switch (event) {
>> +	case SND_SOC_DAPM_POST_PMU:
>> +		if (wsa883x->dev_mode == RECEIVER) {
>> +			snd_soc_component_write_field(component, WSA883X_CDC_PATH_MODE,
>> +						      WSA883X_RXD_MODE_MASK,
>> +						      WSA883X_RXD_MODE_HIFI);
>> +			snd_soc_component_write_field(component, WSA883X_SPKR_PWM_CLK_CTL,
>> +						      WSA883X_SPKR_PWM_FREQ_SEL_MASK,
>> +						      WSA883X_SPKR_PWM_FREQ_F600KHZ);
>> +			snd_soc_component_write_field(component, WSA883X_DRE_CTL_0,
>> +						       WSA883X_DRE_PROG_DELAY_MASK, 0x0);
>> +		} else if (wsa883x->dev_mode == SPEAKER) {
> 
> This looks like it'd be better written as a switch statement.
Sounds good,

> 
>> +static const struct snd_kcontrol_new wsa883x_snd_controls[] = {
>> +	SOC_SINGLE_RANGE_TLV("PA Gain", WSA883X_DRE_CTL_1, 1,
>> +			     0x0, 0x1f, 1, pa_gain),
> 
> Volume controls should end in Volume, mixer-test should also have caught
> this.
Okay, will fix all these in next spin.
