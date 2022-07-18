Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DADCC578067
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jul 2022 13:05:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20ABE1785;
	Mon, 18 Jul 2022 13:04:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20ABE1785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658142316;
	bh=Eww+XW76vpqEZHfn4M8h5LGlBIt88VJrdBd6Rqndts0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u8xdLl2XMx6c57kj9wMbuNh56X6I2DUw4x+orFzkgJ9lLs4OScNGfA90X/rFBB1ta
	 ZEkl2zuGeyH9vTVedqiWxko6e6UVjuPwww5HttGx3grWEu3IAv+dXAF/afxTg5DL8G
	 Xm1kDljvrNZfggEaKYHxfyJN0Q11+wYmZKxLIssA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BE69F800F5;
	Mon, 18 Jul 2022 13:04:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1C8AF80508; Mon, 18 Jul 2022 13:04:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6CF4F800F5
 for <alsa-devel@alsa-project.org>; Mon, 18 Jul 2022 13:04:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6CF4F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZqHzK21j"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 493A4B81164;
 Mon, 18 Jul 2022 11:04:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19C8FC341C0;
 Mon, 18 Jul 2022 11:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658142247;
 bh=Eww+XW76vpqEZHfn4M8h5LGlBIt88VJrdBd6Rqndts0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZqHzK21jKCW75csX0xmfqwvJx0ImipjYIp2km1QQOO38gdTLA4CFoO9iJg74haE2i
 2bql/sQgs18qSfO61I2dNTd8IvnxHpx38S3PMq4lw5v1ktvVTcRSl43dLSGrD/ZXG6
 ROmEb729vA8IOtW/G62McbFOQ2qcCRyofYrOhHMm/SFUbkiV4oj5hH+KnYZX+dfTNv
 UsgapEPSz4vI7mLiXM2OZntFgAYzm/DTnuVHEFWnUs4mls/0rd8J8iMDhoJsF5aWHT
 W64GFYoyH3sIc/teS1R/DxpYozDptv6EElfYWuAdn8Z/VsamKED/0FQLHocEfzTi6E
 LWXdsxeL/+OmA==
Date: Mon, 18 Jul 2022 12:04:02 +0100
From: Mark Brown <broonie@kernel.org>
To: "li_jessen2016@gmail.com li" <lijessen2016@gmail.com>
Subject: Re: FAIL: alsa/Makefile dependency check
Message-ID: <YtU+Iknsx1OL3jq2@sirena.org.uk>
References: <CAK0WjkiJb9_mTmTMWUb2dX-B6_52Fr4stxXrgaW=07RjfMzvZw@mail.gmail.com>
 <YtGIrl/RIuI2TBps@sirena.org.uk>
 <CAK0WjkjCbCvOJ66bX5t_LansAAd0foT1gYS1Gkz5QWcAYPQ6bQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="a7peLFy8jDXtySeP"
Content-Disposition: inline
In-Reply-To: <CAK0WjkjCbCvOJ66bX5t_LansAAd0foT1gYS1Gkz5QWcAYPQ6bQ@mail.gmail.com>
X-Cookie: The greatest remedy for anger is delay.
Cc: alsa-devel@alsa-project.org, linux-kselftest@vger.kernel.org
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


--a7peLFy8jDXtySeP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 16, 2022 at 09:14:08AM +0800, li_jessen2016@gmail.com li wrote:

> Thanks for your kind reply. Then what should I do? To officially raise a
> bug to all the relevant persons in the kernel community?

Yeah, I'd figure out who works on the script and mail them about it (or
develop a patch if you feel up to it!).

--a7peLFy8jDXtySeP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLVPiEACgkQJNaLcl1U
h9BTvAf/eAx2Qxzc8UHqJneDZOboXnKcz4paW2e90eHGFLpoCjdZsinUoKEei/3Q
iPko+HDdL+H3Z30Prk3gohHjL54P7F0ChSH1fMMESFbEtHKCUV8+DDFcYGNbMOWI
4JwNryA9kbUwVxCblgI4xDe185sQJTCuEyWEkYvf2CmyH+zBmLCzAvF2NqnK6VIf
WV4F2IcsGBTVXgruS4J2qUlpBoKVjEamWpDNsCNFYSTX035wsUWZp+rdr4N1lMFS
r8UGdZqwXFVMJwB3eJ1kZbEYS8q5hwZ0hnCHuMkH0bKH0A4G5ECaNfzJF9GELIya
4qqWgF9GKpvyWH32Stj1xSxPukBBwA==
=lqvJ
-----END PGP SIGNATURE-----

--a7peLFy8jDXtySeP--
