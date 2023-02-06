Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E540C68C864
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 22:15:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 448641CF;
	Mon,  6 Feb 2023 22:14:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 448641CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675718145;
	bh=riTB1YokzEFFDU4GzUfnUbRbAWC2sdyJCh34WVA0iyU=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KkbmdL7EBQTdRUoh+vAbwuEDBCjY0838Br8pUXngHrMpHhc87c4/AAiX8+StD+Z+b
	 F2nT9jX3Wf774hbQ2XYBkUIAk2Nk70rc8mFOtajP+heEHzXHO7bjR/OS1jXqnix8XT
	 +JiQGiearPIB19bN/ufAbe+yh3cTEC2ePiYCNIVA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88F65F800E3;
	Mon,  6 Feb 2023 22:14:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60CBAF804F1; Mon,  6 Feb 2023 22:14:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9AF89F800E3
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 22:14:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AF89F800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uOlR740q
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A1C716101E;
 Mon,  6 Feb 2023 21:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CC1FC433EF;
 Mon,  6 Feb 2023 21:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675718078;
 bh=riTB1YokzEFFDU4GzUfnUbRbAWC2sdyJCh34WVA0iyU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uOlR740qcEbFNWHQHLtvWGGe0sBxuYEHajtCVC4uTaWPl9L7gjr5Toz2/gJ1nlkrJ
 08lZ39/Xu4Ca+NHu1hj1PflPTSodIkpRR3CYt/cpDvUgPWIM6Q+AZtHa2ptzPZG68M
 cu1p5vVZpGmHn0vdKrph9ALM9hMhYTAQ9In4FhzdDI7XgRsFr1n3J803akkOk14V9X
 C8voOKR36DMXk3kFL6rRQeuCKD7zfmOIeTwahOWNALnd2fkSej2onXJa7rns3fZFRA
 lUqmfwqBJtLewY78tYpzz1zE3a5JQnB/cgaeUTASknGOHJ2dgs+JNR+vraEgCcL0uU
 JNKoQCyCYexyg==
Date: Mon, 6 Feb 2023 21:14:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Beer <daniel.beer@igorinstitute.com>
Subject: Re: [PATCH v3 2/2] ASoC: tas5805m: add missing page switch.
Message-ID: <Y+FtutYjJFlrFtvP@sirena.org.uk>
References: <cover.1675497326.git.daniel.beer@igorinstitute.com>
 <1fea38a71ea6ab0225d19ab28d1fa12828d762d0.1675497326.git.daniel.beer@igorinstitute.com>
 <Y+D8bf/19aOL7Wzl@sirena.org.uk>
 <20230206204546.GA233871@nyquist.nev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dCj5T8jTG3AIPXcS"
Content-Disposition: inline
In-Reply-To: <20230206204546.GA233871@nyquist.nev>
X-Cookie: Hope is a waking dream.
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
Cc: Andy Liu <andy-liu@ti.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--dCj5T8jTG3AIPXcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 07, 2023 at 09:45:46AM +1300, Daniel Beer wrote:

> We did discuss this a while back when the driver first went in.
> Unfortunately the vendor software tools provide configuration for the
> part in the form of a sequence of raw register writes, including
> explicit page changes:

>     https://lore.kernel.org/lkml/Yd85bjKEX9JnoOlI@sirena.org.uk/

That seems surmountable, either bypassing regmap or parsing the
configuration files.

> Aside from this, I have two other practical issues.

> The first is that I'm not sure how exactly to implement the paging
> scheme in terms of regmap_range_cfg (assuming this is what you're
> referring to). This chip has multi-level paging (books/pages), with the
> book selection register itself requiring paging to access. A sequence of

That's absolutely fine, this isn't the first device which has such a
setup and the code handles nested windows fine.

> Secondly, the patches as submitted here have been tested, but I don't
> currently have access to hardware. I'm very hesitant to make a
> significant change without retesting and leave the driver in a broken
> state again.

Presumably someone does given that the problem was noticed?

--dCj5T8jTG3AIPXcS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPhbbkACgkQJNaLcl1U
h9C9Ewf+KewXF5GyAN4ZUwICEK/KJH2L6ZUXWmLiuhWilIkEZaxZb9Dc3zW29GHv
P1OSQba9GM+o+FyQX1lQaGp7lwt3POmUF4nVlxyDnuHZrSGJwbeS0ermaomFstJe
4n9PY1CpIsxAFyhXLaeOO5mFpYins/crft0TIgT03bLn5BaM5xu8bn9ywQYNHdpI
0u3Qy/k8KpO32qheL99/Xcb1twsZLEbLIRwpAaLAE+r0NXeCU9B4fnov/S33a9cF
PnlMk9384GoGtwqUjUcWZ5cDMjNffDZNLFht97JlTzC8hbaDj84zfolZ4vlyQEYw
QhRF7Id4KquZJZKzWuzWSoBYkm5ZBg==
=0Hl7
-----END PGP SIGNATURE-----

--dCj5T8jTG3AIPXcS--
