Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 987CF6E4B42
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Apr 2023 16:18:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E321DF5;
	Mon, 17 Apr 2023 16:17:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E321DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681741109;
	bh=VWVbnl82aVleQLjdJKn5nTONh2VEv2AJRkuDAIqjuQM=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lCXxdCfWeRBtlOx7AA59t0EdjOvPawF3rOJ/vBV3p4IsPNL2FiN63qEO1gzcTXrsI
	 diKJY7RkLLKEg2x7iUbjX4rJJwb6sXnnji13QaZn4hyEQXpCDvzvxfWLuw1pCUdQE+
	 noc8nS0LvRQeKE3OkVDM4iGN/r2PnX55mAYLZtIA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D24F4F80266;
	Mon, 17 Apr 2023 16:17:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B3CFF80269; Mon, 17 Apr 2023 16:17:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75AEBF80212
	for <alsa-devel@alsa-project.org>; Mon, 17 Apr 2023 16:17:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75AEBF80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=EXnrC+sI
Received: by mail-ej1-x629.google.com with SMTP id dm2so64650647ejc.8
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Apr 2023 07:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681741050; x=1684333050;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mjLQZkxTBlX3f7nO48hxD2oULveWu8viYEgFU3xZb9g=;
        b=EXnrC+sI+XdHwyMZvAyllL/QfV5LjpTKCH8KkvPigJb8znAO8K7jst5GMPEgHFYJgr
         NlYeXVV3QtwCp/NRQqikPY/Zhx6Cea/mF2V+YEvsajc6NYVpTB1GICpday6vnypDOISL
         8F+2Oqyptl/mgaFrrBU6ffKE5zG6++sRYS2OdGbJKlVxzxJCpSZklwwCJgtisyRX86lA
         /0uYnysLB/J4rqNLhFQKUiaZaPM1tlft26x95S2/JF6zuBW44RpF8uth45q9+UpySANy
         2dTMwxOD7qfFykJyvAkgXdGQ8oUVQV1WvQ1g7kW3CGw7TnGWUNHCU+8flrOD79G0iLlP
         1H9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681741050; x=1684333050;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mjLQZkxTBlX3f7nO48hxD2oULveWu8viYEgFU3xZb9g=;
        b=RayK2arnRMzOCSKksHMCcPFcAlcr+ryEOMJ8WpuU6S/s4JNdPSkZoa/k5Vwpj4vUHe
         BhcgQT2d/iV7Qo0TBUkHkK7u/DTI8J3cphjBNqkjBJaijwIpXpNFZ42jZ+irDEqIHfky
         V+RXnsbi0F+lSexKeL6ZFpHi0bCRM3AcgTbRlKnLXa282NG7QNDP4ydEHaQz4PUI4Ygc
         bpMBNF5cUs7IyiD2chbZNEb3VqMGZ06NhU8qZZckdhC2q1tty357gdAmNuLZKQqfCcU3
         lPynZ0xVA7HNFBPxLG6sYBFdNC3OPnZZe+++r0JokkeWxQwkxMNyr/83UUqq8dwEPcJd
         kdnQ==
X-Gm-Message-State: AAQBX9eCyVA5irGEtEoQHZtjKG0WJ41MVZKLbJXKQ5c7FB2ZZQNnby06
	SBtYTZy8vtYqrtPJRAUWaRDM6w==
X-Google-Smtp-Source: 
 AKy350avq0En6hyn+CrauNxNAjPy1OIlwA9w0VURk4/I8g8MYDsSly0AxL//OId7TWoI3VYYpljnLw==
X-Received: by 2002:a17:906:8604:b0:94e:f176:43cc with SMTP id
 o4-20020a170906860400b0094ef17643ccmr7963783ejx.39.1681741050708;
        Mon, 17 Apr 2023 07:17:30 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:96aa:60eb:e021:6511?
 ([2a02:810d:15c0:828:96aa:60eb:e021:6511])
        by smtp.gmail.com with ESMTPSA id
 bn3-20020a170906c0c300b0094e93ec20adsm6657072ejb.106.2023.04.17.07.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 07:17:30 -0700 (PDT)
Message-ID: <a4eeeaa2-51b6-76da-8e4a-517db64a3173@linaro.org>
Date: Mon, 17 Apr 2023 16:17:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/7] dt-bindings: soundwire: qcom: add 16-bit sample
 interval
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Rao Mandadapu <quic_srivasam@quicinc.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20230403132503.62090-1-krzysztof.kozlowski@linaro.org>
 <20230403132503.62090-3-krzysztof.kozlowski@linaro.org>
 <94590a79-cae3-7b88-8f02-0c356adf06b7@linaro.org>
 <7c7afc80-713f-1949-4feb-f5f2d192569c@linaro.org>
 <9156affd-7f08-282b-ee65-ae82f4d94cbc@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9156affd-7f08-282b-ee65-ae82f4d94cbc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 5ZPY6U662UHONCGZ2GNB5YOQLFGN6R6P
X-Message-ID-Hash: 5ZPY6U662UHONCGZ2GNB5YOQLFGN6R6P
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Patrick Lai <quic_plai@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5ZPY6U662UHONCGZ2GNB5YOQLFGN6R6P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 13/04/2023 13:12, Srinivas Kandagatla wrote:

>>>> +  qcom,ports-sinterval:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>
>>> Should this not be ref: /schemas/types.yaml#/definitions/uint16-array ?
>>
>> Same answer as for Rob:
>>
>> Because I am afraid it will grow in next version to 24 or 32 bits. I can
>> change easily maximum, but if I put here uint16-array, all DTS will have
>> /bytes 16/ annotation.
>>
> As per MiPi Specs the sample Interval is an integer in the range 2 to 
> 65535. I don't see a value in making this u32, other than adding some 
> confusion by deviating from specs.

Hm, in such case I'll make it uint16.

Best regards,
Krzysztof

