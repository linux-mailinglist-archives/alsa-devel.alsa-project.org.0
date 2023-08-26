Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4559378952B
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Aug 2023 11:33:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64D74847;
	Sat, 26 Aug 2023 11:32:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64D74847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693042395;
	bh=nNx/cv+leI+UnKuPWsHLuBzYQrXftDlaFiyVxXqouYo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t5saHcK3xlePxCWWz3uKIXkS0+yjA/hplYfNrX93LTf87qaaRIo3qvpVD1fFqTzTd
	 1fTyRpF0LgFK66yZdpBZWS7kDyatM2ilyiVgWioI7WEbzIMT5OApPKFgBjie45822A
	 Sjhvv9s+JK59amgQQWqnjURHsjFK3JArmNnzmsaM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35710F804F3; Sat, 26 Aug 2023 11:32:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DDEB6F800F5;
	Sat, 26 Aug 2023 11:32:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06973F80158; Sat, 26 Aug 2023 11:32:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D46ADF800D1
	for <alsa-devel@alsa-project.org>; Sat, 26 Aug 2023 11:32:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D46ADF800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=TDAQAo5s
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-991c786369cso211773566b.1
        for <alsa-devel@alsa-project.org>;
 Sat, 26 Aug 2023 02:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693042336; x=1693647136;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fh95DS4/zs6n0cJh3VH9O2GqPzFB0e6cNn1CIcgmuSY=;
        b=TDAQAo5smrHikxLKg+nQMYvYwLqljGPHZ1DSe64rjNScidr4IUZmAlcgJw/RXOyBS/
         zScNdNNsZiyJGX+FSXYxY4No+fhdFLohDULc3oGbYCGkAp8Ra+Bs3ndhI7Kt5ARQPjEJ
         msvXeh5vSxAbxN+u1Rb8LeKBu3C6wClV9hxnsRZJCbQv/o70KjI0rfBxSQp1uud7yz/D
         KH62x5HYjvfO5sG4QKlPCNspEbInilnX+mDmCktyov4g8L482XHziXXSEsCvEUACy+0b
         TmGuKSkxo+DmRF24LToJdN0jZMd30dFWD5l0sijeycr9weikRKqqlBDhxWVY+DolB1b9
         jSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693042336; x=1693647136;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fh95DS4/zs6n0cJh3VH9O2GqPzFB0e6cNn1CIcgmuSY=;
        b=kS0zdwTfORk9yknfpyVcvgETkA25JpRy9ehV0f8z5pMNkdf0NzNiR1jQTuxls10FIE
         DbGSdWuLcRmJhRVkSQyFgQLx34VwClI+qdhhZvFsLr/nruM5LxeY9rDoBdyi36ZbU9IM
         RSwCYzUJosp9CmNDosIDdO5U3b3Hj3PBh2f1NZrtQ+34S6XAL99hV07a2BHBBgGGgmoV
         ZPnox+GPJ3p30HAApJ+LnOyUc+JtvxgGxICD5mQFWPHaGV82RNEvkWNJZyRZRdQ43gZC
         0bA4cKUUaINbMcU6mNtiZZpRrcJnZ1BAfr5Bu1IqFTujWQ/larGegRDjWFRrhv+eFYFQ
         RZsg==
X-Gm-Message-State: AOJu0Yy0QUo24VupLUroPvavxKnWzCb9YnxtjL9vM20i2iiwPJBMsDBL
	GHv8vZmUPD0PELbcetyzdZe5+Q==
X-Google-Smtp-Source: 
 AGHT+IGhLZfGwbn7DfIZKro/6nQ/hZy3z2cFeu4oKwg6fSTiT/1BXmYXl5MpIGrGmzMQsGFLQ/DFIw==
X-Received: by 2002:a17:906:51d3:b0:9a1:e941:6f47 with SMTP id
 v19-20020a17090651d300b009a1e9416f47mr7412341ejk.42.1693042335907;
        Sat, 26 Aug 2023 02:32:15 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id
 jj26-20020a170907985a00b0099bd86f9248sm1949705ejc.63.2023.08.26.02.32.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Aug 2023 02:32:15 -0700 (PDT)
Message-ID: <1a0dc235-eb44-9923-6206-560199a70d4e@linaro.org>
Date: Sat, 26 Aug 2023 11:32:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: qcom,lpass-tx-macro: Add SM6115
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230825-topic-6115tx-v1-0-ebed201ad54b@linaro.org>
 <20230825-topic-6115tx-v1-1-ebed201ad54b@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230825-topic-6115tx-v1-1-ebed201ad54b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FS5AOQHFZW3NCAQCCHVLTF7LZSHTJBG3
X-Message-ID-Hash: FS5AOQHFZW3NCAQCCHVLTF7LZSHTJBG3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FS5AOQHFZW3NCAQCCHVLTF7LZSHTJBG3/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 25/08/2023 19:23, Konrad Dybcio wrote:
> SM6115 has a TX Macro, requiring an NPL clock, but not DCODEC.
> Document it.
> 

...

>  
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - qcom,sm6115-lpass-tx-macro
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 4
> +          maxItems: 4
> +        clock-names:
> +          items:
> +            - const: mclk
> +            - const: npl
> +            - const: dcodec
> +            - const: fsgen

Are you sure there is no macro? This means there will be no
LPASS_HW_MACRO_VOTE vote. Do you have downstream sources somewhere?

Best regards,
Krzysztof

