Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 102C4420D08
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 15:09:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F1AB168F;
	Mon,  4 Oct 2021 15:08:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F1AB168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633352978;
	bh=ZbQjrZR42pArRDC3vnc9mJCBY82N8zGx3FwEMerx06Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GEnQ4yiu786/0aC48tr323M5l+OoKXX3uhuG2zVCd3BUP9yw26TxmY+IY28D3/bTI
	 gGzoxvVnavttzo7Qgvm4iWLoUmv31yyy9vQ2CHYgUVg4PTTziX+9imXNuUX+NPXHut
	 HOOOKC+GRlA2wvYd58F4NrE10V+i+YAPoj20YYW4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D8D5F80171;
	Mon,  4 Oct 2021 15:08:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEE7CF80240; Mon,  4 Oct 2021 15:08:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14341F800BA
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 15:08:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14341F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="A8CTiSkQ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 42DB761B52;
 Mon,  4 Oct 2021 13:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633352888;
 bh=ZbQjrZR42pArRDC3vnc9mJCBY82N8zGx3FwEMerx06Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A8CTiSkQwy7W3F/CU0zTaVZpHJF8Y0ivroT4oxo0joa7xTkF3oiFIpJYAEZ61EASo
 jwYiWXPTHGE0TJg63S4VhNmxoRaHIllVDkQ9l9A6XeAN4WJi1hgUXXbbAu/Nd6i9+N
 baaRu0HGQiLVK27yI4rbFf7JRNpGwSLD+aaDMVGukI9J6affTtBUtLI5HvdQHFIiVl
 iq1hZD6CUVYnmE9ncWPjzICtbS0+iL6ZuVF+YLd/AMJZHYY4a005x8onDQ7lyp17gg
 ogIIVa0sEkztngC8+Ftm3jvJ623kcHDcWiCWR+P4cW2nOwyUYgznOnPKj/2eeaVjRr
 OcOnuQEMqPZ4A==
Date: Mon, 4 Oct 2021 14:08:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Ricard Wanderlof <ricardw@axis.com>
Subject: Re: [PATCH 1/2] dt-bindings: sound: tlv320adc3xxx: New codec driver
Message-ID: <YVr8tqRoyyiWR4xl@sirena.org.uk>
References: <alpine.DEB.2.21.2110041115070.14472@lnxricardw1.se.axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="NenT2xvAZufCMaV7"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2110041115070.14472@lnxricardw1.se.axis.com>
X-Cookie: If it heals good, say it.
Cc: devicetree@vger.kernel.org, alsa-devel <alsa-devel@alsa-project.org>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--NenT2xvAZufCMaV7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 04, 2021 at 11:17:47AM +0200, Ricard Wanderlof wrote:

> +  gpios:
> +    maxItems: 1
> +    description: GPIO pin used for codec reset (RESET pin)

Usually this would be called reset-gpios and/or have a name to improve
readability and allow for extensibility, from the binding we can see
that the device has other signals that can be used as GPIOs.

> +  ti,pll-mode:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 0 # ADC3XXX_PLL_DONT_SET - leave mode unchanged
> +      - 1 # ADC3XXX_PLL_ENABLE - use the on-chip PLL
> +      - 2 # ADC3XXX_PLL_BYPASS - do not use the on-chip PLL
> +      - 3 # ADC3XXX_PLL_AUTO - use on-chip PLL if possible
> +    default: 0
> +    description: |
> +      Set on-chip PLL mode.
> +      ADC3XXX_PLL_DONT_SET is intended for use when setting the clock mod
> +      via the clock id in a machine driver and it is not to be changed
> +      from the previous setting.
> +      ADC3XXX_PLL_AUTO will enable  on-chip PLL if possible, depending on the
> +      master clock and sample rate combination.

Why is this configured through the DT binding and not via the machine
driver as done for other drivers?

> +      Note that there is currently no support for reading the GPIO pins as
> +      inputs.

This doesn't belong in the binding document, it's describing the binding
not any particular implementation.

--NenT2xvAZufCMaV7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFa/LUACgkQJNaLcl1U
h9COawf/ex6fba/shQiY2DAsg2j0WtxTAMX1z+MkUIUNeWBpXM/bEijwgtwEm6D9
tqZP8m1Xo08N7dMIgNy9Wt3yFlktP6NQBA9CXIZdRlVhVY5olHtQVd2wqeR0XCX5
bR3rudz7Cq0ilBtUkVD9TeR51xg73GcrJPoZbd08GrNTaKVUtNX3SPzWBT4lAgT3
EUv/LXPti5vduwj85wfk2WR2zIkbi5a0LsH5HrezP+udaL5wmn8piRcdAinW4dEi
Hjjb6gBTzKeNFKlbJn5VhavrmJturisvDA4zBwahlE9PwhLSktMX6STnmF26jjed
ODcX0OQk0rnb59+G/o/PYV87ELMroA==
=198I
-----END PGP SIGNATURE-----

--NenT2xvAZufCMaV7--
