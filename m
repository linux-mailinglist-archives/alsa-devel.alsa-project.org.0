Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A8733AF8D
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 11:06:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 445CE1776;
	Mon, 15 Mar 2021 11:05:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 445CE1776
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615802789;
	bh=FNmBrZ9c7iX5JqTK/vaqp7KT1eKs86lO8wNJ3YgTcPU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jcgMqFhHhulk/nMOxSoQMNipwLvSgPnsF2UQczNxPMsn4dpkyPH2GRJnp7wQ/WaMc
	 fCcZi4PZ89HjCxj4cVdUgpPnrQvAfH7PJ4xc8SEm0t1zTjIM2B4oaUw+KsPehdynF+
	 7XynOwHNY3FcQL0Q5TzLISbyzI8fzhgzCUUcW9SM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FCBAF801F7;
	Mon, 15 Mar 2021 11:04:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDF93F8010E; Mon, 15 Mar 2021 11:04:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5299FF8010E
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 11:04:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5299FF8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="W5Ke2/Pj"
Received: by mail-wr1-x435.google.com with SMTP id v11so5361545wro.7
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 03:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jkZ02T2BJegmsix35OU5eYN8wUDGnZfwIYIhms9Bp9w=;
 b=W5Ke2/Pj2T9EicF1ORskdaNrC3LHoli+LihZpIFdxbZw/Q0h9HfRraVojRfPSD8use
 7ub68bdYfI/KIApUviCOhl/dRNk04CNM8udUMn+Kgi/3qrvprWHRh2CiXh1S6sEJyqQ/
 C1lRgFZsyoz0CoFMe4mkoaCCCOXNVfUvbLa5sN6ycL+OEFH/3OFLuVBXNNAjUPIuVtFz
 /86dh88eqon3kSVa8UuNOv+yp20eCE759tv08K2LO/420X4+RzJyzYaEIqphRzLMtvOK
 BVTtTQhOr9CEuctJ4nnc3kPj4ueP6j80f8PHLp6eD/7Bg5Oly1k89wDaupgBCMm0G6Et
 ROZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jkZ02T2BJegmsix35OU5eYN8wUDGnZfwIYIhms9Bp9w=;
 b=gQeeD2cN/ZpAlQ/tzSZao6nkQfEtQ6AllHLUsxywNJgXoKbNN3YH4KGrVmYTaZ/bsN
 wzz4W9OXPHIZNSlyHsm4MsEi1EE437/MNQtrzGcR5sPUqbHdMXhpsBkiMBPEpRuc0dN+
 ac4/SpLhDsY5N0Od2uy9FVLkJj4qQhkTp9Z8Lya2dWnXPD8z4/3lNw//dAjMftnp4hY9
 b8uOTe1bNhWa9oNT7UM8ZCbyUxM/cvmT0Aet6QF47MXE32MXKngTYn77830IJoCRY9Fn
 XI/YTzIo1PQWNzhziz7dcj8R6+wmvH//Wucwn8KIDZ+KOZ/jOcNAqkLUHh8AJKu4TPp/
 +2Tg==
X-Gm-Message-State: AOAM531MgsK9iHJIqhfuG6BuWApU7qx30RNhKQRoTmClWTpsGL2ISK4t
 AExE1/SghoJYSDAR8hoAVtCuYA==
X-Google-Smtp-Source: ABdhPJz+6ktpW9oFvyi0twxihfVovojX60okBC3Y1HycuDbLRPKBgNRVsqqYxuEh9En0hEnky05Lzw==
X-Received: by 2002:adf:c40b:: with SMTP id v11mr26186217wrf.320.1615802687982; 
 Mon, 15 Mar 2021 03:04:47 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id m9sm17960412wro.52.2021.03.15.03.04.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Mar 2021 03:04:47 -0700 (PDT)
Subject: Re: [PATCH 4/7] ASoC: codecs: wcd938x: add basic controls
To: Mark Brown <broonie@kernel.org>
References: <20210311173416.25219-1-srinivas.kandagatla@linaro.org>
 <20210311173416.25219-5-srinivas.kandagatla@linaro.org>
 <20210312155547.GJ5348@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <509b836d-520d-4528-0f1a-da0c21e86c68@linaro.org>
Date: Mon, 15 Mar 2021 10:04:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210312155547.GJ5348@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

Thanks Mark for review,

On 12/03/2021 15:55, Mark Brown wrote:
> On Thu, Mar 11, 2021 at 05:34:13PM +0000, Srinivas Kandagatla wrote:
> 
>> +	if (wcd938x->variant == WCD9380) {
> 
> switch statements please.
> 
>> +		if (mode_val == CLS_H_HIFI || mode_val == CLS_AB_HIFI) {
>> +			dev_info(component->dev,
>> +				"%s:Invalid HPH Mode, default to CLS_H_ULP\n",
>> +				__func__);
>> +			mode_val = CLS_H_ULP;
>> +		}
> 
> If the value can't be set an error should be returned rather than the
> input ignored.

I agree with all the comments related to switch statements and ignoring 
return values, will address them in next version.

> 
>> +static int wcd938x_ear_pa_gain_get(struct snd_kcontrol *kcontrol,
>> +				   struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
>> +
>> +	ucontrol->value.integer.value[0] = snd_soc_component_read_field(component,
>> +						WCD938X_ANA_EAR_COMPANDER_CTL,
>> +						WCD938X_EAR_GAIN_MASK);
>> +
>> +	return 0;
>> +}
> 
> This just looks like a normal operation?
> 
Yes, this can probably go into a TLV control, will fix this in next version.


--srini
>> +static int wcd938x_ear_pa_gain_put(struct snd_kcontrol *kcontrol,
>> +				   struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
>> +	struct wcd938x_sdw_priv *wcd = snd_soc_component_get_drvdata(component);
>> +	struct wcd938x_priv *wcd938x = wcd->wcd938x;
>> +
>> +	if (!wcd938x->comp1_enable) {
>> +		snd_soc_component_write_field(component,
>> +				WCD938X_ANA_EAR_COMPANDER_CTL,
>> +				WCD938X_EAR_GAIN_MASK,
>> +				ucontrol->value.integer.value[0]);
>> +	}
> 
> Again, values should not be ignored on error.
> 
>> +	if (wcd938x->variant == WCD9380) {
>> +		ret = snd_soc_add_component_controls(component, wcd9380_snd_controls,
>> +					ARRAY_SIZE(wcd9380_snd_controls));
>> +		if (ret < 0) {
>> +			dev_err(component->dev,
>> +				"%s: Failed to add snd ctrls for variant: %d\n",
>> +				__func__, wcd938x->variant);
>> +			goto err;
>> +		}
>> +	}
>> +	if (wcd938x->variant == WCD9385) {
> 
> Again, switch statements - I'll never understand why people seem so
> intent on writing if trees :(
> 
