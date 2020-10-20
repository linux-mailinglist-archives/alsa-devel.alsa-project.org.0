Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1DE28DABB
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 09:56:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 882EC171F;
	Wed, 14 Oct 2020 09:56:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 882EC171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602662210;
	bh=OfYADyjwePrmJMvKMuxnl45AK9Rq8OsNBbfSIof3yWM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HDHCZLO+wWhxlw72CVyFmd1oOjOT8qGeOSU7+6GMJ9qyJZ6v03XyEWXSqrhk7W6XS
	 QZB23miRWSXrWgNav62tcSNBiWIBrCoGtXaebf0vuUyky8hOyWwPBd5FjOYj3N8UZJ
	 JVKejgz6m161uWgb/Q8EUSh8rFWYQRWkQbEh2TG0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 006CDF8021D;
	Wed, 14 Oct 2020 09:55:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 186C1F80217; Wed, 14 Oct 2020 09:55:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=PRX_BODY_72,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C8D9F800F6
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 09:55:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C8D9F800F6
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id B40CA1C0B87; Wed, 14 Oct 2020 09:54:59 +0200 (CEST)
Date: Wed, 14 Oct 2020 09:54:59 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: disabling CONFIG_LED_CLASS (SND_HDA_CODEC_REALTEK)
Message-ID: <20201014075458.GA29881@amd>
References: <43b79598-1592-683f-46df-9e5489110780@infradead.org>
 <6fd1e91e-19d0-6682-dfc6-49f1cd60408b@infradead.org>
 <3c6d174c-30db-3d03-3d16-42df405f38d9@xs4all.nl>
 <58e774c5-fc80-2060-2091-9a6398582cc5@infradead.org>
 <9fc679e9-e9a9-ad80-b24c-f04489b98aa7@xs4all.nl>
 <27e159be-4376-e87b-5e60-803bc3749ec2@infradead.org>
 <eadc23e7-b383-e2fc-6e20-ed22745d0bfc@xs4all.nl>
 <2739e1fd-75c6-4e43-cd79-9028479f91bf@infradead.org>
 <1e6b1961-9e9b-5f82-86a1-bf838cb68f55@xs4all.nl>
 <d7774b58-caf5-5bd8-845d-a5d45aaef4c6@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline
In-Reply-To: <d7774b58-caf5-5bd8-845d-a5d45aaef4c6@infradead.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: moderated for non-subscribers <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Udo van den Heuvel <udovdh@xs4all.nl>, Dan Murphy <dmurphy@ti.com>,
 linux-leds@vger.kernel.org
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


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>> I.e.: it looks like I will lose some funcionality when I disable
> >>> SND_HDA_CODEC_REALTEK.
> >>
> >> OK. At present you can't have it both ways, i.e., SND_HDA_CODEC_REALTEK
> >> with no LEDS. That driver apparently wants LEDS.
> >=20
> > Thanks but why have I gone for years without LEDS?
> > I do not need LEDS, I do not want LEDS, I do not have LEDS (that are
> > visible, usable, etc).
> >=20
> > Please make this selectable instead of forcing more bulk into my
>> kernel.

LED core is not that big, and this avoided some rather "interesting"
hacks IIRC. If Udo wants more config complexity, lets first make him
measure the benefits, second submit a patch.

But I'd suggest to just live with it.

And yes, we should probably get rid of "CONFIG_NEW_LEDS" symbol. That
one is actually useless.

Best regards,
								Pavel
							=09
> and this Kconfig entry:
>=20
> config SND_HDA_CODEC_REALTEK
> 	tristate "Build Realtek HD-audio codec support"
> 	select SND_HDA_GENERIC
> 	select SND_HDA_GENERIC_LEDS
>=20
> it seems that LED support is not always wanted (please see above).
> I.e., user(s) would like to build a kernel without LED support at all.
>=20
> Can you make it a build option?
>=20
> thanks.

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl+GrtIACgkQMOfwapXb+vIBRACfToWfcNk9AdXdXG4zZ7i28/s3
4/wAn0pgJoPXjHt0MDaxgLcMMwqmrHhJ
=JHTM
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
