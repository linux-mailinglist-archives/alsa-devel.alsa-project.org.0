Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CB6A499C8
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Feb 2025 13:47:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4E5860258;
	Fri, 28 Feb 2025 13:47:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4E5860258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1740746867;
	bh=Zs7UKJ5mO2LrCqW+3vzB8Fs0DOadd02IqoHcc0BVo84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j1CMGHQC4CLN5gJq4cK1IQt3ieR1iYd5kMT/O0WWRV394R8Z24rMqd2FIn3QYT2WG
	 DwALS26az7unqIfaNtM2P11TP3VL7L2HqzAAydntwGeU0SluyTW1aY454pQHFooGmo
	 PzaHvRO5Sv3aK273QGDG2qGYft4ma/3CNzl3mdXs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA54CF805AE; Fri, 28 Feb 2025 13:47:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AFBB3F805BE;
	Fri, 28 Feb 2025 13:47:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96BCBF8025A; Fri, 28 Feb 2025 13:47:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A658F800C1
	for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2025 13:46:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A658F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cHjwrmC1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C63325C02B2;
	Fri, 28 Feb 2025 12:44:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29148C4CED6;
	Fri, 28 Feb 2025 12:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740746817;
	bh=Zs7UKJ5mO2LrCqW+3vzB8Fs0DOadd02IqoHcc0BVo84=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cHjwrmC1aznSD9ZOprotrrfA+uJsaQrEofHsiejpszbuG+BDO4pc7GNm68cdZPM7t
	 cRrtEAdddtY2bze9ZPPKkrMN0Ka+iatWR5eVRhDu3uAR52jScczduyzkB5QWPrKbqI
	 6Ttn6zpkUD2qOzJ2LpZiUo35kDYnagaV5UMeUF2AfmHqvWAozlGmjnA6cjOs5EjQOd
	 gsghmnLQbM4kiFLyZMadsj7LeCZip49+Xm6/V4fZU+iZ49bzfiuSztifWPd0kcJcfn
	 5ATTpVSyUY4ZpwBQXOM55Ys0PzrEqFawsxtggtk2cpN7P+HblRGYNEn3ApOoaoPAZi
	 oeOQ4EV8qqO0w==
Date: Fri, 28 Feb 2025 06:46:55 -0600
From: Rob Herring <robh@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
	devicetree@vger.kernel.org, tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com
Subject: Re: [PATCH v1 2/2] ASoC: dt-bindings: Add Everest ES8389 audio CODEC
Message-ID: <20250228124655.GA2368607-robh@kernel.org>
References: <20250228100245.127413-1-zhangyi@everest-semi.com>
 <20250228100245.127413-3-zhangyi@everest-semi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228100245.127413-3-zhangyi@everest-semi.com>
Message-ID-Hash: 3CU25RHZQQPOQ5IZE6N5R6YOPCNXMXA6
X-Message-ID-Hash: 3CU25RHZQQPOQ5IZE6N5R6YOPCNXMXA6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3CU25RHZQQPOQ5IZE6N5R6YOPCNXMXA6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Feb 28, 2025 at 06:02:45PM +0800, Zhang Yi wrote:
> Add device tree binding documentation for Everest ES8389
> 
> Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
> ---
>  .../bindings/sound/everest,es8389.yaml        | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100755 Documentation/devicetree/bindings/sound/everest,es8389.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/everest,es8389.yaml b/Documentation/devicetree/bindings/sound/everest,es8389.yaml
> new file mode 100755
> index 000000000000..4629a89b915e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/everest,es8389.yaml
> @@ -0,0 +1,98 @@
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

Add a $ref to dai-common.yaml.

> +properties:
> +  compatible:
> +    const: everest,es8389
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
> +    maximum: 0x07
> +    default: 0x00
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

Can't the dai-tdm-* properties work for you?

> +
> +  prefix_name:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: device name prefix

Why do you need this?

> +
> +  everest,dmic-enabled:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |

Don't need '|' if no formatting.

> +      The property is a choice between PDM and AMIC
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#sound-dai-cells"
> +
> +additionalProperties: false
> +
> +examples for single codec:
> +  - |
> +    es8389: es8389@10 {

audio-codec@10 {

> +      compatible = "everest,es8389";
> +      status = "okay";

Don't need status.

> +      reg = <0x10>;
> +      everest,adc-slot = [00];
> +      everest,dac-slot = [00];
> +      prefix_name = "es8389_0";
> +      #sound-dai-cells = <0>;
> +    };
> +
> +examples for multi codecs:
> +  - |
> +    es8389: es8389@10 {
> +      compatible = "everest,es8389";
> +      status = "okay";
> +      reg = <0x10>;
> +      everest,adc-slot = [00];
> +      everest,dac-slot = [00];
> +      prefix_name = "es8389_0";
> +      #sound-dai-cells = <0>;
> +    };
> +    es8389_1: es8389@11 {
> +      compatible = "everest,es8389";
> +      status = "okay";
> +      reg = <0x11>;
> +      everest,adc-slot = [01];
> +      everest,dac-slot = [01];
> +      prefix_name = "es8389_1";
> +      clock-names = "mclk";
> +      #sound-dai-cells = <0>;
> +    };
> \ No newline at end of file

Fix this.

> -- 
> 2.17.1
> 
