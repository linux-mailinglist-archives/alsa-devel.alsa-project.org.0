Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A8748E9BC
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jan 2022 13:13:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9EB41F0A;
	Fri, 14 Jan 2022 13:12:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9EB41F0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642162383;
	bh=xWVNg8jYF+xmMkDX8x7QzixVZI1jpIDE8FBOyg3doJk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lqbd8Ie8OpUQ5Oc8geFoBGTNYXLa2jB8/MTLYoLv5shwMJxjq5gUDaPypvPpj6VtQ
	 gz5Z7+91mQmIWDgu7XGTCvNfYlsPUeqk8/NvryZHOS5W4RL52vR1xpCWnA/9wGHNWw
	 ZkNli6pl9qaxn+gMFayK+etj8z0KW/N0dKyfBLH4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DEECF80310;
	Fri, 14 Jan 2022 13:11:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03379F8030F; Fri, 14 Jan 2022 13:11:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD22AF80141
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 13:11:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD22AF80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sUR+ztBT"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6ED4261F3C;
 Fri, 14 Jan 2022 12:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C46C36AEA;
 Fri, 14 Jan 2022 12:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642162307;
 bh=xWVNg8jYF+xmMkDX8x7QzixVZI1jpIDE8FBOyg3doJk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sUR+ztBTAE69/p/bB2/5zzJr8kmdF93CJ+S0fKeuD8rRyGONFmGjN/5CeMYevXhc9
 XR0LIXw3vb0G+2HLyk2j6+nxs+NOx75Oq/XrUn9U/3WryYJja6wrefOE/6em+5V/HU
 r1SICpAwxWdmVwXcOOAkZ/GcGncS4QaGjXtmDTzHSAEp7Yckxn/tdvHtMFNyx21NU7
 Vyoc9rnzBQSVxmC9oLvjdy3qjPybah3ZWQD9TwQ08qchzP9GT7Gxjd7vmkLIM29+oK
 UyfS0i1iZLY6D9FsM6pSjoz2sKiPuASdLJXf1j4qMZqG02ZhODpOKbc5kjpJaKQG0t
 CJCuuDvyrIALw==
Date: Fri, 14 Jan 2022 12:11:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Beer <daniel.beer@igorinstitute.com>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: add bindings for TI TAS5805M.
Message-ID: <YeFoftcUwRvyShvB@sirena.org.uk>
References: <61dccc5c.1c69fb81.9af91.0df6@mx.google.com>
 <Yd29tk6ZJgDFDvVI@sirena.org.uk>
 <20220111184700.GA10070@nyquist.nev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hIzfZ7Gg0S+Hgd8w"
Content-Disposition: inline
In-Reply-To: <20220111184700.GA10070@nyquist.nev>
X-Cookie: Two percent of zero is almost nothing.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Andy Liu <andy-liu@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Derek Simkowiak <derek.simkowiak@igorinstitute.com>
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


--hIzfZ7Gg0S+Hgd8w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 12, 2022 at 07:47:00AM +1300, Daniel Beer wrote:

> If you think it's still inappropriate to supply the configuration in the
> device-tree, do you have any suggestions?

As I said load it like other coefficient data - the simplest thing
initially would be loading it as firmware.

--hIzfZ7Gg0S+Hgd8w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHhaH0ACgkQJNaLcl1U
h9Aczwf/VbbhZslWnff3lIqK3COnyjw9mmcFxD7wuNGaKP3GiLu3ziqqAjwiyn9U
hWSbhglTJul037W/Fg+irWXaMNAUPsv2lcMecyAbfuphY2M2IUIy6nDmkmio+Rm6
qp4sUe2MhwJiHh2xEI2VMFTxWJHBKi4y1Xhh+S06GXdmrGnE7mCjFMO9kRUOQSwm
sHY8n5RHhr/1ZW/j07BwsHcLMWwBqMCMUsMyRGE7WVGmrIIJ6MT05eV24hTvtOLR
K4g6i+RfMKp6DWG9c/yhEWmt3wILRR7DWkhnVW75bn9IZ7NragWBVLyRQdg+gr8e
CJNwhRSrUrQrm8+EUrYpeVSxjY8SxQ==
=Zh1A
-----END PGP SIGNATURE-----

--hIzfZ7Gg0S+Hgd8w--
