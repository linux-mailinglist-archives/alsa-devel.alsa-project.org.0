Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BF090110D
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Jun 2024 11:14:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55B8C839;
	Sat,  8 Jun 2024 11:14:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55B8C839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717838070;
	bh=eVab9dY4pSAIshPG2LfxmqFFlszomKgU2u38kNf82Fc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Vfwhr0ZFwhB6qxjK7qgUCjWwonHgBMkwKPxH8HNxQm1lsY8ajczU2wPIjPLLMJVIr
	 lohDo01yvyFFbhjslwb1fHhrqOGOryhDYnIEDxu+abe/b1xg3+yNTBTe0aNREmUDDi
	 v65+KzD0zOso1ClF7seRJu2WZ3LOsj+VIGifDnkQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8192DF80567; Sat,  8 Jun 2024 11:14:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5C1FF80558;
	Sat,  8 Jun 2024 11:14:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29B0AF804D6; Sat,  8 Jun 2024 11:12:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C5DCF8010C
	for <alsa-devel@alsa-project.org>; Sat,  8 Jun 2024 11:12:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C5DCF8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=z8lbgXhj
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-57a4d7ba501so3571171a12.2
        for <alsa-devel@alsa-project.org>;
 Sat, 08 Jun 2024 02:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717837923; x=1718442723;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B0UpUKnkWpc6C7/avXDFr5uyhktb5SegGLRIL+r2gqA=;
        b=z8lbgXhjQwjZDGLPg0BzieA47UKr6gHEhhdcL3CECbejWAqZ5Bwiz/c9CKJljQDvPv
         lXH2Noz5QhzxxAWiXeO9dBu4WtsZneT1sFTMfYTLeSYrY6HpiyfqVgxKU+MGsFp2pl8t
         ZfSX4modM+25OP/NKfDTUk1OsJp35pL1gVK8JnC/HKvkEKfHjxVeuiX0RrBoK7MZ1le5
         2d0/41ZIo5MsOrZWC4xk3E7ZhuTJkuu8PMIwDSOS+AK294nH9YJZ/imB3Wbr9kX9i+Nf
         rc2axXM2cwFAiFK3c9WUCasFPb188mcEFD3d/jPppb8bVpuQNOJX+ofOqvjutMAVWymu
         vU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717837923; x=1718442723;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B0UpUKnkWpc6C7/avXDFr5uyhktb5SegGLRIL+r2gqA=;
        b=IA3h9E6VsJfsIuU3Ar8YCtqdvYSMo8yRXnRVGR+iMDPlxA7CWdHjNv5DBhgemb3MG6
         VOXdgOYnO9XnZS3mOmuMLTSCiJzDdlQP+FtU7TOrjQZ3aGM00o5LD7LTiGyDwYY8pLIF
         focyS6ASDYyvcOSV/pcybhbrnVAnjNDco5SnNFe23kJmL9G28Jh1eVisGGwnvBG6M7lG
         /CxtpI29OyvLsIfDJxSu06M2itz8mU+9y3sAiaceSBjLLp2jRovYbx7QNXnqlgxsLnKv
         FzFSf1h+zHVeqONXuEOzDdorIyWmVVuKTp+OynNQtnZn9QKyb37ulqyxy3/4U6vL0Azj
         u+FQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVsXcEQxEnl2EMt2wvvdBYWOVmgSqjvbabm7h1BuBgZFxifEGkI/YCwHS0exPyV9JQIyUKcZ6lh7IPqZTyB4DAHzqd5CXIvax7Cuc=
X-Gm-Message-State: AOJu0YzU02OQZaAP2ZrV+9bzik0/qGDhungSLLmDzSYUxHtaimp7fDTw
	Oo3DbPJKYAb3Ai9nAwB4M47B/loZX1hKmNJwnypbwikl3QYFHddyJGf/Nvo+K6o=
X-Google-Smtp-Source: 
 AGHT+IGgJ9P7gtdKHjyuziQT+ntOGPCdrCq5wKDE9BsBfE7IbIX651xKkM9jSh5hxO3HmLkhGM90xw==
X-Received: by 2002:a50:8714:0:b0:57c:6c98:b622 with SMTP id
 4fb4d7f45d1cf-57c6c98b85amr620690a12.38.1717837922899;
        Sat, 08 Jun 2024 02:12:02 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-57aae20238asm3998372a12.73.2024.06.08.02.12.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Jun 2024 02:12:02 -0700 (PDT)
Message-ID: <3ea05a12-27a8-46df-9fb3-28501404a399@linaro.org>
Date: Sat, 8 Jun 2024 10:12:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] ASoC: qcom: display port changes
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: broonie@kernel.org, perex@perex.cz, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, krzk+dt@kernel.org
References: <20240606104922.114229-1-srinivas.kandagatla@linaro.org>
 <i6jwqycgywrq42u4km6pjppgvvhsbvuh7m6mzyqy2qcge32ihy@n3lrowkyouv2>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <i6jwqycgywrq42u4km6pjppgvvhsbvuh7m6mzyqy2qcge32ihy@n3lrowkyouv2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FTYQW2PFR4RV2XTMTJAGYLRQIODVCS63
X-Message-ID-Hash: FTYQW2PFR4RV2XTMTJAGYLRQIODVCS63
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FTYQW2PFR4RV2XTMTJAGYLRQIODVCS63/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thanks Dmitry for testing this out.

On 08/06/2024 03:23, Dmitry Baryshkov wrote:
> On Thu, Jun 06, 2024 at 11:49:18AM +0100, srinivas.kandagatla@linaro.org wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
>> This patchset adds support for.
>> 	1. parse Display Port module tokens from ASoC topology
>> 	2. add support to DP/HDMI Jack events.
>> 	3. fixes a typo in function name in sm8250
>>
>> Verified these patches on X13s along with changes to tplg in
>> https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/tree/topic/x13s-dp?ref_type=heads
>> and ucm changes from https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/topic/x13s-dp
>>
>> x1e80100 is verified by Krzysztof with his changes in tplg
>>
>> https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/merge_requests/7/commits
>>
>> Thanks,
>> Srini
>>
> 
> I have been testing this patchset on X13s, switching between speakers,
> connected and disconnected DP output.
> 

This series changed the Jack event names by removing HDMI string from it 
as suggested, did you update the UCM to reflect this?
I have pushed changes required to 
https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/topic/x13s-dp


Can you also try to  clean the asound.state restart the pipewire.

> - Once the DSP got into the state, where I could not further get it to
>    work until the reboot:
> 
> rohan pipewire[1749]: spa.alsa: set_hw_params: Invalid argument
> rohan pipewire[1749]: pw.node: (alsa_output.platform-sound.HiFi__hw_SC8280XPLENOVOX_1__sink-48) suspended -> error (Start error: Invalid argument)
> rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
> rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
> rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
> rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
> rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001001 cmd
> rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001001] 1
> rohan kernel: q6apm-lpass-dais 3000000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to prepare Graph -22
> rohan kernel: q6apm-lpass-dais 3000000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC: error at snd_soc_pcm_dai_prepare on WSA_CODEC_DMA_RX_0: -22
> rohan pipewire[1749]: spa.alsa: set_hw_params: Invalid argument
> rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
> rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
> rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
> rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
> rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001001 cmd
> rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001001] 1
> rohan kernel: q6apm-lpass-dais 3000000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to prepare Graph -22
> rohan kernel: q6apm-lpass-dais 3000000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC: error at snd_soc_pcm_dai_prepare on WSA_CODEC_DMA_RX_0: -22
> rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
> rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
> rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
> rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
> rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001001 cmd
> rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001001] 1
> 
> 
> - Once in a while during startup PipeWire will try opening the
>    incorrect DAI and then fail with:
> 
> rohan kernel: hdmi-audio-codec hdmi-audio-codec.8.auto: ASoC: error at snd_soc_dai_hw_params on i2s-hifi: -22
> rohan kernel: hdmi-audio-codec hdmi-audio-codec.8.auto: ASoC: error at snd_soc_dai_hw_params on i2s-hifi: -22
> 
>    I think this happens if previously I have selected DP as an output,
>    then closed gnome session, unplugged the cable and tried logging in
>    again.
> 
> Generally, it looks like even though the Jack is reporting
> 'unplugged', sound daemon still can switch to to the disabled output
I think this is to do with ucm changes requried for new jack name.

> (or the audio card can be left in the stale state).  In case of DP
> this frequently results in audio daemon or DSP failures.
> 
> So, the DP implementation needs to be made more robust, so that if
> DP output gets selected when the cable is unplugged, the driver will not
> attempt to configure the DSP.

I have tested this with

kernel: 
https://git.codelinaro.org/srinivas.kandagatla/linux/-/tree/dp/sc8280xp-6.10-rc1?ref_type=heads
ucm: https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/topic/x13s-dp
tplg: 
https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/tree/topic/x13s-dp?ref_type=heads


with the above on my x13s, I can properly do switching between dp0,dp1 
and speakers with no issues.

Can you try them?

thanks,
Srini

> 
