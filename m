Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEFA76874F
	for <lists+alsa-devel@lfdr.de>; Sun, 30 Jul 2023 21:14:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C905B820;
	Sun, 30 Jul 2023 21:13:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C905B820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690744478;
	bh=G/fmHmvSr9+b5V2gIXAabr4hQXgDOrksufPt36tS6Q4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XZV85h931GLZz6UkdOAX/aBtP2+2Nmov8E7XjYsuhcyMRYCM8uDCP8k8xzjzQ5sgp
	 Phmn0WAZql1CY8hJ3n1vgVi9feFwFWI6LXupn4VJ0xCxLNjohdwdrRap1ZSFZRxCec
	 Rw8C1alwWAlaM9n8mBc72Vh0DfiKaYUWc5dEzfsE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6407BF80520; Sun, 30 Jul 2023 21:13:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7DF2F80163;
	Sun, 30 Jul 2023 21:13:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37C8DF8016D; Sun, 30 Jul 2023 21:13:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EA0CBF80153
	for <alsa-devel@alsa-project.org>; Sun, 30 Jul 2023 21:13:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA0CBF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=aeN5dBIw
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-316feb137a7so4088683f8f.1
        for <alsa-devel@alsa-project.org>;
 Sun, 30 Jul 2023 12:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690744413; x=1691349213;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j0ecqV+zQBrvHKU8P7urlBJt6tFNPZIqLBFcAYgaXHc=;
        b=aeN5dBIw8dAZs1vLJMDO/AnhsBq0W8SZSb3g3qrWn7K/gRBEtE7SgRRPqLxCKx+hoZ
         7h6xApke7c+HdKTWCApjr7owhXz0sDbIEuhVQcxqzpY3p3zA99oi/95GvesWzBkjqMhk
         wRxxPz2Q6aAUJqEHtj3tpKIWf6jyDb7rBn41AljRYo3oMju5p8NtcUF6KBF4ZQpnA2nP
         +/NOIdw2ulfvkQdH5rG44/m/OnDG1J44gwoahNHBqhFK8yRR1r0XrYyOLvhlCH4hT9Bh
         gxAvT1Ok3UeKOr2AC5J79tn1/r9nRDhiZwGNzces5VybhhAaGdSgZu2Z3+lzyg/NYvZs
         8TaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690744413; x=1691349213;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j0ecqV+zQBrvHKU8P7urlBJt6tFNPZIqLBFcAYgaXHc=;
        b=VYgtAbNQi4yZOmdedG141gkBWkmGEXDwz0y+kT/tSXe5nHzysvEpwLJjwwcwz4tfSn
         gDkZGL5S2unNEajrusDfoQbmRhKv+PjWzbTvqD2aNPR5eMwabb1zdwpoPurSNDBKUd1t
         TH4MSuIF3H5pgRL98RFuW+ytqBCtZc36C5uvRAkixD38r+Z3lrnEOUomvag6AMuqNs1x
         zIsAS5Bu6BLxOkc5Zy3Mz+6Y5OD58CJMPKoX1j/QKgEDXIugZWifIsavtUw05aQBYllf
         5Rpq5zxA0IXni8iyBNGZH1nW0QyrCZv7qxpcikI6ZcH1imRHqDdqK9B4/BGOQqd/VXso
         JL4w==
X-Gm-Message-State: ABy/qLZIEXKmLFfq8ZR+BVdbA1OialM+3q+xsEyB3/RwCkMNePBRO/3E
	50cUyHTcEYmIe4LbhNbjmNFAbocYzwxVfPKv7Ko=
X-Google-Smtp-Source: 
 APBJJlHgJTuWoq/+j8ZmgJoc3K/QqyIwwtGgg/uMn9KDVYpruhtGFWsefLl9lfof8594VrGyYM6lXg==
X-Received: by 2002:a05:6000:12d2:b0:317:5e73:7594 with SMTP id
 l18-20020a05600012d200b003175e737594mr6080504wrx.28.1690744413699;
        Sun, 30 Jul 2023 12:13:33 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id
 f1-20020a05640214c100b0052276921a28sm4463825edx.78.2023.07.30.12.13.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Jul 2023 12:13:33 -0700 (PDT)
Message-ID: <8fc36939-49e7-4422-be94-ce57a82a56f6@linaro.org>
Date: Sun, 30 Jul 2023 21:13:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v3] dt-bindings: sound: gtm601: convert to YAML
Content-Language: en-US
To: David Heidelberg <david@ixit.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, - <kernel@puri.sm>
Cc: =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230730190243.113105-1-david@ixit.cz>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230730190243.113105-1-david@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: S62C652BZSSNFWKEN6GXEHXHTZXULKXN
X-Message-ID-Hash: S62C652BZSSNFWKEN6GXEHXHTZXULKXN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S62C652BZSSNFWKEN6GXEHXHTZXULKXN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 30/07/2023 21:02, David Heidelberg wrote:
> Convert GTM601 binding to the YAML format.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> v3:
>  - incorporated feedback from Krzysztof

...

> +properties:
> +  compatible:
> +    oneOf:
> +      - items:  # 48 kHz stereo
> +          - const: broadmobi,bm818
> +          - const: option,gtm601
> +      - const: option,gtm601  # 8 kHz mono
> +
> +  '#sound-dai-cells':
> +    const: 0
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +additionalProperties: false

I missed one thing in the previous review, sorry. Something was looking
here as missing but my brain did not work. Please add "required:" with
compatible.

Best regards,
Krzysztof

