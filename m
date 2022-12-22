Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A377C653F25
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Dec 2022 12:41:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 256683F4C;
	Thu, 22 Dec 2022 12:40:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 256683F4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671709306;
	bh=zTuzNUymVvHbTroTjuOONLQMG4wasPHUEH1HnLC8izg=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SHvGDt7Lgwg6tcZ8nsuBSOUcpdhszysOgeMY1JtG4wdb5l/SDKakys2G6SydUXRy3
	 ZuNOj4gROnleNzkC47HTnaN7rSqNrze5n3tu3k1cPs+TkNocf5RpEQh75WO9gnVwVL
	 PIL3ny0U7O0NDAkGwJ57lrkMbkB9JG60CjftpqTQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C40DDF80022;
	Thu, 22 Dec 2022 12:40:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08C4BF8026D; Thu, 22 Dec 2022 12:40:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83D50F80158
 for <alsa-devel@alsa-project.org>; Thu, 22 Dec 2022 12:40:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83D50F80158
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=L8/4QfGY
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8993EB81CFA;
 Thu, 22 Dec 2022 11:40:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2099C433D2;
 Thu, 22 Dec 2022 11:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671709244;
 bh=zTuzNUymVvHbTroTjuOONLQMG4wasPHUEH1HnLC8izg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L8/4QfGY9ooe0KCepvqowVKfZIBurfxQlI0XjwGvItYyR3ZTymRtfLaZ6zVd/Jzhv
 MJ2XTakxQ+Mdp2Mfd2/zIW/MVVpgVvAaO/baBK0jcY7z5S5zP4zdxwv+7wCPxiM1Vx
 Vj8ngJDgR6mV9D28ii8BCl6s6R8Buika0jGxkWBB03dXn/LWOe68pi7z3PZ+6rfzUs
 rSMAvuLyXzg8GJYRMFSmUTlFKjid++tDjwMSxleBmDMJ7SejxJ7yvI69rn9/0TEfop
 LkFtHz+QADarQcgtIZHvC7yq2qqGc+h5z1haF2t79Utt+gjnYzBOrbMwjeicGyDGT7
 uMoPpoc69O26A==
Date: Thu, 22 Dec 2022 11:40:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Jai Luthra <j-luthra@ti.com>
Subject: Re: [PATCH v4] dt-bindings: sound: tlv320aic3x: Convert to dtschema
Message-ID: <Y6RCN9DxeW7WacPD@sirena.org.uk>
References: <20221221145216.11400-1-j-luthra@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/E1hF2BNu7Rsk/hm"
Content-Disposition: inline
In-Reply-To: <20221221145216.11400-1-j-luthra@ti.com>
X-Cookie: Yes, but which self do you want to be?
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--/E1hF2BNu7Rsk/hm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 21, 2022 at 08:22:16PM +0530, Jai Luthra wrote:
> Convert bindings for TI's TLV320AIC3x audio codecs to dtschema.
>=20
> The following properties are still found in some old dts files, but will
> be ignored by the driver:

> - assigned-clock-parents, assigned-clock-rates, assigned-clocks

These are from the common clock binding and will be handled by the clock
code.

--/E1hF2BNu7Rsk/hm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOkQjYACgkQJNaLcl1U
h9Dgmgf/XEFtbzLCL1wn65FWzVlIblV4e8LdP/CH3v8S08vCVtPKOyJpxl/v2eow
32rjN4DNjDcxhbJ22zMEJ815ogSZ/1TE+8zpzOKiWMjKAjWwZiARqcq4CvioXeZQ
qJBmVx+ra4RHqerpUrnHVQ1tjzFz7iPoJvAQ/n2omgg7ZG0u1jnpRUati6j21o+Z
wzW7ebtQaiFLejLZDlZjQb0OfMwUvasAR/JC1RPFJNX96/N7OITvGvoeEmuGydf8
AKwLzkZg3RAjcI2MBQ4liz1aNeeP0y538ZPnQdrir00AMb9SgciJM6CgLJPZXkIf
tVDNcd6gelXr47v/ZpFevq5gVJLcSw==
=ivai
-----END PGP SIGNATURE-----

--/E1hF2BNu7Rsk/hm--
