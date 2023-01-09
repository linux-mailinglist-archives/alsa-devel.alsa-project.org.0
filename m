Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEF2662630
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 13:57:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CC1587D7;
	Mon,  9 Jan 2023 13:56:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CC1587D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673269041;
	bh=LR9BuGWChT03M61XikBm8S6FvKArWqu7e6r0lnM1Des=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Ule/ybA03n6lEf9qC0xYu3ZEvlfQrq2KNAT7T2+2/g5aH1Uhr5LpXfIv3lH3UTxlY
	 3DDq38KIYG1rnr1bgpF8Z8WH994EH+Hl24jL+Oq74698Ib+pcN4vsFgP1Nh0dB6t/p
	 QIuJkdPNe0qmrU6+AqXTRDS/aIW3fAWQ2Q6SzecQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12C83F800C7;
	Mon,  9 Jan 2023 13:56:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1097F803DC; Mon,  9 Jan 2023 13:56:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E77CDF800C7
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 13:56:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E77CDF800C7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=f8YZbq1w
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 91FFBB80973;
 Mon,  9 Jan 2023 12:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26E48C433F1;
 Mon,  9 Jan 2023 12:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673268977;
 bh=LR9BuGWChT03M61XikBm8S6FvKArWqu7e6r0lnM1Des=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f8YZbq1wXlkRtGJCtd2CEMKqep79EsUjzCV+dKVr5bWdhFfSxJpUeDcAW9aZsmBc/
 VUXs1If7eJqiFSGXs/mwLeu0+VHL3vzQImE6Al1/ZlGIrwqvjpwF8fTvcdaCxDoMvr
 P8RhG1xzNQILim9e+lmWZvcD8LRY2AL8dBuTgHDeKU2Rh41KVoKSCeP8Md3MOHjPn4
 kB5ZLokjDxxXJnENiMoySOe+qMCmypgF2MyK8EY4+zbFXzmmh3NgWqwsSW/J1gi6+t
 uEuFInJO+OD0eQ4XdF4RfrQzNgnXPG0cIfw4OoYuNjHDAgH+74a8QcrShxqkFRtLD4
 5ntE1OQKjPEZA==
Date: Mon, 9 Jan 2023 12:56:11 +0000
From: Mark Brown <broonie@kernel.org>
To: syed saba kareem <ssabakar@amd.com>
Subject: Re: [PATCH v2] ASoC: amd: ps: Fix uninitialized ret in
 create_acp64_platform_devs()
Message-ID: <Y7wO64ZkCeUPWVB6@sirena.org.uk>
References: <20230105-wsometimes-uninitialized-pci-ps-c-v2-1-c50321676325@kernel.org>
 <6ebdd688-a1e5-f687-2842-b5005fdd89db@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="d7IcEJuYnckhwJud"
Content-Disposition: inline
In-Reply-To: <6ebdd688-a1e5-f687-2842-b5005fdd89db@amd.com>
X-Cookie: Editing is a rewording activity.
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
Cc: alsa-devel@alsa-project.org, trix@redhat.com, llvm@lists.linux.dev,
 ndesaulniers@google.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, Syed.SabaKareem@amd.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--d7IcEJuYnckhwJud
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 09, 2023 at 05:00:11PM +0530, syed saba kareem wrote:

> > Suggested-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>=20
> Reviewed-by : Syed Saba Kareem<syed.sabakareem@amd.com>

Note that if you use a different name (here you've got capital letters
on the words in your name) or misformat the line (you've got an extra
space before the colon and are missing one before the email address)
then the tooling won't pick up your tags.

--d7IcEJuYnckhwJud
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmO8DusACgkQJNaLcl1U
h9BlZQf+KmHcOAEx+KzXe6nxDhZ64/CKq9lEbYNhdPrklgJcid8BwlvHD0Y4z8+x
eeXadCbsaDoAwplTFYWbFXIcFlDGOBMU0Dp0ogI3rlrNFijEo8ztgYnD5OWXAlqC
sQL+S5fShD0Ocnzc7fHIsFvtCTBVd2iepbCYHX+tCxCEWS4dV4F2Lk5K4YEVtHfe
bcNVe7lRocKUH4efMZnw+6GH2lED56cArgOMRMyv3SNIn5bxBlZojBpBnFcLsgYh
PCHyQyz5IlypaKdC1ifMbPg+zCwcHHxwkWDQvV7O5TzhKwt94UpBNPPnh25aVh7W
1lshclPhXWdYQ0PgLoD+W2Seqkn9cQ==
=raZ8
-----END PGP SIGNATURE-----

--d7IcEJuYnckhwJud--
