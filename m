Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E99FC8FE268
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2024 11:19:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43EC97F8;
	Thu,  6 Jun 2024 11:19:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43EC97F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717665595;
	bh=r872hk76aQr0n4O8MujB1oCORR4MPudLMN6k8jgi0lg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s1OPntUQTbP42nVUT4yOBdWPTq2qlD/+PdjWGgd7VEcogMDnHLxM5XSyRpfUcs1iH
	 mTRCMO2sP1QqyEoBozH2/ePTTGW25Tj4iW/+0RrQeOb5zHjgyrzuI7GEgWGCOfZL+0
	 z5z3UFdF6ODNvqobxYc4jRbt01+0dAXZKewhY38E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99905F804E5; Thu,  6 Jun 2024 11:19:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B2FCF804E5;
	Thu,  6 Jun 2024 11:19:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 936E3F8025A; Thu,  6 Jun 2024 11:18:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1CEFF8003A
	for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2024 11:18:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1CEFF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=MLNtr2Ns
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-52b8b7b8698so915782e87.1
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jun 2024 02:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717665500; x=1718270300;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NYWa3RzbG0HUx/GfVkXqV1gm2vwpRDwUlnvYYRSC6iY=;
        b=MLNtr2NsfOEeSM9UFSY2h+znELKdpNUiluGqYQC7N3RT8DXDL8TY+azP5Q8+3xy5x0
         sU/hT9wpuQIRvcLmWZ9j7Oiwlw0k4TP6nFbfD0PdLGsh8PnwtRfczIieOG84RDWhTe6Z
         DeEDOYhhQW24couVEGu8kUGBjBKgVGFzRjuyG9EIQHfNpoQiJ3qdvrI2CQnYhhUkcZnI
         aCTb7CPRhpdAKnlCgDdH1M0pcKEiiIRaTmrKIBI9/GEYwn+1wyHvodKmAn+YoZ3kpeIx
         C3C1cg89+LpOU6s7jzLoCbCsYjVay7lQtkNTxIklHuvvMugaUVEhPYrE+XoYnyLVD5Y0
         JCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717665500; x=1718270300;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NYWa3RzbG0HUx/GfVkXqV1gm2vwpRDwUlnvYYRSC6iY=;
        b=CQseD82hVbkZHPYPZ2eK6AAnaRniMQG7NKUn7U25ZB5Qf0b9D6awLbQTGXG6VpiW0S
         v6nZcqAKj0nTB4NAd8FJcgmC3sjScbe6OFTH+6JFJPDWvwDt3HLqpSt5s2KOlqoo4xDG
         Qaco4cSWhMk3zgsSSsxCRUx9xMHM3Xp85uf6naw+RaR2SNye/U3rjDQ7owBcnXQYghCt
         uasvyFPDpLuaAgp6TMMypScc7J2XSNTaiHeUcp3ExNKM40xKjc7LhV3R2PPyeuTSiq4a
         Qjf35zYjomDbQtaPMzvMqBGKODMUEGij8LqkbnwMIRYki7X17PeHPNuFK1lv1z980mDy
         nhiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjwCQylGqsBEUovIoDM8DwlXO96smmLaxHN6DK1g4+ETMOcOA9ER/I2/BlN1dymZUIm+dmYmnXI7v8MuGLL7i3cJx+QjCXUbvC/+I=
X-Gm-Message-State: AOJu0YzxUw3zFmMiiLe4hU2S6RBh8YbtKh4Ihqmi8uaujIzo/kFrrMOY
	NvGCt+RFHLHjjhITZeZ5dFIiURYsX4hnl7WIVXx9BWOzJvV5K82qjYsMvqtY3g0=
X-Google-Smtp-Source: 
 AGHT+IE6z/kG5jsknCvlfvxK3SmNh7Dq1i0rEsSxpui1SZZ37TNlbM5BwOQyTCYbxW9qJHmS/x12VA==
X-Received: by 2002:a05:6512:281c:b0:52b:7917:9966 with SMTP id
 2adb3069b0e04-52bab4b0abemr3952237e87.8.1717665500062;
        Thu, 06 Jun 2024 02:18:20 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-35ef5d6990csm1035951f8f.58.2024.06.06.02.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 02:18:19 -0700 (PDT)
Message-ID: <11803812-56cd-48d0-a0fc-8ca99d6f79d5@linaro.org>
Date: Thu, 6 Jun 2024 10:18:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] ASoC: qcom: display port changes
To: Xilin Wu <wuxilin123@gmail.com>, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20240422134354.89291-1-srinivas.kandagatla@linaro.org>
 <dd14e3ff-3ff7-426e-88e0-b16a49eafaf0@gmail.com>
 <44fad635-1b17-47bc-97f0-9a541e0b4f35@linaro.org>
 <21f0f2ac-dada-4e19-a0df-086021320101@gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <21f0f2ac-dada-4e19-a0df-086021320101@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VPHQAEFS6VM7WZNXJMAX5ZTTM4UTIWNF
X-Message-ID-Hash: VPHQAEFS6VM7WZNXJMAX5ZTTM4UTIWNF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VPHQAEFS6VM7WZNXJMAX5ZTTM4UTIWNF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Xilin

On 25/05/2024 08:12, Xilin Wu wrote:
> Hi Srini,
> 
> On 2024/5/24 20:50, Srinivas Kandagatla wrote:
>> Hi Xilin,
>>
>> On 23/05/2024 05:09, Xilin Wu wrote:
>>>>
>>>> Srinivas Kandagatla (4):
>>>>    ASoC: qcom: q6dsp: parse Display port tokens
>>>>    ASoC: qcom: common: add Display port Jack function
>>>>    ASoC: qcom: sc8280xp: add Display port Jack
>>>>    ASoC: qcom: sm8250: fix a typo in function name
>>>>
>>>>   sound/soc/qcom/common.c         | 29 +++++++++++++++++++++++++++++
>>>>   sound/soc/qcom/common.h         |  3 +++
>>>>   sound/soc/qcom/qdsp6/topology.c | 26 ++++++++++++++++++++++++++
>>>>   sound/soc/qcom/sc8280xp.c       | 14 ++++++++++++++
>>>>   sound/soc/qcom/sm8250.c         |  4 ++--
>>>>   5 files changed, 74 insertions(+), 2 deletions(-)
>>>>
>>>
>>> Hi Srini,
>>>
>>> I tested this series on SM8550 with tplg in [1] and ucm in [2]. But 
>>> the kernel output errors attached below. Headphone does work properly 
>>> without DisplayPort in the ucm.
>>>
>>> What could be the possible cause of this? Is there any significant 
>>> change from sc8280xp to sm8550?
>>>
>>> -- 
>>> Thanks,
>>> Xilin Wu
>>>
>>> [1] 
>>> https://github.com/edk2-porting/audioreach-topology/blob/sakuramist/QCS8550-AYN-ODIN2.m4
>>> [2] 

For sm8550 you would need this patch for tplg

https://git.codelinaro.org/krzysztof.kozlowski/audioreach-topology/-/commit/d8ef47bc85700a7cdfabee5e06808d9f359b0a26

can you try this as the Container CAP Id changed for platforms from sm8550.

Kryzstof verified Display port tplg and these patches on x1e80100.


thanks,
srini

>>> https://github.com/strongtz/alsa-ucm-conf/blob/odin2/ucm2/Qualcomm/sm8550/HiFi.conf
>>>
>>> [ 1552.313713] qcom-apm gprsvc:service:2:1: Error (1) Processing 
>>> 0x01001000 cmd
>>> [ 1552.313730] qcom-apm gprsvc:service:2:1: DSP returned 
>>> error[1001000] 1
>>> [ 1552.314455] qcom-apm gprsvc:service:2:1: Error (1) Processing 
>>
>> Is the DP cable connected?
> 
> I'm sure that the cable is connected and I have desktop on external 
> display.
> If it's not connected, kernel gives the following error when using aplay:
> 
> hdmi-audio-codec hdmi-audio-codec.1.auto: ASoC: error at 
> snd_soc_dai_hw_params on i2s-hifi: -22
> 
>>
>> if its not connected the dsp will throw this error.
>>
>> due to this issue I did workaround this issue by modeling it as 
>> conflicting device to Speaker in x13s ucm.
>>
>> I see in your ucm setup its not the case.
>> which is why you might be hitting this issue.
>>
>> Can you try
>> amixer -c 0 cset iface=MIXER,name='DISPLAY_PORT_RX_0 Audio Mixer 
>> MultiMedia2' 1
>> aplay -D plughw:0,1 some-wav-file.wav
>>
>> both with and without display connected.
>>
> 
> aplay always gives the following error:
> 
> Playing WAVE 'Summer.wav' : Signed 16 bit Little Endian, Rate 44100 Hz, 
> Stereo
> aplay: set_params:1456: Unable to install hw params:
> ACCESS:  RW_INTERLEAVED
> FORMAT:  S16_LE
> SUBFORMAT:  STD
> SAMPLE_BITS: 16
> FRAME_BITS: 32
> CHANNELS: 2
> RATE: 44100
> PERIOD_TIME: (42666 42667)
> PERIOD_SIZE: (1881 1882)
> PERIOD_BYTES: (7524 7528)
> PERIODS: (3 5)
> BUFFER_TIME: (170657 170658)
> BUFFER_SIZE: 7526
> BUFFER_BYTES: 30104
> TICK_TIME: 0
> 
> and kernel gives the following when display is connected:
> 
> [drm:dp_catalog_audio_config_sdp] sdp_cfg = 0x100066
> [drm:dp_catalog_audio_config_sdp] sdp_cfg2 = 0x1b800004
> [drm:dp_audio_hw_params] Header Byte 1: value = 0xce020000, parity_byte 
> = 0xce
> [drm:dp_audio_hw_params] Header Byte 2: value = 0x67010000, parity_byte 
> = 0x0
> [drm:dp_audio_hw_params] Header Byte 3: value = 0x67010000, parity_byte 
> = 0x67
> [drm:dp_audio_hw_params] Header Byte 1: value = 0x67010000, parity_byte 
> = 0x67
> [drm:dp_audio_hw_params] Header Byte 2: value = 0x33443517, parity_byte 
> = 0x35
> [drm:dp_audio_hw_params] Header Byte 3: value = 0x33443517, parity_byte 
> = 0x33
> [drm:dp_audio_hw_params] Header Byte 1: value = 0x84840000, parity_byte 
> = 0x84
> [drm:dp_audio_hw_params] Header Byte 2: value = 0x3344d71b, parity_byte 
> = 0xd7
> [drm:dp_audio_hw_params] Header Byte 3: value = 0x44, parity_byte = 0x33
> [drm:dp_audio_hw_params] Header Byte 1: value = 0xd8050000, parity_byte 
> = 0xd8
> [drm:dp_audio_hw_params] Header Byte 2: value = 0x4b0f, parity_byte = 0x4b
> [drm:dp_audio_hw_params] Header Byte 3: value = 0x4b0f, parity_byte = 0x0
> [drm:dp_audio_hw_params] Header Byte 1: value = 0x71060000, parity_byte 
> = 0x71
> [drm:dp_audio_hw_params] Header Byte 2: value = 0x4b0f, parity_byte = 0x4b
> [drm:dp_catalog_audio_config_acr] select: 0x3, acr_ctrl: 0x80004130
> [drm:dp_catalog_audio_sfe_level] mainlink_level = 0xa08, 
> safe_to_exit_level = 0x8
> [drm:dp_catalog_audio_enable] dp_audio_cfg = 0xc1
> qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
> qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
> qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
> qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
> qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001001 cmd
> qcom-apm gprsvc:service:2:1: DSP returned error[1001001] 1
> q6apm-lpass-dais 30000000.remoteproc:glink-edge:gpr:service@1:bedais: 
> Failed to prepare Graph -22
> q6apm-lpass-dais 30000000.remoteproc:glink-edge:gpr:service@1:bedais: 
> ASoC: error at snd_soc_pcm_dai_prepare on DISPLAY_PORT_RX_0: -22
> [drm:dp_catalog_audio_enable] dp_audio_cfg = 0xc0
> 
>>
>> --srini
>>
>>
>>
>>> 0x01001006 cmd
>>> [ 1552.314463] qcom-apm gprsvc:service:2:1: DSP returned 
>>> error[1001006] 1
>>> [ 1552.315496] qcom-apm gprsvc:service:2:1: Error (1) Processing 
>>> 0x01001006 cmd
>>> [ 1552.315506] qcom-apm gprsvc:service:2:1: DSP returned 
>>> error[1001006] 1
>>> [ 1552.316033] qcom-apm gprsvc:service:2:1: Error (1) Processing 
>>> 0x01001001 cmd
>>> [ 1552.316042] qcom-apm gprsvc:service:2:1: DSP returned 
>>> error[1001001] 1
>>> [ 1552.316045] q6apm-lpass-dais 
>>> 30000000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to 
>>> prepare Graph -22
>>> [ 1552.316047] q6apm-lpass-dais 
>>> 30000000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC: error at 
>>> snd_soc_pcm_dai_prepare on DISPLAY_PORT_RX_0: -22
> 
