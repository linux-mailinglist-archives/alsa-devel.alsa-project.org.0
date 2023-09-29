Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAAA7B3F1B
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:15:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A489514FA;
	Sat, 30 Sep 2023 10:14:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A489514FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061734;
	bh=HtqnG7bFOxeNV86wrkLXDNdws0PQrgOICblOJTqw+b0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ex6ZtTsmDxuGIcf+te82s94oKcf1fkK2QoEEZvjNfxIDSD7XWa6q2M8jWPSFJDjJa
	 pMV2NpTqUMNko0W+VomEtm1BEhQjEE7QDKRv38UkX4r6NFqoiJj8JIkmKtCGwG3MO8
	 jYNtSNhVSIUoWGdxHRC2GXPduz2uxgRB7ZsmvWRo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 846D2F80604; Sat, 30 Sep 2023 10:12:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FC5CF80604;
	Sat, 30 Sep 2023 10:12:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB356F801D5; Fri, 29 Sep 2023 11:13:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D57AF800AE
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 11:13:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D57AF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=T75xhHFh
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-690bd8f89baso11174706b3a.2
        for <alsa-devel@alsa-project.org>;
 Fri, 29 Sep 2023 02:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695978781; x=1696583581;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tMzgtdATq8nkLfhv47mw706RFHa0ZIrxQHeGa+lkj7k=;
        b=T75xhHFh+sMPqNKe7G2mw7Mxr5VbF9U6XKGG1DpdVXKgJFc60oGwOLdqL6rA+H3xzf
         G3vIl+WMxlJAxxEkLt7iVVsLcLTCxQJQLOsyCvwM+J33zUNrlf1aZiWE+2N18PAqLVO2
         NbCa8EKUwtAdaMloxiDYQwFYB0vKVpTPqmo7s9VOLb47AaF5KPR2rJPi/Vfr1PQVMtOS
         h6S/obT/43TyDopTKc4mGtWHqx/shOnIpi0V4NBjMiLOwXznwZI/S4lnT2YlRnrPsRs+
         lPEtYGmeXDmnEWlYxIH1s+OP3cKC8+u7LHbPWfUTrgv0CaeJRw0sGF0aysvk42vBpQNQ
         iqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695978781; x=1696583581;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tMzgtdATq8nkLfhv47mw706RFHa0ZIrxQHeGa+lkj7k=;
        b=ldOt2G/ot1Nq6CQkYcuOLKpsc9n2/64N42Xoc5BlSc38dHXtEzDz23Udb/inJ8D6jH
         PXcpioS2hDn2whetYoNeqAMwYXeFWucxrPkcQaIQXB45N8oZs//f9sl0cIyW6WO8TWqW
         UvCVRbtO8d/rA9f0X4jbCwGdVpbTlUcBxU3qPHL21xXVdIBdZLBCqDz0mOILfI9Jje12
         9YrQhZzSblOcCQ1Fy7vHHvP5oOUWFNhDZK0m2wOs0b3h/C2DU/IhNDENTUiAI1R/0/r2
         BKjEhOXa9RzmCpg3cbHgRChx59ccxcPgenkEhYmg4CUJAbrAA5PzujWPb+BHP69ljxy8
         jDXQ==
X-Gm-Message-State: AOJu0YxnNLZC7PNjlxGSjfDm8JqbVk/P3BbqseDRCERLpGxBxqbvjQwx
	NJM2+F3YA3uVI3w2OMWPRo0=
X-Google-Smtp-Source: 
 AGHT+IEB+jijyjzjeJxWsqp/5aNhkEGBJsxmCXCXlmxoBOh5HwKSEoY3n75i/LSpexrsKEG4td2FRw==
X-Received: by 2002:a05:6a21:329a:b0:137:e595:830f with SMTP id
 yt26-20020a056a21329a00b00137e595830fmr4166577pzb.57.1695978780486;
        Fri, 29 Sep 2023 02:13:00 -0700 (PDT)
Received: from [192.168.31.134] ([27.4.138.218])
        by smtp.gmail.com with ESMTPSA id
 6-20020a170902e9c600b001a5260a6e6csm3844611plk.206.2023.09.29.02.12.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 02:13:00 -0700 (PDT)
Message-ID: <11a44e95-d29d-d892-6473-3d8d858b9d04@gmail.com>
Date: Fri, 29 Sep 2023 14:42:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] ASoC: dt-bindings: rt5616: Convert to dtschema
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230925165715.34883-1-bragathemanick0908@gmail.com>
 <20230928161931.GA713974-robh@kernel.org>
From: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
In-Reply-To: <20230928161931.GA713974-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: bragathemanick0908@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DTAYWVHT2WHTT47L4ZDZLKE7NQ5FSLJG
X-Message-ID-Hash: DTAYWVHT2WHTT47L4ZDZLKE7NQ5FSLJG
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:11:56 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DTAYWVHT2WHTT47L4ZDZLKE7NQ5FSLJG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 28/09/23 21:49, Rob Herring wrote:
> On Mon, Sep 25, 2023 at 10:27:15PM +0530, Bragatheswaran Manickavel wrote:
>> Convert the rt5616 audio CODEC bindings to DT schema
>> No error/warning seen when running make dt_binding_check
> No need to say that. That's the assumption and it should never get
> applied if not.
>
>> Signed-off-by: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
>> ---
>>   .../bindings/sound/realtek,rt5616.yaml        | 53 +++++++++++++++++++
>>   .../devicetree/bindings/sound/rt5616.txt      | 32 -----------
>>   2 files changed, 53 insertions(+), 32 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5616.yaml
>>   delete mode 100644 Documentation/devicetree/bindings/sound/rt5616.txt
>>
>> diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5616.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5616.yaml
>> new file mode 100644
>> index 000000000000..00ff9b4e3c7e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/realtek,rt5616.yaml
>> @@ -0,0 +1,53 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/realtek,rt5616.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Realtek rt5616 ALSA SoC audio codec driver
>> +
>> +description: |
>> +  Pins on the device (for linking into audio routes) for RT5616:
>> +
>> +      * IN1P
>> +      * IN2P
>> +      * IN2N
>> +      * LOUTL
>> +      * LOUTR
>> +      * HPOL
>> +      * HPOR
>> +
>> +maintainers:
>> +  - Bard Liao <bardliao@realtek.com>
>> +
>> +allOf:
>> +  - $ref: dai-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: realtek,rt5616
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  "#sound-dai-cells":
>> +    const: 0
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - '#sound-dai-cells'
> This was not in the original doc. Was that an error? If so, just state
> that in the commit msg.

Its was added by me. Will remove it

>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
> blank line
>
>> +        codec@1b {
> audio-codec@1b
>
>> +            compatible = "realtek,rt5616";
>> +            reg = <0x1b>;
>> +            #sound-dai-cells = <0>;
>> +        };
>> +    };


Will make these changes and send a new patch

Thanks,

Bragathe

