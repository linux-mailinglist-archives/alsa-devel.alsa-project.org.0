Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F6B89A417
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Apr 2024 20:20:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BBCC2D3F;
	Fri,  5 Apr 2024 20:20:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BBCC2D3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712341234;
	bh=cCLDIsYFejxah3kcUtD/78RZA+bRyvoysZUBeT3z5Mg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GyXA95bsWRRV9txxrD2ja0n1d3pExjvL83zUr0vbXqPQ/WVOq6oC0XfIw8Vqdp02S
	 u2NxgNhemHZL+VkEQAaa66wowp1bhJ5HJSlanHL/YDdfB2bXnmeb+NdTHWgl/HgxAj
	 aLZEnswstd/AJgrciLcxlIrLhRzHTtoiBjsZb9uc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7D5DF8020D; Fri,  5 Apr 2024 20:20:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07BAAF8059F;
	Fri,  5 Apr 2024 20:20:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C617F8020D; Fri,  5 Apr 2024 20:19:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1DC0F80130
	for <alsa-devel@alsa-project.org>; Fri,  5 Apr 2024 20:19:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1DC0F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Yw5b710N
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-56e3e581a94so122102a12.3
        for <alsa-devel@alsa-project.org>;
 Fri, 05 Apr 2024 11:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712341178; x=1712945978;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+1RwFx5Y5CQOS1dH67ttsjIpb2yYeYbzx39qz2nB/54=;
        b=Yw5b710NW3KdHYshHix2VVvqrOScmnxq/+6zkIM/uxotv5B9GcuGmwScDPIrHX/yQ9
         cXhto7rw0pHs8csAednbJ8onOwcpWAoupkEff6TF1bhmYB5pZGBqBBu0zyMpO6mRiUQt
         lLKE9jkRj1k9ArpHDifgcWsn0tgkuzq2NLjYXtVtkM87ZwPz/auBDPWtqR/Q7IfIflRm
         wkd+61tLOCH/shehSl+u9DijSr/FYjO3gdSJHBIY7oUqoLeQYKG8Etp0VAkzrdiLc4dj
         3mug4sugxxGJ/O4J39opkD8J0ClJTd8iFG2960wZu+CFEubZ8QJBlkBsu7n1vf7s67V0
         9Ilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712341178; x=1712945978;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1RwFx5Y5CQOS1dH67ttsjIpb2yYeYbzx39qz2nB/54=;
        b=FPYEqtb6xq6hvpjNz25ED3W05cNkEPHciJilTzurOkNCtgoLL6fa9AeoVVNJbTBS3W
         ug/HOL6QIqm3ZuLK+2YM2jnBx/JOaY3hkCXA7WNfXUrGrqstBGzJQYlZh26AEnT2bMMz
         pyE/11lJbjurgoyZxuQaMdTWDhtgBLefttFHG/d5GCWpOvwyAZZ3wRwZwclnuz6ziA9d
         KVJYTI6P58tWAc+Wa6XDD1TE4K9v/iw415dwpKOb3U7PIsSsR44ORTxF4LsZNQD29c8C
         Nk2Zvl/QqLvnrdl6T5WlHcWCeKIUyRTvySwbyWpesopcwFUy2YRIcg9wK8e+gJbsYjh1
         FuRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpc+mw7UtBCFZs6pgjbylRga7y2E8BchVWL3YK/5oRjijMJejWe2MpwihrRszAI1VBOHQzEBuMb1bRdpay0ZI8ApV5MjAmjHbTuIo=
X-Gm-Message-State: AOJu0Yzbshp+9gz4JVGtA7DdxmC4RMVrABarqS/NbSvzQsmJ8GOJWKWT
	MM73u5NqztqhLcVIQiLoXNCUENGJDGFyTcKfKOmzuB+RbI+x3EnH3pwIZyAlw8I=
X-Google-Smtp-Source: 
 AGHT+IFJE27+I1fV34zf0q3INt5gP7v3XA/hxhqaP7lbIgf2utXVlcEuEzbd1685nzCblz2Pxk/4lA==
X-Received: by 2002:a50:a40f:0:b0:56e:3571:189c with SMTP id
 u15-20020a50a40f000000b0056e3571189cmr1469625edb.18.1712341177745;
        Fri, 05 Apr 2024 11:19:37 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id
 ij6-20020a056402158600b0056ddd9427d2sm1038022edb.58.2024.04.05.11.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Apr 2024 11:19:37 -0700 (PDT)
Message-ID: <352672fc-b6e1-458e-b4f9-840a8ba07c7e@linaro.org>
Date: Fri, 5 Apr 2024 20:19:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: omap-mcpdm: Convert to DT schema
To: Mithil <bavishimithil@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240404160649.967-1-bavishimithil@gmail.com>
 <78091796-fd0a-42dd-a4da-f7bed3025bf9@linaro.org>
 <CAGzNGRnuG_gLUrH1N57WvpKbpiNtFrcsG6nJcacQNJB_yMYNrA@mail.gmail.com>
 <ec7f77a7-2cf1-4ea6-b9c4-d4fe8a1673ab@linaro.org>
 <CAGzNGRktm5gMj=bhtX2RAzcn1v5ref+nV-HV3Fct56FzAzxjWA@mail.gmail.com>
 <c9084453-65f1-43b0-88df-5b73052ccb72@linaro.org>
 <CAGzNGR=2-us8GRB3RNi4_24QZ9rNBC7Lx0PFsWwbvxuRKk5ngw@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: 
 <CAGzNGR=2-us8GRB3RNi4_24QZ9rNBC7Lx0PFsWwbvxuRKk5ngw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RIBZYV4CT56WCSYTVFIZIBZ4SLRM2AW6
X-Message-ID-Hash: RIBZYV4CT56WCSYTVFIZIBZ4SLRM2AW6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RIBZYV4CT56WCSYTVFIZIBZ4SLRM2AW6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 05/04/2024 19:21, Mithil wrote:
> On Fri, Apr 5, 2024 at 10:38 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 05/04/2024 18:29, Mithil wrote:
>>> On Fri, Apr 5, 2024 at 9:27 PM Krzysztof Kozlowski
>>> <krzysztof.kozlowski@linaro.org> wrote:
>>>>
>>>> On 05/04/2024 16:48, Mithil wrote:
>>>>> So sorry about the 2nd patch being sent as a new mail, here is a new
>>>>> patch with the changes as suggested
>>>>>
>>>>>> Please use subject prefixes matching the subsystem
>>>>> Changed the patch name to match the folder history.
>>>>
>>>> Nothing improved. What the history tells you?
>>>>
>>>
>>> Referred to "ASoC: dt-bindings: rt1015: Convert to dtschema"
>>> Not really sure what else I should change.
>>
>> But the subject you wrote here is "dt-bindings: omap-mcpdm: Convert to
>> DT schema"?
>>
>> Where is the ASoC?
>>
> I did change it, will send the patch again.
> 
>>
>> reg is not correct. Please point me to files doing that way, so I can
>> fix them.
>>
>> You need items with description.
>>
> Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> I referred here for the description, but will add items for the 2 regs

I don't see at all the code you are using. It's entirely different!
Where in this file is that type of "reg" property?

> 
>>> Interrupts and hwmods use maxItems now.
>>
>> hwmods lost description, why?
> Seems self explanatory.

Really? Not to me. I have no clue what this is. Also, you need
description for (almost) every non-standard, vendor property.

> 
>>> Changed nodename to be generic in example as well.
>>
>> "mcpdm" does not feel generic. What is mcpdm? Google finds nothing.
>> Maybe just "pdm"?
>>
> Multichannel PDM Controller. Kept it like that since the node is also

You said you "changed nodename". So from what did you change to what?

> called as mcpdm in the devicetree. Calling it pdm might cause

Poor DTS is not the example...

> confusion.

So far I am confused. Often name of SoC block is specific, not generic.
Anyway, that's not important part, so if you claim mcpdm is generic name
of a class of devices, I am fine.

Best regards,
Krzysztof

