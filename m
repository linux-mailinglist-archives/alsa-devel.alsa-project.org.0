Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5C859BF7C
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 14:28:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B800BAE9;
	Mon, 22 Aug 2022 14:28:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B800BAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661171332;
	bh=aUEahSk14C2D4VY+24DDPQUNApAcftefeXOc7P9REmk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jlfykC+IWI3oQePd2jZPGKWzFN33BXvnuK3mNu/QEMnrceoOAynCw4b7KOXgGqGXk
	 5IAtWHd2SlshO5KRIG+Yy8jm9/AmRqD0VfXwPEh4fZTvzU8Uw/6J+29GSUurkeYw+D
	 NMFhCZ0EW54DmaLlVW8C1Mb1GrjEfcvGUrQTXbMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1214CF800A7;
	Mon, 22 Aug 2022 14:27:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0C59F8026A; Mon, 22 Aug 2022 14:27:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B173EF800A7
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 14:27:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B173EF800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sMmjAuhi"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DEECFB81132;
 Mon, 22 Aug 2022 12:27:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75ADEC433D6;
 Mon, 22 Aug 2022 12:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661171265;
 bh=aUEahSk14C2D4VY+24DDPQUNApAcftefeXOc7P9REmk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sMmjAuhi1ZkgpyEJuzIt3cp9qztm5Pn9m3o7Z6R4bVmpNbhjbVot+Q5W/Y5EiKGxL
 7Jw7MrDdLUlfpqAHC63ZZfii65rHIalalJIiqWxI0+v8zswwvzecDsy1rPgQz3W0M8
 TD3pOM/Iwj3dGmVEoP1tkAygTClJrqVB+d5zLN2M+GlxP6wDqTc7GSKb+npYuQAtIM
 OKuxxUXrLiDbriI7fkXpcN7vwhsniAl3DE+tQf68CKoBYCRuNiUvJCpu/GsSeXVZhZ
 WqDDrP66untaxGqqz1IlSONIl9WQT8oYarXxQOhtEkqMeED/pVRwA8pyylw8KBVI/g
 OJFGiRaDtx3Pw==
Date: Mon, 22 Aug 2022 13:27:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: Re: [PATCH] ASoC: dapm: Export new 'graph.dot' file in debugfs
Message-ID: <YwN2Pd4Ez08yDFno@sirena.org.uk>
References: <20220822095242.3779-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="H0vk/nqgiuFqMzfW"
Content-Disposition: inline
In-Reply-To: <20220822095242.3779-1-povik+lin@cutebit.org>
X-Cookie: Do not write in this space.
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-kernel@vger.kernel.org
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


--H0vk/nqgiuFqMzfW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2022 at 11:52:42AM +0200, Martin Povi=C5=A1er wrote:

> Provide a DOT summary of the DAPM graph in a newly added 'graph.dot'
> file in debugfs, placed in the card's DAPM directory.

There was a tool floating about in the past (last copy I knew about was
on Wolfson's git but they took that down) - can we not just continue to
do that?

--H0vk/nqgiuFqMzfW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMDdjwACgkQJNaLcl1U
h9CpgQf/YpXIsBv47/vLUdj+ktYB8vSAnTLc3Zwc24N6Q6H/0Zqz3P75GOcIxIO7
FXLfNx9fkoK9jFVJTo51CKgOuBADb9DJWkVRDUdWzPx0hhOVx2IL4S67bHhtNybo
vAvUI2poQFa9kNxaWpYuz8X9BoWj45QmfvN/2uI03C21/CY6wZ/k2QLOcfx4gz9y
X+gl9+fv3mCNo+NsFhzq3AG4+aEAuQM9YOq9r65EkaPR9besOQ7it+ivnwUnY+dn
vRBMD5JXD3JC26GHdADAUL5/rs5XI9rr0OOPp7+MthhMNGrs2b3uG5ipbdiuakKm
uM2yKH8eusk56vFsWCTaHr8HZP2a0A==
=SGiF
-----END PGP SIGNATURE-----

--H0vk/nqgiuFqMzfW--
