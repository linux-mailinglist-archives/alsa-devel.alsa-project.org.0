Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8B36C592F
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 22:59:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A53BE9E;
	Wed, 22 Mar 2023 22:58:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A53BE9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679522378;
	bh=eYKYpJEUsrInWGmTAJwOO/mPlQW6iga+u0UQPd886Aw=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tlCHdN55ixq3KKfK5TB3QNeEarmp6tUJsMlmuLWEqeZXoOT80aaKyMrExRVazwYlS
	 nSqSy9k0ASv+Fa+lBbBgeop+Ln7deJ5SEFiPkxAY7+1S8polpMmFBKLQ1azASYHr+f
	 FK6BLea0Sje2GXiM1HGZLp/msBHZ1VnojsC13ytw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EC53F80254;
	Wed, 22 Mar 2023 22:58:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 842AAF8027B; Wed, 22 Mar 2023 22:58:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6651BF8024E
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 22:58:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6651BF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=NdzjacQV
Received: by mail-ed1-x534.google.com with SMTP id ek18so78867020edb.6
        for <alsa-devel@alsa-project.org>;
 Wed, 22 Mar 2023 14:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679522311;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9PZ8LbgL1GCJ0WhsAnJBQpBWwgIIWREQb1ysFBtLIlU=;
        b=NdzjacQVjFpDskaHW+X0rKQ4vy5A/Puc1twYGKSURN1B2J1KXe9htTqg1n+Qp30ZuN
         ovVmb+K02bM3JmPQGUY8jhSfhQTv0+MEQ4Q+HoZWij79QEgzGXaRgajZR8HVphqVid0k
         1rosoaOwraP4Ewa1O6HZ04aj7kE9WFr4n2aq6K3gDX28h1m4LuJet7s5q6ydHpSf2KMl
         pZK/tlj9fObsgQUQyJm4IvtHcnepzb1Vn0bFkjBcTrlG0lFnkJK0cV7EsH5omIY6arz+
         jXToux6DQHVe4w+i4iWNIiPXbrS7XPAzBmJpa7Mz/Wl5/lWAb5Ya7ClWSBerkZ2Ggru/
         JpsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679522311;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9PZ8LbgL1GCJ0WhsAnJBQpBWwgIIWREQb1ysFBtLIlU=;
        b=LVJfLzy4IDX8lj8dA4s2rpF5aXK0XortQ9W7KUvx4uEVOT6rtb6PZXFxPCVBZebw1u
         Ks0LqkWjhhuDJ/ECYs9k38r2DiFfUzdcC9UeuwZIH6KYojHkYZeXFoTPOYvvO9dbHWxp
         ft24cUoX/D5FJqCQxMNsgI4kiVUfsbzm777T9oQa29g0o6AvuBSGI7D6kH0540H5HBJo
         2fFHcGf9M+AYq6QLrKE2+ePAPTs308+0KKY1SYCNaJVPJGqB7I/WSnlCI8H7swlhdELM
         wZC7EIdpV9WL1Y30v+yg4BM3zh1XiWkJecJ+H9tPEcoDODBIrcHDUEtmA1tSQPzKd6+P
         4F7g==
X-Gm-Message-State: AO0yUKXaeqmAT0ELojqEkYMUeKGayF8ild3FntWkWGPRpOLigPc7Zafp
	5Pn09sEXRwIM+sa8FgXuQzAkCQ==
X-Google-Smtp-Source: 
 AK7set+RseUwiWB+MKVgsLyR6FutTCCqGtCKJU4uhZNWiOPF68JkPidPhc5yI9YDTudaQPR1yB0JrA==
X-Received: by 2002:a17:906:23e9:b0:926:9c33:ea4 with SMTP id
 j9-20020a17090623e900b009269c330ea4mr7317722ejg.27.1679522310723;
        Wed, 22 Mar 2023 14:58:30 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:626d:5729:6e71:4c22?
 ([2a02:810d:15c0:828:626d:5729:6e71:4c22])
        by smtp.gmail.com with ESMTPSA id
 g26-20020a1709064e5a00b00930525d89e2sm7690989ejw.89.2023.03.22.14.58.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 14:58:30 -0700 (PDT)
Message-ID: <2aa37662-c111-0388-9002-387b9340f1a2@linaro.org>
Date: Wed, 22 Mar 2023 22:58:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 1/6] dt-bindings: mfd: Add the Lantiq PEF2256 E1/T1/J1
 framer
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20230322134654.219957-1-herve.codina@bootlin.com>
 <20230322134654.219957-2-herve.codina@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230322134654.219957-2-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3UHXNODHPHMQ7ZFHNDU6XNZSXY6INOYY
X-Message-ID-Hash: 3UHXNODHPHMQ7ZFHNDU6XNZSXY6INOYY
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3UHXNODHPHMQ7ZFHNDU6XNZSXY6INOYY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 22/03/2023 14:46, Herve Codina wrote:
> The Lantiq PEF2256 is a framer and line interface component designed to
> fulfill all required interfacing between an analog E1/T1/J1 line and the
> digital PCM system highway/H.100 bus.
> 


> +  lantiq,channel-phase:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 3, 4, 5, 6, 7]
> +    default: 0
> +    description:
> +      The pef2256 delivers a full frame (32 8bit time-slots in E1 and 24 8bit
> +      time-slots 8 8bit signaling in E1/J1) every 125us. This lead to a data
> +      rate of 2048000 bit/s. When lantiq,data-rate-bps is more than 2048000
> +      bit/s, the data (all 32 8bit) present in the frame are interleave with
> +      unused time-slots. The lantiq,channel-phase property allows to set the
> +      correct alignment of the interleave mechanism.
> +      For instance, suppose lantiq,data-rate-bps = 8192000 (ie 4*2048000), and
> +      lantiq,channel-phase = 2, the interleave schema with unused time-slots
> +      (nu) and used time-slots (XX) for TSi is
> +        nu nu XX nu nu nu XX nu nu nu XX nu
> +        <-- TSi --> <- TSi+1 -> <- TSi+2 ->
> +      With lantiq,data-rate-bps = 8192000, and lantiq,channel-phase = 1, the
> +      interleave schema is
> +        nu XX nu nu nu XX nu nu nu XX nu nu
> +        <-- TSi --> <- TSi+1 -> <- TSi+2 ->
> +      With lantiq,data-rate-bps = 4096000 (ie 2*2048000), and
> +      lantiq,channel-phase = 1, the interleave schema is
> +        nu    XX    nu    XX    nu    XX
> +        <-- TSi --> <- TSi+1 -> <- TSi+2 ->
> +
> +  lantiq,subordinate:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      If present, the pef2256 works in subordinate mode. In this mode it
> +      synchronizes on line interface clock signals. Otherwise, it synchronizes
> +      on internal clocks.
> +
> +patternProperties:
> +  '^codec([0-9]|[1-2][0-9]|3[0-1])?$':
> +    $ref: /schemas/sound/lantiq,pef2256-codec.yaml

Does not look bisectable. I also could not find in commit msg or in
cover letter description of patch merging requirements.
> +
> +allOf:

allOf goes usually after required, just like in example-schema.
Best regards,
Krzysztof

