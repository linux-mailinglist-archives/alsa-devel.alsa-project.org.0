Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E908C99508F
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2024 15:47:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39F6682C;
	Tue,  8 Oct 2024 15:47:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39F6682C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728395249;
	bh=gYyTwuFOPveTqzCPR+7oXosorQ301hAsytc6qm+lLG0=;
	h=Date:To:From:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=V0rv9lY7J7ZaazRxmBYccmMlHzpkzcje+f+Zf367qKogr72zIX64SqFzVPL66+40J
	 ETdy+8blLEz8pBGjuBTd4yyMoN8cuW/osrKGiLxgLDwKSolIUzNKW3HC/xcuGlXWHz
	 w9cewf/yamVahftPMMHxDxjlOwbZ3rmfGKTbJnjI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17CF3F805BB; Tue,  8 Oct 2024 15:46:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49BAEF805B1;
	Tue,  8 Oct 2024 15:46:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7485F80528; Tue,  8 Oct 2024 15:46:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73039F80104
	for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2024 15:46:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73039F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=freebox-fr.20230601.gappssmtp.com
 header.i=@freebox-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=YoG7fzJ5
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-37cdb42b29dso3576752f8f.0
        for <alsa-devel@alsa-project.org>;
 Tue, 08 Oct 2024 06:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1728395209;
 x=1729000009; darn=alsa-project.org;
        h=content-transfer-encoding:subject:cc:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNj+ypVkSyt7jiM/LioLTKbsA3AEP1m549CviHpF7I8=;
        b=YoG7fzJ5c7RRgs4iF6q/2pp7Nban2DRl1dMfXO1bfVtbIiyeG7BOwU4zNO1waqSfP2
         KUop+vW0YsinxcbC1CKua8czB2y6mg3bcP4eEYr2P9AMmF2vistXud35jmslHZECChQ3
         a+Gyk0/UKimXOA5b4kngDLVtGChploN2NF4IiDr5FkME5ngqXDkY9q5xaEDaSBmBlzoK
         is2P0cv62pQF1O8qcSFenQlRjVFtlRQVNcNm24sCscJqnv07UyWcV34lbA2GoOEh/NHz
         TPtg+JbAbhfTEgMsmoMva/uhQCPDdXWF1u4LZ1VP/msVz9bnjGMYRAGTsWUiseABiGin
         1Asw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728395209; x=1729000009;
        h=content-transfer-encoding:subject:cc:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aNj+ypVkSyt7jiM/LioLTKbsA3AEP1m549CviHpF7I8=;
        b=WMKA5YkZ2cX2p9HXRbXCDNTQufEKa6eYdNCOsMPHv6iTZe1/8VEE8fng6cAlcnFnO+
         o+baewynfthpqy84kTaaPyfXGGCdP7vRGdXWQMHHi6YJZ/D4RluT0hifbUseEl8xoQmp
         2t6oB/4pDYcJGryFOLDS1kOxEuNTcNYQjoruTwIJ9zBajCs8VpDSsWPFYsY7Tq4QLQ2W
         miJphufChl2o8YTcO+yVfnVXO6jgBoApicmKM/6IKqSSMixaSnrDekqYT3Aq3vZE1fJ3
         YHAvlxDJgOosnMWu1wbrQlZ6KofM5wQ+4+2AqsOifh/TVOhIEV6H2L881rKSxIKg7ANw
         BAag==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0leQwsb4WOKDNey+Qpc7Yo4qSMtSCiQwv+dx7MnavCCKp6SvqhKVL1to0JrzJ4+1E8NGAIETownC4@alsa-project.org
X-Gm-Message-State: AOJu0YwuVWEivPJCSDDBjRSIQ4eXZ56GlBCVp+Lhz9zH9BJ42bgoNGK/
	LhzDXL0kWnYsKgXktB3Nc6PfG5MRfL0YNJThovdTZyHndiTxy0hF4+bgdqT3GHY=
X-Google-Smtp-Source: 
 AGHT+IFXJAO33Zj+DFr58UK5lgT5fq7UQv5ImBMcovO6Aa2xa7XVbHv5N0QdLGDIabHiqIscJAIj5A==
X-Received: by 2002:adf:e546:0:b0:37c:d2f3:b3af with SMTP id
 ffacd0b85a97d-37d0e6d31e2mr9564900f8f.5.1728395208700;
        Tue, 08 Oct 2024 06:46:48 -0700 (PDT)
Received: from [192.168.108.50] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d16970520sm8201247f8f.96.2024.10.08.06.46.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 06:46:48 -0700 (PDT)
Message-ID: <d9a7bfde-ea1e-4676-9993-62024e1b790d@freebox.fr>
Date: Tue, 8 Oct 2024 15:46:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: MSM <linux-arm-msm@vger.kernel.org>, alsa-devel@alsa-project.org
From: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Working on audio for qcom apq8098 / msm8998
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VGPETUBAI3OE2YQIADTF662276KR5WK3
X-Message-ID-Hash: VGPETUBAI3OE2YQIADTF662276KR5WK3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VGPETUBAI3OE2YQIADTF662276KR5WK3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello everyone,

I've been trying to get audio working on a qcom apq8098 (cousin of msm8998) board.

Code is mostly based on work from here:
https://gitlab.com/msm8998-mainline/linux

This is the diff I have on top of v6.12-rc1
https://paste.debian.net/1331666/

Kernel log after init starts:

[   13.311201] random: crng init done
[   14.724797] atl1c 0000:01:00.0 enp1s0: renamed from eth0 (while UP)
[   14.895978] Detected VIPT I-cache on CPU1
[   14.896041] GICv3: CPU1: found redistributor 1 region 0:0x0000000017b20000
[   14.896113] CPU1: Booted secondary processor 0x0000000001 [0x51af8014]
[   14.949128] Detected VIPT I-cache on CPU2
[   14.949198] GICv3: CPU2: found redistributor 2 region 0:0x0000000017b40000
[   14.949272] CPU2: Booted secondary processor 0x0000000002 [0x51af8014]
[   15.025271] Detected VIPT I-cache on CPU3
[   15.025349] GICv3: CPU3: found redistributor 3 region 0:0x0000000017b60000
[   15.025423] CPU3: Booted secondary processor 0x0000000003 [0x51af8014]
[   15.106412] qcom,apr 17300000.remoteproc:glink-edge.apr_audio_svc.-1.-1: Adding APR/GPR dev: aprsvc:apr-service:4:3
[   15.109935] qcom,apr 17300000.remoteproc:glink-edge.apr_audio_svc.-1.-1: Adding APR/GPR dev: aprsvc:apr-service:4:4
[   15.119041] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_probe:1759
[   15.134672] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: q6afe_dai_dev_probe
[   15.137948] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: of_q6afe_parse_dai_data
[   15.146461] qcom,apr 17300000.remoteproc:glink-edge.apr_audio_svc.-1.-1: Adding APR/GPR dev: aprsvc:apr-service:4:7
[   15.153563] remoteproc remoteproc0: powering up 4080000.remoteproc
[   15.166371] remoteproc remoteproc0: Booting fw image mba.mbn, size 234152
[   15.169747] q6asm-dai 17300000.remoteproc:glink-edge:apr:apr-service@7:dais: Adding to iommu group 5
[   15.170559] qcom,apr 17300000.remoteproc:glink-edge.apr_audio_svc.-1.-1: Adding APR/GPR dev: aprsvc:apr-service:4:8
[   15.179732] q6afe-dai 17300000.remoteproc:glink-edge:apr:apr-service@4:dais: YOA: msm_dai_q6_dai_probe
[   15.199345] qcom-q6afe aprsvc:apr-service:4:4: YO: q6afe_find_port:860
[   15.208834] msm-snd-msm8998 sound: ASoC: registered pcm #0 MultiMedia1 (*)
[   15.216194] msm-snd-msm8998 sound: snd-soc-dummy-dai <-> MultiMedia1 mapping ok
[   15.221994] msm-snd-msm8998 sound: ASoC: registered pcm #1 MultiMedia2 (*)
[   15.229582] msm-snd-msm8998 sound: snd-soc-dummy-dai <-> MultiMedia2 mapping ok
[   15.236045] msm-snd-msm8998 sound: ASoC: registered pcm #2 (HDMI)
[   15.243211] msm-snd-msm8998 sound: i2s-hifi <-> HDMI mapping ok
[   15.285770] input: batfish Headset Jack as /devices/platform/sound/sound/card0/input2
[   15.298010] qcom-q6v5-mss 4080000.remoteproc: MBA booted without debug policy, loading mpss
[   15.542937] remoteproc remoteproc0: remote processor 4080000.remoteproc is now up
[   17.727724] ath10k_snoc 18800000.wifi: qmi chip_id 0x30214 chip_family 0x4001 board_id 0xff soc_id 0x40010002
[   17.727923] ath10k_snoc 18800000.wifi: qmi fw_version 0x100204b2 fw_build_timestamp 2019-09-04 03:01 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.1.0-01202-QCAHLSWMTPLZ-1.221523.2
[   17.736928] ath10k_snoc 18800000.wifi: qmi not waiting for msa_ready indicator
[   17.903361] platform a800000.usb: deferred probe pending: dwc3: failed to initialize core
[   21.512409] arm-smmu 16c0000.iommu: Unhandled context fault: fsr=0x402, iova=0x00000000, fsynr=0x1, cbfrsynra=0x1900, cb=0
[   21.512619] arm-smmu 16c0000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x1900
[   21.522450] arm-smmu 16c0000.iommu: FSYNR0 = 00000001 [S1CBNDX=0 PLVL=1]
[   21.599761] ath10k_snoc 18800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id 0x00000000 sub 0000:0000
[   21.599935] ath10k_snoc 18800000.wifi: kconfig debug 1 debugfs 1 tracing 0 dfs 0 testmode 0
[   21.608221] ath10k_snoc 18800000.wifi: firmware ver  api 5 features wowlan,mgmt-tx-by-reference,non-bmi crc32 3ec1ac4b
[   21.657531] ath10k_snoc 18800000.wifi: htt-ver 3.44 wmi-op 4 htt-op 3 cal file max-sta 32 raw 0 hwcrypto 1
[   21.713363] arm-smmu 16c0000.iommu: Unhandled context fault: fsr=0x402, iova=0x00000000, fsynr=0x1, cbfrsynra=0x1900, cb=0
[   21.713577] arm-smmu 16c0000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x1900
[   21.723404] arm-smmu 16c0000.iommu: FSYNR0 = 00000001 [S1CBNDX=0 PLVL=1]
[   21.732374] ath10k_snoc 18800000.wifi: invalid MAC address; choosing random
[   21.737662] ath: EEPROM regdomain: 0x0
[   21.744356] ath: EEPROM indicates default country code should be used
[   21.748148] ath: doing EEPROM country->regdmn map search
[   21.754648] ath: country maps to regdmn code: 0x3a
[   21.759986] ath: Country alpha2 being used: US
[   21.764605] ath: Regpair used: 0x3a


Does anyone see something obvious I might have missed?

Regards
