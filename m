Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B0E709C70
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 18:30:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A23F200;
	Fri, 19 May 2023 18:29:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A23F200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684513842;
	bh=cO6StIidaESxZ9kWWRmaxDEVVAfI+i5D8OvevReKs60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uV35YxOCO8xu2DRSyUPnpzqB80BuOlS1A7EkXd0LNbmQKSOR3ZnQAZ9xSyUp96EV5
	 a009sjMP+pc5rmTUPjugS3FByVHv852Rqqi5p37O7jWZS0pqIpXC7/fvxK6UXl26/W
	 wfaXOWHT77XCwEGefLmRXfTZw/A84DFYteYo/ReI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0CF6F80431; Fri, 19 May 2023 18:29:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BFFDF8025A;
	Fri, 19 May 2023 18:29:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACD7BF80272; Fri, 19 May 2023 18:29:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A4A5F80087
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 18:29:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A4A5F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QkTa8JVN
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2F20A65926;
	Fri, 19 May 2023 16:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D044C433EF;
	Fri, 19 May 2023 16:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684513777;
	bh=cO6StIidaESxZ9kWWRmaxDEVVAfI+i5D8OvevReKs60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QkTa8JVNDPha/XjnnDrGFHxlpapc5C6U7TQZFgETv+eZA6nN6nfdqiSpQT/psKEEz
	 tRW9pwSW148Zgx/L1Kc9+6rsBL3ztrT6wY+RC4ASnGfn/BwatLhVBYd0QrmBXtgkQd
	 nkgrFGN6mtqzhhfwGV8zVNQxa11LhxtfjfvGA3c5yl1BeP8mBIvPMT7mYAiYjvZOhq
	 m+3TRv2PBfBz6UhYrARsLysxqj4wsW6SAH5SdAEDSIdj0CUpWtAd/ppOM0b/VVjzxw
	 YtUWFL4X8RgoE6CLUX8Z1vTjyI0PVwWaRZSmjD5WoZtnzv7so11eKPZtov/QZNyEtY
	 AGsFJHtC+HKMw==
Date: Fri, 19 May 2023 17:29:33 +0100
From: Conor Dooley <conor@kernel.org>
To: David Rau <David.Rau.opensource@dm.renesas.com>
Cc: conor+dt@kernel.org, support.opensource@diasemi.com,
	lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: dialog,da7219: convert to dtschema
Message-ID: <20230519-tables-stoppage-51c998e0421c@spud>
References: <20230519092321.26915-1-David.Rau.opensource@dm.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="17iPMXSczGXY/rl6"
Content-Disposition: inline
In-Reply-To: <20230519092321.26915-1-David.Rau.opensource@dm.renesas.com>
Message-ID-Hash: RZ6CTTE63AM5GKFZYYGRHDI7BFLL4GIU
X-Message-ID-Hash: RZ6CTTE63AM5GKFZYYGRHDI7BFLL4GIU
X-MailFrom: conor@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RZ6CTTE63AM5GKFZYYGRHDI7BFLL4GIU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--17iPMXSczGXY/rl6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey David,

I think some wires got crossed here - what I meant was send 2 patches in
a series, where one did the conversion and the other added the new
property.

On Fri, May 19, 2023 at 09:23:21AM +0000, David Rau wrote:
> Convert Dialog DA7219 bindings to DT schema format.
>=20
> Signed-off-by: David Rau <David.Rau.opensource@dm.renesas.com>

> +  interrupt-names:
> +    oneOf:
> +      - items:
> +          - const: wakeup
> +      - items:
> +          - const: irq
> +    description:
> +      Name associated with interrupt line.
> +      Should be "wakeup" if interrupt is to be used to wake system,
> +      otherwise "irq" should be used.

Hmm, that is not quite what I meant. I was thinking that you could
add itemised descriptions for what the individual behaviours are.
But on reflection, how about:
  interrupt-names:
    description:
      Should be "wakeup" if interrupt is to be used to wake the system,
      otherwise "irq" should be used.
    enum:
      - wakeup
      - irq

> +
> +  wakeup-source:
> +    type: boolean
> +    description:
> +      Flag to indicate this device can wake system (suspend/resume).
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  clock-output-names:
> +    minItems: 2
> +    maxItems: 2

I was thinking
clock-output-names:
  - items:
      - const: WCLK
      - const: BCLK
(assuming I didn't misunderstand the text binding!)

> +    description:
> +      Name given for DAI word clock and bit clock outputs.
> +
> +  clocks:

    maxItems: 1

> +    description:
> +      phandle and clock specifier for codec MCLK.
> +
> +  clock-names:
> +    const: mclk

> +      dlg,jack-det-rate:
> +        enum: ["32ms_64ms", "64ms_128ms", "128ms_256ms", "256ms_512ms"]

The "s here are not needed btw, the other enums in the tree described
like this (that use strings) avoid the "s.

Thanks & apologies for the confusion,
Conor.

> +        description:
> +          Jack type detection latency (3/4 pole).
> +        $ref: /schemas/types.yaml#/definitions/string

--17iPMXSczGXY/rl6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGej7QAKCRB4tDGHoIJi
0qhMAP0UQUBLP3rRh9+fsSVNXLEsKmJvateo000gx8LaIls4xQD/bRjAsk0YVjbg
j4Q26gB4g/gUmLVzrEmo3x2pCdAIzQs=
=tJz2
-----END PGP SIGNATURE-----

--17iPMXSczGXY/rl6--
