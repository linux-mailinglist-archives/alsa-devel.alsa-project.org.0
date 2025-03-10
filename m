Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56612A590A5
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Mar 2025 11:03:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 673FC6059D;
	Mon, 10 Mar 2025 11:02:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 673FC6059D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741600984;
	bh=cWxy0cI9IRBdtcF9hBtL064XIaLB5iQpj1puE0k2iHs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=au78ziSNyIJJzisEzvVWiEvNr23b7mV2HU41wdhiKN+4pNfzeGzBiv5a4NGhW2Wrn
	 5rQ7ubpQLvwPBwiqNIueiP32AASn662hgRIOZXluymCznHn5KRBUM9xPSoVnTTMPVI
	 /m3gtESjpcY/MeEjZKVJWJlIN9yCPmouqtdTO7CQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B786F898E1; Mon, 10 Mar 2025 08:36:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A451EF898E6;
	Mon, 10 Mar 2025 08:36:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8288F898D2; Mon, 10 Mar 2025 08:36:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D34F9F898D2
	for <alsa-devel@alsa-project.org>; Mon, 10 Mar 2025 08:36:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D34F9F898D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=IMBe0aZy
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43935d1321aso4181715e9.1
        for <alsa-devel@alsa-project.org>;
 Mon, 10 Mar 2025 00:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741592175; x=1742196975;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xa4CNNhvKmxPqvqn82oXm7n4I9nALluv+zVQC8jnB2c=;
        b=IMBe0aZyKVJw1DgVBBQJ8rbiT4T/a/W1EgtOm/26MpIh0GImmC+RkikUfo1eP6w6fu
         LaTRM0BU9nS+Im5ijfyB3+KFH8VAT+1jeJ7gYceb4s35MoAyz9vQbqzgPCDGh5GnX++O
         dXIX3EGmm7BpqzOI5rLEOv96xV/M6fqQGUMTzRM0nfa9IsWVU9UQOdyt3u058aae9Wbb
         ZTq8tiFhFyhM8Ux3mIMC4B04uvFHW9+GevHGNrdG71M13ZzeWiqju1lklYs9rFwKCRCC
         rrvmher4QG8XyzZ+WLtPEQ+PyvBJhQWDEqPlG10Z/gTuEMHT10sw8dloM7pXJBdDmnZE
         84EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741592175; x=1742196975;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xa4CNNhvKmxPqvqn82oXm7n4I9nALluv+zVQC8jnB2c=;
        b=K0jb/8um8VxaUCntcYvLrecyx6dW8I3W1QsGLQJi63hz/OJ7uvnfLQ+iB2IJjAYIat
         d4Uyg/QwYurlq2XeyhL81Vsw/WFvlr4QuFrzhIwziDF8C79+7myFaPKX++reIFPD+NGN
         fnTC7RveLX97n3CQVqAcb0Ngsj8qyBssWJ00/5xk/83A644pl2/BamZhQBtxYVFrGCcv
         Vr55JFtr417aPrTJJM24+qVFU+TxEO4y6J4vwRvpsa4zqUnALB+cMVz7gAl50HrRTyys
         93kHFGPbfc7hRdt4h0OquGNUB6EaT+b186xdmC1wGJqAvPCFhm6280BaPtaeHPOQ7qsD
         UPXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfkJWMjWLWWSMeZCObRnmYdVpvuK9RFuz2HlRz9xyXIXCWWXMp3gW389n0QQTANHui0lHOhjzcTi6u@alsa-project.org
X-Gm-Message-State: AOJu0YwxEBLE3hGiA06tRwRF+YtXcy1SBCXVctMGBkbAf4BF/CUUKMzF
	ak4k8bniW4pAcpm0+JfxHJXw/eOhSBMvhyS3YyqvD5AM3stB2ouaBmTRglTF+20=
X-Gm-Gg: ASbGnctyjwDlQ7XwNtqKXT6oG1qBARMiZ53xcI9jJWu+qBNMMS1DpGHx9GN8OWhuFKI
	G/ZElAchdCLcnNlqWxKqBmxDWjdWBznm+X4B0A/+BcKKvEZlQYJw8YUTGP6sN2DcYSGZbtcSOef
	KcHOGrFQ6UghRSDaHynC1AR+FgiU2XSfRGgLbNvUdIsYIr1EQHCupldy4l37BvowpHaEu/+iVWc
	3C6DdYnnWc4VBDoEtIhRWAloyApLjr3VO4GoBwBAQPA/ZlEbmJHPF4KHcMcfRVTXXgupDdod8EA
	s9yZwaIrEg6NRG4PaeCMinDfrzlC3obzpehAXc3o6JLJsCIN0Ya3ba4bj9qc4ir8
X-Google-Smtp-Source: 
 AGHT+IFVXFL64jZecsah6xQkhxZkKgRHp9R2l4F8ZTX3AzFLhyxktPPsVkwFvk588glmtmFgKAtL7Q==
X-Received: by 2002:a05:6000:1a8b:b0:38d:b090:a0c4 with SMTP id
 ffacd0b85a97d-3913bbbae73mr1776799f8f.10.1741592174645;
        Mon, 10 Mar 2025 00:36:14 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c0e34fasm14110350f8f.75.2025.03.10.00.36.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Mar 2025 00:36:14 -0700 (PDT)
Message-ID: <056eb3c0-ed76-4b38-9d23-1ffb738ff864@linaro.org>
Date: Mon, 10 Mar 2025 08:36:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] ASoC: dt-bindings: Add Everest ES8389 audio CODEC
To: Zhang Yi <zhangyi@everest-semi.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org, devicetree@vger.kernel.org
Cc: tiwai@suse.com, amadeuszx.slawinski@linux.intel.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
References: <20250307091916.100164-1-zhangyi@everest-semi.com>
 <20250307091916.100164-3-zhangyi@everest-semi.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250307091916.100164-3-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: DKOKIQM5NIA7JL2QKLTLXFP6RGCS7BXO
X-Message-ID-Hash: DKOKIQM5NIA7JL2QKLTLXFP6RGCS7BXO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DKOKIQM5NIA7JL2QKLTLXFP6RGCS7BXO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 07/03/2025 10:19, Zhang Yi wrote:
> Add device tree binding documentation for Everest ES8389 which
> is different from ES8388
> 
> Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


---

<form letter>
This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new versions
of patchset, under or above your Signed-off-by tag, unless patch changed
significantly (e.g. new properties added to the DT bindings). Tag is
"received", when provided in a message replied to you on the mailing
list. Tools like b4 can help here. However, there's no need to repost
patches *only* to add the tags. The upstream maintainer will do that for
tags received on the version they apply.

Full context and explanation:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
</form letter>

Best regards,
Krzysztof
