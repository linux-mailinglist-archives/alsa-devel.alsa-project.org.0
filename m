Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBAF6C5932
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 23:00:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C5D2EAF;
	Wed, 22 Mar 2023 22:59:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C5D2EAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679522439;
	bh=WnJchWzhDXQhd/wSZe3iqwsZquayCQp5LZlL4LDsImY=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MPfp2v0jvOzCQyB57ydrhVTqDVPowMPB9Dz/kUxpjZUanp/53mnwu2K74gPV8RPut
	 EfY2yrHRmWKErnDDtCynu8m6rkXhtHBX5ytWuYI83u4/GulyDUctYS/qHFwsnADR7G
	 t25Ljau7hKoUG8DcgBaR1LwxVDjo1+3bZUtk+v5A=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DAB6F80254;
	Wed, 22 Mar 2023 22:59:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDABCF802E8; Wed, 22 Mar 2023 22:59:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 48554F8024E
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 22:59:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48554F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=TViol1op
Received: by mail-ed1-x531.google.com with SMTP id cy23so78744666edb.12
        for <alsa-devel@alsa-project.org>;
 Wed, 22 Mar 2023 14:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679522379;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EvQSRIdRv5c+y5ikJcDqBTw6V/+X5LVUwyAPQo8flXU=;
        b=TViol1opIBVYgiZzibv+QeuWJpS7XEsNAEeA6AthKKfjIW6QQt1lv7Pma1f4QXsdXF
         5TyN88oQA+Mt6kX0tFUGAPxoaZuKYqkuvrbV2o1/LuFhm674nnXJDvq9777FcmeJbGvf
         lSdm9nYRMJZMN6q937AJcdGUiA366TsKqw7cinTjm82VqX0vh56Ci0TE2DzJB3QScdsl
         QVcwzaGhQjZHGhac7qLwdySCdH1J3bTwBe36sD4rVMEfFEeh7DkYpTeaGZ6ANkD9eCiK
         /B8X88eIw08Ot67aTYDqZltTvv8zEHEBIUlY/D8w+lsx6AoYztFyrZWdB88PGj64fb3u
         q6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679522379;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EvQSRIdRv5c+y5ikJcDqBTw6V/+X5LVUwyAPQo8flXU=;
        b=RKq/I8XrbbrkbJt7yoLtcJla4lfWPXCKHuj/UEYLN6Zmt5jxzCJ+BYEPIcPH6DTaXs
         CsP5yfAtq1r4p/DubyppvfYPnzGF2rrez+9cwSAwlN+qMAmaC8GrothQDWOUUG4XmD+S
         dYmjiwpYQPK53cKNFCo9bZ/t231iU547k7XDpMr4U2pJVkf7WKFSiSY1kHXQQo9Qu93p
         TnQCBjN1CQUxj1dNawTC2TBlJsHYosnnBjwYeKcKNgvPaaPQCz+MG4JsSAZk1HohxYcO
         hLA2UmDi9NA87NXYJcW84WJ04nyJrepsNys/f1a5QfKnrf/kYZ4MyY8EnBwxpMGVTTBT
         9YnQ==
X-Gm-Message-State: AO0yUKXtIc+G7ANGSopqVcDaL/JmAiYfCHuiR73V4at64gXvrX/rVyeh
	NfuaXS8gAmHUb24cWq5nnCevPg==
X-Google-Smtp-Source: 
 AK7set88TbcnM/063JVFqc2VabiL6S//jkxBLWUWhSQKY5G4J0puIdYR1qJXou2K7kAYiGwtL5cXBQ==
X-Received: by 2002:a17:906:e97:b0:8af:2a97:91d4 with SMTP id
 p23-20020a1709060e9700b008af2a9791d4mr8279561ejf.14.1679522379374;
        Wed, 22 Mar 2023 14:59:39 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:626d:5729:6e71:4c22?
 ([2a02:810d:15c0:828:626d:5729:6e71:4c22])
        by smtp.gmail.com with ESMTPSA id
 y12-20020a17090668cc00b008d044ede804sm5703652ejr.163.2023.03.22.14.59.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 14:59:39 -0700 (PDT)
Message-ID: <cf87e7c0-b769-d1fc-0718-c5c2986993b8@linaro.org>
Date: Wed, 22 Mar 2023 22:59:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 4/6] dt-bindings: sound: Add support for the Lantiq
 PEF2256 codec
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20230322134654.219957-1-herve.codina@bootlin.com>
 <20230322134654.219957-5-herve.codina@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230322134654.219957-5-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: A45LJJ6MXOJVAOCJJOJAJ3TSJWX2GA7T
X-Message-ID-Hash: A45LJJ6MXOJVAOCJJOJAJ3TSJWX2GA7T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A45LJJ6MXOJVAOCJJOJAJ3TSJWX2GA7T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 22/03/2023 14:46, Herve Codina wrote:
> The Lantiq PEF2256 is a framer and line interface component designed to
> fulfill all required interfacing between an analog E1/T1/J1 line and the
> digital PCM system highway/H.100 bus.
> 
> The codec support allows to use some of the PCM system highway
> time-slots as audio channels to transport audio data over the E1/T1/J1
> lines.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../bindings/sound/lantiq,pef2256-codec.yaml  | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/lantiq,pef2256-codec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/lantiq,pef2256-codec.yaml b/Documentation/devicetree/bindings/sound/lantiq,pef2256-codec.yaml
> new file mode 100644
> index 000000000000..da35b70cda99
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/lantiq,pef2256-codec.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/lantiq,pef2256-codec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Lantiq PEF2256 codec
> +
> +maintainers:
> +  - Herve Codina <herve.codina@bootlin.com>
> +
> +description: |
> +  Codec support for PEF2256.
> +
> +  The Lantiq PEF2256, also known as Infineon PEF2256 or FALC56, is a framer and
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
> +  The tx and rx masks define the PEF2256 time-slots assigned to the codec.
> +
> +  The PEF2256 codec node should be a child of a PEF2256 node.
> +  Refer to the bindings described in
> +  Documentation/devicetree/bindings/mfd/lantiq,pef2256.yaml
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: lantiq,pef2256-codec
> +
> +  '#sound-dai-cells':
> +    const: 0

You do not have here any resources, so the entire binding can be dropped
and merged into the parent.

Best regards,
Krzysztof

