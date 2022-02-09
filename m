Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC694AF88D
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Feb 2022 18:32:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 348AA18FF;
	Wed,  9 Feb 2022 18:31:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 348AA18FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644427962;
	bh=t1lEOIRmRPKWizbxtPG961FmB3OcoApK7Ih0tplgx5A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LVDR18LpM9nMpkZxbBKaVO5fzXzqRybJ6+ckphHSp9VIZOlkTbe/1hED79ZiWRQez
	 wBuYIKYQ1G4OfMZePNhzGPxEvNBrU+m6QSJBdyQEGoZElxbx+qMGURyUraGy0N8GrT
	 CqQ0KFPGDG8EXhUwEFFZa6vYOGDLFICXBtgHz980=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E019F8016B;
	Wed,  9 Feb 2022 18:31:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 330BCF8016A; Wed,  9 Feb 2022 18:31:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 719DCF800F0
 for <alsa-devel@alsa-project.org>; Wed,  9 Feb 2022 18:31:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 719DCF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="maFSzG+m"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E7A2EB82343;
 Wed,  9 Feb 2022 17:31:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DBF3C340E7;
 Wed,  9 Feb 2022 17:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644427881;
 bh=t1lEOIRmRPKWizbxtPG961FmB3OcoApK7Ih0tplgx5A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=maFSzG+mdEIqzFOKKsn9IM0Ji4dLeOlnbVSl41l7spaYaO3loaDe8jLKdIcskYmfC
 c0vzY3bx9DJbWE66YfPoUM8l/LSkRsUegpuprT9I9EXjVVFhhyi9s4JpA8SbhYVWXI
 JzKSRsiDRhtjKmhPkAt970fiNiTu029di4YL2W8AoED1fy3h67JRcvXzYcbfy8tJJY
 3bkgLQOlyU1D2tL81L3FR98tixXot4QSo24o2L5P69fV7MML5DCFgq2ZN3i0lGVICm
 athXn8eRXyOAzf/kXAzG5Mx92yFeNa3Lj0cI+biiVhoPbfhQE3sGmNApLm55HdTKg3
 7IhUMh0cLayFQ==
Date: Wed, 9 Feb 2022 17:31:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Ricard Wanderlof <ricardw@axis.com>
Subject: Re: [PATCH] ASoC: tlv320adc3xxx: Add IIR filter configuration
Message-ID: <YgP6ZSqpJQwRoMLE@sirena.org.uk>
References: <alpine.DEB.2.21.2202071806580.31604@lnxricardw1.se.axis.com>
 <YgK81R6ipwLagmoE@sirena.org.uk>
 <alpine.DEB.2.21.2202091518030.21772@lnxricardw1.se.axis.com>
 <YgPkX4UaYa0jyo6K@sirena.org.uk>
 <alpine.DEB.2.21.2202091803550.21772@lnxricardw1.se.axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZOG7cttW2MxV3nei"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2202091803550.21772@lnxricardw1.se.axis.com>
X-Cookie: Disc space -- the final frontier!
Cc: alsa-devel <alsa-devel@alsa-project.org>, kernel@axis.com,
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


--ZOG7cttW2MxV3nei
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 09, 2022 at 06:20:00PM +0100, Ricard Wanderlof wrote:

> In this case it was the ADAU1761 driver and it was several years ago
> and I don't know if it still is an issue. Basically the sequence was=20
> something like:

> - System boots up.
> - Codec is configured (I think it was the sample rate, but it could have=
=20
>   been the format or some other I2S parameter) to something that is non=
=20
>   default.
> - System reboots. Since the codec has no means of getting reset, it
>   retains all its register values.
> - This time, an attempt is made to configure the codec with the default
>   sample rate. Since the driver believes the default is already set
>   it does not attempt to write anything, although looking at=20
>   regmap_write() now I'm not sure how this could be the case.

update_bits() could also trigger this if it thinks the value didn't
change, but that's at a higher level before it ever gets as far as
trying to do the write and unrelated to the cache (it will also
suppress redundant writes with no cache present).

> - When codec is started, the sample rate / format / whatever is wrong
>   compared to what was allegedly set up.

> It was all rather academic, because the above sequence only occurred in=
=20
> the lab under manual control; in the actual production code the same=20
> format and sample rate was used every time, so it wasn't an issue that wa=
s=20
> pressing to fix. It could as you said have been a bug somewhere else. I=
=20
> distinctly remember the last point about the codec running in seemingly=
=20
> the wrong mode after a (power-cycle-less) reboot at any rate.

A soft reboot could trigger something like that, the easiest fix would
just be to not specify any register defaults so that there's no default
values to compare with.

--ZOG7cttW2MxV3nei
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmID+mQACgkQJNaLcl1U
h9DMBQf/QrU6gaTo6FfNY1nR2rgR7XtPYH6HJZPTj4sPkRE024yi3pr+tWDh85tZ
uiKQJ33D1EUJOHhbUPafdx+xlp9ponQW66hsysi+FvThjayh5arrAzzQoFVTFRod
NpkZI2uHl3FRsO8XSCGFX12B/2KPe5hS/yHo8fTeFp6Lxy7rkWaa1xg0uPFXGcmj
dHMcQBNYOuRT/DWZbjiO3l7dL/0xfMqqqiMdyvq/EQ6E7a3Sr3ZRtiMS/m2IL8l8
ao8qRq1Ef3qgCtySChk18gPysVcPulflF/M8Viphz2Z+DMTYUgQ3I0f8lQXiuP97
558f5j62sjROWM+E9cau11EoVbEN5g==
=A8M9
-----END PGP SIGNATURE-----

--ZOG7cttW2MxV3nei--
