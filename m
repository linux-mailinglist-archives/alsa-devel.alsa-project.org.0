Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE787686EC
	for <lists+alsa-devel@lfdr.de>; Sun, 30 Jul 2023 19:56:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDD01827;
	Sun, 30 Jul 2023 19:55:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDD01827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690739761;
	bh=750oJ2P+yYUlPVA1010tF5T1woaedYv0DopTLIEhLAs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g6TMz3N6CgKBCu3qZ1imDhKxg8T50mnwQSBtIFhZsLdSIsdryh9Y29FLlY8eXeEqO
	 MSuhofK2z77rQuU5Y/kYhL9JmictxShYZafNMXfY4yMkhvfm/ocbIYAd0DbtejvzBY
	 GhETvklqyvxT7BtfcrqMJnJyIjysEQXjYnvdjXpI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0802F80087; Sun, 30 Jul 2023 19:55:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18C6FF80163;
	Sun, 30 Jul 2023 19:55:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72C36F8016D; Sun, 30 Jul 2023 19:55:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 85DFAF80087
	for <alsa-devel@alsa-project.org>; Sun, 30 Jul 2023 19:54:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85DFAF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=P6jbYQ5c
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-99bed101b70so415749366b.3
        for <alsa-devel@alsa-project.org>;
 Sun, 30 Jul 2023 10:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690739691; x=1691344491;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mbjS6TBC9NtU6oekBePBL31Nw/0x/d6yu4TOb6mnKIY=;
        b=P6jbYQ5csvD+4BbInxE1FPGjPTs2AnewX7WnsbjMJJTq1EGfetuG3xSy0ZMuXtqCJ3
         o9AoI1/Lw/WQKNpVpn6emK3roLzIW+M7xKJ5eBsnY93SBI0uUd2XF2jERi7d5g9NdzzF
         KbHkXXv8jBA5YtV/6F2dpt6+44XF/NjeovU8WmQqfZ1LnjvBORzorbZoI4SvePFazmMV
         WbG9QJ5j4f6RIz0GG0k285iwJDjNxAKLEolpuk9RD+r0d6Y7U6wmLc5PBPizOp+SkLCc
         CjuOvYnzSY5xhj1flC3DiycTNUatTKTkPYl34xm6+SmW8rO4K/jdz09gOQIZMdKX/NLd
         eSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690739691; x=1691344491;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mbjS6TBC9NtU6oekBePBL31Nw/0x/d6yu4TOb6mnKIY=;
        b=fhxEe4FgdCrbV3wGyrPIxjzSjbgERaAdzAQ+K7H4eS+Gt9BJU8mlQZiLr/PxuhYz+Z
         KJhkO71RRXsGgaeeEtQ+5+mGSSGNTMUIT1J4wNoK8/RedlGBnWo/zAJGuOn38FyExV0V
         YBdVoIPqle9MTHKcbztF1fCZVv6BQDSP2uit7uzifS3Avhtmo52dp+rvUwTFjn9aeU87
         KD9zci0Fhd2nn731C+fBBAtPjhC15ZnPerJp0CpZmWRKPUFePtnQfZuXpdEGqFvDq6+Z
         +VTYaqBbtYlxuW3lH0485jkqxGJil3Rkn0hPBdoK8G9KIXxbII3t/tmlcDonC9Ag9iVj
         l6cw==
X-Gm-Message-State: ABy/qLYxb3Nd6PJ5XTTuiNGASCEOlIZfd3coGdoQrcFSiIW+yYV6lxX/
	/p8qa8/IQ1U47phZyKDlgNRrgA==
X-Google-Smtp-Source: 
 APBJJlGKotrJF4ynR3yW3bafZKtRVjvSfy65pHmi1rA3GyhmcmsJZikumlPXSdF9eBN8iCEA/B9qfA==
X-Received: by 2002:a17:907:7711:b0:99b:d1cb:5add with SMTP id
 kw17-20020a170907771100b0099bd1cb5addmr5645098ejc.35.1690739691213;
        Sun, 30 Jul 2023 10:54:51 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id
 t7-20020a1709063e4700b0098d15d170a0sm4875349eji.202.2023.07.30.10.54.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Jul 2023 10:54:50 -0700 (PDT)
Message-ID: <acd8e4ea-0d8f-3dc2-16ef-4c1deee281d8@linaro.org>
Date: Sun, 30 Jul 2023 19:54:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH RESEND v2] dt-bindings: sound: gtm601: convert to YAML
Content-Language: en-US
To: David Heidelberg <david@ixit.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, - <kernel@puri.sm>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230730115150.38887-1-david@ixit.cz>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230730115150.38887-1-david@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: IHS3CZFQURXBI7ZTZR6NLCJGMR6W6PHG
X-Message-ID-Hash: IHS3CZFQURXBI7ZTZR6NLCJGMR6W6PHG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IHS3CZFQURXBI7ZTZR6NLCJGMR6W6PHG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 30/07/2023 13:51, David Heidelberg wrote:
> Convert GTM601 binding to the YAML format.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> 

No need for blank line between tags.

> Cc: kernel@puri.sm
> ---
> v2:
>  - add #sound-dai-cells
>  - put kernel@puri.sm into maintainers
> 
>  .../devicetree/bindings/sound/gtm601.txt      | 19 ----------
>  .../devicetree/bindings/sound/gtm601.yaml     | 36 +++++++++++++++++++

Filename like compatible, please, so option,gtm601.yaml

>  2 files changed, 36 insertions(+), 19 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/gtm601.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/gtm601.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/gtm601.txt b/Documentation/devicetree/bindings/sound/gtm601.txt
> deleted file mode 100644
> index efa32a486c4a..000000000000
> --- a/Documentation/devicetree/bindings/sound/gtm601.txt
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -GTM601 UMTS modem audio interface CODEC
> -
> -This device has no configuration interface. The sample rate and channels are
> -based on the compatible string
> -	"option,gtm601" = 8kHz mono
> -	"broadmobi,bm818" = 48KHz stereo
> -
> -Required properties:
> -
> -  - compatible : one of
> -	"option,gtm601"
> -	"broadmobi,bm818"
> -
> -
> -Example:
> -
> -codec: gtm601_codec {
> -	compatible = "option,gtm601";
> -};
> diff --git a/Documentation/devicetree/bindings/sound/gtm601.yaml b/Documentation/devicetree/bindings/sound/gtm601.yaml
> new file mode 100644
> index 000000000000..e81a6aa75522
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/gtm601.yaml
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/gtm601.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GTM601 UMTS modem audio interface CODEC
> +
> +maintainers:
> +  - kernel@puri.sm
> +
> +description: >
> +  This device has no configuration interface. The sample rate and channels are
> +  based on the compatible string
> +

Missing $ref to dai-common.yaml

> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: broadmobi,bm818
> +          - const: option,gtm601
> +      - items:

No "items" needed here, just use enum.

> +          - enum:
> +              - broadmobi,bm818  # 48 kHz stereo
> +              - option,gtm601  # 8 kHz mono

This does not make much sense. bm818 is either compatible with gtm601 or
is not. Cannot be both.

> +
> +  '#sound-dai-cells':
> +    const: 0
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gtm601_codec {

No underscores, generic names, so "codec" or "audio-codec".

> +        compatible = "option,gtm601";

Add dai cells also to the example to make it complete.

> +    };

Best regards,
Krzysztof

