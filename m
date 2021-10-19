Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F25CD433546
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 14:01:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 539AB16AC;
	Tue, 19 Oct 2021 14:00:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 539AB16AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634644870;
	bh=ySRYvdK7NTrM3AmKXqKhUuV0WZHW9zMiPWB/cj1v/W4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lAuqZMW5vRJcr71v91PpmZjyO9ndyNRs/Px8BsIVkRWlYgh6Z/ktXcaiF025mOZuu
	 XUh6mKaUB7JNisLyO8msF1QNRs9bs9hO61e5DTVH3hdork3MmfJejSyrKiOsmohZJ+
	 kZqHb1QZ8ZkJSJbf68YocluOtCedZfJ2tuDL0JMg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B34F4F80246;
	Tue, 19 Oct 2021 13:59:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 261E0F80240; Tue, 19 Oct 2021 13:59:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1AAFF80155
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 13:59:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1AAFF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="A8oNo2yS"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BCFC4610E7;
 Tue, 19 Oct 2021 11:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634644784;
 bh=ySRYvdK7NTrM3AmKXqKhUuV0WZHW9zMiPWB/cj1v/W4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A8oNo2ySNIrGLpLu+RI0T0jN9YSNIjyAYk86yxHa9JLnINNu1zWxFQVhGB/E2UIpG
 YP9LASeCm4erapn4ZB7x8abIFlYL/ZNp/m7e/z45OSIbvszzQOO+lNVXt5hcOE/AZ8
 md37xvbQoKG6yly811l5jjl8jCeb+7DmpJu54dUiR17rsCOmkcc/ytcCUXpP376koA
 5l1ZChVy9v27n65n9WAi++ayBGK0yJpjbpO9rCiCdM8k77bwp4dmU6gLDMlMSgbAcJ
 ATcgKXiiOkkLAMJl4NCyfEdzNIQq/+LpBU4L6u41YgaMbikKEU4XKNi55EF50ULGvH
 aan7h2L/008zg==
Date: Tue, 19 Oct 2021 12:59:38 +0100
From: Mark Brown <broonie@kernel.org>
To: George Song <George.Song@maximintegrated.com>
Subject: Re: [EXTERNAL] Re: [v3 2/2] ASoC: max98520: add max98520 audio
 amplifier driver
Message-ID: <YW6zKsiWPE+xGWTy@sirena.org.uk>
References: <20211018083554.5360-1-george.song@maximintegrated.com>
 <20211018083554.5360-2-george.song@maximintegrated.com>
 <YW1quluaCzsUpET0@sirena.org.uk>
 <BYAPR11MB367106FDD5394AA4F88A42D4F4BD9@BYAPR11MB3671.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tHVcRvqxv/TkamTw"
Content-Disposition: inline
In-Reply-To: <BYAPR11MB367106FDD5394AA4F88A42D4F4BD9@BYAPR11MB3671.namprd11.prod.outlook.com>
X-Cookie: I program, therefore I am.
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Steve Lee <SteveS.Lee@maximintegrated.com>,
 Ryan Lee <RyanS.Lee@maximintegrated.com>,
 "george.song@analog.com" <george.song@analog.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>
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


--tHVcRvqxv/TkamTw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 19, 2021 at 07:57:26AM +0000, George Song wrote:

> > > +	/* L/R mix configuration */
> > > +	regmap_write(max98520->regmap, MAX98520_R2043_PCM_RX_SRC1, 0x2);
> > > +
> > > +	regmap_write(max98520->regmap, MAX98520_R2044_PCM_RX_SRC2, 0x10);
> >=20
> > These should be exposed to the user, not hard coded - different systems
> > may need different configurations.
> It`s already exposed for 2043 register which is regarding mono mixer for =
"DAI Sel Mux"
> It will be exposed for 2044 register which is regarding pcm input channel=
 selection to dapm mixer.

Then leave the values at the defaults and let the user select what's
sensible for their system.

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--tHVcRvqxv/TkamTw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFusykACgkQJNaLcl1U
h9DFVQf/XvEmsHsRZThYw5Rh2fJiTUcH0nU71YKqB8OtTm+GmyIjxXvVot3FDVRy
kfbXh3uenZDDIPOPPnWKUmNKh5v1W6j0IFVcDAzoVBi2GZsZJz0bLq8/aGIZOb+t
vIVtBG1rGuTQuXSfVuFQ1oRzbJagBrvUBVtHqBnmKyPkZVzL9q7zfa4nD4UpXlt3
nk53cWjWr91NKrc4m9lyTaPdEv2Tw2zw1UektO6KALKjVOFHj8Q48rqc0e/f5MZH
6bWU6ylcFUGG+XTOMCdrQdr9r/fqJLazU29zqGYeBWrVDMkKltc9i/xsteS2rQCI
jDC+lwC+qHRNWnl51YnKm8Hz3lLSSQ==
=f6mJ
-----END PGP SIGNATURE-----

--tHVcRvqxv/TkamTw--
