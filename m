Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F36A4D68B
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Mar 2025 09:33:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0F2E6030E;
	Tue,  4 Mar 2025 09:33:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0F2E6030E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741077232;
	bh=eoxVSvlYpLU4nYVQmp8hmagLMri1O0CXQYXZ6mhEMyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r8QJ/eEETtJDDg3eTDuvtQSJG1wGOhXN9bzo0syWgL0OIgUnrOqtRwcV9s85rowzG
	 5LaZ3pz+uFfd9DoWQyyPeeVKE4Ov+NJmqFzwvLz6jcbwEqGtRx1EUyJesLuugTnXGr
	 FkZXV7j45gqvIGr/6ZK0qz8jiIAVBARX/FQT31fI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DA6AF805B2; Tue,  4 Mar 2025 09:33:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A7EDF8057F;
	Tue,  4 Mar 2025 09:33:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15523F8051F; Tue,  4 Mar 2025 09:33:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E31E0F8049C
	for <alsa-devel@alsa-project.org>; Tue,  4 Mar 2025 09:32:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E31E0F8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XtklWRBH
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 570BAA45322;
	Tue,  4 Mar 2025 08:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 046ADC4CEE8;
	Tue,  4 Mar 2025 08:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741077164;
	bh=eoxVSvlYpLU4nYVQmp8hmagLMri1O0CXQYXZ6mhEMyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XtklWRBHc9I7QS26Ujhh8c8Djs960OKJK7PLQOJ3wRhKbG5w6A4cp18XqTukX6nEq
	 1JVuBkCxduf4oXjuxkEhP3IjoXUe12lsmZDHVSchJc+BRzi5odJ4TpXjh14oTb3sJ9
	 LVLjaKbCE4+b4ClF6kespdYlNmQIDJ3NpwQnKVwdHnOyYvhXuy+9uM4k8/NVYey+eT
	 NuYjrBWKRZ7SqCV90qHFrRJE1CN9M7FpmxZ9jWQ76+FDZf0lVhjBmYvrbCwMj9oHOJ
	 JlWTv1gFNaAD+8qyHJWJWYYXl4F3unc5v6J7Zi5w4At8Yb9peYLFCSEEKNipeWftQy
	 rOLN19jwBbH2A==
Date: Tue, 4 Mar 2025 09:32:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
	devicetree@vger.kernel.org, tiwai@suse.com,
 amadeuszx.slawinski@linux.intel.com,
	robh@kernel.org
Subject: Re: [PATCH v3 2/2] ASoC: dt-bindings: Add Everest ES8389 audio CODEC
Message-ID: <20250304-banana-penguin-of-abundance-6defe7@krzk-bin>
References: <20250304062737.51701-1-zhangyi@everest-semi.com>
 <20250304062737.51701-3-zhangyi@everest-semi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250304062737.51701-3-zhangyi@everest-semi.com>
Message-ID-Hash: JUPS4BXTRIEXMLLVBQVUO2C45WH3YW72
X-Message-ID-Hash: JUPS4BXTRIEXMLLVBQVUO2C45WH3YW72
X-MailFrom: krzk@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JUPS4BXTRIEXMLLVBQVUO2C45WH3YW72/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Mar 04, 2025 at 02:27:37PM +0800, Zhang Yi wrote:
> Add device tree binding documentation for Everest ES8389
> 
> Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
> ---
>  .../bindings/sound/everest,es8389.yaml        | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/everest,es8389.yaml
> 

<form letter>
Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC (and consider --no-git-fallback argument, so you will
not CC people just because they made one commit years ago). It might
happen, that command when run on an older kernel, gives you outdated
entries. Therefore please be sure you base your patches on recent Linux
kernel.

Tools like b4 or scripts/get_maintainer.pl provide you proper list of
people, so fix your workflow. Tools might also fail if you work on some
ancient tree (don't, instead use mainline) or work on fork of kernel
(don't, instead use mainline). Just use b4 and everything should be
fine, although remember about 'b4 prep --auto-to-cc' if you added new
patches to the patchset.
</form letter>

> diff --git a/Documentation/devicetree/bindings/sound/everest,es8389.yaml b/Documentation/devicetree/bindings/sound/everest,es8389.yaml
> new file mode 100644
> index 000000000000..2c522826bae4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/everest,es8389.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/everest,es8389.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Everest ES8389 audio CODEC
> +
> +maintainers:
> +  - Michael Zhang <zhangyi@everest-semi.com>
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: everest,es8389

Device is really different than es8388?

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: clock for master clock (MCLK)
> +
> +  clock-names:
> +    items:
> +      - const: mclk
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  everest,adc-slot:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    description: |
> +      This property is used to set the slots of recording data when multiple
> +      codecs are connected in PTDM mode.
> +      please set this property to default if you are setting STDM mode.
> +    minimum: 0x00

Drop, unsigned does not allow -1.

> +    maximum: 0x07
> +    default: 0x00

All of these should be rather decimal.

> +
> +  everest,dac-slot:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    description: |
> +      This property is used to set the slots of playing data when multiple
> +      codecs are connected in TDM mode.
> +      please do not set this property if you use single codec.
> +    minimum: 0x00
> +    maximum: 0x07
> +    default: 0x00
> +
> +  prefix_name:

No underscores in node names, missing vendor prefix... but more
important:  I don't understand the need for this property. Description
copies property name so it is not useful.

Drop. You maybe wanted dai prefix, but this is already in dai-common.


> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: device name prefix
> +
> +  everest,dmic-enabled:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      The property is a choice between PDM and AMIC
> +

No supplies?

> +required:
> +  - compatible
> +  - reg
> +  - "#sound-dai-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c{

Missing space.

> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      es8389: es8389@10 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +        compatible = "everest,es8389";
> +        reg = <0x10>;
> +        everest,adc-slot = [00];

Please open other bindings or DTS and take a look how single number is
encoded. In general, please rather base your work on latest bindings and
DTS accepted by reviewers and use them as learning/template to avoid
common mistakes. At least two comments in this review could be avoided
if you did this.

> +        everest,dac-slot = [00];
> +        prefix_name = "es8389_0";

Drop

> +        #sound-dai-cells = <0>;
> +      };
> +    };
> -- 
> 2.17.1
> 
