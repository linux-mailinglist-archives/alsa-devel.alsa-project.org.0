Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F1590DB60
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 20:11:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07E4483B;
	Tue, 18 Jun 2024 20:11:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07E4483B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718734297;
	bh=EAvgZ3jMRCuTBhjZ/B+YPumQ+F27xwXs2WGNI9/iw6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WEhPEzn4W5a1cFKT11SwMAmh5wF4hEyFsCN+fbbn/q5AbleJp2hAfyXX3LfgMABhW
	 Rwzb5vALL3BQOvc3KpZc/C10PlH1d135MKSmybLuiT1F89Rx+brEpdCezCUViErNJc
	 TCOKMgD19ZdWSa88MjRsr/Z6EfaSo1C8KNVF30ns=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 480D7F8023A; Tue, 18 Jun 2024 20:11:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ABE1DF805A8;
	Tue, 18 Jun 2024 20:11:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7401F8023A; Tue, 18 Jun 2024 20:10:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E6D9AF800FA
	for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2024 20:10:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6D9AF800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UsB1ggxD
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1FB22CE1BE4;
	Tue, 18 Jun 2024 18:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D31EC3277B;
	Tue, 18 Jun 2024 18:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718734239;
	bh=EAvgZ3jMRCuTBhjZ/B+YPumQ+F27xwXs2WGNI9/iw6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UsB1ggxDjMVJ2bkpOY1nKfMR+8EDszY1zyaQ5sHAm5770BSZXaG2f6OB+YNYYXa6q
	 JPKFtXmGx6H4GmFZ+pdBKNvJ1eWUsXVnCmEnOpTL0Dh1PFH93SXT08T46h5g1vm5cG
	 ayKhoikeHx/EcWdFzABFU3tAdtaYi9GxJw4TGJBQe0cWXJYif06tuTUvoF6x2dSYcH
	 BAOL8V7giCyQP1QeNs7qtVGHoFLN/cYqyCkFxCPzdO2AxFQqaBhoaw/ExuhmPOxK7d
	 TduN9cJ8gbcDNEwCcAXQQw1cjeqQ7K9zWRxZD/u3kSjjO/+Q5Lw2Wzz2QrxTgcddEo
	 swS7EoMEUABbA==
Date: Tue, 18 Jun 2024 19:10:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	alsa-devel@alsa-project.org, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] dt-bindings: iio: dfsdm: move to backend framework
Message-ID: <20240618-footwear-impotence-5284985a609d@spud>
References: <20240618160836.945242-1-olivier.moysan@foss.st.com>
 <20240618160836.945242-5-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4SiWeHDoe2HNgIcV"
Content-Disposition: inline
In-Reply-To: <20240618160836.945242-5-olivier.moysan@foss.st.com>
Message-ID-Hash: 7QGFRYAWATEPHJ6TFXGD45RXBAKE7M2O
X-Message-ID-Hash: 7QGFRYAWATEPHJ6TFXGD45RXBAKE7M2O
X-MailFrom: conor@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7QGFRYAWATEPHJ6TFXGD45RXBAKE7M2O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--4SiWeHDoe2HNgIcV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 06:08:30PM +0200, Olivier Moysan wrote:
> Change the DFSDM binding to use the new IIO backend framework,
> along with the adoption of IIO generic channels.
> This binding change allows to add scaling support to the DFSDM.
>=20
> Keep the legacy binding as deprecated for backward compatibility.
>=20
> The io-backends property is supported only in generic IIO channel
> binding.
>=20
> - Channel description with the generic binding (Audio and Analog):
>=20
>   Properties supersed by generic properties:
>     st,adc-channels: becomes "reg" property in channel node
>     st,adc-channel-names: becomes "label" property in channel node
>   Properties moved to channel child node:
>     st,adc-channel-types, st,adc-channel-clk-src, st,adc-alt-channel
>=20
> - Analog binding:
>=20
>   DFSDM filter channel is configured as an IIO backend consumer.
>   Add io-backends property in channel child nodes.
>=20
>   DFSDM is no more configured as a channel consumer from SD modulator.
>   Use of io-channels in DFSDM node is deprecated.
>=20
> - Audio binding:
>=20
>   DFSDM audio DAI is configured as a channel consumer from DFSDM filter.
>   No change compare to legacy.
>=20
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>  .../bindings/iio/adc/st,stm32-dfsdm-adc.yaml  | 158 +++++++++++++++++-
>  1 file changed, 152 insertions(+), 6 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc=
=2Eyaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> index c1b1324fa132..dd414bab74c1 100644
> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> @@ -102,9 +102,11 @@ patternProperties:
>          items:
>            minimum: 0
>            maximum: 7
> +        deprecated: true
> =20
>        st,adc-channel-names:
>          description: List of single-ended channel names.
> +        deprecated: true
> =20
>        st,filter-order:
>          description: |
> @@ -118,6 +120,12 @@ patternProperties:
>        "#io-channel-cells":
>          const: 1
> =20
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
>        st,adc-channel-types:
>          description: |
>            Single-ended channel input type.
> @@ -128,6 +136,7 @@ patternProperties:
>          items:
>            enum: [ SPI_R, SPI_F, MANCH_R, MANCH_F ]
>          $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +        deprecated: true
> =20
>        st,adc-channel-clk-src:
>          description: |
> @@ -139,6 +148,7 @@ patternProperties:
>          items:
>            enum: [ CLKIN, CLKOUT, CLKOUT_F, CLKOUT_R ]
>          $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +        deprecated: true
> =20
>        st,adc-alt-channel:
>          description:
> @@ -147,6 +157,7 @@ patternProperties:
>            If not set, channel n is connected to SPI input n.
>            If set, channel n is connected to SPI input n + 1.
>          type: boolean
> +        deprecated: true
> =20
>        st,filter0-sync:
>          description:
> @@ -165,11 +176,65 @@ patternProperties:
>        - compatible
>        - reg
>        - interrupts
> -      - st,adc-channels
> -      - st,adc-channel-names
>        - st,filter-order
>        - "#io-channel-cells"
> =20
> +    patternProperties:
> +      "^channel@([0-9]|1[0-9])$":
> +        type: object
> +        $ref: adc.yaml
> +        description: Represents the external channels which are connecte=
d to the DFSDM.
> +
> +        properties:
> +          reg:
> +            items:
> +              minimum: 0
> +              maximum: 8
> +
> +          label:
> +            description:
> +              Unique name to identify which channel this is.
> +
> +          st,adc-channel-types:
> +            description: |
> +              Single-ended channel input type.
> +              - "SPI_R": SPI with data on rising edge (default)
> +              - "SPI_F": SPI with data on falling edge
> +              - "MANCH_R": manchester codec, rising edge =3D logic 0, fa=
lling edge =3D logic 1
> +              - "MANCH_F": manchester codec, rising edge =3D logic 1, fa=
lling edge =3D logic 0
> +            items:
> +              enum: [ SPI_R, SPI_F, MANCH_R, MANCH_F ]
> +            $ref: /schemas/types.yaml#/definitions/non-unique-string-arr=
ay

Why is this an array? And why is the property plural? Can a channel have
more than one type?

> +
> +          st,adc-channel-clk-src:
> +            description: |
> +              Conversion clock source.
> +              - "CLKIN": external SPI clock (CLKIN x)
> +              - "CLKOUT": internal SPI clock (CLKOUT) (default)
> +              - "CLKOUT_F": internal SPI clock divided by 2 (falling edg=
e).
> +              - "CLKOUT_R": internal SPI clock divided by 2 (rising edge=
).
> +            items:
> +              enum: [ CLKIN, CLKOUT, CLKOUT_F, CLKOUT_R ]
> +            $ref: /schemas/types.yaml#/definitions/non-unique-string-arr=
ay

Ditto here, but s/type/clock source/

Thanks,
Conor.

> +
> +          st,adc-alt-channel:
> +            description:
> +              Must be defined if two sigma delta modulators are
> +              connected on same SPI input.
> +              If not set, channel n is connected to SPI input n.
> +              If set, channel n is connected to SPI input n + 1.
> +            type: boolean
> +
> +          io-backends:
> +            description:
> +              From common IIO binding.

Drop this from the description.

> Used to pipe external sigma delta
> +              modulator or internal ADC backend to DFSDM channel.
> +
> +        required:
> +          - reg
> +
> +        additionalProperties: false
> +
>      allOf:
>        - if:
>            properties:
> @@ -199,9 +264,19 @@ patternProperties:
>                description:
>                  From common IIO binding. Used to pipe external sigma del=
ta
>                  modulator or internal ADC output to DFSDM channel.
> +              deprecated: true
> =20
> -          required:
> -            - io-channels
> +          if:
> +            required:
> +              - st,adc-channels
> +          then:
> +            required:
> +              - io-channels
> +
> +          patternProperties:
> +            "^channel@([0-9]|1[0-9])$":
> +              required:
> +                - io-backends

Why is this here, rather than with reg above? Only some channels require
a backend?

--4SiWeHDoe2HNgIcV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnHNmQAKCRB4tDGHoIJi
0qHWAP4sIhBxMJaoCYlRr235U6E4PaT7TkOaskE90Tjd/qpLJQEAyeBOaQxiIt+1
NK/yqLrQ0NQySGaW07Y716L/6hIBTgs=
=tTur
-----END PGP SIGNATURE-----

--4SiWeHDoe2HNgIcV--
