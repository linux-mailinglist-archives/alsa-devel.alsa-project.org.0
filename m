Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDDC698E0E
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 08:52:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCC0A83E;
	Thu, 16 Feb 2023 08:51:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCC0A83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676533932;
	bh=VSF7zDvJu5EoPWnY+2TLsbbVWznl5tSTV5Ty37OVxPo=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FnZAkrxN/3IBSBMZ0lSdxJJfCN5klswCcaLxQZLOM9kz3E3YA5Rychhv0l3fMqxLj
	 EtTQKn/IDcsS78SikigJ/4tjmTXFUPAS51tuEWdRphDFt+j5zebsNA4vWck8m27cLM
	 0dEdVWHdUFEGt6tMQfAzB+Bf030LH1hhe3XJo3dY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F8B1F800E4;
	Thu, 16 Feb 2023 08:51:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B71B8F80171; Thu, 16 Feb 2023 08:50:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B788F80083
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 08:50:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B788F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=x0nUT4z0
Received: by mail-ej1-x62c.google.com with SMTP id my5so3089989ejc.7
        for <alsa-devel@alsa-project.org>;
 Wed, 15 Feb 2023 23:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KD9dKi3rj8RLYDdRMajBPNSYEk03xUbxX9rsJ1rYaZ8=;
        b=x0nUT4z0dVNgTRoeAYWDQGqapE/BIq1qs/b7uBgyJC/ctnRV6z0Bqb0b0DKJm3E1HG
         OgNGu74o7jZhuC8QboONAsa0l4GgRBzkasZ7dFB4+kX02asHCSRFI+YQVorelGADoSQB
         HfQoyAGgI/tepjUu2ydV9JJUq9jJ886ddp0OK3QiLnlQFaiAPEI84naAZnz4TJQ8MMsB
         65FzWSvXGNMYdp2sw0BpT31u8emkgR2O0dUF2x0EbUNO0TVky+HP8xqXtQBEnk95906I
         WAuAwg6VZDAdDb7kv+6QBgij2N9Z4weE9w7PPCFSNFMqEzn+GFNCCg0mCXCJx1PzVmVi
         ZHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KD9dKi3rj8RLYDdRMajBPNSYEk03xUbxX9rsJ1rYaZ8=;
        b=d4WlxtA4dta1CeeJ36yuNyVPB5qTacVM3mTjRJ48jVvp4OJLXSfmFqr7J/8SHfsZwb
         d6j1TDSIJBpI+aEKcznMRJ/dOUKDYFyIAqB7ovmJxZxhwZLB6jxyTJm4+4/eXb1bE+Eo
         T87huu2AbzoBhA5LKqbtZO9cvkbHnW6VbgWGZPKiBQvxM1QGqbNMjbEXyrEuPgLs2pQI
         wsaXjClNUPweZgclfzGuk/uOr8jyB49tnP+kVYklbeOHIrm+DJbMPelwN/oPoNceLRDY
         dNNGfJky7ovWMn2XHyl3SwTO6SJE2nsR+JUnxrA+1wu763hY7NhGRDFs1C5jxFhDCQjV
         hy7g==
X-Gm-Message-State: AO0yUKUCcjAsULU2Dac/pKMvIGfgXdwQfADiiqZOPdLHogry8jeXvl36
	M1uz1MGx4X9kmup60Vf2Vp7XUw==
X-Google-Smtp-Source: 
 AK7set9mjYyvMikODA+iXFUpJK7b+JCBVOC9KUseVYbV9TUdc8Qr1t9hthI8OSKalC0H0GGPJFkZ3w==
X-Received: by 2002:a17:906:f151:b0:8aa:c090:a9ef with SMTP id
 gw17-20020a170906f15100b008aac090a9efmr4534845ejb.55.1676533798381;
        Wed, 15 Feb 2023 23:49:58 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 h8-20020a17090634c800b007aece68483csm446448ejb.193.2023.02.15.23.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 23:49:58 -0800 (PST)
Message-ID: <a9d5d375-697d-93c8-0bed-4d2475e6643e@linaro.org>
Date: Thu, 16 Feb 2023 08:49:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 2/2] ASoC: dt-bindings: renesas,rsnd.yaml: add R-Car
 Gen4 support
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87ttzq8ga4.wl-kuninori.morimoto.gx@renesas.com>
 <87sffa8g99.wl-kuninori.morimoto.gx@renesas.com>
 <9aa09940-91cf-32ba-34f4-a57c9e9965bc@linaro.org>
 <Y+vKcGic3sC7+3I/@sirena.org.uk>
 <7b194041-4386-3b82-c65d-f0e3ad5cf015@linaro.org>
 <873576ju10.wl-kuninori.morimoto.gx@renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <873576ju10.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: EPBGK4NK4CZSUFSJ7PVGCDG4LR2WZAFF
X-Message-ID-Hash: EPBGK4NK4CZSUFSJ7PVGCDG4LR2WZAFF
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Linux-DT <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EPBGK4NK4CZSUFSJ7PVGCDG4LR2WZAFF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 16/02/2023 02:09, Kuninori Morimoto wrote:
> 
> Hi Krzysztof
> 
>> If you leave the top-level definition without any constraints and you
>> forget to include all your compatibles in allOf:if:then, then you end up
>> without constraints. Consider:
> (snip)
>> -----
>> properties:
>>   compatible:
>>     enum:
>>       - foo
>>       - bar
>>
>> clock-names:
>>   description: anything
>>
>> if:
>>   prop:
>>     compat:
>>       enum:
>>         - foo
>> then:
>>   prop:
>>     clock-names:
>>       - ahb
>>       - sclk
>> -----
>>
>> What clocks are valid for bar?
>>
>> For simple cases this might be obvious, for more complex this is easy to
>> miss. So the recommended syntax is with constraints at the top.
> 
> I can understand we want to avoid the future miss.
> But I did it on v2 patch and you NACKed it.

No, you did not do it in v2. The top-level property is a must, we talk
now about constraints.

> Thus people confused. That is the reason why above strange style was created.
> And it is already using "else", your concern never happen ?

Yes, with else my concern will never happen. However you have there
multiple ifs, thus finding the one related to clocks is not obvious now
and won't be anyhow easier later. What's more, clocks have constraints
in top-level, thus seeing clock-names without the constraints also
raises reviewers question. Someone might bring a new compatible with
another set of clocks (quite likely), thus else won't be valid anymore
and you will have to define constraints per *each* variant (each
if:then:). When this happens, please move the widest constraints to
top-level, just like I was asking since some time. Will you remember to
do this? I might not because I assume we follow same pattern everywhere.

With a promise of above:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

