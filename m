Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5AB79D279
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 15:36:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DCBD886;
	Tue, 12 Sep 2023 15:35:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DCBD886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694525767;
	bh=VbfJfM9sOOPsxv+wZn4Vfk3FxTBuEdVpBFsYpcdpDaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OoVVaWiufHNdPtR/7sI2yaeYU2Vl94Vtf1fmchpx9atT/qTbokHvAmruw07+zdEft
	 2RRar/p6hsV3ccPySoNdUrtBCb94FM+AyyPurodZPzmolQKBlUNwJSjxRjKLDZCzAF
	 Q7pRjCYpHkRa9mo03jwok6DDuuSsZULBEGYytsxA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF9EFF80246; Tue, 12 Sep 2023 15:35:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EF86F80246;
	Tue, 12 Sep 2023 15:35:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F0FEF80425; Tue, 12 Sep 2023 15:34:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35BBBF8007C
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 15:34:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35BBBF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nYclrPIU
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 5C502CE1C8D;
	Tue, 12 Sep 2023 13:34:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28D78C433C7;
	Tue, 12 Sep 2023 13:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694525644;
	bh=VbfJfM9sOOPsxv+wZn4Vfk3FxTBuEdVpBFsYpcdpDaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nYclrPIUtVBYBadfqV0Ryw7szcbwQJBncSZr5HpNxiSvecLInH5gih2nhcEMU51dJ
	 IVRdkQBDOYT/WNEi2dkAo7PeYgvTL2GpsJTvwFgRM4zUENfXu42WQVZPGsnFq2NtJA
	 FKl1lWpQmba7P9toALrcJZp58VpgNOvmVBctcZKomyw1G4fZaeX5d6IYEtGxs3iDkZ
	 1VG4S698CPOJLjtngMWVDmdZ3d6Prq2UkWc+hb3CrL1GDHks164m0dASWYCqM5MuUZ
	 MpyvJUbeeNfqTphJC0rlICmG54+hdWKsU+D50PD/pv1Pc2rxB35eoxIDD6tztxs8Y0
	 iDy9ZoHwdsS/g==
Date: Tue, 12 Sep 2023 14:34:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Myunguk Kim <mwkim@gaonchips.com>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Maxim Kochetkov <fido_max@inbox.ru>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: dwc: fix typo in comment
Message-ID: <ZQBoyKulheGf8h/e@finisterre.sirena.org.uk>
References: <20230911064646.168181-1-mwkim@gaonchips.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DRWzJOqD/qMbZEsz"
Content-Disposition: inline
In-Reply-To: <20230911064646.168181-1-mwkim@gaonchips.com>
X-Cookie: It was Penguin lust... at its ugliest.
Message-ID-Hash: ZIFI25X4XKKILCXM3CN4TNCQETBM2J4X
X-Message-ID-Hash: ZIFI25X4XKKILCXM3CN4TNCQETBM2J4X
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZIFI25X4XKKILCXM3CN4TNCQETBM2J4X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--DRWzJOqD/qMbZEsz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 11, 2023 at 03:46:46PM +0900, Myunguk Kim wrote:
> This fixes typo in comment
>=20
> Signed-off-by: Myunguk Kim <mwkim@gaonchips.com>

This doesn't apply against current code, please check and resend:

Applying: ASoC: dwc: fix typo in comment
error: sha1 information is lacking or useless (sound/soc/dwc/dwc-i2s.c).
error: could not build fake ancestor
Patch failed at 0001 ASoC: dwc: fix typo in comment

(after fixing what looked like corruption in the mail)

--DRWzJOqD/qMbZEsz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUAaMgACgkQJNaLcl1U
h9DoGQf/TJUS/g2YbbUbZNg3GI4ImJplDhgpqZge7XpokWGYCEX2sIYeZdrmz3Zp
MKsK0XmClFvOJrjLUUygTTqaepttrDsn8T95vIWwdUX8BqddAGKvDSZ87ymhgcRh
8XdWRJXx/X7NQROPrRmOlE7U36kYIbMh2KgmykwKwjEJuggaOTFJn/9I0Q/CnOsl
So89RmULbpI/68nPmKPZK9/SAogN4ySFSXNXJx9SgDi+p42LCrz/Z2zvZ6L70cNa
0CiDGHlIc3sQQNJI4VUktBA17BtfHUOH8cMR0iPWN+8THH2Y+yjFI/7lsGCxndNC
2YUTVv358liuW5sHKOQA3h6RKd/CLA==
=y//G
-----END PGP SIGNATURE-----

--DRWzJOqD/qMbZEsz--
