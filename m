Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BD7998CE8
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2024 18:11:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A95F86C1;
	Thu, 10 Oct 2024 18:11:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A95F86C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728576674;
	bh=xDmL0Sjodm1MTH4cgStzt7L+Cwj70HjrLs7JUbAhNo0=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CdXqBo9wteh2ujC/Hu8KDYeBDc30Nq3TeDI8XSEI/ntiASwx5Amanf/wnockRO2ky
	 EPO4sbrXbDSplS4DgVtS2o/YcAWcQuYWTRJI1MTCEph09falF1k6rDNJOMGUp7FiT9
	 iSGGc9SP4JrNbqlx3B1bnimJ2jAnjYl4ATbjSy6A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF7CBF805AF; Thu, 10 Oct 2024 18:10:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5576F805B0;
	Thu, 10 Oct 2024 18:10:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF920F80528; Thu, 10 Oct 2024 18:10:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 22BA3F80496
	for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2024 18:10:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22BA3F80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=freebox-fr.20230601.gappssmtp.com
 header.i=@freebox-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=j3vXY9Qd
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2facf48157dso12530161fa.2
        for <alsa-devel@alsa-project.org>;
 Thu, 10 Oct 2024 09:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1728576634;
 x=1729181434; darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BzAh/Ymx++It+K03y0tgy6GazaRcRDQGA5V1hyQM02c=;
        b=j3vXY9QdE6cJsfY62vyyf8ggGIgx6VyARNFLJ1FSDbjgDubinBUPQu/830KxSVncpA
         L9llgU+zIpUPJq0+QJXF99u/Q6eykTfAlI1ImvrR1cHuEuKiStBXuWmn8HX9J//CQuxX
         eNFLvIGekH3JRn+ukqmtRKipdx46Fyr4R4yXyacyvHH1W3P2F5snJJa95e7z8R5/QoC+
         DFlxiwBT+f8xLRDkp+p0IZHhqcZuWV8gdZe7spgns0ooJOGexIHgCuMtQpHZvmTAAytU
         7MQddzzSZLqLsD9jOGtmMfnqApi2Ujyk4By6u3F2fdZsIyPK2456PmHQH9J4N2LFO+GN
         UplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728576634; x=1729181434;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BzAh/Ymx++It+K03y0tgy6GazaRcRDQGA5V1hyQM02c=;
        b=taAO6KiwRsS9gVK5BoFAQ6IAnhq26NGjFDJUJtCHFBNOk5rIYETLIFQVntoa3mzgH4
         7aD046S+EbMayLA3hAhl270lRVa4pqFVvttGigwIHqgDtCmVMpKxycavnXLk2jzzrL7x
         nAPczMwnOSFgZadtgIFsC4IWQiXuM18vYEVoirHMOFl1kENZJDFYA5ZpRtX8ni7/JPyF
         TvnwkJfv0BN3Xzp8BlQ5JQjvLQ9SV+8uKuNYHvHy1qfFIgnuFamAAeH2c/DPuuz+VtM4
         thfEs0RL67ZofUKlcVyIjOajKErEpUi1d/wtbap0jjutIrwsh8ttm09BXKDj99O1oqbj
         UJjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQdu70145qMhBqfJrbaQGC6vZzWIcGfcR4pPEq7e3twfV9O1vWG7mYzNn6wJg+PPb680cRk4oMqU1i@alsa-project.org
X-Gm-Message-State: AOJu0Ywkwa6LX72h6+3V25nuH5YjikUUutoDHQrDCkpXrVY2ARCgdHut
	tU3pzxxD139c7wFO8N87BL2gLdsd3yrK6+MTsIWYNggopQ6vBtgZRjy3Mac4uJo=
X-Google-Smtp-Source: 
 AGHT+IFFsqihFAG3NebEV/2q++/ZjvX9EEsjT8KMbG+drPunQc19QKRwnGRP7MlnWXuXVen+SnnUqA==
X-Received: by 2002:a2e:d02:0:b0:2fa:dd6a:924a with SMTP id
 38308e7fff4ca-2fb18757f2amr35243641fa.24.1728576633511;
        Thu, 10 Oct 2024 09:10:33 -0700 (PDT)
Received: from [192.168.108.50] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431182d78b4sm20248845e9.10.2024.10.10.09.10.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 09:10:33 -0700 (PDT)
Message-ID: <429e80fb-c999-407c-b101-4a0f4284db43@freebox.fr>
Date: Thu, 10 Oct 2024 18:10:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Working on audio for qcom apq8098 / msm8998
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: MSM <linux-arm-msm@vger.kernel.org>, alsa-devel@alsa-project.org
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>, Rohit kumar <quic_rohkumar@quicinc.com>
References: <d9a7bfde-ea1e-4676-9993-62024e1b790d@freebox.fr>
 <96969a70-bf3b-4df4-b6fa-60eb20a15e13@freebox.fr>
Content-Language: en-US
In-Reply-To: <96969a70-bf3b-4df4-b6fa-60eb20a15e13@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ITJDWREGBTVXYUZSHF4BI76PH5IMGD2M
X-Message-ID-Hash: ITJDWREGBTVXYUZSHF4BI76PH5IMGD2M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ITJDWREGBTVXYUZSHF4BI76PH5IMGD2M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08/10/2024 17:49, Marc Gonzalez wrote:

> On 08/10/2024 15:46, Marc Gonzalez wrote:
> 
>> [   15.106412] qcom,apr 17300000.remoteproc:glink-edge.apr_audio_svc.-1.-1: Adding APR/GPR dev: aprsvc:apr-service:4:3
>> [   15.109935] qcom,apr 17300000.remoteproc:glink-edge.apr_audio_svc.-1.-1: Adding APR/GPR dev: aprsvc:apr-service:4:4
>> [   15.119041] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_probe:1759
>> [   15.134672] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: q6afe_dai_dev_probe
>> [   15.137948] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: of_q6afe_parse_dai_data
>> [   15.146461] qcom,apr 17300000.remoteproc:glink-edge.apr_audio_svc.-1.-1: Adding APR/GPR dev: aprsvc:apr-service:4:7
>> [   15.153563] remoteproc remoteproc0: powering up 4080000.remoteproc
>> [   15.166371] remoteproc remoteproc0: Booting fw image mba.mbn, size 234152
>> [   15.169747] q6asm-dai 17300000.remoteproc:glink-edge:apr:apr-service@7:dais: Adding to iommu group 5
>> [   15.170559] qcom,apr 17300000.remoteproc:glink-edge.apr_audio_svc.-1.-1: Adding APR/GPR dev: aprsvc:apr-service:4:8
>> [   15.179732] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: msm_dai_q6_dai_probe
>> [   15.199345] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_find_port:860
>> [   15.208834] msm-snd-msm8998 sound: ASoC: registered pcm #0 MultiMedia1 (*)
>> [   15.216194] msm-snd-msm8998 sound: snd-soc-dummy-dai <-> MultiMedia1 mapping ok
>> [   15.221994] msm-snd-msm8998 sound: ASoC: registered pcm #1 MultiMedia2 (*)
>> [   15.229582] msm-snd-msm8998 sound: snd-soc-dummy-dai <-> MultiMedia2 mapping ok
>> [   15.236045] msm-snd-msm8998 sound: ASoC: registered pcm #2 (HDMI)
>> [   15.243211] msm-snd-msm8998 sound: i2s-hifi <-> HDMI mapping ok
>> [   15.285770] input: batfish Headset Jack as /devices/platform/sound/sound/card0/input2
>> [   15.298010] qcom-q6v5-mss 4080000.remoteproc: MBA booted without debug policy, loading mpss
>> [   15.542937] remoteproc remoteproc0: remote processor 4080000.remoteproc is now up
> 
> If I try to play sound on the HDMI link:
> 
> # tinymix set "HDMI Mixer MultiMedia1" 1
> (no logs on the command line or in dmesg)
> 
> # tinyplay /home/equinox.wav
> playing '/home/equinox.wav': 2 ch, 48000 hz, 16 bit
> error playing sample
> 
> The corresponding kernel logs are:
> 
> [  204.324095] msm-snd-msm8998 sound: ASoC: find BE for widget MultiMedia1 Playback
> [  204.324280] msm-snd-msm8998 sound: ASoC: try BE : HDMI Playback
> [  204.330832] msm-snd-msm8998 sound: ASoC: try BE : I2S Playback
> [  204.336452] msm-snd-msm8998 sound: ASoC: find BE for widget MM_DL1
> [  204.342361] msm-snd-msm8998 sound: ASoC: try BE : HDMI Playback
> [  204.348471] msm-snd-msm8998 sound: ASoC: try BE : I2S Playback
> [  204.354319] msm-snd-msm8998 sound: ASoC: find BE for widget HDMI Mixer
> [  204.360152] msm-snd-msm8998 sound: ASoC: try BE : HDMI Playback
> [  204.366702] msm-snd-msm8998 sound: ASoC: try BE : I2S Playback
> [  204.372545] msm-snd-msm8998 sound: ASoC: find BE for widget HDMI_RX
> [  204.378439] msm-snd-msm8998 sound: ASoC: try BE : HDMI Playback
> [  204.384520] msm-snd-msm8998 sound: ASoC: try BE : I2S Playback
> [  204.390471] msm-snd-msm8998 sound: ASoC: find BE for widget HDMI Playback
> [  204.396400] msm-snd-msm8998 sound: ASoC: try BE : HDMI Playback
> [  204.403231]  MultiMedia1: ASoC: found 2 audio Playback paths
> [  204.408912]  MultiMedia1: YO: dpcm_add_paths:1595
> [  204.414855]  MultiMedia1: YO: dpcm_add_paths:1601
> [  204.419435]  MultiMedia1: YO: dpcm_add_paths:1605 widget=MM_DL1
> [  204.424105]  MultiMedia1: YO: dpcm_add_paths:1605 widget=HDMI Mixer
> [  204.429867]  MultiMedia1: YO: dpcm_add_paths:1605 widget=HDMI_RX
> [  204.436139]  MultiMedia1: YO: dpcm_add_paths:1605 widget=HDMI Playback
> [  204.442394] msm-snd-msm8998 sound: ASoC: find BE for widget HDMI Playback
> [  204.448691] msm-snd-msm8998 sound: ASoC: try BE : HDMI Playback
> [  204.455581]  MultiMedia1: YO: dpcm_add_paths:1638
> [  204.461316]  MultiMedia1: connected new DPCM Playback path MultiMedia1 -> HDMI
> [  204.466220]  MultiMedia1: ASoC: found 1 new BE paths
> [  204.473232]  HDMI: ASoC: open Playback BE HDMI
> [  204.478379]  MultiMedia1: ASoC: open FE MultiMedia1
> [  204.482911]  HDMI: ASoC: hw_params BE HDMI
> [  204.487489] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: q6hdmi_hw_params
> [  204.491715]  MultiMedia1: ASoC: hw_params FE MultiMedia1 rate 48000 chan 2 fmt 2
> [  204.500814]  MultiMedia1: ASoC: prepare FE MultiMedia1
> [  204.508108]  HDMI: ASoC: prepare BE HDMI
> [  204.512978] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: q6afe_dai_prepare
> [  204.517117] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_hdmi_port_prepare:1317
> [  204.525864] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_port_start:1511
> [  204.533151] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_port_set_param_v2:1050
> [  204.540129] qcom-q6afe aprsvc:apr-service:4:4: YO: afe_apr_send_pkt:947
> [  204.547820] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_callback:880
> [  204.553692] qcom-q6afe aprsvc:apr-service:4:4: cmd = 0x100ef returned error = 0x18
> [  204.560292] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_find_port:860
> [  204.567937] qcom-q6afe aprsvc:apr-service:4:4: DSP returned error[18]
> [  204.574262] qcom-q6afe aprsvc:apr-service:4:4: AFE enable for port 0x100e failed -22
> [  204.583561] qcom-q6afe aprsvc:apr-service:4:4: AFE enable for port 0x100e failed -22
> [  204.591317] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: fail to start AFE port 1
> [  204.599101] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: ASoC: error at snd_soc_pcm_dai_prepare on HDMI: -22
> [  204.608501]  MultiMedia1: ASoC: hw_free FE MultiMedia1
> [  204.619781]  HDMI: ASoC: hw_free BE HDMI
> [  204.624821] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: q6afe_dai_shutdown
> [  204.628835]  MultiMedia1: ASoC: close FE MultiMedia1
> [  204.637798]  HDMI: ASoC: BE HDMI event 2 dir 0
> [  204.642745]  MultiMedia1: ASoC: BE Playback disconnect check for HDMI
> [  204.646987]  MultiMedia1: freed DSP Playback path MultiMedia1 -> HDMI
> 
> 
> Looks like the audio DSP might not be correctly initialized?

[ Adding Bjorn & Jeffrey & Rohit ]

Right now, I'm thinking I might (??) need the code in sound/soc/qcom/lpass-cpu.c
to be called.

$ git grep asoc_qcom_lpass_cpu_platform_probe
sound/soc/qcom/lpass-apq8016.c: .probe  = asoc_qcom_lpass_cpu_platform_probe,
sound/soc/qcom/lpass-cpu.c:int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
sound/soc/qcom/lpass-cpu.c:EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_platform_probe);
sound/soc/qcom/lpass-ipq806x.c: .probe  = asoc_qcom_lpass_cpu_platform_probe,
sound/soc/qcom/lpass-msm8998.c: .probe = asoc_qcom_lpass_cpu_platform_probe,
sound/soc/qcom/lpass-sc7180.c:  .probe = asoc_qcom_lpass_cpu_platform_probe,
sound/soc/qcom/lpass-sc7280.c:  .probe = asoc_qcom_lpass_cpu_platform_probe,
sound/soc/qcom/lpass.h:int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev);


For example, lpass-sc7280.c defines "qcom,sc7280-lpass-cpu"

Binding:
Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml

Corresponding DTS in arch/arm64/boot/dts/qcom/sc7280.dtsi

		lpass_cpu: audio@3987000 {
			compatible = "qcom,sc7280-lpass-cpu";

			reg = <0 0x03987000 0 0x68000>,
			      <0 0x03b00000 0 0x29000>,
			      <0 0x03260000 0 0xc000>,
			      <0 0x03280000 0 0x29000>,
			      <0 0x03340000 0 0x29000>,
			      <0 0x0336c000 0 0x3000>;
			reg-names = "lpass-hdmiif",
				    "lpass-lpaif",
				    "lpass-rxtx-cdc-dma-lpm",
				    "lpass-rxtx-lpaif",
				    "lpass-va-lpaif",
				    "lpass-va-cdc-dma-lpm";

			iommus = <&apps_smmu 0x1820 0>,
				 <&apps_smmu 0x1821 0>,
				 <&apps_smmu 0x1832 0>;

			power-domains = <&rpmhpd SC7280_LCX>;
			power-domain-names = "lcx";
			required-opps = <&rpmhpd_opp_nom>;

			clocks = <&lpass_aon LPASS_AON_CC_AUDIO_HM_H_CLK>,
				 <&lpass_core LPASS_CORE_CC_EXT_MCLK0_CLK>,
				 <&lpass_core LPASS_CORE_CC_SYSNOC_MPORT_CORE_CLK>,
				 <&lpass_core LPASS_CORE_CC_EXT_IF0_IBIT_CLK>,
				 <&lpass_core LPASS_CORE_CC_EXT_IF1_IBIT_CLK>,
				 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM_CLK>,
				 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM0_CLK>,
				 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM1_CLK>,
				 <&lpass_audiocc LPASS_AUDIO_CC_CODEC_MEM2_CLK>,
				 <&lpass_aon LPASS_AON_CC_VA_MEM0_CLK>;
			clock-names = "aon_cc_audio_hm_h",
				      "audio_cc_ext_mclk0",
				      "core_cc_sysnoc_mport_core",
				      "core_cc_ext_if0_ibit",
				      "core_cc_ext_if1_ibit",
				      "audio_cc_codec_mem",
				      "audio_cc_codec_mem0",
				      "audio_cc_codec_mem1",
				      "audio_cc_codec_mem2",
				      "aon_cc_va_mem0";

			#sound-dai-cells = <1>;
			#address-cells = <1>;
			#size-cells = <0>;

			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
				     <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>,
				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
			interrupt-names = "lpass-irq-lpaif",
					  "lpass-irq-hdmi",
					  "lpass-irq-vaif",
					  "lpass-irq-rxtxif";

			status = "disabled";
		};


Is there an equivalent HW block for msm8998?

Vendor kernel has no hits for hdmiif.

I don't see anything relevant downstream :(

Do I need to look at the HW block at address 0xee000000 ?

lpass-lpaif could be LPASS_LPA_IF_REG_BASE at LPASS_BASE + 0x00100000 ?

Regards

