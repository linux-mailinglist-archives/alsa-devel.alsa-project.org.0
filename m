Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC55768FCF
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 10:15:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A88C823;
	Mon, 31 Jul 2023 10:14:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A88C823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690791326;
	bh=3PD36y9crYcVbmBKlcqUT9WweOtIyMFBC2i870IXZsE=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=EZ91/qxVDZfNh4SrdMA+pS8xvv3bZnCrexqIcI43bUgEtklPtNFgPhKqffIagi7Gf
	 rHk6zh8627cd9+dlw43AsH2yMvfAJrgM0no/UrecpGwSRcifYCoPnEVSpNCBaMicd+
	 J//2iKAAECZ9cTuSglXI569K65XH4nNNZXBKuP8k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1AC67F8016D; Mon, 31 Jul 2023 10:14:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BE1EF80149;
	Mon, 31 Jul 2023 10:14:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA780F8016D; Mon, 31 Jul 2023 10:14:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B8653F80149
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 10:14:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8653F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=QTPoqYTC
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-51a52a7d859so11345579a12.0
        for <alsa-devel@alsa-project.org>;
 Mon, 31 Jul 2023 01:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690791265; x=1691396065;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p6rcZPwVJBWeYJ6kXZi9yA1FdLwGokDC5tlnkatV15w=;
        b=QTPoqYTCsActNvpiAsIPcOEkIha2cz1+i9EOrcWeVuAQqRzbD3Hp5oHPMMY04ggq1M
         nb4yyl+8vcvkiM6/JOorvvZp1HReTdhzm49qyaeTOLRzfaMpTO4kCqEAGSwHnglglu7G
         9efwAZ/KTTYT8NhsP5q9zsmcKy9sM9ibjUTw9OgEU/xN4eSet842XCNdRIIRxyp2oEig
         tbjADNqkvsW8eaHlK4e5rhJXARqmxaouqn18YdFDGrB/qOvJsVXwvURJ3rJWoljvkiJi
         LtdI+5aozZY/3fJ/P1e9EGUJlFFbUGv/9IKS2naDnAYj3UtTLw3Egf3fPWziZJlEi0ZP
         +Bmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690791265; x=1691396065;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p6rcZPwVJBWeYJ6kXZi9yA1FdLwGokDC5tlnkatV15w=;
        b=D5ugACLZ/eXtoMKzMup12r7IzMqNZ1F/6qpwpdJzuwkXFi8Nr674ytJsS3hbCBP8w9
         u282b8QC2k2edZZ8L5XCWB76YYxczhLD7VIVrX4EJqENJUaWBAgEiTROawSIbdCgEPYY
         Xjgths/KLfESDyZpWV/3nLH1XI5ss8aWmY740/E0jwrKxN098lEPHmD6/vx0mTggbgxs
         LWTYxwh2HeYTmxelgteQmQ0fO8Cr7YB5/KXx5e16Wv9bc5f88cOLQpIOMkbpPs7zKFDT
         EDliPvHVkpUf1ALr1L2/jJ1yNr3YD5qsfKHa7OWQ9hXLB62bIc4mgezM4q0dYJ+gNkbG
         n+0g==
X-Gm-Message-State: ABy/qLYOuLJ3zEeFabGweH1YGkxKZhpn0k7LbG8KmjdBDoZNlZnmz2CS
	pcNtyX8D5DnUb3pszNXKXwsmGA==
X-Google-Smtp-Source: 
 APBJJlEcpNtkDOqJUGvWGXqCV6phd4Pm6wZGFOPble3FSFbPOjaBdJp/J199LjmDjTErsa3F80PoGg==
X-Received: by 2002:a05:6402:3508:b0:51d:cf7b:c9f0 with SMTP id
 b8-20020a056402350800b0051dcf7bc9f0mr13989833edd.12.1690791265071;
        Mon, 31 Jul 2023 01:14:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id
 w5-20020aa7d285000000b005227ead61d0sm5095073edq.83.2023.07.31.01.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 01:14:24 -0700 (PDT)
Message-ID: <ab66c8a4-6a5e-651b-8f77-047980ebc238@linaro.org>
Date: Mon, 31 Jul 2023 10:14:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v3 5/6] ASoC: dt-bindings: mediatek,mt7986-wm8960: add
 mt7986-wm8960 document
Content-Language: en-US
To: =?UTF-8?B?TWFzbyBIdWFuZyAo6buD5Yqg56u5KQ==?= <Maso.Huang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "chenxiangrui@huaqin.corp-partner.google.com"
 <chenxiangrui@huaqin.corp-partner.google.com>,
 =?UTF-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsik=?=
 <Allen-KH.Cheng@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com"
 <lgirdwood@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>, "arnd@arndb.de" <arnd@arndb.de>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <20230728090819.18038-1-maso.huang@mediatek.com>
 <20230728090819.18038-6-maso.huang@mediatek.com>
 <7d70f893-ee75-d355-4b4c-4afe7a72cd7c@linaro.org>
 <5f794f6d3595e845433aab3c48eb47ec7962c929.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5f794f6d3595e845433aab3c48eb47ec7962c929.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NLBEQ6ZQZZZKRU2IBCSLVVQ2NR4IYSIR
X-Message-ID-Hash: NLBEQ6ZQZZZKRU2IBCSLVVQ2NR4IYSIR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NLBEQ6ZQZZZKRU2IBCSLVVQ2NR4IYSIR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 31/07/2023 09:31, Maso Huang (黃加竹) wrote:
> On Fri, 2023-07-28 at 14:49 +0200, Krzysztof Kozlowski wrote:
>>  	 
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>  On 28/07/2023 11:08, Maso Huang wrote:
>>> Add document for mt7986 board with wm8960.
>>>
>>> Signed-off-by: Maso Huang <maso.huang@mediatek.com>
>>> ---
>>>  .../sound/mediatek,mt7986-wm8960.yaml         | 53
>> +++++++++++++++++++
>>>  1 file changed, 53 insertions(+)
>>>  create mode 100644
>> Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml
>>>
>>> diff --git
>> a/Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml 
>> b/Documentation/devicetree/bindings/sound/mediatek,mt7986-wm8960.yaml
>>> new file mode 100644
>>> index 000000000000..76394f7e5502
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt7986-
>> wm8960.yaml
>>> @@ -0,0 +1,53 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: 
>> http://devicetree.org/schemas/sound/mediatek,mt7986-wm8960.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: MediaTek MT7986 sound card with WM8960 codec
>>> +
>>> +maintainers:
>>> +  - Maso Huang <maso.huang@mediatek.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: mediatek,mt7986-wm8960-machine
>>> +
>>> +  mediatek,platform:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description: The phandle of MT7986 platform.
>>> +
>>> +  audio-routing:
>>> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>>> +    description:
>>> +      A list of the connections between audio components. Each
>> entry is a
>>> +      sink/source pair of strings. Valid names could be the input
>> or output
>>> +      widgets of audio components, power supplies, MicBias of
>> codec and the
>>> +      software switch.
>>> +
>>> +  mediatek,audio-codec:
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description: The phandle of wm8960 codec.
>>> +
>>
>> How did you implement Rob's comment? Or did you just ignore it?
>>
>> Best regards,
>> Krzysztof
>>
> 
> Hi Krzysztof,
> 
> Sorry, I did not mean to ignore Rob's comment.
> I waited for some suggestion in mail below, but it seems Rob was a
> little busy.
> 
> https://lore.kernel.org/lkml/8c6316e79e40406e4d46709f602dcb14a4c00562.camel@mediatek.com/
> 
> After gentle ping last week and receiving your advice, I thought that
> means to send the v3 patch and might discuss dtbingding in v3 series.
> 
> So sorry for misunderstanding it, I'll check the details with Rob in v3
> series then refine it in v4.

The problem is that you did not reference in this patch any ongoing
discussion and further questions, so comment looks like addressed, while
it was not.

Rob said:
"in a common schema and reference them "
You said:
"common part yaml and reference to it"
so I think you both agreed on the same.

The advice would be to create common binding which is then referenced by
other and your bindings. However if you start doing it, you will notice
that it is impossible, because you have conflicting types for
"audio-codec", so you cannot have one definition.

This leads to the point - property is probably wrong and you need
dai-link with sound-dai property, just like most cards are doing.

Best regards,
Krzysztof

