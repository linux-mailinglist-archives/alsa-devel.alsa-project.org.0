Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEE31B952
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2019 16:58:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0E5716FE;
	Mon, 13 May 2019 16:57:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0E5716FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557759493;
	bh=ZkZCERkk0hOwTYiMf2hG+8Wnvj6t0tFFWstmRh5rV9o=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZubduHZgxJrOdEBQhDY6cgOlP/EK6LmbeoinWRH5PdgBLebSx2oovgj0D+r+h7tai
	 9erNn19pgNLDx3UUt//aDWnDg0k6EvLwwL+ZReHBec8lAXKZwMrY+8dKHPw7nmtD1S
	 ukF4M8VatIb4ppWoJZ+b7e/vVpHQNw/WUS6fDAj4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28006F896B8;
	Mon, 13 May 2019 16:56:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AA86F89684; Mon, 13 May 2019 16:56:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA2BDF8961A
 for <alsa-devel@alsa-project.org>; Mon, 13 May 2019 16:56:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA2BDF8961A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="N86ev+50"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aZDyWqRDsxnyqSB3X4Gs8NZcDVQ5x3PYO9kqbW1GP0A=; b=N86ev+50Pn8fIHBSXh6Evg8Cg
 38VBlQPBclZ/2/i4CpJj6tqg80QAmBSoP02aT5FGuWmMG6h4GKDUh+glLCyCBrjDmnY2/dmn5Lm2P
 bKtMD180nXc6fPp790oMyGABZTnjL0DzFIKdAk+nOQMRXe44994y2UbLMzaZVvikog6c4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hQCN8-0006q5-CL; Mon, 13 May 2019 14:56:10 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 45CB61129232; Mon, 13 May 2019 15:56:08 +0100 (BST)
Date: Mon, 13 May 2019 15:56:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
Message-ID: <20190513145608.GA5168@sirena.org.uk>
References: <20190416022246.10121-1-derek.fang@realtek.com>
 <20190416153510.GE4834@sirena.org.uk>
 <BC6F7617C38F3E4E8CA887E07B35B8280116192E@RTITMBSVM07.realtek.com.tw>
 <20190417150518.GB5703@sirena.org.uk>
 <BC6F7617C38F3E4E8CA887E07B35B828011660AC@RTITEXDAG02.realtek.com.tw>
 <20190508064537.GN14916@sirena.org.uk>
 <BC6F7617C38F3E4E8CA887E07B35B82805B1144E@RTITMBSVM07.realtek.com.tw>
 <20190512080621.GH21483@sirena.org.uk>
 <BC6F7617C38F3E4E8CA887E07B35B82805B13EE2@RTITMBSVM07.realtek.com.tw>
MIME-Version: 1.0
In-Reply-To: <BC6F7617C38F3E4E8CA887E07B35B82805B13EE2@RTITMBSVM07.realtek.com.tw>
X-Cookie: Must be over 18.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Albert Chen <albertchen@realtek.com>,
 "bard.liao@intel.com" <bard.liao@intel.com>,
 Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: rt1308: Add RT1308 amplifier driver
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
Content-Type: multipart/mixed; boundary="===============1556604960536457668=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1556604960536457668==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Content-Disposition: inline


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2019 at 01:54:08PM +0000, Derek [=E6=96=B9=E5=BE=B7=E7=BE=
=A9] wrote:

> > I'm confused about what this limit is - is it just some arbatrary limit
> > imposed in case some board has problems or is it an actual limit that
> > comes from the chip?  If it's a "just in case" limit then the board
> > should be the one doing the limiting, yes people can break things but
> > it's difficult to get decision like that done sensibly in the CODEC
> > driver in a way that works for everything and the general expectation is
> > that this is all for use by system integrators rather than end users.

> It is an actual limit that comes from the chip.

If there is an actual limit in the chip the driver just shouldn't expose
anything beyond what that limit is - the original thing I was calling
out was that you're just hard coding a value for this setting into the
driver, that just means that the expectation is that the values should
be user settable within whatever the chip can support.  If there's
settings that can't be supported at all the driver doesn't need to
pretend to offer them.

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzZhYcACgkQJNaLcl1U
h9DC9wf4lBweOx0EW6GQZHiGYKNx79ISwdSyjLdm6oZHze5tzPid71jqutTu8oF6
Ok6eXx0Vx31lxHnrJ/6Zsoh74XP0w8Zw56qzBSBknCzTcK4mTng2y/K4JAOEW6Zd
0EVX/99GZB4RHOJghi+QgzBEQzVwu/Ab3c9exj+zG96G3E6ETtjiqCG/tteHi241
2UWOE2VIHsVbI3zxO/A8yTg7Ot4/qrhoGP6CuktQwyxtLfFfHywe8lzxHKIiGYuw
EWpOmHyVN2J97jA54c1kt4jXcKmPA6LqXpYEPUIkHgFwxc5qpQxCg0rM0XnQmYuf
UN2vjCb44JgprxdMuAokjQUVwTLz
=ZITg
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--

--===============1556604960536457668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1556604960536457668==--
