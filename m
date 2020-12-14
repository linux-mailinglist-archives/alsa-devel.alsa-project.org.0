Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 127902D9D7C
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Dec 2020 18:21:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1E311678;
	Mon, 14 Dec 2020 18:20:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1E311678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607966485;
	bh=bCVmDKin80UwRLK3QP42XBuzcvX1vaMfWPRWPv/RKFA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WuE3uc9oIfoHxLgTOfRuLs22LUGJARoReU/msCxJrRIBxKMKj68Q7+6Fc5dsTFGxg
	 V1dC/59jHRvoD/lATqV9D5OTYkx0McRyRP6X+P8MMhR8Eaj2Mxz/Dr6m1aRxN4jjy4
	 FvqQKRhfS+rn8/7+QLmXETrbiEoCCtDyLs0+Me/Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A999F800ED;
	Mon, 14 Dec 2020 18:19:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42C68F801F7; Mon, 14 Dec 2020 18:19:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18FA3F80121
 for <alsa-devel@alsa-project.org>; Mon, 14 Dec 2020 18:19:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18FA3F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="J8oGUKbe"
Date: Mon, 14 Dec 2020 17:19:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607966379;
 bh=bCVmDKin80UwRLK3QP42XBuzcvX1vaMfWPRWPv/RKFA=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=J8oGUKbeHhDMltp/h3UjokbSScr0C8Vy46jl6y6xphIflhhnROQUaOBaHn2+Lted2
 9GY/w4NoOym77BvhcftFfd9JwUZQD7mcbLOqcOwFOdSc5BP/tanFd1mmjPN02SIs6L
 fRcCOs6mXEMmeE7BxCbsNiqixgECw11Y9Y217Uz6Gq+9QK7JwIrGhBid6xEEfV1t4D
 yRoIYP6TomDj8n61qI/JLiQNPKnqBON5g1tcQJPrxdmXIgnaT/L44GNfkR6dPiSq1c
 FPPjmlUbro+pr1kvGc79rLSLdrAGB65JocvZIKkvftgq2zVAOrV24rPa/F3wI5S8YT
 myM5pAxGnjHug==
From: Mark Brown <broonie@kernel.org>
To: Codrin.Ciubotariu@microchip.com
Subject: Re: [RFC PATCH] ASoC: pcm_dmaengine: Add support for BE DAIs
Message-ID: <20201214171928.GB4880@sirena.org.uk>
References: <20201202085838.1779525-1-codrin.ciubotariu@microchip.com>
 <20201208170422.GG6686@sirena.org.uk>
 <7ab6bffa-f88e-3e2b-287a-89eee2c01819@microchip.com>
 <20201208193156.GJ6686@sirena.org.uk>
 <b98d9b89-268b-5a4f-57bc-b7f95d6c81a4@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nVMJ2NtxeReIH9PS"
Content-Disposition: inline
In-Reply-To: <b98d9b89-268b-5a4f-57bc-b7f95d6c81a4@microchip.com>
X-Cookie: Everything you know is wrong!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com
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


--nVMJ2NtxeReIH9PS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 11, 2020 at 06:00:55PM +0000, Codrin.Ciubotariu@microchip.com w=
rote:

> Also, I noticed that the HW constraints added by a DAI driver (a codec=20
> for example) are added to PCM's runtime->hw_constraints, even if the DAI=
=20
> driver is part of a BE. Shouldn't these constraints be applied only to=20
> BE and eventually merge them to FE (struct snd_pcm_hardware) if=20
> dai_link->dpcm_merged_* are set?

Probably, not sure why it's done like that.

--nVMJ2NtxeReIH9PS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/XnqAACgkQJNaLcl1U
h9BjgQf/f/WBaHkOk3bC8134oouvuQy/LZdSjlSV8PExQ0uwTpHn3L33vpu5DUa0
j0upkz44ZeJTuN9rPuWmlQZPPQiBJMzum7g3SMupNVTHg5pK3jvMzMibOSbpMmGV
U0ffm1avkLZl9iD5SPmkjOS5aENk/dDzUDvPrItaEJqN/zcOqh1KGmlmOeOCHd4M
w5vh7gWfcZiajAiBj0PLCiiGU8lf6h3G8R/5Qtp+2T81+dH5sKaQlg3BVyG9VU0m
643JshGvppylQj2JBGPS6uIZBHXWX52EUT22nRa/ZRESDBPbf5qH7hE6s6ac30r2
naIKWmzV2O1iz46yH2JWV1FwjF0reA==
=gib7
-----END PGP SIGNATURE-----

--nVMJ2NtxeReIH9PS--
