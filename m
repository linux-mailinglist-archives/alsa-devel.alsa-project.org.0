Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E27BC2F4F97
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jan 2021 17:11:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 812C11731;
	Wed, 13 Jan 2021 17:10:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 812C11731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610554291;
	bh=/V4uSeR8OSBZFOFVIDMw/BcMXL4VolcqPFbIKUiERHo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tyL7nfe9987Snv4hbVYEqp72bauHES7zDpxQdQtzetk2xpzQ2J183atA/CZBPMDGt
	 5XqFjJ/ESNx2yPBCIt8ryeJ3MK9WmyJJeGHsOkEq75oy8dBybn9NSahH0GxVPlrXwV
	 lgXUVaPpUmFAge2ej+B9ZOCo7VrIhSizwjlKEHlo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D526DF80254;
	Wed, 13 Jan 2021 17:09:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14D2FF801ED; Wed, 13 Jan 2021 17:09:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BF21F80113
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 17:09:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BF21F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CIcwspXm"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6D4023435;
 Wed, 13 Jan 2021 16:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610554191;
 bh=/V4uSeR8OSBZFOFVIDMw/BcMXL4VolcqPFbIKUiERHo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CIcwspXmZRh8pc/udeumy8UpzYBjmrX7dpcqHVBi+30uP1j3j4zU+0B10FqVEKafh
 zYFna+tu0fTLy5NZW/+OxsohzEOeAjA+CH5Tr1A5js5pnPLHEoc9/gzjUyvx/1p91Y
 YYwmVWgZAHyoZY4pYdT0ia5ZpErjCFa6mRI4+fPFeYRKY3nUj3aeO2k0e29sjipaFh
 i8McAAFGMhCslAq/p6obQEr3RbKhxC09pzYp/p0JwRk6SB3DFC3DoaAAYyrj4Qgoax
 zUHGMwuJv8rPnp6y8Q2ebD+pmNBb3VvMORqK8F/SLQLVb35ax0hThFX/HLs6hksODv
 YBgNPtvxo0NXA==
Date: Wed, 13 Jan 2021 16:09:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 2/6] dt-bindings: audio-graph-card: Add plls and
 sysclks properties
Message-ID: <20210113160917.GF4641@sirena.org.uk>
References: <20210108160501.7638-1-rf@opensource.cirrus.com>
 <20210108160501.7638-3-rf@opensource.cirrus.com>
 <20210113152225.GA2334778@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kbCYTQG2MZjuOjyn"
Content-Disposition: inline
In-Reply-To: <20210113152225.GA2334778@robh.at.kernel.org>
X-Cookie: Ignore previous fortune.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, f.fainelli@gmail.com,
 kuninori.morimoto.gx@renesas.com, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 nsaenzjulienne@suse.de
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


--kbCYTQG2MZjuOjyn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 13, 2021 at 09:22:25AM -0600, Rob Herring wrote:

> I'm not sure this makes sense to be generic, but if so, we already have=
=20
> the clock binding and should use (and possibly extend) that.

> This appears to all be configuration of clocks within the codec, so=20
> these properties belong in the codec or cpu nodes.

Right, I think this should just be the clock binding.=20

> > +      The PLL id and clock source id are specific to the particular co=
mponent
> > +      so see the relevant component driver for the ids. Typically the

This should refer to the bindings for components, not to their drivers.

> > +      clock source id indicates the pin the source clock is connected =
to.
> > +      The same phandle can appear in multiple entries so that several =
plls
> > +      can be set in the same component.
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +
> > +  plls-clocks:
> > +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> > +    description: |
> > +      A list of clock names giving the source clock for each setting
> > +      in the plls property.
> > +
> > +  sysclks:
> > +    description: |
> > +      A list of component sysclk settings. There are 4 cells per sysclk
> > +      setting:
> > +        - phandle to the node of the codec or cpu component,
> > +        - component sysclk id,
> > +        - component clock source id,
> > +        - direction of the clock: 0 if the clock is an input to the co=
mponent,
> > +          1 if it is an output.
>=20
> A clock provider and consumer would provide the direction.
>=20
> > +      The sysclk id and clock source id are specific to the particular
> > +      component so see the relevant component driver for the ids. Typi=
cally
> > +      the clock source id indicates the pin the source clock is connec=
ted to.
> > +      The same phandle can appear in multiple entries so that several =
sysclks
> > +      can be set in the same component.
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +
> > +  sysclks-clocks:
> > +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> > +    description: |
> > +      A list of clock names giving the source clock for each setting
> > +      in the sysclks property.
> > +
> > +dependencies:
> > +  plls: [ plls-clocks ]
> > +  sysclks: [ sysclks-clocks ]
> > +
> >  required:
> >    - dais
> > =20
> > --=20
> > 2.20.1
> >=20

--kbCYTQG2MZjuOjyn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl//GywACgkQJNaLcl1U
h9DmuwgAg4bSMDfqbeSbsp70+FR5h2BrfLgwsLwRE0uEEsHpMnvplu67Sb5EaYg7
43mnbG/ru3uKHlU5gpqyXHFlqCGsbpr3s3+Drn6MfToxDD+lgk38LWADAPwgWOAi
/Y3moCJTzxBEq1DuGk8w1PQqllu1+heWuVCiuo7iOXPJwrPhF5qtrL7P/f69RoFD
JmfdGqGstHUQRc+rj4r3mGo1+61XFbin0Ptdvm8ST1Zx7D9FOKEfu7gL+UJK6ha8
BfBUFCVU9Ov9zaBi1HRslnVULJ4h0i3JRao7rb2h7ajI9IzCr6PNuPkK1St1DDT6
YJ/zH7Zd13mdMSqHWDgJVcGbPRT3Sg==
=zuCm
-----END PGP SIGNATURE-----

--kbCYTQG2MZjuOjyn--
