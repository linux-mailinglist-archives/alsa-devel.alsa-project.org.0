Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C16F32D32BC
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 20:33:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CDDF16D0;
	Tue,  8 Dec 2020 20:33:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CDDF16D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607456030;
	bh=CW97W/gl30N7Tnql+tuh176jP24e3MGWQGOTMcWXg7U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZuS0ELBQsiRIPHunRcsQdO8KaN4Mkof7BwUAG7zrKbHI+FKvi+gLL3Wbm/0i2tmfM
	 nt19IkMsvOE27gtRIRHdjURKnH+Q1p1Px3c7SiEVeFCPwt0Q5sKLNQhj6QNW4ZP0/n
	 UYGo3MoRFnU7vd0qLPQLkiDIaMzXTu9ix4o8Doqk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89B4CF80218;
	Tue,  8 Dec 2020 20:32:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B54AFF8019D; Tue,  8 Dec 2020 20:32:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A8C1F80130
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 20:32:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A8C1F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lV+2Iugj"
Date: Tue, 8 Dec 2020 19:31:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607455924;
 bh=CW97W/gl30N7Tnql+tuh176jP24e3MGWQGOTMcWXg7U=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=lV+2IugjN3UFo+knFDsSpVaQlyXTJ7I7B4tCE9kOPw7gmQx0vV7eOHPtPPodOjgIV
 xoH7XUFcQK7nVt0AY2KlJL0bnkW0WStPiC/nxVQYDqSjhzep7g0bZrkGYil3sKlMaU
 KpSGcWlSErt6QN6a/2GTsoIOPgh2lAYRXzeEbx/3J0Iq8mEyuasca1ufSlyvyRhor2
 ItPYYU3j0hsmW+qQjmi2qlDS/jz41/g96H4XF3TeyvbR+EdZSl4Xfz1OEMfQTKevTM
 Kyf7LNZ1uypSXCyC/Mkru0Adstn/0VC8YPfzGiqmC/hWWzeGTQ4RBWq6sDqrnn9cLx
 C7xFTYGlBhHMQ==
From: Mark Brown <broonie@kernel.org>
To: Codrin.Ciubotariu@microchip.com
Subject: Re: [RFC PATCH] ASoC: pcm_dmaengine: Add support for BE DAIs
Message-ID: <20201208193156.GJ6686@sirena.org.uk>
References: <20201202085838.1779525-1-codrin.ciubotariu@microchip.com>
 <20201208170422.GG6686@sirena.org.uk>
 <7ab6bffa-f88e-3e2b-287a-89eee2c01819@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sdJFN6SSISdF2ksn"
Content-Disposition: inline
In-Reply-To: <7ab6bffa-f88e-3e2b-287a-89eee2c01819@microchip.com>
X-Cookie: Do not dry clean.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com
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


--sdJFN6SSISdF2ksn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 08, 2020 at 07:26:35PM +0000, Codrin.Ciubotariu@microchip.com w=
rote:

> I do not know too much about the dummy PCM. It seems like it is creating=
=20
> a card without DPCM links and fakes a buffer, which is not quite what I=
=20
> need. I will investigate more.

Right, that's what I was imagining the second runtime you proposed
looking like.

--sdJFN6SSISdF2ksn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/P1KsACgkQJNaLcl1U
h9D/hwgAhqvbHaR1KfxYUOgR8OYqIZ8t+Sk/p3dxSXSsUEyD3k/fio5ln55VJvCH
bif2/LJGtu1Vzk0h0PI+cq09SbWx4gxgxrDC8j9BpAKQ4ETpDLqVIbqIPGWV6ENO
Rf5LQa0so/cWjlVfSKtvLZb03OoJTttL1irv+4/ZhpZUmQVSB1rrAf32tX8aenwz
jmn0Iz7Y5yfAxrXSA9siwgXDYbQt9rusqXKebVY4QCZKuZHXEJ7PbRZHg1ez1irq
NlSM4GbsRFYgqlfKHx3tUmuasVDRA78FdwVx0b7GwyXUSyNrQ3VfblzoXaUdcYIv
iPOtzRyuvSMDgcJDs6htIqfIPofnTA==
=tjP1
-----END PGP SIGNATURE-----

--sdJFN6SSISdF2ksn--
