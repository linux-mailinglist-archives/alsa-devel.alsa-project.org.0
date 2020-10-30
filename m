Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A63B2A0EE6
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 20:53:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F37061660;
	Fri, 30 Oct 2020 20:52:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F37061660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604087600;
	bh=9ZRCCkWjnZUueRC68oDdNBqS1TZdbPgE5YZdnDRB3/I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cDfm3NqGGBSCtNuCeogKFU56PYJ2jQu9umSUTp3rhQ1VJMFGhfVFB+0JCmKjanhNs
	 1K8iN9XTcXX+pfgfRs3Lo6gxCtJKJyo31qfnGRbVrvHyh5PeGScZ+jn2MQKVq5qAo1
	 QQ8VBpD+iFUpYitTWQJPpJYSAOcWAw5eYc94Xn2w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 342EFF800C0;
	Fri, 30 Oct 2020 20:51:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CAFB3F80212; Fri, 30 Oct 2020 20:51:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03D21F80107
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 20:51:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03D21F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oTHOmNUY"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E07C220729;
 Fri, 30 Oct 2020 19:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604087494;
 bh=9ZRCCkWjnZUueRC68oDdNBqS1TZdbPgE5YZdnDRB3/I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oTHOmNUYOEfKVnR1QCvHebYO0x6lLtMcGFbixpY00xTMVVFOPc1vAwJDHa6tZ11RA
 bUb93qwcWheji5sX/+n/pBmwmijYJsVttdKxHVEaXsB9j3aD0njQdRUrx3oZytSock
 rhikceoV39pm7hIacRRfTyi/g/4tZ0SpgTxah6qc=
Date: Fri, 30 Oct 2020 19:51:27 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Subject: Re: [PATCH v10 14/15] dt-bindings: sound: sun4i-i2s: Document H3
 with missing RX channel possibility
Message-ID: <20201030195127.GM4405@sirena.org.uk>
References: <20201030144648.397824-1-peron.clem@gmail.com>
 <20201030144648.397824-15-peron.clem@gmail.com>
 <20201030181935.GJ4405@sirena.org.uk>
 <CAJiuCccAjEHX4BmL9A81EwM_xnHTPVyHu3BOPGKKUQ=1HNaZGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="QqzFzR/RUlLahzby"
Content-Disposition: inline
In-Reply-To: <CAJiuCccAjEHX4BmL9A81EwM_xnHTPVyHu3BOPGKKUQ=1HNaZGw@mail.gmail.com>
X-Cookie: Blow it out your ear.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Rob Herring <robh@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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


--QqzFzR/RUlLahzby
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2020 at 08:05:31PM +0100, Cl=E9ment P=E9ron wrote:

> But basically for the next dt-bindings change you will prefer somethings =
like:
> "ASoC: dt-bindings: sun4i-i2s: Document H3 with missing RX channel possib=
ility"

Yes.

--QqzFzR/RUlLahzby
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+cbr4ACgkQJNaLcl1U
h9AqCQf9E93+zMG/HSEdhPKPqXgjzUt1swTeI7YiMio/V6bPjwLCeRSCS0UAwmQc
JEAcRVumyz7G4UhJFyHpbqdVhoXWJXKScO9yw7YfddlWjFfPUd4L3yQWsM1tIwyh
mHqxntSNQFqxetoi1joWEfT0y4n7t5zU/CZw747lwj8yJiv/L37FD4Y4KTXVSh9D
c7nElGLJdxSw4oSztS2sdbZp9QoZQRmIrcIjq4HCYhpRh2vvKm6WhBR0cSIE6sle
mEwrO2rH6Wu8Wb1H77WBB7apG2VAzp0nczFXEj14Zr+OyQcnHwHHMqkBk06l+XbH
iO7qVPiQIlNQKYGvC0ToiHDGrFcZYQ==
=BIOs
-----END PGP SIGNATURE-----

--QqzFzR/RUlLahzby--
