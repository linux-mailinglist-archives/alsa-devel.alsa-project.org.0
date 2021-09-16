Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EED240DD86
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 17:04:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E37E11893;
	Thu, 16 Sep 2021 17:03:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E37E11893
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631804679;
	bh=tVAlQIEooMFtJKrUikPPdawGId4dgf2lg5vCdZgBobI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QcqZ9gZUmfFKc4RVAmBGsoASoxM3rfDfbHq8aClT7LJuheQdg6aydvKLERc+gi17/
	 29BxK3jhvJHZT2OXXzCaoqIXvlQi02yk/VAwpenxgo/YE4Ot5h4tIIwbtrxdJIvgvL
	 Lma1NT1jUtSdoZdkmrdWYirE4ulMBSTddA5quKlQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AECFF804EB;
	Thu, 16 Sep 2021 17:02:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35ACEF804E7; Thu, 16 Sep 2021 17:02:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD269F804E3
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 17:02:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD269F804E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="h6fESi2h"
Received: by mail-wr1-x429.google.com with SMTP id u18so8260597wrg.5
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 08:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dSgHedLjzf+f2rTJK3kZU0KWVdsOwbxIVOfdR15sHOM=;
 b=h6fESi2hIwSa+szyFIzV+yyW7VKuG7EV9Qyl+Eqe7NT9DAzSpbOR8bBkYbVOtijLzG
 BPwznn97wAnKiDsi6nJLJbhAHRdpKDwIlI057FelyFgk7oBbEffN7XLI1Td0m1beLB2V
 smnWrfxEKnw23hKp/tKv6zw/QhkzEG4x0XCJB6ES/YyCmuUoSIGSDncuFCI+VvW/tM9/
 GGZiMnt0QsEXYKNWDv04KV0uTQCmXSn2XigFFDx8WfKfL/DPEnfE3JXugvfUfntcygBc
 6tWfWDA6erk7rMt2CafWW3h8c9f+PDHIdxIlrKNn5xfpzKuhOnvVl57lg90WzQ37JYOC
 lTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dSgHedLjzf+f2rTJK3kZU0KWVdsOwbxIVOfdR15sHOM=;
 b=YTg2I2u+ZugInPb2gQnUqGlcqOh8N86+rYS6dUFd81VxhSgoRwdopd0HS6+zhGH24U
 4iBnQ0N23WKx9Nx5pLd9c84TPVREK8ZiXETzJn/GQurxeZrYOHjHOXoNmGeMnApC4clp
 OtOV5xw5iSnfLZwcvLwUww/101ju9LNUI+IFrkAtunfS1QdXVaBq8Xe6ZU6r7WtZH2zi
 FkaGy/N8Ot54dJicvWwNrDbYajGz4kkyhF0ROUEZdaExNmUnYpE76kEoBmqPp81AorTn
 gk/y8GG9Gh/8JZKGUcasYuBcNP7wr7WP7CoL/d2kKS9rCOXwLPnqhHHCggw3ce5wpJvG
 so6g==
X-Gm-Message-State: AOAM532n0dSzrMnqG6D1XdIvblFRg6L48MnjRTll6aBdY+EicmzUU6lc
 Ypr62AVs2ZCv0hXSPVCxPkzRlQ==
X-Google-Smtp-Source: ABdhPJzqLpnHO/KWZL5nlsyJVJOE8FaDqAmJmi1qSMMbwOIQirjc26qr0OeKJEsY4UuBqvpWyFUxuA==
X-Received: by 2002:adf:f084:: with SMTP id n4mr6770289wro.362.1631804551728; 
 Thu, 16 Sep 2021 08:02:31 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id s15sm3806235wrb.22.2021.09.16.08.02.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 08:02:31 -0700 (PDT)
Subject: Re: [PATCH v6 18/22] ASoC: qdsp6: audioreach: add topology support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210915131333.19047-1-srinivas.kandagatla@linaro.org>
 <20210915131333.19047-19-srinivas.kandagatla@linaro.org>
 <bc93c17e-b65d-5885-f151-243d259f40ff@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <3c5f75f9-8ee2-6da2-b7ec-7854759e2647@linaro.org>
Date: Thu, 16 Sep 2021 16:02:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <bc93c17e-b65d-5885-f151-243d259f40ff@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
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

Thanks Pierre for such quick review,

On 15/09/2021 17:22, Pierre-Louis Bossart wrote:
> 
>> +static int audioreach_widget_load_buffer(struct snd_soc_component *component,
>> +					 int index, struct snd_soc_dapm_widget *w,
>> +					 struct snd_soc_tplg_dapm_widget *tplg_w)
>> +{
>> +	struct snd_soc_tplg_vendor_array *mod_array;
>> +	struct audioreach_module *mod;
>> +	struct snd_soc_dobj *dobj;
>> +	int ret;
>> +
>> +	ret = audioreach_widget_load_module_common(component, index, w, tplg_w);
>> +	if (ret)
>> +		return ret;
>> +
>> +	dobj = &w->dobj;
>> +	mod = dobj->private;
>> +
>> +	mod_array = audioreach_get_module_array(&tplg_w->priv);
>> +
>> +	switch (mod->module_id) {
>> +	case MODULE_ID_CODEC_DMA_SINK:
>> +	case MODULE_ID_CODEC_DMA_SOURCE:
>> +		audioreach_widget_dma_module_load(mod, mod_array);
>> +		break;
>> +	case MODULE_ID_DATA_LOGGING:
>> +		audioreach_widget_log_module_load(mod, mod_array);
>> +		break;
>> +	case MODULE_ID_I2S_SINK:
>> +	case MODULE_ID_I2S_SOURCE:
>> +		audioreach_widget_i2s_module_load(mod, mod_array);
>> +		break;
> 
> no default case?

Thanks for spotting this, its fixed now in next version.
> 
>> +	}
>> +
>> +	return 0;
>> +}
>> +
> 
>> +int audioreach_tplg_init(struct snd_soc_component *component)
>> +{
>> +	struct device *dev = component->dev;
>> +	const struct firmware *fw;
>> +	int ret;
>> +
>> +	ret = request_firmware(&fw, "audioreach.bin", dev);
>> +	if (ret < 0) {
>> +		dev_err(dev, "tplg fw audioreach.bin load failed with %d\n", ret);
>> +		return ret;
>> +	}
> 
> How does this work if you want to change the topology, which will happen
> rather frequently if you have a framework precisely to change the DSP
> graph? You need to override a file in userspace?
> 
> Shouldn't you have a means to identify what topology file you want on a
> platform-basis?
> 
> Or at the very least a means to change the file name with a kernel
> parameter or something.

I totally agree, I was planning to do that as a next step. But now that 
you pointed it out, I can take a look at SOF for some ideas and add it 
in next version.

--srini
> 
>> +
>> +	ret = snd_soc_tplg_component_load(component, &audioreach_tplg_ops, fw);
>> +	if (ret < 0) {
>> +		dev_err(dev, "tplg component load failed%d\n", ret);
>> +		ret = -EINVAL;
>> +	}
>> +
>> +	release_firmware(fw);
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(audioreach_tplg_init);
>>
