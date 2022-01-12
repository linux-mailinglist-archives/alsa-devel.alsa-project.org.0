Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 903E348CD16
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jan 2022 21:27:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D5FA1EF8;
	Wed, 12 Jan 2022 21:26:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D5FA1EF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642019268;
	bh=cmhLy2J1afnp6gpFyGDqLtbbQq3RXm2M4Drjehcc+as=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bOdzZ0KcemP1Em/E53vM6vGmyUt96qDS+hcS/Q8TSt8b3cGkmWlkE/8aukB4+CRHX
	 m2UKSf4Xg3Cu6xq02tl0acl1m8jilBtvtYM3TDoFp41hSipZ0nWmqZtG//JCnoZBm8
	 NXbOsSwmejbpeCAbxEPJF67rYaWWdyespdOyK29s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93CFDF8026D;
	Wed, 12 Jan 2022 21:26:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2E48F80236; Wed, 12 Jan 2022 21:26:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C7A1F80236
 for <alsa-devel@alsa-project.org>; Wed, 12 Jan 2022 21:26:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C7A1F80236
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cNSrvhel"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CF97961982;
 Wed, 12 Jan 2022 20:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F33C36AE9;
 Wed, 12 Jan 2022 20:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642019188;
 bh=cmhLy2J1afnp6gpFyGDqLtbbQq3RXm2M4Drjehcc+as=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cNSrvhelUyjndS3PPZTl/RDy22wCDC7kDValteAjswg90E0eyZVvA3cDUOwePKlEj
 Vn+ZlFwx1m8Z/mNi0LMJoMwkUUL4+pPc16RVOAE89+xv4Z0pg4tndnCLTYGcPg5Ub0
 pzkgeOHo80+zVQIRetMINaTl/YkoTHaeB1CQnwZrNVcPTfMjr8wGh+JLpB57SWww6X
 YJrKdr/x4oudEb3Kty/gKtJdcbgfz6hXEOZxQosiqsOn4W2PXblFDXqoWYXUeMbQix
 8Gcb9HwRjzua8wnsHGQoxxsAAe3bsQZFB/CLC1saAgI9jNT6Nb1d5aI8oWfY07Dzu9
 jzdc8gdkfFEPg==
Date: Wed, 12 Jan 2022 20:26:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Beer <daniel.beer@igorinstitute.com>
Subject: Re: [PATCH 1/2] ASoC: add support for TAS5805M digital amplifier
Message-ID: <Yd85bjKEX9JnoOlI@sirena.org.uk>
References: <61dccc59.1c69fb81.e1d98.02e3@mx.google.com>
 <Yd26p8rF3arufd2R@sirena.org.uk>
 <20220111192806.GA10345@nyquist.nev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="UGyhJCW8stP9TZVM"
Content-Disposition: inline
In-Reply-To: <20220111192806.GA10345@nyquist.nev>
X-Cookie: Bridge ahead.  Pay troll.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Andy Liu <andy-liu@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Derek Simkowiak <derek.simkowiak@igorinstitute.com>
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


--UGyhJCW8stP9TZVM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 12, 2022 at 08:28:06AM +1300, Daniel Beer wrote:

> The blob of register writes we get given from PPC3 contains a whole lot
> of explicit page and book changes, and there's not an easy way to tell
> regmap about this, as far as I know. Do you think it's acceptable to
> stick with explicit paging for this reason, or is there a way to make
> this work with regmap's paging?

That's probably fine.  It's *really* hard to get enthusiastic about this
system design TBH, just injecting a stream of unverified register writes=20
is going to make the driver very fragile against changes but I'm not
sure you're going to much better there.

--UGyhJCW8stP9TZVM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHfOW4ACgkQJNaLcl1U
h9C27Af/ZA51Bc25kI6lte8YUiUwu/1vUA916HbEzpc+2TziDfzVZ2mmt3NxQTfK
HdHHYFi7zHa/bpWKG8tVM5r388IyqQ+YZzBeX4PD//wdAquv1U5JQ8/zhsuatH8n
8uFa4haY7Ww5CePjpPHWo3d7tla/3eXV6RaBz4ML+4ZkZrSYSTVPKqSsH8kiHtnA
nhNzgM6PPCaUYZlstuq66ram2KTY2kLsga0nZqTr9ZYRp0FPunBFxJ3IXN5/wvRh
JIUOPMEENVzWFC2L4ew98mSDn3Xo7s6cx41YRRQDt+w/O4bpMYDFrnk5MhWa7Ay8
KI5VE72wzmr/miI2yPhTU0CHMDtXNw==
=cyWj
-----END PGP SIGNATURE-----

--UGyhJCW8stP9TZVM--
