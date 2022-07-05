Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C17B75677B9
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 21:24:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5814F1696;
	Tue,  5 Jul 2022 21:23:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5814F1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657049061;
	bh=aKh11eT849o9eiym54eIKb7E6EpfGMkrjWJIf8RaClc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bv3i9WU3LWRpPpikGAipALxuMFOpMM22/8wrbiPftotbHzAiU3txkSpY62FtcJrg5
	 bBdbJgutl9DihbBSyySN51eIvZsqx9EtSEElA6+S93F+bZ2frWbWisBrg318CDK4Ig
	 KkDKqFSv+7i2OQa2wFStJh7WItNz2IHrQqH7LzI0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A99ADF80104;
	Tue,  5 Jul 2022 21:23:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7188F8015B; Tue,  5 Jul 2022 21:23:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2E98F80104
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 21:23:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2E98F80104
Received: by mail-io1-f43.google.com with SMTP id p69so12056219iod.10
 for <alsa-devel@alsa-project.org>; Tue, 05 Jul 2022 12:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H5eyFsH62ZCOMR5j44c7qDXl+L0Xiqo5oRXL7/M/n9U=;
 b=Ls6AnGbn47YanEhAeJr7Ehd3G+XYjYN76GB9j6KiBUgOEK40N/QUWTI0FakAL5fZ8T
 n3enAmlpcYEObvan//p1RUJ+o93+jvakwD7Wiw8mzI4C7nBH8rf032VIeqHOZwkOvblT
 VB1UuePCLSlDZqDPCdfFMAr914lBhgNlu+zFv5fdxx9vnhV3sVuqlPb1J2vHH2yrVgAR
 mAkRv8igVhXsCidIFmY4n842KEKKK97sWcLeVGgijzGsVpXSpjmbU8eH8X4VjV6vOzMk
 JbLIiN47LtI+FqwaYhd7VhQPnUT+RYJKGkT4MVqhzZ09evpJtfKwBEQHfG3oiLsAZpLr
 OcCg==
X-Gm-Message-State: AJIora+FJS1dwrReBoxTWx6SUWlA3QbWA+HHi/Jx09C72nCaAFU8p1Le
 GpuNcaMQK1VB10mP2q317w==
X-Google-Smtp-Source: AGRyM1u0fHCnFee1kEPRUg0SqoCFPI8COBha8zPrSVGZ62b76/VvOoRH5cPG5r4Gv3xkb5zkrF1YIg==
X-Received: by 2002:a05:6638:3014:b0:317:9daf:c42c with SMTP id
 r20-20020a056638301400b003179dafc42cmr22147925jak.10.1657048990513; 
 Tue, 05 Jul 2022 12:23:10 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 c1-20020a6bfd01000000b00675139dbff9sm14725537ioi.48.2022.07.05.12.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 12:23:10 -0700 (PDT)
Received: (nullmailer pid 2477219 invoked by uid 1000);
 Tue, 05 Jul 2022 19:23:07 -0000
Date: Tue, 5 Jul 2022 13:23:07 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v4 05/14] dt-bindings: memory-controllers: add canaan
 k210 sram controller
Message-ID: <20220705192307.GA2471961-robh@kernel.org>
References: <20220701192300.2293643-1-conor@kernel.org>
 <20220701192300.2293643-6-conor@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220701192300.2293643-6-conor@kernel.org>
Cc: Niklas Cassel <niklas.cassel@wdc.com>, alsa-devel@alsa-project.org,
 David Airlie <airlied@linux.ie>, Palmer Dabbelt <palmer@rivosinc.com>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jose Abreu <joabreu@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Dillon Min <dillon.minfei@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Daniel Vetter <daniel@ffwll.ch>,
 dmaengine@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>
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

On Fri, Jul 01, 2022 at 08:22:51PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The k210 U-Boot port has been using the clocks defined in the
> devicetree to bring up the board's SRAM, but this violates the
> dt-schema. As such, move the clocks to a dedicated node with
> the same compatible string & document it.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../memory-controllers/canaan,k210-sram.yaml  | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml b/Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
> new file mode 100644
> index 000000000000..82be32757713
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/memory-controllers/canaan,k210-sram.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Canaan K210 SRAM memory controller
> +
> +description: |

Don't need '|'.

> +  The Canaan K210 SRAM memory controller is initialised and programmed by
> +  firmware, but an OS might want to read its registers for error reporting
> +  purposes and to learn about the DRAM topology.

How the OS going to do that? You don't have any way defined to access 
the registers.

Also, where is the SRAM address itself defined?

> +
> +maintainers:
> +  - Conor Dooley <conor@kernel.org>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - canaan,k210-sram
> +
> +  clocks:
> +    minItems: 1
> +    items:
> +      - description: sram0 clock
> +      - description: sram1 clock
> +      - description: aisram clock
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: sram0
> +      - const: sram1
> +      - const: aisram
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/k210-clk.h>
> +    memory-controller {
> +        compatible = "canaan,k210-sram";
> +        clocks = <&sysclk K210_CLK_SRAM0>,
> +                 <&sysclk K210_CLK_SRAM1>,
> +                 <&sysclk K210_CLK_AI>;
> +        clock-names = "sram0", "sram1", "aisram";
> +    };
> -- 
> 2.37.0
> 
> 
