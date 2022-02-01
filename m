Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E21D4A63BE
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Feb 2022 19:26:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4AC717CB;
	Tue,  1 Feb 2022 19:25:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4AC717CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643739962;
	bh=e6IxRqhK/KzpqumpMbcYBNfiFDOhCUKQsu4AlMRlmG4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gsXCttObPA7Oldf6BXDaEegNWdaXs+yRcZp5JaoivngCaZorP6StumEJ7ltNPfndn
	 atQLtdWTKSwkV8qdcUtwG2LXZ0k3qMlQAKYCmdMJyw4OxwmIDlnYBF3b2PSUAAsL9L
	 ovGYBBwRYlt/DnHULtlSCWvb9nx2Xx8zotjLADdE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2454AF80130;
	Tue,  1 Feb 2022 19:24:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 901ACF8012C; Tue,  1 Feb 2022 19:24:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34961F80089
 for <alsa-devel@alsa-project.org>; Tue,  1 Feb 2022 19:24:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34961F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Q2wbik1k"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E07C3614E1;
 Tue,  1 Feb 2022 18:24:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8FA7C340EB;
 Tue,  1 Feb 2022 18:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643739888;
 bh=e6IxRqhK/KzpqumpMbcYBNfiFDOhCUKQsu4AlMRlmG4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q2wbik1kaLO32QhJlm2WEvW9xrIng3RqBxcJL4/G5gu8T8Hnetr3uexmZQJLcFFJL
 ho3IYisxC3iSLeVSPN8kvp6182ydaFELtcTAh5t47xIJsEYHJWyF0pEaHcI5JbHnpP
 1J8eCEBubcJ/1AnOF/sXW85DMkHR4Ov6sCwp+MuXEyroLqbrW0/z/6+zdxsAz1Pco0
 nqkdZmy6lNYoyyQSb9BzbtPdVadvhtTy0TLlHrXhy1cNdP1OE3LFgZcppufJ8ucF+/
 tUMs53LrdweD4EOxpCdLfB2LlFnYHvT6eYG0qjJVwtNUu9E+Ow3LB8O+fMoIKzIVVH
 HzuFrn8aZblRA==
Date: Tue, 1 Feb 2022 18:24:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Curtis Malainey <cujomalainey@gmail.com>
Subject: Re: [PATCH] Revert "ASoC: amd: acp: Power on/off the speaker enable
 gpio pin based on DAPM callback."
Message-ID: <Yfl66qqcwTzPuAsu@sirena.org.uk>
References: <20220129000837.6207-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zAKwRYzRPaX8C/JQ"
Content-Disposition: inline
In-Reply-To: <20220129000837.6207-1-cujomalainey@chromium.org>
X-Cookie: All's well that ends.
Cc: alsa-devel@alsa-project.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 V sujith kumar Reddy <vsujithkumar.reddy@amd.com>,
 Curtis Malainey <cujomalainey@chromium.org>, Eric Peers <epeers@google.com>,
 Rob Barnes <robbarnes@google.com>
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


--zAKwRYzRPaX8C/JQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 28, 2022 at 04:08:26PM -0800, Curtis Malainey wrote:

> This reverts commit 5c5f08f7fc0bee9a1bc3fbdcb7a21cfd0648ab14.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--zAKwRYzRPaX8C/JQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmH5euoACgkQJNaLcl1U
h9BHZgf9FDWLn4Y7+RJYn7lAFd+H6tQzS7E3DIk2bTFV+hYtvnVorB1/QAtgxIi+
ukE6hiGU1IxB2IDIbRsijIeFaIFpJOc8FsxTMFSFvvQNW/bGQcNFd3UxZVyFOJo3
LGlrbmTJTNMxHAi5x6p7tzXHro18jKcL6jjlRY+uj3qh52wW0ivtcBWCdTbuKl3X
O0qVI+TPjOjNHt7QZY8/QhP1Yfc5ZglhatyCP2/zh0dVMxdg25lifR4LGgXZiV+v
AoGJ530cI+7QTPkMlcGwVxAarxZb/e/lEih8I3stQoJ8DycBLcxHKnnK5zY0WkuO
tDQ3UOVwbDST6c30yAjK7p1vNfYWJQ==
=A4bZ
-----END PGP SIGNATURE-----

--zAKwRYzRPaX8C/JQ--
