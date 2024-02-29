Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CB986D114
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Feb 2024 18:46:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4CFA825;
	Thu, 29 Feb 2024 18:46:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4CFA825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709228784;
	bh=niN2DkoUr9aar/ATcFru9UrJctQIzAQev8RXjVsXFj4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O/GPQSIeJqh2xOv5HxgSbxJVuEsW85Hym5QeTCfjKaexJ7c20zx9v4my3jsWsGOX9
	 /OdV7TyAe1sFjWDN60mntjgH0pFY1UlqxjBbejunwe0dTjw2HKc6LzHCTBV2gWQrk5
	 FRuTLiKIyJVKLWKyuxI2UJfk93feCdWXO80m09N8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 167E0F805B4; Thu, 29 Feb 2024 18:45:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE650F8059F;
	Thu, 29 Feb 2024 18:45:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBB4FF801C0; Thu, 29 Feb 2024 18:45:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6ADDF800F0
	for <alsa-devel@alsa-project.org>; Thu, 29 Feb 2024 18:45:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6ADDF800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wFFFB/nG
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a3f3d0d2787so188109466b.3
        for <alsa-devel@alsa-project.org>;
 Thu, 29 Feb 2024 09:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709228741; x=1709833541;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wmljqfmy54a6NNLOCOYx8UypncQfGQwtX9U6nuaptoI=;
        b=wFFFB/nGOyvJKqmOgwTz1x5fSimAZcAP6y4sKGxUJ1BM1SwvxG6q33a0tYImSH7+sb
         Fz6QRz7Uux7TuStrUo2AdKLatPFKJkCW7I9M/VDZJv3kISivgv+g51RP1lUpLqfOUHzZ
         qN/h9bLX78Mb8ThwJAwVngpIamA6V5jg9FKI55EBOivcMt3V9xrK/0R1pn2eKqiCqjqx
         2VFHPufm04RP8oVME71T+KUn0vhgJoq7jUxRkfLpY7/ktRY8GrwnMC3WdmLxAbxkSMNW
         OViD71t8Dh4x5xJ07ax/KOJ19SR182kGdZfFqzQz4QZ2ta9hrQ3wDm9cg6vCzt8//jTn
         /CYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709228741; x=1709833541;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wmljqfmy54a6NNLOCOYx8UypncQfGQwtX9U6nuaptoI=;
        b=hK2OH+jt4xyEvTq/vOqD4uIU3CmcqjlGD/YFH7rpaUpZ2pEBgxQHmydfjy4DxXc2VR
         loWmgsb5LVWkFCs8NKRWQ0l0G8roJfjOedwVlAfVfXa3f+sWgWWlPiRyu3jwVPDMCG5d
         MayfZZehJogpiZD8PTfNeBTEzL5IzURk7842NIXwwgrZKfHfj9FSLTdloreEg/mbyPo9
         pSg1ZlgGwDGrX5Bst520tnYlluGGaZg2ycJ41WCudknREKhp0eI5Bt3HjLPcw6pK20FI
         NOevA38Ycz6gv1pk9pggA1OHYKqXzWv+gUgEg2JEqaScGvzHwpdGVyvTQ+PUTWA+K7x6
         jNbw==
X-Gm-Message-State: AOJu0YxrLn7ASwhQjHNhND8gVGI0JutkLLH3LD2fWXhcrJeXX7ydmiEE
	BpRhSmPfQn8Ge1zLTJMKezvs5DvqxapIANxBcGLxxzVlOezIp0P7ZcQGJBwdE8w=
X-Google-Smtp-Source: 
 AGHT+IHbz8jTPJnNM8a7f2FJzPKBXJTbKBo6EnwXbW+O0KOCE1+VLf83KPRxycKV6JIKnAKtXe7XjA==
X-Received: by 2002:a17:906:f198:b0:a3f:9629:d305 with SMTP id
 gs24-20020a170906f19800b00a3f9629d305mr2179272ejb.28.1709228740770;
        Thu, 29 Feb 2024 09:45:40 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id
 d12-20020a170906344c00b00a446c74c699sm159777ejb.225.2024.02.29.09.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 09:45:40 -0800 (PST)
Message-ID: <864d3027-188f-4612-9770-d617244aad17@linaro.org>
Date: Thu, 29 Feb 2024 18:45:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] reset: add GPIO-based reset controller
Content-Language: en-US
To: Tim Harvey <tharvey@gateworks.com>, Sean Anderson <sean.anderson@seco.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, andersson@kernel.org,
 bgoswami@quicinc.com, brgl@bgdev.pl, Mark Brown <broonie@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Device Tree Mailing List <devicetree@vger.kernel.org>,
 konrad.dybcio@linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, perex@perex.cz,
 Rob Herring <robh+dt@kernel.org>, srinivas.kandagatla@linaro.org,
 tiwai@suse.com
References: 
 <CAJ+vNU3y5pzqeBnr8LHDtJtU7zajfRvP=_WmAhP=cAp_3iGFQQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: 
 <CAJ+vNU3y5pzqeBnr8LHDtJtU7zajfRvP=_WmAhP=cAp_3iGFQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: BSA63NJZRL36WCLXOKVGJB425OPWYX3V
X-Message-ID-Hash: BSA63NJZRL36WCLXOKVGJB425OPWYX3V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BSA63NJZRL36WCLXOKVGJB425OPWYX3V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29/02/2024 18:26, Tim Harvey wrote:
>> On 1/9/24 04:41, Krzysztof Kozlowski wrote:
>>
>> I think a separate pseudo-device is necessary a generic solution. So I
>> guess I will revive my patchset.
>>
> 
> Sean and Krzysztof,
> 
> I see a lot of value in a generic reset-gpio driver that you have both
> tried to get accepted in the past. I support boards that have a number
> of SPI and I2C devices that often have GPIO resets wired to them that
> are pulled in hardware to the in-reset state and find no support in
> the various drivers for reset handling. I've often wondered why a
> generic gpio reset wasn't supported in the SPI/I2C cores like it is
> for some other subsystems.
> 
> The approach of a gpios-reset solution makes sense to me.
> 
> Will you be submitting a follow-on series to your previous attempts?

Sorry, don't get. Why do you revive this old thread after code was
merged? If my patchset which was finally merged a week ago or so does
not work for you, please comment there or send follow-up work extending it.

Best regards,
Krzysztof

