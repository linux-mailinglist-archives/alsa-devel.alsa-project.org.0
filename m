Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37ED56BE49E
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 09:59:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0240AFA0;
	Fri, 17 Mar 2023 09:58:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0240AFA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679043554;
	bh=+CuJWkRWFS+jZrzqGjBPIukT6rfNa1Y/kcKi6UfV6Z8=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KzP3rZDCac16oKLUPQaQHWnvYT6ZH7v0uXPhO5r54ic1c2O+lMCE3LrqqGsIH3NmT
	 /Jzg5SQfmZOezVfi0CqaBoPKlaISIrpIO8tPdtQCL6V6+H3IihoGDV35htPT6mEBPn
	 OoU7U1HNOoaELTD/CEdrOR9xGnY/NfLp+9uTiRZI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A931BF8032D;
	Fri, 17 Mar 2023 09:58:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6ACE8F80425; Fri, 17 Mar 2023 09:58:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49D98F80272
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 09:58:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49D98F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=PEQUTBW0
Received: by mail-ed1-x52f.google.com with SMTP id eh3so17517858edb.11
        for <alsa-devel@alsa-project.org>;
 Fri, 17 Mar 2023 01:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679043495;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bFTOCKd9YghODhm9k4BYSdRMAj9VqWPQ6/g4To8HAmg=;
        b=PEQUTBW00Q+bfC5naqVxYnm+fRau4EKZs5B29/rEwMT2+J1de1jINVzNreHp85gOEG
         R41z9yfWpnHDzIovAUSV3pnRNIZCUQITaEEakZ4QyZgQG4XdlxTCRhyz61PFTw4N0XFX
         pp6xfDgTtB63NomYOgd7JV6pBX9jG7CLVBYW/ashqpRF2NYj0fiZOtmrovCaGLugl2OH
         yu94pfHHrGFXU2D4DCDWPof/kg88ylBRWpg3apnHvuwAnYS5+yZvDxtwC2YZHidPmPIA
         sEwLHRZTFbCozxQ+bmpLGg+9exr0TbXgv4vRlzePypYWtRSv7PEz4ecmaT2GOd2cvuCr
         TMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679043495;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bFTOCKd9YghODhm9k4BYSdRMAj9VqWPQ6/g4To8HAmg=;
        b=IvJb1PPrnVXqrQSp+C5LUxjqucQvWIwccsQmL4t7a/OVQgscR3Qz60QnSU0QyJJOZl
         J261knL4zdwbWW/01y2dH4Ky0+G/zFYlpOb2IlH81kuBhp5jVetglkJLm2nQGHtHPUQ3
         v6iVg3Vedpvp9aILmaZta61HTy1XF1T5epCbcF2nfCIRcRb49uJEP6K2SjHX+DkWaIgu
         Azd7p2OrG+9WrkDrfiuPhZaGdL2ejonN1/if/SFqppdd5aWM3t7C2NBgGj4+ze06mHzQ
         mknIqtIy6e3UQ+2HDg3wNVlQSP/K6laCqNPyV9DzTYVK+YhmA5d2BVxhknujY5MKFTfP
         Ia6A==
X-Gm-Message-State: AO0yUKXajgBHfzrAU0EQreJdYNa+DpL46NYPpBCCcGcROcj2hL+2JwGq
	CU9FxD0ZInUdBBpBOB9HykDWlQ==
X-Google-Smtp-Source: 
 AK7set/0+buflC78R3Q4lgaLGPP2/vw/ORXPdBawsURaWStTeYkFM3YQY1x8gev1bA7uz74wqq20gw==
X-Received: by 2002:a17:907:7fab:b0:931:d350:9aef with SMTP id
 qk43-20020a1709077fab00b00931d3509aefmr2036086ejc.25.1679043495242;
        Fri, 17 Mar 2023 01:58:15 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:848a:1971:93e0:b465?
 ([2a02:810d:15c0:828:848a:1971:93e0:b465])
        by smtp.gmail.com with ESMTPSA id
 lg10-20020a170906f88a00b008cc920469b5sm738745ejb.18.2023.03.17.01.58.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 01:58:14 -0700 (PDT)
Message-ID: <1d1069ab-cf02-3e1b-a8c1-b0fb8170addd@linaro.org>
Date: Fri, 17 Mar 2023 09:58:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 7/7] MAINTAINERS: Add the Lantiq PEF2256 ASoC codec
 entry
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20230316122741.577663-1-herve.codina@bootlin.com>
 <20230316122741.577663-8-herve.codina@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230316122741.577663-8-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 5JN2RJXU3DKVLX7BDZLAMC5QRWOTZQCZ
X-Message-ID-Hash: 5JN2RJXU3DKVLX7BDZLAMC5QRWOTZQCZ
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5JN2RJXU3DKVLX7BDZLAMC5QRWOTZQCZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 16/03/2023 13:27, Herve Codina wrote:
> After contributing the codec, add myself as the maintainer for the
> Lantiq PEF2256 codec.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b258498aa8ac..81c17580b402 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11651,6 +11651,13 @@ S:	Maintained
>  F:	arch/mips/lantiq
>  F:	drivers/soc/lantiq
>  
> +LANTIQ PEF2256 ASoC CODEC
> +M:	Herve Codina <herve.codina@bootlin.com>
> +L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/sound/lantiq,pef2256-codec.yaml
> +F:	sound/soc/codecs/pef2256-codec.c

I don't think there is need for two entries at all. For all such more
complex devices we keep one entry, this should not be special. Look at
Maxim PMICs/MFD for example.

Best regards,
Krzysztof

