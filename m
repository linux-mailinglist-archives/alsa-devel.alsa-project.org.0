Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 460B564CC13
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 15:22:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D74A52A19;
	Wed, 14 Dec 2022 15:21:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D74A52A19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671027762;
	bh=XELl5MpYJmNqmidd3UXimpL3bgXtaqv3Qx+sVGvAPqM=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=i/tkkCNvxorjhLzxPGT1sjtS02IagfEy6CrQecljxT1c5UtH2DA1Wh597D3CApxh9
	 dW5iuJ0FUvw1wqF3onGoBXxev0qGjVwIu0BoqMYdrYS0FsOxBqy2D8JDL7ocCMMatT
	 Q/PHjZxGi6TR1+AnJ8KSOONIs1YWjV3Q9x5CyEvU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B09EF80141;
	Wed, 14 Dec 2022 15:21:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61A13F804D7; Wed, 14 Dec 2022 15:21:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05947F80310
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 15:21:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05947F80310
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PBmJ6jXJ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1FDADB818B6;
 Wed, 14 Dec 2022 14:21:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 229C5C433D2;
 Wed, 14 Dec 2022 14:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671027699;
 bh=XELl5MpYJmNqmidd3UXimpL3bgXtaqv3Qx+sVGvAPqM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PBmJ6jXJyyc33GgITfQFBmsAjvjIuBZ2FhAxvO8NIz+IGlz9JDaVXTetInukL1FMA
 b8QNXZ5G2soc0gLnvxNzk2HwaCbURQA2yHxvb3UfDMIyDqLPHvfXLFQsai9MoxV805
 0PpfTPFmFAAcLWjwr8aoCuSUg9LMU6s3kVwj80MRVILVqvLidjNaw2nTOs2EuozLXF
 LcOYKSsCdireU938/GiY5c3jNkrt4hggRMCtYboJQXd1wQ+bpQ96UNqT57R0JTyZMv
 FLbCnVhSCKlQTvwFWkU1O/jcBnxPgAI46BHVrLDKG/vV84PRFSAqunbi4KtImNorX0
 7azkTUs1EL9dg==
Date: Wed, 14 Dec 2022 14:21:34 +0000
From: Mark Brown <broonie@kernel.org>
To: David Rau <David.Rau.opensource@dm.renesas.com>
Subject: Re: [PATCH 2/2] ASoC: da7213: Add support for mono, set frame width
 to 32 when possible
Message-ID: <Y5nb7ik1cCKo+FlR@sirena.org.uk>
References: <20221214044058.6289-1-David.Rau.opensource@dm.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="R02+LBkw4li2rDmN"
Content-Disposition: inline
In-Reply-To: <20221214044058.6289-1-David.Rau.opensource@dm.renesas.com>
X-Cookie: I disagree with unanimity.
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
Cc: alsa-devel@alsa-project.org, support.opensource@diasemi.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, tiwai@suse.com,
 piotr.wojtaszczyk@timesys.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--R02+LBkw4li2rDmN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 14, 2022 at 04:40:58AM +0000, David Rau wrote:
> This adds the DAI mono mode support and set the frame width to 32
>=20
> Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
> Tested-by: David Rau <David.Rau.opensource@dm.renesas.com>
> Signed-off-by: David Rau <David.Rau.opensource@dm.renesas.com>

I only have patch 2 here, what's the story with dependencies?

--R02+LBkw4li2rDmN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOZ2+4ACgkQJNaLcl1U
h9DTIAf+JurQw0206DrQWVPvayaIM+o/SG7RV9QRNaXEk70ookZk6hcl3EJz/1oj
oyiWMH3szulLe58B+5XRy/xJ89PErBUVvoixM2m2aS8oRImDNeQvkeUx7SyyiBge
uhYRzstdO1gVBMYNDBnAGNykMqR7qHOEVcYFkfpthiCa53lu5Ut0bxtkJO2gGWFG
Y024TimprsyIXepsSlkhi3Rd7BygilSFki0LxBAJbSuC5GidC0gB/crto0y2buGD
V/KRUmO/b7pWTW/Hysx3X48ntD5f3VHu4t/wXjM4ayg9wZDwLQnXmyZpy0fLEdyc
rcSzeIiiB7ARoeZ4N/j1QBycB8UWQg==
=Ts+T
-----END PGP SIGNATURE-----

--R02+LBkw4li2rDmN--
