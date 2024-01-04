Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BBC823E01
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jan 2024 09:58:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E2E8ED1;
	Thu,  4 Jan 2024 09:58:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E2E8ED1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704358695;
	bh=2NehM04VXfIrWDIjhQ0p6S0EqLpmhKMUyCI6JnvURXc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iesJ5KBtMrYbhLs53JONZTi9BCBrv986zQFt98Q4tqm+/1evbyQ5XET6+Pk4lhMlu
	 +ASsh+j8muqh/jtOg9re8PXejVKOCKFJ86pcUOCx+NlxmeLrtBq7X3oNzyyMVuT+1K
	 I15CbvTu/ItC9X9emCj4VmIdJ4d6924DB9B8+yAk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37301F804B0; Thu,  4 Jan 2024 09:57:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E78AF805AD;
	Thu,  4 Jan 2024 09:57:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9AA98F80496; Thu,  4 Jan 2024 09:57:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED13DF804CC
	for <alsa-devel@alsa-project.org>; Thu,  4 Jan 2024 09:57:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED13DF804CC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=uxabJwHk
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-556e6a6d5b3so223644a12.1
        for <alsa-devel@alsa-project.org>;
 Thu, 04 Jan 2024 00:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704358644; x=1704963444;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7NM+lSy2JFxNYRdnQ3pFJqK0nq1Xog5/qHx1MD7yLMc=;
        b=uxabJwHkBifZNVmojthoZ9xOO53j+gb6opc1nC1Mb9x3FWmXrp8tRJ/dwhAIx4+KNs
         JZsdh7/1RQrMTUVnxukDbsG9ah546KjSp+zgjnH9Colyfn03XMrP0e5x9t+mD+SFYQmE
         X4RRlHDKuPWBYO+qeaow2t5EV1ticLVkNCEUd7AYzvnzqDl2LvNW4peNKEUuGvecjqSq
         fSdAOAFe5TuJBdd2EhVEBvcMq5OJPmel/ow4lZKyzWynw2YXhXVXHcH6/xI/6KU/Ip/q
         2gxN4awWy3M00J2I9qTovykdTWlvrU9k/G1ND62YbwUo4bgYTk4QkDQnpqFpSvaLa9He
         CloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704358644; x=1704963444;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7NM+lSy2JFxNYRdnQ3pFJqK0nq1Xog5/qHx1MD7yLMc=;
        b=LZOcD35XZdvJzi3vgkZlgJXfO4a64ozHbJ8LlIuJ0Ya+Znp6MzC9UhSdENYcHnJw1N
         iV+XKlLoB+JHx1Pn+rfYMJGzHR6BQ+sTE43jaKPomJL1ARCTAvuqqf4wcxYkEoDmyZcz
         gsHkWtQdD90gIEcIU+VFZskUjdcAxjecJWO2YGTL9Jy8nRZdDPDAcUJnVvlS/18O2JmN
         /00uYD+KvrfGb5jDIgUOkrZUB1L7XOZJynvugBa+BWSCScfMmKJnuYAJys1JjlC6slzF
         J+Ch83sTUYTeFvl4ltajyIENdbz64SnYSUewNg0/pIrv9RXWayPAezHt/pf6pHEDRvOq
         fzPA==
X-Gm-Message-State: AOJu0YzfMcRGeEUgCOd3D5dXIqiKvcrTVgvIeXHOF9jMisQnKAYSLKCc
	pS9DjQ2S6z0HwV1neWh26SfFgygyeeWsMA==
X-Google-Smtp-Source: 
 AGHT+IEQlUMy9peGvgc3YEyUx/m3a0L7XKMOxnVNhL9drrpoC27NW8FsiiouncEBPpsG07FDZagAnw==
X-Received: by 2002:a17:906:b247:b0:a27:6570:adbc with SMTP id
 ce7-20020a170906b24700b00a276570adbcmr187783ejb.33.1704358643864;
        Thu, 04 Jan 2024 00:57:23 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id
 li4-20020a170906f98400b00a26f5eb0554sm9020697ejb.63.2024.01.04.00.57.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jan 2024 00:57:23 -0800 (PST)
Message-ID: <88bd6668-7e67-42c7-97b6-d7029f371349@linaro.org>
Date: Thu, 4 Jan 2024 09:57:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] reset: add GPIO-based reset controller
Content-Language: en-US
To: Sean Anderson <sean.anderson@seco.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
References: <20231222150133.732662-1-krzysztof.kozlowski@linaro.org>
 <20231222150133.732662-3-krzysztof.kozlowski@linaro.org>
 <530e3473-eb3b-477c-8599-e7aa12779640@seco.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <530e3473-eb3b-477c-8599-e7aa12779640@seco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4JIC62STTXYT7WQFI5XXMD2RDWZKDJH5
X-Message-ID-Hash: 4JIC62STTXYT7WQFI5XXMD2RDWZKDJH5
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4JIC62STTXYT7WQFI5XXMD2RDWZKDJH5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 28/12/2023 17:05, Sean Anderson wrote:
> On 12/22/23 10:01, Krzysztof Kozlowski wrote:
>> Add simple driver to control GPIO-based resets using the reset
>> controller API for the cases when the GPIOs are shared and reset should
>> be coordinated.  The driver is expected to be used by reset core
>> framework for ad-hoc reset controllers.
> 
> How do we handle power sequencing? Often GPIOs need some pre/post delay in
> order to ensure proper power sequencing. For regular reset drivers, this is
> internal to the driver.

It's not part of this patchset. Power sequencing is an old topic and
generic solutions were failing, rejected, did not solve the problems,
etc (choose your reason).

Delays are device specific, so they go to drivers (depending on the
compatible). Complex power sequencing is way too much for simplified
reset-framework handling, so anyway it is expected you do it in your driver.


> 
> Maybe something like
> 
> my-device {
> 	reset-gpios = <&gpio 555 GPIO_ACTIVE_LOW>;
>         reset-gpios-post-deassert-us = <100>;

Feel free to add it later. This patchset, and actually all patches
should, solves one problem while allowing you to extend it later.

If there is a architectural problem in my approach not allowing you to
extend it later, then we should discuss it.

> };
> 
> Of course, this is a bit ambiguous if you have multiple devices using the same
> GPIO with different delays. Maybe we take the max? But the driver below seems
> to only have access to one device. Which I suppose begs the question: how do
> we know when it's safe to deassert the reset (e.g. we've gotten to the point
> where all devices using this reset gpio have gotten far enough to detect that
> they use it)?

The driver (reset consumer) knows when it is safe or not. You must
implement proper reset handling in your driver.

Best regards,
Krzysztof

