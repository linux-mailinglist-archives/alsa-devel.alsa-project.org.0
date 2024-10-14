Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B8599C9BB
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2024 14:11:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F31A846;
	Mon, 14 Oct 2024 14:10:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F31A846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728907860;
	bh=p4rhHB/UKpZ6HiONSBQrc7JBzW118GTHjnHokVSgSvE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ITNKoPXmWAdKu3bWVwI1mdt/YjPwgJMm2WwUQc3GKvAA7AiD2G6ynunFCm6AJZRZ9
	 zuntWptAIFiZJuqv7ov2H8U30iJV8CZxVA14KXiK75y/+GrPSQXTN4zYjyYZF1l78q
	 Eaa1EL/HJUizegxLNEJLBxg6vkiMm0q/LwmAv9KY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C537F805B6; Mon, 14 Oct 2024 14:10:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7209F805B1;
	Mon, 14 Oct 2024 14:10:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E6DBF80448; Mon, 14 Oct 2024 14:10:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6D6AF8016B
	for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2024 14:10:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6D6AF8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=freebox-fr.20230601.gappssmtp.com
 header.i=@freebox-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=ho0snOCU
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-37d518f9abcso2255855f8f.2
        for <alsa-devel@alsa-project.org>;
 Mon, 14 Oct 2024 05:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1728907831;
 x=1729512631; darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zRNupRWsatCd3qlLiZjRMe5HdutW8CawWG9+grpapUs=;
        b=ho0snOCUDxfdpNlzWu8lIoOQOoS3hyUMplCU841Kj1m2v0C9tSqs37a8o+RWvIJQWP
         62p4KVMfJnUwC0nZcADlaC/kVeeVC11L+XsbGKnvEB3sZz0r7wHDP3cGigUAO9SZj9/W
         Y7jqiFqhF/7pQdzg+sJs7+1qu7ImWNr2maA/tnAMyayh+NS+J29ypu0nTE8JOj1PNyTG
         +r5nuD+dXyuMQWSvMoKZF+3U5HxjDit4g6ah7gLvTKYnHPR3bC2rrb/NTMy6BgXzByjj
         WU9zyGwOHU6NLMT/odyglGrpoikxDi0gFPkcjzqsVVogpidtQjdylHNcCtIC062tE7Tt
         wHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728907831; x=1729512631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zRNupRWsatCd3qlLiZjRMe5HdutW8CawWG9+grpapUs=;
        b=Ab5LvRyH2QjMQHfLmgfisCAxKCUgN+o6z9RTUdfVF2rS4lmUB0OJ2Ue+MABuExtb1u
         z3rTT0wMHQCBYzbBqJNju+HVr6Di/BZK4NXe6TkreAkjEO0RjtTv0dwB5vqM4IbwOD/y
         6q7bfdYGpR/2s1mpAcA2YS9BtaL1DctmrKWtyscK/rV3QG3fPv+KmSdcTp5DTQJBVD+r
         CYmoNIWlES92FmhO+psK/pNPATiwM1wbcKKmpAQze42GafyZoXfl+jDyOPvYwm4ndSDo
         fetbd7FPMIo9uO+xdqcUQplYCNPgxrwbL4CRzD/juL6SQY7B5+igIOva5cqodL5GJnKe
         j9Yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtXZRZrKi/wLOk60O+aDwe+vhpyv5GdDj4wDTCEXhtthV8dF8YLw+ZkzWMcCNGyFZW+2ubCKRGz865@alsa-project.org
X-Gm-Message-State: AOJu0YzbdL08n7mLNbdV456MVt38wQDtQz7YOiMjpnqy3lhR9Q/3RH7d
	oii1Zb0f3kk3u/c+F1q6yh8fJ7JL2wibclkBb58dIhFBHTmdeMu/uqFSZY0CAyQ=
X-Google-Smtp-Source: 
 AGHT+IG2QV5+jPrYD03tm65azeGs4HVB32p1SEzKizCkaqwrtA8DcMZqI7eWxu/ExlSH1FittU/ZJg==
X-Received: by 2002:adf:8b96:0:b0:37d:49a1:40c7 with SMTP id
 ffacd0b85a97d-37d551f0b3amr7461513f8f.28.1728907831525;
        Mon, 14 Oct 2024 05:10:31 -0700 (PDT)
Received: from [192.168.108.50] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d4b7edea7sm11162130f8f.93.2024.10.14.05.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 05:10:31 -0700 (PDT)
Message-ID: <67d1ed3d-abc3-44e0-8edd-e0ae5f4df8a7@freebox.fr>
Date: Mon, 14 Oct 2024 14:10:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Working on audio for qcom apq8098 / msm8998
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, MSM
 <linux-arm-msm@vger.kernel.org>, alsa-devel@alsa-project.org
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>,
 Rohit kumar <quic_rohkumar@quicinc.com>
References: <d9a7bfde-ea1e-4676-9993-62024e1b790d@freebox.fr>
 <96969a70-bf3b-4df4-b6fa-60eb20a15e13@freebox.fr>
 <429e80fb-c999-407c-b101-4a0f4284db43@freebox.fr>
 <537daefc-1f0c-1c41-9d01-1fb2cedda0aa@quicinc.com>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <537daefc-1f0c-1c41-9d01-1fb2cedda0aa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MCAWPNR7V3OYCELV35L3SCAZTO3QC4ZR
X-Message-ID-Hash: MCAWPNR7V3OYCELV35L3SCAZTO3QC4ZR
X-MailFrom: mgonzalez@freebox.fr
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MCAWPNR7V3OYCELV35L3SCAZTO3QC4ZR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/10/2024 19:04, Jeffrey Hugo wrote:
> On 10/10/2024 10:10 AM, Marc Gonzalez wrote:
>> On 08/10/2024 17:49, Marc Gonzalez wrote:
>>> On 08/10/2024 15:46, Marc Gonzalez wrote:
>>>
>>>> [   15.106412] qcom,apr 17300000.remoteproc:glink-edge.apr_audio_svc.-1.-1: Adding APR/GPR dev: aprsvc:apr-service:4:3
>>>> [   15.109935] qcom,apr 17300000.remoteproc:glink-edge.apr_audio_svc.-1.-1: Adding APR/GPR dev: aprsvc:apr-service:4:4
>>>> [   15.119041] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_probe:1759
>>>> [   15.134672] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: q6afe_dai_dev_probe
>>>> [   15.137948] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: of_q6afe_parse_dai_data
>>>> [   15.146461] qcom,apr 17300000.remoteproc:glink-edge.apr_audio_svc.-1.-1: Adding APR/GPR dev: aprsvc:apr-service:4:7
>>>> [   15.153563] remoteproc remoteproc0: powering up 4080000.remoteproc
>>>> [   15.166371] remoteproc remoteproc0: Booting fw image mba.mbn, size 234152
>>>> [   15.169747] q6asm-dai 17300000.remoteproc:glink-edge:apr:apr-service@7:dais: Adding to iommu group 5
>>>> [   15.170559] qcom,apr 17300000.remoteproc:glink-edge.apr_audio_svc.-1.-1: Adding APR/GPR dev: aprsvc:apr-service:4:8
>>>> [   15.179732] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: msm_dai_q6_dai_probe
>>>> [   15.199345] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_find_port:860
>>>> [   15.208834] msm-snd-msm8998 sound: ASoC: registered pcm #0 MultiMedia1 (*)
>>>> [   15.216194] msm-snd-msm8998 sound: snd-soc-dummy-dai <-> MultiMedia1 mapping ok
>>>> [   15.221994] msm-snd-msm8998 sound: ASoC: registered pcm #1 MultiMedia2 (*)
>>>> [   15.229582] msm-snd-msm8998 sound: snd-soc-dummy-dai <-> MultiMedia2 mapping ok
>>>> [   15.236045] msm-snd-msm8998 sound: ASoC: registered pcm #2 (HDMI)
>>>> [   15.243211] msm-snd-msm8998 sound: i2s-hifi <-> HDMI mapping ok
>>>> [   15.285770] input: batfish Headset Jack as /devices/platform/sound/sound/card0/input2
>>>> [   15.298010] qcom-q6v5-mss 4080000.remoteproc: MBA booted without debug policy, loading mpss
>>>> [   15.542937] remoteproc remoteproc0: remote processor 4080000.remoteproc is now up
>>>
>>> If I try to play sound on the HDMI link:
>>>
>>> # tinymix set "HDMI Mixer MultiMedia1" 1
>>> (no logs on the command line or in dmesg)
>>>
>>> # tinyplay /home/equinox.wav
>>> playing '/home/equinox.wav': 2 ch, 48000 hz, 16 bit
>>> error playing sample
>>>
>>> The corresponding kernel logs are:
>>>
>>> [  204.324095] msm-snd-msm8998 sound: ASoC: find BE for widget MultiMedia1 Playback
>>> [  204.324280] msm-snd-msm8998 sound: ASoC: try BE : HDMI Playback
>>> [  204.330832] msm-snd-msm8998 sound: ASoC: try BE : I2S Playback
>>> [  204.336452] msm-snd-msm8998 sound: ASoC: find BE for widget MM_DL1
>>> [  204.342361] msm-snd-msm8998 sound: ASoC: try BE : HDMI Playback
>>> [  204.348471] msm-snd-msm8998 sound: ASoC: try BE : I2S Playback
>>> [  204.354319] msm-snd-msm8998 sound: ASoC: find BE for widget HDMI Mixer
>>> [  204.360152] msm-snd-msm8998 sound: ASoC: try BE : HDMI Playback
>>> [  204.366702] msm-snd-msm8998 sound: ASoC: try BE : I2S Playback
>>> [  204.372545] msm-snd-msm8998 sound: ASoC: find BE for widget HDMI_RX
>>> [  204.378439] msm-snd-msm8998 sound: ASoC: try BE : HDMI Playback
>>> [  204.384520] msm-snd-msm8998 sound: ASoC: try BE : I2S Playback
>>> [  204.390471] msm-snd-msm8998 sound: ASoC: find BE for widget HDMI Playback
>>> [  204.396400] msm-snd-msm8998 sound: ASoC: try BE : HDMI Playback
>>> [  204.403231]  MultiMedia1: ASoC: found 2 audio Playback paths
>>> [  204.408912]  MultiMedia1: YO: dpcm_add_paths:1595
>>> [  204.414855]  MultiMedia1: YO: dpcm_add_paths:1601
>>> [  204.419435]  MultiMedia1: YO: dpcm_add_paths:1605 widget=MM_DL1
>>> [  204.424105]  MultiMedia1: YO: dpcm_add_paths:1605 widget=HDMI Mixer
>>> [  204.429867]  MultiMedia1: YO: dpcm_add_paths:1605 widget=HDMI_RX
>>> [  204.436139]  MultiMedia1: YO: dpcm_add_paths:1605 widget=HDMI Playback
>>> [  204.442394] msm-snd-msm8998 sound: ASoC: find BE for widget HDMI Playback
>>> [  204.448691] msm-snd-msm8998 sound: ASoC: try BE : HDMI Playback
>>> [  204.455581]  MultiMedia1: YO: dpcm_add_paths:1638
>>> [  204.461316]  MultiMedia1: connected new DPCM Playback path MultiMedia1 -> HDMI
>>> [  204.466220]  MultiMedia1: ASoC: found 1 new BE paths
>>> [  204.473232]  HDMI: ASoC: open Playback BE HDMI
>>> [  204.478379]  MultiMedia1: ASoC: open FE MultiMedia1
>>> [  204.482911]  HDMI: ASoC: hw_params BE HDMI
>>> [  204.487489] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: q6hdmi_hw_params
>>> [  204.491715]  MultiMedia1: ASoC: hw_params FE MultiMedia1 rate 48000 chan 2 fmt 2
>>> [  204.500814]  MultiMedia1: ASoC: prepare FE MultiMedia1
>>> [  204.508108]  HDMI: ASoC: prepare BE HDMI
>>> [  204.512978] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: q6afe_dai_prepare
>>> [  204.517117] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_hdmi_port_prepare:1317
>>> [  204.525864] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_port_start:1511
>>> [  204.533151] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_port_set_param_v2:1050
>>> [  204.540129] qcom-q6afe aprsvc:apr-service:4:4: YO: afe_apr_send_pkt:947
>>> [  204.547820] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_callback:880
>>> [  204.553692] qcom-q6afe aprsvc:apr-service:4:4: cmd = 0x100ef returned error = 0x18
>>> [  204.560292] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_find_port:860
>>> [  204.567937] qcom-q6afe aprsvc:apr-service:4:4: DSP returned error[18]
>>> [  204.574262] qcom-q6afe aprsvc:apr-service:4:4: AFE enable for port 0x100e failed -22
>>> [  204.583561] qcom-q6afe aprsvc:apr-service:4:4: AFE enable for port 0x100e failed -22
>>> [  204.591317] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: fail to start AFE port 1
>>> [  204.599101] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: ASoC: error at snd_soc_pcm_dai_prepare on HDMI: -22
>>> [  204.608501]  MultiMedia1: ASoC: hw_free FE MultiMedia1
>>> [  204.619781]  HDMI: ASoC: hw_free BE HDMI
>>> [  204.624821] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: q6afe_dai_shutdown
>>> [  204.628835]  MultiMedia1: ASoC: close FE MultiMedia1
>>> [  204.637798]  HDMI: ASoC: BE HDMI event 2 dir 0
>>> [  204.642745]  MultiMedia1: ASoC: BE Playback disconnect check for HDMI
>>> [  204.646987]  MultiMedia1: freed DSP Playback path MultiMedia1 -> HDMI
>>>
>>>
>>> Looks like the audio DSP might not be correctly initialized?
>>
>> [ Adding Bjorn & Jeffrey & Rohit ]
>>
>> Right now, I'm thinking I might (??) need the code in sound/soc/qcom/lpass-cpu.c
>> to be called.
>>
>> $ git grep asoc_qcom_lpass_cpu_platform_probe
>> sound/soc/qcom/lpass-apq8016.c: .probe  = asoc_qcom_lpass_cpu_platform_probe,
>> sound/soc/qcom/lpass-cpu.c:int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>> sound/soc/qcom/lpass-cpu.c:EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_platform_probe);
>> sound/soc/qcom/lpass-ipq806x.c: .probe  = asoc_qcom_lpass_cpu_platform_probe,
>> sound/soc/qcom/lpass-msm8998.c: .probe = asoc_qcom_lpass_cpu_platform_probe,
>> sound/soc/qcom/lpass-sc7180.c:  .probe = asoc_qcom_lpass_cpu_platform_probe,
>> sound/soc/qcom/lpass-sc7280.c:  .probe = asoc_qcom_lpass_cpu_platform_probe,
>> sound/soc/qcom/lpass.h:int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev);
>>
>>
>> For example, lpass-sc7280.c defines "qcom,sc7280-lpass-cpu"
>>
>> Binding:
>> Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>>
>> Corresponding DTS in arch/arm64/boot/dts/qcom/sc7280.dtsi
>>
>> 		lpass_cpu: audio@3987000 {
>> 			compatible = "qcom,sc7280-lpass-cpu";
>>
>> 			reg = <0 0x03987000 0 0x68000>,
>> 			      <0 0x03b00000 0 0x29000>,
>> 			      <0 0x03260000 0 0xc000>,
>> 			      <0 0x03280000 0 0x29000>,
>> 			      <0 0x03340000 0 0x29000>,
>> 			      <0 0x0336c000 0 0x3000>;
>> 			reg-names = "lpass-hdmiif",
>> 				    "lpass-lpaif",
>> 				    "lpass-rxtx-cdc-dma-lpm",
>> 				    "lpass-rxtx-lpaif",
>> 				    "lpass-va-lpaif",
>> 				    "lpass-va-cdc-dma-lpm";
>>
>> 			iommus = <&apps_smmu 0x1820 0>,
>> 				 <&apps_smmu 0x1821 0>,
>> 				 <&apps_smmu 0x1832 0>;
>>
>> 			power-domains = <&rpmhpd SC7280_LCX>;
>> 			power-domain-names = "lcx";
>> 			required-opps = <&rpmhpd_opp_nom>;
>>
>> 			clocks = <&lpass_aon LPASS_AON_CC_AUDIO_HM_H_CLK>,
>> 				 <&lpass_core LPASS_CORE_CC_EXT_MCLK0_CLK>,
>> 				 <&lpass_core LPASS_CORE_CC_SYSNOC_MPORT_CORE_CLK>,
>> 				 <&lpass_core LPASS_CORE_CC_EXT_IF0_IBIT_CLK>,
>> 				 <&lpass_core LPASS_CORE_CC_EXT_IF1_IBIT_CLK>,
>> 				 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM_CLK>,
>> 				 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM0_CLK>,
>> 				 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM1_CLK>,
>> 				 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM2_CLK>,
>> 				 <&lpass_aon LPASS_AON_CC_VA_MEM0_CLK>;
>> 			clock-names = "aon_cc_audio_hm_h",
>> 				      "audio_cc_ext_mclk0",
>> 				      "core_cc_sysnoc_mport_core",
>> 				      "core_cc_ext_if0_ibit",
>> 				      "core_cc_ext_if1_ibit",
>> 				      "audio_cc_codec_mem",
>> 				      "audio_cc_codec_mem0",
>> 				      "audio_cc_codec_mem1",
>> 				      "audio_cc_codec_mem2",
>> 				      "aon_cc_va_mem0";
>>
>> 			#sound-dai-cells = <1>;
>> 			#address-cells = <1>;
>> 			#size-cells = <0>;
>>
>> 			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
>> 				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
>> 				     <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
>> 				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
>> 			interrupt-names = "lpass-irq-lpaif",
>> 					  "lpass-irq-hdmi",
>> 					  "lpass-irq-vaif",
>> 					  "lpass-irq-rxtxif";
>>
>> 			status = "disabled";
>> 		};
>>
>>
>> Is there an equivalent HW block for msm8998?
>>
>> Vendor kernel has no hits for hdmiif.
>>
>> I don't see anything relevant downstream :(
>>
>> Do I need to look at the HW block at address 0xee000000 ?
> 
> I haven't dug into audio.  Not entirely sure how to help here.
> 
> 0xee000000 is DDR on 8998.
> LPASS is at 0x17000000

#define LPASS_BASE		0xee000000
#define LPASS_BASE_SIZE		0x00800000
#define LPASS_BASE_PHYS		0x17000000

#define LPASS_LPASS_CC_REG_REG_BASE	(LPASS_BASE + 0)
#define LPASS_LPA_IF_REG_BASE		(LPASS_BASE + 0x00100000)

What's this LPASS_BASE at 0xee000000? Virtual address?

$ git grep 17000000 arch/arm/boot/dts/qcom
/* nothing for my vendor kernel DTS */


