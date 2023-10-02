Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 340F27B58C5
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Oct 2023 19:32:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46FFCA4A;
	Mon,  2 Oct 2023 19:31:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46FFCA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696267921;
	bh=OdlZ5THuUArLfRy0wPc5UG7mfiwyH1fEuvpKiBXwcrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OX2IHVt4bRJBAu5lPaw+06BpQzZ4VOfqHFsWpMOrUcX27uR/t3PhgYX1ZSHGaJ1b4
	 I++0YZWZUyvVX+teJZ8UTpyGfuABtOpmH/j9RgvsKe+Qc/fns7oC2CzTll3o9S2cO7
	 ebnAiZNQmAVrFo57T0pnW3YMAeMqABxeRgdOieLM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE76CF80552; Mon,  2 Oct 2023 19:30:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56076F802E8;
	Mon,  2 Oct 2023 19:30:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B326F80310; Mon,  2 Oct 2023 19:30:44 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 410E6F800C1
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 19:30:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 410E6F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WLDvTlVr
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1EE0E60F8F;
	Mon,  2 Oct 2023 17:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B79C433C7;
	Mon,  2 Oct 2023 17:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696267825;
	bh=OdlZ5THuUArLfRy0wPc5UG7mfiwyH1fEuvpKiBXwcrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WLDvTlVrxZp+ubgMERGBLIgHk6VMW4gyrqvh6mAAY+mHvtfSK005LoanH0gVddMIF
	 dv6MrJ8iXIX8S5kE74NfsNKvWsSgPX0bl4B/psz3ESsD5XzS7o4s96vlCPREA25czC
	 tijyU5A+aReBkq0z80oyP9APXu6XkA7ib7irSiLHoPG9kzDlpUYeOMLna/gyLBZz8Q
	 tcAgkYfXWtiFK93iad2cRXQY12s76l3zqk3dF2u2o8+S58OpoSymvEwH5IRF1I4g2t
	 PUu/LV3ItEkvomp2fk/sFlrkgrkeKKqHFuyIkMgWKp3SENERPcMqNcLi2GvRCK8K2E
	 q4ZQpq6SN+/+A==
Received: (nullmailer pid 2046960 invoked by uid 1000);
	Mon, 02 Oct 2023 17:30:19 -0000
Date: Mon, 2 Oct 2023 12:30:19 -0500
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
Subject: Re: [PATCH v5 01/11] dt-bindings: document generic access controller
Message-ID: <20231002173019.GA2037244-robh@kernel.org>
References: <20230929142852.578394-1-gatien.chevallier@foss.st.com>
 <20230929142852.578394-2-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230929142852.578394-2-gatien.chevallier@foss.st.com>
Message-ID-Hash: ATKTSRVLOONFIY73X6GTDD3JVHSYIBKY
X-Message-ID-Hash: ATKTSRVLOONFIY73X6GTDD3JVHSYIBKY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ATKTSRVLOONFIY73X6GTDD3JVHSYIBKY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Sep 29, 2023 at 04:28:42PM +0200, Gatien Chevallier wrote:
> From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
> 
> Introducing of the generic access controller bindings for the
> access controller provider and consumer devices. Those bindings are
> intended to allow a better handling of accesses to resources in a
> hardware architecture supporting several compartments.
> 
> This patch is based on [1]. It is integrated in this patchset as it
> provides a use-case for it.
> 
> Diffs with [1]:
> 	- Rename feature-domain* properties to access-control* to narrow
> 	  down the scope of the binding
> 	- YAML errors and typos corrected.
> 	- Example updated
> 	- Some rephrasing in the binding description
> 
> [1]: https://lore.kernel.org/lkml/0c0a82bb-18ae-d057-562b
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> 
> ---
> Changes in V5:
> 	- Diffs with [1]
> 	- Discarded the [IGNORE] tag as the patch is now part of the
> 	  patchset
> 
>  .../access-controllers/access-controller.yaml | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/access-controllers/access-controller.yaml
> 
> diff --git a/Documentation/devicetree/bindings/access-controllers/access-controller.yaml b/Documentation/devicetree/bindings/access-controllers/access-controller.yaml
> new file mode 100644
> index 000000000000..9d305fccc333
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/access-controllers/access-controller.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/access-controllers/access-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic Domain Access Controller
> +
> +maintainers:
> +  - Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> +
> +description: |+
> +  Common access controllers properties
> +
> +  Access controllers are in charge of stating which of the hardware blocks under
> +  their responsibility (their domain) can be accesssed by which compartment. A
> +  compartment can be a cluster of CPUs (or coprocessors), a range of addresses
> +  or a group of hardware blocks. An access controller's domain is the set of
> +  resources covered by the access controller.
> +
> +  This device tree bindings can be used to bind devices to their access
> +  controller provided by access-controller property. In this case, the device is
> +  a consumer and the access controller is the provider.
> +
> +  An access controller can be represented by any node in the device tree and
> +  can provide one or more configuration parameters, needed to control parameters
> +  of the consumer device. A consumer node can refer to the provider by phandle
> +  and a set of phandle arguments, specified by '#access-controller-cells'
> +  property in the access controller node.
> +
> +  Access controllers are typically used to set/read the permissions of a
> +  hardware block and grant access to it. Any of which depends on the access
> +  controller. The capabilities of each access controller are defined by the
> +  binding of the access controller device.
> +
> +  Each node can be a consumer for the several access controllers.
> +
> +# always select the core schema
> +select: true
> +
> +properties:
> +  "#access-controller-cells":
> +    $ref: /schemas/types.yaml#/definitions/uint32

Drop. "#.*-cells" already defines the type.

> +    description:
> +      Number of cells in a access-controller specifier;
> +      Can be any value as specified by device tree binding documentation
> +      of a particular provider.
> +
> +  access-control-provider:
> +    description:
> +      Indicates that the node is an access controller.

Drop. The presence of "#access-controller-cells" is enough to do that.

> +
> +  access-controller-names:
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    description:
> +      A list of access-controller names, sorted in the same order as
> +      access-controller entries. Consumer drivers will use
> +      access-controller-names to match with existing access-controller entries.
> +
> +  access-controller:

For consistency with other provider bindings: access-controllers

> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      A list of access controller specifiers, as defined by the
> +      bindings of the access-controller provider.
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    uart_controller: access-controller@50000 {
> +        reg = <0x50000 0x10>;
> +        access-control-provider;
> +        #access-controller-cells = <2>;
> +    };
> +
> +    bus_controller: bus@60000 {
> +        reg = <0x60000 0x10000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +        access-control-provider;
> +        #access-controller-cells = <3>;
> +
> +        uart4: serial@60100 {
> +            reg = <0x60100 0x400>;
> +            access-controller = <&uart_controller 1 2>,
> +                                <&bus_controller 1 3 5>;
> +            access-controller-names = "controller", "bus-controller";

Not great names. It should indicate what access is being controlled 
locally. Perhaps "reg" for register access, "dma" or "bus" for bus 
master access. (Not sure what your uart_controller is controlling access 
to.)

Rob
