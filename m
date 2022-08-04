Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE765589B01
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Aug 2022 13:24:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 666F6857;
	Thu,  4 Aug 2022 13:23:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 666F6857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659612289;
	bh=eX5aJZX6utwsUQ/2OatkSjWPjaIM1g9guG7vFklOx+o=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GZqTTwnDVoi9F7/w8AzQ3gu9FevOFSBbm1iR/Wf8EQFSXMXLmP1SP497lDuD/gPWZ
	 kbp/phs5IXCajnw+8mbxKgH7wLXL3Z4uoOzWoaSYwI+KeVAS0elZ+oWQdy1zslmEj2
	 z20KSxYgDztyQfHBUoRnhMLDdH4YNiZsb3A+Tcu4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD5D4F8012F;
	Thu,  4 Aug 2022 13:23:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B391FF8016A; Thu,  4 Aug 2022 13:23:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, NO_DNS_FOR_FROM, T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C09AF80083
 for <alsa-devel@alsa-project.org>; Thu,  4 Aug 2022 13:23:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C09AF80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ptSAimzf"
Received: by mail-lf1-x132.google.com with SMTP id f20so23114301lfc.10
 for <alsa-devel@alsa-project.org>; Thu, 04 Aug 2022 04:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/tehabPNXgzKT/PZB7LTyS6v91bSlhrWIId3zLr+jw4=;
 b=ptSAimzffHbj+u6lIXfdEShRglTiiYM1pRsRfzv++T2A/tZwGMMRW7Y+F29sDxh6po
 ll6WLhN9K8+2Ywn4bgym+AIjnawgPEPTXyxdyfqB7hl53g58NBjU+5A8HFlpnwksCgB9
 gH0068c95fv1E+izSBzOAyVDZaaHnpGmL1oQWeiwBmB91uoPXPmMq9cnm1JWkd6kZI4k
 fdAnGmMTD0TzjQJZYmboUrY5hGsKbrAKSpJ8JH5+G8i6HE0ArxhFaTSW1qI37mClWUuM
 G96UlJPCd4/ngqqekypUqdETNExWe4HujR8hn7p+WOydknuzJPvOWhb1l4YY2bVVDUaN
 Pp/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/tehabPNXgzKT/PZB7LTyS6v91bSlhrWIId3zLr+jw4=;
 b=5GSD1CLXwRiTvGt/xii6gEbvR1UT74YIo/qMOEA9eKlHSDI41YlVZk6tyuazwwAcxT
 oA5/xUMQZzHBB4ak0HkM1hc6/PPPWomHoTRFZsx/GGOKljmByXMx6Qtda+wwBbnBX0XQ
 qxzsy1cs7mWmaJUiv3XA7zEHHkpIWTeQi/QImejmEjUJPYg+tz8H2y8btgMo/C8hQYoU
 4Ms+vQQ8FN9TFuaooEKy+voQjJ2RbQhvoIDttQMn7i0u/TZmi7gCaF6uK7c7BNnnCsoD
 M4vgCDH6oeltyPRZXb1p5AwB+wxE9Rxfwh5JwP1836jqr5NVYohieGN8MqIbBfRIvyx3
 XNQA==
X-Gm-Message-State: ACgBeo0JYBTZjUk5KjXbsPwxptoFYA/U23sHuSbzYdcsK51ctxdFEbTL
 BFRQYmWb5Wtv0x7pdn4bhf5gtw==
X-Google-Smtp-Source: AA6agR5ea4gvC20yipsPb61s9LV+gP4i+TEIUBShBVLemuPDarIdi1x8bQFShv7dqERenK+JvlRlHQ==
X-Received: by 2002:a05:6512:308d:b0:48b:b7d:f1e5 with SMTP id
 z13-20020a056512308d00b0048b0b7df1e5mr592496lfd.199.1659612220803; 
 Thu, 04 Aug 2022 04:23:40 -0700 (PDT)
Received: from [192.168.1.6] ([77.222.167.48])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a2e504a000000b0025e5358857esm95943ljd.13.2022.08.04.04.23.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 04:23:40 -0700 (PDT)
Message-ID: <10887a45-cd28-8396-b3e7-745e22e00c27@linaro.org>
Date: Thu, 4 Aug 2022 13:23:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] dt-bindings: sound: tlv320aic3x: Convert to dtschema
Content-Language: en-US
To: Jai Luthra <j-luthra@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220803151726.31628-1-j-luthra@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220803151726.31628-1-j-luthra@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 03/08/2022 17:17, Jai Luthra wrote:
> Convert bindings for TI's TLV320AIC3x audio codecs to dtschema.
> 
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> ---
>  .../bindings/sound/ti,tlv320aic3x.yaml        | 158 ++++++++++++++++++
>  .../devicetree/bindings/sound/tlv320aic3x.txt |  97 -----------
>  2 files changed, 158 insertions(+), 97 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/tlv320aic3x.txt
> 
> diff --git a/Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml b/Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml
> new file mode 100644
> index 000000000000..f0ed856162ea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/ti,tlv320aic3x.yaml
> @@ -0,0 +1,158 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/ti,tlv320aic3x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments TLV320AIC3x Codec
> +
> +description: |
> +  TLV320AIC3x are a series of low-power stereo audio codecs with stereo
> +  headphone amplifier, as well as multiple inputs and outputs programmable in
> +  single-ended or fully differential configurations.
> +
> +  The serial control bus supports SPI or I2C protocols, while the serial audio
> +  data bus is programmable for I2S, left/right-justified, DSP, or TDM modes.
> +
> +  The following pins can be referred in the sound node's audio routing property:
> +
> +  CODEC output pins:
> +     LLOUT
> +     RLOUT
> +     MONO_LOUT
> +     HPLOUT
> +     HPROUT
> +     HPLCOM
> +     HPRCOM
> +
> +  CODEC input pins for TLV320AIC3104:
> +     MIC2L
> +     MIC2R
> +     LINE1L
> +     LINE1R
> +
> +  CODEC input pins for other compatible codecs:
> +     MIC3L
> +     MIC3R
> +     LINE1L
> +     LINE2L
> +     LINE1R
> +     LINE2R
> +
> +maintainers:
> +  - Jai Luthra <j-luthra@ti.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,tlv320aic3x
> +      - ti,tlv320aic33
> +      - ti,tlv320aic3007
> +      - ti,tlv320aic3106
> +      - ti,tlv320aic3104
> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO specification for the active low RESET input.
> +
> +  gpio-reset:
> +    maxItems: 1
> +    description:
> +      Deprecated, please use reset-gpios instead.
> +    deprecated: true
> +
> +  ai3x-gpio-func:
> +    description: AIC3X_GPIO1 & AIC3X_GPIO2 Functionality
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 2

No need for minItems if they equal to maxItems.

> +    maxItems: 2
> +

Except that, Rob's bot reports several other properties used in DTS. You
can document them in that commit - just mention in commit msg - or a
follow-up commit just for undocumented properties.

Best regards,
Krzysztof
