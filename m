Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3006D694035
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 09:59:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2389D207;
	Mon, 13 Feb 2023 09:58:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2389D207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676278756;
	bh=gktk7ZlOfmQ9DSxWWWJflIgqehV1Qz8FAmUGHmg+tfQ=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oB+KF4G7z17Bh1LuT3IfSl4BeEWObf6wi8pB//W+gk6CxxVJzzZ21btuUI9UvOReV
	 9RdAJhO2juh3qd9VKaIr5hMFAdtgTN74G6GSQP4c3XtSKPQJTmAqVKm7iqezNoTiSj
	 scr5auurJHAjBSQ178O7n6wkaVJ6J2zHBNRdEM/4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D221CF804B0;
	Mon, 13 Feb 2023 09:58:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B03B6F804B4; Mon, 13 Feb 2023 09:58:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 210C4F80038
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 09:58:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 210C4F80038
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=rKsAboXe
Received: by mail-wm1-x32c.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso8400183wms.4
        for <alsa-devel@alsa-project.org>;
 Mon, 13 Feb 2023 00:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UsMwUA5XnKRQLMk0OCpshW2axzHGnZMVnVl7BchYx+I=;
        b=rKsAboXejWjEwvLVTuROuJ1PXH8eWDvQI/SBGvODuYbaMGTCWPhIfOP7q+1q2RInDC
         bgDf5sIUhSWSQgyyArNmGATzdPJ+yRL2lDMYEIPA0Id0csb8D/qrpbnwyhZWuG1juS3e
         UXcwEI9nu0b6Rti7hDiPzBvWDlKZ7yT5RdaM/FMtfaT5Yl3cyrps4yO5uhOnJH7daEGR
         2z1RrRegK0L/fhARhAUf2m40NGgnnCieWtNt+N6c40WNocDRiUSFwKKWWpT5MlXrFgcC
         RtZ33nPlzsKDU4rwROcayBcU0471iV0OVlH7bHikFFrQauV4y7yYcfaFHdK5KCX7RPdZ
         UGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UsMwUA5XnKRQLMk0OCpshW2axzHGnZMVnVl7BchYx+I=;
        b=3Hr+9JYYtCq0pCq4vvaFQ4QGeyndF+kYBF8r1u47Ez7Xjfv2Y69Ae2DNJMkhTJ8rwl
         ssQw5+HZ7VAVRaSAqPT3Jxic1W2PuqDVtxi32rg312KVdyw84f815rasayqBt83Vwhac
         jZ8Unb7xo+5tQ5FlwGvSX468c8Rxs1kX/LCZpBEToZW65b1eF0ijaw/OtKK44FGy0w3h
         AMBJxS7mRQ07sLBQELR7xdxqao4SAz24g/OoorynekVoTgIDXsOnDoYdPZiJph4YpZGL
         pzD9iQu/CcfUp1l98ulvEetSkNV3DI9Xmg67CDHZW9cR+G8ZpIh2u9woN47TZee6Ilys
         PVvQ==
X-Gm-Message-State: AO0yUKVRJA/N9FQ7FKVX2PVq3RACcgfXJb0jJgjGrL4+Q4VFhsaIshAn
	VwMG4WZf8+g0iquS8RW6/v/zsg==
X-Google-Smtp-Source: 
 AK7set/FI/5JSteMKqsnuPT09pARg+WQkrmY2yiKuwHszfD+KKjmZt8RyYaTLyMVaWuU8LRhSpg6SA==
X-Received: by 2002:a05:600c:4a8a:b0:3dc:40a0:3853 with SMTP id
 b10-20020a05600c4a8a00b003dc40a03853mr3893945wmp.11.1676278697443;
        Mon, 13 Feb 2023 00:58:17 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 f5-20020adff445000000b002c53f5b13f9sm9646221wrp.0.2023.02.13.00.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 00:58:17 -0800 (PST)
Message-ID: <9aa09940-91cf-32ba-34f4-a57c9e9965bc@linaro.org>
Date: Mon, 13 Feb 2023 09:58:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 2/2] ASoC: dt-bindings: renesas,rsnd.yaml: add R-Car
 Gen4 support
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>
References: <87ttzq8ga4.wl-kuninori.morimoto.gx@renesas.com>
 <87sffa8g99.wl-kuninori.morimoto.gx@renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <87sffa8g99.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HE7AW4IFZYJLI4QJRKRSFAPYEBQUC7HO
X-Message-ID-Hash: HE7AW4IFZYJLI4QJRKRSFAPYEBQUC7HO
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-DT <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HE7AW4IFZYJLI4QJRKRSFAPYEBQUC7HO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 13/02/2023 03:13, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> There are no compatible for "reg/reg-names" and "clock-name"
> between previous R-Car series and R-Car Gen4.
> 
> "reg/reg-names" needs 3 categorize (for Gen1, for Gen2/Gen3, for Gen4),
> therefore, use 3 if-then to avoid nested if-then-else.
> 
> Move "clock-name" detail properties to under allOf to use if-then-else
> for Gen4 or others.
> 
> Link: https://lore.kernel.org/all/87zg9vk0ex.wl-kuninori.morimoto.gx@renesas.com/#r
> Link: https://lore.kernel.org/all/87r0v2uvm7.wl-kuninori.morimoto.gx@renesas.com/#r
> Link: https://lore.kernel.org/all/87r0v1t02h.wl-kuninori.morimoto.gx@renesas.com/#r
> Link: https://lore.kernel.org/all/87y1p7bpma.wl-kuninori.morimoto.gx@renesas.com/#r
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../bindings/sound/renesas,rsnd.yaml          | 76 ++++++++++++++++---
>  1 file changed, 64 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> index 12ccf29338d9..55e5213b90a1 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> @@ -101,17 +101,7 @@ properties:
>  
>    clock-names:
>      description: List of necessary clock names.
> -    minItems: 1
> -    maxItems: 31

Not much of an improvement here. We asked to keep the constraints here.
I gave you the reference how it should look like. Why did you decide to
do it differently than what I linked?

Best regards,
Krzysztof

