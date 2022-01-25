Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E8249A1CF
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jan 2022 01:26:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60B8F2838;
	Tue, 25 Jan 2022 01:25:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60B8F2838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643070368;
	bh=/llhb3MadjMXQlQrGtqBgDz99ZgxYlm1hYqabdKqxrw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uB1tSU9zLuJyLFCX/O2Nrh4semyKvy4s3MBx+tPV6nLavoasnfxbeiI6HnP5Tz8dI
	 mP0887e8NhOC1meHAN7+kyg1nyMCdaj4uLgoLf79nT6dq3UElBdnJA5lCjivi9EmPZ
	 pf/fz1uHThN6AKNmt7aZBmMsDzHfORHwirX6Isgo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7746F800E9;
	Tue, 25 Jan 2022 01:25:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B37C4F8027C; Tue, 25 Jan 2022 01:24:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9650F800E9
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 01:24:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9650F800E9
Received: by mail-ot1-f44.google.com with SMTP id
 g15-20020a9d6b0f000000b005a062b0dc12so3182710otp.4
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 16:24:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hKgu9rmUk95J97wO8FZCJYIlIG/PvU+dGhgzBVkVwN8=;
 b=4LTovXP2D1GwClMpqzWscOoWr+b4uaFUuaha7jtIX7E2dbQaGitzO0m1zjyFbXODiM
 3WRLUleG2H5/Kz9rS6zrQhb2/KvKXIMS44R18/X7AeCCA6xHQbzuMUfUb5c+W3pRGJm8
 k7/nVKEQYJaEtyD2fjl4wGU6fIVjc2zNZgI/it5vDQ3qXgdsDjpXPlB8xkwwu0BM1a5F
 5M1louYYTyP+2egLsVYfBfJetkg1AtFssa0fh1ogIcH8Q8/2TF1CZOzl8o94ArK6Eb/5
 nLLsA4aDUwHbo9zFg61D8pNaaQA3jdy0wVsY8vXf2UxRIqXc5w9JUHTk+Ub81uvP2ql1
 oupg==
X-Gm-Message-State: AOAM531v0kcjCqKeQbGb+R/NwO+ahuuwq5XDCYO3D2YYbvp9EX3bP+2D
 PAHYg+tl8iGLebzquoBxBg==
X-Google-Smtp-Source: ABdhPJwBQlZsDWkm3dE9/hvTrL4jN/68Lxk+HhTDBRoQqFgYwJwB6VNNcUYx1ZcvnXNEAfY0RZ18Zg==
X-Received: by 2002:a9d:5c86:: with SMTP id a6mr7103969oti.163.1643070291812; 
 Mon, 24 Jan 2022 16:24:51 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id a19sm2751280otf.27.2022.01.24.16.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 16:24:51 -0800 (PST)
Received: (nullmailer pid 809305 invoked by uid 1000);
 Tue, 25 Jan 2022 00:24:50 -0000
Date: Mon, 24 Jan 2022 18:24:50 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [RFC 5/6] ASoC: dt-bindings: samsung,snow: convert to dtschema
Message-ID: <Ye9DUjVGWDmhvPtu@robh.at.kernel.org>
References: <20220124170336.164320-1-krzysztof.kozlowski@canonical.com>
 <20220124170336.164320-5-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220124170336.164320-5-krzysztof.kozlowski@canonical.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Jonathan Bakker <xc-racer2@live.ca>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
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

On Mon, Jan 24, 2022 at 06:03:35PM +0100, Krzysztof Kozlowski wrote:
> Convert the audio complex on Google Snow boards with Samsung Exynos SoC
> to DT schema format.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> ---
> 
> TODO: The DTS do not pass cleanly. cpu/sound-dai should be fixed.
> ---
>  .../bindings/sound/samsung,snow.yaml          | 78 +++++++++++++++++++
>  .../devicetree/bindings/sound/snow.txt        | 31 --------
>  2 files changed, 78 insertions(+), 31 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/samsung,snow.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/snow.txt
> 
> diff --git a/Documentation/devicetree/bindings/sound/samsung,snow.yaml b/Documentation/devicetree/bindings/sound/samsung,snow.yaml
> new file mode 100644
> index 000000000000..df969b384839
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/samsung,snow.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/samsung,snow.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google Snow audio complex with MAX9809x codec
> +
> +maintainers:
> +  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - google,snow-audio-max98090
> +      - google,snow-audio-max98091
> +      - google,snow-audio-max98095
> +
> +  codec:
> +    type: object
> +    properties:
> +      sound-dai:
> +        description: List of phandles to the CODEC and HDMI IP nodes.
> +        $ref: /schemas/types.yaml#/definitions/phandle-array
> +        items:
> +          - description: Phandle to the MAX98090, MAX98091 or MAX98095 CODEC.
> +          - description: Phandle to the HDMI IP block node.

Thinking about this and the issue you raised some more, we should make 
sure there's a common definition for sound-dai. And then here, it should 
just be the number of entries ('maxItems: 1').

Rob
