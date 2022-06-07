Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D8553FE7F
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 14:14:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47FE01923;
	Tue,  7 Jun 2022 14:13:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47FE01923
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654604065;
	bh=5JkFnR71cOTWYJQ6NvHO61d7YOryVS1eFKJe4mDEwzw=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u3jCPe9R7GSj/xqOmo+kj/yYR2bKoXVg3YfeGr/+T39IwZ/CkBHBB3OU5S+S2hiSW
	 6atPcMNmXBeQbvZXI9CPrWxbbEClLVECTIttfX4PjVNNDyPYjLjs9bS3718CjlK7u2
	 htKtTCe4tdsVDcKZb4lphUFIjGbeYmmC9B7jo2dA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A79F7F80109;
	Tue,  7 Jun 2022 14:13:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 862B0F80159; Tue,  7 Jun 2022 14:13:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9917CF80109
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 14:13:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9917CF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de
 header.b="KWQWerxr"
Received: from ktm (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: lukma@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id CA4A280084;
 Tue,  7 Jun 2022 14:13:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1654603997;
 bh=6DJxzdyYxhsOo1jI8F27Eb9b6EKACn77Zrya8L9TOmA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KWQWerxr1yx7PzbFPPloUFtsWEYF01qdnfYVwlTzT+c4cZGi4O8cuaS3CgsntTLux
 Jz7dzJ7WTqYd/cdlSghVJfQmgOK6kpNkXNjSEhuN/jWJkZQ3F3DlYxzFZTfkbygBwO
 y6OOiyAq8U0dtYROUB2j69ZZs1ABN5PbavwBseej0k4TUla56BFjxL4nzU0pns0WYb
 tSHYOSWHyLtl4SlLqNWYOyYFaQNwu0qCHQuMt2QlgXXWKpU7Zzih3MHfc/k7SNz0bb
 HcH51p92JBukwDEUbMkKHbx2RgKaYt+Ew6dQyV44U9JmWU9w3cxWXJ5BRI6vQs3cuV
 pjLLYZt5Omfmg==
Date: Tue, 7 Jun 2022 14:13:09 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/3] ASoC: wm8940: Rewrite code to set proper clocks
Message-ID: <20220607141309.11ec7503@ktm>
In-Reply-To: <Yp4o2bQammYjv7Kt@sirena.org.uk>
References: <20220606154441.20848-1-lukma@denx.de>
 <20220606154441.20848-2-lukma@denx.de>
 <Yp4o2bQammYjv7Kt@sirena.org.uk>
Organization: denx.de
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/4rEM/pPsB1C0Pm5xN.cpDX4"; protocol="application/pgp-signature"
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org
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

--Sig_/4rEM/pPsB1C0Pm5xN.cpDX4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mark,

> On Mon, Jun 06, 2022 at 05:44:40PM +0200, Lukasz Majewski wrote:
> > Without this change, the wm8940 driver is not working when
> > set_sysclk callback (wm8940_set_dai_sysclk) is called with
> > freqency not listed in the switch clause. =20
>=20
> > This change adjusts this driver to allow non-standard frequency
> > set (just after the boot) being adjusted afterwards by the sound
> > system core code. =20
>=20
> I don't entirely follow the above - in what way might the core adjust
> the clocking, and why would we want to allow the use of invalid
> clocks? Surely that just makes error checking worse.

Hmm, it is a bit complicated.

When I enabed wm8940 support in mainline - the first call to
wm8940_set_dai_sysclk (the set_sysclk callback) required mclk =3D 11997070
frequency.

With the current code [1] the initialization of the codec returns
-EINVAL and the codec is not supported in the system:

asoc-simple-card: probe of sound failed with error -22



The approach used in this patch set to fix the above issue is based on
one already present in-tree for wm8974 codec.

>=20
> > Code in this commit is based on previous change done for wm8974
> > (SHA1: 51b2bb3f2568e6d9d81a001d38b8d70c2ba4af99). =20
>=20
> Please include human readable descriptions of things like commits and
> issues being discussed in e-mail in your mails, this makes them much
> easier for humans to read especially when they have no internet
> access.=20

Ok, I will add some more verbose description. The aforementioned SHA1
is referring to commit already in-tree, so you would find it easily
even without the Internet.

> I do frequently catch up on my mail on flights or while
> otherwise travelling so this is even more pressing for me than just
> being about making things a bit easier to read.

+1

Links:

[1] -
https://elixir.bootlin.com/linux/v5.18.1/source/sound/soc/codecs/wm8940.c#L=
614

Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/4rEM/pPsB1C0Pm5xN.cpDX4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmKfQNUACgkQAR8vZIA0
zr1yzQf+Ic5TypvIaPlaHw6Z1F/d/Q7prs+hM7NHROk2GxS5YsLfcbPTz8xF5F8m
6cIN/fgyjQkffpo/XFtPVCTVi+56qF28xuRVKoVzNp6cLdhyWgqz7nu0B35qJwIB
f6/u5qPS9OusTU4+S7QQ7W8b9vTtJMbl7TdpIu6p22Jht7f/3HFqLVL7Yk2SMN/+
5G6LVkxys6/bUWWJ5TjpfD7wAjkZ/61RQosk9oo6U57KtFaoYKJJtgUAzkKxkjBG
1+FVtTjCjn0imqwv4IU3ASU6ddedU6nrjyogBzl+yJls8drS3jH0TxnyfvCAUL41
2joIwXo5tiu8OPgIBctgJmSARrZ4jg==
=S3jh
-----END PGP SIGNATURE-----

--Sig_/4rEM/pPsB1C0Pm5xN.cpDX4--
