Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C03BD900F42
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Jun 2024 04:24:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E200851;
	Sat,  8 Jun 2024 04:24:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E200851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717813468;
	bh=8jjq1gHnAInkHjlnzVHU3k3WOM8rwgC8BW9P44ujf30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KmdqeTy4rtaqMx6e5foXODfUN8AGClUNLhU3WMGWAODG49WRAadiUSu2dcj0RlzxQ
	 3RBCmVn92BxjEKB0nasgAL+jPTCp/tUcm+M+tuTyBB1Q8C3GW8D3Wjzvp4o9M2/GEp
	 /ers6+zol5+nEQc9P9QjSFq3AlJtt/Xen1AnyRAg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFDD4F805A1; Sat,  8 Jun 2024 04:23:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C0E3F80589;
	Sat,  8 Jun 2024 04:23:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBFDAF804D6; Sat,  8 Jun 2024 04:23:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B52C3F800AC
	for <alsa-devel@alsa-project.org>; Sat,  8 Jun 2024 04:23:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B52C3F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ifRuU92V
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52b8b7b8698so3344733e87.1
        for <alsa-devel@alsa-project.org>;
 Fri, 07 Jun 2024 19:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717813422; x=1718418222;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r9V+yvJSOPxV6HkhRzMGuSvkZwjbSgJnARuZIs0WNJg=;
        b=ifRuU92V7Dph/cYcrjhPi88WO24gSftui6dkntIosrZN2Nib98PW/rqeP66y7mkT9P
         iOOd5oZfL4GXYmxAn7X5ozffAMYyp0Dkb/Nwtu5FFepqygUS5wfgETegGGEAfsPF22ru
         FYrXmUCDd2MOyVCoiVmA6VY4RKeC0K1LJGxU/mWWrN4BlvaChN9tLNJxzhP0T01umUq1
         M2MPbBMNTPkXU3co7myDXiRMbOO9Hm2Jg9hZI8lUalhjBzr/ncAKc2BlUja3Dd+HjfWY
         cNi88Wb5hXlTQ2w/XxhsZRsjyUiTdLFKGxjGlrdgko/Br0GHoZAJH6JRzvfa4JQlxdzr
         geAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717813422; x=1718418222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r9V+yvJSOPxV6HkhRzMGuSvkZwjbSgJnARuZIs0WNJg=;
        b=Al7gFA1OL4OsZ359M8bZTZYguHAOs4VRtgxGeYzD/4Hhb4xpSjx5vkII/MYNNm2pUs
         Ahomo6lxKVXPIYbl6WTKCVZJrrfnnmTKADeqsJ7GKLShzWqoNN5OiEipQ/GUyc8d769q
         +5zvMNJjrUP+q6LSm+7vVIY2o0tAdVcL/fKJmQ/YRmtasD5WpikMvC7WYCXlnvWXhmK8
         emwjO2ByB+7VVDOtjmCC10Snd8oqRD/56iV8keCAdWOox8A9WFRCU7zx0Euza2iG+Ucp
         +aQv+yqf5xjBT3PkZ3VJwpcRIK2RfMvZu8kLAa1fbknqTvbsCWq5PQXhOnhKZK5cN12f
         ChtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCURwRRtqAouXrJLucbhfH9+ut+CazVM6aURLe409fcn3ffEKCKWJdbGLIC9wYD4ZFUVg2gN4AUTSKKfUBS7K5XAo0z8yhmKJ78PZtk=
X-Gm-Message-State: AOJu0YzuNu2QlFw/x1yCRGx3nzTjjxIP0VIe7xduqPuweCX6g8qPjxpe
	aAatwPRlGgINIHJcvuHPmC9RtjXE2CM3qth8MaLquy+REC0bV6Q4x+BjAW+gwaQ=
X-Google-Smtp-Source: 
 AGHT+IErTuWuRC95/TFbpSXncWl4vvSDO39M3dhsa+Ymd9gZ9Y5tyCiwQrYM+fotBE75ODyhxZSJPg==
X-Received: by 2002:a05:6512:2526:b0:52c:812b:6e72 with SMTP id
 2adb3069b0e04-52c812b70acmr60133e87.1.1717813421804;
        Fri, 07 Jun 2024 19:23:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52bb423cf1dsm708744e87.203.2024.06.07.19.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 19:23:41 -0700 (PDT)
Date: Sat, 8 Jun 2024 05:23:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, perex@perex.cz, lgirdwood@gmail.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
	krzk+dt@kernel.org
Subject: Re: [PATCH v3 0/4] ASoC: qcom: display port changes
Message-ID: <i6jwqycgywrq42u4km6pjppgvvhsbvuh7m6mzyqy2qcge32ihy@n3lrowkyouv2>
References: <20240606104922.114229-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606104922.114229-1-srinivas.kandagatla@linaro.org>
Message-ID-Hash: KSMVYPWR7TKVC6ICRUX3COH6U6NM3ZN4
X-Message-ID-Hash: KSMVYPWR7TKVC6ICRUX3COH6U6NM3ZN4
X-MailFrom: dmitry.baryshkov@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KSMVYPWR7TKVC6ICRUX3COH6U6NM3ZN4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 06, 2024 at 11:49:18AM +0100, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> This patchset adds support for.
> 	1. parse Display Port module tokens from ASoC topology
> 	2. add support to DP/HDMI Jack events.
> 	3. fixes a typo in function name in sm8250
> 
> Verified these patches on X13s along with changes to tplg in 
> https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/tree/topic/x13s-dp?ref_type=heads
> and ucm changes from https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/topic/x13s-dp
> 
> x1e80100 is verified by Krzysztof with his changes in tplg 
> 
> https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/merge_requests/7/commits
> 
> Thanks,
> Srini
> 

I have been testing this patchset on X13s, switching between speakers,
connected and disconnected DP output.

- Once the DSP got into the state, where I could not further get it to
  work until the reboot:

rohan pipewire[1749]: spa.alsa: set_hw_params: Invalid argument
rohan pipewire[1749]: pw.node: (alsa_output.platform-sound.HiFi__hw_SC8280XPLENOVOX_1__sink-48) suspended -> error (Start error: Invalid argument)
rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001001 cmd
rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001001] 1
rohan kernel: q6apm-lpass-dais 3000000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to prepare Graph -22
rohan kernel: q6apm-lpass-dais 3000000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC: error at snd_soc_pcm_dai_prepare on WSA_CODEC_DMA_RX_0: -22
rohan pipewire[1749]: spa.alsa: set_hw_params: Invalid argument
rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001001 cmd
rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001001] 1
rohan kernel: q6apm-lpass-dais 3000000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to prepare Graph -22
rohan kernel: q6apm-lpass-dais 3000000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC: error at snd_soc_pcm_dai_prepare on WSA_CODEC_DMA_RX_0: -22
rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001006 cmd
rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
rohan kernel: qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001001 cmd
rohan kernel: qcom-apm gprsvc:service:2:1: DSP returned error[1001001] 1


- Once in a while during startup PipeWire will try opening the
  incorrect DAI and then fail with:

rohan kernel: hdmi-audio-codec hdmi-audio-codec.8.auto: ASoC: error at snd_soc_dai_hw_params on i2s-hifi: -22
rohan kernel: hdmi-audio-codec hdmi-audio-codec.8.auto: ASoC: error at snd_soc_dai_hw_params on i2s-hifi: -22

  I think this happens if previously I have selected DP as an output,
  then closed gnome session, unplugged the cable and tried logging in
  again.

Generally, it looks like even though the Jack is reporting
'unplugged', sound daemon still can switch to to the disabled output
(or the audio card can be left in the stale state).  In case of DP
this frequently results in audio daemon or DSP failures.

So, the DP implementation needs to be made more robust, so that if
DP output gets selected when the cable is unplugged, the driver will not
attempt to configure the DSP.

-- 
With best wishes
Dmitry
