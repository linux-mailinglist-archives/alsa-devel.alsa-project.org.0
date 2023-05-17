Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3CE706B7B
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 16:44:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D7AB1F4;
	Wed, 17 May 2023 16:43:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D7AB1F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684334658;
	bh=uhEj7fwCjfn48J+3yIQTfjtNG7M3jLn+hzZuB06N7KY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z7qcMKIgYCwpJUhtmuBvyCOivt/Db6qZla1S5RtBZZhVgYoquAvPpCwc/ZJYe/NQt
	 NBshBn63sa47XFYDqkO45DZ7g2Eu9RwTjVZo+oN+3zKgmiV4YudAMDv4pGGUNTcx7W
	 bp1e1qQHbjHtgSQCiYl3ivLev9PuURmm9+qZgESU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54B5CF8016D; Wed, 17 May 2023 16:43:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2078FF8025A;
	Wed, 17 May 2023 16:43:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A615F80272; Wed, 17 May 2023 16:43:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 14D7CF8016D
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 16:43:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14D7CF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=iNuaz3gE
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-510c734fa2dso163693a12.0
        for <alsa-devel@alsa-project.org>;
 Wed, 17 May 2023 07:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684334598; x=1686926598;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sZDD8upL/r+70rB2Afo4JoGPTnaEzVx0dEl4DiVOMWg=;
        b=iNuaz3gEZr/wsvXC1ba0asKS7gklttvKStIfxh8Qs0kkWE3Xjo04RWBvjg6nqKnxum
         6EJGM+jO4EYfehiDb2qqtu28a44G8ZeBvpm4tUWfcRSn3jz0LBbMbDfHfVT5H8fCEdgF
         0D1HaKoNJH++dItJPrhVhXCFjDpK0KmoqYMseXiRJb87xTuvAkJJDLN79nts5Lv+0lmd
         zCKooCbbXsLWVUal+iKWTLGxM170+hF6tYOTeDDSKR1M9Tz9IyYTHXkFaBuRp/3fSVfR
         ex/6uvzXapEoaRnwSrtqW2tiL/rK04iFNHTDR5zQ7F+XkdawN39mbfDrYDG1IG29PtSy
         jMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684334598; x=1686926598;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sZDD8upL/r+70rB2Afo4JoGPTnaEzVx0dEl4DiVOMWg=;
        b=GH2V10bR0piUzc7qhU62SOpZ3/pWWp9uNQmRtbksE9YXpVefiGnJSqn4OZa4sh5E31
         sw2hrBj0dSQ3Ju/hrCnDcYR7hZNfaQsziq3+Y3Es73jcO0kvis264tGZg7TzEQt32eNB
         /4RtPJ28B1PZbTFbDbkq4wJf7/0sp4VYVy66G9dhpbZDoesNWM91qy3fRQmhMwso6aQX
         LA4H5azsZE0xNBlYjB6OZMlhaXYCS3iTNrtAwTHNNUmksQuQc3TggRVfM4m3wg7lSX2m
         Ruk/RGLLVTdfwQtLKEwRmbVMQ2h+hVHLvIQ/6c+jgE+xbHOKWE11mREm5uEfiDjiAKnu
         WOrw==
X-Gm-Message-State: AC+VfDzK1+13jEFogebc406hfQO6gU19zaj6bcurfFwos4Dm/kSdyusx
	zdM1ilMCvEG9LBDIfmSUxwomAw==
X-Google-Smtp-Source: 
 ACHHUZ4pYGjUVHIDzMVTFst1m4oKVnYh+z4Oa96EfEfP7Ed4lZHoKUEAgAScE6sd3/3n9e6WGRNDjg==
X-Received: by 2002:a05:6402:1e90:b0:506:72f8:eb10 with SMTP id
 f16-20020a0564021e9000b0050672f8eb10mr2673049edf.0.1684334597785;
        Wed, 17 May 2023 07:43:17 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c9ff:4c84:dd21:568d?
 ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id
 x14-20020aa7d38e000000b0050c0d651fb1sm9423734edq.75.2023.05.17.07.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 07:43:17 -0700 (PDT)
Message-ID: <9359c081-cd36-3e5b-a113-7600b4ba435e@linaro.org>
Date: Wed, 17 May 2023 16:43:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 5/5] ASoC: dt-bindings: mediatek,mt8188-mt6359: update
 properties
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230517111534.32630-1-trevor.wu@mediatek.com>
 <20230517111534.32630-6-trevor.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230517111534.32630-6-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2GO4NQ3OYMY5C2OR6HFQXMNPJSVISH5V
X-Message-ID-Hash: 2GO4NQ3OYMY5C2OR6HFQXMNPJSVISH5V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2GO4NQ3OYMY5C2OR6HFQXMNPJSVISH5V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 17/05/2023 13:15, Trevor Wu wrote:
> Add compatible string "mediatek,mt8188-nau8825" to support new board
> with nau8825 codec.

Subject: everything can be update of properties. Rephrase to focus on
actual change, e.g. on adding NAU8825.

> 
> ADDA_BE is used to connect to mt6359. For the machine, it must be
> fixed to the same codec and configured on the machine driver. Remove
> ADDA_BE from items of link-name.

I don't understand the justification for this. If this is not a correct
link name for MT6359 setup, then it should be removed in its own patch.
If this is removed because of adding NAU8825, then why does it affect
MT6359?

> 
> Introduce two properties "dai-format" and "mediatek,clk-provider" under
> dai-link subnode to configure dai-link parameters via dts.
> 
> "codec" property is removed from required property of dai-link subnode.
> For co-clock case, it's possible two dai-links should be configured to
> the same format, but only one dai-link builds link with codec.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../sound/mediatek,mt8188-mt6359.yaml         | 27 ++++++++++++++++---
>  1 file changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> index 6640272b3f4f..05e532b5d50a 100644
> --- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> @@ -11,7 +11,9 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: mediatek,mt8188-mt6359-evb
> +    enum:
> +      - mediatek,mt8188-mt6359-evb
> +      - mediatek,mt8188-nau8825
>  
>    model:
>      $ref: /schemas/types.yaml#/definitions/string
> @@ -42,7 +44,6 @@ patternProperties:
>            we are going to update parameters in this node.
>          items:
>            enum:
> -            - ADDA_BE


Best regards,
Krzysztof

