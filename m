Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1CE12624A
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2019 13:39:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C1DE15F8;
	Thu, 19 Dec 2019 13:38:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C1DE15F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576759144;
	bh=RU6rsTYKcQXAkUk3nm5taDnBuxw/4IfIDbsNg29ezGA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M0vz8Y5sCnPLhQwokFeNkhF1iKAyYoabMVUAZ0Kxdg880cKfE2eQudAzXxSEbyIYk
	 KNIP7AN4M7czY3jDCQWIN4Fd7KIW3LZV6Pi98wXg4rM3MGoeUn38okv+Ur/au6OrMu
	 W7v3cFUwK/Bzk0dZzjj7Mb9+0XkvPpsyJX3u2VrQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB6D5F80234;
	Thu, 19 Dec 2019 13:37:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2591CF80234; Thu, 19 Dec 2019 13:37:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 173B5F8014F
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 13:37:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 173B5F8014F
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 069DB31B;
 Thu, 19 Dec 2019 04:37:13 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF9E83F719;
 Thu, 19 Dec 2019 04:37:11 -0800 (PST)
Date: Thu, 19 Dec 2019 12:37:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <20191219123709.GB5047@sirena.org.uk>
References: <CGME20191128152110epcas3p2b205b4b55f6d8bfac42fcb8faaade93c@epcas3p2.samsung.com>
 <20191128151908.180871-1-tzungbi@google.com>
 <8aceb9ec-aa6e-1fa4-cee9-e22084c141e8@samsung.com>
 <CA+Px+wXPa_cwdZUQfCx4jAhhj4Q9b7bNABUGazLKOJ7U5ae-mA@mail.gmail.com>
 <20191218132620.GE3219@sirena.org.uk>
 <f6453e48-cd95-6471-8945-4cc0ab3d04d9@samsung.com>
 <20191218162422.GG3219@sirena.org.uk>
 <ef908cb8-875e-4339-33bd-5997b594f022@samsung.com>
MIME-Version: 1.0
In-Reply-To: <ef908cb8-875e-4339-33bd-5997b594f022@samsung.com>
X-Cookie: I smell a RANCID CORN DOG!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Tzung-Bi Shih <tzungbi@google.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Dylan Reid <dgreid@google.com>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: max98090: save and restore SHDN
 when changing sensitive registers
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
Content-Type: multipart/mixed; boundary="===============5005153624770362242=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5005153624770362242==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i9LlY+UWpKt15+FH"
Content-Disposition: inline


--i9LlY+UWpKt15+FH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2019 at 09:03:42AM +0100, Marek Szyprowski wrote:
> On 18.12.2019 17:24, Mark Brown wrote:

> I've checked again the exact probe order and here is what happens in the=
=20
> system:

> 1. first call to odroid_audio_probe() is just after:
>=20
> [    2.942428] samsung-i2s 3830000.i2s-sec: DMA channels sourced from dev=
ice 3830000.i2s

> 2. That time, i2s dai and max98090 devices are already registered.=20
> However the snd_soc_of_get_dai_link_codecs() return -EPROBE_DEFER,=20
> because it cannot get the HDMI codec component.

> 3. HDMI codec is being registered when Exynos DRM initializes. This=20
> happens later:

> [=A0=A0=A0 3.127833] [drm] Initialized exynos 1.1.0 20180330 for exynos-d=
rm on=20
> minor 0

> 4. Then odroid_audio_probe() is called again from the deferred probe=20
> worker and succeeds:

> [=A0=A0=A0 3.501198] ALSA device list:
> [=A0=A0=A0 3.501300]=A0=A0 #0: Odroid-U3

> 5. Then userspace starts:

> [=A0=A0=A0 3.603825] Run /sbin/init as init process
>=20
> 6. when userspace init scripts (alsactl) enumerates devices in the=20
> system the lockdep warning is triggered:
>=20
> [   10.068990] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   10.070970] WARNING: possible circular locking dependency detected
> [   10.077136] 5.5.0-rc2-next-20191218 #7188 Not tainted
> [   10.082168] ------------------------------------------------------
> [   10.088332] alsactl/1106 is trying to acquire lock:
>=20
> 7. then alsa utils probably tries to load the saved values for the contro=
ls, what triggers the NULL ptr dereference:
>=20
> [....] Setting up ALSA...[   10.502672] 8<--- cut here ---
> [   10.502772] Unable to handle kernel NULL pointer dereference at virtua=
l address 000000b0

OK, so this is probably related to some of Morimoto-san's bisections.
Is there any chance you coudld do a bisect to try to isolate where
things go wrong?

--i9LlY+UWpKt15+FH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl37bvUACgkQJNaLcl1U
h9CEAAf/XSI9nZq2Qput3O4cSd2w21qYD50j3CftlQ347thnlUCneiNqxxLoWUIG
kNUK471Pr8mg+1sxXoyr6LUxFbFXLngFWkLW4ZJavXxqpPp88Sx9xXltUnp15grV
tGPqRfguiytnGnOxNdTNYrJ3UFlnO/3PzMTMc/624RTXclOPHkG+IfS0UnX+w58O
w65cgWyJXq6cI3PGkk3wkVJ148iYzIjRlNW9l3HOZF8uEXmmPK4mvuKZlgr9Jrdh
Zcbj0F+w0G9C7Ex8pWL9ZZoHQ7oxmCby3QLv6+vMUOvb2pfudDDOAKPyIc1C9f18
T1B3AMPS0eMM39HYyVYOwMbD7VmJIw==
=VJv5
-----END PGP SIGNATURE-----

--i9LlY+UWpKt15+FH--

--===============5005153624770362242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5005153624770362242==--
