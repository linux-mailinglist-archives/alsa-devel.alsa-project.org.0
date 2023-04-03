Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A916D44EC
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 14:53:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B98CF6C0;
	Mon,  3 Apr 2023 14:52:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B98CF6C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680526384;
	bh=nHI8F0FIJwR3RnOpgrrxhzfJ73MZZYyje0ED/1VxtBg=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nQ5peu0PwyAl4F8EReLDhTM8RshHGWgkqec0TxNCe2E7NCIxEZI5k3pdmRayAg3K2
	 /6YQ8ZWskr+rFEb0HRi9Ij64+H6QVK7BjNcenLVclf+pO3ZXayXqMwwPLi+tUfUIFB
	 6rlAdeuhxoEyXpXYt2ZwoCzJk4BQQspeQromBH0M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 973A1F8052D;
	Mon,  3 Apr 2023 14:51:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93F63F8052E; Mon,  3 Apr 2023 14:51:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0C1AF8028B
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 14:51:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0C1AF8028B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZgDUT7kA
Received: by mail-ed1-x52e.google.com with SMTP id x3so116794581edb.10
        for <alsa-devel@alsa-project.org>;
 Mon, 03 Apr 2023 05:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680526280;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hBlBY9aCp2fwzyEA3oA1ESp/NxFfdWBUjHz7ismdq/M=;
        b=ZgDUT7kABXnlv7ZQy4O22yoBe5x0gdxIJSPzzUUMzlIO5weoHEy2JCOq5RW2GY5rbq
         5asiMAUFK8koBo2l1hA312FmopSKyS7g5ZyXWL6olYKt9ZhyzYRvUsMFwKcNWkfQuSHv
         8z2k+U3SIQiKC4viWXe1fDRNbOkwQMpew12eeiUQh944BJlypM6VsggRjGZERoQg2mUo
         AdxZf/G1WNImdAEtsy4nPnkVH4j+eOaLhR5km+LMMoeSABMjdKxt8x85oAAVq08zGJZL
         v4NmXtYZiJIQMrTP3jrj28JF/FfH+xWjZDgMDeLtBVbcO8W0p20iylXL2ru3Ry3/hC1k
         CxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680526280;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hBlBY9aCp2fwzyEA3oA1ESp/NxFfdWBUjHz7ismdq/M=;
        b=uZAun26p1VL/DkIJVre8tLG1DnaxCRYGNxjJwGS+B3weI7tcs2/xrhkc6t9Qi8eqkN
         Q0OQJiCTnrS0Ks6M/uDvQvi+sRK6c+9swT8BXFwZkfJ/T/4BFpI+nS3r3RXfmlZ6b7vV
         l0plEbkMpe/2WVV9DKWncEG1WFcesy2p+h7IpVjPHxac1buYpwzlHCWaQIZOH7RrvLtY
         ftvmQwB+etywlE/QvVPvaqIBehrqPdLBzdfeG8061kEukPLuPmUtylplhoT3mjgH9Z7T
         R2Hnz5iDBSTCLrOl7Wrle/ZNyHO3r95uTOlSQ4vhoW1S5EFwwXZ7Vhq+PPiM9v0cowG6
         2k8g==
X-Gm-Message-State: AAQBX9f8RFAmRMBZCxq4gMWxvtFeZIhFUCaTffG7k3bWByGh9xvzTT3D
	mEROqOs7XUxd3tAf97KpEz8Kvg==
X-Google-Smtp-Source: 
 AKy350bf4uQa4MoKau0zxjWPD5Tb7xiBU+NP/AwFSxCBzCP0E607DlXYpS/wBX3Q3Wt3HJlCE2oxtg==
X-Received: by 2002:aa7:c98b:0:b0:4cd:e84d:1e74 with SMTP id
 c11-20020aa7c98b000000b004cde84d1e74mr39732285edt.0.1680526279821;
        Mon, 03 Apr 2023 05:51:19 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ae90:d80:1069:4805?
 ([2a02:810d:15c0:828:ae90:d80:1069:4805])
        by smtp.gmail.com with ESMTPSA id
 n19-20020a509353000000b004c09527d62dsm4621217eda.30.2023.04.03.05.51.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 05:51:19 -0700 (PDT)
Message-ID: <d6b4df41-02cb-b900-5e8b-8ad08d3d36f1@linaro.org>
Date: Mon, 3 Apr 2023 14:51:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] ASoC: dt-bindings: wm8510: Convert to dtschema
Content-Language: en-US
To: Saalim Quadri <danascape@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 daniel.baluta@nxp.com
References: <20230403105237.3854-1-danascape@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230403105237.3854-1-danascape@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: JAKWGL3TKAC6JTODOVIFZ3DSKKAVVJIB
X-Message-ID-Hash: JAKWGL3TKAC6JTODOVIFZ3DSKKAVVJIB
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JAKWGL3TKAC6JTODOVIFZ3DSKKAVVJIB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 03/04/2023 12:52, Saalim Quadri wrote:
> Convert the WM8510 audio CODEC bindings to DT schema
> 
> Signed-off-by: Saalim Quadri <danascape@gmail.com>
> ---
> Changes:
> V1 - V2: Fixup issues mentioned by Krzysztof

So what changed?

>          Add SPI and I2C examples

Why?

> 
>  .../devicetree/bindings/sound/wlf,wm8510.yaml | 52 +++++++++++++++++++
>  .../devicetree/bindings/sound/wm8510.txt      | 18 -------
>  2 files changed, 52 insertions(+), 18 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8510.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/wm8510.txt
> 
> diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8510.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8510.yaml
> new file mode 100644
> index 000000000000..418a82f65531
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/wlf,wm8510.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/wlf,wm8510.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: WM8510 audio CODEC
> +
> +maintainers:
> +  - patches@opensource.cirrus.com
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: wlf,wm8510
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        
> +        codec@0 {
> +            compatible = "wlf,wm8510";
> +            reg = <0>;
> +        };
> +    };
> +
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        codec@1a {

Drop second example. It is the same.


Best regards,
Krzysztof

