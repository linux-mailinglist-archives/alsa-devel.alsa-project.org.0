Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6589364B4C3
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Dec 2022 13:05:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72FE718B8;
	Tue, 13 Dec 2022 13:04:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72FE718B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670933141;
	bh=PPHuWE4XkstXrom2xaRiEphZZiBoxWs7d6Ao/vsKC+s=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=at6MB9n5eeqiQYG9U0737k2+46j+TTaecVpN4Auk9P9+Lp/4eG9AJ8LwjcFRjsqtq
	 85NW5/XCHgHETiQ96SHkPe7+nmzBHRZjoHAr6f4tqxcFkhfhz2qTUyJUA2gbrlntYj
	 jF8x+R81pWygYrG2bOUzRa2PxdVNZDzwfnJg3NLc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BE50F8047D;
	Tue, 13 Dec 2022 13:04:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8052FF80431; Tue, 13 Dec 2022 13:04:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38F36F8007C
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 13:04:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38F36F8007C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uwTIiPuU
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 786E7B8118A;
 Tue, 13 Dec 2022 12:04:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9346C433D2;
 Tue, 13 Dec 2022 12:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670933076;
 bh=PPHuWE4XkstXrom2xaRiEphZZiBoxWs7d6Ao/vsKC+s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uwTIiPuU7JeBUvPvgQBH94owxmCf6mPQZD5/lNCQfrdyMM3pHq6GeBC5YCi2tWQrt
 Vr6YgRAAWYCakDYorT4zNNDLfOvlOyCNvB7YyznYwu0zLCECTHB/X8Ldl4xEf8uuWa
 cTced4Vwr/AFNwwIPGmrA1hryVgJiwtf/nhGBjEVph1fabgoFPPwOM4jxjHasQ/znN
 wVJGI7ynbaRR9TWAqQzZavHlk40PYWMfuHLkDu9G0ocBmAeNL4FhAmjNGReBYZmZcS
 b8LFTr5dXCBJRsb8moLMUqiEpJXo+QmpvpUpDK97NzkVipZJ8rSc3e/AzJaj2536IV
 C3RPAvCLxx9Yw==
Date: Tue, 13 Dec 2022 12:04:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Rouven Czerwinski <r.czerwinski@pengutronix.de>
Subject: Re: [PATCH 1/2] ASoC: max98088: fix dai1/2_hw_params access
Message-ID: <Y5hqT3KL0+XENJcj@sirena.org.uk>
References: <20221213095328.122309-1-r.czerwinski@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="HgDPkyQ14qG89rof"
Content-Disposition: inline
In-Reply-To: <20221213095328.122309-1-r.czerwinski@pengutronix.de>
X-Cookie: Edwin Meese made me wear CORDOVANS!!
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
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Marco Felsch <m.felsch@pengutronix.de>,
 Takashi Iwai <tiwai@suse.com>, kernel@pengutronix.de
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--HgDPkyQ14qG89rof
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 13, 2022 at 10:53:27AM +0100, Rouven Czerwinski wrote:
> From: Marco Felsch <m.felsch@pengutronix.de>
>=20
> According the reference manuals [1], [2] updating register 0x14/1c
> should only be done after #shdn bit is set to 0.
>=20
> [1] https://datasheets.maximintegrated.com/en/ds/MAX98089.pdf
> [2] https://datasheets.maximintegrated.com/en/ds/MAX98088.pdf
>=20
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  sound/soc/codecs/max98088.c | 8 ++++----

You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

--HgDPkyQ14qG89rof
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOYak4ACgkQJNaLcl1U
h9Ad4gf9GB01gs7BPIzFvCH25I5aQlpvYWfjZX6pVoRy6gCVh+0zqbmH3XoyBHim
ieacSU9N2nGG48HkUKlQXsOb5/QXde45Gh8T9s4xwV5YdvM0TF1o9+jNE2uGEOgC
CnMcUt4AZl73ihJi8NqiqHYa7Rg5p3rFDgoe4mmCn9M4br5Rd8fKyCgeQnzqSGa7
xzkvruCaOWI0sJ6OCfFbIkKq2G2yO+3Z5uSMBR41+eiFyDBHfy2bGLckJ9GLeEDm
sg7O3NeMki2GEbctfGemG2Oa1JHVB0Qq+1AoHu6Jp0xzfsUDZjwRtxU/b+I2J2c1
a3ooBqIuJ9tmSI4cw6vnWYuTpOkhrw==
=hmG0
-----END PGP SIGNATURE-----

--HgDPkyQ14qG89rof--
