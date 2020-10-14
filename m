Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E835228DB78
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 10:29:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 766F2173B;
	Wed, 14 Oct 2020 10:28:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 766F2173B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602664188;
	bh=Sp7BlvNObh6W+7SXG++vkSt7dO9ax3p/81HovDHjaoQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bneG29BqFiF9MD9/2eCfsFG0tdZUwI1/J3+cHfXo4VRFFGJsLjJ2KOlbmaD3vq8Jt
	 4pIz9rzPf/6GhUZB7A2SvnDqmfAx6YXPFiM3nPcOSsyUb4dZUzU9aIlzCJc9SMiTjD
	 FmHBAlqm8Aa0lD26PXjr+sxOIhynMrBkoR3VLVeM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFBC9F800F6;
	Wed, 14 Oct 2020 10:28:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D12BF80217; Wed, 14 Oct 2020 10:28:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09DC2F800F6
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 10:27:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09DC2F800F6
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 75E391C0B87; Wed, 14 Oct 2020 10:27:53 +0200 (CEST)
Date: Wed, 14 Oct 2020 10:27:52 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Udo van den Heuvel <udovdh@xs4all.nl>
Subject: Re: disabling CONFIG_LED_CLASS (SND_HDA_CODEC_REALTEK)
Message-ID: <20201014082752.GA31728@amd>
References: <eadc23e7-b383-e2fc-6e20-ed22745d0bfc@xs4all.nl>
 <2739e1fd-75c6-4e43-cd79-9028479f91bf@infradead.org>
 <1e6b1961-9e9b-5f82-86a1-bf838cb68f55@xs4all.nl>
 <d7774b58-caf5-5bd8-845d-a5d45aaef4c6@infradead.org>
 <s5hblh5mele.wl-tiwai@suse.de> <s5ha6wpmei5.wl-tiwai@suse.de>
 <20201014075853.GB29881@amd>
 <056a8933-378f-30f2-c7af-5514d93d3c36@xs4all.nl>
 <20201014081116.GC29881@amd>
 <2be6e184-97d4-a2b1-a500-6ea3528cff37@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline
In-Reply-To: <2be6e184-97d4-a2b1-a500-6ea3528cff37@xs4all.nl>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: moderated for non-subscribers <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.de>, Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
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


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2020-10-14 10:22:01, Udo van den Heuvel wrote:
> On 14-10-2020 10:11, Pavel Machek wrote:
> >> It's a computer, not a disco-light or anything like that.
> >=20
> > And you probably have numlock LED.
>=20
> On the case? no way.
> It is on the keyboard, a separate device, and already has a function.
> We also have a caps lock LED and scroll lock LED there, with separate
> functions.
> I do not need 'extra' functionality for those.
>=20
> > Additional config options have costs, too, and we don't want to
> > support gazillion config options.=20
>=20
> That is not the issue.
> One should have thought about stuff beforehand.

We did. And decided this is best solution.

> The non-selectability is not my fault.

It also does not affect you in any way.

Feel free to go to the mic LED discussion to see why we did it like
this. Then you can come up with better solution for problem at hand.

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl+GtogACgkQMOfwapXb+vKayQCdGTNvHRcPHVDdAHQuiZy/dWhE
ODEAn24xZ2THmW5GhEwvQEVN6M8lSC7g
=Hwxk
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--
