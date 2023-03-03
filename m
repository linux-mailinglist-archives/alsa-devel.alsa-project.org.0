Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 481836A94DD
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Mar 2023 11:10:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33E4586F;
	Fri,  3 Mar 2023 11:09:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33E4586F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677838219;
	bh=9Z2lqN5AlBZiuWn3mn+L8jhGBmqdcrgEIgbEVwPTxwg=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PEoIyiLPqyTta2TLXVM1I7DGvLsnzXHbVmEXMxdC214aqAMizsbNlnOQv6TYsF/oc
	 wkxi6aEVZATGDMGOMmduVj2xNIArm6WOaQrhO0fR+EtQfRQ0Xpt22r+uAxAQftnqRo
	 n8X7nORCz+EI/ncQzwHVm7NGiALiPJ7y9Ii8oVxo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9CACF8025A;
	Fri,  3 Mar 2023 11:09:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 964EDF80310; Fri,  3 Mar 2023 11:09:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 63FBDF800DF
	for <alsa-devel@alsa-project.org>; Fri,  3 Mar 2023 11:09:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63FBDF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=GDRKF4xL
Received: by mail-ed1-x52c.google.com with SMTP id a25so8398386edb.0
        for <alsa-devel@alsa-project.org>;
 Fri, 03 Mar 2023 02:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677838157;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fI5/Jh41zzz66+bX6TPVbQtVq4+vv/aKacxWrTWABSE=;
        b=GDRKF4xLTB19IREv6jG4HYZQ0ofjbXmSt9cp0hUeSzkffeEljgn0DuezlRwNSxvv0h
         vsvkgIH9DkVJBTEEM9XbulZhffMKFFota432hx6lQMB1DMjsESXujWd3ehi1K0lF5Q2+
         g4Lf+pwaNmhyxY3xlBdAUVKyx4D4An/79s9GTR2Lwc0IIJBiUkNLNPfKIWMugcnJHNPB
         O5yFGNO5VqxxftWzj0gAW+weu3TAsXvO4WE6URMTidh8+pKZVIDq0z1pvQdJuvn4EkGc
         BejAS25JdUJ+/3jLx/i/ElM9mqbXsLh9kp/XoWcrBPX5bmgDy/NWTt6WpB8ilyOeLJol
         dPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677838157;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fI5/Jh41zzz66+bX6TPVbQtVq4+vv/aKacxWrTWABSE=;
        b=AcXqaT9ILF6jiAUKN323E50wLj4ynHbte049H2BZbaH6OKG+0aOnn3NcWN4yV4jYmA
         AqIOsok6odaje+X6RjzJJlsuRxP/62LEOsMoovJ27ZksWS/7LN9X0UkiLtzlzMyXbkDm
         9MFl3NIO5/IvX7VX0S6sHs19eGNtUk0FJEElqyNMA8Zlh3XKHQPQL1cWvLHOtNQ0jtuI
         vqkgOkng3rmG/7SBxbz2MUbqbLkQ2/GEZMmbZSElJcTJrcmFTHPbg1zBVNq8g4PIhfoc
         UU7AJIIdzsCpK94UFpJ2eCwMXFPdIBeRM/lWPHWghJ/CC9Mpejh3z+sOqZs4zrmacGKy
         tKeQ==
X-Gm-Message-State: AO0yUKXnZPMCAZX/R8dN/aZUWZ17GKoKmKSbLplk9t4sAuomimebYQD0
	QDzUCpw4XOVG4jcncSUztHulFQ==
X-Google-Smtp-Source: 
 AK7set+lYy9fbQ5CtagXjbaTvZl/r3WY5kdiT+NQAjR24/Xnjs6G0dloTGXariMq8eLU9YUg4roYEQ==
X-Received: by 2002:aa7:c147:0:b0:4bd:e63c:d3be with SMTP id
 r7-20020aa7c147000000b004bde63cd3bemr1328940edp.20.1677838157226;
        Fri, 03 Mar 2023 02:09:17 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 c5-20020a056402120500b004c17977da1esm959561edw.8.2023.03.03.02.09.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 02:09:16 -0800 (PST)
Message-ID: <45d306d3-8efb-12ac-0a83-f01ca2982b0a@linaro.org>
Date: Fri, 3 Mar 2023 11:09:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/3] ASoC: dt-bindings: maxim,max9867: add clocks
 property
Content-Language: en-US
To: richard.leitner@linux.dev, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ladislav Michl <ladis@linux-mips.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Benjamin Bara <benjamin.bara@skidata.com>
References: <20230302-max9867-v2-0-fd2036d5e825@skidata.com>
 <20230302-max9867-v2-2-fd2036d5e825@skidata.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230302-max9867-v2-2-fd2036d5e825@skidata.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6YF7KA3CLYPSI2V6NDALLHWLDK4PTGER
X-Message-ID-Hash: 6YF7KA3CLYPSI2V6NDALLHWLDK4PTGER
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Benjamin Bara <bbara93@gmail.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Richard Leitner <richard.leitner@skidata.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6YF7KA3CLYPSI2V6NDALLHWLDK4PTGER/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 03/03/2023 11:04, richard.leitner@linux.dev wrote:
> From: Richard Leitner <richard.leitner@skidata.com>
> 
> Add clocks property to require a "mclk" definition for the
> maxim,max9867 codec.

But why? You just wrote what the patch does, which is easy to see.
Commit msgs should explain why you are doing something.

> 
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> ---
>  Documentation/devicetree/bindings/sound/maxim,max9867.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/maxim,max9867.yaml b/Documentation/devicetree/bindings/sound/maxim,max9867.yaml
> index 74cd163546ec..6f27029b137d 100644
> --- a/Documentation/devicetree/bindings/sound/maxim,max9867.yaml
> +++ b/Documentation/devicetree/bindings/sound/maxim,max9867.yaml
> @@ -35,9 +35,13 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  clocks:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> +  - clocks
>  
>  additionalProperties: false
>  
> @@ -50,6 +54,13 @@ examples:
>              compatible = "maxim,max9867";
>              #sound-dai-cells = <0>;
>              reg = <0x18>;
> +            clocks = <&codec_clk>;
>          };
>      };
> +
> +    codec_clk: clock {
> +        compatible = "fixed-clock";
> +        #clock-cells = <0>;
> +        clock-frequency = <12288000>;

Drop the node, it's entirely common/regular stuff.

Best regards,
Krzysztof

