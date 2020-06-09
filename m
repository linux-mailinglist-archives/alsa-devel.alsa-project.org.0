Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4661F469E
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 20:49:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A58B1671;
	Tue,  9 Jun 2020 20:48:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A58B1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591728574;
	bh=uCUPSy3LHC5NpBWjYwABGrcETfQmegBMc7n+u3jXo5s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FWPmwfYKEmHWJVDkrCFOX5go17UHad+aAA8selgXf4g5WYh2C/nCR00rG4V5/n1dR
	 lwPtzuySRNGEiZYsTOm3HNRYH0jmbckbgVf5VcWA/nOMFxvc8VeAQslLDU1So+9aHD
	 Q/QzYO6EjmR30Losyl7M2oGLwBGJ58NG78GJ33DE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87B47F800F1;
	Tue,  9 Jun 2020 20:47:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AB36F80278; Tue,  9 Jun 2020 20:47:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8482F800F1
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 20:47:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8482F800F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="xjqZkmD5"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 76DB520737;
 Tue,  9 Jun 2020 18:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591728457;
 bh=uCUPSy3LHC5NpBWjYwABGrcETfQmegBMc7n+u3jXo5s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xjqZkmD59drnpt66B3AiMrUEFDamsUUadN8nTRe2dZuviEldMp/gylnJXMc0evNq3
 VsShA3bQiprNZIaobB1SPaT9wDmYV1nablAHV9pbAYXicU9ovABBDwqYj9CrWU17Dq
 lGxdoq7nSDB4TdNGoCCsTHMrRHN14lhpwLfSIInY=
Date: Tue, 9 Jun 2020 19:47:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [RFC PATCH 1/2] dt-bindings: tas2562: Add firmware support for
 tas2563
Message-ID: <20200609184734.GS4583@sirena.org.uk>
References: <20200609172841.22541-1-dmurphy@ti.com>
 <20200609172841.22541-2-dmurphy@ti.com>
 <20200609173143.GN4583@sirena.org.uk>
 <bb7cff87-f814-1b37-c9eb-e68919e3c077@ti.com>
 <20200609175852.GQ4583@sirena.org.uk>
 <414a2d73-6d09-1e76-59c8-4943c0e8f720@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Pa4xkLBhPDIhDLv1"
Content-Disposition: inline
In-Reply-To: <414a2d73-6d09-1e76-59c8-4943c0e8f720@ti.com>
X-Cookie: Be careful!  Is it classified?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com
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


--Pa4xkLBhPDIhDLv1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 09, 2020 at 01:06:50PM -0500, Dan Murphy wrote:

> I could make a default as you suggested to include i2c address and bus in
> the name.=A0 But the TAS2563 does not need the firmware to operate and the
> 2562 does not have a DSP.

That's fine, the driver can just use the compatible string to check this
and not offer any of the DSP related stuff (it should do this regardless
of the method used here).  I'm guessing the regmap configs should also
be different.

> What if there was an ALSA control instead that passed in the firmware name
> from the user space instead of using the DT?

> Then the control can load and parse the firmware and wait for the user to
> select the program.

> This would solve a user from having ot update the DT to use a firmware.

That's really not very idiomatic for how Linux does stuff and seems to
pretty much guarantee issues with hotplugging controls and ordering -
you'd need special userspace to start up even if it was just a really
simple DSP config doing only speaker correction or something.  I'm not
sure what the advantage would be - what problem is this solving over
static names?

--Pa4xkLBhPDIhDLv1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7f2UUACgkQJNaLcl1U
h9B2rwf/YFbqDdxSX14Y6RPwmFML2pjKw2MuRY9938rKnwgtQ37Os922ucZ6N6uq
+WvyT864PZsYY8N01/dkmmPd8B+8lV/85PlWg+K+O9BNDLtLY5jnHE4a9xMdaYyB
zyKzaKlKti2ZpEAJ6fgQY3ja05YEBGKSPtL0PORFHmSKgaQie91AFWRPbbv7Prqb
FSB4J45Z7rUQ9OTz6qLlxixQbjMjXTx/zXUl9AptuKUvCO3ei2VP9Kx7M1vN7EFn
ava9TCr/Zex1DfGtLGR2xj48m3UYHcp+r2STuTW3L185w09c9oU3pduzQcF+qd7+
wngrO/PscDnJ+YLElOOVyQJOcZhFEQ==
=/Hdd
-----END PGP SIGNATURE-----

--Pa4xkLBhPDIhDLv1--
