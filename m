Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FF86D97B0
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 15:13:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7B23DF0;
	Thu,  6 Apr 2023 15:12:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7B23DF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680786805;
	bh=h9ji6NYGYKhe8pru+plznJ5ni8zeCU3Dta5EJvRMeRo=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HR+pp5Nn7QrjG9C85pauh+jNBuDmdKpxrRWhV/gOBh9XrHx+ec0NUhBV9/PavKVfs
	 R7ZFASIZKj/PnpSoHQZYWixGZPbmnAx/jF4jdZr7lBrZdQPkevplpb73fW48kP20k1
	 pNmu6vtOfEf7NC0msW0r+EQyiJWaO4smLs/4Rp2w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12B4BF80171;
	Thu,  6 Apr 2023 15:12:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07D3AF80246; Thu,  6 Apr 2023 15:12:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B1EBF8013D
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 15:12:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B1EBF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PjG4crlQ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B2D28645B5
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 13:12:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 273DFC4339B
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 13:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680786741;
	bh=h9ji6NYGYKhe8pru+plznJ5ni8zeCU3Dta5EJvRMeRo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PjG4crlQOjp5xxZmpAMnr4kZzad/soJ0KNGo0HGrmiUCC9bT0Ru9qwccDBM7xlFqv
	 iCxhiA7JmfQwtz+kz7E67ZkRPZywb6mOgoPl85WBlgZv2w1gy35+9Uklt67ny/l8qD
	 oSIecvVTLcOUh5ILCDpRhEPJJEOklj2rG5AkRob2iesB+MuzM7LuoedaDESuLve2na
	 4ON2tIMn3I+/o3pHq0VLx/2UDJzpssBoiM1TpLCD22w3iyoc5Xo4NQWWLK1n0X2vOs
	 MfrnzCYQzBSebjopvH3+FB9cC6wD8F5czhWTrHrscJWd183FfgyZjs3B5yT0zkzTFQ
	 3yIiQCSEurKDg==
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-54c0dd7e2f3so32280947b3.8
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Apr 2023 06:12:21 -0700 (PDT)
X-Gm-Message-State: AAQBX9dQds592l7M1KEXmeUoS+uyIIuuV5ht0HbF9JMIi6Ip1uSNKkB8
	0IJCaTBEtxPIIYqOdgluCeSMgT4Np2OZVkNRbg==
X-Google-Smtp-Source: 
 AKy350ZOxDGy7DDkguaA4F8q871wWQIN+RJcOt+kM/r0F3L1IVxOIlzJuURUtatL4qNsqf5I9ctDXNLKAui/uCpRtn8=
X-Received: by 2002:a81:b207:0:b0:545:a7d8:f278 with SMTP id
 q7-20020a81b207000000b00545a7d8f278mr5591986ywh.5.1680786740183; Thu, 06 Apr
 2023 06:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230328091831.55690-1-danascape@gmail.com>
In-Reply-To: <20230328091831.55690-1-danascape@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 6 Apr 2023 08:12:09 -0500
X-Gmail-Original-Message-ID: 
 <CAL_JsqJzxQb1g=yVgHduLnYOpk8-Q3jppA1qQT1Ce51_gNWjhg@mail.gmail.com>
Message-ID: 
 <CAL_JsqJzxQb1g=yVgHduLnYOpk8-Q3jppA1qQT1Ce51_gNWjhg@mail.gmail.com>
Subject: Re: [PATCH v5] ASoC: dt-bindings: ak4458: Convert to dtschema
To: Saalim Quadri <danascape@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: NPD3XNA4H7K5ZJR3L3JEKQ54OEGMG6PF
X-Message-ID-Hash: NPD3XNA4H7K5ZJR3L3JEKQ54OEGMG6PF
X-MailFrom: robh+dt@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: krzysztof.kozlowski@linaro.org, broonie@kernel.org, daniel.baluta@nxp.com,
 krzysztof.kozlowski+dt@linaro.org, shengjiu.wang@nxp.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NPD3XNA4H7K5ZJR3L3JEKQ54OEGMG6PF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Mar 28, 2023 at 4:18=E2=80=AFAM Saalim Quadri <danascape@gmail.com>=
 wrote:
>
> Convert the AK4458 audio DAC bindings to DT schema.
>
> Signed-off-by: Saalim Quadri <danascape@gmail.com>
> ---
> Changes:
> V1 -> V2: Use the correct way for dsd-path property
>           Drop ak4458 label form example
> V2 -> V3: ak4458 is the only one that does not support dsd-path, so we
>           do not require to define an array
> V3 -> V4: Add back dsd-path property description
> V4 -> V5: Fix yaml format as per example-schema
>
>  .../devicetree/bindings/sound/ak4458.txt      | 28 -------
>  .../bindings/sound/asahi-kasei,ak4458.yaml    | 73 +++++++++++++++++++
>  2 files changed, 73 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/ak4458.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/asahi-kasei,a=
k4458.yaml
>
> diff --git a/Documentation/devicetree/bindings/sound/ak4458.txt b/Documen=
tation/devicetree/bindings/sound/ak4458.txt
> deleted file mode 100644
> index 0416c14895d6..000000000000
> --- a/Documentation/devicetree/bindings/sound/ak4458.txt
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -AK4458 audio DAC
> -
> -This device supports I2C mode.
> -
> -Required properties:
> -
> -- compatible : "asahi-kasei,ak4458" or "asahi-kasei,ak4497"
> -- reg : The I2C address of the device for I2C
> -
> -Optional properties:
> -- reset-gpios: A GPIO specifier for the power down & reset pin
> -- mute-gpios: A GPIO specifier for the soft mute pin
> -- AVDD-supply: Analog power supply
> -- DVDD-supply: Digital power supply
> -- dsd-path: Select DSD input pins for ak4497
> -            0: select #16, #17, #19 pins
> -            1: select #3, #4, #5 pins
> -
> -Example:
> -
> -&i2c {
> -       ak4458: dac@10 {
> -               compatible =3D "asahi-kasei,ak4458";
> -               reg =3D <0x10>;
> -               reset-gpios =3D <&gpio1 10 GPIO_ACTIVE_LOW>
> -               mute-gpios =3D <&gpio1 11 GPIO_ACTIVE_HIGH>
> -       };
> -};
> diff --git a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.y=
aml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
> new file mode 100644
> index 000000000000..0db0c8e923a0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/asahi-kasei,ak4458.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AK4458 audio DAC
> +
> +maintainers:
> +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - asahi-kasei,ak4458
> +      - asahi-kasei,ak4497
> +
> +  reg:
> +    maxItems: 1
> +
> +  avdd-supply:
> +    description: Analog power supply
> +
> +  dvdd-supply:
> +    description: Digital power supply
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  mute-gpios:
> +    maxItems: 1
> +    description:
> +      GPIO used to mute all the outputs
> +
> +  dsd-path:
> +    description: Select DSD input pins for ak4497
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    oneOf:
> +      - const: 0
> +        description: select #16, #17, #19 pins
> +      - const: 1
> +        description: select #3, #4, #5 pins

'#' (with a space or newline before) is a comment, so these need to be
quoted. I only noticed because yamllint now requires a space after as
well:

./Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml:40:30:
[error] missing starting space in comment (comments)
./Documentation/devicetree/bindings/sound/asahi-kasei,ak4458.yaml:42:30:
[error] missing starting space in comment (comments)

Rob
