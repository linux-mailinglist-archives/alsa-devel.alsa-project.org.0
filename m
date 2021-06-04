Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C72DD39BAE3
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Jun 2021 16:27:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 460FE1732;
	Fri,  4 Jun 2021 16:26:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 460FE1732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622816863;
	bh=6qcDrWQa4+6z+ZkRiDCUGgmZILuI30SH1Dvb5rIUE4I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=df5+mjmhgpQkFlB275wIAByptbe6n85w/mCxHlzoQDKAH0JRAQa289cXZqGIikLY6
	 Cjxv6Va4F62aayTmOo8T6uVGPsUWS6ymLeacjTuNowC9RiZOkQbvOtcArzEBYRLwxn
	 O31QQvgcSicI14MUFz5JBchywmNJpZF5MbRXNGe4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B05CDF80424;
	Fri,  4 Jun 2021 16:26:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 587DDF802C4; Fri,  4 Jun 2021 16:26:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0733EF8016D
 for <alsa-devel@alsa-project.org>; Fri,  4 Jun 2021 16:26:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0733EF8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="K41Bhwd0"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 111E6613FF;
 Fri,  4 Jun 2021 14:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622816766;
 bh=6qcDrWQa4+6z+ZkRiDCUGgmZILuI30SH1Dvb5rIUE4I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K41Bhwd0MOusWyBzUd4UFF+NmX33eK33EeXt4X5BT4/V60KJ4oGtNjF/k0FXmXwmN
 zV2O40ms+G8QPax7JsusAeriGbq+ltfYVMbo4TVsWx8HvlMB9LiSTiBoDSfUFyR65v
 8O7z1jatuH37f5DFL4OE+gs4C3369x+rFtXkQz3tiz2srNQ3P9USfQb57V/SxiKUGY
 tgCOmv7zcPr4pFmOmc7Nu6Osoi1ql1aXpgeYOGedX+Y6+drTwo/HN4s4kBpKfU4tg2
 DnNZxQVodxCEq+94EVn2qysKSgs/bHsg9yDZPYcOqipto+95GnjLbAXIO4rU6foeLT
 8wwya6uRfNBzA==
Date: Fri, 4 Jun 2021 15:25:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] ASoC: rk817: Remove unneeded semicolon
Message-ID: <20210604142554.GA582@sirena.org.uk>
References: <1622802209-45031-1-git-send-email-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline
In-Reply-To: <1622802209-45031-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Cookie: Truth is free, but information costs.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org
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


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 04, 2021 at 06:23:29PM +0800, Jiapeng Chong wrote:
> Fix the following coccicheck warnings:
>=20
> ./sound/soc/codecs/rk817_codec.c:49:2-3: Unneeded semicolon.

This doesn't apply against current code, please check and resend.

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmC6N/IACgkQJNaLcl1U
h9Aw2Af/ZhDgCHIjE+l4J8Du0e1i6r7rFyERFiVVkaAsCDw21i/pdRYBS1c00kgn
DPRCorTuIUidRsYWnC6VkB6yLFC0O0kZrSuKro+jGMXeCR5OBDn8gzOyPdgmaxGa
YZ2ILiWlcWZR0cSIsFwVJ2UZcrDN7lIffjyV7o8JCoq3LKF/JHC9oYvDzqmZzWUX
bj3KxrwErBys9al5zzALFtfUNCat2bjsCxB111qTg6fiFZq4k1Crzeb56GhCnQRn
IQ+8yXOsmx9vp238kLIoB4n6ZneK7AY16AxlpcKFgbf0WzlzOOIiO1gdLVgHyr5m
4jkQfukW/B56BN0OoGWcPPvkumrKiA==
=gP8F
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
