Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0281771CFF
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 11:20:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DB34836;
	Mon,  7 Aug 2023 11:19:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DB34836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691400011;
	bh=r5Po4fHBVOMd0XFiUbFL44AVhi9zRFDAeYQKmmqSim4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o2jJNdnzLvsh6Fqz770/BwV31J1B4Si86EkmSDV6d6XSftgqgPBYJbLHI27azQ212
	 dD2D+RWKA6Kk56dbxrsKVoxSVRRWpAYAUo6NZ6FthHQRqc/i+XakdS35FYExuVd0mE
	 gewrtNXrWHHDt7MY2XS/K4YXWROCA619XOXckeAU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA897F8016B; Mon,  7 Aug 2023 11:18:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4038BF8016B;
	Mon,  7 Aug 2023 11:18:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD2BAF8016D; Mon,  7 Aug 2023 11:18:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 013F1F80087
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 11:18:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 013F1F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=qJNkHMMX
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-317c3ac7339so2932802f8f.0
        for <alsa-devel@alsa-project.org>;
 Mon, 07 Aug 2023 02:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691399879; x=1692004679;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pVzTFSX+f3NLp8W+oubkEcGfLvriaLn/mzk8yERB4EQ=;
        b=qJNkHMMX6yWfZ0+pTVtKomPhic8oIkVTU4BgI6+YGQ09zaqOV+wKh9W0VMaDF5vGVK
         unpdERvcAcVRzv4T+5eC6utzpr7Tujtt4DxNGg5+D0zups3hSP94fD4C6Uq7d+QA/UfX
         Sixs7SltrhRg3Z2s4cDrRNFbVUvMUojpSzMGxhDPUhF1dzNE6PeVKZRcXXA09Qr/NMCc
         4/ENs3n9eQZK25cJJHF3O3p4hP5uyg6YXkPYotQ85mlUAB18yaC4W/dV7RuK2jvuNwbF
         AyG5SBgOF2lJne/Hu/DDneyX2OuAtEZipBpoT1RUjDbrGTA/GusqpUqTCXE1vBKusIgW
         MYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691399879; x=1692004679;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pVzTFSX+f3NLp8W+oubkEcGfLvriaLn/mzk8yERB4EQ=;
        b=YdYUtNWS8iJRRr42g5XmuRyvtQt2SBJCGOopPb4waRyEQWKa/9qAudIDwit5HeXsuv
         wOLzR59CBiSM5StSxF9RzN/DHR2/lAVN6b/CAQnenersaKDK+yPQEcX0aHHKUGMuAzzy
         rsTcPcFUtOAuYC8qsKFH7fcmw97uX4EIXZnRTf/Snh525GZpTM81sk5yiSV0wICWj1AF
         rkDH+5+a/1aHz6brHDpCDaWhkQ8OxIkF4WpJBZRxACGv6mSK/2oM4V/JbRmQYBnDxNbb
         8vyU4KUGZk6dQ5O4PTGer+DwGfijAOZvSHZfOSJsjQZ9+dvI5QyNTVIUIolJ2TZzTQ7T
         INHA==
X-Gm-Message-State: AOJu0Yy9nJQ5kUC+HD+wcefDo5QCoikr5XfcGDDXcb4cuQfwq1LieJTN
	pX7ujF+sYvsALfWKzLCotk+frg==
X-Google-Smtp-Source: 
 AGHT+IGt4KGgRS1McoIAI5KnJK92YrcRCVd7O+/H015bztf8+4T/Ho4NkPj03Y5Li3pMLxhNwVc9aw==
X-Received: by 2002:a5d:4044:0:b0:314:a3f:9c17 with SMTP id
 w4-20020a5d4044000000b003140a3f9c17mr5695333wrp.42.1691399879376;
        Mon, 07 Aug 2023 02:17:59 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id
 r15-20020adfdc8f000000b00317909f9985sm9893936wrj.113.2023.08.07.02.17.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Aug 2023 02:17:58 -0700 (PDT)
Message-ID: <f0744dfd-00fe-2f58-065e-6828b6bd3450@linaro.org>
Date: Mon, 7 Aug 2023 11:17:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v1 2/5] ASoC: dt-bindings: snps,designware-i2s: Add
 StarFive JH7110 SoC support
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Maxim Kochetkov <fido_max@inbox.ru>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Jose Abreu <joabreu@synopsys.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Walker Chen <walker.chen@starfivetech.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-riscv@lists.infradead.org
References: <20230802084301.134122-1-xingyu.wu@starfivetech.com>
 <20230802084301.134122-3-xingyu.wu@starfivetech.com>
 <37a636dd-fbd8-d475-8814-e0cc6d5cc812@linaro.org>
 <12a9bfda-9c9f-6baf-3e5f-ce7cc7d79aee@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <12a9bfda-9c9f-6baf-3e5f-ce7cc7d79aee@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GF27XNQQ3BGC3XLABMI3JBLT77RVVY6W
X-Message-ID-Hash: GF27XNQQ3BGC3XLABMI3JBLT77RVVY6W
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 07/08/2023 11:03, Xingyu Wu wrote:
>>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: snps,designware-i2s
>>> +    then:
>>> +      properties:
>>> +        clocks:
>>> +          maxItems: 1
>>> +        clock-names:
>>> +          maxItems: 1
>>> +        resets:
>>> +          maxItems: 1
>>> +    else:
>>> +      properties:
>>> +        resets:
>>> +          minItems: 2
> 
> The resets of TX0/TX1/RX on JH7110 SoC are mentioned in 'else' here.

Ah, its fine. Clocks seem to be also constrained.

> 
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: starfive,jh7110-i2stx0
>>> +    then:
>>> +      properties:
>>> +        clocks:
>>> +          minItems: 5
>>
>> Also maxItems
> 
> Will add.
> 
>>
>>> +        clock-names:
>>> +          minItems: 5
>>
>> Also maxItems
> 
> Will add.
> 
>>
>> What about resets? 1 or 2 items?
> 
> Mentioned it in the 'else'.
> Or do you mean I should drop the 'else' and add the resets in here?
> And is the same for TX1 and RX?

It won't be easy to read... probably the binding should be split.
Anyway, it's fine as is, except the maxItems above.

Best regards,
Krzysztof

