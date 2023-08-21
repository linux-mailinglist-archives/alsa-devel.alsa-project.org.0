Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C14C782387
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 08:19:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A1ED83A;
	Mon, 21 Aug 2023 08:18:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A1ED83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692598788;
	bh=yvD7fNPAqjJ6sJpUuggXY5i/GYUE9X5FaSsOg1bwYT8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TkD/mHDVMhtZsvz3/vpnh0jSt/csb55V2SWxTVEpU5BRdojstv5X7k9ZFKno5RypT
	 LTqIkAnPGpRbSkvfpY64StgzEu/pHQNm2q3NPPBSPLuV2LRhQNnBWmisbsAVTgzZC7
	 xU9Tdt1P3jxH94+8ibB3PwxogpnroDIUxph6rfSw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B162BF80510; Mon, 21 Aug 2023 08:18:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 299AAF8016C;
	Mon, 21 Aug 2023 08:18:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 682F0F80199; Mon, 21 Aug 2023 08:18:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD5EDF8014C
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 08:18:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD5EDF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=D/o0UHsX
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-522dd6b6438so3507953a12.0
        for <alsa-devel@alsa-project.org>;
 Sun, 20 Aug 2023 23:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692598704; x=1693203504;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D7X2osa/VnJsVrrnV+a+hds4KQ1gcHyl9bFLWZVEWtI=;
        b=D/o0UHsX5R8srkJXZRmBstQyp7M7eRQLI402ny9OwP0Pre/30ybADkVCJ/3Y6DdKHj
         Y85YUkT+t9+2TqyGpy6D0rSaroxijblDV+f21G8Li7ZOAXfPLhLKGQMPZZBDVUlxThva
         pJegViJ2q+XbWSX2XVYZQjSw7PCEcTV0EkrfkC/sIloIbMyyeQ3qsMYTpII8bIwOlGtj
         MUTF3yGTkT8yXLV+D7bkJyo5Lj5kEybteySfYNVYhkfRXfviM836EItXzkEGnCs6iz4L
         eblhA9hBf0SLbyT9iZ+oezluVGb9qkk3XXrWKjZ4r2S3MaHxt7OOKuZj90YKOTS6jDSK
         wTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692598704; x=1693203504;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D7X2osa/VnJsVrrnV+a+hds4KQ1gcHyl9bFLWZVEWtI=;
        b=YxWoyqZSDR837HlIhM6LmS8LbM3QSMXqb2Yd8Aqc92Zh0xVsqWaJsU+WR9ZeXJGtzU
         llxlso6mTWMF5cDF8psNUhGr3vvdEwwKkT+r8ED3xGS4Muhdzc2XUlDf3frtqWXYzdnL
         ikLfnYl658CySM7oM+11QSHU9pKQ82GC65aufezSRD3Fnq35cuJQcIFnTB6bEkijq5Ht
         6DzaD0N1ApYvH7Gdnd7N9SO8SxbcbSFoaicUmfPAwF8bIie3SRNvQzENm/BwImbEgki9
         UdVLLnncVhcMNBYYf4ou9A750yGBOZxS43AA6Wz/6f3Ajml2u8ExIxshswrxs/xt2L1M
         XQNg==
X-Gm-Message-State: AOJu0Yy8fmPnlhXWl0HMqGQ2zrtzKR4tPLv9aAxEwk1IA+SCdaKgNCQf
	LIdRwqydNrI2kKJ6MIKOelFmiw==
X-Google-Smtp-Source: 
 AGHT+IHwSmx3yGxzilGgKDgibpDPl9dnNP4Fi5wj6jsC6TQOc4RIljouOMWV2EZwX4pqw3kPczpfOQ==
X-Received: by 2002:a05:6402:510:b0:522:2111:1063 with SMTP id
 m16-20020a056402051000b0052221111063mr3944431edv.18.1692598704177;
        Sun, 20 Aug 2023 23:18:24 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id
 j5-20020aa7c405000000b005232e637c24sm5475336edq.84.2023.08.20.23.18.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Aug 2023 23:18:23 -0700 (PDT)
Message-ID: <9cd15a97-7479-bb2b-9b47-8702b1e20e52@linaro.org>
Date: Mon, 21 Aug 2023 08:18:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: fsl_easrc: Add support for
 imx8mp-easrc
Content-Language: en-US
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230820175655.206723-1-aford173@gmail.com>
 <f5b16676-04b9-7864-ffa7-1c48f3c2ca9c@linaro.org>
 <6089b46d-a580-af52-0cac-84b46fe11e6c@linaro.org>
 <CAHCN7xJyOjKSXbm17roAJDbk-gDKQHprE9t1d4VH2uYSMZcEDg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: 
 <CAHCN7xJyOjKSXbm17roAJDbk-gDKQHprE9t1d4VH2uYSMZcEDg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XW5FXO7HTDJBS3KJ4YBHVLNOGMRO4LKJ
X-Message-ID-Hash: XW5FXO7HTDJBS3KJ4YBHVLNOGMRO4LKJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XW5FXO7HTDJBS3KJ4YBHVLNOGMRO4LKJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 20/08/2023 23:05, Adam Ford wrote:
> On Sun, Aug 20, 2023 at 3:33 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 20/08/2023 22:32, Krzysztof Kozlowski wrote:
>>> On 20/08/2023 19:56, Adam Ford wrote:
>>>> The i.MX8MP appears to have the same easrc support as the Nano, so
>>>> add imx8mp as an option with a fallback to imx8mn.
>>>>
>>>> Signed-off-by: Adam Ford <aford173@gmail.com>
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
>>>> index bdde68a1059c..2d53b3b10f2c 100644
>>>> --- a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
>>>> +++ b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
>>>> @@ -14,7 +14,11 @@ properties:
>>>>      pattern: "^easrc@.*"
>>>>
>>>>    compatible:
>>>> -    const: fsl,imx8mn-easrc
>>>> +    oneOf:
>>>> +      - items:
>>>> +          - enum:
>>>> +              - fsl,imx8mp-easrc
>>>> +          - const: fsl,imx8mn-easrc
>>>
>>> You need here also const for fsl,imx8mn-easrc, otherwise you do not
>>> allow it alone. Test it for fsl,imx8mn-easrc DTS - you will notice warnings.
>>
>> Actually, I see now Rob's report... you did not have to test DTS even.
>> It was enough to test your change and this test was missing :(. Please
>> test your changes before sending.
> 
> For what it's worth, I did run 'make dt_binding_check', but I didn't
> run it with the extra flags from Rob's e-mail.  The tool didn't return
> any errors.

OK, indeed without the additional flags the example from that binding
won't be reported as undocumented compatible.

Best regards,
Krzysztof

