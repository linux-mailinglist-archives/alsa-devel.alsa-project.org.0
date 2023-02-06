Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7BA68C6B3
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 20:22:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC540F0;
	Mon,  6 Feb 2023 20:22:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC540F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675711373;
	bh=TltN3l6m0VuQSFfoqnkGA9iw0wa9GN/aWFg49RFFJBw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jgDI2wKL6fjnZkEc4ErJoWOQ7QCEYrbgzjenrCfrOJu1DQCZwJMPotU4gYnGP7Kr0
	 fRpRcPY72IyyBdfNTPnmNFd+PXnOBk5ZBgWskO98mbjdHXquu4+qlWTtKVRyakMxQI
	 EFlvS1tBRuOGoO0thjFMBEjH87e1gklWT7e4IU2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F10EF800E3;
	Mon,  6 Feb 2023 20:21:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 404F9F804F1; Mon,  6 Feb 2023 20:21:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69C7EF800E3
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 20:21:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69C7EF800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=RK9KdUt9
Received: by mail-wm1-x336.google.com with SMTP id q8so9431849wmo.5
 for <alsa-devel@alsa-project.org>; Mon, 06 Feb 2023 11:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KGhlandvp32zJuT9yzD1H530+wjS7yGNPZyYGw6c5iw=;
 b=RK9KdUt9G34mb44xh/5h3OJn/2y9DCQCHJYG6331S3Nkcfl1SCla9sdyBucGntiPxP
 fCwsuLQRfMDC19jPGH1Y7GtU7tj7qiU+PNQ9WWEc9RdVP7nGXvPJ1whG7edf62isi0WJ
 9hY/eOpkb+YzwOk7lCraIXsxuQRi2r3r0WGQQUCCsSVgxAV0n7+DM7Wqb4Ph4/ZV5WuJ
 2BzG6Bys/oFKYCIL40QiJjohO9wOQasfG/5PnsgCj7Dmr/+j84I2kvOCRHhTLFAIn3Gp
 7rlmaIm9O+vHBDwcnfD0bj856GTRBl1D7nA+L9/lE1Wr4pZiY507foIqIiNwdphuGrZy
 W5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KGhlandvp32zJuT9yzD1H530+wjS7yGNPZyYGw6c5iw=;
 b=NJz8KhfNn/hqjH2DDACMWfAWwbEUiJCc3SiBAHHWFinie1upof+Snz+SgIx9hOxLRz
 Ahj/q9H82zFEce0WyT3C9locWHVjAFOrtKERb2kEXrI92bZHTrDMIRD0ntB0T6hyrSge
 46MasKFQ3dXUA7LTZI4Bx9q+VsXdSEMmiovE+HmN+3hJu0XUG8kJTnKmd8Uw0qbdAPKp
 5V18TLoxejoLuXg05FWAmzwlTa+Qhgi0dssMgTBaimy1hGiZlEw32fopSLjuoGaRMMmz
 jSK8kcaz83gr1+8ZYEDY/J8NVm/d2nAglW+hHhHnnbRD1Gy7Iq7aB0rknieHqfyTVhDu
 bxbw==
X-Gm-Message-State: AO0yUKUqAnkP9+yZIsF7Rax78JLUtaUPV2NpwZ+XHWWFXf6UbvqrUoMZ
 aER2Xzy9Lv+tcbJq5LIagi6rkQ==
X-Google-Smtp-Source: AK7set/SDIe02vvcqIXxVdYR1JTowEX0cXIGhrq4GDN8fP/pcdD3VeaD4VIm3863dwYdvnDd4WXa9w==
X-Received: by 2002:a05:600c:1714:b0:3df:dc29:d69 with SMTP id
 c20-20020a05600c171400b003dfdc290d69mr676718wmn.36.1675711304635; 
 Mon, 06 Feb 2023 11:21:44 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a05600c35cd00b003dc5b59ed7asm12549446wmq.11.2023.02.06.11.21.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 11:21:44 -0800 (PST)
Message-ID: <a711905e-dbfb-4258-62be-250a9549a9c4@linaro.org>
Date: Mon, 6 Feb 2023 20:21:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 7/7] ASoC: dt-bindings: meson: convert axg sound card
 control to schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
References: <20230206153449.596326-1-jbrunet@baylibre.com>
 <20230206153449.596326-8-jbrunet@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230206153449.596326-8-jbrunet@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 06/02/2023 16:34, Jerome Brunet wrote:
> Convert the DT binding documentation for the Amlogic axg sound card to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../bindings/sound/amlogic,axg-sound-card.txt | 124 ------------
>  .../sound/amlogic,axg-sound-card.yaml         | 183 ++++++++++++++++++
>  2 files changed, 183 insertions(+), 124 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
> 


Thank you for your patch. There is something to discuss/improve.


> -};
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
> new file mode 100644
> index 000000000000..b7459fad0e7f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
> @@ -0,0 +1,183 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic AXG sound card
> +
> +maintainers:
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +
> +properties:
> +  compatible:
> +    const: amlogic,axg-sound-card
> +
> +  audio-aux-devs:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: list of auxiliary devices
> +
> +  audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description: |

You still have everywhere | which should be removed. Here and in almost
every other description when no special formatting is needed.



Best regards,
Krzysztof

