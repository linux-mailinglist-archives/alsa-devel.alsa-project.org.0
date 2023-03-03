Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1456A9766
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Mar 2023 13:44:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C37B193A;
	Fri,  3 Mar 2023 13:43:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C37B193A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677847450;
	bh=0joJXlrLY2FhKeY0R+mHaabUyq405E4hscw3qzY4bGg=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JJ57qJ0TjpyuTJ9g2GGLhogn15oFl3zo8abod1fjNPZifZbItgfkBhY81IcyACmKI
	 pikFNlKH2FqgLR9apPziRpHZhy0l8YpwGqE0fDbp/bWTTgvtBBjSkDuqCTtnB+IfYp
	 wOZtFzTp82EdQ0esqhNjpPm5x1DoYZ98sgTURB2g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FB5CF800BA;
	Fri,  3 Mar 2023 13:43:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D861F80266; Fri,  3 Mar 2023 13:43:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86F72F80236
	for <alsa-devel@alsa-project.org>; Fri,  3 Mar 2023 13:43:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86F72F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BvrmjQrn
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DE1DCB8163F;
	Fri,  3 Mar 2023 12:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D420C4339B;
	Fri,  3 Mar 2023 12:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677847392;
	bh=0joJXlrLY2FhKeY0R+mHaabUyq405E4hscw3qzY4bGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BvrmjQrn31tBey39NdmtTU2RL0bB1Uty1VxBaH2Gzm/EvWcEROFLRM+qt7qWEYPzK
	 /rvgSycDmt3W0rz4odwLiNqit4XDG+AhhBkgLnaJ006paESXLFjgKszufH8x9Xky1r
	 uqLI/xwVaEDoDeIMn1+o0V27DtClyiwZO0JN0YCHKNkNbXkeksUeFSGNGqgAzr6Pu0
	 jG4I/I7Vqb9zTKaOGKM6GBxgvro5/363LlKOrBSk7/QVFGnSV6ilIefBF/T65qYTsb
	 jc1ykinJXhiUjIF7pDNtjWjyUScEaherthghFoy5knREIqbTqaiZHzTn1b+rQ/ZMGj
	 RvCNkKd3RK6xw==
Date: Fri, 3 Mar 2023 12:43:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] ASoC: clarify that SND_SOC_IMX_SGTL5000 is the old driver
Message-ID: <a36d3650-f0f9-4604-8262-cbcfa881b54c@sirena.org.uk>
References: <20230303093410.357621-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QTeiKIHJAymC+ynn"
Content-Disposition: inline
In-Reply-To: <20230303093410.357621-1-luca.ceresoli@bootlin.com>
X-Cookie: You are fairminded, just and loving.
Message-ID-Hash: 4MDZNTLOY4TEUOKYZFVQC4XPGNTKHITT
X-Message-ID-Hash: 4MDZNTLOY4TEUOKYZFVQC4XPGNTKHITT
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Viorel Suman <viorel.suman@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4MDZNTLOY4TEUOKYZFVQC4XPGNTKHITT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--QTeiKIHJAymC+ynn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 03, 2023 at 10:34:10AM +0100, Luca Ceresoli wrote:
> Both SND_SOC_IMX_SGTL5000 and SND_SOC_FSL_ASOC_CARD implement the
> fsl,imx-audio-sgtl5000 compatible string, which is confusing. It took a
> little research to find out that the latter is much newer and it is
> supposed to be the preferred choice since several years.
>=20
> Add a clarification note to avoid wasting time for future readers.

Perhaps it's time to just retire the old driver?

--QTeiKIHJAymC+ynn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQB61oACgkQJNaLcl1U
h9C+Lgf/fx3hpA4MUUUkOYrBGKMMCFhcQ/4OoSQcxV5n2rJCC584mHb9fEA3Yycs
2GLwVUiJc6y2Co0xpjil7IkOuHCKBjUP9vCAZn3jQCENbGeafJvLe79fgGE5a8VX
jmE5iQD8ZcwOZiX9KCJq8Ro6RJKVNqfWrZtGNXrcu+QbGOfqr2fu7tu/apxyv8rp
JC8rpx4Kv7hTsaNel3RTsbcOIVOUKljtaXEfxbCijzhmhBu6o4ck7Q17LEFRc/kx
1BkpLJQOBYVIJfOQZ1CNlKC8S6KZ4aNqZTqCkOF0Ae6bV2X3VeRyt4yvC5ayH99y
bHBgeVGyX/DJf07TuN5s9KSBTKFPwg==
=tYaW
-----END PGP SIGNATURE-----

--QTeiKIHJAymC+ynn--
