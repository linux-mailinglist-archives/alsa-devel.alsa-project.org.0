Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CAB723C33
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 10:51:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BD74825;
	Tue,  6 Jun 2023 10:50:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BD74825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686041489;
	bh=Jivq0x80zvLY8UQ6VpkKb9KqOR4Sf8io2F36cgd+RhU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dw3aI0YCBydk0xgLj2u2S6SS5QPbk8UT2aDdnKN9K/64guU0mzl4joyJP1l3ZO4jY
	 F1+dGx5GT7ynxaQtmlCrYpssfpdDI05ucuz52j2559oBqzQc8u0gXkaPG8PS62CEhG
	 qUwCedL8SbchT8H88YHOOmM8HvQqIScadHZAdcXE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D4EDF804DA; Tue,  6 Jun 2023 10:50:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64076F8016C;
	Tue,  6 Jun 2023 10:50:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A7F6F80199; Tue,  6 Jun 2023 10:50:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7687DF800ED
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 10:50:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7687DF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=aLvKZIU5
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5147dce372eso8475876a12.0
        for <alsa-devel@alsa-project.org>;
 Tue, 06 Jun 2023 01:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686041401; x=1688633401;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cNZJwJJab4riyWzRmpxdXxKEkTNWOTzLRUWxg/pAFSY=;
        b=aLvKZIU5TqSFa1zhPezixfLlsmrQkKNGC3lTXwz0C+RZ9Q6Rbrmo2jh3tl0NWqtZcY
         JrNnUQxZB/UK4mlOdh2zu/rM69SiIfIVyjDw8DyG+pFj3VeFj1WGOcf9fl7eRrZydTpI
         32pZDDkxVaCV8Pd1koFk4yslxsRxCGPc6iXuYBqApBYIrLwsleXXJZ+8Vv+jpnGjDfOm
         QAo+46p3+ZYCcfZFm2lDSFwv9eRXZnc0N4vuMV2/FQEBb6d8StIRC9gvZxKXl+Tqt8X/
         UnK0CuOfgrhthyys29o6eyBeKD1ogvwgmNaF7MArj3kR9m8S9l6RYMiuODX6/vApswT3
         iJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686041401; x=1688633401;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cNZJwJJab4riyWzRmpxdXxKEkTNWOTzLRUWxg/pAFSY=;
        b=XbSR5pAvbMTFH43EFA4JXkJpHqUlrJcGWpe3tHe3GgBHZ5hmesuv9LsqADsdKaCH+P
         wyg8ZPnF+lClc40LW3JSu5C6AOtnsWR5n1w+83vbgGx0aDZTdVekH6ZU7ESaVLF4MO/t
         oicLY8qfX5ruOpGrPq8gwALv+6fGMk6rqXyEwy6l4eMVXqxuvK6u2Cgf0wAUMNEoWx5x
         9iIAIsDD1P58uaTtFg6vroJOwfNOeO4BsHW78sylnL0gfJD/4KYgPfCcMfuyCLckvtfy
         ADyZRaq+TiV8I1lzpMifsMLWQfeA0YaVF/JcoZM99iaZczHmWY3Sf3B6a3QkqfSdAnMz
         LaAA==
X-Gm-Message-State: AC+VfDwzcfUn3girWp4pUPd1OXdz10/T98Bif2cmg+3dvnqBqWe+uFdW
	2d/3KK4fVJJ43KProADFdTQkBQ==
X-Google-Smtp-Source: 
 ACHHUZ5qfbjnN0Azzp06pyc+xpWkkoFfHsGFQYdoABfaisKDIJy8fV7JRYu+LYE590p8hBCyRIDnkg==
X-Received: by 2002:a05:6402:897:b0:50d:89c9:6387 with SMTP id
 e23-20020a056402089700b0050d89c96387mr1610786edy.27.1686041401433;
        Tue, 06 Jun 2023 01:50:01 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 b11-20020a05640202cb00b005147f604965sm4840471edx.24.2023.06.06.01.49.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 01:50:00 -0700 (PDT)
Message-ID: <66a83118-4f16-a636-4372-95df2570f339@linaro.org>
Date: Tue, 6 Jun 2023 10:49:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 2/6] dt-bindings: mfd: cirrus,cs42l43: Add initial DT
 binding
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org,
 lee@kernel.org, krzysztof.kozlowski+dt@linaro.org, linus.walleij@linaro.org,
 vkoul@kernel.org
Cc: robh+dt@kernel.org, conor+dt@kernel.org, lgirdwood@gmail.com,
 yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230605125504.2570158-1-ckeepax@opensource.cirrus.com>
 <20230605125504.2570158-3-ckeepax@opensource.cirrus.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230605125504.2570158-3-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FRR7VFESDOLQPPK4CRJQW36WDX6BFS4L
X-Message-ID-Hash: FRR7VFESDOLQPPK4CRJQW36WDX6BFS4L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FRR7VFESDOLQPPK4CRJQW36WDX6BFS4L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 05/06/2023 14:55, Charles Keepax wrote:
> The CS42L43 is an audio CODEC with integrated MIPI SoundWire interface
> (Version 1.2.1 compliant), I2C, SPI, and I2S/TDM interfaces designed
> for portable applications. It provides a high dynamic range, stereo
> DAC for headphone output, two integrated Class D amplifiers for
> loudspeakers, and two ADCs for wired headset microphone input or
> stereo line input. PDM inputs are provided for digital microphones.
> 
> Add a YAML DT binding document for this device.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

