Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C0C6A33BD
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Feb 2023 20:43:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B101832;
	Sun, 26 Feb 2023 20:43:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B101832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677440635;
	bh=J0km2FGGIQpGApXfCgQPLtvuY01QV6tTcY6a/StdI8g=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aWhy0d5qSXxorYlF/chfbrp3TRoT9rFi26BGhq8q+FkSs0KMqmTz5DXFo3+F5k+WD
	 jLDttSJTq8so4I/ENsJdu0+iOk+L5d9XPtNE8Dk7MIaVca753hisT6g7I/x9GwztFN
	 9fHW3bWEEMGJoNZdadNSOodh0A+x23jSzSCRp2pU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3CB4F802BE;
	Sun, 26 Feb 2023 20:43:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCC3FF8049C; Sun, 26 Feb 2023 20:43:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0BA33F80236
	for <alsa-devel@alsa-project.org>; Sun, 26 Feb 2023 20:42:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BA33F80236
Received: by mail-il1-f172.google.com with SMTP id i4so2936000ils.1
        for <alsa-devel@alsa-project.org>;
 Sun, 26 Feb 2023 11:42:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UtT+Z3pFPpOEqZmngNc+yA6W219QO8If0bra67yUF28=;
        b=l9hC5F6xuj5tNftL/bGLg9KkU68Wsc719vmgPFjZBM6zK/dD3G9VMdoko88N659ZNp
         vpIDvdD4Uhmx+2PRwraM4368myXWEFhti7eBJiDj9mntr4aaIhI6YZDGiDX7Tt/3FlfB
         mQ8ycMvCdLjtmOiqjgYeu30eDUiIvqqwgNiuMMrsJI9uPSIxnf5jiTyh2IUaziKJtPcH
         54ikHXIb9TlWlDBA7lL9mENyrjvYnDCJSL/occRgH23RaaVCd2BJAvjz7M/E+XrM57cr
         ijTZfCTlEjJ9c2p3FHAPIvPioshTQbYRYezaOueLQ3D6dowmion/wHtq5pBWkK33HdIn
         T+Yw==
X-Gm-Message-State: AO0yUKXoAYctQtyQWyJ+lzOaZ/wB19XxOum5Fgh8WvC2sAgyrz1ECT15
	jofz4GYAymwr4xoNLE2afQ==
X-Google-Smtp-Source: 
 AK7set+Mmdqra371m8aWNR9Mf1y+Mo8dbFVW+d9I13ug2maKvRB/Jd3LigcdwUGIRXdeDS8Xw4aJRQ==
X-Received: by 2002:a05:6e02:1445:b0:316:e54a:828f with SMTP id
 p5-20020a056e02144500b00316e54a828fmr16022653ilo.6.1677440576320;
        Sun, 26 Feb 2023 11:42:56 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:8ddf:ff6b:c94c:94fd:4442])
        by smtp.gmail.com with ESMTPSA id
 k6-20020a02a706000000b003c48d97bea7sm1495927jam.147.2023.02.26.11.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 11:42:55 -0800 (PST)
Received: (nullmailer pid 197344 invoked by uid 1000);
	Sun, 26 Feb 2023 19:42:51 -0000
Date: Sun, 26 Feb 2023 13:42:51 -0600
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [PATCH v1 08/10] dt-bindings: dsp: add Fortemedia FM34 DSP
Message-ID: <20230226194251.GA192429-robh@kernel.org>
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-9-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221183211.21964-9-clamor95@gmail.com>
Message-ID-Hash: SIMKI7Q5XS7M7UVYGM64FT3AL3IQNXQT
X-Message-ID-Hash: SIMKI7Q5XS7M7UVYGM64FT3AL3IQNXQT
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.com>, Maxim Schwalm <maxim.schwalm@gmail.com>,
 Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SIMKI7Q5XS7M7UVYGM64FT3AL3IQNXQT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Feb 21, 2023 at 08:32:09PM +0200, Svyatoslav Ryhel wrote:
> Add dt-binding for Fortemedia FM34NE DSP.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../bindings/dsp/fortemedia,dsp.yaml          | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dsp/fortemedia,dsp.yaml
> 
> diff --git a/Documentation/devicetree/bindings/dsp/fortemedia,dsp.yaml b/Documentation/devicetree/bindings/dsp/fortemedia,dsp.yaml
> new file mode 100644
> index 000000000000..78f30969d9bf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dsp/fortemedia,dsp.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dsp/fortemedia,dsp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Fortemedia DSP core
> +
> +maintainers:
> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> +
> +description: |

Don't need '|'

> +  Asus Transformer T20/T30 tablet family contains a DSP core
> +  used for advanced noise cancellation.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - asus,tf101-dsp
> +          - asus,tf201-dsp
> +          - asus,tf300t-dsp
> +          - asus,tf700t-dsp
> +          - pegatron,chagall-dsp
> +

Drop blank line.

> +      - const: fortemedia,fm34
> +
> +  reg:
> +    maxItems: 1
> +
> +  bypass-gpios:

Needs a description what this is.

> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  vdd-supply: true
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: mclk
> +
> +  assigned-clocks:
> +    maxItems: 1
> +
> +  assigned-clock-parents:
> +    maxItems: 1
> +
> +  assigned-clock-rates:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/tegra30-car.h>
> +    #include <dt-bindings/soc/tegra-pmc.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        dsp@60 {
> +            compatible = "asus,tf201-dsp", "fortemedia,fm34";
> +            reg = <0x60>;
> +
> +            bypass-gpios = <&gpio 222 0>;
> +            reset-gpios = <&gpio 115 1>;
> +
> +            vdd-supply = <&vdd_1v8_dsp>;
> +
> +            clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
> +            clock-names = "mclk";
> +
> +            assigned-clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
> +            assigned-clock-parents = <&tegra_car TEGRA30_CLK_EXTERN1>;
> +        };
> +    };
> +
> +    vdd_1v8_dsp: regulator-dsp {
> +        compatible = "regulator-fixed";
> +        regulator-name = "vdd_1v8_dsp";
> +        regulator-min-microvolt = <1800000>;
> +        regulator-max-microvolt = <1800000>;
> +        gpio = <&gpio 165 0>;
> +        enable-active-high;
> +    };

Drop this node. No need to show providers in consumer examples.

Rob
