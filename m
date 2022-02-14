Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0914B5841
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 18:15:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8AD3192A;
	Mon, 14 Feb 2022 18:14:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8AD3192A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644858930;
	bh=WD519Uq0QBiV6NXPk1MY5hbxwwb6EUp870cvguiUII8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iqLAu0dzSBlAWz6/dovnxt6lwKST5FeUEGjh+jixTZDg6tjkq0ozoCCfqcZ7ZKr8k
	 iAalQ81W7u1W7OdeoRdKT/dyzMYOb+CXfEZZ4G9pVfHdvWKzcdICnj1B8x1hFtAAcF
	 Cs+VqyMxsBp3CeyUO0XgbWKgXvWk3E1hshywD5Ic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A46DF80430;
	Mon, 14 Feb 2022 18:14:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 411AEF80310; Mon, 14 Feb 2022 18:14:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C16BBF800D8
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 18:14:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C16BBF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="m7df549Y"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C4EBC61566;
 Mon, 14 Feb 2022 17:14:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44D26C340E9;
 Mon, 14 Feb 2022 17:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644858857;
 bh=WD519Uq0QBiV6NXPk1MY5hbxwwb6EUp870cvguiUII8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m7df549Y/EsVXsl1lUHbr/y+zUul0X+cHjbVKI1keCIqEBy6xLcHoo6WXSm3e+/qX
 5qC7D7sIvoOKgKN3HkSC31aEtQJVu0r7vDsoSBko4916LaZhd8zxCkrSS+LXgEuXwC
 sPKd6IhwIdCUhKPUKCZG7gz3bL9mqTYevuYg+UgMtcAw9TCIxbBXjInWSz3QklEfh5
 1D/bsdGpw5XgpH//KHYB5hzcLF6Dl7z61vQ/0NI3LcAb5xvBLUD6t2q86J6Wgjqv+P
 fzyC1k7TiW4HTQ2zAFQgnMh9rmPfVuZsiL1I7bfQXHyPclMjGiIOqhNvUKpBfOjkCr
 37rFjlurHnFXQ==
Date: Mon, 14 Feb 2022 17:14:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: cs4265: failed to add widget SPDIF dapm kcontrol
Message-ID: <YgqN5T3ObHvUNBKV@sirena.org.uk>
References: <CAOMZO5C9qqxLMA4Nw=YKvZth4_G-rMxCkOLOQ3a80nK8WWDURQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vAB2FwYZEOUxhQgM"
Content-Disposition: inline
In-Reply-To: <CAOMZO5C9qqxLMA4Nw=YKvZth4_G-rMxCkOLOQ3a80nK8WWDURQ@mail.gmail.com>
X-Cookie: Am I in GRADUATE SCHOOL yet?
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
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


--vAB2FwYZEOUxhQgM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 14, 2022 at 08:13:02AM -0300, Fabio Estevam wrote:

> asoc-simple-card sound: control 2:0:0:SPDIF Switch:0 is already present
> cs4265 1-004f: ASoC: failed to add widget SPDIF dapm kcontrol SPDIF Switch: -16

> SPDIF is not used on this board.

> Would you have any recommendations for getting rid of such error messages?

The driver is just plain buggy, it defines both a regular SPIDF Switch
control and a SND_SOC_DAPM_SWITCH() called SPDIF both of which will
create an identically named control, it can never have loaded without
error.  One or both of those has to be renamed.

--vAB2FwYZEOUxhQgM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIKjeQACgkQJNaLcl1U
h9A5vAf7BGfoTK7Qx1rKW+j+8kYcFAYyLX/QqBxYYg/hstyxTyu+WEXtXAjT8IPC
7fHs99LXoVrUE0llHlhA6LzJMDmDv2ZpKljUMtZp/NcoT6RpXPQHYzg3KDVuZdIf
uO/SMAQfhG6rugUmIKRU5MI0g4I2rEUBv/9pbRLDwnS/Vb1HCJy3JV5dpe6MYllZ
U8w1bfuCDL6xGgqWo0BauIJWKgX8MR7xL3m9jC9ed3C1IemoTOR8Z9BA3+zIO4vL
PoB7sFAP19H46Ide/0VP/pptGKI+4xjS1aBG/9F+aqjMMSP9d6/Xo0AaSc1SABQ7
kqteVvIWY3gDD7bd6Sl+8k/tm7f+ug==
=u4kx
-----END PGP SIGNATURE-----

--vAB2FwYZEOUxhQgM--
