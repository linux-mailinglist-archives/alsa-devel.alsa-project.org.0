Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1138789DBC
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Aug 2023 13:56:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EC2DA4C;
	Sun, 27 Aug 2023 13:55:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EC2DA4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693137393;
	bh=zZLjSWjt8zgtA7kuN6rA1CWcPJnkeDr98yIZPBk+4TE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RM3wRgENEX3jz3qrwvdsXXzGL81xswy/FOQ+flxjMjjk6iF4NgfwXc/AB3DOhSRCX
	 Ulamxhft9My45AhoclPcY5AtEOZF8TnlyE3TDLFagWAai+lJQeNHYgJToIAidhNY92
	 TTLAJZAmjruMwa6S3uZgUeVLsx5Q/elBYouTjt64=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 899B9F8055A; Sun, 27 Aug 2023 13:55:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AC28F804F3;
	Sun, 27 Aug 2023 13:55:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28021F80527; Sun, 27 Aug 2023 13:55:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5216F8032D
	for <alsa-devel@alsa-project.org>; Sun, 27 Aug 2023 13:54:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5216F8032D
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qaEM5-0004vb-U2; Sun, 27 Aug 2023 13:54:57 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qaDP6-001xBc-Fu; Sun, 27 Aug 2023 12:54:00 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qaDP5-00GTv6-PX; Sun, 27 Aug 2023 12:53:59 +0200
Date: Sun, 27 Aug 2023 12:53:56 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: kernel@pengutronix.de, alsa-devel@alsa-project.org,
	Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: hda/tas2781: Switch back to use struct
 i2c_driver's .probe()
Message-ID: <20230827105356.4i3jd4bedmbifx3b@pengutronix.de>
References: <20230824200219.9569-1-u.kleine-koenig@pengutronix.de>
 <87fs478syq.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="idp7vpvrrui4iwje"
Content-Disposition: inline
In-Reply-To: <87fs478syq.wl-tiwai@suse.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: DNUSJ7S6NP32THHFPXPZ2CJMTWXFUYCX
X-Message-ID-Hash: DNUSJ7S6NP32THHFPXPZ2CJMTWXFUYCX
X-MailFrom: ukl@pengutronix.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DNUSJ7S6NP32THHFPXPZ2CJMTWXFUYCX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--idp7vpvrrui4iwje
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Takashi,

On Fri, Aug 25, 2023 at 09:46:37AM +0200, Takashi Iwai wrote:
> I completely forgot this rename, sorry for that.

No problem. I don't expect that every maintainer is aware of the
pendinging conversions. I'm happy that you applied the fix in a timely
manner. Thanks!

Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--idp7vpvrrui4iwje
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmTrK0MACgkQj4D7WH0S
/k7T3Qf/XJrB1BTcD4VJIPrTH5wX/00ijgeply//cBSUB0KKHzCN/mimZb0PMyfI
UTCz/vjTI6bES6kHu+gFXET78jjJldKIoASIbZCnw7LEMw4r97UEDSi33316FG99
JAjDzwnCeBezOGWgsYDDeBhz+t3vQyFsUgEa4xpkqxagXT8oLe5Y0wza7WvITwhz
xWNlysQOv+daJLJblKaYWGumft0sLiKnODEphbtnXgFizJfBu51YIBYVfi6bSnQq
dwaEJlDwiAx8wLP1OIXessfdgESkCQgkQ9DUK6oePQunb1+PKWxklBRr3u2xKZEh
Rb8XIO7vtx/OSz5iLAv27/F1JPjzaw==
=Hb0h
-----END PGP SIGNATURE-----

--idp7vpvrrui4iwje--
