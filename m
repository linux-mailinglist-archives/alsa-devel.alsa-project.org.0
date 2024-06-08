Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BF49077EE
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 18:11:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 217C5F94;
	Thu, 13 Jun 2024 18:11:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 217C5F94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718295091;
	bh=ZDzevxG3p1PqajLdPO9rj9x79cWcafrQbVIEjOXaDLs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=goY+SZ4y2xvtGpDif5ywT8Y+DHs4/gQ8RUwK0yoOGnrLSbvUWNYO5wrTnzRWw74HU
	 fulj3e81TkeA9UgD4/TEoiK0dEFRcX1TvU8O5l8ymX4BNjMoEwRE0W93t48CHvJwws
	 XBKJCTtroBfbvR3kikzj8hefoY7BOT2YVC9qwXgc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26C90F80602; Thu, 13 Jun 2024 18:04:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D7BCF8060B;
	Thu, 13 Jun 2024 18:04:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D11BF804D6; Sat,  8 Jun 2024 13:41:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96F4CF8010C
	for <alsa-devel@alsa-project.org>; Sat,  8 Jun 2024 13:41:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96F4CF8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=STU8W/dG
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-703ed5d37acso2434279b3a.0
        for <alsa-devel@alsa-project.org>;
 Sat, 08 Jun 2024 04:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717846880; x=1718451680;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B/IaPEx8THKFazkq+Jntb4fKptpgwwLkbk20yuBqCWA=;
        b=STU8W/dGCWk9eTuKrPPP/kTE7Qg4S9O460Ez03W/CDJestctduPYrZgKsfR0Bpp3SD
         cKa6GEvIGPUEmQECNJR5XF5BCXCONFpT9OE4Hq5tet8nyXPP3jVnXfKZOYuvqUex2txG
         pYhgamJaBxFP/aJyXCcHH7qgXLBLr4+0lIjGRjt31qKaPZYbjpV9fvUrIlV8Eau7ZxER
         yy8TTn1bLpXcCNT0aM4m6gQPviC54IgQWGUUWjteb/QEc00iov4pZF7hma68zIhU5/TC
         YZCJtfDK8quyYEZp78WthjjUnB2/1cE3+iLF2WzWP1fx8b3OeIiLmFnMBkGaUU/Qg7pA
         S9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717846880; x=1718451680;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B/IaPEx8THKFazkq+Jntb4fKptpgwwLkbk20yuBqCWA=;
        b=PWSPKNV+v4G36EVeszNYEDDWHEdGfef1ahN/Hw6pWaXu5Almavna/dp0rYbfpneLH1
         S4HrBOXwXbZNhM2ansB0h2F917tL5PwZskLlR8afzYlLzYjGaW94QI8mZQiZ1p82fzpI
         ss9DljQddT0BBZG6hc13mlzsitpROimNrG4o3KOuPjHppzOq6OLnOKrsameIoRibVd2P
         HhbQyb3l3fLQ1fIHIcnbcBLOLbZaZtzdvKjuTzt3SqFqk5Es4gn4V6NXTBCCyRLYoG9j
         djQhXfSfBiEsieQYyo4wZDOfeyf20IAVKMAPydiVtFBXeO+xeNlP8nwJHVsCD1AEY2L/
         ou4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRfmDHpb32do5I8rTMK+T67Gj9PozkUQSp23s42jDZbqde9z+mksIb4/9SOG3x5vRgC49fixmoThCjp5O4Er8N9lrCZI0kaSor2hQ=
X-Gm-Message-State: AOJu0Yy7dZEU1jHxf0k27CZufJaIHPCmUz4WtF6blpK+NhWSdxj/wfua
	D/PGDQKU9g/W/oSV544XAYlBK52Y112CZCpO1h8wwUH6FRG5quFG
X-Google-Smtp-Source: 
 AGHT+IFy4uYbq+b9zg+egzGM+zx7amaxjPJ7tGj+JJKGq1hmx8PxHRVeEmei1GW/HLhjmBwNMStpiw==
X-Received: by 2002:a05:6a00:1823:b0:704:3113:f71f with SMTP id
 d2e1a72fcca58-7043113ff29mr50851b3a.26.1717846879260;
        Sat, 08 Jun 2024 04:41:19 -0700 (PDT)
Received: from [192.168.0.171] ([223.166.28.45])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-703fd371f7esm3903211b3a.25.2024.06.08.04.41.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Jun 2024 04:41:18 -0700 (PDT)
Message-ID: <2ac09106-36df-4e03-94c3-42c7ec9f20f3@gmail.com>
Date: Sat, 8 Jun 2024 19:41:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] ASoC: qcom: display port changes
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20240422134354.89291-1-srinivas.kandagatla@linaro.org>
 <dd14e3ff-3ff7-426e-88e0-b16a49eafaf0@gmail.com>
 <44fad635-1b17-47bc-97f0-9a541e0b4f35@linaro.org>
 <21f0f2ac-dada-4e19-a0df-086021320101@gmail.com>
 <11803812-56cd-48d0-a0fc-8ca99d6f79d5@linaro.org>
Content-Language: en-US
From: Xilin Wu <wuxilin123@gmail.com>
In-Reply-To: <11803812-56cd-48d0-a0fc-8ca99d6f79d5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MailFrom: wuxilin123@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: P65IFR4ULRQLLVCJYQSD6MKEHLB5L2YI
X-Message-ID-Hash: P65IFR4ULRQLLVCJYQSD6MKEHLB5L2YI
X-Mailman-Approved-At: Thu, 13 Jun 2024 16:03:59 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P65IFR4ULRQLLVCJYQSD6MKEHLB5L2YI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2024/6/6 17:18, Srinivas Kandagatla wrote:
> Hi Xilin
> 
> On 25/05/2024 08:12, Xilin Wu wrote:
>> Hi Srini,
>>
>> On 2024/5/24 20:50, Srinivas Kandagatla wrote:
>>> Hi Xilin,
>>>
>>> On 23/05/2024 05:09, Xilin Wu wrote:
>>>>>
>>>>> Srinivas Kandagatla (4):
>>>>>    ASoC: qcom: q6dsp: parse Display port tokens
>>>>>    ASoC: qcom: common: add Display port Jack function
>>>>>    ASoC: qcom: sc8280xp: add Display port Jack
>>>>>    ASoC: qcom: sm8250: fix a typo in function name
>>>>>
>>>>>   sound/soc/qcom/common.c         | 29 +++++++++++++++++++++++++++++
>>>>>   sound/soc/qcom/common.h         |  3 +++
>>>>>   sound/soc/qcom/qdsp6/topology.c | 26 ++++++++++++++++++++++++++
>>>>>   sound/soc/qcom/sc8280xp.c       | 14 ++++++++++++++
>>>>>   sound/soc/qcom/sm8250.c         |  4 ++--
>>>>>   5 files changed, 74 insertions(+), 2 deletions(-)
>>>>>
>>>>
>>>> Hi Srini,
>>>>
>>>> I tested this series on SM8550 with tplg in [1] and ucm in [2]. But 
>>>> the kernel output errors attached below. Headphone does work 
>>>> properly without DisplayPort in the ucm.
>>>>
>>>> What could be the possible cause of this? Is there any significant 
>>>> change from sc8280xp to sm8550?
>>>>
>>>> -- 
>>>> Thanks,
>>>> Xilin Wu
>>>>
>>>> [1] 
>>>> https://github.com/edk2-porting/audioreach-topology/blob/sakuramist/QCS8550-AYN-ODIN2.m4
>>>> [2] 
> 
> For sm8550 you would need this patch for tplg
> 
> https://git.codelinaro.org/krzysztof.kozlowski/audioreach-topology/-/commit/d8ef47bc85700a7cdfabee5e06808d9f359b0a26
> 
> can you try this as the Container CAP Id changed for platforms from sm8550.
> 
> Kryzstof verified Display port tplg and these patches on x1e80100.
> 

That exactly solved the previous problem, thanks!

Hot-unplugging type-c caused `fail to close APM port` error, and DP 
audio will no longer work after that. But I guess that would be another 
issue anyway :)

-- 
Thanks,
Xilin Wu

> 
> thanks,
> srini
> 
>>>> https://github.com/strongtz/alsa-ucm-conf/blob/odin2/ucm2/Qualcomm/sm8550/HiFi.conf
>>>>
>>>> [ 1552.313713] qcom-apm gprsvc:service:2:1: Error (1) Processing 
>>>> 0x01001000 cmd
>>>> [ 1552.313730] qcom-apm gprsvc:service:2:1: DSP returned 
>>>> error[1001000] 1
>>>> [ 1552.314455] qcom-apm gprsvc:service:2:1: Error (1) Processing 
>>>
>>> Is the DP cable connected?
>>
>> I'm sure that the cable is connected and I have desktop on external 
>> display.
>> If it's not connected, kernel gives the following error when using aplay:
>>
>> hdmi-audio-codec hdmi-audio-codec.1.auto: ASoC: error at 
>> snd_soc_dai_hw_params on i2s-hifi: -22
>>
>>>
>>> if its not connected the dsp will throw this error.
>>>
>>> due to this issue I did workaround this issue by modeling it as 
>>> conflicting device to Speaker in x13s ucm.
>>>
>>> I see in your ucm setup its not the case.
>>> which is why you might be hitting this issue.
>>>
>>> Can you try
>>> amixer -c 0 cset iface=MIXER,name='DISPLAY_PORT_RX_0 Audio Mixer 
>>> MultiMedia2' 1
>>> aplay -D plughw:0,1 some-wav-file.wav
>>>
>>> both with and without display connected.
>>>
>>
>> aplay always gives the following error:
>>
>> Playing WAVE 'Summer.wav' : Signed 16 bit Little Endian, Rate 44100 
>> Hz, Stereo
>> aplay: set_params:1456: Unable to install hw params:
>> ACCESS:  RW_INTERLEAVED
>> FORMAT:  S16_LE
>> SUBFORMAT:  STD
>> SAMPLE_BITS: 16
>> FRAME_BITS: 32
>> CHANNELS: 2
>> RATE: 44100
>> PERIOD_TIME: (42666 42667)
>> PERIOD_SIZE: (1881 1882)
>> PERIOD_BYTES: (7524 7528)
>> PERIODS: (3 5)
>> BUFFER_TIME: (170657 170658)
>> BUFFER_SIZE: 7526
>> BUFFER_BYTES: 30104
>> TICK_TIME: 0
>>
>> and kernel gives the following when display is connected:
>>
>> [drm:dp_catalog_audio_config_sdp] sdp_cfg = 0x100066
>> [drm:dp_catalog_audio_config_sdp] sdp_cfg2 = 0x1b800004
>> [drm:dp_audio_hw_params] Header Byte 1: value = 0xce020000, 
>> parity_byte = 0xce
>> [drm:dp_audio_hw_params] Header Byte 2: value = 0x67010000, 
>> parity_byte = 0x0
>> [drm:dp_audio_hw_params] Header Byte 3: value = 0x67010000, 
>> parity_byte = 0x67
>> [drm:dp_audio_hw_params] Header Byte 1: value = 0x67010000, 
>> parity_byte = 0x67
>> [drm:dp_audio_hw_params] Header Byte 2: value = 0x33443517, 
>> parity_byte = 0x35
>> [drm:dp_audio_hw_params] Header Byte 3: value = 0x33443517, 
>> parity_byte = 0x33
>> [drm:dp_audio_hw_params] Header Byte 1: value = 0x84840000, 
>> parity_byte = 0x84
>> [drm:dp_audio_hw_params] Header Byte 2: value = 0x3344d71b, 
>> parity_byte = 0xd7
>> [drm:dp_audio_hw_params] Header Byte 3: value = 0x44, parity_byte = 0x33
>> [drm:dp_audio_hw_params] Header Byte 1: value = 0xd8050000, 
>> parity_byte = 0xd8
>> [drm:dp_audio_hw_params] Header Byte 2: value = 0x4b0f, parity_byte = 
>> 0x4b
>> [drm:dp_audio_hw_params] Header Byte 3: value = 0x4b0f, parity_byte = 0x0
>> [drm:dp_audio_hw_params] Header Byte 1: value = 0x71060000, 
>> parity_byte = 0x71
>> [drm:dp_audio_hw_params] Header Byte 2: value = 0x4b0f, parity_byte = 
>> 0x4b
>> [drm:dp_catalog_audio_config_acr] select: 0x3, acr_ctrl: 0x80004130
>> [drm:dp_catalog_audio_sfe_level] mainlink_level = 0xa08, 
>> safe_to_exit_level = 0x8
>> [drm:dp_catalog_audio_enable] dp_audio_cfg = 0xc1
>> qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
>> qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
>> qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
>> qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
>> qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001001 cmd
>> qcom-apm gprsvc:service:2:1: DSP returned error[1001001] 1
>> q6apm-lpass-dais 30000000.remoteproc:glink-edge:gpr:service@1:bedais: 
>> Failed to prepare Graph -22
>> q6apm-lpass-dais 30000000.remoteproc:glink-edge:gpr:service@1:bedais: 
>> ASoC: error at snd_soc_pcm_dai_prepare on DISPLAY_PORT_RX_0: -22
>> [drm:dp_catalog_audio_enable] dp_audio_cfg = 0xc0
>>
>>>
>>> --srini
>>>
>>>
>>>
>>>> 0x01001006 cmd
>>>> [ 1552.314463] qcom-apm gprsvc:service:2:1: DSP returned 
>>>> error[1001006] 1
>>>> [ 1552.315496] qcom-apm gprsvc:service:2:1: Error (1) Processing 
>>>> 0x01001006 cmd
>>>> [ 1552.315506] qcom-apm gprsvc:service:2:1: DSP returned 
>>>> error[1001006] 1
>>>> [ 1552.316033] qcom-apm gprsvc:service:2:1: Error (1) Processing 
>>>> 0x01001001 cmd
>>>> [ 1552.316042] qcom-apm gprsvc:service:2:1: DSP returned 
>>>> error[1001001] 1
>>>> [ 1552.316045] q6apm-lpass-dais 
>>>> 30000000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to 
>>>> prepare Graph -22
>>>> [ 1552.316047] q6apm-lpass-dais 
>>>> 30000000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC: error at 
>>>> snd_soc_pcm_dai_prepare on DISPLAY_PORT_RX_0: -22
>>

