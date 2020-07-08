Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93736218B28
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 17:25:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D86486E;
	Wed,  8 Jul 2020 17:24:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D86486E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594221912;
	bh=+13Ns3HF1a/Jt+6nd7fhtWI8KG0HRKuoFg7DqotSbl0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p6irTu5yjLjmjGguz7KBhUkzHKcXoroSRbAPnYwVAGceljll+eN7eUFJS3oe8ccZ8
	 26EoJBoG2L5QAUrSPjSSssXvE56zQBBYg30+aNP6ybsnjoE+JTW1od6le9JTbLP4SB
	 a531fLSYe7lIK/+gWMuyQ+cpOI9k/PjMnWQoGj5Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45A6EF8015C;
	Wed,  8 Jul 2020 17:23:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0669EF8015A; Wed,  8 Jul 2020 17:23:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8682F8011F
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 17:23:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8682F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="o8yOtFI6"
Received: by mail-wr1-x443.google.com with SMTP id f7so46413311wrw.1
 for <alsa-devel@alsa-project.org>; Wed, 08 Jul 2020 08:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4K7L/GW11mYIN1OtKYlNsLhV4IcqYsnyxX2a+Ockc1I=;
 b=o8yOtFI6+REhecX7ZnGxb1qEoTgbZBucQLhRZxk+fLSTLGAq8evEqQMryZswQUJU4z
 4e577wf+wlNaejHt6awzranbAQUZtGblLDbGSEiffSHHFVSzeG/3meDM+xbIwl2HGNji
 NxtBDO9VdPLh6Mq1T8+nTuJyQkwIltI+xY1sdwygbno1jlz6Cqne+iG0lRZt7V3+pdX8
 KB1toneZe1KJInzVGpmJLNzfAspke5G5YKhMYHJtcfjmMdWY/IlGOVowOFikvOyElovR
 0TOrctVohUM/55anrb5TMLbeFd+gYua9EBIg10ZhB7jo7eoT2BAfuc+EjlON5zGY96g4
 8GqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4K7L/GW11mYIN1OtKYlNsLhV4IcqYsnyxX2a+Ockc1I=;
 b=ciNYnPDE43bfdQ99FXjP2rx3WJMnf5NBqOUXV2F9TZhNuFD9LQxPn9YXwCekQf5t4k
 4kVt9lBlaI1xv3iVKYO/+bYTcxuuBoxnqrEILbdb1h95iUmwdMCml9kqmdNTshfBm7F3
 ctEB+EHmg3NRUaSHnEBpSpuNvHjMGwXIU8Ir6wDPUVe7JiUrYMyF64JRN1g7MEpugL+e
 drldskt6L3/5n7vgokNfkriklTkBVvy3cm8CH4q6GDfigHuMqTagI+mmtYql8ImS5NFj
 vb1SViCXWIW5Ix0jFsGgWsC+IjCN5WVbHufayv90AW1zqftGQC5j7HwJck67nQFN1aWQ
 m/Nw==
X-Gm-Message-State: AOAM533IYy2hB1UPbqJUSyQ2VONhZMq+iHv8dhm/ka8KVZ9O924A9NgA
 fOUu6AmABhL7OpcYXsg6qJEe6g==
X-Google-Smtp-Source: ABdhPJwkNOp0LosvyzGEmFauWFstpbAEsr7ggYQjTwCu7z1MaeGgvrpsD7efnIo4dNrHpLeov5tveA==
X-Received: by 2002:adf:c441:: with SMTP id a1mr58320397wrg.130.1594221800814; 
 Wed, 08 Jul 2020 08:23:20 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id n16sm425790wrq.39.2020.07.08.08.23.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Jul 2020 08:23:20 -0700 (PDT)
Subject: Re: [PATCH 10/11] ASoC: qdsp6-dai: add gapless support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
References: <20200707163641.17113-1-srinivas.kandagatla@linaro.org>
 <20200707163641.17113-11-srinivas.kandagatla@linaro.org>
 <62af11d3-db26-a31b-00c8-9d78b11862cc@linux.intel.com>
 <04a7f696-e23d-5563-7cc3-aedfaf2c7636@linaro.org>
 <cf9b2d33-9b63-f3d2-2e51-a88c528dad53@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <e6d10009-d01e-d506-1aa3-a915ef42a693@linaro.org>
Date: Wed, 8 Jul 2020 16:23:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cf9b2d33-9b63-f3d2-2e51-a88c528dad53@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 vkoul@kernel.org
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



On 08/07/2020 14:32, Pierre-Louis Bossart wrote:
> 
>>>> Add support to gapless playback by implementing metadata,
>>>> next_track, drain and partial drain support.
>>>>
>>>> Gapless on Q6ASM is implemented by opening 2 streams in a single asm 
>>>> stream
>>>
>>> What does 'in a single asm stream' means?
>>
>>
>> So in QDSP6 ASM (Audio Stream Manager) terminology we have something 
>> called "asm session" for each ASoC FE DAI, Each asm session can be 
>> connected with multiple streams (upto 8 I think). However there will 
>> be only one active stream at anytime. Also there only single data 
>> buffer associated with each asm session.
>>
>> For Gapless usecase, we can keep two streams open for one asm-session, 
>> allowing us to fill in data on second stream while first stream is 
>> playing.
> 
> Ah, that's interesting, thanks for the details. So you have one DMA 
> transfer and the data from the previous and next track are provided in 
> consecutive bytes in a ring buffer, but at the DSP level you have a 
> switch that will feed data for the previous and next tracks into 
> different decoders, yes?

Yes, that's true, we can drain and stop first stream and start next 
stream which will do the switch!

> 
> If that is the case, indeed the extension you suggested earlier to 
> change the profile is valid. You could even change the format I guess.
> 

Exactly, we did test this patchset along with the extension suggested!


> To avoid confusion I believe the capabilities would need to be extended 
> so that applications know that gapless playback is supported across 
> unrelated profiles/formats. The point is that you don't want a 
> traditional implementation to use a capability that isn't supported in 
> hardware or will lead to audio issues.
>  >>>> and toggling them on next track.
>>>
>>> It really seems to me that you have two streams at the lowest level, 
>>> along with the knowledge of how many samples to remove/insert and 
>>> hence could do a much better job - including gapless support between 
>>> unrelated profiles and cross-fading - without the partial drain and 
>>> next_track mechanism that was defined assuming a single stream/profile.
>> At the end of the day its a single session with one data buffer but 
>> with multiple streams.
>>
>> Achieving cross fade should be easy with this design.
> 
> looks like it indeed.
> 
>> We need those hooks for partial drain and next track to allow us to 
>> switch between streams and pass silence information to respective 
>> stream ids.
> 
> right, but the key point is 'switch between streams'. That means a more 
> complex/capable implementation that should be advertised as such to 
> applications. This is not the default behavior assumed initially: to 
> allow for minimal implementations in memory-constrained devices, we 
> assumed gapless was supported with a single decoder.
> 
> Maybe the right way to do this is extend the snd_compr_caps structure:
> 
> /**
>   * struct snd_compr_caps - caps descriptor
>   * @codecs: pointer to array of codecs
>   * @direction: direction supported. Of type snd_compr_direction
>   * @min_fragment_size: minimum fragment supported by DSP
>   * @max_fragment_size: maximum fragment supported by DSP
>   * @min_fragments: min fragments supported by DSP
>   * @max_fragments: max fragments supported by DSP
>   * @num_codecs: number of codecs supported
>   * @reserved: reserved field
>   */
> struct snd_compr_caps {
>      __u32 num_codecs;
>      __u32 direction;
>      __u32 min_fragment_size;
>      __u32 max_fragment_size;
>      __u32 min_fragments;
>      __u32 max_fragments;
>      __u32 codecs[MAX_NUM_CODECS];
>      __u32 reserved[11];
> } __attribute__((packed, aligned(4)));
> 
> 
> and use a reserved field to provide info on capabilities, and filter the 
> set_codec_params() addition based this capability - i.e. return -ENOTSUP 
> in 'traditional' implementations based on a single 'stream'/decoder 
> instance.
Sounds good!
I will give it a go and see how it ends up!


--srini

