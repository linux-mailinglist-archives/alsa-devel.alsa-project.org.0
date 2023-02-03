Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C79689816
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 12:49:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B0D682B;
	Fri,  3 Feb 2023 12:48:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B0D682B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675424957;
	bh=sXBX1FG6ndVGefT904bnksV8B+g4LxIK97sutzKIqNE=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QifEIONqbsGVW71px9f2MsJkciRUf2/HQ4FapRalcZe9KtDPlIByJd6OhrXTkVWMx
	 d41VcUO51Fx2S9xNd3/nfUwEbfavC/G1+Ngxcm2Rd1EwsgvtSuF1OZlo7EPgUdZ28D
	 1WhhB3DlLk6ULFSM7rcLQjdc/91RGmWsJ3DT7beY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66CCFF800E3;
	Fri,  3 Feb 2023 12:48:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 419DEF8032B; Fri,  3 Feb 2023 12:48:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D904F800E3
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 12:48:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D904F800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OQ5/MYRv
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6030D61EDF;
 Fri,  3 Feb 2023 11:48:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89106C433EF;
 Fri,  3 Feb 2023 11:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675424885;
 bh=sXBX1FG6ndVGefT904bnksV8B+g4LxIK97sutzKIqNE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OQ5/MYRvKvLBYmD0dA3PJdZ7Epr40/BTH7nbSlK7+wFZPoEBj5EmO4JWqecjeRxR+
 B/iSweeCvTGY3fjdke/bBXjQtVykCLPdFqqGU9ktxc0N70sghU8BNDNuaNjzfDMWhS
 9xRmj7NUziC4xCvRKjHJVNZOLGyot+RdeudHWY7IRVy13TkKgaDOYBJU9t6ynd5wQy
 8feOq45sLlq6jWd1OVq10ZXObB6hZ7Ishp7lMHgECKl5O5z5sPGynRTQhdAmFwGN6/
 ydAbA0R/fQhWdcJFsjLIHKeABeGhliAhtNPY7Cop+P0ZgWlFp3i2xIHg8Lh04A7wPg
 waLBdhfqtax9g==
Date: Fri, 3 Feb 2023 11:47:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] tree-wide: trivial: s/ a SPI/ an SPI/
Message-ID: <Y9z0bQ8TeFROA0Fj@sirena.org.uk>
References: <20230203101624.474611-1-tudor.ambarus@linaro.org>
 <CAMuHMdVeDbTGLBAk5QWGQGf=o6g25t341FjGTmNsHw0_sDOceg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="SpLBoke9z0+WTDIl"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVeDbTGLBAk5QWGQGf=o6g25t341FjGTmNsHw0_sDOceg@mail.gmail.com>
X-Cookie: Pay toll ahead.
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
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-staging@lists.linux.dev,
 linux-acpi@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, trivial@kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--SpLBoke9z0+WTDIl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 03, 2023 at 11:28:03AM +0100, Geert Uytterhoeven wrote:
> On Fri, Feb 3, 2023 at 11:17 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:

> > The deciding factor for when a/an should be used is the sound
> > that begins the word which follows these indefinite articles,
> > rather than the letter which does. Use "an SPI" (SPI begins
> > with the consonant letter S, but the S is pronounced with its
> > letter name, "es.").

> While I agree with your pronunciation, I believe the SPI maintainer
> (which you forgot to CC) pronounces it in James Bond-style, i.e. rhymes
> with "spy" ;-)

Yes, I do.  To the best of my knowledge most people just say "spy"
rather than pronouncing the letters or anything.

In any case as I said in reply to one of the individual patches English
isn't regular enough to go with hard and fast rules on anything, and the
letter rule is much more commonly used where something is needed.  Using
an here looks wrong to me, and the fact that a is so widely used does
suggest that usage has escaped whatever rule there is.

--SpLBoke9z0+WTDIl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPc9GwACgkQJNaLcl1U
h9BWWgf7B2SbxlDCRQ/tXsgEj6IpmRoheV/Rc6V7cDJ3WW0RDwuKuwr+iYGYH4wI
JMhxrKQp0ohQOtyboaLZK7RSARZQtK65wRZ2Cnrc3ilSy9T0cwDCOwBQ8I14Rclq
/g2LhsTjAgrRpbQDo70vY9TV1fgGhwKHTNkGBfUAlfdPRz38Q/xX53UXHBy6cVqC
ZWmrmxiRWO0ERd1qkYXsmPVVrtor6skFKeuri+z1H/l/Rl+vj0R4zLIiek1nzhnm
W92b3oRnp6fRbyoiNsBO24Hrvd4POfaUHRf006dJ3jQnJpFKQwP8sFCMJD3BLpIU
flkBLxV/d8OAm+zvn+ZpbTQr/78vKQ==
=4YMj
-----END PGP SIGNATURE-----

--SpLBoke9z0+WTDIl--
