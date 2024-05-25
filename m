Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2993C90777E
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 17:51:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42365A4D;
	Thu, 13 Jun 2024 17:51:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42365A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718293875;
	bh=HHYNBzmrY3K2RD7J4rY+nMkppxrdSNNVabRkntKVknE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=loTrL/XJJc4JgK5BaRuCQq4ZnFfs2GrAeux5xfAhXrzi2Jb0Ft3mOapizZmABlKQR
	 8jQ7ndLVRcXBOT6PRxhPAkuUN4/GPSlE/RFWwmMYNUB8KEzaGxAb51NvNvwVbP/YZ8
	 /fh/Ms5bEXUC3IV7HJHZxgPT5tIaSeqYulsiG7t0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D981F805BA; Thu, 13 Jun 2024 17:50:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DED6F805B1;
	Thu, 13 Jun 2024 17:50:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75AFEF8020D; Sat, 25 May 2024 09:12:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 58928F8016B
	for <alsa-devel@alsa-project.org>; Sat, 25 May 2024 09:12:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58928F8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KKjj552a
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-68195b58daeso1287669a12.2
        for <alsa-devel@alsa-project.org>;
 Sat, 25 May 2024 00:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716621156; x=1717225956;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fb2z3nmHoMhzHbgUsiZMAh19uOQGG1aEzUpQJqiuJ1c=;
        b=KKjj552aJ4sEqRsPQOgQeRzPSwvMJtTvgBvMokTmVjgibFEIjfkvjOeMGXqfnriBnn
         OOwenaJKAk5NXoofUMNeqDZRg9T8uanDNqNSz4fZKES9/OZxONF5VdnuYT+AjlVfgWgE
         TkXSv7b5ylbF3H2zWRwAbvhRQ2WQdYPS+pEJg0x8x41+/4z+Ww/ykehRUiqjjJUPmRT5
         nJuxah7ILTnjlUEVUcSaIq2ru+MkrwqPnWYIP8ieOKg3qHegbRkyYr7ADxROUxBVVim9
         UpfG0Ktrt2KvWIb0zyiOzoLFUI9GQ7VOo0nclyeugL8l3eu//hVtCyHIPXq+52+ZTfcB
         0CSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716621156; x=1717225956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fb2z3nmHoMhzHbgUsiZMAh19uOQGG1aEzUpQJqiuJ1c=;
        b=V3Zppm3ynW4CC6n8OcXUMbw4H7LLzNsFYR5jkosLhzb2a4AoVDz2Yq5JltOkOKSNXF
         C6DA/c7Th02gaFIo7sjzzZVlnY/o+soUo2Yt+yQ0UomDzdiYf2rwf+Al7G7JEfRc4DmD
         PV0nlRQqkRnTr6ZagSLEU0czFlhfnhABkO7TfrlwkH1EeXeokZYALje/KZrVEO938GHu
         SnEMD09GmiTVTis7WXCtB5Rwj7T4hEbRCkB4cVii74TCUIEaI8WeUq0csgTId46QObnS
         /meRLk92mBkqEaPyHeTyYC5DVCppVoWM4dnbreKHipO3LpeAaEAil4eYZQJLS4RRD11h
         ai2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtLQrItioK7a1cD0Fd1H8mrRhymRUVJmGnEnw5aertPYrPk/qE4EaCmcS6d3sqFPgZVDjef+BQyu0VWuCXUQ6oksJw2ICkrQqaayM=
X-Gm-Message-State: AOJu0YybZcpd4tXCJs/E/yESjuJKiI1TJ2+7/7tUwuMUU76rzdSggPjt
	tHlU42FTHdJJpyItAqSvVrxw+hrRrdWi3wWv1yBG1TvCU9cSXQjg
X-Google-Smtp-Source: 
 AGHT+IFbaXJCkb9zPhfRLTDH3PBTlrYqdvihr2qHgl4nG35A3rX48ISCmRk98SKFBDWl5zW+G4fv0A==
X-Received: by 2002:a17:902:e5c5:b0:1f4:4d6c:e381 with SMTP id
 d9443c01a7336-1f44d6ce61bmr43987875ad.29.1716621156285;
        Sat, 25 May 2024 00:12:36 -0700 (PDT)
Received: from [0.0.0.0] (42-3-109-144.ptr.netvigator.com. [42.3.109.144])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c9a6fd0sm24441095ad.226.2024.05.25.00.12.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 May 2024 00:12:35 -0700 (PDT)
Message-ID: <21f0f2ac-dada-4e19-a0df-086021320101@gmail.com>
Date: Sat, 25 May 2024 15:12:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] ASoC: qcom: display port changes
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20240422134354.89291-1-srinivas.kandagatla@linaro.org>
 <dd14e3ff-3ff7-426e-88e0-b16a49eafaf0@gmail.com>
 <44fad635-1b17-47bc-97f0-9a541e0b4f35@linaro.org>
Content-Language: en-US
From: Xilin Wu <wuxilin123@gmail.com>
In-Reply-To: <44fad635-1b17-47bc-97f0-9a541e0b4f35@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MailFrom: wuxilin123@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: JQR2KAST6QB3T7ZDR62LQYSQ7HAICNXA
X-Message-ID-Hash: JQR2KAST6QB3T7ZDR62LQYSQ7HAICNXA
X-Mailman-Approved-At: Thu, 13 Jun 2024 15:50:35 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JQR2KAST6QB3T7ZDR62LQYSQ7HAICNXA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Srini,

On 2024/5/24 20:50, Srinivas Kandagatla wrote:
> Hi Xilin,
> 
> On 23/05/2024 05:09, Xilin Wu wrote:
>>>
>>> Srinivas Kandagatla (4):
>>>    ASoC: qcom: q6dsp: parse Display port tokens
>>>    ASoC: qcom: common: add Display port Jack function
>>>    ASoC: qcom: sc8280xp: add Display port Jack
>>>    ASoC: qcom: sm8250: fix a typo in function name
>>>
>>>   sound/soc/qcom/common.c         | 29 +++++++++++++++++++++++++++++
>>>   sound/soc/qcom/common.h         |  3 +++
>>>   sound/soc/qcom/qdsp6/topology.c | 26 ++++++++++++++++++++++++++
>>>   sound/soc/qcom/sc8280xp.c       | 14 ++++++++++++++
>>>   sound/soc/qcom/sm8250.c         |  4 ++--
>>>   5 files changed, 74 insertions(+), 2 deletions(-)
>>>
>>
>> Hi Srini,
>>
>> I tested this series on SM8550 with tplg in [1] and ucm in [2]. But 
>> the kernel output errors attached below. Headphone does work properly 
>> without DisplayPort in the ucm.
>>
>> What could be the possible cause of this? Is there any significant 
>> change from sc8280xp to sm8550?
>>
>> -- 
>> Thanks,
>> Xilin Wu
>>
>> [1] 
>> https://github.com/edk2-porting/audioreach-topology/blob/sakuramist/QCS8550-AYN-ODIN2.m4
>> [2] 
>> https://github.com/strongtz/alsa-ucm-conf/blob/odin2/ucm2/Qualcomm/sm8550/HiFi.conf
>>
>> [ 1552.313713] qcom-apm gprsvc:service:2:1: Error (1) Processing 
>> 0x01001000 cmd
>> [ 1552.313730] qcom-apm gprsvc:service:2:1: DSP returned error[1001000] 1
>> [ 1552.314455] qcom-apm gprsvc:service:2:1: Error (1) Processing 
> 
> Is the DP cable connected?

I'm sure that the cable is connected and I have desktop on external display.
If it's not connected, kernel gives the following error when using aplay:

hdmi-audio-codec hdmi-audio-codec.1.auto: ASoC: error at 
snd_soc_dai_hw_params on i2s-hifi: -22

> 
> if its not connected the dsp will throw this error.
> 
> due to this issue I did workaround this issue by modeling it as 
> conflicting device to Speaker in x13s ucm.
> 
> I see in your ucm setup its not the case.
> which is why you might be hitting this issue.
> 
> Can you try
> amixer -c 0 cset iface=MIXER,name='DISPLAY_PORT_RX_0 Audio Mixer 
> MultiMedia2' 1
> aplay -D plughw:0,1 some-wav-file.wav
> 
> both with and without display connected.
> 

aplay always gives the following error:

Playing WAVE 'Summer.wav' : Signed 16 bit Little Endian, Rate 44100 Hz, 
Stereo
aplay: set_params:1456: Unable to install hw params:
ACCESS:  RW_INTERLEAVED
FORMAT:  S16_LE
SUBFORMAT:  STD
SAMPLE_BITS: 16
FRAME_BITS: 32
CHANNELS: 2
RATE: 44100
PERIOD_TIME: (42666 42667)
PERIOD_SIZE: (1881 1882)
PERIOD_BYTES: (7524 7528)
PERIODS: (3 5)
BUFFER_TIME: (170657 170658)
BUFFER_SIZE: 7526
BUFFER_BYTES: 30104
TICK_TIME: 0

and kernel gives the following when display is connected:

[drm:dp_catalog_audio_config_sdp] sdp_cfg = 0x100066
[drm:dp_catalog_audio_config_sdp] sdp_cfg2 = 0x1b800004
[drm:dp_audio_hw_params] Header Byte 1: value = 0xce020000, parity_byte 
= 0xce
[drm:dp_audio_hw_params] Header Byte 2: value = 0x67010000, parity_byte 
= 0x0
[drm:dp_audio_hw_params] Header Byte 3: value = 0x67010000, parity_byte 
= 0x67
[drm:dp_audio_hw_params] Header Byte 1: value = 0x67010000, parity_byte 
= 0x67
[drm:dp_audio_hw_params] Header Byte 2: value = 0x33443517, parity_byte 
= 0x35
[drm:dp_audio_hw_params] Header Byte 3: value = 0x33443517, parity_byte 
= 0x33
[drm:dp_audio_hw_params] Header Byte 1: value = 0x84840000, parity_byte 
= 0x84
[drm:dp_audio_hw_params] Header Byte 2: value = 0x3344d71b, parity_byte 
= 0xd7
[drm:dp_audio_hw_params] Header Byte 3: value = 0x44, parity_byte = 0x33
[drm:dp_audio_hw_params] Header Byte 1: value = 0xd8050000, parity_byte 
= 0xd8
[drm:dp_audio_hw_params] Header Byte 2: value = 0x4b0f, parity_byte = 0x4b
[drm:dp_audio_hw_params] Header Byte 3: value = 0x4b0f, parity_byte = 0x0
[drm:dp_audio_hw_params] Header Byte 1: value = 0x71060000, parity_byte 
= 0x71
[drm:dp_audio_hw_params] Header Byte 2: value = 0x4b0f, parity_byte = 0x4b
[drm:dp_catalog_audio_config_acr] select: 0x3, acr_ctrl: 0x80004130
[drm:dp_catalog_audio_sfe_level] mainlink_level = 0xa08, 
safe_to_exit_level = 0x8
[drm:dp_catalog_audio_enable] dp_audio_cfg = 0xc1
qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001001 cmd
qcom-apm gprsvc:service:2:1: DSP returned error[1001001] 1
q6apm-lpass-dais 30000000.remoteproc:glink-edge:gpr:service@1:bedais: 
Failed to prepare Graph -22
q6apm-lpass-dais 30000000.remoteproc:glink-edge:gpr:service@1:bedais: 
ASoC: error at snd_soc_pcm_dai_prepare on DISPLAY_PORT_RX_0: -22
[drm:dp_catalog_audio_enable] dp_audio_cfg = 0xc0

> 
> --srini
> 
> 
> 
>> 0x01001006 cmd
>> [ 1552.314463] qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
>> [ 1552.315496] qcom-apm gprsvc:service:2:1: Error (1) Processing 
>> 0x01001006 cmd
>> [ 1552.315506] qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
>> [ 1552.316033] qcom-apm gprsvc:service:2:1: Error (1) Processing 
>> 0x01001001 cmd
>> [ 1552.316042] qcom-apm gprsvc:service:2:1: DSP returned error[1001001] 1
>> [ 1552.316045] q6apm-lpass-dais 
>> 30000000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to prepare 
>> Graph -22
>> [ 1552.316047] q6apm-lpass-dais 
>> 30000000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC: error at 
>> snd_soc_pcm_dai_prepare on DISPLAY_PORT_RX_0: -22

-- 
Thanks,
Xilin Wu

