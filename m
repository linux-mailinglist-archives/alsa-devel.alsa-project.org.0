Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCE38CE581
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2024 14:51:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52083205;
	Fri, 24 May 2024 14:51:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52083205
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716555081;
	bh=eDQamOWoYYuEXUmhcnkWpL4VqjxwVBduLj3lV779nKM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UgTSEpAzfGQ1KKk3Fg2Su97/h2yqM+f8lThZ3qZAuJGamX6Sk2nMsiO5jaVZKzKNq
	 PnLkWGtu1TImphBfwLtG+PiEKJ9iR9Q3Zxz4/8FXiWJxWubAuBCSjuN0I7NvdF3Ctg
	 24FikJ0fr847dDmiBLPT37qpPmD3ImqnmPanPgwc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAEC6F8057A; Fri, 24 May 2024 14:50:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5122CF8059F;
	Fri, 24 May 2024 14:50:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A58E5F8020D; Fri, 24 May 2024 14:50:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3E68F80051
	for <alsa-devel@alsa-project.org>; Fri, 24 May 2024 14:50:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3E68F80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=J/Pi+hA3
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a6269ad71b6so97537366b.2
        for <alsa-devel@alsa-project.org>;
 Fri, 24 May 2024 05:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716555031; x=1717159831;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nVhdVIXzrZrH2rtYxzShcwZuJrIsOZ0s1vaYMg0zfDg=;
        b=J/Pi+hA3uJVwwtbq9eA67feXeHiRRujP5Yhui1UtftKlMAlt/SH73CTzkVj4BS9sAM
         s7cq7oDPYdQfp9V0n5IZPtbOCcCN1s/v0zKrQ1XqtsoKjBEgXkIDaNM4Q6A24NRZW9Un
         DPtwpd/57ucNhdvDnWKDXjsH2yXnIUIsRN1OwtsjqWjsLlaTIwmJtDX5ispx4DcyT1Tv
         PNdxLYtgkrkDAiOvBI/+Uyjg8VuuLPm539f5w+XLbtsS7ddh1Pn9GgQXlZXkqf/4TtRF
         +6aIzDkSuLd3Kgl6MtdvWuApI0q4br+GE6abTdyKvYq4zjsp9Nq9LfjecTkplYnPH2Z+
         I4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716555031; x=1717159831;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nVhdVIXzrZrH2rtYxzShcwZuJrIsOZ0s1vaYMg0zfDg=;
        b=rYcpURggG9vbLnYkqMhGuJiJTl9bF09HbJ7Yce2CvJHWCJnKDbvCARvJwXPvlelu+Q
         YVGEafnL48+lowTE4B8+yW9/v5MEodxa1LCK5XWhYMsZitxzoPtbOrpNR1KAP8GnwHHd
         cT1t+YelDmhj6O8qDuja8v6p9EGi3AIp9MtntLk2Fl/FE5fzkrYIFkBh/F/wbPv28SyQ
         y3tzC0tGHg579oSn9vQNwtBYoK0a49wETzoJwbsFRqcSjrW/cn8AcooBqofxdDw6J058
         ocJHwnwOdwNJN2ZnYlA6kMMLU+83rxChxkr5NveRETF9dIP2AnmyNNv1NiXbQte2j8Vg
         j44A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfu10y9cwKYHBZSSTUCUhnKj11AaTjtHVhuzuUVysuYWF13af9vxdJOdr+7DOBxymdXSFkPnobuOwcEkaK9o3o8mdrToVnTxv/wEM=
X-Gm-Message-State: AOJu0YyEyl52Kz5QYru386xSuWjHYgYwye73b0I7zA0KM+MolIH1ivgy
	JyKbepd1K0PJ7YsHiplwG0l9m0nkvJ6+/s23I2F1kitTIzgjVgjthvFhdWzLquk=
X-Google-Smtp-Source: 
 AGHT+IFpUY4zjxxZhQ4WmxohR/RqzsfJWJIcqAFeDsf1BhikFV0aBErJ2LAdMU88HyK8cXfon3fzeg==
X-Received: by 2002:a17:906:3c13:b0:a59:c9ad:bd26 with SMTP id
 a640c23a62f3a-a62641b32a8mr141937066b.12.1716555030604;
        Fri, 24 May 2024 05:50:30 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a626cc4ff19sm128293766b.121.2024.05.24.05.50.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 May 2024 05:50:29 -0700 (PDT)
Message-ID: <44fad635-1b17-47bc-97f0-9a541e0b4f35@linaro.org>
Date: Fri, 24 May 2024 13:50:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] ASoC: qcom: display port changes
To: Xilin Wu <wuxilin123@gmail.com>, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20240422134354.89291-1-srinivas.kandagatla@linaro.org>
 <dd14e3ff-3ff7-426e-88e0-b16a49eafaf0@gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <dd14e3ff-3ff7-426e-88e0-b16a49eafaf0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XWSFK5UXMR3ATVCTCNBV4ERQ6AH2ETBH
X-Message-ID-Hash: XWSFK5UXMR3ATVCTCNBV4ERQ6AH2ETBH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XWSFK5UXMR3ATVCTCNBV4ERQ6AH2ETBH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Xilin,

On 23/05/2024 05:09, Xilin Wu wrote:
>>
>> Srinivas Kandagatla (4):
>>    ASoC: qcom: q6dsp: parse Display port tokens
>>    ASoC: qcom: common: add Display port Jack function
>>    ASoC: qcom: sc8280xp: add Display port Jack
>>    ASoC: qcom: sm8250: fix a typo in function name
>>
>>   sound/soc/qcom/common.c         | 29 +++++++++++++++++++++++++++++
>>   sound/soc/qcom/common.h         |  3 +++
>>   sound/soc/qcom/qdsp6/topology.c | 26 ++++++++++++++++++++++++++
>>   sound/soc/qcom/sc8280xp.c       | 14 ++++++++++++++
>>   sound/soc/qcom/sm8250.c         |  4 ++--
>>   5 files changed, 74 insertions(+), 2 deletions(-)
>>
> 
> Hi Srini,
> 
> I tested this series on SM8550 with tplg in [1] and ucm in [2]. But the 
> kernel output errors attached below. Headphone does work properly 
> without DisplayPort in the ucm.
> 
> What could be the possible cause of this? Is there any significant 
> change from sc8280xp to sm8550?
> 
> -- 
> Thanks,
> Xilin Wu
> 
> [1] 
> https://github.com/edk2-porting/audioreach-topology/blob/sakuramist/QCS8550-AYN-ODIN2.m4
> [2] 
> https://github.com/strongtz/alsa-ucm-conf/blob/odin2/ucm2/Qualcomm/sm8550/HiFi.conf
> 
> [ 1552.313713] qcom-apm gprsvc:service:2:1: Error (1) Processing 
> 0x01001000 cmd
> [ 1552.313730] qcom-apm gprsvc:service:2:1: DSP returned error[1001000] 1
> [ 1552.314455] qcom-apm gprsvc:service:2:1: Error (1) Processing 

Is the DP cable connected?

if its not connected the dsp will throw this error.

due to this issue I did workaround this issue by modeling it as 
conflicting device to Speaker in x13s ucm.

I see in your ucm setup its not the case.
which is why you might be hitting this issue.

Can you try
amixer -c 0 cset iface=MIXER,name='DISPLAY_PORT_RX_0 Audio Mixer 
MultiMedia2' 1
aplay -D plughw:0,1 some-wav-file.wav

both with and without display connected.


--srini



> 0x01001006 cmd
> [ 1552.314463] qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
> [ 1552.315496] qcom-apm gprsvc:service:2:1: Error (1) Processing 
> 0x01001006 cmd
> [ 1552.315506] qcom-apm gprsvc:service:2:1: DSP returned error[1001006] 1
> [ 1552.316033] qcom-apm gprsvc:service:2:1: Error (1) Processing 
> 0x01001001 cmd
> [ 1552.316042] qcom-apm gprsvc:service:2:1: DSP returned error[1001001] 1
> [ 1552.316045] q6apm-lpass-dais 
> 30000000.remoteproc:glink-edge:gpr:service@1:bedais: Failed to prepare 
> Graph -22
> [ 1552.316047] q6apm-lpass-dais 
> 30000000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC: error at 
> snd_soc_pcm_dai_prepare on DISPLAY_PORT_RX_0: -22
