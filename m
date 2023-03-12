Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D216B651F
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Mar 2023 11:53:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E8F51395;
	Sun, 12 Mar 2023 11:52:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E8F51395
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678618425;
	bh=iF6y7u3G46kdeHwrpdbLGLbHsLQL/4rvmvLo1AQlVK8=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X7DhWPvyUPjMkJO1ooKAXlrZdi7TH/fOcxPYeta74kvyasb/o5W30BG1y+W6AeaEX
	 MoQWmZnzcePoiqxRAg98vodqNSh5hR2xwAwGVWGkqhudg+9gMWWdzQ3bhsel0HVAQ4
	 A07YatinMJ/hVkq3G04AwGn2Bq2ViPn2VxNZQWH4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6D17F8032D;
	Sun, 12 Mar 2023 11:52:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3E2AF80425; Sun, 12 Mar 2023 11:52:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BE30FF80093
	for <alsa-devel@alsa-project.org>; Sun, 12 Mar 2023 11:52:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE30FF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=imGN+Rre
Received: by mail-ed1-x52e.google.com with SMTP id r15so10603708edq.11
        for <alsa-devel@alsa-project.org>;
 Sun, 12 Mar 2023 03:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678618366;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=900txtAGvWx9ztLyEjZvdDNUK0CxcxUZTDDXgC9Au6w=;
        b=imGN+RreuhMJyMiWZXtTpSUbiJNFwJzj7WGIKTLDcKt2Jo4IkBkC+H9FQme2lyOQGs
         HPJ0u+GOlH2fpnOl0aJOkBVlZMJ33YPlOyAWHk66CHl5UvLArNgm6+mK4OFa0YasW2PL
         SeIQTfJANrv8jFJfWLNMTrmkDwgFrZ5xneBdPcyEah52G/rRjB/hwze631eYaLzp69Gk
         gcBkd/li50Wx1+H+8NvcD7AwtQMovhclWGNDJz19fyZX/p0Ok0FyJXAfp9CkHdiZGuHI
         kFs3xLdOYvGigfXabJBcPB0bLB65S34H2pFQ+pXRhnOVCVGX/Octq/CoLhOiQMOB85aC
         CbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678618366;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=900txtAGvWx9ztLyEjZvdDNUK0CxcxUZTDDXgC9Au6w=;
        b=xKtRWoe6UWI1T+Oh1qn0hY+t0rxXDNBP1DXlKJIzIT4VF8tavh+2DtaLwnTNTumqjv
         8SOuWn1nr15VmSjfSnHdU9Ya0NbNseY9ujTkYUEvh7Oa4+CshXqACj0vpuBfOLszC+ze
         ujkR/T0M08vC7soUXH/Eg1clTaQ/8lcNIa0TyxznW9VXezwGXP6xHvd2qiKAp/tjZs/L
         lAXHKTWszTpcSNhSZQJDTGloTexFAuol3+iCDjKv8Q5PTOSzIP47Xi798Gd4Pff+ZPwR
         7FHPU7vmVusLhXXUXQJMGx3R1zEczI6LiG55k1QEl+eN9PhGA6Gn96J6aIcWLiQjA9xR
         VV/A==
X-Gm-Message-State: AO0yUKUD+0Y/I9daegghJTQZZuO1507jOiG7yxY7AKHWoaNwSj7tp/jt
	8QPKvhOH3RUXI8unupZmrqvIKw==
X-Google-Smtp-Source: 
 AK7set8Cl50YNvkkPM5DP76bG9jwBHrwRy9KsxnOQ4CyZU0Kck9F72SYJrEJu0OOwnM/i28qA8zdtw==
X-Received: by 2002:a05:6402:204a:b0:4c1:d49:3ecc with SMTP id
 bc10-20020a056402204a00b004c10d493eccmr28765808edb.29.1678618365859;
        Sun, 12 Mar 2023 03:52:45 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d9f6:3e61:beeb:295a?
 ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id
 s2-20020a50ab02000000b004fa012332ecsm1849637edc.1.2023.03.12.03.52.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 03:52:45 -0700 (PDT)
Message-ID: <fa6bfc86-23a7-0a2c-8819-ca76d1086238@linaro.org>
Date: Sun, 12 Mar 2023 11:52:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH] ASoC: dt-bindings: adi,adau17x1: Convert to DT schema
Content-Language: en-US
To: Vijaya Anand <sunrockers8@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230311200305.82087-1-sunrockers8@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230311200305.82087-1-sunrockers8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ERNLLBH6YW7F24OXTBDW2NLY4IBOOA6H
X-Message-ID-Hash: ERNLLBH6YW7F24OXTBDW2NLY4IBOOA6H
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Daniel Baluta <daniel.baluta@nxp.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ERNLLBH6YW7F24OXTBDW2NLY4IBOOA6H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11/03/2023 21:03, Vijaya Anand wrote:
> Convert the binding document for adi,adau17x1 from txt to yaml
> so one could validate dt-entries correctly and any future additions
> can go into yaml format. Add address and size cells to example to
> prevent errors regarding reg format.
> 
> Signed-off-by: Vijaya Anand <sunrockers8@gmail.com>
> Cc: Daniel Baluta <daniel.baluta@nxp.com>

Thank you for your patch. There is something to discuss/improve.

> -Examples:
> -#include <dt-bindings/sound/adau17x1.h>
> -
> -	i2c_bus {
> -		adau1361@38 {
> -			compatible = "adi,adau1761";
> -			reg = <0x38>;
> -
> -			clock-names = "mclk";
> -			clocks = <&audio_clock>;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/sound/adi,adau17x1.yaml b/Documentation/devicetree/bindings/sound/adi,adau17x1.yaml
> new file mode 100644
> index 000000000000..9c1dbf2b4e70
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/adi,adau17x1.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/adi,adau17x1.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices ADAU1361/ADAU1461/ADAU1761/ADAU1961/ADAU1381/ADAU1781

But what is this? Codec? Amplifier?

> +
> +maintainers:
> +  - Lars-Peter Clausen <lars@metafoo.de>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,adau1361
> +      - adi,adau1461
> +      - adi,adau1761
> +      - adi,adau1961
> +      - adi,adau1381
> +      - adi,adau1781

Please put them in some order, e.g. alphabetical.

> +
> +  reg:
> +    maxItems: 1
> +    description: The i2c address. Value depends on the state of ADDR0 and ADDR1, as wired in hardware.

This exceeds 80 characters (see coding style).

> +
> +  clock-names:
> +    const: mclk
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      phandle + clock-specifiers for the clock that provides the audio master
> +      clock for the device.

Drop "phandle + clock-specifiers for the " and make it simpler, just
items with description:

clocks
  items:
    - description: .......


> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false

Instead:
additionalProperties: false
Unless you plan to reference dai-common or component-common

> +
> +examples:
> +  - |
> +    i2c_bus {

i2c

> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      adau1361@38 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +        compatible = "adi,adau1761";
> +        reg = <0x38>;
> +        clock-names = "mclk";
> +        clocks = <&audio_clock>;


Best regards,
Krzysztof

