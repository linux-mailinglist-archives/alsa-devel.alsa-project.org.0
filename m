Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3ABD7EBF
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2019 20:19:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC5AF1616;
	Tue, 15 Oct 2019 20:18:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC5AF1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571163541;
	bh=WyFnB5W9Iv0G9OZS0wwS99JJqwrKNsxpeFmJYTVcVz8=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fWrcyjw5BasNg5dnSc98F+11YW5lQhRszzXFB9wDxbvSYhEWOSwScORlvXSuVMgTf
	 OV74sTySI+SgURFQ1TxDeJfhBNJE9km7WYWUxVNjaFPX6SwySv7Z/0s+tSk3gJsabo
	 k0cXAswRD2bPC+MUD0B6YNBjKcAhiMVrE1Xo29Kc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 969EEF804AB;
	Tue, 15 Oct 2019 20:17:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1F52F8011D; Tue, 15 Oct 2019 20:17:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=FREEMAIL_FROM, PRX_BODYSUB_18, 
 PRX_BODY_30, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDC5EF8011D
 for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2019 20:17:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDC5EF8011D
Received: from ladybug (unknown [37.165.241.96])
 (Authenticated sender: subscript)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id B3F6319F5D0
 for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2019 20:17:08 +0200 (CEST)
Date: Tue, 15 Oct 2019 20:17:07 +0200
From: wwp <subscript@free.fr>
To: alsa-devel@alsa-project.org
Message-ID: <20191015201707.29a7f547@ladybug>
In-Reply-To: <1795449400.2217618.1571067909254@mail.yahoo.com>
References: <mailman.1096.1571065442.5591.alsa-devel@alsa-project.org>
 <1795449400.2217618.1571067909254@mail.yahoo.com>
X-Mailer: Claws Mail 3.17.4git48 (GTK+ 2.24.31; x86_64-unknown-linux-gnu)
User-Agent: DOH
X-Face: 9x'hO=<A?%6*-4(@CJIAZa76:2U]#n7hu##-c.@?as>puy,
 x7GILB]CjB5[R"/@e8LHs#mq
 :>z.ziF; S^1k#Q&M7o"]ff+U|,o2]03`:m[B3N_TSP-p(:x[Y1s/|"AP+~kJ(>>>B7cC]URQW}Cf5R
 [.$i$]W/Cms{l]itD;=B&F6fPm1GF4
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAAFVBMVEX9x7aws4vD
 2ekyQlOrRVP//////f9jDrkCAAACMElEQVQ4jVWUy5KjMAxFzYTKGhEXezvVXg8x
 NesQXP0BU4XX2B3r/z9hJPHKeNHV0UEPX11QMx+kE+e5FPmvcEgdAAtH0MAHKFEI
 8iOtcYVzBcSIS6WUZCXs6AmcFT9GCXoI4ckgdy1wTEDBd+BzpZzkrHFzWXtE1AKG
 0GFube4OsCYE31OKBtuVbapYDxxvFNV637zjiVcglZ4y8g+l5fZ/wAkEvAVbUMDW
 +9KDgK7FDcSa45P/vQCA97o9mm9TqcqH5+TTa9cqLmHtnrxvqLk7wNZENZexIvAh
 +0UuEiaA2vef+1jCs+b2QzP5x5kREa6s4zQQY4A7SK5DHkBT/GW6IoD+xOyMw9s0
 Bu/9HzzBjDaNbpk0xWkofSxqjtbc/Xa+8caO2VbbOZJbzgD9HY9FJRFvPb3V3TEu
 qQrWUg7wtPkAWedMpkHrkETHc+d5tMnFghFn790HSNayl8hemSqRgw4A4MhslPND
 ldCUHfyl5hZaxwkkQ4eniGh4UHenDkjqnIBW1xraNzkut3iCsgvyiJaSyg4wmh0Y
 rrgCEoyaUqVdE//YAdUFl4/46gZV5Bq/UMTtbzD5fhsXMZD/xol1xdTAC7ep8A2g
 lLr5FtkVSl9XUMi4o1IVvRMMKgVP7k2mjjVn6GuR179q9Fj4ygojF4JvWTEN0qhw
 FcNhrBulR6nL7++o/NfqxJiCHtaGfKdL2L1LCjYS5dL0kTi+JXxzLPJDwMfXB7cG
 LDP/EvAPpzg/DzW8HhEAAAAASUVORK5CYII=
MIME-Version: 1.0
Subject: Re: [alsa-devel] Focusrite Scarlett 18i8 3rd Gen audio interface
 (Re: Alsa-devel Digest, Vol 152, Issue 150)
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
Content-Type: multipart/mixed; boundary="===============4604869561295641564=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--===============4604869561295641564==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/Kn8XEMpsQfgm1f6CifCDtL5"; protocol="application/pgp-signature"

--Sig_/Kn8XEMpsQfgm1f6CifCDtL5
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hello Hin-Tak,


On Mon, 14 Oct 2019 15:45:09 +0000 (UTC) Hin-Tak Leung <htl10@users.sourcef=
orge.net> wrote:

> =20
> > Date: Tue, 15 Oct 2019 00:10:28 +1030
> > From: "Geoffrey D. Bennett" <g@b4.vu>
> > To: wwp <subscript@free.fr>
> > Cc: alsa-devel@alsa-project.org
> > Subject: Re: [alsa-devel] Focusrite Scarlett 18i8 3rd Gen audio
> >=A0=A0=A0 interface
> > Message-ID: <20191014134028.GA11018@b4.vu>
> > Content-Type: text/plain; charset=3Dus-ascii =20
>=20
> > Hi wwp, =20
>=20
> > On Sun, Oct 13, 2019 at 10:20:30AM +0200, wwp wrote: =20
> > > Hello,
> > >
> > > I've recently bought a Focusrite Scarlett 18i8 3rd Gen audio interfac=
e,
> > > great device, but in CentOS 7, with either the available 3.x or 4.x
> > > kernels,  =20
> > ... =20
>=20
> > > Of course, adding the 0x1235:8214 USB ID to the quirks just doesn't
> > > work. I presume there's more work like the patch submitted here (I saw
> > > the archives) in the "[PATCH RFC V2] ALSA: usb-audio: Scarlett Gen 2
> > > mixer interface" mail thread? =20
>=20
> Have you tried treating it as a 18i8 2nd Gen device first, at least?

Yup, didn't work.


> FWIW, I had adapted Geoffrey's work as a DKMS module:
>=20
> https://github.com/HinTak/sound-usb-dkms
>=20
> But you'll still need to be running as recent as a 5.2.x release kernel t=
o use it. It just makes it easier to play with the code without recompiling=
 the whole kernel. HTH. 3.x and 4.x is definitely way too old!

That won't be for me for a long while, then, no spare time enough to
deal w/ kernel 5.x here.


Regards,

--=20
wwp
https://useplaintext.email/

--Sig_/Kn8XEMpsQfgm1f6CifCDtL5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJdpg0jAAoJEEnFZ+hWA4VJ72cP/R+2GxIuMMtBBB2D+uKWkY5g
kHHrlTUum1SlwLFXGCGD4RzpWUfsWENrn9fo817A1504lKrzc9XVkGXiYfs0BM/+
8frMk1rwV3TsX7m49lbncf0LB0SqizEU9Ltb7gxWA0UhMAsCvlTnmYFntEtxhx8R
Ya5D4ZkPVotvkmYRD3CUt9Jg5wzSdbSDByY6lIs85Z0J5yhhdQTQryzcgsvqYjhd
5pOV5JqmqgTcQCJKSB15V1mykSxahLR3XqK6kkRi8RXlvc81/5Stim0QYqwgF9ns
2ooosRBIkTsnndi5TlUTpsDhOYyRNB4Dzwkn0TcOPE5Eu9K+rehm78vx+Kck1Lxm
luvvaIBWaDLOudH5AzZR4fJXiPF+8MYqzRRZd8RjUgl3q0+nfqlr+vXeWgFU8DgR
eQr75q6FIixcEVwdiH+k2oHm9jt8N4u8K1p32nDddDZSZjJnNN94QFfRAeiTU1E8
ezfaaCxSGVuNuVP6n3VeTs94HoMOgXID2TGAC1sJyInE4OOhuepvdXfxdpLl3BCF
Uq+ruKKUVH44Xdc4iTzQnUrI3EFcCjugN5kKpq/GmbtEtzOZg4pA2gVfwLkp6K2q
ao5XXCak1quutqY6KMI6gTHd/Rzr4ntyYLHeLlrKxMpQjJSNcjIz+zlDWvD/ExGb
nCD5EXvWZvp0Fnx0BT80
=Skdi
-----END PGP SIGNATURE-----

--Sig_/Kn8XEMpsQfgm1f6CifCDtL5--

--===============4604869561295641564==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4604869561295641564==--
