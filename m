Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D11235B0352
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 13:43:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5E431663;
	Wed,  7 Sep 2022 13:42:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5E431663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662551005;
	bh=2fsZ75BvC52Ty2PIpLEYBpfUUZr6AbwDl4URheLPQRg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sm413tSE2hU0iCgQcPMuy6DKVF8MUDlN1Uef7WLQb2CdMnMS74c/5vQ8juN9QCEA9
	 2WrLFoLLDYFHc4CJ8thHkclD+gitXi+SR4HoU5nWaYNBB2K2G5a5KZ+Wy4LPhpq6Xo
	 gDnqjcxPw7qkhjYyb8UvVUHZLHgcaRCO4A2y9kWA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F3F2F80423;
	Wed,  7 Sep 2022 13:42:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A76AEF8028D; Wed,  7 Sep 2022 13:42:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67DFDF8023B
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 13:42:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67DFDF8023B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eG2rBo5j"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 71D2D61868;
 Wed,  7 Sep 2022 11:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CE1AC433D6;
 Wed,  7 Sep 2022 11:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662550933;
 bh=2fsZ75BvC52Ty2PIpLEYBpfUUZr6AbwDl4URheLPQRg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eG2rBo5j2cMiNmqzaS2KoXcWqRchau/YIBtYGRpdZzpLg2GwPFSvtGtKqiZ4PNTAF
 6X4GYKce4BU6lCVIeg7D2LGewtO9WH0QkwSvp7wA/QWJb22fINGwZFyzEDWxvLsMtD
 5qve41DRiUm23ts++81Xykn0sxAFzFOLbZ4d8ytFMbktduTvJQ56xNOJKmYE7q2FRC
 8XtU8kaKqve2A1kzKuKe4rRdTUH3aM+Dy8/LJY16f7vHz0V9N4LHI3YbvcxBk+mQjV
 4a42TtM9qwm7mYvr2P7cqT7ZrC0iSqluAiyNdm65ECFxoko2XiRfR0RIyn220AXJOJ
 wq0jUpHRx/pTw==
Date: Wed, 7 Sep 2022 12:42:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 3/4] ASoC: soc-dapm.c: tidyup
 snd_soc_dai_link_event_pre_pmu()
Message-ID: <YxiDkDOwRsbXeZ17@sirena.org.uk>
References: <8735d59zt9.wl-kuninori.morimoto.gx@renesas.com>
 <87y1ux8l7l.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iKtB9sl4B4WGSoqY"
Content-Disposition: inline
In-Reply-To: <87y1ux8l7l.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: See label for sequence.
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


--iKtB9sl4B4WGSoqY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 05, 2022 at 11:17:50PM +0000, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>=20
> snd_soc_dai_link_event_pre_pmu() is using if/else for config->formats
> check, but "else" case is for just error.
> Unnecessary if/else is not good for readable code. this patch checks
> if config->formats was zero and call "goto out" in such case.

This isn't applying for me, I suspect it depends on patch 1 though I
didn't check properly.

--iKtB9sl4B4WGSoqY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMYg5AACgkQJNaLcl1U
h9AnOAf8DEEfrxCZ7W9DB7Loxf68noHM/yPUBieEaWZdHJVmM8KB0uRD6UI44jnz
be3/9Gji2m0sjv8z9jG629n9yxqte3CNZYAub1fRKsyeh+fMlAqnKshRtmUudi+m
HBoHWQi5p6M/reT2iLaKSRBt8jC8k0DmBdzd61/22Zc8xJphL8Do6kqXolpIhmvk
lSYEKzYJJWl5RPyyI59QjItS/xAYsKkKXJ5fb0OWoTFM7FxMSigCIEDQzDrCCDpz
loWUJIOeUNF6wSoKCdLgodHKD22NkE643ThJkk7Bv5FzRXbB9nvUsXWIkT/BzfFl
Qc8KYzD3PNr8Bk9+CV6WbJY4FW472w==
=l0Dv
-----END PGP SIGNATURE-----

--iKtB9sl4B4WGSoqY--
