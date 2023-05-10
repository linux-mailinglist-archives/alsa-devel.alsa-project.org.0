Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 732AF6FD871
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 09:44:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CED421046;
	Wed, 10 May 2023 09:43:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CED421046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683704646;
	bh=v1odzP+n+X0XIrk/YL+PPsf1I9Vw8LGI0fMf+Nez5us=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EEQDiZoGDmZt+ROw5Iib6oXCOJ9umA9feHoP2R3tfa9AosqCd4b1UMayLs7jeHNcU
	 CUjubbI8vYYbDdzteS/8r/wxMzPoYqb2QnQK7O7Pn0XdFwu3Z2PuMoUMasqDcJ4BIF
	 A9deF1q/pp5wvT7FKrwPZnCcVUAIJcvwfcofV9Zw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE71FF80534;
	Wed, 10 May 2023 09:42:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DE20F8053B; Wed, 10 May 2023 09:42:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F9B7F804B1
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 09:42:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F9B7F804B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZPrkSIp/
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-50b8d2eed3dso10529171a12.0
        for <alsa-devel@alsa-project.org>;
 Wed, 10 May 2023 00:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683704572; x=1686296572;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LSvYi8ezsl6O/bO/+mRMMF1WJ2AcmYFcBwK0eCs1+B0=;
        b=ZPrkSIp/Fw6JvYfKpHtRlgkij8fd9DtW50/nVWZA2dyJiRQmKhzrlXEVZuBNBy6Yo4
         wtin4ZIv0z/kcsxvyw3ZHbJN7I++r7yQmhwV0Qcwit9LQLD2i/nEwPioImjDmV9TpvN2
         5doKdNSEtZYi6CoHCbthEQcwrcnzW5r/mJsjHkZryxRECLIfuhTVXGImxNdHdVvfTVdF
         +x3j4ofwHzBm2hhOUqsaUCHmvpS//Ms8LIS6uMBgmAVfaqik20S256XuJE5nj7iFXs1V
         K8MT+ryjtKQIN+effKdTVJt6pQBPO5zMZ1/NfWQQQehX8yqGzBCw9nTkQsLLw/KY882Z
         r/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683704572; x=1686296572;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LSvYi8ezsl6O/bO/+mRMMF1WJ2AcmYFcBwK0eCs1+B0=;
        b=E2yVq6iY5fx8TnZ3RetjV6mp6bOs5ZJB9vxY8ji3b8pjoIHDM3nz24BPsrrSYTnF+R
         9dRrnalcAEgfX3sp5Zx1pDOeehixldHYftSX1rc4AlusOX6awnWJsgSTKbiSj8moPI0Z
         mKpl778tyEjGLkk8YY1Vj3a8rZ2U/uW4MiBwtCTWib9GBeIIsPVDq0+vxhibkMGUBUVz
         Adwdxw4eQC7jPARWOsyGG3bfXRYSv5VQFPvLWmk5NocIzR73fWCkTPNcnEkDnvIdHqng
         si6HpkEmhDvGd/JeX2A5TX13INCozYgon78EwwHJG4coH+JR+LjveMrS5GGOk/VysMAN
         Jf1Q==
X-Gm-Message-State: AC+VfDxjkKTDlm/lXCPCLZzpl+jesj5xFaponIPatdI1PS26D+ZOZZG2
	+V8QxWu02UtBUDylAdtjQN7aJg==
X-Google-Smtp-Source: 
 ACHHUZ58UJ91o2BbbMuSuhkpixMMpyByW/Dt7rOLTp6FTQzWMvixrA/vIOCJ6JTen0nmU64qgRX5Lg==
X-Received: by 2002:aa7:c68c:0:b0:50b:d495:106c with SMTP id
 n12-20020aa7c68c000000b0050bd495106cmr13720697edq.8.1683704571368;
        Wed, 10 May 2023 00:42:51 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c175:a0f9:6928:8c9d?
 ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id
 s24-20020aa7d798000000b0050bc37ff74asm1626913edq.44.2023.05.10.00.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 00:42:50 -0700 (PDT)
Message-ID: <f40daf65-ac65-5df6-828b-c5ded00c4c8a@linaro.org>
Date: Wed, 10 May 2023 09:42:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] ASoC: dt-bindings: Adjust #sound-dai-cells on TI's
 single-DAI codecs
Content-Language: en-US
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>
References: <20230509153412.62847-1-povik+lin@cutebit.org>
 <baf338a7-1e63-4842-32a1-8f63f850bd2d@linaro.org>
 <A8647EF5-566A-4B99-9020-772810CB2BF7@cutebit.org>
 <F12DE31C-E167-47F0-BAE0-C09538C5C3C8@cutebit.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <F12DE31C-E167-47F0-BAE0-C09538C5C3C8@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WMQKEEZK76SPZLMHLVDSPS4GDJOJO2C6
X-Message-ID-Hash: WMQKEEZK76SPZLMHLVDSPS4GDJOJO2C6
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
 Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
 Shi Fu <shifu0704@thundersoft.com>, Shenghao Ding <shenghao-ding@ti.com>,
 kevin-lu@ti.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WMQKEEZK76SPZLMHLVDSPS4GDJOJO2C6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/05/2023 09:33, Martin Povišer wrote:
> 
>> On 10. 5. 2023, at 9:30, Martin Povišer <povik+lin@cutebit.org> wrote:
>>
>>> On 10. 5. 2023, at 9:17, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>>>
>>> On 09/05/2023 17:34, Martin Povišer wrote:
>>>> A bunch of TI's codecs have binding schemas which force #sound-dai-cells
>>>> to one despite those codecs only having a single DAI. Allow for bindings
>>>> with zero DAI cells and deprecate the former non-zero value.
>>>>
>>>> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
>>>> ---
> 
>>>>  '#sound-dai-cells':
>>>> -    const: 1
>>>> +    # The codec has a single DAI, the #sound-dai-cells=<1>; case is left in for backward
>>>> +    # compatibility but is deprecated.
>>>> +    enum: [0, 1]
>>>
>>> Does it? I see playback and capture.
>>
>> I think so. Playback and capture are not separate DAIs.
>>
>> Martin
> 
> I double checked, I am pretty sure. There’s a single snd_soc_dai_driver,
> which becomes a single DAI.

Indeed, I see now one entry... Ehh... -ENOTENOUGHCOFFEE

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

