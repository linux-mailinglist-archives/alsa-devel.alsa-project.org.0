Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9898557FEBC
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jul 2022 14:03:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D0CB1FE;
	Mon, 25 Jul 2022 14:03:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D0CB1FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658750631;
	bh=GwbjS3c13lg8fZPA7wDzaCJ7BO5g1uJau5vPd/VCIMk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EaqmkyCPay/RgB3jWzKhdQJIXB/7o3mlQweo6RDZhbtj9teiuq4T8m7K5UcVure2n
	 EaN327HTNo/Cb/Uhfi13bJ2V5qpp+6XaY+/a0LJW1uStv24SS5lE3hLM7DckgLS74X
	 C5KhbLa284rp+1mHiEAGeKSDKlc8qxp7idU6r8oo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF106F80128;
	Mon, 25 Jul 2022 14:02:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD73FF80163; Mon, 25 Jul 2022 14:02:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF475F80115
 for <alsa-devel@alsa-project.org>; Mon, 25 Jul 2022 14:02:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF475F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Vw/15Tdp"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 252E5B80E30;
 Mon, 25 Jul 2022 12:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6374CC341C6;
 Mon, 25 Jul 2022 12:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658750561;
 bh=GwbjS3c13lg8fZPA7wDzaCJ7BO5g1uJau5vPd/VCIMk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vw/15TdpwY/XY9VymvbWBN+R50Q+Ox6qLxjQmrvp2bCmODZDfNNehi83cm+eE0Xwc
 QRL5jwGQYNEyoX3OgztWnaNhhuLNIUPiZX0HlVRCkfyHNTgkJFAZ364iJtfgWHUgo3
 WWCo1mYwDZWi3sF/6DDaTk+jtdb94kQQzAXj/+kI9y6HWt36GRLsrse1Gmt34uAIKh
 +v23Ri6I2IQFnM0B1QRAvnhjSpmE9P3AjvSADdWs0z8C6lt6wUXxEb5irNCPKeAH/W
 oRLTlCrCtemLXqTBWzB3EcF0P3jfixV0HuY3k9oGMeOP+L5rl5BNYTuKOqWdrU7KOJ
 ANeYXmryr4fjQ==
Date: Mon, 25 Jul 2022 13:02:35 +0100
From: Mark Brown <broonie@kernel.org>
To: "Prasad, Prasad" <venkataprasad.potturu@amd.com>
Subject: Re: [PATCH] ASoC: amd: acp: Modify dai_id macros to be more generic
Message-ID: <Yt6GW/29wJ9081rh@sirena.org.uk>
References: <20220722141705.3340440-1-venkataprasad.potturu@amd.com>
 <Ytq5rlr/er0wDTae@sirena.org.uk>
 <PH7PR12MB595106BC93458F31B2D8C5A9E9959@PH7PR12MB5951.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="PIF0Y6NPkJF5WZtF"
Content-Disposition: inline
In-Reply-To: <PH7PR12MB595106BC93458F31B2D8C5A9E9959@PH7PR12MB5951.namprd12.prod.outlook.com>
X-Cookie: Replace with same type.
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Dommati,
 Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, "Hiregoudar,
 Basavaraj" <Basavaraj.Hiregoudar@amd.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, "Saba Kareem,
 Syed" <Syed.SabaKareem@amd.com>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>, "Reddy,
 V sujith kumar" <Vsujithkumar.Reddy@amd.com>
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


--PIF0Y6NPkJF5WZtF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 25, 2022 at 10:27:19AM +0000, Prasad, Prasad wrote:

> This looks like it's just an indentation/formatting change which isn't
>=20
> what the changelog said?

> We are changing dai_id macro numbers, as renoir platform has 2 I2S instan=
ces and Rembrandt platform has 3 I2S instances.
>=20
> To make I2S instances as order, change DMIC_INSTANCE to 0x00, I2S_SP_INST=
ANCE to 0x01 and I2S_BT_INSTANCE to 0x02.
> I2S_HS_INSTANCE is already 0x03.

Please write a better changelog which makes this clear.

Please fix your e-mail client to clearly distinguish between quoted and
non-quoted text, it's very hard to find your new text in your mail.

--PIF0Y6NPkJF5WZtF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLehlsACgkQJNaLcl1U
h9CgKwf/fMKV9x3binr3akdQUf2tCBjy5NssqkTHNgnFmlRZR16apmsVym3vFcBm
alf/DJPe6ulDvdyWpaE0pFRby0SMno2QcMAtVBFGqQND6RJj6DIpgCZNkn1ArAH0
oAK9+7qnpyDEvtBjW5DP1T64t1ODNThOtPqtvRGmNDXZsJzhFq+/Xf/YMd4bsQCK
Dah7YpjggjmlNcYMV6aFJcrUIOArSRtEtkUb1aeoFPGSFV2FhHiNp7/KXLSCha6F
kOfTQgoGKrsJ8y0DSMY2j6y49GMK6k8A9H5i7f4lvYIxGpbRspvxjiC+Ch0YF17L
wA3NhWAIDUvz/EwTQLJUeqbnY2X9Uw==
=Q0Fq
-----END PGP SIGNATURE-----

--PIF0Y6NPkJF5WZtF--
