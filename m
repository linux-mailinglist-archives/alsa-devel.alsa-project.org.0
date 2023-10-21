Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1EA7D1EAF
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Oct 2023 19:41:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92708836;
	Sat, 21 Oct 2023 19:40:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92708836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697910108;
	bh=/QNJeb33Xc8Y9waK5di1r31T74ZOL192Cjds9a3I0EI=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=RPqXLMOu6V8a2rHdWhefC2Z4Ur0AJQn64dXL48xo2YCTFpovrsMGqz32Twl69V24W
	 KGXiwT7NGBzbMVZHyJg1y6gOv2fdaV8jL/LNhuihj9tQV3Y4muepZRsHyt1ZyA0oZe
	 kfs9br3F/+yXdmD6/j/GtGZKtiqRXt6GSjcbUq8Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17C1AF8025F; Sat, 21 Oct 2023 19:40:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DF23F8024E;
	Sat, 21 Oct 2023 19:40:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 440D2F8025F; Sat, 21 Oct 2023 19:40:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B700AF80166
	for <alsa-devel@alsa-project.org>; Sat, 21 Oct 2023 19:40:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B700AF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=QKLvnQmQ
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3296b49c546so1259056f8f.3
        for <alsa-devel@alsa-project.org>;
 Sat, 21 Oct 2023 10:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697910044; x=1698514844;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YzRhsF4sW4AvdfvU56Au9DAitO9ZxYOt0TU6tMD+FLI=;
        b=QKLvnQmQqZv0jBowzhG51oAqasxMU4gRjsidW52iA4LFbKALYAs+OLwBB6bgXQX8Uh
         aNWrbuBI1qt6PrIS+e9oW5mFyTgWgTBdZToapaESJBKytt04uehXQswiHQO3/r9vkmWV
         0ESvpx1y0wtv7wczk8oe/Exd9B1aDvwuuWel4qb2yPFwEcyj24ovkCC/ono87B+4ZRNj
         sdEuMbwEkhEzEQYd/tJgQjaY1J2dieS9V7pFHv+a6J3gIfy+Lu/uCxmsY06jx71+qMuj
         TE1Oj7Y7lREyQB8dVHFrth3Go1R1oB9BZ3m1sfO+5juzxAT9DAXnffGJ1l796OanVnjn
         QyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697910044; x=1698514844;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YzRhsF4sW4AvdfvU56Au9DAitO9ZxYOt0TU6tMD+FLI=;
        b=JVF5ZfUvMN/hVDw6s1LrZBKjKBtW4+MVI31MGU01wI88DPNmCe+O74YDMz4vcmmLYm
         8pe9GGw5K6jHrW9D5gPoklO/lZdyjUpnRRxscdN43rrrccYLqnNJUJcNRaKKHKF2I4PM
         ndKZ7PUb8OWq/18XRepHWFu1PoI8FeCzIri++21EbPCTXpIB2zGuXa/dzRJsTsKF3xVO
         rcBkwwRAnQgGXaJjW6xHemN0+l/FZOmpanJypCGhpqjuq8VPmSqe4gyYZK4c+Q/ycb9G
         /afh1Ghpy5uXmGIVJQuSVWxjgvzd3SLqSyUuIACb2Gcm05KyXgYvU573kTPc9UUp+xdR
         MFRg==
X-Gm-Message-State: AOJu0YyhWOw/qjARHTDEyRtVW2vX9Fm6SmL2xtHiD7FiNccQz+eBZJbF
	aRjmDB5KZD7UBqHrxwvqB8WGoA==
X-Google-Smtp-Source: 
 AGHT+IGsCYeZnIKvQGD3fY3impqW8jzIRcM8ZcHOmFTUtDFPwTnoIpLIdfYpmP/bSacq+jJkahvJgg==
X-Received: by 2002:a05:6000:704:b0:32d:984e:97b2 with SMTP id
 bs4-20020a056000070400b0032d984e97b2mr4615806wrb.46.1697910044508;
        Sat, 21 Oct 2023 10:40:44 -0700 (PDT)
Received: from [10.66.66.3] (9.ip-51-91-159.eu. [51.91.159.9])
        by smtp.gmail.com with ESMTPSA id
 i1-20020a05600011c100b0032dcb08bf94sm4089435wrx.60.2023.10.21.10.40.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Oct 2023 10:40:44 -0700 (PDT)
Message-ID: <20f48d75-da68-4ba5-aaeb-d9ee12df7e15@linaro.org>
Date: Sat, 21 Oct 2023 19:40:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: qcom: Add support for WSA2 LPASS
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231019153541.49753-1-krzysztof.kozlowski@linaro.org>
 <20231019153541.49753-2-krzysztof.kozlowski@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231019153541.49753-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 7IBYKENUMZYBNQB66KCNFLKYJKOJISPP
X-Message-ID-Hash: 7IBYKENUMZYBNQB66KCNFLKYJKOJISPP
X-MailFrom: konrad.dybcio@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7IBYKENUMZYBNQB66KCNFLKYJKOJISPP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/19/23 17:35, Krzysztof Kozlowski wrote:
> Add support for Qualcomm WSA2 LPASS (Low Power Audio SubSystem) audio
> ports to several Qualcomm ADSP drivers: Q6APM LPASS DAIs, Q6DSP LPASS
> ports and shared Q6DSP Soundwire code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Wouldn't

sound/soc/qcom/qdsp6/q6afe.c
sound/soc/qcom/qdsp6/q6routing.c
sound/soc/qcom/qdsp6/q6afe-dai.c

also require updates?

Konrad
