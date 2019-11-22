Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF7C107656
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2019 18:22:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44DB41811;
	Fri, 22 Nov 2019 18:21:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44DB41811
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574443341;
	bh=6tuFx6Xs6Rdz8fdGCbs1PZJKF6lT1MCm2IC2HjnmKt0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UOeq1IxLZPGJABVlMP7Js5tgfFxBRMTgwSkWrfIJxstBAcAWDARojxNGColMhknaZ
	 kdWO9vGJfh36mtXy2aRLW+oqFD5Gj9qUNLq51wbdwz0he+OviN0tBJuWzbCanCxy9Y
	 7mb7CXEZNCsSJO98EoeGvb4r5mY/RS2nJJcRyti4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1295F80140;
	Fri, 22 Nov 2019 18:20:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82DDCF80140; Fri, 22 Nov 2019 18:20:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15575F800EF
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 18:20:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15575F800EF
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id DE6C2291D1A
Received: by earth.universe (Postfix, from userid 1000)
 id 85EB63C0C71; Fri, 22 Nov 2019 18:20:29 +0100 (CET)
Date: Fri, 22 Nov 2019 18:20:29 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Message-ID: <20191122172029.spocjr762ojxie5n@earth.universe>
References: <20191120152406.2744-1-sebastian.reichel@collabora.com>
 <20191120152406.2744-2-sebastian.reichel@collabora.com>
 <AM5PR1001MB0994D2F45FA75E8285938191804E0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <AM5PR1001MB0994D2F45FA75E8285938191804E0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Support Opensource <Support.Opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [alsa-devel] [PATCHv2 1/6] ASoC: da7213: Add da7212 DT
	compatible
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
Content-Type: multipart/mixed; boundary="===============8684055170242120015=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8684055170242120015==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tysshi4s2jnkbg3v"
Content-Disposition: inline


--tysshi4s2jnkbg3v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 21, 2019 at 08:10:30PM +0000, Adam Thomson wrote:
> [...]
>
> >  Required properties:
> > -- compatible : Should be "dlg,da7213"
> > +- compatible : Should be "dlg,da7212" or "dlg,7213"
>=20
> Typo? "dlg,da7213"

Ack.

> [...]

-- Sebastian

--tysshi4s2jnkbg3v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl3YGNcACgkQ2O7X88g7
+prT3A//SdxIQx4L3dfQzpv+3LGWycvNn4B5b2ZV5zcwDVJV+vdONMLtwDR+2clL
MDjh3nDty/JesN5L5pTB30e6zIAJB2fnbfpmIqzztW8xxOO/COc24T8Y1LYU68og
VgaVTAPMY4O6zgF1th3FjLFC2h93vzvZZL69t+060bqbU5t+FFXopwOXpP4zby/S
4C/VtljyTNiLtgq+f8nqnqVlSddM/gKMQeHnA2AeQL8n3AFHRmtFiv6kNp13N+1g
FKisBHv/pwD7IPTvl7odDrYf2RWmptbVDGf5xFJl3SsbtwQ2zJfDHxQkcp1rfymZ
TbQgKgRlzSyHQpBaJiBYvAR+KzHiI5fBrZhw5F4XDKxjxeg8G7F9DdWell9ZUkfL
K0e6wVwGuntb/LXRo2TE3oDzXIJ9hzZwUeqCxxnOCR9pWRY2cp7tO3aaPpNa+DAg
z63KpwTyBvOd0n8jb85BdhA2hABJBw9cffGjhUEOxMOhcb/ngFJlhxrY67IIS4o7
2t9mZWmBcc9Y7BP2rSMGJsOnqJsD9EL6tFSkRlMbNovwBp7+eUgTG8AdrH7Iho0x
4JLiBts0EO4XzsdYhtYbZcjzyCxBtj3tVWFBBU3VDSJp4eAxtVLoDalSYgY/+sJe
BzY70BsifFGyR6EK1hSY3zGLUTNd5kfA3VXr5BYwcvgcKbtns58=
=Hzv+
-----END PGP SIGNATURE-----

--tysshi4s2jnkbg3v--

--===============8684055170242120015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8684055170242120015==--
