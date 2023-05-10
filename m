Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9376FD89F
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 09:52:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 052EA1050;
	Wed, 10 May 2023 09:52:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 052EA1050
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683705172;
	bh=d1ledQLlmXT6eh25IDSEBcgYz+24qfP8a6qszJJYWAA=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kmN3mHZwDeXyuGO0OXnGaOtIoYzfNkHJOeSuwsoxTQcEU0DdMb3yg/V/KNP2h1Qgk
	 rN9radOxvyi2UnIQF50z7VJ93J0rAoZz2s+bndx5gCi61KUSTCb2StZ64bDs5KKjqW
	 5Ff2STSswPwz8paVKX6y2vFWcyCC6z5CWMJdhG5c=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA2A5F802E8;
	Wed, 10 May 2023 09:52:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19673F804B1; Wed, 10 May 2023 09:51:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D5A7DF80087
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 09:51:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5A7DF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=e8aIWPr+
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-96a2b6de3cbso53983366b.1
        for <alsa-devel@alsa-project.org>;
 Wed, 10 May 2023 00:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683705114; x=1686297114;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9sZ0/8EovSIVbd5AFaZe/dkBXV3RZ8rTX6k+VIL7rd4=;
        b=e8aIWPr+BEmBTl5Ja69WLppVzCkVAIOoaeeLgvNObfsN5wQLd0YAml7nw0+qZZ1PL0
         UhF4FR8wKNwb5HXVNUyseHYPaBkEAeO7I/Fxw6hZUFeJpydOvePJPb3ohp35suuHDCDw
         QvriOZSDJQisEEvPVNim3W3+0bbGHdkjYz7Ow/qbIRoNUY9s/D0K37beZDaxvOGvSe2Z
         d/uMqO1NFUBNKT78u0Pa0RhJVplJ9pAEbSvb2QFXSUf80a/FgeoIAnjNOYIFhaQzEXyI
         9FMCHwN/C7evyXJOj0YgwPkbIythdN5/kPMzgqqhpY33OCfXu/NL8PDj+89GRNQPZNbO
         Zi6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683705114; x=1686297114;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9sZ0/8EovSIVbd5AFaZe/dkBXV3RZ8rTX6k+VIL7rd4=;
        b=leLLjLbmJY+budfxaKzkunL64iQB+zfdelJqMvM/pVnt1QlQQT0BIrQZI/k+SlCpm3
         1BHJn0HaKMbdqokzuTgEp546OPubiw0eJYMtbGwgO3QaN5BhTd6M8rjYTYG40/NTMTHV
         jJAgxRXpb76RHQ2DN/XKcjAJGQnJX1FDxhflwJWkgkD/co8nMfCcuClUps7B/2DHtujm
         KaUggOuryGJj/yHtuHFnoUQKTeK4rvL6ufx1ld41dEqBFuONCPeaWET/k++GTDhOPG1o
         BlMCGL3qkTVmPZGkKIwfAGZFZessmbL/JWf3Z326ovGHly2UpFa5bIOQSI6dNXvV7VzL
         2ykQ==
X-Gm-Message-State: AC+VfDzzSi+HD0kgwXLp+704lwboTF63mJLLYQV/h7v8tnExfd3NKcIj
	EERJqeTVWeqqvTwqG9bWPZgGAw==
X-Google-Smtp-Source: 
 ACHHUZ6exavcj5UmA9VcbxCwK35ZHL+3F10nUmd/jcwMNBcB51eEB2rJ74He9CSe0YwNB+NB6rHmmA==
X-Received: by 2002:a17:907:8694:b0:96a:1c2a:5a38 with SMTP id
 qa20-20020a170907869400b0096a1c2a5a38mr1858388ejc.11.1683705113851;
        Wed, 10 May 2023 00:51:53 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c175:a0f9:6928:8c9d?
 ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id
 lf23-20020a170906ae5700b0094ee700d8e4sm2309055ejb.44.2023.05.10.00.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 00:51:52 -0700 (PDT)
Message-ID: <f38b984c-e49a-0686-a907-5d86ea93d7bc@linaro.org>
Date: Wed, 10 May 2023 09:51:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Add adi,ssm3515 amp schema
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, =?UTF-8?Q?Martin_Povi=c5=a1er?=
 <povik+lin@cutebit.org>
References: <20230509163828.86003-1-povik+lin@cutebit.org>
 <20230509-marxism-plug-759c99ac601c@spud>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230509-marxism-plug-759c99ac601c@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KG62K6ZNOJRSIY7FEJZI7MEDIZLSRO26
X-Message-ID-Hash: KG62K6ZNOJRSIY7FEJZI7MEDIZLSRO26
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KG62K6ZNOJRSIY7FEJZI7MEDIZLSRO26/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 09/05/2023 20:25, Conor Dooley wrote:
> Hey Martin,
> 
> On Tue, May 09, 2023 at 06:38:27PM +0200, Martin Povišer wrote:
>> Add a DT schema for the SSM3515 amp by Analog Devices. It's a simple
>> mono amplifier with digital input.
>>
>> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
>> ---
>>  .../bindings/sound/adi,ssm3515.yaml           | 66 +++++++++++++++++++
>>  1 file changed, 66 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/sound/adi,ssm3515.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/adi,ssm3515.yaml b/Documentation/devicetree/bindings/sound/adi,ssm3515.yaml
>> new file mode 100644
>> index 000000000000..19b7185ae8e2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/adi,ssm3515.yaml
>> @@ -0,0 +1,66 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +# Copyright (C) 2019-20 Texas Instruments Incorporated
> 
> Copyright here looks a little odd, copy & paste from the TI bindings you
> send patches for earlier, or intended?
> 
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/sound/adi,ssm3515.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> 
> Drop the quotes on these please.
> 
>> +
>> +title: Analog Devices SSM3515 Audio Amplifier
>> +
>> +maintainers:
>> +  - Martin Povišer <povik+lin@cutebit.org>
>> +
>> +description: |
>> +  SSM3515 is a mono Class-D audio amplifier with digital input.
>> +
>> +  https://www.analog.com/media/en/technical-documentation/data-sheets/SSM3515.pdf
>> +
>> +allOf:
>> +  - $ref: dai-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - adi,ssm3515
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  adi,ana-gain:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [0, 1, 2, 3]
>> +    description: |
>> +      The value to be set in the ANA_GAIN register field on the codec. This determines
>> +      the full voltage span of the codec's analog output.
>> +
>> +      To quote the datasheet on the available options:
>> +
>> +        00: 8.4 V Full-Scale Gain Mapping
>> +        01: 12.6 V Full-Scale Gain Mapping
>> +        10: 14 V Full-Scale Gain Mapping
>> +        11: 15 V Full-Scale Gain Mapping
> 
> Putting register values into the DT does not seem correct, although
> I know nothing about sound and will have to defer to Krzysztof & Co. on
> that front.

Depends whether these are really voltages or something else (e.g. gain)
just related to voltage.

Best regards,
Krzysztof

