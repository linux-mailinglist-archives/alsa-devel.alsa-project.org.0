Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BB08A8D22
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Apr 2024 22:41:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 350B0857;
	Wed, 17 Apr 2024 22:41:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 350B0857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713386509;
	bh=ITiZ2fpq/HihRXMxMD+fOObCfd7iBh/mgSkX4vJZggY=;
	h=Date:Subject:To:References:Cc:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Fl15kCL8o5KnPgsOlJn89lEgTeqcgDI2CucX00NrLGuqQM++9FlUTumGzoZHHhQO3
	 x+b+Vura0uWpaQVdeZPbGLAjSktv4MFc65IHFcok5dVkzRUwbFO8zqrZzaMgGKM6Hb
	 dwSUud39kyaYUyA0CQNEycm+Tzo2RBZbukWhC+vg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96423F8057F; Wed, 17 Apr 2024 22:41:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26357F80588;
	Wed, 17 Apr 2024 22:41:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8103F8025A; Wed, 17 Apr 2024 22:41:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 181D8F80124
	for <alsa-devel@alsa-project.org>; Wed, 17 Apr 2024 22:41:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 181D8F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Q07xT/Qw
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a51ddc783e3so7247866b.0
        for <alsa-devel@alsa-project.org>;
 Wed, 17 Apr 2024 13:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713386462; x=1713991262;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RcVoTPuXW+WHmIbLPZ+MXT1yyVJDN45gbEWOWncMp6E=;
        b=Q07xT/QwEXvU2UaqEduPZvHjPn+l7W43H7PiD3IoN/HU1yyNrIevjOOzMD6PSMJP1h
         U8y/Wn174QneDxgC4bBMqnUoMoGtMKSzlUXoFn38Y+t44VOlebgd9V9yrE5YzBklpYJr
         XQidqLWyqD9kpWWiXqAAcLc92kdKmHbRxy2+fTAVNQJuhF6gZmQJBSjki3lcg3nOe8kg
         YfXr0glzseGORmoMbyMLIqIxC+8bWw7Y4e26EhPsT4CYv2Olho13FmnGp0tJ46XZg5MM
         ANgdS2uf/WydZqxA4nf7ws6eepyQKKsGgZk7zrHHeBesvxhAu+vWfCJcjn/3C2SEFwaG
         +I6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713386462; x=1713991262;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RcVoTPuXW+WHmIbLPZ+MXT1yyVJDN45gbEWOWncMp6E=;
        b=BVc0K/RL+7Df4TClo8p70uNMyjLfiCyGbbilvQMJY7eiRz6m7IJQe3ngGZBpcXtLmn
         qqiN5uHNoUa/z5+YhBfZRxYeI/q9BiG/oWSDC9jUmgL622ws3bIaeGYm2aPGDRFnBQTk
         089PhI1K7sPQjgZpJzvpU/2wAfLojfEhw7TFLZBgyHFJ/nX4y2UShXBeQ6sOwbTSO/Y1
         VLLtXXCikOArpsej+s0tJc5mjvjUS5WLka6dP/A+vhW1dzzMRiqoqURJmgw0YOouczaK
         9EJfShpuAUNQfRRuGlkyP8VGHNbBJK5f9PBRShcuj1Y/gi9f9StaDVGcvcf1KkMrjUpf
         CFig==
X-Gm-Message-State: AOJu0Yz4rOVuXEAmReZIRyzuYLCD9PMsci2l8q1Gej32pKwPqCvW7b4h
	3JGKOJdeMsRwkOlqDY2BFb8UWqiilI5a4Wb0axvjSBdjBjXBzvECfhDZl+OBvGI=
X-Google-Smtp-Source: 
 AGHT+IFi6XKPbjhVKyt/GrjH0V0LKXLGUkLoERph9F8lMB5GSwa7YKRSVRyIuDtKGhFSjbvQdag8Hw==
X-Received: by 2002:a17:906:5ac6:b0:a52:2772:b9cb with SMTP id
 x6-20020a1709065ac600b00a522772b9cbmr362840ejs.24.1713386462247;
        Wed, 17 Apr 2024 13:41:02 -0700 (PDT)
Received: from [192.168.45.55] (078088045141.garwolin.vectranet.pl.
 [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id
 k23-20020a17090627d700b00a556adcf5fbsm19193ejc.116.2024.04.17.13.40.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Apr 2024 13:41:00 -0700 (PDT)
Message-ID: <c5e9e2a4-5506-4cce-b218-ec9a5baff40a@linaro.org>
Date: Wed, 17 Apr 2024 22:40:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] ASoC: codecs: wcd937x: add wcd937x codec driver
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
References: <20240416063600.309747-3-quic_mohs@quicinc.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Banajit Goswami <bgoswami@quicinc.com>,
 quic_rohkumar@quicinc.com, Takashi Iwai <tiwai@suse.com>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 Trilok Soni <quic_tsoni@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Alex Elder <alex.elder@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240416063600.309747-3-quic_mohs@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: SNVQJ3YGPTYNH6ZZWSSATKVJZXBLESK7
X-Message-ID-Hash: SNVQJ3YGPTYNH6ZZWSSATKVJZXBLESK7
X-MailFrom: konrad.dybcio@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SNVQJ3YGPTYNH6ZZWSSATKVJZXBLESK7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 16.04.2024 8:35 AM, Prasad Kumpatla wrote:
> This patch adds basic SoundWire codec driver to support for
> WCD937X TX and RX devices.
> 
> WCD937x has Multi Button Headset Control hardware to support Headset
> insertion, type detection, 8 headset buttons detection, Over Current
> detection and Impedence measurements.
> This patch adds support for this using wcd-mbhc apis.
> ---
>  sound/soc/codecs/wcd937x.c | 1583 ++++++++++++++++++++++++++++++++++++
>  sound/soc/codecs/wcd937x.h |  617 ++++++++++++++
>  2 files changed, 2200 insertions(+)
>  create mode 100644 sound/soc/codecs/wcd937x.c
>  create mode 100644 sound/soc/codecs/wcd937x.h
> 
> diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
> new file mode 100644
> index 000000000000..d29cb56630c7
> --- /dev/null
> +++ b/sound/soc/codecs/wcd937x.c
> @@ -0,0 +1,1583 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +// Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.

Well this is pretty disappointing

This is clearly built upon my commit [1] (which itself is built upon QC
downstream, for which it retains the QuIC copyright), which can be seen
e.g. in the funny bitwise ORing in wcd937x_set_micbias_data or the
precise comments/function ordering..

Please at least include the Linaro copyright.

Konrad

[1] https://git.codelinaro.org/konrad.dybcio/linux/-/commit/a62f9c6fc53d4249e9de57898821e5ca4d2e7ca2
