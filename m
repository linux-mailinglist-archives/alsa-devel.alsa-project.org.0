Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C2187DFE9
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Mar 2024 21:04:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 834CE265E;
	Sun, 17 Mar 2024 21:04:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 834CE265E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710705897;
	bh=5REz72U9EXohcBm4t1ISQL1fVcumFebJbP7464UzW58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SKNHWfsA2DXp8NxY8il0lqDLWgtpio1B8ZcVFzUw7QHyWq/ftmXrgx4uT6x5ilzDC
	 08PYts4gkcO5bBEVr7HlHkJlOBnidJ0n0vs7vSMbaHYcqXJpAzUD8sckmw8FZqDW+r
	 cArrQRGPXzGe/IsAlvjBQ08m2H7ks39jEn6OJWH8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98700F805A9; Sun, 17 Mar 2024 21:04:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59783F805A0;
	Sun, 17 Mar 2024 21:04:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BF19F804E7; Sun, 17 Mar 2024 21:04:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1ECF9F8025F
	for <alsa-devel@alsa-project.org>; Sun, 17 Mar 2024 21:04:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1ECF9F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qNz/dLcX
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0BB6A60AEF;
	Sun, 17 Mar 2024 20:04:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62B2DC433C7;
	Sun, 17 Mar 2024 20:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710705847;
	bh=5REz72U9EXohcBm4t1ISQL1fVcumFebJbP7464UzW58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qNz/dLcXv0wcHjcVrtYves10JWPaWLj69D66ZAG/JP5m0DvbluCEPotJjYIH0oKor
	 KoXt4ogga/oB/Xzh9sV5rZ3t42s1XTWwRre+zYqp2K1plAv+P++eS0X5y3qmmJr1R4
	 DsMb5rC9pyEU8XGCPrwkRiaoaq1x6K7I1fCJe7RuQBEz2Fi3/hW4/Ph5vbVkWPXXUU
	 dwX99GJz0vgQSXX5eLSwF2/QWvkjEPLHqEXjePj0m8uhSb5wjGYk4mYuYY+F4HDaSN
	 aD8a1lBmc6lQzqLk6EjHGwf/pcw+1bRfXF02k1PDkxuys5DfN4FCh7Tl4dCEy88XR5
	 2HPCQeIFjGm+g==
Date: Sun, 17 Mar 2024 14:04:04 -0600
From: Rob Herring <robh@kernel.org>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	herve.codina@bootlin.com, christophercordahi@nanometrics.ca
Subject: Re: [PATCH 01/13] ASoC: dt-bindings: davinci-mcbsp: convert McBSP
 bindings to yaml schema
Message-ID: <20240317200404.GA2123402-robh@kernel.org>
References: <20240315112745.63230-1-bastien.curutchet@bootlin.com>
 <20240315112745.63230-2-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240315112745.63230-2-bastien.curutchet@bootlin.com>
Message-ID-Hash: DP5GGM4T65PEHEL7FJZYLX47P6SHROQG
X-Message-ID-Hash: DP5GGM4T65PEHEL7FJZYLX47P6SHROQG
X-MailFrom: robh@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DP5GGM4T65PEHEL7FJZYLX47P6SHROQG/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Mar 15, 2024 at 12:27:33PM +0100, Bastien Curutchet wrote:
> Convert the binding for McBSP controllers for TI SoCs from txt
> to YAML schema.
> 
> Add properties 'clocks', 'clock-names', 'power-domains' and
> '#sound-dai-cells' which were missing from the txt file.
> Add '#sound-dai-cells' and 'clocks' in the example which were missing
> from the txt file.
> 
> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
> ---
>  .../bindings/sound/davinci-mcbsp.txt          | 50 ----------
>  .../bindings/sound/davinci-mcbsp.yaml         | 96 +++++++++++++++++++
>  2 files changed, 96 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/davinci-mcbsp.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml

> diff --git a/Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml b/Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml
> new file mode 100644
> index 000000000000..8b0e9b5da08f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml
> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/davinci-mcbsp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: McBSP Controller for TI SoCs
> +
> +maintainers:
> +  - Bastien Curutchet <bastien.curutchet@bootlin.com>
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,da850-mcbsp
> +
> +  reg:
> +    minItems: 1
> +    items:
> +      - description: CFG registers
> +      - description: data registers
> +
> +  reg-names:
> +    minItems: 1
> +    items:
> +      - const: mpu
> +      - const: dat
> +
> +  dmas:
> +    items:
> +      - description: transmission DMA channel
> +      - description: reception DMA channel
> +
> +  dma-names:
> +    items:
> +      - const: tx
> +      - const: rx
> +
> +  interrupts:
> +    items:
> +      - description: RX interrupt
> +      - description: TX interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: rx
> +      - const: tx
> +
> +  clocks:
> +    items:
> +      - description: functional clock
> +
> +  clock-names:
> +    items:
> +      - const: fck
> +
> +  power-domains:
> +    description: phandle to the corresponding power-domain

Drop

> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +required:
> +  - "#sound-dai-cells"
> +  - compatible
> +  - reg
> +  - reg-names
> +  - dmas
> +  - dma-names
> +  - clocks
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    mcbsp0: mcbsp0@1d10000 {

Drop unused label.


> +      #sound-dai-cells = <0>;
> +      compatible = "ti,da850-mcbsp";
> +      pinctrl-names = "default";
> +      pinctrl-0 = <&mcbsp0_pins>;
> +
> +      reg = <0x111000 0x1000>,
> +            <0x311000 0x1000>;
> +      reg-names = "mpu", "dat";
> +      interrupts = <97>, <98>;
> +      interrupt-names = "rx", "tx";
> +      dmas = <&edma0 3 1
> +              &edma0 2 1>;

<> around each entry.

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

> +      dma-names = "tx", "rx";
> +
> +      clocks = <&psc1 14>;
> +    };
> -- 
> 2.43.2
> 
