Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 728086FBF19
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 08:16:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C5B6102A;
	Tue,  9 May 2023 08:15:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C5B6102A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683612975;
	bh=gOA5TrdcGBLt1wyR0Z2y6MgknyapYz7CC/qa+G8zvbw=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Oan0cN6PPsq2sI+FST1Dn9NSvM7+0OH1SILYZDmmTOSj0MGv3PjdIzgES4izHYvyJ
	 dlhvB+Jp1BdkOgcv0Fog2bih3IwhXLZlDVpwVHv6mlYhCX43AWhx/WkFhAwtLQkzvg
	 dAoRH8A3wWf1UD/DdTIZA+/M10PBYL1THFo0qNEg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C1E4F80310;
	Tue,  9 May 2023 08:15:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A19EF8032D; Tue,  9 May 2023 08:13:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0FE9CF80217
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 08:13:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FE9CF80217
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=WFoep9EW
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-965e93f915aso808306966b.2
        for <alsa-devel@alsa-project.org>;
 Mon, 08 May 2023 23:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683612817; x=1686204817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yy1bnxONg+wwiiP6uKM33WWPud1zRtBGR21Fn/jN2EM=;
        b=WFoep9EWJKeb9JxyM4rVFgSC7qidYIbBvw4NUHWAvRoqsu2b5z855y6oO7N61KxYr+
         J8N1bqNDp4vVWPo+PQOeVnVB+ZlK7VbojgNE3sKM6y1Rsa0mgAoZ/6XiRcB+THwmVIfH
         wrUVYNfEH6QR9xnZom3qRgWkMo5l7zIu6mlOsGPe/W5bfwtl4JXwntT64Bf4VCfK7S63
         B4hbk6I11i3gzj086D8P4uVT64ykWqHv6EXlx8peUNwLD52YMPJ7/tQ/i1r39S+mOS3Y
         3ouJw1ZI11fCIdO1y3fsHH0BFWL2zs8ZsHj6hMb8hJ2C6hwZ/mjdgJtyOl9SWkZXSXXz
         sigw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683612817; x=1686204817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yy1bnxONg+wwiiP6uKM33WWPud1zRtBGR21Fn/jN2EM=;
        b=MTcZWDD+WN6L260QzF1gOBsvpylOaF5xNfySWWsYrTcTrF0zUht5WBD4znZAakzMOO
         Tv4B/6ovd6UYDFYkSYjDuk6DIHrSyyvL8lqsnAl9yCt6fz0+bzF2plg61/DTKpE3FCnA
         jkMfxtYfxcXIxK3HOL6bFbe/0XeklitFhkejq3WVNywU6ZmZlNuJChN6EwFIMIcBUAbp
         n3RoR6/2tUq4QgAs/3Wb/SehuS3cJesc+Fo3E5ugcMmcIO1Sj/o7w3UtX0mVFlGZGdiv
         HspO1Nqp6+jPu9RJpS+taq+4/2GVSSmhFiakA4sUjU20l1ggcvg1lflYwM0FWSu1r4OI
         0DcQ==
X-Gm-Message-State: AC+VfDyIX9TxOX4kpPqBJJiYbiv27vzr5iyMsMu/hSDreXO2BAZUNk4z
	vMjE0QI05PnmWvY0wOgRGnHv5g==
X-Google-Smtp-Source: 
 ACHHUZ5K2lDOZ55VJjClCZvXPCey7Pl33EDZmzUP/w8F9xRvsJV5JUvHFUyq3pEiANq0Ke2vW4W7CQ==
X-Received: by 2002:a17:906:dc93:b0:965:4b44:6f5a with SMTP id
 cs19-20020a170906dc9300b009654b446f5amr11425421ejc.10.1683612816820;
        Mon, 08 May 2023 23:13:36 -0700 (PDT)
Received: from krzk-bin ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id
 hv7-20020a17090760c700b00965be665811sm900429ejc.2.2023.05.08.23.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 23:13:36 -0700 (PDT)
Date: Tue, 9 May 2023 08:13:33 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: David Lin <CTLIN0@nuvoton.com>
Subject: Re: [PATCH] ASoC: dt-bindings: nau8825: Convert to dtschema
Message-ID: <20230509061333.t7wzu2fl3iatalea@krzk-bin>
References: <20230509051054.480412-1-CTLIN0@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230509051054.480412-1-CTLIN0@nuvoton.com>
Message-ID-Hash: UIHG7SIOV6PV5KPCBKWGMM3H3HK2TAYA
X-Message-ID-Hash: UIHG7SIOV6PV5KPCBKWGMM3H3HK2TAYA
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: YHCHuang@nuvoton.com, ctlin0.linux@gmail.com, broonie@kernel.org,
 KCHSU0@nuvoton.com, SJLIN0@nuvoton.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, WTLI@nuvoton.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UIHG7SIOV6PV5KPCBKWGMM3H3HK2TAYA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 09 May 2023 13:10:55 +0800, David Lin wrote:
> Convert the NAU8825 audio CODEC bindings to DT schema.
> 
> Signed-off-by: David Lin <CTLIN0@nuvoton.com>
> ---
>  .../devicetree/bindings/sound/nau8825.txt     | 111 ---------
>  .../bindings/sound/nuvoton,nau8825.yaml       | 220 ++++++++++++++++++
>  2 files changed, 220 insertions(+), 111 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/nau8825.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8825.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/nuvoton,nau8825.yaml:172:4: [warning] wrong indentation: expected 4 but found 3 (indentation)
./Documentation/devicetree/bindings/sound/nuvoton,nau8825.yaml:177:4: [warning] wrong indentation: expected 4 but found 3 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/nuvoton,nau8825.example.dtb: nau8825@1a: Unevaluated properties are not allowed ('interrupts' was unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/nuvoton,nau8825.yaml

See https://patchwork.ozlabs.org/patch/1778742

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.
