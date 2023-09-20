Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A388F7A7A71
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Sep 2023 13:29:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06848823;
	Wed, 20 Sep 2023 13:28:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06848823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695209356;
	bh=4EFPJZtqxIwSVxCQmczIePvRJo4iVjfLMyy4JQ6HdLk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P/DneSGV6tPYmTOLzEERuUFO+eQ4Wl2y3t83+smGq3QWsP/igJp0klt5KXjfDLZj0
	 Mxx1QAvJtKGPiFCgzvZ+59dKhFGVDzAkWI5GQ5Zp8Z/5VOKTcrTLL4/qEX23E7i9HG
	 HZJzJO8b5HcSv/tWlzn27hHW1SZYQlMrwZGNVwsU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C813F80494; Wed, 20 Sep 2023 13:28:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B3B6F801F5;
	Wed, 20 Sep 2023 13:28:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1602F8025A; Wed, 20 Sep 2023 13:28:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28746F80125
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 13:28:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28746F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gQ7J1kw4
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9adc75f6f09so743198266b.0
        for <alsa-devel@alsa-project.org>;
 Wed, 20 Sep 2023 04:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695209286; x=1695814086;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GACDrnV+AI9jqnTx+ewaqjW9iyUrnWty7M6DlDib3xY=;
        b=gQ7J1kw4F2Lp75Bi9vEdGcNA6352C6yQUhqn0+t4AXH1bJ5SUQKtAMSEwloD9CAg50
         jd/N3IPVnQvfIlEQ8mOAPwmwjtw/8PZKCDcnPSnfCz9sqSKk8h0GGZqkBtINyuPvXYI3
         hh4qXk9KAJOpYkhpuOF2l9YdUwFGuoVbADbDt/8XmBH/PRROCunwN2ukz1+tPs31fwSr
         sLQ0PTaGl6pPbJZRZIjRb9RHfFl8Oa2x8HUzFa3lUt2xRDvyRc1d2v2gnJ0sjLw+eUJ2
         rwwejsBiEn9pbfGlA+oMHMjBUrV2W0HG0ZS0nClzzgOGNucbZxB9nelpHxxvQF7rQfpH
         YWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695209286; x=1695814086;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GACDrnV+AI9jqnTx+ewaqjW9iyUrnWty7M6DlDib3xY=;
        b=hM/Zm9Y0n+GJ9kVsswPgnyFA5tFM4x1IRWAhnKbtntqiwfD6aRbJr44W6Ug6USNQe2
         UHh6lrW7OZ/J9oypI+jJmH7lT6kX0n6IVFf98VeoSWUj6S8A0mjtCog6NcwIi8ntK/hF
         Ddn4d6CknAnpLV4FFEZYtGQOjzYtYEUUiUjpx+XBcoBu3RkVBs0IZV3L2zaZYS+HezWu
         qa2fdUVRHA89xfFgus8cHbFrx5nIGY+JXBP40FhXM09PmaKYjd5V5RMIRAUk58SAPoMY
         0JuzaFAj66Ch1iBa1AmtrF4elhkT4O1iT6x+E5zd0Ty7ER7cl158QT0Wz40HfWXmCPaV
         eBXQ==
X-Gm-Message-State: AOJu0Yz8cFsAVJ7AwiJZMytwYg60sIhyaDopTENqGckJ044/l1g0vc6A
	YXhQfxwR5ZnTLKes0LYmWlGtoA==
X-Google-Smtp-Source: 
 AGHT+IGPfIQWQ+EueBRU+uoEQXPLQOfh1V2CdlSsyL7H9gVvMK0VwLBKxAMb/iW36KEiRSVWP/qlAA==
X-Received: by 2002:a17:906:311b:b0:9a2:143e:a062 with SMTP id
 27-20020a170906311b00b009a2143ea062mr1843177ejx.49.1695209286403;
        Wed, 20 Sep 2023 04:28:06 -0700 (PDT)
Received: from [172.20.24.238] (static-212-193-78-212.thenetworkfactory.nl.
 [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id
 wy2-20020a170906fe0200b009adcb6c0f0esm7835502ejb.193.2023.09.20.04.28.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 04:28:05 -0700 (PDT)
Message-ID: <9d612171-8ae4-de65-31b0-fbb5f1f8331e@linaro.org>
Date: Wed, 20 Sep 2023 13:28:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] ASoC: dt-bindings: tfa9879: Convert to dtschema
To: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>,
 lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230919090739.2448-1-bragathemanick0908@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230919090739.2448-1-bragathemanick0908@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: N4FIE4ZR6IMH72HD4L3VKTKJQHBTDHKV
X-Message-ID-Hash: N4FIE4ZR6IMH72HD4L3VKTKJQHBTDHKV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N4FIE4ZR6IMH72HD4L3VKTKJQHBTDHKV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 19/09/2023 11:07, Bragatheswaran Manickavel wrote:
> Convert the tfa9879 audio CODEC bindings to DT schema
> 

> +required:
> +  - compatible
> +  - reg
> +  - '#sound-dai-cells'
> +
> +additionalProperties: false

Instead:
unevaluatedProperties: false

> +
> +examples:
> +  - |
> +    i2c1 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       amp: amp@6c {

amplifier@6c

> +          compatible: "nxp,tfa9879";
> +          reg: <0x6c>;
> +          "#sound-dai-cells": <0>;
> +          pinctrl-names: "default";
> +          pinctrl-0: <&pinctrl_i2c1>;

That's not a DT syntax.

Best regards,
Krzysztof

