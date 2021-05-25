Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E740390BE2
	for <lists+alsa-devel@lfdr.de>; Wed, 26 May 2021 00:01:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 998591750;
	Wed, 26 May 2021 00:00:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 998591750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621980105;
	bh=kkBOi4DpYtI+XoRtMIayDKcEcvV17fRAR0eARgZzzww=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r2Bab0hV1auPJkM8uhekC3qtNkMkCb+WM3dWG5KJrnoMcohbw/5SRgJj0e44ZaFHH
	 UR5gDPAELU8/3hEcZORyo38ro4a6met7UWIeO0fmZsncxFP0bWmLtchnxVjMKTL1d0
	 o5So/RKze89janKkMwr9pd1q4e1bVNY0GH/NztXs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 230DAF800F7;
	Wed, 26 May 2021 00:00:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEAF0F800CB; Wed, 26 May 2021 00:00:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BFBAF80032
 for <alsa-devel@alsa-project.org>; Wed, 26 May 2021 00:00:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BFBAF80032
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Kcj1d6Ql"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q/aVwAl9ZbVzeROasWm9GqY9AVIvFYpQG1yWzJt4tok=; b=Kcj1d6Qlw0QazwDKdN+7hBCrS3
 LDQOLK20ivePLU0b90/AgK0s2JnPTfrGFmHrfpfeHtvfM4PXyqDq7SCchpexKKlrcwTJdo0lSmoD4
 1j1LG90iGfpfcXOdmf1CLSgXNJ+8WEFR+kUt373fMOb3DhucVpPpS5W9z7HrYoZhlbfs=;
Received: from 94.196.90.140.threembb.co.uk ([94.196.90.140]
 helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <broonie@sirena.org.uk>)
 id 1llf5j-005qUg-G1; Tue, 25 May 2021 21:59:59 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id C36A4D0E998; Tue, 25 May 2021 23:00:33 +0100 (BST)
Date: Tue, 25 May 2021 23:00:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.10 29/62] Revert "ASoC: rt5645: fix a NULL
 pointer dereference"
Message-ID: <YK1zgS7FwtySdeCg@sirena.org.uk>
References: <20210524144744.2497894-1-sashal@kernel.org>
 <20210524144744.2497894-29-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="DdwHdDdz+wOD3YAw"
Content-Disposition: inline
In-Reply-To: <20210524144744.2497894-29-sashal@kernel.org>
X-Cookie: You are always busy.
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 alsa-devel@alsa-project.org, Kangjie Lu <kjlu@umn.edu>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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


--DdwHdDdz+wOD3YAw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 24, 2021 at 10:47:10AM -0400, Sasha Levin wrote:

> Lots of things seem to be still allocated here and must be properly
> cleaned up if an error happens here.

That's not true, the core already has cleanup for everything else
(as the followup patch in your series identified, though it was a
bit confused as to how).

>  		RT5645_HWEQ_NUM, sizeof(struct rt5645_eq_param_s),
>  		GFP_KERNEL);
> =20
> -	if (!rt5645->eq_param)
> -		return -ENOMEM;
> -

Without the followup patch (which I don't think is suitable for
stable) this will just remove error checking.  It's not likely to
happen and hence make a difference but on the other hand it
introduces a problem, especially when backported in isolation.

--DdwHdDdz+wOD3YAw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCtc4EACgkQJNaLcl1U
h9DmWwf/eYEFvTLEKSVeNp5s76miE9DNZEsJf+6meHS2E2vLXz8rU0IPk5IpTcPy
BbXfaYsKCBHYU2Je394Xa8Nfjix4kxZoD/JXNG/cbAIFeinaUeXvY0ig4oWIvCxK
DbHtmyn50GMD4xLrZgCSc0bX5PSXU3hcFZUrLkfND5gHfo+rchxQ4MvWaybzcYh9
n0+xo8pyhFPcYuCpM+rRj27xBhHeIv6fKdVwtuoZGZnh9OHn7a37ZUcZceNwPY/p
oU/QrvPTrXzgad3OnsywWhE2Vo5U7djjfGT8hAay1ckC6kQlIWlnIvuLTx67GD9N
T7JzAerzodiHmeEVJmGBkPgJdcJYMQ==
=bVSZ
-----END PGP SIGNATURE-----

--DdwHdDdz+wOD3YAw--
