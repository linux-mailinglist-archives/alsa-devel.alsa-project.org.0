Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 887C88FF432
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2024 20:02:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67FCD1D9;
	Thu,  6 Jun 2024 20:02:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67FCD1D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717696962;
	bh=rLHR1mdRF8Q7kTfSQyHdMtwG40Yu6O42W8bLyqZDcxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ma1Qqs2xRXOLOGGg0QCdxiyfQoAXW4Bm++s8LmyuST/HtSA9fTgNxtxdO8g7NK88y
	 EZj6kSPwH3epGErjxff5BZ8+oiR74U2X4I8OO4KhPDbKhajIp+5seN9/810wWGWaaJ
	 tDNymxERjc/Jo4yR9bNKsjNCDnu0px1AkWm99Pv8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81E35F80171; Thu,  6 Jun 2024 20:02:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 28954F804E5;
	Thu,  6 Jun 2024 20:02:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4709BF804E5; Thu,  6 Jun 2024 20:02:06 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 64BC9F80171
	for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2024 20:02:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64BC9F80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UIpCVqph
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AC8B0CE1312;
	Thu,  6 Jun 2024 18:01:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7F93C2BD10;
	Thu,  6 Jun 2024 18:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717696915;
	bh=rLHR1mdRF8Q7kTfSQyHdMtwG40Yu6O42W8bLyqZDcxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UIpCVqphcYjSEj+73lmEvNqoYnS/NNAicw0VJZPiKYDgV82T0Pbn+StfgQkcLIDOf
	 itAC+fMT6O4Tj8YbFgI65olho7G6t9v0pFikZkNybUhJrznUYAIpNlo5+ghpWHN0Ed
	 erwy4JHmQb2wY904gfPFd5F//tsoESm5pBhpbZ6tJTsi/jsSHs6uSCsiHQd5gAnuTt
	 UPu332a1kyODyFB2YiXBR32IjZja5nTHf8SUEsxHDkdwx8SMph64RAkPNdBA3/4JOn
	 38xYriHsoWTnvViR34Z+5gCm9a4Eeg1B/84EpEl98Vgnx0IcJOSmVzqP3LT+nfM0nB
	 T1nmu3iQLBSig==
Date: Thu, 6 Jun 2024 19:01:49 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@gmail.com>
Cc: Primoz Fiser <primoz.fiser@norik.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: Re: [PATCH] ASoC: ti: omap-hdmi: Fix too long driver name
Message-ID: <71d7754e-f72c-4a04-b03e-a0ee0e24c9e0@sirena.org.uk>
References: <20240606070645.3519459-1-primoz.fiser@norik.com>
 <dac7fba4-c7e3-4be9-8072-625d723e6cf5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r1jMZGoX0bjt5dhf"
Content-Disposition: inline
In-Reply-To: <dac7fba4-c7e3-4be9-8072-625d723e6cf5@gmail.com>
X-Cookie: Simulated picture.
Message-ID-Hash: WHPX5KMIWHV56VEVH633SWBA7AVCLJH4
X-Message-ID-Hash: WHPX5KMIWHV56VEVH633SWBA7AVCLJH4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WHPX5KMIWHV56VEVH633SWBA7AVCLJH4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--r1jMZGoX0bjt5dhf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 06, 2024 at 09:00:47PM +0300, P=E9ter Ujfalusi wrote:
> On 6/6/24 10:06 AM, Primoz Fiser wrote:

> > -	card->name =3D devm_kasprintf(dev, GFP_KERNEL,
> > -				    "HDMI %s", dev_name(ad->dssdev));
> > -	if (!card->name)
> > -		return -ENOMEM;
> > -
> > +	card->name =3D DRV_NAME;

> I think it would be better to name is simply "HDMI" instead

That does seem a bit more user friendly.

--r1jMZGoX0bjt5dhf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZh+YwACgkQJNaLcl1U
h9DkCAf+JXtwlhN6eFOr73JPv20Yks83kzwet2NPTrWQDbj97XD+8BI81dHoMB9+
gR3bo5kQMZ3x9SlEzXM20YpMhdZP5YCduTPywx3AHXflTkdxE52dDVpsSy8O9THq
uZzS/OMFKUmX+0YNa14dc2W9dFAsH52PT8c5G5sejFRVhNzj3/7cZCEj8RoeGlHc
AeI9toTJD2SqJlICBEibE4//YPE1A0YB92zAznfE4dOJUeuSVcc3aBP0II2u90K3
xPUY6j6y6fb2rhzjLgDyo7uOjgCiDbzOfypL1tjbuLsX1ekrZSXpnBGuEx8Pi1pn
Dhg7QZQfMWDw0C8KZScwu6XN//zwWg==
=OOLJ
-----END PGP SIGNATURE-----

--r1jMZGoX0bjt5dhf--
