Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 949894AD862
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Feb 2022 13:36:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 210AC17AA;
	Tue,  8 Feb 2022 13:35:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 210AC17AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644323772;
	bh=CHVNrRIEUWEzDlcHyNRheJauZuGg3id3GeumZLSxfLs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sXZEd0BMuEPR57ens/sdSRS9Wnl/Yw8HTxZRJWMLqdxTECa/BDkREiAVgjOcAo2uY
	 da7Maz2gru/iB86CdjNGolN4sHcicOoK8iNPdftcQM3XVq7WHbwwCZVS8+IUnKeFct
	 aOBJDL73Hr/gtqfCIQEBNYZ7aRuqIP2YEdAgejVE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 950B7F80154;
	Tue,  8 Feb 2022 13:35:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C5A7F8013C; Tue,  8 Feb 2022 13:35:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76323F800F0
 for <alsa-devel@alsa-project.org>; Tue,  8 Feb 2022 13:34:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76323F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="A3CU2KGd"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 144B5616EE;
 Tue,  8 Feb 2022 12:34:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17C2BC004E1;
 Tue,  8 Feb 2022 12:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644323695;
 bh=CHVNrRIEUWEzDlcHyNRheJauZuGg3id3GeumZLSxfLs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A3CU2KGdrGsFsg9RIbIXsWWGAvFqqY4+vzxLLEd4lxOTxzEg/4g7EpcyiHFpGFRio
 5PG7EgOd/+mnwcYwMmQEvSxETQSQ/JjjDQl4FBkGpi1/+XFZ2Isk0c3NASrY1tpZ/y
 yJ4+M6O6+YJfk91IeCU1rXNaUktyTjSqlkDI5vgV6OeeYAzcrbMkiPeWq7NQV61wZ8
 jaMn6ajbF1GjgwhzUMdHVASRsupFm7QhiIzO+Kd0dm9Gma9OCb/eO/goK3TEDyOTFH
 ckdf52XZLhfpyyY2eu8XkY7Q5sPkl3L9tcCJvEJLYHge2hI8Dsr3uBoLB3DEDEEyFu
 jX1lknCUTlG7w==
Date: Tue, 8 Feb 2022 12:34:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1] ASoC: nau8822: export right speaker inversion
Message-ID: <YgJjalw5O1aoBIX0@sirena.org.uk>
References: <20220207153229.1285574-1-francesco.dolcini@toradex.com>
 <YgFClQRVX5cX6L3J@sirena.org.uk>
 <20220207170351.GA1217637@francesco-nb.int.toradex.com>
 <YgFf5hvxLppKYIUJ@sirena.org.uk>
 <20220208082109.GB1217637@francesco-nb.int.toradex.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qLYFN51j/qoB9Ktg"
Content-Disposition: inline
In-Reply-To: <20220208082109.GB1217637@francesco-nb.int.toradex.com>
X-Cookie: This is your fortune.
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


--qLYFN51j/qoB9Ktg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 08, 2022 at 09:21:09AM +0100, Francesco Dolcini wrote:

> In general it is a development board, Toradex Verdin Development Board
> V1.1 [1] (the picture on the website unfortunately is from a previous hw
> revision in which we had a different audio configuration, anyway if you
> are curious the schematics are available), but we do try to make the end
> user experience the most smooth as possible, so what you propose is not
> really appealing to me.

I suspect that by the time anyone builds a practical system based on the
development board they'll want the value fixed.

> Said that, if the only viable solution for you is to have a device tree
> property would be acceptable to not have any in-tree dts file using it?
> We might decide to have it enabled with an out-of-tree dts overlay.

Yes, that's totally fine.

--qLYFN51j/qoB9Ktg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmICY2oACgkQJNaLcl1U
h9C6xwf/aFdxSR9qF1c6kTDycF2AgHBYPrv6IUbxBwIIcEdhxgNvBMTOBNdB+aUw
U8E61qo6Vt6TNnvAd+Hhc8J0mnaztGws5AZgER5vwwVFNaHViDp5fdfH+mk2xAzr
UVXWgo8VjumP0rYXLVx4AFMM/Pt7xUmp6T2DTuYtphTAPWEP7ideUYBIXBjKPG8h
a7y1USXx64WkNyPI37xXzJEw5hFhAvtAWfqdFYSZ/v81Y7GjAq4/eKwA3n0QeHht
FdFkEPg/Rd4+UZULWutSmxL5bMr1oaELxqCY2C3apW5SRHe76Fvc7QIfdTT8eQ2z
YHXOvjYTFw9e4eGoWoSaBfVbea3b0A==
=1G5d
-----END PGP SIGNATURE-----

--qLYFN51j/qoB9Ktg--
