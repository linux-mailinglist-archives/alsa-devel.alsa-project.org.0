Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D376CFC1E
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Mar 2023 09:00:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3437C1EF;
	Thu, 30 Mar 2023 08:59:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3437C1EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680159619;
	bh=4OnbIIl8DyAc4EleZHWJsrLGUC/cymBMkeTHOyVy9fg=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C+UPr7ldi/2s/92xey9Oypo3ZNs9QZ29/KSZyDZqLvqmLVH+vQG5+l2SO1Zb6f5Fb
	 dwD5mruoWf0PMvVsldfKJvJ9/SaQU94Ok/UJt0MeTF+eVVNEhC4gWZDl7Jzss09JeK
	 LrFGForX9BlEw8yewbtX6rxTIoWU03yObe+ApM08=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84739F8024E;
	Thu, 30 Mar 2023 08:59:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9784F80272; Thu, 30 Mar 2023 08:59:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DDD89F8021D
	for <alsa-devel@alsa-project.org>; Thu, 30 Mar 2023 08:59:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDD89F8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=kBhe+XYF
Received: by mail-lj1-x22d.google.com with SMTP id bx10so247794ljb.8
        for <alsa-devel@alsa-project.org>;
 Wed, 29 Mar 2023 23:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680159554;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DpkyCgvj4WryLDUxuD+mVvNVV1z1ICnLVaYscONhSWI=;
        b=kBhe+XYF6lQ6UpQYErty3sNRIodLnvM+8CvBtSwIQUAs5pkvL7ASV7yPppeJ3GCEqB
         8EugfSd9EgGB41P8zO/BUazCufcku8KpkSFzYvfzsygLOoLs3UfUFwNYpCfmqn2/QuAt
         sKjJIC1qu8GhDdxGHgomUQdHBvSil7rWAWwkRUU25GodxC1bZnZT7Wd4RsxyFwUduI38
         qamzW4vRVU3a6652VYjKWY6wSxUQ3ljWDAh69vcUq33Crc/RGD5zRcaNWadE8Gmrkh/L
         xyhQAPtUjHMEaBaNLZ3gvejwPA+09gVhLK791Sh3W9uZumXLQdd5ZgeiPSJeVfYf8cSq
         fSuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680159554;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DpkyCgvj4WryLDUxuD+mVvNVV1z1ICnLVaYscONhSWI=;
        b=L/R7i6NclNmfyYhLOTohb3z0oe9Ev+c7T+0j9tS+mJjGrRIyTzHK9FRwbERhNrFvJ+
         nX+fH1wXdmS+2KDYB+ePJ1ZV4ePW4CQUEvz5aULIdoXmeZ/StDx/KoF2uLrqrAHIzIXz
         kB6yIP1Dg7+m7zNZINxwiUzkb9g/SkMAKCgtTMuNmCB/TJYgo2hhx4ZoGAsbhwFJSbPh
         +H8VSmv52ZztPl9bco2oXDBoKTdg1az90TQl1HkZn7XlE9d2qUnmnBdaf7U9aurEnuBd
         Zxb60xHy2c5n/DLcOxOkMUseqAr9wm1lEZIJmFbvKYGqg3oD1+eU/YLvrMVmzlf9KdvP
         itCw==
X-Gm-Message-State: AAQBX9eEfAOLQfJvKTQUZkfbofJfwdk/eDN/iEsbcciePPIebJ22c7gY
	Qxzkijm2KSih04RhoS77IClUgw==
X-Google-Smtp-Source: 
 AKy350aUPwktkt+XR5pPPg5JY4SayHpX8STy4rc7Xv9y8lUqG2IKYfYEJjZu05zEfyutuNS6yKfvfw==
X-Received: by 2002:a2e:9ece:0:b0:298:b362:6258 with SMTP id
 h14-20020a2e9ece000000b00298b3626258mr5972086ljk.52.1680159554253;
        Wed, 29 Mar 2023 23:59:14 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id
 w3-20020a2e9bc3000000b00298c7f21105sm5622272ljj.66.2023.03.29.23.59.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 23:59:13 -0700 (PDT)
Message-ID: <3bb3f40f-39da-2fe6-f5ca-2848a9e5c49b@linaro.org>
Date: Thu, 30 Mar 2023 08:59:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 07/10] ASoC: dt-bindings: qcom,lpass-va-macro: Add
 missing NPL clock
To: Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230327132254.147975-1-krzysztof.kozlowski@linaro.org>
 <20230327132254.147975-8-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230327132254.147975-8-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: YG7EMAISNPY6SQNEU2II4OE2E5PUYTO7
X-Message-ID-Hash: YG7EMAISNPY6SQNEU2II4OE2E5PUYTO7
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Patrick Lai <quic_plai@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YG7EMAISNPY6SQNEU2II4OE2E5PUYTO7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 27/03/2023 15:22, Krzysztof Kozlowski wrote:
> Several devices (e.g. SC8280XP and SM8450) expect a NPL (Near Pad Logic)
> clock.  Add the clock and customize allowed clocks per each variant.
> The clocks are also required by ADSP in all variants.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes since v1:
> 1. New patch.
> ---
>  .../bindings/sound/qcom,lpass-va-macro.yaml   | 68 ++++++++++++++++---

Mark,

It seems you applied v2, not v3, so this patch is missing and the
binding needs fixes.

I will send a new version of this.


Best regards,
Krzysztof

