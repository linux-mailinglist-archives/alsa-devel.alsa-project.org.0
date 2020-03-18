Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6694189B80
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Mar 2020 13:01:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56C6E1744;
	Wed, 18 Mar 2020 13:00:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56C6E1744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584532870;
	bh=4wBJYSF5YrhTj1piECI1HRQK/reY54QB+utGTA0n8hs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MNIJz6BCUD5ZUrZxELx1/LlzDsv7BKDxYgeYmslQoFLPXd/RDySvmbt8TtdXNm3Hu
	 iUXV1i6jGQpNDHXBoEH/c/S2WwYd1P2y7kRYoznHTQ3GWMY2y68SnmvYERRwTsi5Jc
	 WII8nXhIDOzu3UtzciEFqPp9HT6QhhW+S5GInHi4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 531C3F800C0;
	Wed, 18 Mar 2020 12:59:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BB66F80139; Wed, 18 Mar 2020 12:59:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6FCBF800B7
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 12:59:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6FCBF800B7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Pt3x+uRS"
Received: by mail-wm1-x341.google.com with SMTP id 6so2959673wmi.5
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 04:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YJqjwINizd0mjxU+F08RGbhSKRJRuplDkN1+krLz9Io=;
 b=Pt3x+uRS/li8KFYyqVdOwKOuFPdkPPdYK4iGxXkx22gyl8xyCbct2cPfaoHMyZTYcA
 rZ4PmmPl5FZqksFWOmKRomE++5WAbzGqPyB1/4OvnH3jwC7ZSPAnx0S9bTFX2gdarewb
 mw0ZJ0ED+uPoXQRtb6yWjQi2fbg5m+ybUvVV8kWXaQQRwm+nwjjjnkxTrFXa7TG06qoF
 TkGCnib1dFKSL9aszKx7MXcW/9pmyXBxb9lvqu2xiWEuSmbK99DPxDBrubMF8TQE1Z+z
 P0bEpXpewb3U5Aw53MTFc/7t3AA+cQ21vUnsQWR1727aeusgoaSVoT2lGfPcQi/FGbRb
 +1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YJqjwINizd0mjxU+F08RGbhSKRJRuplDkN1+krLz9Io=;
 b=RCP0T78FQ1Oza3h2kwN6cNkRvC6Y8V2aArWoDULa5IG3du2Ncg5KW0i3A+ssCt4LWn
 nchRuawpaEtQt7rHP42q5FC3P23zngT9tS/k9NYCfAwreVAQWleajJ2old8zehtuxQW8
 pkCagrFTrVbq6nIqQfzmAxvi9T3foFmDG3R84I2TUeePpSwCtMxmpMhEH69xAQFWM94I
 /2qbdVPIfsTe2EHAIX/ph0HTc11Z76/wgLw74VZ4HrBwcmZQ1lCQDwOmC0GojKqyIbuQ
 nglEU7FFIGzpvDwdyG4wRnBOFuvX6LavtpTt5tfgGEm+2MaEM5yfvxc8qaO/om/n2/1u
 cxuQ==
X-Gm-Message-State: ANhLgQ0Wms85hF14f1K7KZlPrxVT5t5DIkVcZawKh3aBLlIWvgiFitKF
 17+TBF1kJqPFHodddYEeJP61iA==
X-Google-Smtp-Source: ADFU+vvSL2S8Zk4kOLlmqKuwdQt3oO0VIUxIQXZukISeVwAVMKksfVbyrSNcY+B2b7oCBoxLUVTeYg==
X-Received: by 2002:a05:600c:2319:: with SMTP id
 25mr4948012wmo.106.1584532763247; 
 Wed, 18 Mar 2020 04:59:23 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id c4sm3653831wml.7.2020.03.18.04.59.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Mar 2020 04:59:22 -0700 (PDT)
Subject: Re: [PATCH 1/2] ASoC: qcom: sdm845: handle soundwire stream
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
References: <20200317095351.15582-1-srinivas.kandagatla@linaro.org>
 <20200317095351.15582-2-srinivas.kandagatla@linaro.org>
 <8daeeb26-851b-8311-30f5-5d285ccbc255@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <69c72f5a-e72e-b7b3-90cb-a7354dcb175d@linaro.org>
Date: Wed, 18 Mar 2020 11:59:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8daeeb26-851b-8311-30f5-5d285ccbc255@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, vkoul@kernel.org,
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



On 17/03/2020 13:07, Pierre-Louis Bossart wrote:
> 
>> @@ -45,11 +48,20 @@ static int sdm845_slim_snd_hw_params(struct 
>> snd_pcm_substream *substream,
>>       struct snd_soc_pcm_runtime *rtd = substream->private_data;
>>       struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
>>       struct snd_soc_dai *codec_dai;
>> +    struct sdm845_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
>>       u32 rx_ch[SLIM_MAX_RX_PORTS], tx_ch[SLIM_MAX_TX_PORTS];
>> +    struct sdw_stream_runtime *sruntime;
>>       u32 rx_ch_cnt = 0, tx_ch_cnt = 0;
>>       int ret = 0, i;
>>       for_each_rtd_codec_dais(rtd, i, codec_dai) {
>> +        sruntime = snd_soc_dai_get_sdw_stream(codec_dai,
>> +                              substream->stream);
>> +        if (sruntime != ERR_PTR(-ENOTSUPP))
>> +            pdata->sruntime[cpu_dai->id] = sruntime;
>> +        else
>> +            pdata->sruntime[cpu_dai->id] = NULL;
>> +
> 
> Can you explain this part?
> The get_sdw_stream() is supposed to return what was set by 
> set_sdw_stream(), so if it's not supported isn't this an error?

In this case its not an error because we have
totally 3 codecs in this path.
One wcd934x Slimbus codec and two wsa881x Soundwire Codec.

wcd934x codec side will return ENOTSUPP which is not an error.

> 
>>           ret = snd_soc_dai_get_channel_map(codec_dai,
>>                   &tx_ch_cnt, tx_ch, &rx_ch_cnt, rx_ch);
>> @@ -425,8 +437,65 @@ static void  sdm845_snd_shutdown(struct 
>> snd_pcm_substream *substream)
>>       }
>>   }
>> +static int sdm845_snd_prepare(struct snd_pcm_substream *substream)
>> +{
>> +    struct snd_soc_pcm_runtime *rtd = substream->private_data;
>> +    struct sdm845_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
>> +    struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
>> +    struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
>> +    int ret;
>> +
>> +    if (!sruntime)
>> +        return 0;
> 
> same here, isn't this an error?

These callbacks are used for other dais aswell in this case
HDMI, Slimbus and Soundwire, so sruntime being null is not treated as error.

> 
>> +    if (data->stream_prepared[cpu_dai->id]) {
>> +        sdw_disable_stream(sruntime);
>> +        sdw_deprepare_stream(sruntime);
>> +        data->stream_prepared[cpu_dai->id] = false;
>> +    }
>> +
>> +    ret = sdw_prepare_stream(sruntime);
>> +    if (ret)
>> +        return ret;
>> +
>> +    /**
>> +     * NOTE: there is a strict hw requirement about the ordering of port
>> +     * enables and actual WSA881x PA enable. PA enable should only 
>> happen
>> +     * after soundwire ports are enabled if not DC on the line is
>> +     * accumulated resulting in Click/Pop Noise
>> +     * PA enable/mute are handled as part of codec DAPM and digital 
>> mute.
>> +     */
>> +
>> +    ret = sdw_enable_stream(sruntime);
>> +    if (ret) {
>> +        sdw_deprepare_stream(sruntime);
>> +        return ret;
>> +    }
>> +    data->stream_prepared[cpu_dai->id] = true;
>> +
>> +    return ret;
>> +}
>> +
>> +static int sdm845_snd_hw_free(struct snd_pcm_substream *substream)
>> +{
>> +    struct snd_soc_pcm_runtime *rtd = substream->private_data;
>> +    struct sdm845_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
>> +    struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
>> +    struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
>> +
>> +    if (sruntime && data->stream_prepared[cpu_dai->id]) {
> 
> and here?
> 
> Really wondering where the stream is actually allocated and set.

Controller is allocating the runtime in this case.

> 
>> +        sdw_disable_stream(sruntime);
>> +        sdw_deprepare_stream(sruntime);
>> +        data->stream_prepared[cpu_dai->id] = false;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static const struct snd_soc_ops sdm845_be_ops = {
>>       .hw_params = sdm845_snd_hw_params,
>> +    .hw_free = sdm845_snd_hw_free,
>> +    .prepare = sdm845_snd_prepare,
>>       .startup = sdm845_snd_startup,
>>       .shutdown = sdm845_snd_shutdown,
>>   };
>>
