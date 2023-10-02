Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB127B5A16
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Oct 2023 20:31:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45B2586E;
	Mon,  2 Oct 2023 20:31:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45B2586E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696271516;
	bh=1//f2YouULqAiADtTsQpdUerbTsC5x6cElTMSDp4Lbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lxr4FyPsTtjmEn1C21TyWrybBiRaQXyx6FQet68iyuyyKnuoAgNE6lKZrZAtyrPAG
	 33/Hqt8WVKW+BIbmJdNo57Al+PqxUyetrRUDSrWqxrbiycoLR6fkCm8eH/ODvZbGRw
	 6yvQruWoInc8vvluHHGi+AA59OOx9ag86/q/gQ+o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9309FF8055C; Mon,  2 Oct 2023 20:31:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46E00F801EB;
	Mon,  2 Oct 2023 20:31:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED2FAF802E8; Mon,  2 Oct 2023 20:31:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CFB9CF801EB
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 20:30:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFB9CF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bi3H48gw
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5374460FC0;
	Mon,  2 Oct 2023 18:30:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCEC6C433C7;
	Mon,  2 Oct 2023 18:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696271447;
	bh=1//f2YouULqAiADtTsQpdUerbTsC5x6cElTMSDp4Lbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bi3H48gw6TxHb/xgPIWTF4A7VE+gxBmVvSU7jPU4eG84RKGCb36Q1H8oCpmZDY7pl
	 Ez9aM3h3TYpqzKl1n3EzY6ldb8JrMq4tTDUeLBFWupzS8hMjEIU0HRFa+zRC2yckIQ
	 +CJlbmZVTJ8Fak0tJp+DJIPt2x8poJRCXlkBuPceq1pvv4sqBs9uLCeF9S3OHv4ANC
	 kz0kBvAdjIVIqPgS3qT6PGfaOJqNodNT3afHaTiLHzKX38+4mIcUZjRpbnxt+zbMhU
	 75XjXJAAf1jf9ezT5DAg6EvXJsMp4PLdmP64J66+EIYyaGwwTL2vB+qopg+2ZMR941
	 wVgsHp9MLI2Ug==
Received: (nullmailer pid 2308269 invoked by uid 1000);
	Mon, 02 Oct 2023 18:30:41 -0000
Date: Mon, 2 Oct 2023 13:30:41 -0500
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: Oleksii_Moisieiev@epam.com, gregkh@linuxfoundation.org,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	alexandre.torgue@foss.st.com, vkoul@kernel.org, jic23@kernel.org,
	olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com,
	mchehab@kernel.org, fabrice.gasnier@foss.st.com,
	andi.shyti@kernel.org, ulf.hansson@linaro.org, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, hugues.fruchet@foss.st.com,
	lee@kernel.org, will@kernel.org, catalin.marinas@arm.com,
	arnd@kernel.org, richardcochran@gmail.com,
	Frank Rowand <frowand.list@gmail.com>, peng.fan@oss.nxp.com,
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org, linux-p@alsa-project.org,
	hy@lists.infradead.org, linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 03/11] dt-bindings: bus: document RIFSC
Message-ID: <20231002183041.GA2062984-robh@kernel.org>
References: <20230929142852.578394-1-gatien.chevallier@foss.st.com>
 <20230929142852.578394-4-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230929142852.578394-4-gatien.chevallier@foss.st.com>
Message-ID-Hash: Q72BAWVO2KY7UHLFYCQGORNQCKJFLKNY
X-Message-ID-Hash: Q72BAWVO2KY7UHLFYCQGORNQCKJFLKNY
X-MailFrom: SRS0=McIo=FQ=robh_at_kernel.org=rob@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q72BAWVO2KY7UHLFYCQGORNQCKJFLKNY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Sep 29, 2023 at 04:28:44PM +0200, Gatien Chevallier wrote:
> Document RIFSC (RIF security controller). RIFSC is a firewall controller
> composed of different kinds of hardware resources.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
> 
> Changes in V5:
> 	- Renamed feature-domain* to access-control*
> 
> Changes in V2:
> 	- Corrected errors highlighted by Rob's robot
> 	- No longer define the maxItems for the "feature-domains"
> 	  property
> 	- Fix example (node name, status)
> 	- Declare "feature-domain-names" as an optional
> 	  property for child nodes
> 	- Fix description of "feature-domains" property
> 
>  .../bindings/bus/st,stm32mp25-rifsc.yaml      | 105 ++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
> new file mode 100644
> index 000000000000..c28fceff3036
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/st,stm32mp25-rifsc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32 Resource isolation framework security controller
> +
> +maintainers:
> +  - Gatien Chevallier <gatien.chevallier@foss.st.com>
> +
> +description: |
> +  Resource isolation framework (RIF) is a comprehensive set of hardware blocks
> +  designed to enforce and manage isolation of STM32 hardware resources like
> +  memory and peripherals.
> +
> +  The RIFSC (RIF security controller) is composed of three sets of registers,
> +  each managing a specific set of hardware resources:
> +    - RISC registers associated with RISUP logic (resource isolation device unit
> +      for peripherals), assign all non-RIF aware peripherals to zero, one or
> +      any security domains (secure, privilege, compartment).
> +    - RIMC registers: associated with RIMU logic (resource isolation master
> +      unit), assign all non RIF-aware bus master to one security domain by
> +      setting secure, privileged and compartment information on the system bus.
> +      Alternatively, the RISUP logic controlling the device port access to a
> +      peripheral can assign target bus attributes to this peripheral master port
> +      (supported attribute: CID).
> +    - RISC registers associated with RISAL logic (resource isolation device unit
> +      for address space - Lite version), assign address space subregions to one
> +      security domains (secure, privilege, compartment).
> +
> +properties:
> +  compatible:
> +    contains:
> +      const: st,stm32mp25-rifsc
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
> +
> +  "#access-controller-cells":
> +    const: 1

You should define what the cells contain here.

> +
> +  access-control-provider: true
> +
> +patternProperties:
> +  "^.*@[0-9a-f]+$":
> +    description: Peripherals
> +    type: object

       additionalProperties: true

> +    properties:
> +      access-controller:
> +        minItems: 1
> +        description:
> +          The phandle of the firewall controller of the peripheral and the
> +          platform-specific firewall ID of the peripheral.
> +
> +      access-controller-names:
> +        minItems: 1

Drop all this. You have to define these in the specific device schemas 
anyways.

> +
> +    required:
> +      - access-controller
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +  - access-control-provider
> +  - "#access-controller-cells"
> +  - ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    // In this example, the usart2 device refers to rifsc as its domain
> +    // controller.
> +    // Access rights are verified before creating devices.
> +
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    rifsc: bus@42080000 {
> +        compatible = "st,stm32mp25-rifsc";
> +        reg = <0x42080000 0x1000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        access-control-provider;
> +        #access-controller-cells = <1>;
> +        ranges;
> +
> +        usart2: serial@400e0000 {
> +              compatible = "st,stm32h7-uart";
> +              reg = <0x400e0000 0x400>;
> +              interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
> +              clocks = <&ck_flexgen_08>;
> +              access-controller = <&rifsc 32>;
> +        };
> +    };
> -- 
> 2.25.1
> 
