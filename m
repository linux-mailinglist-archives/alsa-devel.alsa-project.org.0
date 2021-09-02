Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC8B3FEFA7
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Sep 2021 16:45:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A187617AD;
	Thu,  2 Sep 2021 16:45:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A187617AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630593955;
	bh=QSkZv2N1yXVzhucXRsxaUE7H3wr+r7TSYHXNxXgC910=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p2iHmPw97VnqEMbT20eFfCfnfXF5GLbsyZJcoHpSVbgj188tBIGG3LC/PZQ786+3v
	 ezbI/9zVd32S1NfK9FQULhpLST77WaV+/fZJUNx/lxBQcVN4xIe6JZ/6KPj+mwi1Ge
	 KbM2KYQ7UNtYFt93ewVRKDmkp8p7hhVcWfVeFnk0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BA1AF800AF;
	Thu,  2 Sep 2021 16:44:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00CBDF80269; Thu,  2 Sep 2021 16:44:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89AEBF80125
 for <alsa-devel@alsa-project.org>; Thu,  2 Sep 2021 16:44:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89AEBF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oDOYYkTy"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5CB33610CC;
 Thu,  2 Sep 2021 14:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630593866;
 bh=QSkZv2N1yXVzhucXRsxaUE7H3wr+r7TSYHXNxXgC910=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oDOYYkTybQvl1z6Luah3ixvfoCcvxrLI1lfGneZBWECIuC7las8tHY4sx9jFAowup
 mtthFD4gHpW2p17sYrm7Mgh85X7CvTV5On0a1IRI0cvEcJzmLbz7pvkvXoeAWswxyN
 gLaJLeqUgQ7jJqx3ynHZEPF46lNi27sb31qr1nVxWHR2xRApLthfDAGhYYTlgVaHNB
 maEoFyoOpTZfV7rpXhEPr77U+Q2vRZfu5GsC10TzD8Tvh6rKqlxzJ9Uacomw+ZmuWN
 UfQpwJeKIZb4wX6C9HQN7WrqESL+pG6RY7QBb2q4bMSbonZF6O6JJnqgzOosm9DMwq
 7PhKumonfatXQ==
Date: Thu, 2 Sep 2021 15:43:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Alejandro Tafalla <atafalla@dnyon.com>
Subject: Re: [PATCH RESEND 1/2] ASoC: max98927: Handle reset gpio when
 probing i2c
Message-ID: <20210902144354.GD11164@sirena.org.uk>
References: <20210829170019.384632-1-atafalla@dnyon.com>
 <20210829170019.384632-2-atafalla@dnyon.com>
 <CAHp75VdY9uoTWeJEroi3iChnToUSxe+Henmg7Yux+UWkK59jQg@mail.gmail.com>
 <YSwGlXEFRuUvNGZ7@dnyon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="NtwzykIc2mflq5ck"
Content-Disposition: inline
In-Reply-To: <YSwGlXEFRuUvNGZ7@dnyon.com>
X-Cookie: Famous last words:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>
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


--NtwzykIc2mflq5ck
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 30, 2021 at 12:13:41AM +0200, Alejandro Tafalla wrote:
> On Sun, Aug 29, 2021 at 11:22:35PM +0300, Andy Shevchenko wrote:

> > > +       struct gpio_desc *reset_gpio;

> > Why? Are you using it outside of ->probe()?

> No, I'll delete it and use a local variable.

It can be good to reassert reset when unloading the driver in order to
ensure that the device isn't active.  It doesn't really matter though.

--NtwzykIc2mflq5ck
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEw4yoACgkQJNaLcl1U
h9DWrAgAg56iA1Au+XNyIyNCXB0VXn2oIgAwnxeXEjv3PKrw4YE0fW7dcbvywDnr
8Fs2PMIw09wFpzzoSzAQCNGN8Ts3OeiL8QFHnsOQeeyIzSkuOviiBrOWDtuCfx/j
0XXcxoH4ODxf0faKlbCGHQ6LdBgvsSeQiU3ExLjqJHYusxXbXUdRJ8XxIyhDC5tI
+7KZOK7azIuJxSJrfYJ9aIlHvMmkCS9o/OpynCwkrwZwAh47+XyNSR6mn3pgiEoS
Q8+WJChvT1kQ/XdYHo4GigjZIVXF0hUeA0GJJUoIdbJKl7O+8YLlOH0MDh8i0isX
iTLYJ+8bqv+F8ONYPxTXcdlw4pcYdQ==
=IJLZ
-----END PGP SIGNATURE-----

--NtwzykIc2mflq5ck--
