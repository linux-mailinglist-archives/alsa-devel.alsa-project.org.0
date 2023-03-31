Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F066D1CE6
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Mar 2023 11:48:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E4C71FA;
	Fri, 31 Mar 2023 11:47:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E4C71FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680256104;
	bh=gXDQ9MeogvIvJCcIlMxTl/DF57chnfHCjwpAMUuQJ+8=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YLGlrEc1VTtHhOGByQuVXryLp99B2/xb7Ttip73Nxs8/+5FuavPhAVYarjKQvzB6K
	 +642PNkFk28Kp211AbojkQblIFo2n4GCSIn8cidCpuRfGzfj0XX0cAy591KIjOC4Ul
	 8R3CS0BUE68RfASrj97/a902NmMAc2RRQ3/k1sW8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 09371F8024E;
	Fri, 31 Mar 2023 11:47:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14292F80272; Fri, 31 Mar 2023 11:47:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CAE0AF80114
	for <alsa-devel@alsa-project.org>; Fri, 31 Mar 2023 11:47:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAE0AF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=HB+TVMnk
Received: by mail-lf1-x136.google.com with SMTP id bi9so28108456lfb.12
        for <alsa-devel@alsa-project.org>;
 Fri, 31 Mar 2023 02:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680256040;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hnzWIFD7E+b4S3TZGTfN6jfs1uPbhSQEaRByhI1df+M=;
        b=HB+TVMnkqvB7O0R3MzfOeH12788Pp02xIqytld9w5q6ehalIpUQ4NIGCs4FoPNwGtw
         KjINmDIkY//lZWKGXkAW/6HxoxXWdC32DM4f1uzIesFTa8YPI+RAC1d3WOQUbqGx7nDV
         lTespHeb2N2brtIIpdtHFxWZN2OOzGN+9/NRxQ+6sQoqnIOdTwI1GHdLu/mnJvAKyz/E
         RohbWhLih537gFmaFLGYdHiPsS3Jb5lI2sbUbhvksGpoVbf/QRJvjloZzTcOf2OT99fP
         OS0ixUMKhOi6tHVFED7+FBbzZG3nbCGdfiqHc8K+fc+DtV1WkjcoGRqILKWRvhz9pV62
         ZRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680256040;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hnzWIFD7E+b4S3TZGTfN6jfs1uPbhSQEaRByhI1df+M=;
        b=Pt8piHqOVqHToDE/1OChP3VvhaanW+BcFlPnv5GdK/UtcHBa5e2yDZWGOQn2ZyYCLR
         j1mhTMOEGZiYsqYW6m1fKb4XqbwuFhWPe9/7LnJktohfyQi4NMaDC75pf6HVisubZS95
         fu3IjMkZLl02W/xW+qKL0M+BGPRQ+qjZoho2NEUZhitJzWEugVJnbsD8OqpB8TVnFPlu
         a5tcOEXaagJILmHl/Rco7W7M6YMiQImwkTQaz4ww9my4s/TLYgXtS10P27fY4+WSnbuk
         w6Ai12uhg6O53u7v/zltluOwbiuZsRCDznHZLmqkeZ4G3vMZAVltY3GZp8VXWoSR7etp
         RPQg==
X-Gm-Message-State: AAQBX9fKknIcvRuNVGvh6XLSlfNBQeaqsCncQO0i4DtlaNpE4YlPyDtA
	mZRatEBBcMwsmZi8JK5odgUCvw==
X-Google-Smtp-Source: 
 AKy350axKhA1sEScCS2IqTPlAy7H3rF+ckndonIj5tM6RWPZCy4EAumflMTPJ5hdVeFx1W2N/KcT/A==
X-Received: by 2002:ac2:46e4:0:b0:4dd:995b:feaa with SMTP id
 q4-20020ac246e4000000b004dd995bfeaamr7880350lfo.24.1680256040470;
        Fri, 31 Mar 2023 02:47:20 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id
 c25-20020ac244b9000000b004e9c983a007sm309559lfm.289.2023.03.31.02.47.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 02:47:20 -0700 (PDT)
Message-ID: <304ce3f0-81df-327c-8b42-2471a3a51e43@linaro.org>
Date: Fri, 31 Mar 2023 11:47:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: maxim,max98371: Convert to DT schema
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Morishita?= <andremorishita@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 anish kumar <yesanishhere@gmail.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230331020527.482991-1-andremorishita@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331020527.482991-1-andremorishita@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QJQXDCLREYGWWGCTS3UPOE3SJTJ3YVZK
X-Message-ID-Hash: QJQXDCLREYGWWGCTS3UPOE3SJTJ3YVZK
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: mairacanal@riseup.net, dri-devel@lists.freedesktop.org,
 daniel.baluta@nxp.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QJQXDCLREYGWWGCTS3UPOE3SJTJ3YVZK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 31/03/2023 04:05, André Morishita wrote:
> Convert the Maxim Integrated MAX98371 audio codec bindings to DT schema.
> 
> Signed-off-by: André Morishita <andremorishita@gmail.com>
> ---

Thank you for your patch. There is something to discuss/improve.

> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        max98371: max98371@31 {

Generic node names, so: codec

And drop label (max98371:)

> +            compatible = "maxim,max98371";
> +            reg = <0x31>;

#sound-dai-cells = <0>;

> +        };
> +    };

Best regards,
Krzysztof

