Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 695D06FD92E
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 10:24:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48F82104C;
	Wed, 10 May 2023 10:23:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48F82104C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683707075;
	bh=nqJZS3gVrz1/AYoBFwqnofoyjrkll5mFXOP08pbPGY4=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IdPDcDd2MGWRb7+4cPFJ3CbCB8D0O4gJX89bOQNG83KAvdXsV4H8lJz28xNx/sSK9
	 YRIYnK2nTaf/seXQXoaJ4o7R0iPtF8ROPsd0yEo4njqb0MjWtPBgi41kihyR5Ezoh5
	 OMPT4HPrgx+gMRs0pNuj3tEa/vs6tV2NTunn0ci8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00493F802E8;
	Wed, 10 May 2023 10:23:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99650F8032D; Wed, 10 May 2023 10:23:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36A61F8014C
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 10:23:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36A61F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=stvWBTx3
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-965fc25f009so957763266b.3
        for <alsa-devel@alsa-project.org>;
 Wed, 10 May 2023 01:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683707014; x=1686299014;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RCtlG5oNLfTNjucw+rVtjHVln976pj7FRJKPu1vOWCU=;
        b=stvWBTx3heDqYc8aSgTI3BHDQux4v2TvX7ePqr7TWy2oIwonjSsmQIMNrxBcmC3z4e
         BS4k/8AWHGaveRJIUw40CJS8WtuwF7UK9jyKzYf5lDNpjykNLco9iQAlUMW1jzbZHQus
         4Z1wnrGMRNce020lZ7Jh2Oz06Quqe6UasRv48FZHGCtYb9nzgDNLTRvpD6xEIID6lFFm
         sezv0XEvautL4bFo/dCUFiITpubUrH6Y3pvwek4R6TBZwZwASqGRF3WZLNL3+/jeBiAF
         n/iTdlisi6g6ypd/IgkQ5KNXl2YjQRCbKvhqCuLWTjwoSd4yCy5uDpIskty2xPlCoZZE
         HQZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683707014; x=1686299014;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RCtlG5oNLfTNjucw+rVtjHVln976pj7FRJKPu1vOWCU=;
        b=b3Ophrt4HwqOyHc3sE9x0uPY6yz9TZZvpsz1R3mBLxEpYPmCo79EifGYcZjtkb4llJ
         BP4gFSHuXurX+A3NpieLi4OHahJBKTfl2psrzMvZ4eetZboP1DcMRtG/xRk61Pxhdv4M
         +Z9ZI6xTyYczdca3cwWk4jtNuC4ApQTmm5yJzKRMthsWPGDAwEbfTxFxH0o20ofCxSWd
         y0/o/BOFopMBQfCfxkrjY3iZo1OkJYgyTUBHwKTBkBl4AUewxPGC/OGBT146cKP90ztZ
         7GBKdNjl44cHOrGCP4X09fEtRMUcwx6DV7lrGCfutsWX8+1489m8zkmrpW0seIQQW/Ni
         /aEw==
X-Gm-Message-State: AC+VfDzHENfVbbJlmFIJgnMCLACeuVU/v+xS+0JiG53my/kaBQA+UK78
	SM56HmSJKLbkux/bBSpZ49yBJQ==
X-Google-Smtp-Source: 
 ACHHUZ5xP/23S+hpnC77/OrnFL6X6B7uO0M1ffqlHOOjvrKIowK3CPXhhGvAtmsSBTpG8NGiLLs0jw==
X-Received: by 2002:a17:907:971d:b0:966:d59a:4ba6 with SMTP id
 jg29-20020a170907971d00b00966d59a4ba6mr10431771ejc.43.1683707014305;
        Wed, 10 May 2023 01:23:34 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c175:a0f9:6928:8c9d?
 ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id
 la26-20020a170906ad9a00b00967a18df1easm2375908ejb.117.2023.05.10.01.23.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 01:23:33 -0700 (PDT)
Message-ID: <627f1739-98b4-9576-4b11-887c8f7e0c52@linaro.org>
Date: Wed, 10 May 2023 10:23:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Add adi,ssm3515 amp schema
Content-Language: en-US
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>
References: <20230509163828.86003-1-povik+lin@cutebit.org>
 <7b8c22e3-75c1-8803-fb32-097d12fbde78@linaro.org>
 <04BB0158-6C7B-400C-A87A-6E9B2835FDC7@cutebit.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <04BB0158-6C7B-400C-A87A-6E9B2835FDC7@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JRERRX22M4GRFF4FQVHXRO6OYLV25WHK
X-Message-ID-Hash: JRERRX22M4GRFF4FQVHXRO6OYLV25WHK
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>, asahi@lists.linux.dev,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JRERRX22M4GRFF4FQVHXRO6OYLV25WHK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/05/2023 10:15, Martin Povišer wrote:
> 
>> On 10. 5. 2023, at 9:51, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 09/05/2023 18:38, Martin Povišer wrote:
>>> Add a DT schema for the SSM3515 amp by Analog Devices. It's a simple
>>> mono amplifier with digital input.
>>>
>>> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
>>
>>
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  adi,ana-gain:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    enum: [0, 1, 2, 3]
>>> +    description: |
>>> +      The value to be set in the ANA_GAIN register field on the codec. This determines
>>> +      the full voltage span of the codec's analog output.
>>> +
>>> +      To quote the datasheet on the available options:
>>> +
>>> +        00: 8.4 V Full-Scale Gain Mapping
>>> +        01: 12.6 V Full-Scale Gain Mapping
>>> +        10: 14 V Full-Scale Gain Mapping
>>> +        11: 15 V Full-Scale Gain Mapping
>>> +
>>> +  '#sound-dai-cells':
>>> +    const: 0
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - adi,ana-gain
>>> +
>>> +additionalProperties: true
>>
>> uinevaluatedProperties: false instead, so users can have name-prefix.
> 
> I actually tweaked this to have the example passing, which has sound-name-prefix,

true is not allowed anyway - it makes your schema simply not effective
almost at all as it allows anything...

> which I guess is what you have in mind. Not that I exactly understand what these
> options do (both additionalProperties and unevaluatedProperties), the schema docs
> didn’t enlighten me right away when I looked into it.

The way to go and to start always is to look at example-schema. It tells
you explicitly to use additionalProperties:false and switch to
unevaluated "If and only if another schema is referenced".


Best regards,
Krzysztof

