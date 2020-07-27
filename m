Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD3C22F66D
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 19:17:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2191169E;
	Mon, 27 Jul 2020 19:16:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2191169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595870234;
	bh=mGnXttj4gMZac+rdPDPDq/EFfZE6Qz4mT/dMyd6hWBc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p5oJuMhgqX9jhBO450f6wuAe4mXxJ81uRvTNWUQhZq/9f4CVNk1XuEKkbDS473KjC
	 kmkTDoOAhDOC9Nk1Y2OIDJDJZnsyz5YduNKZqJVyVmALo7S+/6mbGNXizOqrIudB44
	 BFZYlRdROebNbJCRm4S/m5ICvzxxDDn8QrLImUAY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB01BF8013C;
	Mon, 27 Jul 2020 19:15:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5080BF80171; Mon, 27 Jul 2020 19:15:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEC6BF8013C
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 19:15:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEC6BF8013C
Received: by mail-ed1-f66.google.com with SMTP id n2so12709095edr.5
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 10:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BliIrD6HFnaqfqEV1t4dYfV86GNI6DLmsozTcMQdAAM=;
 b=jYR5bUbZH4tZYRtio/e+PjKjWFVQn4YF5zRTeiGtgfmhJLpbvaSfBrl95PWzt2wfcS
 UYhyDfvahEtlVMEZm+5Y0tQdyW1VsL7fBzONV0uYtnHxign5lor08ATZk6reT16T1BPd
 oU/GfqBrET5omBaCg6/bd+cshhARETfd9wKq/ZmruZYkw91qub/jbbgKa0JKh8Ull3b0
 QzRWisPhUQbV19SBnRfWGPh5GARg+dqiItwP9uVKfQItVBLGUmBG4UU+FQQ9mTBjGRH+
 BHYm3B+WFdxwM0/c+0sD6shSHcD+SzPbomDCaYJo1JVS215yXqiw9AHIhI5KWy4FjLiN
 0c7Q==
X-Gm-Message-State: AOAM5326+1E/ubIAo00F5xJnF8ZgcRt3SkB66MOXHj3Brk7g3szi0Kv4
 zBWwhb98liM6IlEqyxkaYCQ=
X-Google-Smtp-Source: ABdhPJxDv7/MPyfHpAwtt1qENlH8+RzlpaeCY0brayFCsvyKhCZ9X7tA1jP3eFubjrttJw5W34ce/Q==
X-Received: by 2002:a05:6402:1ca8:: with SMTP id
 cz8mr21617340edb.55.1595870123499; 
 Mon, 27 Jul 2020 10:15:23 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
 by smtp.googlemail.com with ESMTPSA id sd15sm7320776ejb.66.2020.07.27.10.15.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 27 Jul 2020 10:15:22 -0700 (PDT)
Date: Mon, 27 Jul 2020 19:15:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 1/3] ASoC: samsung: Document DT bindings for Midas
 sound subsystem
Message-ID: <20200727171520.GB3507@kozik-lap>
References: <CGME20200727163139eucas1p17420a06923fb625331b2ea867f75bb7e@eucas1p1.samsung.com>
 <20200727163027.9242-1-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200727163027.9242-1-s.nawrocki@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: simon@lineageos.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 b.zolnierkie@samsung.com, robh+dt@kernel.org, broonie@kernel.org,
 m.szyprowski@samsung.com
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

On Mon, Jul 27, 2020 at 06:30:25PM +0200, Sylwester Nawrocki wrote:
> This patch adds documentation of DT biding for the Midas sound complex.
> Partially based on the *txt version by Simon Shields <simon@lineageos.org>.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes for v2:
>  - fix wrong *-gpios entries in the example,
>  - mark sound-dai properties as required.
> ---
>  .../bindings/sound/samsung,midas-audio.yaml        | 108 +++++++++++++++++++++
>  1 file changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
> new file mode 100644
> index 0000000..fb685e51
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
> @@ -0,0 +1,108 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/samsung,midas-audio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung Midas audio complex with WM1811 codec
> +
> +maintainers:
> +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
> +
> +properties:
> +  compatible:
> +    const: samsung,midas-audio
> +
> +  model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: The user-visible name of this sound complex.
> +
> +  cpu:
> +    type: object
> +    properties:
> +      sound-dai:
> +        $ref: /schemas/types.yaml#/definitions/phandle-array

I think it is just a phandle, not an array?

> +        description: phandle to the I2S controller
> +    required:
> +      - sound-dai
> +
> +  codec:
> +    type: object
> +    properties:
> +      sound-dai:
> +        $ref: /schemas/types.yaml#/definitions/phandle-array

The same.

Best regards,
Krzysztof
