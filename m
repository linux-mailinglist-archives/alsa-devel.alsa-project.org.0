Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D6946A3D9
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 19:18:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B75842356;
	Mon,  6 Dec 2021 19:17:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B75842356
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638814720;
	bh=jVQAq6v9Zp6REwi45gUn5OX7ldbi2oDXqegJJ+/tvco=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e20YsFAluZRAsDYs0f9peg6JsmVjQYh6Yi1Wr1eSERb29NkuPxbt8Oe7X4G1D5XnJ
	 /+PQngmAI9eU/6DrLdYO21sfAbJ5wpRtnKRS3GZCiT2Xclsv+dnxJAj3hXJIxmDpIl
	 OygO8w6/YYpDNBUeZlqJWywEJGs1RMC2dtp6SS84=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 114E5F804AE;
	Mon,  6 Dec 2021 19:17:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66493F804EC; Mon,  6 Dec 2021 19:17:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3C7DF804AE
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 19:17:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3C7DF804AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XFGIwvdo"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 57283CE1769;
 Mon,  6 Dec 2021 18:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F6F8C341C2;
 Mon,  6 Dec 2021 18:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638814632;
 bh=jVQAq6v9Zp6REwi45gUn5OX7ldbi2oDXqegJJ+/tvco=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XFGIwvdo+FGIkmo4gBVSkeeps5trKpbiUPpokZgcgvArkzDtFRzj8dW7pTLD+bSVY
 sAIaaN+e1j+nHKc6eSG3GRbTAMo2g0OHJ2tcg+/w9uh4l+OUxN+SWyaw9YC1ODlWnD
 fE37AjZQNPWE+qHXZSEEFdW7MTrgh6qO9tKzPkX4/y0Fz3eJ37ELwHCBxE3M60cQU6
 HQCXJf+owEWhXB0+CqbLvulSjI5CIHlAW/76bCi6dzjWXnzpkPe7QONLUXjPxo8/H1
 4feYGrewJf3OJWlRKuhZsQtvNY2i7HTCcJZzx1TfR3KMsANoJ51g3jRCUQCsD7ucgD
 gTMjJhErwDaeQ==
Date: Mon, 6 Dec 2021 18:17:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2] kselftest: alsa: Add simplistic test for ALSA mixer
 controls kselftest
Message-ID: <Ya5TpDyUBH0pImY1@sirena.org.uk>
References: <20211206160305.194011-1-broonie@kernel.org>
 <33692870-fccc-6d63-2c95-056a21fff791@linux.intel.com>
 <Ya48u+Wx+ZZyfYIO@sirena.org.uk>
 <b2972e61-e6c2-9f60-6242-3762c88efe0a@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="q5ZH9q4735TdaOoh"
Content-Disposition: inline
In-Reply-To: <b2972e61-e6c2-9f60-6242-3762c88efe0a@linux.intel.com>
X-Cookie: You will soon forget this.
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
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


--q5ZH9q4735TdaOoh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 06, 2021 at 11:01:25AM -0600, Pierre-Louis Bossart wrote:

> > It's not really idiomatic for kselftest to require any per system
> > configuration by default - half the thing is that you can just run it
> > and it should do as much as it can sensibly on the system.  You could
> > definitely add some command line options for development or manual usage
> > though.

> I was thinking of adding this test to our CI, it's a bit orthogonal to
> self-tests indeed. IIRC we check that we can modify all the PGA settings

I do think it's useful to run there, it'd give coverage for all the
CODEC drivers in your systems and of course for controls added for the
DSPs.

> for volume control but this test is a lot more generic.

It should be fine to run in your CI as it is - assuming there's no bugs
it finds in the USB cards anyway.  It tries to leave the card in the
state it found it in so providing we can read and write whatever the
current settings are it should leave things configured as they were.
I'm not against adding an option to run on specific cards, you'd have to
run it outside of the kselftest harness for that but that's more of a
thing for your CI anyway.

--q5ZH9q4735TdaOoh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGuU6MACgkQJNaLcl1U
h9A4cwf8CyKz10tT2kUBl+JPcdcjlrCo4OXD/Ef2KiarVE+hyjUBDPUlakykh5iB
yEki4lagBIzwsoX3783jWIoi1SA+aaClVl7LzgTbB3I23wATbQQi7M0OzrnAMvYE
ScLKTBe6aabEM9gHAlSurfO0qwRZjxDP3dOFmsfay2hTcWyuhCHpsforbGAVJtFU
PVcYwdSW23h5y7U444GH8zKdtPtNAkSRbStm237L6ALPy+8yV1i6aTJ1+3hUL+pi
bQa7VmeNQB5ih1pfKQ6u67otTcIw6GXw3IJaPxkeQ8V5BH30fEdRVMznBDYcWCOn
QPp3c6/WGIAhzaR6zJ/rGA/R0jS+2A==
=o3yk
-----END PGP SIGNATURE-----

--q5ZH9q4735TdaOoh--
