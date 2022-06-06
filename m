Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B524C53E437
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 13:32:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AA9517EA;
	Mon,  6 Jun 2022 13:31:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AA9517EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654515136;
	bh=hFXTE079dnxlelE51vh7AHYuIfFlJboRXtmH5nz+9Dc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sk6oeHWRdV/eZTpCNjjdxWoFKGBJqDiKTrhQfs3xIwS9kexv2yjIexEXk3xdb5btc
	 ASBIJo1CVcH0LCg8stc/2tGrwmlOoP65XFjNdQNUA+7bQRHmr69rjNTyhHh8M94WIj
	 0/wk4JIBbssUQi2OLQ6XPEVRvQmF+A9g2PzIjcxI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76743F80310;
	Mon,  6 Jun 2022 13:31:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFF50F801D8; Mon,  6 Jun 2022 13:31:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8131DF80116;
 Mon,  6 Jun 2022 13:31:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8131DF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FHNgtEO0"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C11B3B81808;
 Mon,  6 Jun 2022 11:31:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24275C385A9;
 Mon,  6 Jun 2022 11:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654515068;
 bh=hFXTE079dnxlelE51vh7AHYuIfFlJboRXtmH5nz+9Dc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FHNgtEO0jwF4zrz7PZlMqXRQ0rTRHJ3FXl2KbPHv1qXsvvVEZy8z9msTfB8b/aPOs
 6Euj7n/bwY6MEa2rxQm7xo2CYvz1Udw5vcTtOVZr7CAHPALkGsCWT92092jp4lPaSG
 YMS8B10jiXz9Yg1hoBXgVR5uHbY8aDjnjKC0GOTqysXKZMz5wz9UpXfDTs0Nbuvqyx
 ibJZt/JqS/ajNHpKSmoc00NZGr3Fqfue89oAdquGtG47w1dtr3QJdVWsySj0ozARNt
 x6IPLAyGg84ia70TOzsP89M+NaJ8RVPcj2/v5qd90p6EkdgQOG8M2LR6/o0iesg/TP
 1IApgQjP1Ky0g==
Date: Mon, 6 Jun 2022 12:31:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Fix potential NULL pointer dereference
Message-ID: <Yp3lduXW6x2BRRB5@sirena.org.uk>
References: <20220602135757.3335351-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="XmRqS/FK7ywI2m7E"
Content-Disposition: inline
In-Reply-To: <20220602135757.3335351-1-amadeuszx.slawinski@linux.intel.com>
X-Cookie: Used with permission.
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, sound-open-firmware@alsa-project.org
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


--XmRqS/FK7ywI2m7E
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 02, 2022 at 03:57:57PM +0200, Amadeusz S=C5=82awi=C5=84ski wrot=
e:
> Cleanup path for sof_prepare_widgets_in_path() should check if unprepare
> callback exists before calling it, instead it checks if it does not
> exist. Fix the check.
>=20
> Fixes: 370014c8197a ("ASoC: SOF: Add a prepare op to IPC topology widget =
ops")

This commit does not exist.

--XmRqS/FK7ywI2m7E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKd5XYACgkQJNaLcl1U
h9BAsAf+LRVoowo6ZLiik1lIN8Jym6y3sXeehQ6OCI9ltMk5I1597qfR8j7k49fI
2ekUvR1JXPWPg2tI/ZaQBOpEsgurUzTxdW8rdLc0EzN/VR0fbDW3fdUbDoDbnnOe
poeXcaPnroErbiTx6Sj2scVnMARu1VnUkyvac2ZPaij+6JSVjUjq/WbhpHHRpfDM
haI2GSFS6M2xggTcdInV9f5cvJzTEa9O8BB/hJjiG3vBJXiV8mkBtrGvlVdHxS/T
5H19VJr/9X0fwgptyBkpDpkSbkdUUUCQ/bvqkwO2zNhbPoHIQk4yx0OAs1TN0/vK
VRidukxvF1Z/O7c8z/Xqu7V9aIogZQ==
=E6ZQ
-----END PGP SIGNATURE-----

--XmRqS/FK7ywI2m7E--
