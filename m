Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3997A94BF
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 15:26:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E2F3206;
	Thu, 21 Sep 2023 15:25:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E2F3206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695302808;
	bh=Id1Sh7e2qArvkb7UNwPi0JY5SIbCn4o3266btULOvOI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m6fthWEmFqipjfBbDpsvgdUgOgjWpVWSyEOmX3v/qWXXZ6+B6ZTM/KQE4352q9ya8
	 UTPS9GFVEbdcnOIVajElODX+t+F+n/nIbHoe3o2cxjGfJJiNfG2Y/UhGLOvjeE3Gwq
	 hjnUlhuC3NESVSrYUrni6yccGv7oWm+R+xef6sUI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46526F80613; Thu, 21 Sep 2023 15:23:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BC35F8060A;
	Thu, 21 Sep 2023 15:23:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5728F8025A; Wed, 20 Sep 2023 17:42:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0829F800AA
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 17:42:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0829F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=euXocslY
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1bf55a81eeaso52959185ad.0
        for <alsa-devel@alsa-project.org>;
 Wed, 20 Sep 2023 08:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695224544; x=1695829344;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/FopUyV3sWTM0BYSDm8MXgHOopR6PnUhg8HFvmChPo4=;
        b=euXocslY+OrcZGLHNMzyrX7NUAjwzG9bT73qAfGlasSQ17YOMR/27a71udpjcbbN2P
         ZgNHFz5NyZbeBK7bsonWaLL/4c72To6ZiMgt1V/cLdyIbEhETUZTBnWpKmK9Y9V7oxDi
         5nD9/cNG2wExakbjuF+WTSadqPABTUcmazLOuz2x4bJrls3f84262E8LQS6NIaUZJFX2
         b+13fm2CZvp/0aAGUIE2LE6DKTuosVtXvDqNO5t5+CdOigNVkazOrM6YJGJqluMA1N7+
         OEij0fw8yNdcZJlrvEonW3LpJIR8Am/ETHf+PptN3f0C3dhuphKVwwhdynNIpnEOp0l4
         GQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695224544; x=1695829344;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/FopUyV3sWTM0BYSDm8MXgHOopR6PnUhg8HFvmChPo4=;
        b=YApfqw+XiL7Y+OCNMttfirSF9/CNJLYCQPypdBBhJsl6DChti2bE+5MEZYL/wn02t4
         C49R+6kcjnxzOYYKoEakD5iLtAX29JRdZAORC2NTpSRpitPmksXPEq6aeNev0CmlvFCk
         o7Ml6Q6gy1agZNFUVfeQq6qd4JDMFnufFdjWBpEUHM1Co1+PQszkjfbYa+nCc+7vlMFw
         86DjXYjrBVyofq0Rzc5UUo+mJs4JVQ7y6L/EbIhjkbrrwAgkjb6CWjlwMhO4IzWerV2T
         D9IHtauqiKdkrH2qmVCo9j9oVDE6UMirF0oRJ0Okw7+5wSCI9SJHRk+wMOiGbX+WdZcS
         iSTQ==
X-Gm-Message-State: AOJu0YzqpkH6SZ84QU4YsAWcXtlp4zbDAmd++KnfuROO0xTE64Qjo8ZG
	w35YFkFnW90IIO/vqyyiup8=
X-Google-Smtp-Source: 
 AGHT+IEg7YKWpX/lvcgUKqgEZpPhN5zjZAhlL+5B313ksWVb7l6TWMOYw1KftwM2OOl0540JUnhR3g==
X-Received: by 2002:a17:902:9f8e:b0:1c5:b1a6:8111 with SMTP id
 g14-20020a1709029f8e00b001c5b1a68111mr2306749plq.31.1695224544654;
        Wed, 20 Sep 2023 08:42:24 -0700 (PDT)
Received: from [192.168.31.134] ([117.243.89.101])
        by smtp.gmail.com with ESMTPSA id
 ik26-20020a170902ab1a00b001b89b7e208fsm12228396plb.88.2023.09.20.08.42.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 08:42:24 -0700 (PDT)
Message-ID: <74322740-8db4-f165-7c01-47ed98f07e51@gmail.com>
Date: Wed, 20 Sep 2023 21:12:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] ASoC: dt-bindings: tfa9879: Convert to dtschema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230919090739.2448-1-bragathemanick0908@gmail.com>
 <9d612171-8ae4-de65-31b0-fbb5f1f8331e@linaro.org>
From: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
In-Reply-To: <9d612171-8ae4-de65-31b0-fbb5f1f8331e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: bragathemanick0908@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BLLCLBWDHP3BVMGNGKYOUPCYKN66P4UA
X-Message-ID-Hash: BLLCLBWDHP3BVMGNGKYOUPCYKN66P4UA
X-Mailman-Approved-At: Thu, 21 Sep 2023 13:22:54 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BLLCLBWDHP3BVMGNGKYOUPCYKN66P4UA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 20/09/23 16:58, Krzysztof Kozlowski wrote:
> On 19/09/2023 11:07, Bragatheswaran Manickavel wrote:
>> Convert the tfa9879 audio CODEC bindings to DT schema
>>
>> +required:
>> +  - compatible
>> +  - reg
>> +  - '#sound-dai-cells'
>> +
>> +additionalProperties: false
> Instead:
> unevaluatedProperties: false
>
>> +
>> +examples:
>> +  - |
>> +    i2c1 {
>> +       #address-cells = <1>;
>> +       #size-cells = <0>;
>> +       amp: amp@6c {
> amplifier@6c
>
>> +          compatible: "nxp,tfa9879";
>> +          reg: <0x6c>;
>> +          "#sound-dai-cells": <0>;
>> +          pinctrl-names: "default";
>> +          pinctrl-0: <&pinctrl_i2c1>;
> That's not a DT syntax.
>
> Best regards,
> Krzysztof
>
Let me correct all this errors/warnings and send a new patch.

Thanks,
Bragathe
