Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 153416FF14E
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 14:13:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC35EAE8;
	Thu, 11 May 2023 14:13:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC35EAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683807237;
	bh=uHpbC3NH6ypmvkXVOT4PsWxppRWo6KlM64PV1Oba9AE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CsWskGXDnaA5FDEXIzZZWB0UULazY58sS7D5sR43OyoFcj5qftqn+n/5stb8QiXe+
	 akj5FzKUz1wHWO+weSmGirXDjhvqWPqT+sNGqg659Tnl92JxZNZO1ApMvoZgL0QVum
	 oJfxCsILclhLqG8ZWldKrY++dTLBDy/3HRgd+wvc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36A78F80310;
	Thu, 11 May 2023 14:13:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07122F8032D; Thu, 11 May 2023 14:13:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EBB33F800BF
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 14:12:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBB33F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=snYELACV
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-50bd37ca954so78777500a12.0
        for <alsa-devel@alsa-project.org>;
 Thu, 11 May 2023 05:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683807173; x=1686399173;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tB8VwLerz7SQw/zMMp6ik+O7rtVUE8N1DQUQCASDLmM=;
        b=snYELACVimlh2Z/HUh4yflU/2Gf9A9sjbYv5S5JIbholZdiw0dOGYXJOwgJXzDBcal
         yAGaKcIv03oUnjf99Wb6ebLjQSk6wPrNNOwnEWaTdb3krJwsbhTYPyGrN8EApV+M8D8r
         YFl5+A5E2t5gpNQpfKrt7w62nhstc0z9MHZbLspFcl3WYt9K9ZSOFtKXabXE+PcIsCbg
         G3ZXE0HSxHpdQMKHjKBXdOuRRQupEOK+DJ0yJD/5u1jkC3HOU9Z9Y/I52FdabQ96IIxb
         O8xpbVTyjRHdlJGj/u3/G+zo0KHOn3tbBx6PlgGKo8pWLgqvG20ULXlv13I0VboUrBf1
         bHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683807173; x=1686399173;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tB8VwLerz7SQw/zMMp6ik+O7rtVUE8N1DQUQCASDLmM=;
        b=aEKMjYMEhwlbLYZNBYAn8PKd8On+XWgtOVkAGfvYw1Xeil3ZnGTZWrXrPHVRWkV0Um
         sjaMBn7otoHiPEJtYz0Kr63c+/X2eXJt9ml6PcKjC3R1D4CQcaOrGFo/GlT4IO6Xbq6D
         bl3DkQHe+UH5/LwJU+VJLd9prJsBL0GEAzYq0j7DoBM2mnFGje1meRsEkCdToYaZmlg5
         RIvpRvg6pyRhY6oJmGKaPhqcyBbOAwoMcQirkY+TLYa0gSHMxyWukAD5tQkPRfHhumTj
         4OaZy8G7b7SMDocibEl3msbmnqUUfInTx0XXzayrhlO8PhXRbvQBkfX7sYLUPsN5oeZS
         a1lg==
X-Gm-Message-State: AC+VfDw/OyOBtxOZ7nn3DEQmlkjjmvAjm6HLC1midiJY3ntmbk+8e4Du
	GOaFmfuj/VXPSkw9GgVq3UTxAdkWa2WzxCGMtCo2Kg==
X-Google-Smtp-Source: 
 ACHHUZ4NS2y0CeYoogwslnMOKRmgsQcyzFSELONZnzzfuyuyLWW4CXsatA6FiK8z55eQmOlrvRtkug==
X-Received: by 2002:a17:906:db04:b0:960:175a:3af7 with SMTP id
 xj4-20020a170906db0400b00960175a3af7mr16997058ejb.19.1683807173243;
        Thu, 11 May 2023 05:12:53 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:41e7:1b68:d38e:1348?
 ([2a02:810d:15c0:828:41e7:1b68:d38e:1348])
        by smtp.gmail.com with ESMTPSA id
 x4-20020a1709060a4400b0095ed3befbedsm3926806ejf.54.2023.05.11.05.12.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 05:12:52 -0700 (PDT)
Message-ID: <91a7f9d5-afdc-f109-03d0-3a5d0eb03cde@linaro.org>
Date: Thu, 11 May 2023 14:12:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4] ASoC: dt-bindings: nau8825: Convert to dtschema
To: David Lin <CTLIN0@nuvoton.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
 WTLI@nuvoton.com, SJLIN0@nuvoton.com, ctlin0.linux@gmail.com
References: <20230511113607.595184-1-CTLIN0@nuvoton.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230511113607.595184-1-CTLIN0@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LXITGPSH36JCWTV7GWRMFN5NNIJVUD2K
X-Message-ID-Hash: LXITGPSH36JCWTV7GWRMFN5NNIJVUD2K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LXITGPSH36JCWTV7GWRMFN5NNIJVUD2K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11/05/2023 13:36, David Lin wrote:
> Convert the NAU8825 audio CODEC bindings to DT schema.
> 
> Signed-off-by: David Lin <CTLIN0@nuvoton.com>
> 
> Changes:

Usually we put the changes under ---.

> V3 -> V4:
>   - remove the description from interrupts, clocks and clock-names properites
>   - add sound-dai-cells property and update the dts example
> 
> V2 -> V3:
>   - refine node name from "nau8825" to "codec" for generic purpose
> 
> V1 -> V2:
>   - add interrupts properties
>   - add maximum to nuvoton,jack-insert-debounce and nuvoton,jack-eject-debounce properites
>   - add a enum item for nuvoton,short-key-debounce properites
>   - add default value for most properites
>   - add maxItems to clocks properites and mclk entries to clock-names properites
>   - refine wrong indentation from clocks and clock-names
>   - refine dts example for interrupts and clocks
>   - remove headset label from dts example
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


---

This is an automated instruction, just in case, because many review tags
are being ignored. If you do not know the process, here is a short
explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tools like b4 can help
here. However, there's no need to repost patches *only* to add the tags.
The upstream maintainer will do that for acks received on the version
they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

Best regards,
Krzysztof

