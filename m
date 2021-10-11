Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AE3429613
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 19:51:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB6A716C0;
	Mon, 11 Oct 2021 19:50:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB6A716C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633974682;
	bh=0Tfup/0X75Q3iALjTKW9IdjFBObtInoYJEKNCIloWrI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aAJi+w2xSPUUdx/2lGRUgbrSns+/atFGtNboDOxCq6XVAPncAPUnVttbqEsD1/xDP
	 xKyJd6UZKKqWPncl5GaB8RTjAhildYFslPXazKncWmVfgdwjSsdgn4UcJ1dkPK0+Lq
	 MRtpQDHz4X9MmRboUKi3w0TubkB3qxbqbXWkrdxQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BCBDF8028D;
	Mon, 11 Oct 2021 19:50:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C502EF80269; Mon, 11 Oct 2021 19:50:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B33AAF80104
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 19:49:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B33AAF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Mb5V/yUw"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 31A4160EB1;
 Mon, 11 Oct 2021 17:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633974594;
 bh=0Tfup/0X75Q3iALjTKW9IdjFBObtInoYJEKNCIloWrI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mb5V/yUwG1OcDWVLCliR07688EKA2u/BtFtpW5YsbH8UdGMtF8HUBv+pvJCUHs2rv
 JoNTVvCBjEd8i7+GDCPdHAHUqCSazXDvVgR3u7aH8YA6+fk1Jt3Z5V2+txaMCCmSP4
 hwXWZYjmvL9E6lAGyerfpzc0TP1hZkcBVy7Gr09NNT5S0TiZXQdDYIYonSjZXQO0If
 oHk6LNvxqqlyBND1FP8ma20OWh7dsKTXCsvCdJPcnYdGL2DKTBz7HiV0mz/XBS9kb1
 1ZLrnunVuLF5KLvuwsNijMjUXb4QykRkryHWQcMsTX9JZAfH5b5ne3p4+P+7+KKtGb
 oewgg4ZuOBFpA==
Date: Mon, 11 Oct 2021 18:49:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 1/3] ASoc: amd: create platform device for VG machine
 driver
Message-ID: <YWR5QH1lYqiT1cX+@sirena.org.uk>
References: <20211011184715.61573-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZJ2pBbMc2TIawQ/G"
Content-Disposition: inline
In-Reply-To: <20211011184715.61573-1-Vijendar.Mukunda@amd.com>
X-Cookie: May contain nuts.
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com, wtli@nuvoton.com,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, David.Rhodes@cirrus.com,
 Alexander.Deucher@amd.com
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


--ZJ2pBbMc2TIawQ/G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 12, 2021 at 12:17:01AM +0530, Vijendar Mukunda wrote:

>  		pdevinfo[2].res =3D &adata->res[2];
> =20
> +		pdevinfo[3].name =3D "acp5x_nu8821_cs35l41_mach";
> +		pdevinfo[3].id =3D 0;
> +		pdevinfo[3].parent =3D &pci->dev;

This appears to unconditionally assume that any machine with this
hardware is going to have exactly the same CODEC/amp combination - that
seems like it's going to go badly at some point.  Shouldn't there be
some other check that we're instantiating the right machine driver?

BTW your clock appears to be set quite a way into the future (possibly
about 24 hours?) which is confusing things.

--ZJ2pBbMc2TIawQ/G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFkeT8ACgkQJNaLcl1U
h9Djhwf/ZavfF+JGMWA/XWM0KiIkQXHWhRAw0Ql/y3suDpNI1W2VtO+lYx5JJTmf
HMLPXKxLQomTujyTppWnz6abtrROefKDPzWNPRTVBA7CsQNpu5+a27qGdSXgJzZ2
Z531dwpZz+w2ITM4nrrlr+0UmGJJVNSfVWO1IVTSPYIIKA1rK6xtl/qWA7C6hU1x
XDXt7Inokj6u7e/mEU1nypwYp7cESxC0aTyHZ/RRVZV0xjAUqshu3l9mU0nEdgd7
NGfXMISM6zLURSZqfimjFpiomqU7SNv8HbQbpnD52r0v+Ls/4q7WAYpop+wMNQLz
eSybP0NJpYLXH1QyhNL0Q3jYCn3qyw==
=+nOi
-----END PGP SIGNATURE-----

--ZJ2pBbMc2TIawQ/G--
