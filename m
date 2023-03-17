Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1E36BE596
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 10:28:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49ABFF88;
	Fri, 17 Mar 2023 10:27:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49ABFF88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679045301;
	bh=raT8Lueir6bk0zzzy81FInFdCTY3peZg5v3JKQ9Ko00=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=U9U1RVWDJUtkHwUVKEH9OCvcVGYRjHLD58Av/gMtKKJHEdhJ8WMdzP6BTVnI2bOiL
	 SDxXYkrW3pXfYb64MLjFy0fKaS4b7dvVOx24VpMB5JZ1JwWMqhy+91ZGLR7oE2nxve
	 ijl+uJG6vtwCZWqLND5ybNpRCEuwFeg52nqUibxA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB94CF800C9;
	Fri, 17 Mar 2023 10:27:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF70BF80425; Fri, 17 Mar 2023 10:27:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B0B8F800C9
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 10:27:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B0B8F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=AL0npIf7
Received: by mail-ed1-x52b.google.com with SMTP id o12so17817946edb.9
        for <alsa-devel@alsa-project.org>;
 Fri, 17 Mar 2023 02:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679045242;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/vpwcPBpvj9pishkPLLrcgxPr2/RjOuXIj7XCYaMKNA=;
        b=AL0npIf713GInE0x+HCfSfiAErIUh+5J2yvd3OPKKOZgFVAnd1Gabp2rdpKnSbVZj4
         B8Rd9dh1JliM8dS0j4N7GN5BjeYhtGkvrwAb0DP9boUMKUUBrDP/y1T2KhoiaGV2k972
         EtmcC4MUxNIGTq+iLftWKpI/5GTX4JMi7/EP+cJa3K5HnUq5B26q5VTxdvoVDd+QS/mD
         rM2O3O5I6yMDwMbhA9oQRA2aKuWdSdlh5dgMh9W19FjNQIs+COBTGbmY81TH+WU7mGRg
         wzrD1gxfOBCO+p/7zRt3Lo13eq+nRLmoOny5FLlHqhWzKn0gIgjZGqgvh1VxprP4t3aX
         C3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679045242;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/vpwcPBpvj9pishkPLLrcgxPr2/RjOuXIj7XCYaMKNA=;
        b=XtBJ4fwxgX5qrmXCg3T+0E1s8/MPjxiK14appcY3EcKY3YGp/+H7nq62Cixtx7JWtN
         jBn/4ZoSlKQHFAgwqQrE3pJhi7cmRbKC4070kwaNtxjvvQHQq4ptEuL40QyPPCxwwRyG
         VwFxcEc7ystF53/G/KihY2Z8o0nNmhFj9PJyhUhUeo8+NUOuMCH+yiudz/kMXRsoszZK
         XnQuZrXUw5zwyP274P3OJ22bmG32i/3wd6kteAzyLsoKeveyVrGBDGePn9azYDjceOK8
         w7PgC2CSRsnbCHX2sM/X3T2UbNDilWi3u+58uic4y++CCGY4m8nOnr3i8bpXmidAhS77
         Nl9A==
X-Gm-Message-State: AO0yUKVOesBggII+HQm1FoErKCLd53VfG24LSAkJI6/dgWLkFydh30O5
	oWaQDwostm1RaEk7YT97+On5kw==
X-Google-Smtp-Source: 
 AK7set/nMbiF7GOlcn9PyjlA2lZijSx/2JZto82YrGSxJKdzBet8Ky/XFm0gwi0lrNol3+2x+TadhQ==
X-Received: by 2002:a17:906:b844:b0:931:ce20:db8e with SMTP id
 ga4-20020a170906b84400b00931ce20db8emr1719938ejb.51.1679045241043;
        Fri, 17 Mar 2023 02:27:21 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:848a:1971:93e0:b465?
 ([2a02:810d:15c0:828:848a:1971:93e0:b465])
        by smtp.gmail.com with ESMTPSA id
 g22-20020a170906199600b008b1797b77b2sm731814ejd.221.2023.03.17.02.27.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 02:27:20 -0700 (PDT)
Message-ID: <1f62677c-158d-967b-7ccb-99594e631ce8@linaro.org>
Date: Fri, 17 Mar 2023 10:27:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] ASoC: dt-bindings: adi,adau17x1: fix indentaion and
 example
Content-Language: en-US
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lars-Peter Clausen <lars@metafoo.de>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230316191918.266312-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230316191918.266312-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: BLFFYYDVC7M7LNW46WVFHR6WSM5ZDQBE
X-Message-ID-Hash: BLFFYYDVC7M7LNW46WVFHR6WSM5ZDQBE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BLFFYYDVC7M7LNW46WVFHR6WSM5ZDQBE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 16/03/2023 20:19, Krzysztof Kozlowski wrote:
> Fix errors in binding indentation and example:
> 
>   adi,adau17x1.yaml:8:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
>   adi,adau17x1.example.dts:29.3-30.1 syntax error

Typo in subject. I'll send a v2.



Best regards,
Krzysztof

