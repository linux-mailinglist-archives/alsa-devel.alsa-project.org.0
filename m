Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F18F78582B
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 14:54:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A115B83A;
	Wed, 23 Aug 2023 14:54:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A115B83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692795298;
	bh=OP3BmCj9797jzvWTmGFjP17Iv71ub29iBhEa6doH2t8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d0ORdhmiZLSR1iNcE/YAQCM3LT2ZBaMRaDzbV4yTwceGjj+hW2SK42yiOwMtjCfy0
	 h+BzCgqdHpmyEdQtKZPwQ+drsyR6x/RXp5pYcmexmlXvR4oCx3dimFGjRQmQU/OqjT
	 o5NYLoO27WyaSJopZeabn/LxBOa2/23t7IMxTn1k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A45B5F80537; Wed, 23 Aug 2023 14:53:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EDB5CF800F5;
	Wed, 23 Aug 2023 14:53:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E464F80158; Wed, 23 Aug 2023 14:53:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1AD1F800BF
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 14:53:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1AD1F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dAovSQaT
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8E87961C11;
	Wed, 23 Aug 2023 12:53:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9473CC433C7;
	Wed, 23 Aug 2023 12:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692795203;
	bh=OP3BmCj9797jzvWTmGFjP17Iv71ub29iBhEa6doH2t8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dAovSQaTU2JIlsGuetQVhEVwE8s/BsMTriViHLiLvp6tE0bZNJ410KfxtiPnI1zfN
	 Q/CxT0E7T7z3bykDeNqcvQ4oQEC73GY5DJD7p25TMbLNXpDqLbAcOhBDmoZz1AIaTS
	 wtQD7qsOa9ZyKGiWpy4O08E3ZxgjsK8n9sq9r56layh2NqCDJ8pXiuxxhOY7PqQ5w4
	 y9eg2ppHv11Zvm88JffHt4CZ+Yefh2ZTFDKBB9e1VWSr7t7mMg3BcLC2CFSRsn5sbm
	 BVfltKm01gMPzLbpp9WPf3k3z/zzvJSdwRhhrPDjQdPuo0CO0wJI9WgAAbX5ZsJynR
	 YSbHge4ymeHpA==
Date: Wed, 23 Aug 2023 13:53:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
	Adnan Ali <adnan.ali@bp.renesas.com>,
	Vincenzo De Michele <vincenzo.michele@davinci.de>,
	Patrick Keil <patrick.keil@conti-engineering.com>
Subject: Re: [PATCH 0/5] ASoC: rsnd: tidyup ADG
Message-ID: <2935a919-da2e-4b0a-93f4-66d7f042c2bf@sirena.org.uk>
References: <87o7iyzlfy.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zsyWCySrO/5juUDI"
Content-Disposition: inline
In-Reply-To: <87o7iyzlfy.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Some optional equipment shown.
Message-ID-Hash: R76MEEOTAGKI6UMC643HK26U2HY7TV6P
X-Message-ID-Hash: R76MEEOTAGKI6UMC643HK26U2HY7TV6P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R76MEEOTAGKI6UMC643HK26U2HY7TV6P/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--zsyWCySrO/5juUDI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 22, 2023 at 11:50:10PM +0000, Kuninori Morimoto wrote:

> ------ for git-log  ------ 8< ------ 8< ------ 8< ------
>=20
> Renesas Sound has ADG for clock control. Basically it needs
> accurately divisible external input clock. But sometimes
> sometimes it doesn't have to be accurate for some reason.
>=20
> We can use ADG clk_i for such case. It came from CPG as
> very high rate clock, but is not accurately divisible for
> 48kHz/44.1kHz rate, but enough for approximate rate.
>=20
> This patch set support such use case.
>=20
> ------ extra info ------ 8< ------ 8< ------ 8< ------ 8< ------

When you put cut markers like this in your mail b4 thinks you want to
hide that information, not hide the rest of the mail.

--zsyWCySrO/5juUDI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTmAT4ACgkQJNaLcl1U
h9BtUQf8C8OHeLU1u6NvOUp7IcYBRBWVcSKbnO1gUEHpEd2fPm98c5XSa76vyg2K
thr0uc39OUFhZX+CYqbQKQfEo+k/vrr/31CSF1uoWacVG/pZtgiSFWRqliZyKD4/
08GIsdv/dhcj7+gpEZ//pdWy2GemJmwcUPY+d2j9873VHXE/7+MYrpQ/rbEQlzld
TCwet5UHJ1CrhAbBX0XvaUeWku5bPNGFBHga6+ijGG9NdSnz+1PvrGbh5tkXmDxj
JdgIUhlMtHfxPYkCCbQACVErLvdQQ8rwMUm3FigMMIUDoleQEq+4H2qxR1C+D397
a6WNRP8XDIH+iInDyIahqV22XtcP2g==
=s1lM
-----END PGP SIGNATURE-----

--zsyWCySrO/5juUDI--
