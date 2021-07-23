Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3AD3D423D
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jul 2021 23:34:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D74741759;
	Fri, 23 Jul 2021 23:33:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D74741759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627076072;
	bh=ftKMPQV5BB8o6LM0or3IZ3j+tC46k/ytr94AxMTAjs0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RnuQQgTgcu3E88MyiJyycF/FUQa2md+t92Apc/9G3Eqq1Q48DuLBJ5DxVzAfDOXlB
	 JNZme6CPEv6Lnzuz9eaJcitKAlBhPhoV3PKCkJFBmXEdbQpLUAtgfzWzGwXNctTfrN
	 7/AdY0SRelG29WE84/3CSo1J6OHXMCkEmav9/F8s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 588D9F804AD;
	Fri, 23 Jul 2021 23:33:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59D51F804AC; Fri, 23 Jul 2021 23:33:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA5E4F80086
 for <alsa-devel@alsa-project.org>; Fri, 23 Jul 2021 23:32:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA5E4F80086
Received: by mail-il1-f169.google.com with SMTP id q18so2790364ile.9
 for <alsa-devel@alsa-project.org>; Fri, 23 Jul 2021 14:32:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f/WiKoWyV9QptWIwMFMCYOpe69XG23M9PXTcI/Bn9Hs=;
 b=gnPTpPt/wGEn9/mmJq3AYtSLBfmrxC1Kn7Nd9xFJ6GcZzMf9DneIVkOPsgmEFgG0iw
 tPXBdVCznIt3jaCCU+bXmoVhuaW27OcIWA4IeYdkkqZqxURn3R+2SoXvkdtFfWy/H/YM
 iw//pdLSBFw2GYk4hRdQVRbTdXIDaq7T0IEdLDXA19ZZGII4aCOfoU86vX9b5T9g7or2
 yqTAT90AEU7ObvjSkmNkNKasWN2BwJlIls6KDWP9YIhGvNGSQHmbhHF5itBYTuC+bkGV
 OULcsiBmcfM4Huwx2ZJ5bpVBWXIxROrqRAx5YB4dtGZ1GRZLkmf0ufsY44i3+IK8XaHk
 ch+Q==
X-Gm-Message-State: AOAM530KNTmJl+OcUsBS2MKK8VBSaLP2CDRYeATTpc21P+ivyoescbJu
 LG31cJ73iyiHNknKRaXrkw==
X-Google-Smtp-Source: ABdhPJwypJ9szGQNGPcy/ytm0d1Lgd/fJuURL2NlVTYGgoc2gbp1KoH5R5FUZ/tVzHOOxfFZHWQIaw==
X-Received: by 2002:a92:d10c:: with SMTP id a12mr4885234ilb.100.1627075973524; 
 Fri, 23 Jul 2021 14:32:53 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id w8sm16224487ill.50.2021.07.23.14.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 14:32:52 -0700 (PDT)
Received: (nullmailer pid 2625227 invoked by uid 1000);
 Fri, 23 Jul 2021 21:32:51 -0000
Date: Fri, 23 Jul 2021 15:32:51 -0600
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 01/54] ASoC: dt-bindings: Add WM8978 Binding
Message-ID: <20210723213251.GA2622319@robh.at.kernel.org>
References: <20210721140424.725744-1-maxime@cerno.tech>
 <20210721140424.725744-2-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210721140424.725744-2-maxime@cerno.tech>
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, linux-sunxi@googlegroups.com,
 Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

On Wed, Jul 21, 2021 at 04:03:31PM +0200, Maxime Ripard wrote:
> Even though we had the wm8978 driver for some time and a number of
> boards using it already, we never had a binding for it. Let's add it
> based on what the driver expects and the boards are providing.
> 
> Cc: alsa-devel@alsa-project.org
> Cc: devicetree@vger.kernel.org
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../devicetree/bindings/sound/wlf,wm8978.yaml | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8978.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8978.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8978.yaml
> new file mode 100644
> index 000000000000..6761380261e3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/wlf,wm8978.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/wlf,wm8978.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Wolfson WM8978 Codec Device Tree Bindings
> +
> +maintainers:
> +  - Mark Brown <broonie@kernel.org>

No one from Wolfson cares about this device?

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

> +
> +properties:
> +  '#sound-dai-cells':
> +    const: 0
> +
> +  compatible:
> +    const: wlf,wm8978
> +
> +  reg:
> +    maxItems: 1
> +
> +  spi-max-frequency:
> +    maximum: 526000
> +
> +required:
> +  - '#sound-dai-cells'
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        codec@0 {
> +            #sound-dai-cells = <0>;
> +            compatible = "wlf,wm8978";
> +            reg = <0>;
> +            spi-max-frequency = <500000>;
> +        };
> +    };
> +
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        codec@0 {
> +            #sound-dai-cells = <0>;
> +            compatible = "wlf,wm8978";
> +            reg = <0>;
> +        };
> +    };
> +
> +...
> -- 
> 2.31.1
> 
> 
