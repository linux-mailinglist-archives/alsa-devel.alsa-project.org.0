Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE496EAF6D
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 18:44:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 667AFE94;
	Fri, 21 Apr 2023 18:43:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 667AFE94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682095487;
	bh=WpiK4iyXG20xYpBo6dJzQqOj3/CXeK6If41UpVrsNzY=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SB7HiOy2o2Pd0TNn73ntuSLoB6b7zTzfv5H3IC+RBOwFN8j0NcwCJ/U3bV/e8+k0V
	 N4E6WgAm4KYmCQHoRgrgeBWvmLEDRifyApWGGuIsvp7fb7WfMM7mGbIdiVQI8ZIC1L
	 BlIqzPAw2WizUc5ti8T9REFmGC3UTq1zidBHLN2g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA4DDF80149;
	Fri, 21 Apr 2023 18:43:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0999F80155; Fri, 21 Apr 2023 18:43:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5471F80053
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 18:43:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5471F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=lBQgSPyC
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-504eccc8fc8so2703233a12.2
        for <alsa-devel@alsa-project.org>;
 Fri, 21 Apr 2023 09:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682095429; x=1684687429;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sIuJOr9KDqgRyNZKu6Tt8XNVFok6Ecpq3eqDXh3VdVw=;
        b=lBQgSPyCip8rYuFpD+Us5fMponEiWICDi4kBwWqP5Gu6VnZDpRxF90JVMutN889EKh
         BklKXuWF0K0mMfc8jCX0zhVJHYmQ+OgHRfrDSwZnXv7BwbkN9TkrGVS+6VLWtIftCalK
         24g4MpMs+/2fwlJ5QYO+dTLQFWz9aW1Ma200XNRjpdyriDrKqyP6AguuNqgJrIXFFmAr
         Zo/Hx+b4IfPpjTKYCqYBPhgDzx6NDyCLPKbm0LnfGvwwyBbTRnhH+1TYmJa7Ffd4xug2
         INwJ+T5PyDE3ETo4Wy3lM7AJjxq5t3KThmm+D580q14eObdPzLZku1G2h6G6rH6Q1KAO
         bzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682095429; x=1684687429;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sIuJOr9KDqgRyNZKu6Tt8XNVFok6Ecpq3eqDXh3VdVw=;
        b=FYxj+mc2oHJ4C6XTLd2SR1lp2txEBMLyj9bm3qFeZiBziuII0qlyczxkWNOPXdh9tV
         q+XG5wZ1EsqUKdqSs+Kulil4XMdN69zNEdHgv44CY3gegqewVg0dDEp/eJshavZ6IH46
         RCboGfHIeoc0yUbJ/kzA5S2dFEUeuekOZ6JKNP/hD6VYlV/xwk8gxEgDKUUcEqchyJIr
         w87MFW3S10PGkwArwwCYPJPA4UXHaDeBimwIeYcP+bS1ylFSdi2rbf52WdnWA3Qum57x
         DWJ/1nOgCYqeelsSffNVQeD1c8NLnVmuxSrLFblaW41eSu9lNXAsGzIREcJO8xdE96w6
         kEgw==
X-Gm-Message-State: AAQBX9fP6ou6elhiAkKf78INsnJ/UXskuY/4o4KZvylFhYBGgdvS02lR
	dPT8ZHgOTXNdS/EEepuxNM5WZA==
X-Google-Smtp-Source: 
 AKy350Z9W1Awuyb/afDJDAwM+gnsZX1x4JGUQFrDP8K1cSk1huw1//Tq6t/V1q559iCtPTZ58No0sA==
X-Received: by 2002:a17:907:e92:b0:94a:4d06:3de3 with SMTP id
 ho18-20020a1709070e9200b0094a4d063de3mr3205814ejc.72.1682095428846;
        Fri, 21 Apr 2023 09:43:48 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:687d:8c5:41cb:9883?
 ([2a02:810d:15c0:828:687d:8c5:41cb:9883])
        by smtp.gmail.com with ESMTPSA id
 t18-20020a17090616d200b0094f969e877bsm2242742ejd.43.2023.04.21.09.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 09:43:48 -0700 (PDT)
Message-ID: <5e622e88-5287-1ffc-aa9b-c7c85a661fd9@linaro.org>
Date: Fri, 21 Apr 2023 18:43:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 7/7] ASoC: dt-bindings: mediatek,mt8188-afe: add audio
 properties
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
References: <20230421100905.28045-1-trevor.wu@mediatek.com>
 <20230421100905.28045-8-trevor.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230421100905.28045-8-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 54RU7FJE337EAHCVKMW3JRTXI2JPRUPM
X-Message-ID-Hash: 54RU7FJE337EAHCVKMW3JRTXI2JPRUPM
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/54RU7FJE337EAHCVKMW3JRTXI2JPRUPM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 21/04/2023 12:09, Trevor Wu wrote:
> Assign top_a1sys_hp clock to 26M, and add apll1_d4 to clocks for switching
> the parent of top_a1sys_hp dynamically
> On the other hand, "mediatek,infracfg" is included for bus protection.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../bindings/sound/mediatek,mt8188-afe.yaml      | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
> index 82ccb32f08f2..812e0702ca36 100644
> --- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
> @@ -29,6 +29,10 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: The phandle of the mediatek topckgen controller
>  
> +  mediatek,infracfg:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of the mediatek infracfg controller
> +
>    power-domains:
>      maxItems: 1
>  
> @@ -52,6 +56,7 @@ properties:
>        - description: mux for i2si1_mck
>        - description: mux for i2si2_mck
>        - description: audio 26m clock
> +      - description: audio pll1 divide 4
>  
>    clock-names:
>      items:
> @@ -73,6 +78,7 @@ properties:
>        - const: i2si1_m_sel
>        - const: i2si2_m_sel
>        - const: adsp_audio_26m
> +      - const: apll1_d4
>  
>    mediatek,etdm-in1-cowork-source:
>      $ref: /schemas/types.yaml#/definitions/uint32
> @@ -147,6 +153,8 @@ required:
>    - power-domains
>    - clocks
>    - clock-names
> +  - assigned-clocks
> +  - assigned-clock-parents

You were explaining it last time, but it did not solve my concerns.
Requiring these properties means that your hardware boots with incorrect
clock parents, including result of any firmware, and there is no way it
can correctly work without reparenting. What's more, this means that
your clock hierarchy does not include these clocks for some reason, e.g.
you need to reparent parents of some parent of your clock input,
otherwise device cannot work. Cannot work never ever.

Is this the case?

Have in mind that bindings are used also by other OS and projects, like
bootloaders, firmware etc.

Best regards,
Krzysztof

