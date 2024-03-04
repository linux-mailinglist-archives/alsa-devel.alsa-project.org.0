Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB808702DE
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Mar 2024 14:38:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E68D584D;
	Mon,  4 Mar 2024 14:38:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E68D584D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709559512;
	bh=Ph0t88urpiIfgX3lePmkozKVSowGvKDDtWxRZ0hH0SY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZLxPHMoGDPjVqlvseLcpqEnYyKP2SYQHUgOf72/NMqKIfoajVuxRRftMwZnC6egND
	 6ltNGggOrc/jPC2q+DHop9EbAVN1/1dMqxcIuC1wletIo3zMf3z0lQI3zudSSTm6a/
	 FGm6JO2vp6Jn6mTHyoQEdapELRAIpqlQxlDUpdL4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2923F805A0; Mon,  4 Mar 2024 14:38:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7017F805A0;
	Mon,  4 Mar 2024 14:38:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95228F8024E; Mon,  4 Mar 2024 14:37:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E6C36F80088
	for <alsa-devel@alsa-project.org>; Mon,  4 Mar 2024 14:37:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6C36F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=W6YTCCzx
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 86EA0CE12EC;
	Mon,  4 Mar 2024 13:37:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87519C433C7;
	Mon,  4 Mar 2024 13:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709559453;
	bh=Ph0t88urpiIfgX3lePmkozKVSowGvKDDtWxRZ0hH0SY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W6YTCCzx3azyARlHLnJKj7DlRItWL5zU5z7c2kkrB/veS/4VLDVzLIqutidwIFPXg
	 +oD7pa46iAuCawIFdTOfPQ6mc44Z6RgVRaTAjLlVuu3xNHt4PaUoswpEmeRc0FCZB3
	 mJmG7dn8ArXlzs0hQK0ZsgqgKemoQSyigGvy3Hn/ibL04I17ATwReEFGw+n4OZ65Gq
	 hwjgWQUX6h4vcG+oJiZQy4jZgJ2VuuWXyjYsTzlRXgicBTDfFdTVZBBkzhkrZP+6fd
	 AZbPzsmiLKkxUmA/Ho1OCOaCbT12Q1EOxlJn4pWPgRB+MrK2+VBcefw3oX6AR+aM0S
	 kRH+qRae3MZbg==
Date: Mon, 4 Mar 2024 07:37:31 -0600
From: Rob Herring <robh@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	conor+dt@kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
	CTLIN0@nuvoton.com, SJLIN0@nuvoton.com, scott6986@gmail.com,
	supercraig0719@gmail.com, dardar923@gmail.com
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: Added schema for
 "nuvoton,nau8325"
Message-ID: <20240304133731.GA105655-robh@kernel.org>
References: <20240304101523.538989-1-wtli@nuvoton.com>
 <20240304101523.538989-2-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304101523.538989-2-wtli@nuvoton.com>
Message-ID-Hash: K22Z5B7QNJ7RNWHXIQ4Q37R34MYBXBLV
X-Message-ID-Hash: K22Z5B7QNJ7RNWHXIQ4Q37R34MYBXBLV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K22Z5B7QNJ7RNWHXIQ4Q37R34MYBXBLV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Mar 04, 2024 at 06:15:22PM +0800, Seven Lee wrote:
> Added a DT schema for describing nau8325 audio amplifiers.

Present tense: Add a ...

Please say more about this device. Features, link to datasheet, etc.

> 
> Signed-off-by: Seven Lee <wtli@nuvoton.com>
> ---
>  .../bindings/sound/nuvoton,nau8325.yaml       | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100755 Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml

Schemas aren't executable. checkpatch.pl will tell you this.

> 
> diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml
> new file mode 100755
> index 000000000000..297d29462812
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml
> @@ -0,0 +1,74 @@
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
> +    description:
> +      VREF impedance selection.
> +    enum: ["Open", "25kOhm", "125kOhm", "2.5kOhm"]

Use standard units (-ohms), not strings. For "open", just omit the 
property.

> +
> +
> +  nuvoton,dac-vref:
> +    description: DAC Reference Voltage Setting.
> +    enum: ["External VDDA", "1.5V", "1.6V", "1.7V"]

Use standard units.

> +
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
> +      FS range is from 8kHz to 96kHz. And also needs to detect the ratio
> +      MCLK_SRC/LRCK of 256, 400 or 500, and needs to detect the BCLK
> +      to make sure data is present. There needs to be at least 8 BCLK
> +      cycles per Frame Sync.
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
> +            nuvoton,vref-impedance = "125kOhm";
> +            nuvoton,dac-vref = "1.6V";
> +            nuvoton,alc-enable;
> +            nuvoton,clock-det-data;
> +        };
> +    };
> -- 
> 2.25.1
> 
