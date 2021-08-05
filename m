Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D283E14CA
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Aug 2021 14:34:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22B711683;
	Thu,  5 Aug 2021 14:33:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22B711683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628166885;
	bh=l5rwYWEFklQRXMuTSJIAteK7ZkqvTvRw2bjGloAZJ0E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XK/FYMEetegiYjpL3IIw+qLdRgH82ZAksHY2D7c04VoxG6mNg6z0hVRvGHei1jHuq
	 5oH4O4ewkPMrRL0ommz3xU7efpjRj0X+sKBSBCzERM1AL7zjs7lG1UOMDmeSmm0XsG
	 RkRZbMOo9qmDvseMMXUoy56+a0VB3OH4d6jWch/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F5CDF8010A;
	Thu,  5 Aug 2021 14:33:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D30F4F802E8; Thu,  5 Aug 2021 14:33:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 884A2F8010A
 for <alsa-devel@alsa-project.org>; Thu,  5 Aug 2021 14:33:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 884A2F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FIINX73E"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D4C4A6113E;
 Thu,  5 Aug 2021 12:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628166784;
 bh=l5rwYWEFklQRXMuTSJIAteK7ZkqvTvRw2bjGloAZJ0E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FIINX73EPtnm1YlzmeS1CtRtyc6ZQkVYce+fx6dQ+3GRun9h5hhouMN7TbteccqBb
 BnVGpC2c+PXEDj+nHqTq+IlbBJJ0QCGOqQQiawA7Lt6wcOSvN5mkU1STMATPRz37bS
 SWxUMTKNHS1MSwK3Gd3jrdrxy4qWzRh9cC1bwmAgGdQRn6kTO97t1nKCgvd5LwciEM
 owf1Aemjpw3fw+ihigKkyInY0b8ADYcu9jX6jnqpWMHqIBI1RRh+bcpX2v3lC0OTxx
 GyAYPk5Ym8IEaNpNKxyajIr2UwiPR/WBNVEYOPAxfBe8yGvUJMaVXeO7PQQfxBqtfP
 2Ww9FrlMf6/5Q==
Date: Thu, 5 Aug 2021 13:32:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: simple-card-utils: Avoid over-allocating DLCs
Message-ID: <20210805123248.GK26252@sirena.org.uk>
References: <20210805050706.46833-1-samuel@sholland.org>
 <87eeb8tquq.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jITzwD3HDGXid3BE"
Content-Disposition: inline
In-Reply-To: <87eeb8tquq.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: MOUNT TAPE U1439 ON B3, NO RING
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Samuel Holland <samuel@sholland.org>
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


--jITzwD3HDGXid3BE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 05, 2021 at 02:14:53PM +0900, Kuninori Morimoto wrote:

> 	Reviewed-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

If you put spaces at the start of the line then none of the tooling will
pick up tags you add.

--jITzwD3HDGXid3BE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEL2m8ACgkQJNaLcl1U
h9B2Bwf/TFmGEHGgh1Y98seQLwiGG08YJnWDhxwX4jp2iislmOcbv84PWSMMSTj5
wksMM0/GX0Spij7hDC+c/lMF9pwZuhBApKc7yps13PS+Kr5vOVw4zGoQOi3+cC1k
fZW4eblaw6NTtz0F5AIhPnPPnjOi7S15K9OOY0l2MiMRetQu1yCnJDCH+yMfqMlS
BI4Xx8NZBzz0vjOFRaRty28xp0zsF4DXcCO628llr9bMQG2AD0sKXqlge+r83XVy
uke19x1f1/mqdxvVtrON70YXJ27iL6XB9gQe/M74kqMPMzCNde0OcTfbhrAdCq7d
TufLjnhRjUfgQHOwvqIoqbKogPW0oQ==
=g/K2
-----END PGP SIGNATURE-----

--jITzwD3HDGXid3BE--
