Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F575B7615
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 18:05:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E331D1798;
	Tue, 13 Sep 2022 18:04:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E331D1798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663085137;
	bh=6Tb1sUxJd8dJSLR0kzh76bNzgOnCELvZEdTlXBGdo74=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gSNc9XANCh1avDW2BcwjAeoxp9zmahOtQvqzliHVeCVfEXHTOfbyRr41bnB4txfgI
	 1z8R4D+PcEbBrIXlYuuYrH7lzZmweXzBDRqO4NR+r1Bq/gU5V8NhkI5o52xyWjb2Js
	 cKn6uBxH8WUJYf546nNSXAxt/0akly2ml2//vp/s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EE53F8008E;
	Tue, 13 Sep 2022 18:04:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C6B8F80224; Tue, 13 Sep 2022 18:04:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C2ECF8008E
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 18:04:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C2ECF8008E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PheyAgfT"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 875AAB80F6F;
 Tue, 13 Sep 2022 16:04:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7D1DC433C1;
 Tue, 13 Sep 2022 16:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663085071;
 bh=6Tb1sUxJd8dJSLR0kzh76bNzgOnCELvZEdTlXBGdo74=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PheyAgfTkCSP3WusJLXvYkxhsvdu5x7NwAb77YJp6uTLsFzMXhfPj5sL/UkcNBYlJ
 igl+prwhPZ8shp+dhWpY5Unxz2BzCpBSiZsxZQSe6dwXpPGFxf6PKcR5pl9jIhZbDY
 Kw1LFol0B4iu2dKWbOCou+G7BrbXvAUKD3Y6w8WCN+LuN2L3gxutkJDjpR2FNoLAYR
 KIwb7oDhgeHYnXcjcvnUSlh9Vm7lc5jfmcLJgx5yYMrzmp0YH6Qb3VbP0OzI1fR2VD
 WGhQa57ASkwWj8RlzeKHeRHiRazD2+A087uFkiGjqqiKAhhP7ILqfHXpWSuWdpnC9S
 gfilQsh4igr4g==
Date: Tue, 13 Sep 2022 17:04:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Mikhail Rudenko <mike.rudenko@gmail.com>
Subject: Re: [PATCH 2/2] ASoC: sunxi: sun4i-codec: set debugfs_prefix for CPU
 DAI component
Message-ID: <YyCqC2EypxnoJFk7@sirena.org.uk>
References: <20220911145713.55199-1-mike.rudenko@gmail.com>
 <20220911145713.55199-2-mike.rudenko@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tnCcChlqU0Imzw0K"
Content-Disposition: inline
In-Reply-To: <20220911145713.55199-2-mike.rudenko@gmail.com>
X-Cookie: ... I have read the INSTRUCTIONS ...
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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


--tnCcChlqU0Imzw0K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 11, 2022 at 05:57:12PM +0300, Mikhail Rudenko wrote:
> At present, succesfull probing of H3 Codec results in an error
>=20
>     debugfs: Directory '1c22c00.codec' with parent 'H3 Audio Codec' alrea=
dy present!
>=20
> This is caused by a directory name conflict between codec
> components. Fix it by setting debugfs_prefix for the CPU DAI
> component.

This doesn't apply against current code, please check and resend.

--tnCcChlqU0Imzw0K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMgqgoACgkQJNaLcl1U
h9BpWAf+JC1VIGpEuZdvAM6o78KE4CJpeeq0Ui9NrveL6c7kukJdKu+CocTWndfh
i3O+dtlkWNqZgOk7sOs4LRx651un/NqsygQkWr25B4CjGXoxJCf6YpaMXE7TGVuf
gJ6HYi2zSWoK7Yni6uScEU7D2HtnCQnwfI33jWM2GK6pwGZOTby86HtC/p1wnT+q
QFUTx54l0bYUkVfq+FLuPyQRmbMGQ4A8XFsQ9TQOlXC69sWna9yc5APBNXOcPR/6
lEUm8A0MZJJ8jZbUqOaG/PBZitXZ0r3vVNnLauiJaIOBHjwj6BW2Ut8oRZMoRDvG
x+5GTQ058lJw4SZvzZl5908v44s69A==
=2cfA
-----END PGP SIGNATURE-----

--tnCcChlqU0Imzw0K--
