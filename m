Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D00916BC821
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 09:04:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BA8C114F;
	Thu, 16 Mar 2023 09:03:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BA8C114F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678953850;
	bh=3JQttNQy/OEopabTH9CwHYHN453DXs6bXR61SfA9ZtQ=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pyodXMRmUaFzpDkw2MAVcJ1yhLzFqM9oNVZuASnA1hDPxaTFgUU97NiEdL3lPQW0Z
	 lom1P4FojeZvxulEYcdVTtO4TTQs6XADxP/mnDh3fzt+3DwZ/RURV7ScNar5x0RFCt
	 6l9PXP3YyErhULZMwVfcMeL9SXjGBnJpmpQPuDp8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8D01F8032D;
	Thu, 16 Mar 2023 09:03:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CAABF80423; Thu, 16 Mar 2023 09:03:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ECA86F800C9
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 09:03:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECA86F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=xRSomDth
Received: by mail-ed1-x534.google.com with SMTP id y4so4192386edo.2
        for <alsa-devel@alsa-project.org>;
 Thu, 16 Mar 2023 01:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678953783;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qh4n27p9wQD5s8gsgZxDBOeK+3qylkPEY7hCKMAkPoo=;
        b=xRSomDthOelEfJY9Fcgu9Y/q7gwHc9BT/kb5DyrokzDy6B72DGVtf4Lpumdbwf/heh
         Oc1fIrykRLKcj5HD+vFSVJivF3b24vMryp1nYgZCls/94Zp8zGNCAWYOXIWMXHNDAeX3
         Rb6wxYmtAvg6ZQfM5DLuRdr2PjsJni5igQZSEd4Nsyn59zgzFgvaBd61xKTlHkmekNsi
         CGUN9SGSY496waZ1M0E/iNiPRVgFyuEIM8UdrHB9Fl9uY+ga0/FzfkHNOiXZdlclGreo
         6tAwddSFh1ldFehaJTolUJNsXSbPBjhMC09ptSk1pZon9Jq+lNIoI2KcERljyipEMXvD
         HPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678953783;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qh4n27p9wQD5s8gsgZxDBOeK+3qylkPEY7hCKMAkPoo=;
        b=KQteTKJkyqVSca93vmivZO0HV5swYjbjee4orTaZl4xhJyJQmEEp94xc+I5h2QczjM
         rW6EDupGGXoqoD8K+E+BwBenW+dywA5df3ubY3YhR9fROI4waMr5I5eb+jiLrE3lgNmm
         5G5OQ28Rlfeeu5ymVnOPiZUndEH0ZCyFFIhWWds/3VfcQ1y6qIt9ANrtBpmqblB1H4PP
         LaEC0qEFpp5QBSNevSSwjNNi9mOUY4CqwsfJBeHNye5EC1/mWTyAxc/MqVa5XqtyFkqL
         j0D+RY59eQl9rkGyIrZ+xLzOpzpRT6HURtk03KtjErf6BHYfyf/tgFMkXHQSxDu4dM8V
         OcgQ==
X-Gm-Message-State: AO0yUKVMiPnS81+v3/AX9hQkhbLijc1cN5CoTPgFLdevh2SWZvdFMkRE
	5eIsWkkDFXGxDsLAD7g5OJHC/g==
X-Google-Smtp-Source: 
 AK7set9S6JMYQtXY5eHDqMuToLl9fQfueRUySppFezu2X7NpsAwCDEV/ErqLnyA/sAL4FI4YJCfA8Q==
X-Received: by 2002:a05:6402:651:b0:4ef:9bf0:7177 with SMTP id
 u17-20020a056402065100b004ef9bf07177mr5632190edx.9.1678953782748;
        Thu, 16 Mar 2023 01:03:02 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f?
 ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
        by smtp.gmail.com with ESMTPSA id
 w13-20020a50c44d000000b004fc2a75c6b3sm3494797edf.23.2023.03.16.01.03.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 01:03:02 -0700 (PDT)
Message-ID: <ed3358f2-cdd8-4cbf-48ed-3f8f462badee@linaro.org>
Date: Thu, 16 Mar 2023 09:03:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] ASoC: dt-bindings: adi,adau17x1: Convert to DT schema
Content-Language: en-US
To: Vijaya Anand <sunrockers8@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230315231055.3067-1-sunrockers8@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230315231055.3067-1-sunrockers8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LEXNJX3QRK5OOR5MI3B5KNKTRECR2ZM3
X-Message-ID-Hash: LEXNJX3QRK5OOR5MI3B5KNKTRECR2ZM3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LEXNJX3QRK5OOR5MI3B5KNKTRECR2ZM3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 16/03/2023 00:10, Vijaya Anand wrote:
> Convert the binding document for adi,adau17x1 from txt to yaml
> so one could validate dt-entries correctly and any future additions
> can go into yaml format. Add address and size cells to example to
> prevent errors regarding reg format.
> 
> Signed-off-by: Vijaya Anand <sunrockers8@gmail.com>
> Cc: Daniel Baluta <daniel.baluta@nxp.com>
> ---
> Changes since v1:
> - added 'Codec' in title to clarify type of devices
> - put compatible devices in lexographic order
> - changed description of clocks
> - changed 'unevaluatedProperties' to 'additionalProperties'
> - changed node names to be generic

You sent a v2, so this should be v3. Keep it consistent, otherwise it
confuses reviewers...

> 
> ---
>  .../bindings/sound/adi,adau17x1.txt           | 32 ------------
>  .../bindings/sound/adi,adau17x1.yaml          | 52 +++++++++++++++++++
>  2 files changed, 52 insertions(+), 32 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/adi,adau17x1.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/adi,adau17x1.yaml


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

