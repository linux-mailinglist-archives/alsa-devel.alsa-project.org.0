Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5160F85FAEC
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Feb 2024 15:17:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3972A4B;
	Thu, 22 Feb 2024 15:17:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3972A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708611455;
	bh=SZ/Zk8BWOQjTPubYMUBoHg3tSEyPhODwMelB+zqkglQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dSCThDYP0w2M53l9SdX/oGY0ui30eqog4afZiXzE13/BXpJ/5E237WANFjPGdhKfs
	 ZAPKuE89pr1i3+JpvOM7QMYwRbnrfibbK1gx5jXei012I2lxVgQnm7HY6jJuSwdGeH
	 c04XC+AO46Gs24dzobXYlF2IlVI5MxKdyBa8YM/E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39FDFF805AA; Thu, 22 Feb 2024 15:16:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 396FDF805A0;
	Thu, 22 Feb 2024 15:16:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A689F80496; Thu, 22 Feb 2024 15:16:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C773F8019B
	for <alsa-devel@alsa-project.org>; Thu, 22 Feb 2024 15:16:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C773F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=swmaF298
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 735BA61876;
	Thu, 22 Feb 2024 14:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D59C433C7;
	Thu, 22 Feb 2024 14:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708611385;
	bh=SZ/Zk8BWOQjTPubYMUBoHg3tSEyPhODwMelB+zqkglQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=swmaF2984HLAl0s/d0P4xSdY/AMjSYjub6C/25DGguLpnzREhpoGB6RsRh0ImwSUk
	 U80FUff6MDpnpx6VTr5ryRBxGQ5fI3qwuoT9pTLIBiZeZb8k90PucUg93E3D5iV4s2
	 hPSzdmEAwq+ir2fRC4vauk+nWBdSlBvJd3dNuiEzMbuLHSKka8WQU3Scep9y92xKai
	 Ozpdnqy8rZir9ppdzGr19FXzCoZyNPxI7pAKa/wJObtJZrn9j2w2psydtZoDKPy5M1
	 zyLKOIgpZ7mvXixgVcb0Xu/SkLD7n/T9aTfLdPQrfnvLNpm63sse7N/hAqWyGy2RgH
	 ZvvWsvgM/QbRw==
Date: Thu, 22 Feb 2024 07:16:22 -0700
From: Rob Herring <robh@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	conor+dt@kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
	CTLIN0@nuvoton.com, SJLIN0@nuvoton.com, scott6986@gmail.com,
	supercraig0719@gmail.com, dardar923@gmail.com
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: Added schema for
 "nuvoton,nau8325"
Message-ID: <20240222141622.GA2748112-robh@kernel.org>
References: <20240222083825.190854-1-wtli@nuvoton.com>
 <20240222083825.190854-2-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240222083825.190854-2-wtli@nuvoton.com>
Message-ID-Hash: BFZZ4V5V4LI7MLCSXJVZSNE2KWJ5TNVS
X-Message-ID-Hash: BFZZ4V5V4LI7MLCSXJVZSNE2KWJ5TNVS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BFZZ4V5V4LI7MLCSXJVZSNE2KWJ5TNVS/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Feb 22, 2024 at 04:38:24PM +0800, Seven Lee wrote:
> Added a DT schema for describing nau8325 audio amplifiers.

Please test your bindings before sending.

> 
> Signed-off-by: Seven Lee <wtli@nuvoton.com>
> ---
>  .../bindings/sound/nuvoton,nau8325.yaml       | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml
> new file mode 100644
> index 000000000000..fc72baf0bb7a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/nuvoton,nau8325.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NAU8325 audio Amplifier
> +
> +maintainers:
> +  - Seven Lee <WTLI@nuvoton.com>
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: nuvoton,nau8325
> +
> +  reg:
> +    maxItems: 1
> +
> +  nuvoton,vref-impedance:
> +    $ref: /schemas/types.yaml#/definitions/uint32

Use standard unit suffixes.

> +    description:
> +      VREF impedance selection.
> +    enum:
> +      - 0 # Open
> +      - 1 # 25kOhm
> +      - 2 # 125kOhm
> +      - 3 # 2.5kOhm
> +    default: 2
> +
> +  nuvoton,dac-vref:
> +    $ref: /schemas/types.yaml#/definitions/uint32

Use standard unit suffixes.

> +    description:
> +      DAC Reference Voltage Setting.
> +    enum:
> +      - VDDA

in Volts?

> +      - VDDA*1.5/1.8V

Volts/Volts

So 2 different units?

> +      - VDDA*1.6/1.8V
> +      - VDDA*1.7/1.8V
> +    default: 2
> +
> +  nuvoton,alc-enable:
> +    description:
> +      Enable digital automatic level control (ALC) function.
> +    type: boolean
> +
> +  nuvoton,clock-detection-disable:
> +    description:
> +      When clock detection is enabled, it will detect whether MCLK
> +      and FS are within the range. MCLK range is from 2.048MHz to 24.576MHz.
> +      FS range is from 8kHz to 96kHz.
> +    type: boolean
> +
> +  nuvoton,clock-det-data:
> +    description:
> +      Request clock detection to require 2048 non-zero samples before enabling
> +      the audio paths. If set then non-zero samples is required, otherwise it
> +      doesn't matter.
> +    type: boolean
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        codec@21 {
> +            compatible = "nuvoton,nau8325";
> +            reg = <0x21>;
> +            nuvoton,vref-impedance = <2>;
> +            nuvoton,dac-vref = <2>;
> +            nuvoton,alc-enable;
> +            nuvoton,clock-det-data;
> +        };
> +    };
> -- 
> 2.25.1
> 
