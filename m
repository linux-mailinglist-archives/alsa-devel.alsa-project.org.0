Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A51694027
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 09:58:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 429EA84D;
	Mon, 13 Feb 2023 09:57:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 429EA84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676278688;
	bh=T2R7kSv7WjXW3FkwYHWo3kRlzS45cHF1Q1UYVQF2BP0=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XHJ7aXw6lpHJnn1Cz5iqZ5Zc9c1iU89+GuwauqmcxlnGs3OqtfXUZWBOwPyClSggV
	 GxVM+VJNd1YvCAMk4l97yPwaOeqIAlYu6lzYsoPT0Xog/fcyg4vu2R0ipgBjcuFmJx
	 onKEqB+pi9fv4ktih64z2A4EmfGbHVWkifnw0PVk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05E8CF8053B;
	Mon, 13 Feb 2023 09:57:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF3D3F80534; Mon, 13 Feb 2023 09:56:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8DD12F80534
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 09:56:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DD12F80534
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=W6xS61Tn
Received: by mail-wr1-x429.google.com with SMTP id bu23so11303720wrb.8
        for <alsa-devel@alsa-project.org>;
 Mon, 13 Feb 2023 00:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=91pijroZNB/VAuYuBdkL83jBs6ATeu5eEm+X0sOGp9M=;
        b=W6xS61TnoeJGnjLk25v6iQ9GoYY/1TPaxo/EC4llWIM5WTfBmCURZP+CBxEOqPiX72
         PRRAJNhuziiPHCc1UXg88avxJRp+cdkcLVdUoq2IwevZneOAURGxJvZ769mZFuPUOFWv
         ucQwvB/DvhAuyPtrv/CVTRwxVAb4FpzY2QSzz1W/Uoiw3J6weglqNdI0TlB0ariBA7mc
         d+M6LM0gQqhtVmsJg3PJYQkyDXqJ5+WqiLXQlIWLwIcf0UUtTT2V1gWy8pfN/5nEsxTb
         1Kdx9OWApSgMGvZwJ5RXvqX+sEDci7SN/xtF0MQ3QZ3p6ZdbEHWVed3423rPzBrhqY71
         1zYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=91pijroZNB/VAuYuBdkL83jBs6ATeu5eEm+X0sOGp9M=;
        b=1WDDgS+rbWjcWJvRYYmuxS4n2ovg+L2YHtW+ADCiiK+ksi1+8qa71PwLi+/nTUOs26
         /LUolb8IMYTgXc7OU/5pnfSa+GsdhHKJZUmXt67SOCrRWtSoVbupbZjFIN77MXTrLW25
         gK4gGPtnR/lciG2uYoj1mKtQdgxlIDTVQ8GkM/gZExEZLC7KUZzNGnzF6/W1XJheVLbY
         ZcgmtAK8Eflqfa4uBWHtOJ/PlC+zYMHuVYlkq4uzLMu2BTimKMt+r4+0MkTkHZeYJzzO
         PC3ntKcEJuspq9sh3aYx6JteWcC5RqlhKlqWbkBx617AJQobKBa/up7bTIoW2NH0LH/Y
         0Wew==
X-Gm-Message-State: AO0yUKVcQZg4vF+AoqrvMTCBzfH5QLUb+Q74RQEjW+eQ9W/HKSU83JFF
	9NHzsYR83dC/LLDExGFYSHA1rw==
X-Google-Smtp-Source: 
 AK7set+qLbVTXujo9IfjU+iB1mHwDSM0DVrZR6Tn5fCcgLF4u22+Cz/XYAB3L8IVVqyVgdmugHgrAg==
X-Received: by 2002:adf:fa86:0:b0:2c5:48bd:2a27 with SMTP id
 h6-20020adffa86000000b002c548bd2a27mr6497113wrr.34.1676278614755;
        Mon, 13 Feb 2023 00:56:54 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 e14-20020adfe7ce000000b002c54f367fe4sm5300613wrn.100.2023.02.13.00.56.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 00:56:54 -0800 (PST)
Message-ID: <c66f6ae5-97b4-d2c9-92e2-2315ac222b60@linaro.org>
Date: Mon, 13 Feb 2023 09:56:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: renesas,rsnd.yaml: drop
 "dmas/dma-names" from "rcar_sound,ssi"
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87ttzq8ga4.wl-kuninori.morimoto.gx@renesas.com>
 <87r0uu8g8x.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdU2_5SO53qs1KVcv7p5O1QP-DWpxVpUhmpFT3MQFKVO5A@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: 
 <CAMuHMdU2_5SO53qs1KVcv7p5O1QP-DWpxVpUhmpFT3MQFKVO5A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GJON2SX22CSCB7LWBSDFUGZFONMS7GUA
X-Message-ID-Hash: GJON2SX22CSCB7LWBSDFUGZFONMS7GUA
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
 Linux-DT <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GJON2SX22CSCB7LWBSDFUGZFONMS7GUA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 13/02/2023 09:56, Geert Uytterhoeven wrote:
> Hi Morimoto-san,
> 
> Thanks for your patch!
> 
> On Mon, Feb 13, 2023 at 3:13 AM Kuninori Morimoto
> <kuninori.morimoto.gx@renesas.com> wrote:
>> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>
>> SSI is supporting both "PIO mode" and "DMA mode", thus "dmas/dma-names"
>> are not mandatory property. Drop these from rcar_sound,ssi's required:.
> 
> BTW, do SSIU and DVC support PIO mode?
> 
>> This is prepare for Gen4 support. See more details on Link
> 
> "This is preparation" or "This prepares"?

Use imperative.
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

Best regards,
Krzysztof

