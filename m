Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 717096BD8C7
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 20:18:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 972DE10B8;
	Thu, 16 Mar 2023 20:18:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 972DE10B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678994332;
	bh=zpSchT2c64a7libe/XNU0fpVlU/BXgapVsZSY8MoD5Q=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FhP/rG+Safc8UVXQfRxF+7Q0z96lOfJN/LqbuRZjBD5XTf5SksorhrBqHSc2bT6k9
	 wzq7q79tAxXbAP6MeJSFIIrS9EqYgfp15gr1sb/ELW6e1GBAR6qoWXxDrSw1t7fMP/
	 oZXS4Lh02jlA8X6D1KyZFcbGLxAnQIgLglZaWpf8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 538CEF80423;
	Thu, 16 Mar 2023 20:18:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2161F80425; Thu, 16 Mar 2023 20:17:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4FEBF8016C
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 20:17:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4FEBF8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=g7oRUQ3Q
Received: by mail-ed1-x529.google.com with SMTP id fd5so11730101edb.7
        for <alsa-devel@alsa-project.org>;
 Thu, 16 Mar 2023 12:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678994274;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LUqUOWWiZli99bg9SVozznX57dV1t/fJ4AoOzF+lHVk=;
        b=g7oRUQ3QlrKPdHr2cbg+8oDIky9CyeZzElETO/Dp6QH8wQeXufdGy32mxiliaTtF8p
         +KRS0CFESrv7jyNf19H5VsZ+UOnq4qN9wGKuJ11KbE/k+43ilv2vQoWs4XqOsb4yewda
         MtcejyLGAsLvljt40Cg0hAjodbZ7PxDoG73e6hai6MnIKiWksouTqzkMHPgbu5k5CLKZ
         aJAx9fN6elcNFleWOwbSOddHJstrUvFH2WG1WO9iwVMenHMrz8n796jI3ejYttZ9qDzB
         I/5NbvKCWHtiMq79TZeXk22lafidXAhsnWrmRqvpW9FD4HARJqwl/ZurUMAVgtQ3Bz5M
         ZSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678994274;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LUqUOWWiZli99bg9SVozznX57dV1t/fJ4AoOzF+lHVk=;
        b=p17yipd31F/a+vPccCnt7oQvo4kMRDxDzyNTtSqBriZ1jo+gYkz4Dm/kllb9yXDZu/
         M/vpKptSRNCF+XT5u5Cd055/gC953pkPabpRyUI2smaKsUOyOCcHFBTEbrozLS3cb2ru
         GQNe+aFiflx30+gsXQOYLqL0lmB1uNyloZIwxuTsFXnX5UZGD2jDQ1UE+m7XkarQ3Oo6
         I4pTTTzSmRDJx2HbK4px2DzxvS5v6NgwIclA4DhvJFNP/E3lRJpUQpCoLEyZwK1jWvU+
         cjpCxndoOiUquF4OgufZN0HRTgDYSCwoyQn7Ia6vjPR+o5g3DntSXp3iOzQhMBaYELPH
         a0fA==
X-Gm-Message-State: AO0yUKW6T0RMrdHkKrSdj+aODAQLFPc5/hUNeguiq28spwCBemaZpLyv
	a99oqzqwpVMIi2+pAi49/2g/Nw==
X-Google-Smtp-Source: 
 AK7set8YWZHXgEmHetI4JO8TbJOhcLvww2JEX6BbpNaPODsy3dOWflTX9OXBRY3f2eSxHuwvHRnOag==
X-Received: by 2002:a17:906:b88d:b0:8b1:806b:7dbb with SMTP id
 hb13-20020a170906b88d00b008b1806b7dbbmr10962635ejb.51.1678994274028;
        Thu, 16 Mar 2023 12:17:54 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f?
 ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
        by smtp.gmail.com with ESMTPSA id
 q27-20020a50aa9b000000b004af73333d6esm150320edc.53.2023.03.16.12.17.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 12:17:53 -0700 (PDT)
Message-ID: <49790631-807e-4903-bd26-86a6cde41e46@linaro.org>
Date: Thu, 16 Mar 2023 20:17:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] ASoC: dt-bindings: adi,adau17x1: Convert to DT schema
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Vijaya Anand <sunrockers8@gmail.com>
References: <20230315231055.3067-1-sunrockers8@gmail.com>
 <167897435177.2729678.7747291818682080828.robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <167897435177.2729678.7747291818682080828.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FSXAGEFZAPHMGJGAQXVRNYNXEJYHDYD3
X-Message-ID-Hash: FSXAGEFZAPHMGJGAQXVRNYNXEJYHDYD3
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: broonie@kernel.org, Daniel Baluta <daniel.baluta@nxp.com>,
 robh+dt@kernel.org, lgirdwood@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FSXAGEFZAPHMGJGAQXVRNYNXEJYHDYD3/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 16/03/2023 14:53, Rob Herring wrote:
> 
> On Thu, 16 Mar 2023 04:40:55 +0530, Vijaya Anand wrote:
>> Convert the binding document for adi,adau17x1 from txt to yaml
>> so one could validate dt-entries correctly and any future additions
>> can go into yaml format. Add address and size cells to example to
>> prevent errors regarding reg format.
>>
>> Signed-off-by: Vijaya Anand <sunrockers8@gmail.com>
>> Cc: Daniel Baluta <daniel.baluta@nxp.com>
>> ---
>> Changes since v1:
>> - added 'Codec' in title to clarify type of devices
>> - put compatible devices in lexographic order
>> - changed description of clocks
>> - changed 'unevaluatedProperties' to 'additionalProperties'
>> - changed node names to be generic
>>
>> ---
>>  .../bindings/sound/adi,adau17x1.txt           | 32 ------------
>>  .../bindings/sound/adi,adau17x1.yaml          | 52 +++++++++++++++++++
>>  2 files changed, 52 insertions(+), 32 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/sound/adi,adau17x1.txt
>>  create mode 100644 Documentation/devicetree/bindings/sound/adi,adau17x1.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/sound/adi,adau17x1.yaml:8:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
> 
> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/sound/adi,adau17x1.example.dts:29.3-30.1 syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/sound/adi,adau17x1.example.dtb] Error 1

Test your patches before sending... this never worked.

Best regards,
Krzysztof

