Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5021FF087
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 13:33:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9EAE1782;
	Thu, 18 Jun 2020 13:32:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9EAE1782
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592479990;
	bh=xmVKqCZO9WNjF/s1+iMwtbOzQ/ZlWpvC11qODgjb/Fk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ICnBmXXPsZqnIlz9madGNCGEhYb6jmtaiHFiXgtv3Y+TSeZ3DP2sk8JGx5BBrKCfX
	 4uEkL3/ZS8Nq6STlM6bse8Qz1R0bSV9ry7bJjaVvUnZHujj5WVwTqDCIMeufoNoOC+
	 9nqgfoLjBT4GCp5HHinhtQy8SrfJTlgBDKJyd1JU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03E94F800D1;
	Thu, 18 Jun 2020 13:31:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6684F80116; Thu, 18 Jun 2020 13:31:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0D64F800D1
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 13:31:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0D64F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uVP4Z99Y"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1A25E206C3;
 Thu, 18 Jun 2020 11:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592479876;
 bh=xmVKqCZO9WNjF/s1+iMwtbOzQ/ZlWpvC11qODgjb/Fk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uVP4Z99YcHvJ4xcy54nJ0Ixc1WAPI7Izy/o0/amvDXFN82Opxh8WrxPGFBbR8f+G7
 GDeN8EXggH2c9KxHuKiBFZ7Dq2s1To4uG1FKnZNPphdza9rUQWorreO/aYdUnBffoD
 8SZDuaMTbl/iPpakFrbxV76w9x3vikQZ5a3ZXRbk=
Date: Thu, 18 Jun 2020 12:31:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Subject: Re: [PATCH 2/2] ASoC: amd: closing specific instance.
Message-ID: <20200618113114.GG5789@sirena.org.uk>
References: <20200618072653.27103-1-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="w2JjAQZceEVGylhD"
Content-Disposition: inline
In-Reply-To: <20200618072653.27103-1-Vishnuvardhanrao.Ravulapati@amd.com>
X-Cookie: Androphobia:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Akshu Agrawal <akshu.agrawal@amd.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Colin Ian King <colin.king@canonical.com>
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


--w2JjAQZceEVGylhD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2020 at 12:56:52PM +0530, Ravulapati Vishnu vardhan rao wro=
te:
> The steps to reproduce:
>=20
> Record from the internal mic :
> (arecord -D hw:1,2 -f dat /dev/null -V stereos)
>=20
> Record from the headphone mic:
> (arecord -D hw:1,0 -f dat /dev/null -V stereos)
>=20
> Kill the recording from internal mic.
> We can see the recording from the headphone mic is broken.
>=20
> This patch rectifies the issue reported.

The changelog should really also describe what the underlying problem
and/or fix are - this description is only at user level, it's missing a
bit for describing the change.

--w2JjAQZceEVGylhD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7rUIEACgkQJNaLcl1U
h9DKfAf+L2nSYQE3s9vUUaTa2gREfXwRWFiOeS9pnxdOboz5I43vVFqJauMas8kx
PhUZRYhfwsYXiNWLikhDRpPTw/zLhqaxRhqTjV724NcZE35tZp4KjC6aSvY7n0Zs
KEN208OWaO27vbklKnwv0rXwu5lCrX1c5dJF2ax9z2u6cu1PCKWd4o2rC30JxykY
GFtcooFi04ann8+eBia8VhNHODWPIkkVBDe7moz4hGPg+Od/NGaKjtX47zpSGadF
BH+5fTO/sVjdTXLvn3WKdxf0qiNmROyhCQQNuJAPPO3Ns71xSCxHHvq3MlLCsjF9
r8eky0ARkzvxVVwhj3tAyPqcghgdeQ==
=mItw
-----END PGP SIGNATURE-----

--w2JjAQZceEVGylhD--
