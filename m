Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EE364D19B
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 22:11:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D95B2A17;
	Wed, 14 Dec 2022 22:10:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D95B2A17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671052298;
	bh=YWKjEgTOYbXP7q/hLRB4FofNTJwPX9m91aKD0i0JUf4=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ukyQUMRU+/Io26DA+1KGyMbdTQOiqP4xB6mpMSYzIam5RXARrehDffQ9dRgh40Fqf
	 aKZUwaRT9SG4F50sZXLJ8RMQZrOVw2jWTTqifmaTxi8eoyW0S7ZQ5+otvTHYX6RljB
	 SJ3qJYuMGxscjvJOdDdigrCXOvrxxoWIC1raKusw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 217D3F80141;
	Wed, 14 Dec 2022 22:10:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFFBDF804D7; Wed, 14 Dec 2022 22:10:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43197F80141
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 22:10:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43197F80141
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256
 header.s=phobos-20191101 header.b=uBILq3Xz
Received: from wsk (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: lukma@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id DE2638431A;
 Wed, 14 Dec 2022 22:10:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1671052237;
 bh=7dtoXhtnaVnh5Z6efBy24a1ZLt8Pv0Iv7af81Gd4QuA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uBILq3XzKI4YnEVM8OoAWrXo5syr0ROMYUdDCd9dCvnuM6DsvgLZYJAEmSdkCBhv9
 wzHG97dppQHK1UFEH+uX22ntqB0VfeT9EJPPj9V+mVJgqnh4rReITpeFumBBpyVElo
 jT1MHTi6iasa7hWGmvURynWGXu9EyffDyYKr5uMAolMv05joXuXu+YO1Ya32277WDR
 WjEWW0J0OjGbZWId+xEVlEDbxbmcvOCNcTS5Y6w0LX8Kzq7PbSUbwklNaxMrkxUuUz
 yGRHtuPfJO8SXfofEUCrtT9l0jiL0vR8q5dOJVBkmBEG2oXvmaKbcy4AeOxBAGD773
 qvivIUN3qDMbg==
Date: Wed, 14 Dec 2022 22:10:35 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/4] ASoC: wm8940: Rewrite code to set proper clocks
Message-ID: <20221214221035.25347427@wsk>
In-Reply-To: <Y5nWEPTDenOIrXFY@sirena.org.uk>
References: <20221214123743.3713843-1-lukma@denx.de>
 <20221214123743.3713843-3-lukma@denx.de>
 <Y5nWEPTDenOIrXFY@sirena.org.uk>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QNpDM0lSQp3YUsIs1hh5dY5";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Stephen Kitt <steve@sk2.org>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--Sig_/QNpDM0lSQp3YUsIs1hh5dY5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mark,

> On Wed, Dec 14, 2022 at 01:37:41PM +0100, Lukasz Majewski wrote:
>=20
> > Without this change, the wm8940 driver is not working when
> > set_sysclk callback (wm8940_set_dai_sysclk) is called with
> > frequency not listed in the switch clause. =20
>=20
> Your commit log doesn't actually describe what this change is...
>=20
> > This change adjusts this driver to allow non-standard frequency
> > set (just after the boot) being adjusted afterwards by the sound
> > system core code. =20
>=20
> This doesn't appear to correspond to the commit.  The change will
> result in the driver automatically configuring it's PLL.
>=20

Yes, indeed - I will update the description.

The problem with the old code was that after boot up - the frequency
was not in the 'switch' values, so the driver aborted in early init.

> > Code in this commit is based on previous change done for wm8974
> > (SHA1: 51b2bb3f2568e6d9d81a001d38b8d70c2ba4af99). =20
>=20
> Please include human readable descriptions of things like commits and
> issues being discussed in e-mail in your mails, this makes them much
> easier for humans to read especially when they have no internet
> access. I do frequently catch up on my mail on flights or while
> otherwise travelling so this is even more pressing for me than just
> being about making things a bit easier to read.

Ok. I will provide proper description.

>=20
> > @@ -496,7 +505,6 @@ static int wm8940_set_bias_level(struct
> > snd_soc_component *component, return ret;
> >  			}
> >  		}
> > -
> >  		/* ensure bufioen and biasen */
> >  		pwr_reg |=3D (1 << 2) | (1 << 3);
> >  		/* set vmid to 300k for standby */ =20
>=20
> Unrelated (and questionable) whitespace change.

Ok. I will remove it.

Thanks for the review.


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/QNpDM0lSQp3YUsIs1hh5dY5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmOaO8wACgkQAR8vZIA0
zr2Utwf+K6mHim7wUuBqEsORod1LhFNJ6FO47rpdO1WayfqWjVQJ28/0CbQ6ZpmZ
CuDzOvjP/T6+tfAVmIkrbqMI6JSpWZznbbWjO38SlymTriKKTh5sBWDIspRZ+mnN
WCUo+okBaeUgJqVCARMse+i8WpJWLAtMFaID6oV01cqcKPaw61yhECpw1U4v1sa5
uwZyr3SOVrZ40gK7xZIeVQzuQZ52GVPBr/VvweSwiOsgbKvjYECQ1TmZQYtWM3QE
FJAKbd8v5Ad/CPkH34KohoxCzQyl0B7GS+ImCr05LS9iDi78iwfVbA8XX0dB5LX8
pazkoNn8U1O3hhfKdxk4HK8NTYHbRA==
=kxtP
-----END PGP SIGNATURE-----

--Sig_/QNpDM0lSQp3YUsIs1hh5dY5--
