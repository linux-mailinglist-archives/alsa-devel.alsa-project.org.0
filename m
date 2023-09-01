Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC2C78FDD2
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Sep 2023 14:56:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DC63DF4;
	Fri,  1 Sep 2023 14:55:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DC63DF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693572965;
	bh=v+RCs19kOWar+rgrrH/bMdmvLgmSNZkRub0yArkOhOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TqXvKZhnSXr7tgo+Jcslh/4sjr9FplkrzTCrtoeTm3sBqtcLg94Wn1PUVACHTxii8
	 0Atek5SsLdY3ElYmFbpbi63/mULZT0OyiYGXf4dOAxPOjiJgk4Ga/4fgfIl6auNsip
	 fQwxYFiCVR1l5RHymMSHdbXXCsLJ7twv629dGCzA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF5B2F8025F; Fri,  1 Sep 2023 14:55:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5622AF80155;
	Fri,  1 Sep 2023 14:55:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0E92F80158; Fri,  1 Sep 2023 14:55:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1332F80074
	for <alsa-devel@alsa-project.org>; Fri,  1 Sep 2023 14:55:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1332F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cRWn+Azl
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5848460DFF;
	Fri,  1 Sep 2023 12:55:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7066CC433C7;
	Fri,  1 Sep 2023 12:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693572903;
	bh=v+RCs19kOWar+rgrrH/bMdmvLgmSNZkRub0yArkOhOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cRWn+AzlC+HmC2LzMsKkCwnThcoUn7iltXvxrz8+fwbcAAXD73Zib2dHP2cjtuJOt
	 Q21zPZt2FSbHgfJ06gx0z2Jpe92umZwjcB60tHAbT3FE1a4LAM7iPKwiHqk79CKsEy
	 mf09hddfOSMeSM0jL9l5dLel+l2z/t6eozXkrHbQTHfsq9KfHu/MYGoplUYMWFL0TR
	 TYncpOCvdgUdqWVavgK6QgAzvXo49+l9J2TiWvr52NfK2scelscRpN1gxnvh09V/vL
	 A2Mhy9CPYjN2LN5sd+MxY1Ubv8KRfNniU1n0hvPgeI7qengj54mZObQHfaHAX7Ri4Z
	 X2vY7mEv7P9yA==
Date: Fri, 1 Sep 2023 13:54:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v4 2/3] ASoC: wm8580: Remove trailing comma in the
 terminator entry
Message-ID: <baefefc8-55d7-430a-9ec5-2c17c4577d11@sirena.org.uk>
References: <20230901065952.18760-1-biju.das.jz@bp.renesas.com>
 <20230901065952.18760-3-biju.das.jz@bp.renesas.com>
 <ZPGmiWDErxnjGlMR@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NhC2TJUJTC94pOK8"
Content-Disposition: inline
In-Reply-To: <ZPGmiWDErxnjGlMR@smile.fi.intel.com>
X-Cookie: Dealer prices may vary.
Message-ID-Hash: 5SZRVAPTJZNFRIKNHENTAYBGFLMB5JGO
X-Message-ID-Hash: 5SZRVAPTJZNFRIKNHENTAYBGFLMB5JGO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5SZRVAPTJZNFRIKNHENTAYBGFLMB5JGO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--NhC2TJUJTC94pOK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 01, 2023 at 11:53:29AM +0300, Andy Shevchenko wrote:
> On Fri, Sep 01, 2023 at 07:59:51AM +0100, Biju Das wrote:

> > Remove trailing comma in the terminator entry for OF table.

> You are so fast :-)
> This will produce an unneeded churn as you touch the same line twice in a row.

So do reviews which focus on very pedantic issues like this one...

--NhC2TJUJTC94pOK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTx3yEACgkQJNaLcl1U
h9DZ1Af/XKzTgRf9dZvjRu0YrfdFEXCailhkaR0xnA2hJbJyVjTetgyEudatrdja
+sGgS1I9EpzJ3cMyLZMDXJcXY00bQsQ1iXFei4UEscCZIWxYLtOt4dQkwp7S9M+p
RbMQM3c19w+d5/3Hnv2wzCH6Lio8NRgfwBzckAQh4SEzx2Fid/WVb7mXJZnoZvRC
u17iGZD1Akha1zMppU5xvXmhUOL9qsC+e7Eoi11nGUDZsgeg6TvjMViEdAPN6vEw
YZO5EQHehyE2THEY+BpKeQf0nMjU8t7wcolkfRfBjNX+AA1VAUaBCWHbH7v/t0yC
5H6ugtuqPsuRTBPD5bcOcodfC3i3dw==
=mEvZ
-----END PGP SIGNATURE-----

--NhC2TJUJTC94pOK8--
