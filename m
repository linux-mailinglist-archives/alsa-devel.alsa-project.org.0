Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BB7905AA7
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 20:20:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6BABE7D;
	Wed, 12 Jun 2024 20:20:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6BABE7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718216429;
	bh=7m0NLHe62plcr+KKn2aUoCMSPm1X8JIzBoTlRPy0rf8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PP/6tBl1+a9wTq2+UmFX8+T+tC4p2++YtRDeKnajE9K/Aa548ou2+QjuvRoWVvcig
	 xpLivp1oYwJTIfVpnF5C3hEMjfRmsjiUmwIcb0gvQJjA8zIp/piuq3wanzI7dvhfHw
	 e+oppEkTWdIBSzxLHATHkAY4FLswuz7+eMnniwkg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82DC3F805B3; Wed, 12 Jun 2024 20:19:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01B56F80578;
	Wed, 12 Jun 2024 20:19:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B523AF8057A; Wed, 12 Jun 2024 20:19:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D49CF80578
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 20:19:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D49CF80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=B0PRYlam
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ebeefb9b56so1158081fa.0
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 11:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718216391; x=1718821191;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iqNOK6VrunTwe+R6PcjcYFGfe2uxZR6mzT7FM1DBlfw=;
        b=B0PRYlamMVPwhrc+N1I3YQetXIrFPsMcJ7TxZGpH9pfqxG3zSrHWeM4rT+7l9ji0n/
         lX0raTchYvKs/BeQ8hdVOZ50XFFSTrHO2umyab8Y/Ree89f+0OQCe72XLYX1aPUwDZ/7
         j8xzdePkMO+cxMl8akeCpPnqbMtLeooW6w/4OYGFZc60fiPqfjyiEocy9ZRsxBYPo9K4
         LsgDeeXw4QbxLiMnpilw9u4gq6jNnQK/SnavfeE7HSYOR2ueSyzvtU0A1Shqa8FkwvpA
         NPIboNqaAgGeUva3xo5a+ZTUKskforSRsS1olw18h11Mg9EtLCQndyJdNQ4j4+oazzzf
         iSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718216391; x=1718821191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iqNOK6VrunTwe+R6PcjcYFGfe2uxZR6mzT7FM1DBlfw=;
        b=VL/C3zlSXfDHbVUyekyHu2+6ivmte3oINHI58RYIE7OrzJgZxqkN1F49/TAkInNdlz
         tCdp3VyPb7aGvULLOuIxXjRsjDLZuvc8t3wUCURRdv0DvBER036KrwpyrCby3TCIIUwe
         +mkIjT+apvzR4JqI4uIK/uUo1GLhx3l5wqnkYdsQceVvc1WuxSflw3GDSwBFu9tf7Yj0
         x4cx5RaYstqcarRKpW53AptK86NZtOOMc1B2oOQdK9MVX1Rc0jLyCaWJGXnO3hzXXEnU
         eVrkuOrhV7dIRTYyGJnBhexaXia9IM0O3i4iIE9FxMYqZ+cC1M7FTb4E3/ZHDv9EKLWF
         LBXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUro4f5JqjDmi5FyVCLoRSlluZpvv/VBh327NtSdGva0FN0PMdQAjBRZ+/tMt1vhA2N6XZ7/Qcggd3UQCLLhM4D49Lwukx9PvMddh4=
X-Gm-Message-State: AOJu0YxOoOZHH74TIU1ihO4mPhi8Icw0v6fN/8Ebr09oZ+zhgl/XTyjx
	0Z14AHqvaRJ1j/uj8SVfxbaxkeRUSw6M6iJtnmz1XIZUDXZEBDxsATGtEjQj/c8=
X-Google-Smtp-Source: 
 AGHT+IHwWrOxv+6BSvdQ2PNy6rTqJ3e9pBd+N6k30YVyrZHLYYoJG+Hkk1QVviuejSmiogYnavs+FQ==
X-Received: by 2002:a2e:320c:0:b0:2eb:dc66:c49b with SMTP id
 38308e7fff4ca-2ebfc99c4a0mr18310981fa.44.1718216391279;
        Wed, 12 Jun 2024 11:19:51 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-57c80997d90sm6072608a12.25.2024.06.12.11.19.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 11:19:50 -0700 (PDT)
Message-ID: <eb551b0e-4d19-4a8b-b9e6-70199029e8c2@linaro.org>
Date: Wed, 12 Jun 2024 19:19:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] ASoC: codec: lpass-rx-macro: add support for 2.5
 codec version
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Banajit Goswami <bgoswami@quicinc.com>, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240612-lpass-codec-v25-v1-0-9f40611a1370@linaro.org>
 <20240612-lpass-codec-v25-v1-3-9f40611a1370@linaro.org>
 <dxkgfqxdx4kovs4lfgl6y22chv7b7skmacpttp2z5nzhqj2ijh@6sofslw756mp>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <dxkgfqxdx4kovs4lfgl6y22chv7b7skmacpttp2z5nzhqj2ijh@6sofslw756mp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: N7OULOSBI2XQHVBOZUPOOWFVFCZ7YXKK
X-Message-ID-Hash: N7OULOSBI2XQHVBOZUPOOWFVFCZ7YXKK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N7OULOSBI2XQHVBOZUPOOWFVFCZ7YXKK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 12/06/2024 19:18, Dmitry Baryshkov wrote:
>> -	memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
>> -	memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
>> -			rx_pre_2_5_defaults, sizeof(rx_pre_2_5_defaults));
>> +	switch (rx->codec_version) {
>> +	case LPASS_CODEC_VERSION_2_5 ... LPASS_CODEC_VERSION_2_8:
> I don't like that the next 2.9 version will end up in a default bucket.
> It might be better to have an explicit list of versions instead and then
> return -EINVAL in the default case.
makes sense

--srini
