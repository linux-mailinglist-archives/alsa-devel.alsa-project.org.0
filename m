Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A73DD6A838E
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Mar 2023 14:32:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEEF31FA;
	Thu,  2 Mar 2023 14:31:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEEF31FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677763941;
	bh=6fvP0YXVHHdv44seiWSe2lr77Ch2NhJ57kPQ/N6fBHg=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e10tZMJ4FzNxhqdCS9xd2s4ZrxhRxvKyPzCxJUcQoUYhp/ztH6/luoRFJSc5SUuu0
	 v+ZzHzOeBPfgw2Z++Yw5sqIrpGgc1FkIQfkpLuPNr8lmbyd4tXICm4UeNu4HbruoKk
	 xKdM/0xtZERnSHBYCmvE5wQ5x283h0PWznTrOJuw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8822F8025A;
	Thu,  2 Mar 2023 14:31:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07879F80266; Thu,  2 Mar 2023 14:31:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7456F800DF
	for <alsa-devel@alsa-project.org>; Thu,  2 Mar 2023 14:31:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7456F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=utx+Op5v
Received: by mail-ed1-x532.google.com with SMTP id a25so5126727edb.0
        for <alsa-devel@alsa-project.org>;
 Thu, 02 Mar 2023 05:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677763876;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JdSCIoGvZ8uawhCoN7CRlx74tUl0hbvAdJs1DSiOHBg=;
        b=utx+Op5vksoVqBv69RebrEF+WTiUWv5PUeEa5Wiythe3tNiIee0EtMhHFsACSyoRpe
         R+gjYyABRTXCMN7JZ9mJn1fF8or5JAQBJIuCqUWc+ELSy2mn+YStPrzKi6C97ljMUlYd
         NI+Wc/pcv8gisPQwQmah+tBbPz4u/95/q6o17agSHWKuHrWli8QscsTg209m5ANEd84S
         Ja+2EylmZ0AzbyC4J51mWpwsfAKTXB4vdtM7Rkhv9dn2sdfHvJgoo5yxKA5lMDJ1eYMe
         iqexrSHRE6NJyEZmLEtTTYlzf7FkURRopOb1/PHUNej5ScwY2ID3VoJV35yWZkTg2uK7
         C/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677763876;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JdSCIoGvZ8uawhCoN7CRlx74tUl0hbvAdJs1DSiOHBg=;
        b=uWZLGuVrqCSfvfecSiWFBRIndHzYm/R+NFgQbPNzR7k1zr/geue9FZfm0moYBgotO3
         Bnsl5shJaJ1g0JZLTg10NtuVBjob+MOl9BDMoavvwaxPw13AFVerst73YRujQUKW1JRi
         M8zWhZg1H6TTHfD9MKGJOTy/YonBJygwPmoPda5SuSnw9TVhGHN7jXF2n//JW0ijsbWf
         5FgqgJ1aV6Rfncl+5Su9t0mQQsEtL7PDGjZ5RBTa6XGE7BeKd9l41WWYQfcUKSo2FsPl
         o8BWdZJTr15Z1kVXE5uDCWcnf+iJ/LTmzKS4TbZ+qk9G6YaooupFzjBV5Nj3lwNqSS8S
         dXNQ==
X-Gm-Message-State: AO0yUKXDOCq8u1FnEZR0Eio9VYdO/doxlcE8TaHgukaoqy06d4/3mt2i
	Pxq5p0BWsAZO7hmYzqaFrVmyNw==
X-Google-Smtp-Source: 
 AK7set+2aK3lx5BxQFRboIYFX6J8/gU0ACeShJ21COKRBvUNuJaCQTn8BQJ7PSol6yRlSmxQTp4b1A==
X-Received: by 2002:aa7:cb83:0:b0:4af:64b8:262e with SMTP id
 r3-20020aa7cb83000000b004af64b8262emr11220297edt.6.1677763876250;
        Thu, 02 Mar 2023 05:31:16 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 jl9-20020a17090775c900b008b17de96f00sm7065387ejc.151.2023.03.02.05.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 05:31:15 -0800 (PST)
Message-ID: <27aa0b4a-14fc-5fce-ab49-a8744b131882@linaro.org>
Date: Thu, 2 Mar 2023 14:31:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: maxim,max9867: convert txt
 bindings to yaml
Content-Language: en-US
To: richard.leitner@linux.dev, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ladislav Michl <ladis@linux-mips.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Benjamin Bara <benjamin.bara@skidata.com>
References: <20230302-max9867-v1-0-aa9f7f25db5e@skidata.com>
 <20230302-max9867-v1-1-aa9f7f25db5e@skidata.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230302-max9867-v1-1-aa9f7f25db5e@skidata.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: X527RTQPYDGIICV6ERH6A6LVT4QWDFTE
X-Message-ID-Hash: X527RTQPYDGIICV6ERH6A6LVT4QWDFTE
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Richard Leitner <richard.leitner@skidata.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X527RTQPYDGIICV6ERH6A6LVT4QWDFTE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 02/03/2023 12:55, richard.leitner@linux.dev wrote:
> From: Richard Leitner <richard.leitner@skidata.com>
> 
> Convert from max9867.txt to maxim,max9867.yaml and add missing
> '#sound-dai-cells' property.

Thank you for your patch. There is something to discuss/improve.

Except wrong ID (and missing test):

> +
> +examples:
> +  - |
> +    &i2c {
> +            max9867: max9867@18 {

Generic node names, so "codec" and drop the unused label.

Use 4 spaces for example indentation.

> +                    compatible = "maxim,max9867";
> +                    #sound-dai-cells = <0>;
> +                    reg = <0x18>;

Best regards,
Krzysztof

