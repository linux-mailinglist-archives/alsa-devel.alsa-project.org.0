Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E65709953C9
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2024 17:50:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39A3C847;
	Tue,  8 Oct 2024 17:49:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39A3C847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728402609;
	bh=kvIEUq6lQOonXvMeeETUDhU/87tOBln1EkRtqekczS4=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OK1Y5fo5wz1vTjVUZHwnQ5bsrJ/1J+ZDlRNp5V4HcxojdKKYWvTfFkPOTtzcjv37m
	 p9nU8IioQgoWmDtLCvbWI1/Sm3xk5Z1h6LZqC+rv9NYomRx9d0xuEsg8FB1htUGTAc
	 iNrHHRar7qhXlfZa+p2fOoliqc/DctlVK+JxPbAY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1875F805A8; Tue,  8 Oct 2024 17:49:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B651F805B0;
	Tue,  8 Oct 2024 17:49:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C6EBF80528; Tue,  8 Oct 2024 17:49:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1051CF800ED
	for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2024 17:49:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1051CF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=freebox-fr.20230601.gappssmtp.com
 header.i=@freebox-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=IE+t/jqw
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-42cb5b3c57eso59651535e9.2
        for <alsa-devel@alsa-project.org>;
 Tue, 08 Oct 2024 08:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1728402551;
 x=1729007351; darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UV0xhuPGi7akzhMCY3jQ9J7SRS3lJqpZQcl7buLWaQU=;
        b=IE+t/jqwfSxKZl12/pwURf7dU53jfKabWJ+Su2oHgsEgv9dP7ayXvfzTtfspt1pMEF
         hI27sofzBFMdWTtbucFLyQZ7QQCj9hen4jEbfa2jud03iD7dQ8jqfxlInbXCFKZZXXIP
         f/+aWsZHi8J2ueBHKkrE8jZ1DjHKiJr9G2WOiYXksJpxNp/W/wE+MC/0enf4Yw+R1y0V
         5kWKSuqlCNBS8HmIdrHwD53kaTcI4tjkyxcX0iV/IZrfzAo851SfD3+yINMinYJH6Kb8
         fJBedyIPTaiMZsY37erGbX130eeErqnRqhrvUBnuwzU9E8ffFIO9zQFnLVD+n/5WlNx1
         mkqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728402551; x=1729007351;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UV0xhuPGi7akzhMCY3jQ9J7SRS3lJqpZQcl7buLWaQU=;
        b=oAUwPKLwWNFejKPxKOq0USzqNB8iywDPIJVFp5aAd2jY21ynGqll+dU3yvZz9FEnZ3
         G6+EauW0e4yHv6c0FweQDzFIVkUVC/gV4Et0P+ONkHHpeAG0djAylLL3U7t4LnGgnuVN
         iuZU0N9dvgeCkDP/WGvavt3gfGRdk5xvKtToMpomId3eUCwReAX95ACHXnO5ofo1jBJE
         zXpgLLJBOHwrWiVEY7pvPYHBilfB/OASFMbtliJb2CgsuJbNsQ777mxaL3XwYV2/bHBW
         FiRO07OI6hxedxYEW53Oe88TninI+QCBNDg+5OYKiZOK8DvN0xP2x6w4sG3CKB06W6wg
         TpGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTLs+Kjm/SNydi0ZFu2uqqJs3M7rde9ZwtW6+rwGU45ZMVluRKAZ7Q7EkitBJsfCwHGmApRamdvL3L@alsa-project.org
X-Gm-Message-State: AOJu0YxpQGpHJymHeuPnaB2lcpRqfKvoA7QHNPMC++yXHILghklKhIhb
	VIBYQ2xkleL2r15lcmDnNj8RqTkIiV501Ao7tchkwu0zhYxOJx2g3TzVMzxNp8I=
X-Google-Smtp-Source: 
 AGHT+IGKD8WC3wRG6K0q3TdpG5/U/6y2UB/o5uIkqrlbYU4kBq52xrt/4SyLJtlwgFVNT+aE3vwLJQ==
X-Received: by 2002:a05:600c:510d:b0:42c:b7f9:4bbd with SMTP id
 5b1f17b1804b1-42f85ae90b0mr130369345e9.26.1728402550727;
        Tue, 08 Oct 2024 08:49:10 -0700 (PDT)
Received: from [192.168.108.50] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43050578facsm25093265e9.19.2024.10.08.08.49.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 08:49:10 -0700 (PDT)
Message-ID: <96969a70-bf3b-4df4-b6fa-60eb20a15e13@freebox.fr>
Date: Tue, 8 Oct 2024 17:49:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Working on audio for qcom apq8098 / msm8998
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: MSM <linux-arm-msm@vger.kernel.org>, alsa-devel@alsa-project.org
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
References: <d9a7bfde-ea1e-4676-9993-62024e1b790d@freebox.fr>
Content-Language: en-US
In-Reply-To: <d9a7bfde-ea1e-4676-9993-62024e1b790d@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CLHQDH563SGP2CD4OAIX4YM4CCNFGSVR
X-Message-ID-Hash: CLHQDH563SGP2CD4OAIX4YM4CCNFGSVR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CLHQDH563SGP2CD4OAIX4YM4CCNFGSVR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08/10/2024 15:46, Marc Gonzalez wrote:

> [   15.106412] qcom,apr 17300000.remoteproc:glink-edge.apr_audio_svc.-1.-1: Adding APR/GPR dev: aprsvc:apr-service:4:3
> [   15.109935] qcom,apr 17300000.remoteproc:glink-edge.apr_audio_svc.-1.-1: Adding APR/GPR dev: aprsvc:apr-service:4:4
> [   15.119041] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_probe:1759
> [   15.134672] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: q6afe_dai_dev_probe
> [   15.137948] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: of_q6afe_parse_dai_data
> [   15.146461] qcom,apr 17300000.remoteproc:glink-edge.apr_audio_svc.-1.-1: Adding APR/GPR dev: aprsvc:apr-service:4:7
> [   15.153563] remoteproc remoteproc0: powering up 4080000.remoteproc
> [   15.166371] remoteproc remoteproc0: Booting fw image mba.mbn, size 234152
> [   15.169747] q6asm-dai 17300000.remoteproc:glink-edge:apr:apr-service@7:dais: Adding to iommu group 5
> [   15.170559] qcom,apr 17300000.remoteproc:glink-edge.apr_audio_svc.-1.-1: Adding APR/GPR dev: aprsvc:apr-service:4:8
> [   15.179732] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: msm_dai_q6_dai_probe
> [   15.199345] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_find_port:860
> [   15.208834] msm-snd-msm8998 sound: ASoC: registered pcm #0 MultiMedia1 (*)
> [   15.216194] msm-snd-msm8998 sound: snd-soc-dummy-dai <-> MultiMedia1 mapping ok
> [   15.221994] msm-snd-msm8998 sound: ASoC: registered pcm #1 MultiMedia2 (*)
> [   15.229582] msm-snd-msm8998 sound: snd-soc-dummy-dai <-> MultiMedia2 mapping ok
> [   15.236045] msm-snd-msm8998 sound: ASoC: registered pcm #2 (HDMI)
> [   15.243211] msm-snd-msm8998 sound: i2s-hifi <-> HDMI mapping ok
> [   15.285770] input: batfish Headset Jack as /devices/platform/sound/sound/card0/input2
> [   15.298010] qcom-q6v5-mss 4080000.remoteproc: MBA booted without debug policy, loading mpss
> [   15.542937] remoteproc remoteproc0: remote processor 4080000.remoteproc is now up

If I try to play sound on the HDMI link:

# tinymix set "HDMI Mixer MultiMedia1" 1
(no logs on the command line or in dmesg)

# tinyplay /home/equinox.wav
playing '/home/equinox.wav': 2 ch, 48000 hz, 16 bit
error playing sample

The corresponding kernel logs are:

[  204.324095] msm-snd-msm8998 sound: ASoC: find BE for widget MultiMedia1 Playback
[  204.324280] msm-snd-msm8998 sound: ASoC: try BE : HDMI Playback
[  204.330832] msm-snd-msm8998 sound: ASoC: try BE : I2S Playback
[  204.336452] msm-snd-msm8998 sound: ASoC: find BE for widget MM_DL1
[  204.342361] msm-snd-msm8998 sound: ASoC: try BE : HDMI Playback
[  204.348471] msm-snd-msm8998 sound: ASoC: try BE : I2S Playback
[  204.354319] msm-snd-msm8998 sound: ASoC: find BE for widget HDMI Mixer
[  204.360152] msm-snd-msm8998 sound: ASoC: try BE : HDMI Playback
[  204.366702] msm-snd-msm8998 sound: ASoC: try BE : I2S Playback
[  204.372545] msm-snd-msm8998 sound: ASoC: find BE for widget HDMI_RX
[  204.378439] msm-snd-msm8998 sound: ASoC: try BE : HDMI Playback
[  204.384520] msm-snd-msm8998 sound: ASoC: try BE : I2S Playback
[  204.390471] msm-snd-msm8998 sound: ASoC: find BE for widget HDMI Playback
[  204.396400] msm-snd-msm8998 sound: ASoC: try BE : HDMI Playback
[  204.403231]  MultiMedia1: ASoC: found 2 audio Playback paths
[  204.408912]  MultiMedia1: YO: dpcm_add_paths:1595
[  204.414855]  MultiMedia1: YO: dpcm_add_paths:1601
[  204.419435]  MultiMedia1: YO: dpcm_add_paths:1605 widget=MM_DL1
[  204.424105]  MultiMedia1: YO: dpcm_add_paths:1605 widget=HDMI Mixer
[  204.429867]  MultiMedia1: YO: dpcm_add_paths:1605 widget=HDMI_RX
[  204.436139]  MultiMedia1: YO: dpcm_add_paths:1605 widget=HDMI Playback
[  204.442394] msm-snd-msm8998 sound: ASoC: find BE for widget HDMI Playback
[  204.448691] msm-snd-msm8998 sound: ASoC: try BE : HDMI Playback
[  204.455581]  MultiMedia1: YO: dpcm_add_paths:1638
[  204.461316]  MultiMedia1: connected new DPCM Playback path MultiMedia1 -> HDMI
[  204.466220]  MultiMedia1: ASoC: found 1 new BE paths
[  204.473232]  HDMI: ASoC: open Playback BE HDMI
[  204.478379]  MultiMedia1: ASoC: open FE MultiMedia1
[  204.482911]  HDMI: ASoC: hw_params BE HDMI
[  204.487489] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: q6hdmi_hw_params
[  204.491715]  MultiMedia1: ASoC: hw_params FE MultiMedia1 rate 48000 chan 2 fmt 2
[  204.500814]  MultiMedia1: ASoC: prepare FE MultiMedia1
[  204.508108]  HDMI: ASoC: prepare BE HDMI
[  204.512978] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: q6afe_dai_prepare
[  204.517117] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_hdmi_port_prepare:1317
[  204.525864] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_port_start:1511
[  204.533151] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_port_set_param_v2:1050
[  204.540129] qcom-q6afe aprsvc:apr-service:4:4: YO: afe_apr_send_pkt:947
[  204.547820] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_callback:880
[  204.553692] qcom-q6afe aprsvc:apr-service:4:4: cmd = 0x100ef returned error = 0x18
[  204.560292] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_find_port:860
[  204.567937] qcom-q6afe aprsvc:apr-service:4:4: DSP returned error[18]
[  204.574262] qcom-q6afe aprsvc:apr-service:4:4: AFE enable for port 0x100e failed -22
[  204.583561] qcom-q6afe aprsvc:apr-service:4:4: AFE enable for port 0x100e failed -22
[  204.591317] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: fail to start AFE port 1
[  204.599101] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: ASoC: error at snd_soc_pcm_dai_prepare on HDMI: -22
[  204.608501]  MultiMedia1: ASoC: hw_free FE MultiMedia1
[  204.619781]  HDMI: ASoC: hw_free BE HDMI
[  204.624821] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: q6afe_dai_shutdown
[  204.628835]  MultiMedia1: ASoC: close FE MultiMedia1
[  204.637798]  HDMI: ASoC: BE HDMI event 2 dir 0
[  204.642745]  MultiMedia1: ASoC: BE Playback disconnect check for HDMI
[  204.646987]  MultiMedia1: freed DSP Playback path MultiMedia1 -> HDMI


Looks like the audio DSP might not be correctly initialized?

Regards


