Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A6F6D5F63
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 13:44:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 175001E7;
	Tue,  4 Apr 2023 13:43:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 175001E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680608689;
	bh=fmitKTP2A3EWk9XNz45pHfPah45MND6OQgw32mAKPK0=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mOMQF7ILZudfxcck0qEbPbp6yU4Sp70GXarGUNPiWTN6uLdBr7t1PYWmHwidhTwAx
	 aLGRF9haKso5509xy9hDg0YxHOm8inV7NG7x0+k92GHJnDZqZhSfPLBU7Wu6sbeTBB
	 f7QXdXOlwbaQddp8XsmlHAexFakmQgSUmYStiezA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7ACA9F80171;
	Tue,  4 Apr 2023 13:43:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CD17F8026D; Tue,  4 Apr 2023 13:43:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4BFA6F80171
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 13:43:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BFA6F80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EmWSH+xk
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3618E63289;
	Tue,  4 Apr 2023 11:43:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4705C433EF;
	Tue,  4 Apr 2023 11:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680608626;
	bh=fmitKTP2A3EWk9XNz45pHfPah45MND6OQgw32mAKPK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EmWSH+xkn42whE3uwo+NxSvbjzShE03vIDpxCtTA78dr+/n0W95kp8iWCkrlyNOb7
	 B1yxRmg9NkVVHR8vsJBijC2mPdp+ecp3IJ0zNhcnchr+ljfKLB84irzKnbKWc49qtP
	 m7Q/lVa31qkZ0VyNyJNf0ItXWr3mbdztwQSBk9+MDmp4SVQBEifvwWOQ1E6MNgWYt7
	 J9Qu2egqXSy8rf+i1kzLDDC+/bj1cb9Axb1macmxXjfB0JOlGhYCNilbxIh60CuNny
	 B0xaEXILNn7P1CX8/LkKCLLVZG3vpdAV5Drn+bGQ+PYZ0byKH4a+63d3DwHl1mYbSF
	 KXZ5gyFefXovQ==
Date: Tue, 4 Apr 2023 12:43:41 +0100
From: Mark Brown <broonie@kernel.org>
To: ye.xingchen@zte.com.cn
Subject: Re: [PATCH] ASoC: ti: =?iso-8859-1?Q?omap-?=
 =?iso-8859-1?Q?mcpdm=3A_use=A0devm=5Fplatform=5Fioremap=5Fresource=5Fbyna?=
 =?iso-8859-1?Q?me=28=29?=
Message-ID: <328d0920-7dd2-4ee5-9b22-3f86dd31ed4d@sirena.org.uk>
References: <202303221411117451283@zte.com.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zd9rlODtJ73APuoC"
Content-Disposition: inline
In-Reply-To: <202303221411117451283@zte.com.cn>
X-Cookie: Keep your laws off my body!
Message-ID-Hash: 5ANZBI7SHYQ4GHKDOBPPBRZDAMB7TPMZ
X-Message-ID-Hash: 5ANZBI7SHYQ4GHKDOBPPBRZDAMB7TPMZ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: peter.ujfalusi@gmail.com, jarkko.nikula@bitmer.com, lgirdwood@gmail.com,
 tiwai@suse.com, alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5ANZBI7SHYQ4GHKDOBPPBRZDAMB7TPMZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--zd9rlODtJ73APuoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 02:11:11PM +0800, ye.xingchen@zte.com.cn wrote:
> From: Ye Xingchen <ye.xingchen@zte.com.cn>
>=20
> Convert platform_get_resource_byname(),devm_ioremap_resource() to a single
> call to devm_platform_ioremap_resource_byname(), as this is exactly what
> this function does.

This doesn't apply against current code, please check and resend.

--zd9rlODtJ73APuoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQsDWwACgkQJNaLcl1U
h9Crrgf/RStkN13yC5YhXkKomKmWTO6FB9f7QLIZLemvCbBNJhwL8aDs9Fp78bXe
j6LJxCBEeMZRJqn8EaS9pMWj7QTR1lKjN9rkJXl4rx7uJ3TzL6O32jbkypQPNhKr
GyeeogaxaFFfTzkMVkbImL4xacllrVowZES2oEopEXI1KrNvHp2fQKv4gLjo2sw0
z/BCsrqyVL1POM675Nrsi4f/E6WBFi0gmkQw1gKYiRC6oK8X0G5po0z/lsZgRb3o
cnrub1qB9+uyWdUCgcwEC8MbEOI+8F3xJAErppy2tGpYnXOv60cPyLVQj8hqvVBB
aPkuqztkLLb2ET1mwdD3M4YzaS8XAA==
=Iyzs
-----END PGP SIGNATURE-----

--zd9rlODtJ73APuoC--
