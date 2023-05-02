Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 471326F3E63
	for <lists+alsa-devel@lfdr.de>; Tue,  2 May 2023 09:28:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D3AD18E7;
	Tue,  2 May 2023 09:27:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D3AD18E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683012482;
	bh=ORaWknNqj+84Bw7OuwYN0VJg9UTnzLoYZRk8HkvN/Vo=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Lj6WpWXk/+eNrA9qCk88H1JmfVJwlV2T7JQDV4DLeYkORKDshemkTmlW4yIgC/69J
	 QEitt0Tl/qCY/N2WhvSJAqnmpCCJDC9KZuXKevaa4ukn/w2/2hv5W845+Yh8wmQX0w
	 cAjG66GGEmByY88ztKW78Ml7Wnpq/USO97TlTdHA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D88EBF8032B;
	Tue,  2 May 2023 09:27:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD402F8049E; Tue,  2 May 2023 09:26:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3E6EF80137
	for <alsa-devel@alsa-project.org>; Tue,  2 May 2023 09:26:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3E6EF80137
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=GCn5ACoU
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9619095f479so339780166b.1
        for <alsa-devel@alsa-project.org>;
 Tue, 02 May 2023 00:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683012395; x=1685604395;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jw2MeZRG2SNHmSokjIGEeQ+7HfHpf9FvR5i6ApOel5o=;
        b=GCn5ACoUV7FFh9LJPy2TpMfjpk/2HmvKOJlSGImfLeM3iSDhZ2/rv3n9ukFQtjXb/V
         kcAuyurTA7xqSVY0JQuj0XErWDXSn3b1LvG6r2bYM4yKbHyJ7KnbDi9RzXQZTpP4wHs7
         QK9MrNPRvLWSrXmaKj9F0AAsbQG1JvZ+aRPkb1YTskUqUete57k6VAjPYqU6ZbfGEo0Q
         LLHuD8ruXPdG9EadkGd6uOJUlPdxzN3RCRTpRrTX+33A/VAI46mS5fq/iSzL9N85y072
         1mCvwhJyAzDYOWOH3FS36loGZpqRMTNwjjOq6rFNoAUqxjK5x5soKZvb43GDkmqTtk1i
         W3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683012395; x=1685604395;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jw2MeZRG2SNHmSokjIGEeQ+7HfHpf9FvR5i6ApOel5o=;
        b=f37dYzkOE4azGQvQxrRxNCUciHUZD0TtGkF+Dw0+CAGwV836dmZ3zo/UyxjmT14gfE
         NgJ9zPAw+fXAZSm66smZ83YyRLJb4E4PTcNofzfJDpj0SmWr7wRR6qCw9sS+hEhxBkVZ
         u3mDdA66cd5j6f3qnmbG6L4/6St6IWY6bC0JmunLC5NmZRtqW6CmrKgyUg/qXHAen5LO
         hSomdaqrFnMvm6pC3ZkIUEyLJO+ql5J2wSxkAe3rkk1Y5DK9FNPEgNv7UsT5ZAS2tFAT
         wG+4MbdGpmOTU1Jw9rwVZtf/qoQ72MrsC6nflWoZXLHTVOnTZG2mxdsbt8jBrBJ/Duoo
         ZRUA==
X-Gm-Message-State: AC+VfDzeFMFY4ucJIBl91i7pMpQKbPa7nfZ6lVh4bFG2RRNmyqU6CQCq
	o4PW/uL8SyMLUopDEwCj5RJhqQ==
X-Google-Smtp-Source: 
 ACHHUZ5tpQtK0nyexW1iTy+mBHeFxeiAQMAPOyIS+os/r9kldW+rmjEPsCp5t37OM26/IeJ59T0OXQ==
X-Received: by 2002:a17:907:3207:b0:94a:44ef:853d with SMTP id
 xg7-20020a170907320700b0094a44ef853dmr14180332ejb.68.1683012394949;
        Tue, 02 May 2023 00:26:34 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bafd:1283:b136:5f6a?
 ([2a02:810d:15c0:828:bafd:1283:b136:5f6a])
        by smtp.gmail.com with ESMTPSA id
 s22-20020a170906169600b0094f3132cb86sm15604927ejd.40.2023.05.02.00.26.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 00:26:34 -0700 (PDT)
Message-ID: <5bcb2741-9212-f1aa-335b-6bc4b6fad448@linaro.org>
Date: Tue, 2 May 2023 09:26:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/4] dt-bindings: sound: Add simple-iio-aux
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>
References: <20230421124122.324820-1-herve.codina@bootlin.com>
 <20230421124122.324820-2-herve.codina@bootlin.com>
 <20230425173029.GA1967523-robh@kernel.org>
 <20230426093621.3834e703@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230426093621.3834e703@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: TQ7ZS3SZ4ZJIKEK2WSKO3GB4DHG63KKJ
X-Message-ID-Hash: TQ7ZS3SZ4ZJIKEK2WSKO3GB4DHG63KKJ
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TQ7ZS3SZ4ZJIKEK2WSKO3GB4DHG63KKJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 26/04/2023 09:36, Herve Codina wrote:
> Hi Rob,
> 
> On Tue, 25 Apr 2023 12:30:29 -0500
> Rob Herring <robh@kernel.org> wrote:
> 
>> On Fri, Apr 21, 2023 at 02:41:19PM +0200, Herve Codina wrote:
>>> Industrial I/O devices can be present in the audio path.
>>> These devices needs to be viewed as audio components in order to be
>>> fully integrated in the audio path.
>>>
>>> simple-iio-aux allows to consider these Industrial I/O devices as
>>> auxliary audio devices.  
>>
>> What makes it simple? Any binding called simple or generic is a trigger 
>> for me. Best to avoid those terms. :)
> 
> I choose simple-iio-aux because some simple-* already exists.
> For instance simple-audio-amplifier or simple-audio-mux.
> 
> Do you prefer audio-iio-aux ?
> Let me know if I should change.

It means that often what people call "simple" and "generic" works only
for their specific case, because it is not really simple and generic.
After some time the "simple" and "generic" becomes "complicated" and
"huge". Conclusion: sometimes simple and generic bindings are bad idea
and you should have something specific.

Your description in the binding also does not help to match it to
specific, real device. Provide the examples, as Rob asked.

...

>>> +  io-channels:
>>> +    description:
>>> +      Industrial I/O device channels used
>>> +
>>> +  io-channel-names:
>>> +    description:
>>> +      Industrial I/O channel names related to io-channels.
>>> +      These names are used to provides sound controls, widgets and routes names.
>>> +
>>> +  invert:  
>>
>> Property names should globally only have 1 type definition. This is 
>> generic enough I'd be concerned that's not the case.
> 
> What do you mean ?

It is quite likely this will interfere with other properties having the
same name but different type/definition. If you want to keep it named
generic, then please investigate how this would affect any other
bindings. So easier is to make it not that generic, some more specific name.

> 
>>
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>> +    description: |
>>> +      A list of 0/1 flags defining whether or not the related channel is
>>> +      inverted
>>> +    items:
>>> +      enum: [0, 1]
>>> +      default: 0
>>> +      description: |
>>> +        Invert the sound control value compared to the IIO channel raw value.
>>> +          - 1: The related sound control value is inverted meaning that the
>>> +               minimum sound control value correspond to the maximum IIO channel
>>> +               raw value and the maximum sound control value correspond to the
>>> +               minimum IIO channel raw value.
>>> +          - 0: The related sound control value is not inverted meaning that the
>>> +               minimum (resp maximum) sound control value correspond to the
>>> +               minimum (resp maximum) IIO channel raw value.
>>> +
>>> +required:
>>> +  - compatible
>>> +  - io-channels
>>> +  - io-channel-names
>>> +
>>> +unevaluatedProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    aux {
>>> +        compatible = "simple-iio-aux";
>>> +        io-channels = <&iio 0>, <&iio 1>, <&iio 2>, <&iio 3>;
>>> +        io-channel-names = "CH0", "CH1", "CH2", "CH3";  
>>
>> Not really useful names. Do you have a real example?
> 
> As Mark said, for IIO channel, using CHx makes sense.
> See below, I provide a full example.
> 
>>
>>> +        /* Invert CH1 and CH2 */
>>> +        invert = <0 1 1>;  
>>
>> IMO, invert should be same length as io-channels.
> 
> I will update.
> 
> Related to this topic, when I wrote this binding, I wanted to add some
> rules/constraints in order to:
> - Have this property optional
> - If present, force to have as many items in the invert array as the
>   number of items present in the io-channels array.
> 
> I never succeed in writing the constraint for the invert property.
> It should be possible (it is done for some 'foo' 'foo-names' pair such
> as clocks).
> Can you tell me if possible in my case and give me some pointers ?
> 
>>
>>> +    };  
>>
>> How do support multiple instances? Say you have 2 sound cards (or 1 
>> sound card with multiple audio paths) each with different sets of IIO 
>> channels associated with it. You'd need a link to each 'aux' node. Why 
>> not just add io-channels to the sound card nodes directly? That's 
>> already just a virtual, top-level container node grouping all the 
>> components. I don't see why we need another virtual node grouping a 
>> subset of them.
> 
> I don't see what you mean.
> I use a simple-audio-card and here is a full example using several
> instances:

Just like Rob said: "You'd need a link to each 'aux' node"

and you did it...

So now the rest of Rob's answer:

"Why not just add io-channels to the sound card nodes directly? That's
already just a virtual, top-level container node grouping all the
components. I don't see why we need another virtual node grouping a
subset of them."

Why do you need another node if it is not really representing a real,
separate device?

Best regards,
Krzysztof

