Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 053A77FA13C
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 14:42:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 178F4836;
	Mon, 27 Nov 2023 14:42:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 178F4836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701092547;
	bh=f3BQHuMYi7jlc3CvTz+C/tQdYT/Mcv85re4DWN0keTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IxN40CoTbRT6C3k4kmWii/ynHPWnUnyd+eK0gjR93ybS8y4Xlxd5hCaY6y+PbAkJR
	 2RuzSjCTmKBm1ZZE9vhxHHt+5kgqNDDq3tZ7CDFxgMlnNL0stq74nTzhzVRt4Z09O6
	 1iQgVM/UxZapqxiNupBi8rRPTbcBtcQ9C7a2yj/I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1F05F80571; Mon, 27 Nov 2023 14:41:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7D04F8055C;
	Mon, 27 Nov 2023 14:41:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D000AF801D5; Mon, 27 Nov 2023 14:41:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B394F800F5
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 14:41:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B394F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PpqEIMdl
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 72208CE0C48;
	Mon, 27 Nov 2023 13:41:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B674C433C8;
	Mon, 27 Nov 2023 13:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701092501;
	bh=f3BQHuMYi7jlc3CvTz+C/tQdYT/Mcv85re4DWN0keTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PpqEIMdln6ZmmiZtmAWKq/siGwB3UxlsVq7rZTD+fWjb7rC97XFbYgpQrjb2krMIq
	 8Sy00hO4zsqDYcRRTVkw01jSdozpS2oSA2o/FPwRrEC4sBJH7FE1rqZnEqziJgFgVm
	 T99Gl31xIRII/AwJFUIWTZbRHnVWkuqgKyVF5mpeBGB/iQ2jgnHfIqsmbezzQz6E5c
	 lUrAMVx8nwxXypNLP0/hrW5VAvXKMXknPgH2eGsA7aj6pIuN7sEM3Rw4tVvOw2VoL1
	 Ib6v8nnM6Iuy2mguXAcMElJgwomBPccDetFEVnxxT490vHUfSaaCvPsXnuLseio6S3
	 W//aHq0/6gJYQ==
Date: Mon, 27 Nov 2023 13:41:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Malcolm Hart <malcolm@5harts.com>
Cc: Sven Frotscher <sven.frotscher@gmail.com>, git@augustwikerfors.se,
	alsa-devel@alsa-project.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, mario.limonciello@amd.com,
	regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: ASoC: amd: yc: Fix non-functional mic on ASUS E1504FA
Message-ID: <ZWSckMPyqJl4Ebib@finisterre.sirena.org.uk>
References: <b9dd23931ee8709a63d884e4bd012723c9563f39.camel@5harts.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g8U18o2ouH88KqKG"
Content-Disposition: inline
In-Reply-To: <b9dd23931ee8709a63d884e4bd012723c9563f39.camel@5harts.com>
X-Cookie: Slow day.  Practice crawling.
Message-ID-Hash: BLEVDKUJRORNNJOCGP26WR5DRGOW2JVW
X-Message-ID-Hash: BLEVDKUJRORNNJOCGP26WR5DRGOW2JVW
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BLEVDKUJRORNNJOCGP26WR5DRGOW2JVW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--g8U18o2ouH88KqKG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2023 at 12:24:59PM +0000, Malcolm Hart wrote:
> Like other ASUS models the Asus Vivobook E1504FA requires an entry in
> the quirk list to enable the internal microphone.
>=20
> Showing
> with 7 additions and 0 deletions.
> 7 changes: 7 additions & 0 deletions 7
> sound/soc/amd/yc/acp6x-mach.c
> @@ -283,6 +283,13 @@ static const struct dmi_system_id
> yc_acp_quirk_table[] =3D {

The patch appears to have been unusably corrupted by your e-mail
software and is also missing a Signed-off-by.  See email-cleints.rst for
some suggestions on configuring things, or it might be worth looking
into b4 and it's web submission endpoint:

   https://b4.docs.kernel.org/en/latest/

--g8U18o2ouH88KqKG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVknI8ACgkQJNaLcl1U
h9DEbQf/VOKtiPwxU5ySd49oW4bpnDNSU118nM6uQupgCYR/yaVImX1SSm0oLZjg
BKYm5jaj1zChar2emI33Jev2ffjqGLOn2XHM9eyn2APjiQtB8stIHZIi1qj5Pkeu
iApaUpc1g4Esia9606uptwLk/YDydl1P5qWs/0guseaJISnU76hIxQ4E96R4uB7z
HCMDac9KRvihvI9eD7GoJ4fNiOhAJZe+9BJfx3JBsR8ctnjHdeq8sjwOWeeg3lNZ
VxSzoyf8IjQLlJZ1wC0lB3MAUsmPEqvSD4t2yFGEuMULbaGeOtn2gcemHxLm9uKd
K9XEZ4NPqhBzUi8+qn9V1I0UxTDsqw==
=DBJx
-----END PGP SIGNATURE-----

--g8U18o2ouH88KqKG--
