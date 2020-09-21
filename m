Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC63E2731FB
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 20:32:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2010316C8;
	Mon, 21 Sep 2020 20:31:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2010316C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600713137;
	bh=RIG1o2W+S0fOozltrMezM0wKniQZjIj8tj49IFeycQc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qZfUlHs1j/ICjVrEljMPrWnqq6JocQie2VakPkscp0+xhklSWllzhMVBmglV7LjdB
	 q8pD+98y4/oLMkQO7Fa3erY6vVvtEKc+RdG2J3SZ/BnzlosK9u4SwYRzy9Yc69EG0m
	 8GzfI0WNsWwrMKkdBnkXD6Nl/lmrlQr4cCbJVGZA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B670F8010A;
	Mon, 21 Sep 2020 20:30:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8236F80171; Mon, 21 Sep 2020 20:30:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DAF9F8010A
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 20:30:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DAF9F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZjWSgetk"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6067C20758;
 Mon, 21 Sep 2020 18:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600713017;
 bh=RIG1o2W+S0fOozltrMezM0wKniQZjIj8tj49IFeycQc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZjWSgetkuu30PE+jVlTKOITp/D4bMu9VafoSjGjApUWBn2ecvVK2LCbjtTrwBSs9i
 N96XP+fPh1z0gqX4hot0BvUoGmaGl3l3OzQgclsVmYQAZfSNupk6M4v2WNba8tuvm4
 oTSGr3na8bgWrU7OVNMSdljPAw5bjrnzr21MhPDI=
Date: Mon, 21 Sep 2020 19:29:24 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Subject: Re: [PATCH v4 09/22] arm64: dts: allwinner: h6: Add HDMI audio node
Message-ID: <20200921182924.GG4792@sirena.org.uk>
References: <20200921102731.747736-1-peron.clem@gmail.com>
 <20200921102731.747736-10-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pE2VAHO2njSJCslu"
Content-Disposition: inline
In-Reply-To: <20200921102731.747736-10-peron.clem@gmail.com>
X-Cookie: Love thy neighbor, tune thy piano.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-sunxi@googlegroups.com, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
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


--pE2VAHO2njSJCslu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 12:27:18PM +0200, Cl=E9ment P=E9ron wrote:
> From: Jernej Skrabec <jernej.skrabec@siol.net>
>=20
> Add a simple-soundcard to link audio between HDMI and I2S.

It makes life a lot easier if you batch all the DTS changes together
rather than randomly mixing them in with code changes, it both makes
it clearer what's going on and makes things easier to handle.

--pE2VAHO2njSJCslu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9o8QQACgkQJNaLcl1U
h9B3ogf9EEYaugeaZHYesvCMIRKvpSknwNalCvYT60A0SQGx2KNLn7X2PGd95CPY
KC6cgEQ89lTdbrGiAkaE9SXZp1kM6lhQs5Lg/3F/zvf8m9zMtOBTfumTFwN6v050
S8+sufsVctKcu4ztR0tLDIss5iVlklDm5EwmAHxfzk6tb3K8oZBhV0SsZldoDmFU
T1zMh8OeJshpm34jx1kat93A0xKmXJdtc2ER6wvn/dSftwd0+34YBACD2G0iC4jx
ttK0Q4Iq2mois+J7HrJWpEm7jo/dmKxuXvpKGlhr7YDS8LTK4teq3Re/tWJ/6i8H
E2/MBNAuorphpOUuKd1kYaHbsa7z0g==
=iKNi
-----END PGP SIGNATURE-----

--pE2VAHO2njSJCslu--
