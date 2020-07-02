Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF12212358
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 14:31:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69CBF16DF;
	Thu,  2 Jul 2020 14:30:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69CBF16DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593693096;
	bh=c1zC9hRHcBQZWqgn3bJApOEfvCtMoVYjMVE7Y7QePxs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nCoQp4VN71JtYIYKX0dD0cuIaqlWm6N1EitccJtYmSIqu7kxGDfOaQnsrEnSeDH0n
	 JBU3AS+niAusKjPBO1X3ezcL5VBwnM7kzjn1T5LI2Kcn7CDFsCzyVMwSESmO0mapIU
	 ATH+iGyWM8T70/lxczHcW8K/d4s5wtXmijtpQYYY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91DAAF80245;
	Thu,  2 Jul 2020 14:29:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23EFAF8022D; Thu,  2 Jul 2020 14:29:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B52EAF800ED
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 14:29:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B52EAF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="p3qEh2yu"
Received: by mail-wr1-x442.google.com with SMTP id z2so5773741wrp.2
 for <alsa-devel@alsa-project.org>; Thu, 02 Jul 2020 05:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=F7ADKstiUA1jlXfnZezsRSHSfHeXBJYzWOck7lyLBO0=;
 b=p3qEh2yuP4idrIvPNJ2XymaB/KFwSNz8Q4nEP3+29yobB0KHxXczMWIfLb1R+hbtWZ
 MVH3eTJDp/jibT4bLSXsRkKWUobpuZ3K6kWUtngNsDQrjeaPjC/ShGqZIXDreUt7D/5t
 zX1VBnfYcDGIaVWiQXGdFTRQqdC474OI+CYVHaqMv6gbEgG9zvn/Eqxsr4FonV569veO
 rHc0J0GIBCy9m1HgZorXvdbAJnUeHNQeGeEBtGU0+vxyqJLCIRX7oihTplW3F5OGBKum
 XDgrDewTczRQbn4mcSwiKEDW33ACOsrFwUbYCl/Y+VIkhbUwh+Tgg8SeIQxEDFPTYdfI
 iLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F7ADKstiUA1jlXfnZezsRSHSfHeXBJYzWOck7lyLBO0=;
 b=L4jbLZz/MKDoGI8Xi7XuSgkdslbpn2WveWewj+g9pXCX228L0RaNKi9YaWZd0ea6tN
 OnBKn3sgDgPhUMp44N99cfDbEokcQ9p5Ijzxdlm95aS8SsnARMHpZSFvkThqVSTCQvA7
 X+6+kGstS74Z5v0S65TFZg1t4yFAyxT75HU/78tQXvYNfO4H1moiSt401NwruP7WfoR1
 h4IFy9eNaKecC2ieYw3oim5E57yi1OjQa1RbraO5/Vg+qgcHRJ3HyUkqLIzRM6o+fNmp
 puxF2zXC/Xp1RxV9CP/sRqYAuSAdHaLckoydDzrNw/TWnAQMUYnK9sskxT6FI3SPfEK3
 DbGg==
X-Gm-Message-State: AOAM532moIxHS3jdSPFqAhfNg5wFbBrscoWQVyao6MP9hMd+A/ZaMEA6
 A7aszTyvEak8XXAx8NatoS0c6g==
X-Google-Smtp-Source: ABdhPJxU4y1UngKV/QTV/BKMqev/m67+73ckS++pCe3deSLEAG6wPcL6cPo0aXQUqzsX6Mvs+OyP0Q==
X-Received: by 2002:adf:84e2:: with SMTP id 89mr32755173wrg.139.1593692984581; 
 Thu, 02 Jul 2020 05:29:44 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id u84sm10486458wme.42.2020.07.02.05.29.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Jul 2020 05:29:43 -0700 (PDT)
Subject: Re: [RFC PATCH] ALSA: compress: add support to change codec profile
 in gapless playback
To: Vinod Koul <vkoul@kernel.org>
References: <20200702111114.32217-1-srinivas.kandagatla@linaro.org>
 <20200702113602.GA273932@vkoul-mobl>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <a67b809e-2a8d-20ed-c62a-e79a9315c953@linaro.org>
Date: Thu, 2 Jul 2020 13:29:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200702113602.GA273932@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, tiwai@suse.com,
 broonie@kernel.org
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

Thanks Vinod for quick review,

On 02/07/2020 12:36, Vinod Koul wrote:
> Hi Srini,
> 
> On 02-07-20, 12:11, Srinivas Kandagatla wrote:
>> For gapless playback its possible that each track can have different
> 
> s/its/it is
> 
>> codec profile with same decoder, for example we have WMA album,
>> we may have different tracks as WMA v9, WMA v10 and so on
>>
>> Existing code does not allow to change this profile while doing gapless
>> playback.
>>
>> This patch adds new SNDRV_COMPRESS_SET_CODEC_PARAMS IOCTL to allow
>> userspace to set this new parameters required for new codec profile.
> 
> Thanks, this looks good and in line with discussions done in Audio uConf
> 
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   include/sound/compress_driver.h       |  5 +++
>>   include/sound/soc-component.h         |  3 ++
>>   include/sound/soc-dai.h               |  5 +++
>>   include/uapi/sound/compress_offload.h |  1 +
>>   sound/core/compress_offload.c         | 54 ++++++++++++++++++++++++---
>>   sound/soc/soc-compress.c              | 30 +++++++++++++++
>>   sound/soc/soc-dai.c                   | 14 +++++++
> 
> Can we split the ALSA changes and ASoC changes to different patches
> please?
> 
> Also please post driver support for this API..
Yes, q6dsp gapless patches are the users for this api, I will include
them in next version.

> 
> Lastly, documentation needs update about this call
> 
I will fix these in next version!

>>   7 files changed, 106 insertions(+), 6 deletions(-)
>>
>> diff --git a/include/sound/compress_driver.h b/include/sound/compress_driver.h
>> index 70cbc5095e72..8d23351f7ad7 100644
>> --- a/include/sound/compress_driver.h
>> +++ b/include/sound/compress_driver.h
>> @@ -93,6 +93,9 @@ struct snd_compr_stream {
>>    * @set_params: Sets the compressed stream parameters, mandatory
>>    * This can be called in during stream creation only to set codec params
>>    * and the stream properties
>> + * @set_codec_params: Sets the compressed stream codec parameters, mandatory
> 
> This should be optional as gapless is optional
> 
>> --- a/include/uapi/sound/compress_offload.h
>> +++ b/include/uapi/sound/compress_offload.h
>> @@ -172,6 +172,7 @@ struct snd_compr_metadata {
>>   						 struct snd_compr_metadata)
>>   #define SNDRV_COMPRESS_GET_METADATA	_IOWR('C', 0x15,\
>>   						 struct snd_compr_metadata)
>> +#define SNDRV_COMPRESS_SET_CODEC_PARAMS	_IOW('C', 0x16, struct snd_codec)
>>   #define SNDRV_COMPRESS_TSTAMP		_IOR('C', 0x20, struct snd_compr_tstamp)
>>   #define SNDRV_COMPRESS_AVAIL		_IOR('C', 0x21, struct snd_compr_avail)
>>   #define SNDRV_COMPRESS_PAUSE		_IO('C', 0x30)
> 
> I think we should bump the compress version too for checking in userland
> about this support
Sure!

> 
>>   static int snd_compress_check_input(struct snd_compr_params *params)
>>   {
>>   	/* first let's check the buffer parameter's */
>> @@ -574,14 +586,41 @@ static int snd_compress_check_input(struct snd_compr_params *params)
>>   	    params->buffer.fragments == 0)
>>   		return -EINVAL;
>>   
>> -	/* now codec parameters */
>> -	if (params->codec.id == 0 || params->codec.id > SND_AUDIOCODEC_MAX)
>> -		return -EINVAL;
>> +	return snd_compress_check_codec_params(&params->codec);
> 
> Can this be 1st patch to prepare for this change?
> 
>>   
>> -	if (params->codec.ch_in == 0 || params->codec.ch_out == 0)
>> -		return -EINVAL;
>> +}
>>   
>> -	return 0;
>> +static int snd_compr_set_codec_params(struct snd_compr_stream *stream,
>> +				      unsigned long arg)
>> +{
>> +	struct snd_codec *params;
>> +	int retval;
>> +
>> +	if (!stream->ops->set_codec_params)
>> +		return -EPERM;
>> +
>> +	if (stream->runtime->state != SNDRV_PCM_STATE_RUNNING)
>> +		return -EPERM;
>> +
>> +	/* codec params can be only set when next track has been signalled */
>> +	if (stream->next_track == false)
>> +		return -EPERM;
>> +
>> +	params = memdup_user((void __user *)arg, sizeof(*params));
>> +	if (IS_ERR(params))
>> +		return PTR_ERR(params);
>> +
>> +	retval = snd_compress_check_codec_params(params);
>> +	if (retval)
>> +		goto out;
>> +
>> +	retval = stream->ops->set_codec_params(stream, params);
>> +	if (retval)
>> +		goto out;
> 
> this jump is superfluous
yes, we could just remove the check!

> 
>> +
>> +out:
>> +	kfree(params);
>> +	return retval;
>>   }
> 
> ...
> 
>> +static int soc_compr_set_codec_params(struct snd_compr_stream *cstream,
>> +				      struct snd_codec *codec)
>> +{
>> +	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
>> +	struct snd_soc_component *component;
>> +	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
>> +	int i, ret;
>> +
>> +	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
>> +
>> +	ret = snd_soc_dai_compr_set_codec_params(cpu_dai, cstream, codec);
>> +	if (ret < 0)
>> +		goto err;
>> +
>> +	for_each_rtd_components(rtd, i, component) {
>> +		if (!component->driver->compress_ops ||
>> +		    !component->driver->compress_ops->set_codec_params)
>> +			continue;
>> +
>> +		ret = component->driver->compress_ops->set_codec_params(component, cstream,
>> +								     codec);
> 
> maybe use a compress_ops pointer to make this look and read better :)

Sure will do that!

--srini

> 
