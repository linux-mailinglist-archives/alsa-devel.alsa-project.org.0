Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4378E28DAE1
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 10:13:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2B26171F;
	Wed, 14 Oct 2020 10:12:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2B26171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602663187;
	bh=AwWwMcXwz8FCWOwzuovuu0y4sl1ekzce4zv7taq1fKI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hcBLjI43VNTExH677xRCBDXmJgVly3RaD/XlFggDy0Vx7QCdDmnnMrZSlbtHWuc8r
	 gg9RWvRte3vKYn5SL6eDk7O9ciEYBICRsgrtFPoTUyHo9IUDn00VoDRK0wIUKzdX1M
	 YNc2Rx05Q5GRbNuvFA+uv2ASEknQCUKoUfYKHeng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C74AF8021D;
	Wed, 14 Oct 2020 10:11:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F28FAF8012B; Wed, 14 Oct 2020 10:11:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22082F8012B
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 10:11:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22082F8012B
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id B889C1C0B87; Wed, 14 Oct 2020 10:11:17 +0200 (CEST)
Date: Wed, 14 Oct 2020 10:11:17 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Udo van den Heuvel <udovdh@xs4all.nl>
Subject: Re: disabling CONFIG_LED_CLASS (SND_HDA_CODEC_REALTEK)
Message-ID: <20201014081116.GC29881@amd>
References: <9fc679e9-e9a9-ad80-b24c-f04489b98aa7@xs4all.nl>
 <27e159be-4376-e87b-5e60-803bc3749ec2@infradead.org>
 <eadc23e7-b383-e2fc-6e20-ed22745d0bfc@xs4all.nl>
 <2739e1fd-75c6-4e43-cd79-9028479f91bf@infradead.org>
 <1e6b1961-9e9b-5f82-86a1-bf838cb68f55@xs4all.nl>
 <d7774b58-caf5-5bd8-845d-a5d45aaef4c6@infradead.org>
 <s5hblh5mele.wl-tiwai@suse.de> <s5ha6wpmei5.wl-tiwai@suse.de>
 <20201014075853.GB29881@amd>
 <056a8933-378f-30f2-c7af-5514d93d3c36@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="qjNfmADvan18RZcF"
Content-Disposition: inline
In-Reply-To: <056a8933-378f-30f2-c7af-5514d93d3c36@xs4all.nl>
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


--qjNfmADvan18RZcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2020-10-14 10:05:42, Udo van den Heuvel wrote:
> On 14-10-2020 09:58, Pavel Machek wrote:
> > Contrary to his claims, Udo very probably has LEDs in his systems...
>=20
> We have a visible power LED.
> WE have a HDD LED.

> The board has LEDs, yes, but the SilverStone Fortress FT02 hides them
> fairly well.
> I did not ask for LEDs nor need them this way.
> It's a computer, not a disco-light or anything like that.

And you probably have numlock LED.

> Whether the code is big or not does not matter, it is a matter of being
> able to select what one needs without getting bothered with other code
> that will do nothing.

No.

Additional config options have costs, too, and we don't want to
support gazillion config options. LED core should be small enough that
it does not matter. Sound was inventing its own "tiny LED core"
before.

> So please consider.

I did. Answer is no. Please accept it.
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--qjNfmADvan18RZcF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl+GsqQACgkQMOfwapXb+vKstQCgxBdpLaykEQKd4ktnkUrUcz10
NwgAoLEJrV5eMh7YSG6O0cSOLB1wIHop
=1j4b
-----END PGP SIGNATURE-----

--qjNfmADvan18RZcF--
