Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D3381C0AB
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Dec 2023 23:01:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21DB9AEA;
	Thu, 21 Dec 2023 23:01:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21DB9AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703196096;
	bh=BMceOrXlyCYOCEEShEWT7LKLuoQaU2WjKCUjRN8knws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Det/0DqXUt4jvDcPTOtjPH2N0vp7n+F4Qs9e+H0FBSag3YxcBEF7W5wucBxXRWchl
	 dueoT+oeXgqa2xUaLZzSIHoHy7tRXBrGAUILKIuoQ6bCBiweqChsM/VQrPRR0cuDbF
	 FVsdSecJpA3B1jom4r7qG0b6iUxlhLPUo2HvILQk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B640BF80570; Thu, 21 Dec 2023 23:01:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6929EF80578;
	Thu, 21 Dec 2023 23:01:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 534B9F80153; Thu, 21 Dec 2023 23:00:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B624BF800BD
	for <alsa-devel@alsa-project.org>; Thu, 21 Dec 2023 23:00:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B624BF800BD
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OmqWHv6N
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 19D16B82028;
	Thu, 21 Dec 2023 22:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27D74C433C7;
	Thu, 21 Dec 2023 22:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703196053;
	bh=BMceOrXlyCYOCEEShEWT7LKLuoQaU2WjKCUjRN8knws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OmqWHv6NHL5RK0Is2qEQ23JPVyjHnIwLpMnZVsM1GInSiGtW6Okr3vpqv1DO56haE
	 GLrLRJaZje8Qnhy+c/mSS9glUUI43LQsmj7JEpP7qGUf9a2bTvRNa6qFOe4oQEPMbh
	 nkzcuilXWobWBK1WD7QU4nYf9I4CC1eRtRmYZrcEwCEMEzaeSagbY+QV0pr5tiW6VZ
	 Hp+hwJA+wUwHdLW1d6YoHWalrif1QMXjtr5LG4SmXhIL4qJsQNZrBeKuWpMNWNmEyT
	 I6LGGm5RJXW1AYMP0zYlxaLnI5hW8+tnbSkAMW/cqeGm3JWND7/XQwVrjkyED8Z8Wq
	 05WJuXnmDeb4Q==
Received: (nullmailer pid 165405 invoked by uid 1000);
	Thu, 21 Dec 2023 22:00:49 -0000
Date: Thu, 21 Dec 2023 16:00:49 -0600
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
	lars@metafoo.de, rcsekar@samsung.com, wg@grandegger.com,
	mkl@pengutronix.de, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-medi@alsa-project.org, a@vger.kernel.org,
	linux-mmc@vger.kernel.org, netdev@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 04/13] dt-bindings: bus: document ETZPC
Message-ID: <20231221220049.GA156363-robh@kernel.org>
References: <20231212152356.345703-1-gatien.chevallier@foss.st.com>
 <20231212152356.345703-5-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212152356.345703-5-gatien.chevallier@foss.st.com>
Message-ID-Hash: XD2M3QBQUAVPYH2JR2CYP3Z4JOVGH5V5
X-Message-ID-Hash: XD2M3QBQUAVPYH2JR2CYP3Z4JOVGH5V5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XD2M3QBQUAVPYH2JR2CYP3Z4JOVGH5V5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Dec 12, 2023 at 04:23:47PM +0100, Gatien Chevallier wrote:
> Document ETZPC (Extended TrustZone protection controller). ETZPC is a
> firewall controller.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
> 
> Changes in V6:
>     	- Renamed access-controller to access-controllers
>     	- Removal of access-control-provider property
>     	- Removal of access-controller and access-controller-names
>     	  declaration in the patternProperties field. Add
>     	  additionalProperties: true in this field.
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
> 	- Reordered the properties so it matches ETZPC
> 	- Add missing "feature-domain-controller" property
> 
>  .../bindings/bus/st,stm32-etzpc.yaml          | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml b/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml
> new file mode 100644
> index 000000000000..9ca0ad39bc19
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bus/st,stm32-etzpc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32 Extended TrustZone protection controller
> +
> +description: |
> +  The ETZPC configures TrustZone security in a SoC having bus masters and
> +  devices with programmable-security attributes (securable resources).
> +
> +maintainers:
> +  - Gatien Chevallier <gatien.chevallier@foss.st.com>
> +
> +properties:
> +  compatible:
> +    contains:
> +      const: st,stm32-etzpc

Same here, needs 'simple-bus'.

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
> +    description:
> +      Contains the firewall ID associated to the peripheral.
> +
> +patternProperties:
> +  "^.*@[0-9a-f]+$":
> +    description: Peripherals
> +    type: object
> +
> +    additionalProperties: true
> +
> +    required:
> +      - access-controllers
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +  - "#access-controller-cells"
> +  - ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    // In this example, the usart2 device refers to rifsc as its access
> +    // controller.

Looks like the comment is wrong.


> +    // Access rights are verified before creating devices.
> +
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/stm32mp13-clks.h>
> +    #include <dt-bindings/reset/stm32mp13-resets.h>
> +
> +    etzpc: bus@5c007000 {
> +        compatible = "st,stm32-etzpc";
> +        reg = <0x5c007000 0x400>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        #access-controller-cells = <1>;
> +        ranges;
> +
> +        usart2: serial@4c001000 {
> +            compatible = "st,stm32h7-uart";
> +            reg = <0x4c001000 0x400>;
> +            interrupts-extended = <&exti 27 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&rcc USART2_K>;
> +            resets = <&rcc USART2_R>;
> +            wakeup-source;
> +            dmas = <&dmamux1 43 0x400 0x5>,
> +                    <&dmamux1 44 0x400 0x1>;
> +            dma-names = "rx", "tx";
> +            access-controllers = <&etzpc 17>;
> +        };
> +    };
> -- 
> 2.25.1
> 
