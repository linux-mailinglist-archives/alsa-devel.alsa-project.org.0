Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8573552F1
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Apr 2021 13:58:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 756B91657;
	Tue,  6 Apr 2021 13:57:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 756B91657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617710318;
	bh=WEIbwKYwhzM/0VfUKlm3d2KaXk7BSdSJS42qkOPcEj0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WmbKZvZdafLIIm7Ae2EMwQEYJer+2Wt/PqHxIntyQGtDBOU6LKM0AMziFexaUEcWf
	 EOZsDRCSmBzUtGOSaW4IH0Ec6aaj6XG4/5HchlsLfDWbZIxnZ1y21c+vrnBIL/rkmK
	 CBO5O7hjWY7A4jchGqa749j3lyzajghCXYhGpmLo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D906BF800E1;
	Tue,  6 Apr 2021 13:57:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60CB2F8020B; Tue,  6 Apr 2021 13:57:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85BF2F800E1
 for <alsa-devel@alsa-project.org>; Tue,  6 Apr 2021 13:57:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85BF2F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="arZfNRIj"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C0452611BE;
 Tue,  6 Apr 2021 11:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617710219;
 bh=WEIbwKYwhzM/0VfUKlm3d2KaXk7BSdSJS42qkOPcEj0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=arZfNRIj5cwuuD/jVAtN1kirg5TSM3A7ukGInVQwYUtnzoZPfWo6d2LHUAgCHMBfR
 c6BKUgX5+kFrsdtRL/FiR4+k+ng8wyCeeOO0p4+shUTuRmWsptpRb4jXp2CYnkA7bf
 Fp3qZROyC0FrVbgQFl71mOn7CU/svNu3VmTIgngRFdRbZNSs0XEDtSYEsxr93LOcR4
 h3n3Rfa0SR3fOW4+9cCn1ATScpown5jREMd+jSWrtJMXDnKHJGPa+T/3gHIBC+dURk
 xajOtzzs7O/7aHD5/XgliuUSw4444RmDHyTP8b0giUsjRMxe7AdKeC5Wvw8YIGa6Hd
 m+hcqvXRQBP3w==
Date: Tue, 6 Apr 2021 12:56:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiri Prchal <jiri.prchal@aksignal.cz>
Subject: Re: [PATCH 0/5] SOC Codecs: TLV320AIC3X add SPI support
Message-ID: <20210406115642.GD6443@sirena.org.uk>
References: <20210406105018.59463-1-jiri.prchal@aksignal.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="0IvGJv3f9h+YhkrH"
Content-Disposition: inline
In-Reply-To: <20210406105018.59463-1-jiri.prchal@aksignal.cz>
X-Cookie: BARBARA STANWYCK makes me nervous!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>
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


--0IvGJv3f9h+YhkrH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 06, 2021 at 12:50:13PM +0200, Jiri Prchal wrote:
> This patches add support of SPI to TLV320AIC3X codecs.
>=20
> Jiri Prchal (5):
>   SOC Codecs: TLV320AIC3X add SPI: move thinks to header file
>   SOC Codecs: TLV320AIC3X add SPI: main source code for I2C and SPI
>   SOC Codecs: TLV320AIC3X add SPI: I2C code
>   SOC Codecs: TLV320AIC3X add SPI: SPI code
>   SOC Codecs: TLV320AIC3X add SPI: configuration and compile

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--0IvGJv3f9h+YhkrH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBsTHkACgkQJNaLcl1U
h9ATOQf9HRllNYw4/PvrsZ2w6H6OzPBZEgbDZzw56GQonENDiF5GgXEEkx+ChCbn
KuRDI6nKEZIrAX3Tgv/01yBy7Qib5xfPHl9oiqbipy1Fix2gFNPZvUSyPs07vYCZ
S99nDi2GtNejbmiuLu/aNZ9n01Fukgz7T6xUOGtNkIlo78H+SWcmReJg59/UUFsY
OC31yvuCRxeQb7xWsxFqeJucC1uJAUvIKOej0cGouJEyXWaPFWpOFqNrNNYg2nX1
qA2RTslL4PYxZoKiw5t1H1dGT2xqpK8ycdFMWCDDk/tVfK8EknG5GvjyiUUfL0K2
dggr/KiKoEIc/5f5h7ywJnEMozTVbA==
=7B5S
-----END PGP SIGNATURE-----

--0IvGJv3f9h+YhkrH--
