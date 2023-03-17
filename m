Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 802816BE491
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 09:58:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2242FF97;
	Fri, 17 Mar 2023 09:57:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2242FF97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679043492;
	bh=yuWm1X25//rIwM1s8HenAQFx5Nh6oJ7IU16T/aru72c=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=maBBZcQq+320yOwUGRTbp5ZYAGMa0hyEhl0WZGX1bD+RHQyiwRgWjXSx1F0MKk/DW
	 BuQW6j3YrkD8grg/3TMPJiM+pu27d0TQCDQA3PKLEgksdihbfHUo1oeSdjFmdZBjTJ
	 B7LClpoGDSHeG15C45to+kokpr1kjJH7lFGV3g8Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3966F8032D;
	Fri, 17 Mar 2023 09:57:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2252FF80423; Fri, 17 Mar 2023 09:57:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E52B4F800C9
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 09:57:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E52B4F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=TlDILzKX
Received: by mail-ed1-x530.google.com with SMTP id r11so17609501edd.5
        for <alsa-devel@alsa-project.org>;
 Fri, 17 Mar 2023 01:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679043434;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9lkYcGe56jj6Vu23+F5lwTMBHkX/FmQBfWkqpJWWWYE=;
        b=TlDILzKXaZD0Kq3gq8brL0V9KGYMn1MlUcsJmCQ6N8Os8b0Zb9R/UnDuUmG/Z1mPKX
         ofIXTtCcEXAlKitBVLxXjv8w5NJIxM0HdigIiCosn1JL2dy0BE2mFMlFekkgt9JfWuqZ
         zbEO1CbWvLsAxG8lPWQY7G/LM7vtFj543yyST/CgkV7zVHr3KKyeyPaVNBW57Q8v/Fel
         HLU2OZgzfGUlKC4SmKw79K4q9W7U2hjTP2nHlreP1A0US6L1BRX4ifFuOrLA9XSPgSIn
         k/KRyBvaki4C5dpYWA8ufKiLwqtC76WCvHpHG0NWUnGvumIkQ2Fsnhb5m7B2zwl02kLV
         qQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679043434;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9lkYcGe56jj6Vu23+F5lwTMBHkX/FmQBfWkqpJWWWYE=;
        b=6AD0bW85VUvsc/7U27Z9rKM3ZMG2ZpK5eFkY7Jo7IVDAptSyFocRxLiX4t9oMN0xFr
         sWtb4ftZ7fsvlszZhFIGpnCxd4BPwsGSIpIMqi8ezm+pts3SveTqaKARzfPHjt9kNp/u
         gVc20e9GTJQIsM/aVhumQxKsAzCv4NVfpVSoNGTo22DQhraSXULawsXXaJAD3yo9fvNn
         a48JhvilZAyQb39TvChCG1KuwTQPviXNVRwnTUQuKuNu7NcSrVslC8J5AQ+dJ59rwifH
         2LRkPJrYgrIreWN2noTW7o+1kNcPKkOEE5GFRyqgdogi8p+/rlgMdVt561iwC9xEGkhc
         reag==
X-Gm-Message-State: AO0yUKU+PgblCI7ucQCaHS07L0KVVkKrIvz4aWdykMYH1OXmIgVYgzvo
	udsjseoI1qHsz/iHJV0WW9Dd7w==
X-Google-Smtp-Source: 
 AK7set/k6Z9YbriJ3jF4jAfkZWdrmAilfpztMLAKLNEFDkO9cZBivKSH+N9TjwPwdkoNNUp4GpKUfA==
X-Received: by 2002:a17:907:2bc3:b0:92a:3b19:9a4c with SMTP id
 gv3-20020a1709072bc300b0092a3b199a4cmr2409377ejc.27.1679043433773;
        Fri, 17 Mar 2023 01:57:13 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:848a:1971:93e0:b465?
 ([2a02:810d:15c0:828:848a:1971:93e0:b465])
        by smtp.gmail.com with ESMTPSA id
 w3-20020a50c443000000b004ac54d4da22sm763279edf.71.2023.03.17.01.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 01:57:13 -0700 (PDT)
Message-ID: <2d4dae57-e46d-7e81-9b56-2148074c8406@linaro.org>
Date: Fri, 17 Mar 2023 09:57:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 5/7] dt-bindings: sound: Add support for the Lantiq
 PEF2256 codec
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Derek Kiernan <derek.kiernan@xilinx.com>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20230316122741.577663-1-herve.codina@bootlin.com>
 <20230316122741.577663-6-herve.codina@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230316122741.577663-6-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FR2DIFKF6FAJML33MABIUVWT6ASFJWRW
X-Message-ID-Hash: FR2DIFKF6FAJML33MABIUVWT6ASFJWRW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FR2DIFKF6FAJML33MABIUVWT6ASFJWRW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 16/03/2023 13:27, Herve Codina wrote:
> The Lantiq PEF2256, also known as Infineon PEF2256 or FALC256, is a
> framer and line interface component designed to fulfill all required
> interfacing between an analog E1/T1/J1 line and the digital PCM system
> highway/H.100 bus.
> 
> The codec support allows to use some of the PCM system highway
> time-slots as audio channels to transport audio data over the E1/T1/J1
> lines.
> 

Your other file should also have specific compatible, unless this codec
is actually part of the framer. Did not look like this in the binding -
not $ref.

> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../bindings/sound/lantiq,pef2256-codec.yaml  | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/lantiq,pef2256-codec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/lantiq,pef2256-codec.yaml b/Documentation/devicetree/bindings/sound/lantiq,pef2256-codec.yaml
> new file mode 100644
> index 000000000000..acba3a0ccd1b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/lantiq,pef2256-codec.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/lantiq,pef2256-codec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Lantiq PEF2256 codec device

Drop "device". Everything is "device".

> +
> +maintainers:
> +  - Herve Codina <herve.codina@bootlin.com>
> +
> +description: |
> +  Codec support for PEF2256.
> +
> +  The Lantiq PEF2256, also known as Infineon PEF2256 or FALC256, is a framer and
> +  line interface component designed to fulfill all required interfacing between
> +  an analog E1/T1/J1 line and the digital PCM system highway/H.100 bus.
> +
> +  The codec support allows to use some of the PCM system highway time-slots as
> +  audio channels to transport audio data over the E1/T1/J1 lines.
> +
> +  The time-slots used by the codec must be set and so, the properties
> +  'dai-tdm-slot-num', 'dai-tdm-slot-width', 'dai-tdm-slot-tx-mask' and
> +  'dai-tdm-slot-rx-mask' must be present in the ALSA sound card node for
> +  sub-nodes that involve the codec. The codec uses 8bit time-slots.
> +  'dai-tdm-tdm-slot-with' must be set to 8.
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: lantiq,pef2256-codec
> +
> +  lantiq,pef2256:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to the PEF2256

Why not its child? Why this is in parallel ?

> +
> +  '#sound-dai-cells':
> +    const: 0
> +


Best regards,
Krzysztof

