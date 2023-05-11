Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B106FF81E
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 19:09:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AAC1EBB;
	Thu, 11 May 2023 19:08:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AAC1EBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683824969;
	bh=F/sctiWuhV3XQyMFZL7BpVFoZt+lCF7EBL/nEpdp54k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Rh08R9OkZYVHY1EfnWPcZDvegtNcW/nTPN6P5EFlXV3Y6pNJLLVkQXBUM3wzG4tND
	 0qaAK9yi8HWZLuP0fMHs6SaRV5JsPfCiwWNvFvl1TUqqL5GkCCkgBZWK+hur7Wtk++
	 1n7+UR+mK/kMYbdaB199TBqynLG+q2aWFG3AdeNk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50987F8032D; Thu, 11 May 2023 19:08:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1813BF8032D;
	Thu, 11 May 2023 19:08:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27CB8F8052E; Thu, 11 May 2023 19:08:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF21AF802E8
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 19:08:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF21AF802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=J31xoz4E
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-965fc25f009so1327830666b.3
        for <alsa-devel@alsa-project.org>;
 Thu, 11 May 2023 10:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683824907; x=1686416907;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W7pSkCu4jw+MIqLM1X/GSl2Ww2yA7vaTQ5eDNYGJp+k=;
        b=J31xoz4Ek1HYwjey22pRfKmWA07NmmCjA8326SQ9D9ewwvDE0Wnx1uKLrJJgoEYrlg
         1GrCv7/iLST7Fra9rl2qVFB/g8kP3GZDQgvu75F8ZzsE3nqCHzO0RNKErHPGyrGtl4NK
         4lMQOMqWzy/aFu3LSOAMcNysSPXuJdZ2bzRPfqGy6yriUl0bJG+tT/HQBjZEj1+cT1Gw
         5ft0pvlLPcF4kcFAZw/Y+ZWgcJAUzwiAvTcltIH4/9zf8TjINCPYi6xqHnzWRKXp8TGj
         FgeIgg5l2Yuy48phBjILEWpgVdLliEjQXo0Praa632cAAVvHtebVjMkDHDANxT8DIURe
         A67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683824907; x=1686416907;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W7pSkCu4jw+MIqLM1X/GSl2Ww2yA7vaTQ5eDNYGJp+k=;
        b=NXpO6oyyRfTInoiCiRwO5B2NKW+EpTRlqBaIKjrxEeui1RekejN0uALOIchbRd779W
         Y8A7wP9DdcyJDNvhRM0BguZSL/5EOOYyVuBQbpbYD7h66K+zP5NcdVfBxkS5aO9YszDG
         SqXhOQZsSNHrhyWom8PTAGjZ4HEAIsu0POnQFbxPx7nwxHPymXqlqSb/6HxX4or5XV0f
         +0jsUVA2KBpCs2YwZGuBk1oHZz/uWr4TAi0TeRz/vNGbQwv1NYeY24LwBgAtZCsINzCe
         Hvs/lOqFYsPuQyp2dwh100Kj9o8Ke+pDAVb3F3Ez99Et2RAzl0j3T0RBkGfVXC1E2KF2
         8Rsg==
X-Gm-Message-State: AC+VfDypYIcXNhkzBRgkaXifeg2Bgk02T516nQ9s5meroTD7CkeqBAwt
	8RHWslfS9hLy9eXX1YaWpB3UEw==
X-Google-Smtp-Source: 
 ACHHUZ7Mq8DfwN2CS1Qv3Zb95a/ZqyQv3M1eXU6+CuA4vYkR4lU3I3lNaZpnt0FSbPkEAtWs090WiQ==
X-Received: by 2002:a17:907:6e03:b0:96a:440b:d5dc with SMTP id
 sd3-20020a1709076e0300b0096a440bd5dcmr5278769ejc.54.1683824906914;
        Thu, 11 May 2023 10:08:26 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d7cd:1be6:f89d:7218?
 ([2a02:810d:15c0:828:d7cd:1be6:f89d:7218])
        by smtp.gmail.com with ESMTPSA id
 f20-20020a17090660d400b00965ac8f8a3dsm4264298ejk.173.2023.05.11.10.08.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 10:08:26 -0700 (PDT)
Message-ID: <47ddf347-f6f9-742d-949a-c7a315dfdf24@linaro.org>
Date: Thu, 11 May 2023 19:08:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: Add adi,ssm3515 amp schema
Content-Language: en-US
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>,
 =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>
Cc: asahi@lists.linux.dev, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230511150546.8499-1-povik+lin@cutebit.org>
 <20230511150546.8499-2-povik+lin@cutebit.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230511150546.8499-2-povik+lin@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TZ3Z2CHKUPHFXZ665TTPXPCNBCAG4PU5
X-Message-ID-Hash: TZ3Z2CHKUPHFXZ665TTPXPCNBCAG4PU5
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TZ3Z2CHKUPHFXZ665TTPXPCNBCAG4PU5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11/05/2023 17:05, Martin Povišer wrote:
> Add a DT schema for the SSM3515 amp by Analog Devices. It's a simple
> mono amplifier with digital input.
> 
> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

