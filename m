Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CD44C18A0
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 17:33:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53BE01ACA;
	Wed, 23 Feb 2022 17:32:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53BE01ACA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645634020;
	bh=kkXDWw5Ws312JHgwMVFdyKq3XYsYFAROXJIkaljA6c0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kQqVG3+BJ5wo+rxbz7vgDbZx5kYQEosxVaxxlAQepZ8YeKN+T4hEsdHISsA6nNx3J
	 AyYH7Lzu+92ESD0VFEjMut9FVhQPv3VAiiwSiaM238RKA0QcKQTIEWoTi+xSs5+TR5
	 Rv2EyLpLrvOu3VMAwIvCYG+ipbhWlwh+m6NZ55Qc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5E27F8025D;
	Wed, 23 Feb 2022 17:32:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FF33F80237; Wed, 23 Feb 2022 17:32:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18D5DF800B6
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 17:32:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18D5DF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hd5lBxoW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7978BB820C8;
 Wed, 23 Feb 2022 16:32:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44A7FC340EB;
 Wed, 23 Feb 2022 16:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645633944;
 bh=kkXDWw5Ws312JHgwMVFdyKq3XYsYFAROXJIkaljA6c0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hd5lBxoWASm7C9idlzoTFALSV/KdcWeDEC7fY8oz2NFtEkgUr4INWDQNUk8FnTmML
 pKaYdhd8Os/QxmUZ9nJXx6UxP44hX8FkfbJn82GdGILGPtD2BMXoC9uxLZaLDHjRGT
 QdLICOzUQuOn2xBogLZQeUW4OdfuY9Af9G919hHig3I0ssGmxHsj2o/RlwN+4RPwAu
 /akVavXXDxaAdRUEfoIm+djBPW5Z5X0EiMc+Ns84wRFT3sLsFocMleGTtTq/Mof2j4
 yOfRzimHSdfKCe1KWMqjpgzBIteFojeW0BHGgvEWsaPx/obP+qSCeQ8DkPrErSiG3q
 tcbnSuY8ghHtw==
Date: Wed, 23 Feb 2022 16:32:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ASoC: ops: Shift tested values in snd_soc_put_volsw() by
 +min
Message-ID: <YhZhkz6gQYsK3Fwd@sirena.org.uk>
References: <20220215130645.164025-1-marex@denx.de>
 <s5hy221y6md.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="K4+LhN6i3Z7XS3AP"
Content-Disposition: inline
In-Reply-To: <s5hy221y6md.wl-tiwai@suse.de>
X-Cookie: I smell a wumpus.
Cc: Marek Vasut <marex@denx.de>, alsa-devel@alsa-project.org,
 stable@vger.kernel.org
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


--K4+LhN6i3Z7XS3AP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 23, 2022 at 03:55:54PM +0100, Takashi Iwai wrote:
>=20
> But, more reading the code, I suspect whether the function does work
> correctly at all...  How is the mask calculation done in that way?
>   unsigned int mask =3D (1U << (fls(min + max) - 1)) - 1;
> What's the difference of this function with snd_soc_put_volsw()?

Yeah, I'm not clear either - Marek mentioned _SX when he was doing the
patch but I didn't get the bandwidth to figure out what it's doing
properly yet.  At this point I'm not clear what _SX is supposed to do,
I'm hoping it works well for the devices that use it but I don't have
any of them.

> Furthermore, the mask calculation and usage in snd_soc_put_volsw()
> isn't right, either, I'm afraid; if the range is [-10, 0], max=3D0, then
> mask will 0, which will omit all values...

Indeed, if anyone did that.  Fortunately I don't *think* that's an
issue.  The whole way that code handles signed bitfields by remapping
them into unsigned user visible controls is a landmine, it's not even
obvious that they handle signed bitfields in the first place.

--K4+LhN6i3Z7XS3AP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIWYZMACgkQJNaLcl1U
h9ADZwf/Zzguub4Yl2PGwVZbKy+3Yyz5xv1y9d0rGtN8wkYdlXsSKholjgiNyjd1
qP1aTg7VEFpkX96xLYth0Zpb+49xvQYV5MGvDs+lhXgGQ9Vi7WYE7kLIY1XtQt1L
DShepF2VtcFgWSRiPP916BPFXvIPZSp1vAYlSiOpdvLtVy1FF/s4hqsYCShRFZQp
rUMPLjTi4CYxqomIWPw3gyepInvXv5BaaJb/4W+0TEmkTtEx4j7gd+i3j0b4ezg+
JB5IDi40XgR9NqLhz8nRcK9emSDtM4cIUIaP9pWKY151Q/CM3ua4cObX4ckP7KDM
zho+HpW4zeQj5MG7UsMX6bR7qO2/KA==
=ZXyI
-----END PGP SIGNATURE-----

--K4+LhN6i3Z7XS3AP--
