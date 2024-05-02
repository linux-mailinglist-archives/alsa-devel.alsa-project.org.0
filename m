Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6CA8B97A3
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2024 11:26:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B724A86F;
	Thu,  2 May 2024 11:25:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B724A86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714641960;
	bh=L+8MSxbbC4GA7RzAdnfcmEm04PpjGSEE0FJmumIjkUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gluojykkSPEeRsTF5NZs3w3F52zp5bRC/8mcn7Pevgtt4NXBX5StpHnqgUH/6qvxP
	 254s0nRaGgPunVuzAh1B231c+7esXXas72EQNYORieN5yxiHZiy5FQzStu0l1XC4Jo
	 b4TNcOhw/yRaeECb/dID7ScvhOBxDGmB+qD+5iGI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08EA5F80588; Thu,  2 May 2024 11:25:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73535F805A1;
	Thu,  2 May 2024 11:25:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0A54F80266; Thu,  2 May 2024 11:25:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5ABD2F800AE
	for <alsa-devel@alsa-project.org>; Thu,  2 May 2024 11:25:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5ABD2F800AE
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1s2Sgk-0001lU-P1; Thu, 02 May 2024 11:25:14 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1s2Sgj-00FUhj-Vr; Thu, 02 May 2024 11:25:13 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1s2Sgj-00Daal-2t;
	Thu, 02 May 2024 11:25:13 +0200
Date: Thu, 2 May 2024 11:25:13 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, kernel@pengutronix.de,
 Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ASoC: codecs: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
Message-ID: <6uj2suuiu7tpomecii65f5lxuwgkhxnqs3lrpa54s2ptsorkh3@lzmnapdw4cri>
References: <20240502074722.1103986-2-u.kleine-koenig@pengutronix.de>
 <CAHp75VfTzbQaU-i5VTeh3aZ0KSyNu8Xnbkr1PMvAty=rLQ0oVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6hbkefkyasb7fug6"
Content-Disposition: inline
In-Reply-To: 
 <CAHp75VfTzbQaU-i5VTeh3aZ0KSyNu8Xnbkr1PMvAty=rLQ0oVQ@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 4H4BL7JMNJJDLDKXFWOARN4RXKV2LWC5
X-Message-ID-Hash: 4H4BL7JMNJJDLDKXFWOARN4RXKV2LWC5
X-MailFrom: ukl@pengutronix.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4H4BL7JMNJJDLDKXFWOARN4RXKV2LWC5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--6hbkefkyasb7fug6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Andy,

On Thu, May 02, 2024 at 12:02:50PM +0300, Andy Shevchenko wrote:
> On Thu, May 2, 2024 at 10:47=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> >
> > These drivers don't use the driver_data member of struct i2c_device_id,
> > so don't explicitly initialize this member.
> >
> > This prepares putting driver_data in an anonymous union which requires
> > either no initialization or named designators. But it's also a nice
> > cleanup on its own.
>=20
> There are some drivers that have other (than I=C2=B2C) ID tables, which
> follow the same format. Can you also do the same with them for the
> sake of consistency?

I'm aware of these and plan to address them in a separate quest once I'm
done with the i2c bits.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--6hbkefkyasb7fug6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYzW/gACgkQj4D7WH0S
/k6TEAf/cw0zTMhVbRaMJYPm3VRPiLAt22Znb0NVIN/ufUGYr42GXzCYXb0OQFOd
4hPA8IzOqykKjp2ZE2oDKEUfA/I8xhBJNSFtiKmVaKgq3VqMNY+hgVSLTeJvENbX
fDJqWLPd9x1sIDjAzIymZQLC+y3OmL/iXfaoaez31Oc4RRHsRhLyombWapJz13jz
CVdaBQMNq9gztxt8iXiaBcws9mabQJdkrzeC7Fv+RzlnTfnTI5T8teN8N3AqBBVP
JO9hISzB2cgrhUrqvYgFbeMjqfFq7QEpQZMNTbZYajJLB7P+l1rMZVN4K/pxD3wt
YyHWQPa/UchR+EysxeN7f2vdtAK25w==
=emKf
-----END PGP SIGNATURE-----

--6hbkefkyasb7fug6--
