Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D05BB4AC83A
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Feb 2022 19:08:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F2E71862;
	Mon,  7 Feb 2022 19:08:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F2E71862
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644257337;
	bh=okRsDTqMLYBRVJbnFS1YDRX3zrIh8WhMK+p0ZX7QGig=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dworknd/MfwLQjI88YzwUFaVD7QavxN/+dC/2M57H98aoOUhKk0RiCHcJOSrqk5N9
	 uvkiclDLJfOUY1LVBp4iQfuldQNx15HbuLHv17GNaMpE78xPL1k9ZOoy4CLAm8T4w+
	 wpM4nP8epqRBtrMsaiCYpRX93+HsBLp4+dSpsz/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBE20F800F5;
	Mon,  7 Feb 2022 19:07:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5402F80240; Mon,  7 Feb 2022 19:07:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8376DF800E9
 for <alsa-devel@alsa-project.org>; Mon,  7 Feb 2022 19:07:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8376DF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Luyym9qq"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F0AC9B81633;
 Mon,  7 Feb 2022 18:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ECFEC004E1;
 Mon,  7 Feb 2022 18:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644257258;
 bh=okRsDTqMLYBRVJbnFS1YDRX3zrIh8WhMK+p0ZX7QGig=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Luyym9qqf29hKB6XOqH1RThxdubob+VoGa/AOzpi8GPRzFo7hAGXzJnyi7BS+lb/G
 dYyazzkwg+Bg3QJiUbxrRJA/MPXE9R2PFMDoDepSKhEidIMNVL55+vMDHdhenJHKyG
 mT4QCgWYdE64+K50r0MnnMXV0pZ2o+UxiR2da4G+bTzODdRw2snybHBgYPfreABtkL
 +bA3edPcHP+Sm6DG5+kyERIVS1f/9pYvwNSX/OndBF/ipDTY2Qe3fIHYQPMuoQjaca
 ESERi3+lX8gX0aQ91ewFcmIcL+Y/wtHKRgKJVKnVNyZEKMrASO/u0xtso0+67/NqSx
 bVviAcn8JkIEw==
Date: Mon, 7 Feb 2022 18:07:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1] ASoC: nau8822: export right speaker inversion
Message-ID: <YgFf5hvxLppKYIUJ@sirena.org.uk>
References: <20220207153229.1285574-1-francesco.dolcini@toradex.com>
 <YgFClQRVX5cX6L3J@sirena.org.uk>
 <20220207170351.GA1217637@francesco-nb.int.toradex.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="IGqknfXSD0BHQjDa"
Content-Disposition: inline
In-Reply-To: <20220207170351.GA1217637@francesco-nb.int.toradex.com>
X-Cookie: Never give an inch!
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Max Krummenacher <max.krummenacher@toradex.com>
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


--IGqknfXSD0BHQjDa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 07, 2022 at 06:03:51PM +0100, Francesco Dolcini wrote:
> On Mon, Feb 07, 2022 at 04:02:29PM +0000, Mark Brown wrote:
> > On Mon, Feb 07, 2022 at 04:32:29PM +0100, Francesco Dolcini wrote:

> > > This control inverts the signal fed to the right amplifier.
> > > This allows to connect one loudspeaker to the two speaker amplifiers
> > > in a bridge-tied load configuration getting higher output power.

> > Is the value chosen for this not going to be a property of how the board
> > is wired up, in which case it should be handled as a DT property rather
> > than varied at runtime?

> Not really, in our board we do have a L/R loudspeaker connector and the
> end user either connects a mono speaker to the left and right channel
> and enable this control to get more power out of it. Or you can just
> connect a stereo speaker.

> Enabling this control to me does not depend on the board.

What do the physical connections for the speakers look like in this
system, and more generally what sort of system is this?  Most systems
either have the speakers enclosed in the plastics with the rest of the
system (which is obviously system specific) or have jacks/binding posts
for connecting speaker which are labelled fairly clearly for one
intended use.  If this is some sort of raw/development board that's
something where it's expected that people should be willing to configure
DT for changes at the level of wiring tihngs up.

--IGqknfXSD0BHQjDa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIBX+UACgkQJNaLcl1U
h9CRDgf/ShtHfsZ+W7VyeNHRgT/ZDMpsYctwKXmUDfFhyIj1GVwwRqRa2BJ73XQc
WuuCOi0oMIkvQxyxV/cozeEo7BP5VrmCJRCGh9Q5/y4ZSoXntt3soRx3xuSOIja/
5BgeCEV3BuxO8sPGkIo2uWU67FRr3PnqqzgfztQuvDRlZKivW/DG4WJtQ9zYWi64
H4uqUeb/2U1ASFZ4cDHb0lsB76Ew8dCuEtiSGYCkOREL24QE1FMoQHhujjP8pibz
yx4QEAeUvvCTTFCBY9UiiVIxUzhmO3WxPQKGKWJfnhXYOkUdIPdyC9A2upvUAJna
ueLRrdUS3lpjEcujwBCX2scw7NWnng==
=2v2h
-----END PGP SIGNATURE-----

--IGqknfXSD0BHQjDa--
