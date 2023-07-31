Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF3A769A2E
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 16:57:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8459827;
	Mon, 31 Jul 2023 16:56:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8459827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690815465;
	bh=21YC088aq64JalYTUnpkFuCD693IkdKcn/NFtT+rD5E=;
	h=Date:Subject:From:To:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=CKofO1+XobdkGLNC/QL+Z8QoUX3mn6v5SNCHBdBPycz9dPbsVPRnvYIIBdl0bpwVG
	 CzT2xlRGbIZemWYuHgH5nY6szmMTtRh/1X6OvDqBThQju8PlYL3Yl4qlGqlBNv0hgx
	 WodWC7M4V6COMmUc5aBpJGRi5TCDX1mta5gHTQ80=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE809F8053B; Mon, 31 Jul 2023 16:56:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46938F80163;
	Mon, 31 Jul 2023 16:56:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FB06F8016D; Mon, 31 Jul 2023 16:56:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9243F8015B
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 16:56:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9243F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Bps7HKIG
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b974031aeaso68695241fa.0
        for <alsa-devel@alsa-project.org>;
 Mon, 31 Jul 2023 07:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690815402; x=1691420202;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oa1SB02KtfMLxNE4mkxxs1OYoxXlIjwBI7+LigCTgCc=;
        b=Bps7HKIGU1d7zGk6EnCBSZB+lUHreffolw38t62M9CWeJ/hAtTcLbWEyRGx0OLdxN+
         tVMbbmbRF2ohu2WxxLjNYl3IyaP6ok/GnwlqlRN29C3tUtFbSqIks28iNf8Ip0n3TGVQ
         ZauRAK3cDiIdUD/7Fu+6khTozBYPwXrwsueNQklYPH4vrbltQb4xTuyZ2h2GKYMpFzYh
         5Q9Lc9qZWNJwsss83IMWvph8fAq0e2bgQavQ2H3qcjE5rf3kzV+sqjYnCqFfs+Lc8znr
         R2I9f4B8oxB6w1zJ5akEPy0M0Q7S5mHA5OPRYR+cBxdd/K8CBZV/lFEYIJcLPjhl60FZ
         ahYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690815402; x=1691420202;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oa1SB02KtfMLxNE4mkxxs1OYoxXlIjwBI7+LigCTgCc=;
        b=KohvundeNOkpl3s0QJrcpdsVUXm9Em90O1lAtAgiW4svI31N6LqYv0G61/pshQQq8n
         3Rdmwu1pYYzlv8xH/5gE94a4eG6x5/AgsG5vR88qZGnXoCEMRhRC8ExuirW6Xz7PK+DC
         OmEndTspl+J3TIlxSwZPoptdtoZ6Y8Zt+/jp9dtmBCwotJ64Wy+2t6i/7uWyG/glmU5B
         vDjSQV/diOjTlVxnw/TqFW5vE6sN29UM7/yybiHsW0VJB79BgnA4zINYgwjIWuGSIny8
         +dXpjBhsSDKN1q83OQFbbTHVE8lrEZDHBQ0wthHranmAeQ6WAFx1gDMOV8Z90jZ6qiGc
         +/Vg==
X-Gm-Message-State: ABy/qLY+aMqjdBWD+LYEfFk9Iw9yIOLXcNI636DjzBmXKfv8q6Q5Jicd
	k8Jr2ajsQz4jTXCvdcXxLJSKvQ==
X-Google-Smtp-Source: 
 APBJJlF7zuWD7Kp6ngSgGXo2OLttXqzIQ2Sxj/NgV2Jy37GYeVH1VK7pokm/jJZBd1ud+kDxL8TYug==
X-Received: by 2002:a2e:8e92:0:b0:2b9:edcd:8770 with SMTP id
 z18-20020a2e8e92000000b002b9edcd8770mr138066ljk.43.1690815402023;
        Mon, 31 Jul 2023 07:56:42 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id
 u17-20020a1709060b1100b00992bea2e9d2sm6335878ejg.62.2023.07.31.07.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 07:56:41 -0700 (PDT)
Message-ID: <26224f81-9993-0a4c-4c46-91acd1ff5f42@linaro.org>
Date: Mon, 31 Jul 2023 16:56:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v3 5/6] ASoC: dt-bindings: mediatek,mt7986-wm8960: add
 mt7986-wm8960 document
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
 <ab66c8a4-6a5e-651b-8f77-047980ebc238@linaro.org>
Content-Language: en-US
In-Reply-To: <ab66c8a4-6a5e-651b-8f77-047980ebc238@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LKAFKGOKZHCRJTIQVXGQH3HKZQTF4PVY
X-Message-ID-Hash: LKAFKGOKZHCRJTIQVXGQH3HKZQTF4PVY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LKAFKGOKZHCRJTIQVXGQH3HKZQTF4PVY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 31/07/2023 10:14, Krzysztof Kozlowski wrote:
>>>> +  mediatek,audio-codec:
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>> +    description: The phandle of wm8960 codec.
>>>> +
>>>
>>> How did you implement Rob's comment? Or did you just ignore it?
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>
>> Hi Krzysztof,
>>
>> Sorry, I did not mean to ignore Rob's comment.
>> I waited for some suggestion in mail below, but it seems Rob was a
>> little busy.
>>
>> https://lore.kernel.org/lkml/8c6316e79e40406e4d46709f602dcb14a4c00562.camel@mediatek.com/
>>
>> After gentle ping last week and receiving your advice, I thought that
>> means to send the v3 patch and might discuss dtbingding in v3 series.
>>
>> So sorry for misunderstanding it, I'll check the details with Rob in v3
>> series then refine it in v4.
> 
> The problem is that you did not reference in this patch any ongoing
> discussion and further questions, so comment looks like addressed, while
> it was not.
> 
> Rob said:
> "in a common schema and reference them "
> You said:
> "common part yaml and reference to it"
> so I think you both agreed on the same.
> 
> The advice would be to create common binding which is then referenced by
> other and your bindings. However if you start doing it, you will notice
> that it is impossible, because you have conflicting types for
> "audio-codec", so you cannot have one definition.
> 
> This leads to the point - property is probably wrong and you need
> dai-link with sound-dai property, just like most cards are doing.

BTW, might be useful for you, just sent:
https://lore.kernel.org/linux-devicetree/20230731094303.185067-1-krzysztof.kozlowski@linaro.org/T/#t

Anyway you need dai-links, I think.

Best regards,
Krzysztof

