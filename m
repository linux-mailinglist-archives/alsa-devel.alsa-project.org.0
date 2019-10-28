Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1195FE7847
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 19:22:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7612420C1;
	Mon, 28 Oct 2019 19:21:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7612420C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572286937;
	bh=6sKGel42pvmr3SyyLGPYxPYWhsnrt+Z6BkEDg0s+S/o=;
	h=Resent-From:Resent-To:Resent-Date:To:References:From:Date:
	 In-Reply-To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JhDwoDCdoIS6UEpG1wX04hJa5WoJ5NiAtIeu1Bt7tvzDGC/nwMVEkzgQTieXpklNY
	 YDG02rUXcRjgI9iiUej+F8JDt2NcrDiui1Aitiq5zlw4ORGgyCNiaWI6jd9ufRxJP/
	 zN1Kd2xQAnh1vI7CPDEmnMbqVh10ds/afLvZthcQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CD5DF80361;
	Mon, 28 Oct 2019 19:20:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E121EF80361; Mon, 28 Oct 2019 19:20:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BBB7F8011D
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 19:20:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BBB7F8011D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net
 header.b="K/Usoc6H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1572286828;
 bh=KstxukntvnvjWGzM/h3AAw3uc80bLwTp9PQby3+mNlA=;
 h=X-UI-Sender-Class:Resent-From:Resent-To:Resent-Date:Subject:To:
 References:From:Date:In-Reply-To;
 b=K/Usoc6HluwyYMf7LyzzD2ypcKayo70ifd2WnnAJLqSj9fEMPYCzbXFZx40URuaee
 gG+lHtMErUw1STN8jM6EsbaDWk7argGKgE1lYoV9eZKPVqQ8XAUq+mwKoI+IacN44u
 QFw3quoI1ErPObzz5tm7OrPly+xUif2P4fSLX4+w=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.21] ([91.53.45.56]) by mail.gmx.com (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRmjq-1iZeFy17M2-00TDrm for
 <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 19:20:28 +0100
Resent-From: Jonas Witschel
 <diabonas@gmx.de>
Resent-To: alsa-devel@alsa-project.org
Resent-Date: Mon, 28 Oct 2019 19:20:26 +0100
Resent-Message-ID: <e32f42bd-0475-e50e-63ca-bc0bc616355b@gmx.de>
To: Takashi Iwai <tiwai@suse.de>
References: <20191028081056.22010-1-tiwai@suse.de>
 <157225086749.26808.5121664839140883561@skylake-alporthouse-com>
 <s5h8sp5mg67.wl-tiwai@suse.de> <s5h1ruxt9cz.wl-tiwai@suse.de>
From: Jonas Witschel <diabonas@gmx.de>
Autocrypt: addr=diabonas@gmx.de; prefer-encrypt=mutual; keydata=
 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
Message-ID: <5c6f5941-0b5a-926e-15b5-9521f0bc7ede@gmx.de>
Date: Mon, 28 Oct 2019 19:18:25 +0100
MIME-Version: 1.0
In-Reply-To: <s5h1ruxt9cz.wl-tiwai@suse.de>
X-Provags-ID: V03:K1:wtG1Y7zJ+YC1YZttMV9q4clK4XFLZ4IpE8j5VcIQQDk9ej6tzvv
 g8abmz8BvgXM1zf42OJuSResFTQ1ieYjalJaw2pz7pJ8n0ESowlh0Rp3zfGmcyv6KclUeoj
 kb2imQNJCEQhbRSLwfPvmMOKc5wWH4d0nhY0FL8c97vAzm3vIkw5clxuc18iLCvKES1wtia
 i9+XRXn1jMPyaRCpDZNOg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PCf1moT0F10=:Oz/z5YTDdtLlrWtxFTogab
 CS6TNt8U7rsuyGcOfDHLa+ESmetiXHPMz2DlkQmrQQOzw8GddbquGUGF72jCETli5HptwSPJp
 v6t+rumEqPvajFT404SEpKqexyssMy8uLyVzY4/zuvFvzWetgRoYvq4FRBe5JrMy8n2wMEYJj
 1+oepdThhe2wiGKnjwYcyP0V6toZvkgu1IGoVWuEMdcCXuP/yRBrOwANXF+7XiRHLAzVJVKSW
 JB/Yd4DmYKaEp8g+waY4lkvr8VybfDZNzBkSjVUJ3vFhK6PZ+7tCbZ4bgq2vMpCUXLEMkMEgz
 5UKSuiz+TO9rDkOAfRrzqRN2i9x/kTQxce6pglHPJdPAmTQTA5rr9XoGX1Ap6tSxGMtpJSX/O
 OXwlJ69d+VNYpcZt2xYtRgWxIMKKFpe97d+oa78VYIGw2zgUjqD1cmLySNwQkpev81zXr8UBM
 32lkS6CKRlWwy1szhS9D9GJon4CC1XOR98xSsxvv7OU8tkbui6jHeQmK6ZUEUh0lIp74WvfAy
 PneR5b86vkFX1YXg+BhvW8BYfEZmvFPJxT+3atGCbfnlKIcfhHbDlAuNDuCGy3KzbQVOXQ9zw
 r8t3mZ0wWjeiYdFabByIF6k4J7jD2WG+25wEIFiLjIN2KOMW6KcKz7JysPLCmzkV8Ex17Kt+p
 AWLzt9g7/P41JIhQgXXeK1VGgAc67baHUBSstQyWt5AY1l9InervMD0ynPVI41Tr+TWYB774V
 4GdZIQEiqcSaY6U5D6bxiL+NJII2/bSL+hElPDKtRtJ/BzeKihwnWJhr7bviVVoTG/X6n//Ml
 vB596eLQC71zCB4kCunzQlOI7HwN+4uVnV0Feh1pWH1FEKVeUZ/Vtc6bLikuJfKxHh7Rskd12
 5M3PHoGhSyFyWy41NTYHc6+ujIw7ka00/+mCTuAemCG9ug3t7aJXNIlSGOl9FUCoWvAiL4xWQ
 80k46ZphEFInwGO7rBBQg7O8eUaXgU49rE1E6l6sm5nR3fnwOvMkeA36rnMFNnVK4qCoEu16j
 k12bk9XXX0fV9e4FxH/VYUhr9gZtSdqxtdU3BieP2PW9pkpV83S3jL9ayirvUUOw4zBUrjpGW
 TTFCHZ9oDUvk9dyZmxOAIZVm6KazTxLc5tUJOxeQnDH9S4B5lMtPe19z5rwM7lShaROFbDZBW
 shi/tP+OmXVwleUud73hyHRelDUU52EAJy3Ta8yjudswMbvB+/rIpR+oTfaLKACx/N6ipE49C
 RGVoK1FCEnTbfLSnpibP8Kr/txkJLcs/ZVskmqQ==
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: Re: [alsa-devel] [PATCH] Revert "ALSA: hda: Flush interrupts on
	disabling"
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
Content-Type: multipart/mixed; boundary="===============3715022766366331271=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============3715022766366331271==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="P0wQbuHDUrKr2mb3bSBGNit9ToIlIqoUo"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--P0wQbuHDUrKr2mb3bSBGNit9ToIlIqoUo
From: Jonas Witschel <diabonas@gmx.de>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <5c6f5941-0b5a-926e-15b5-9521f0bc7ede@gmx.de>
Subject: Re: [PATCH] Revert "ALSA: hda: Flush interrupts on disabling"
References: <20191028081056.22010-1-tiwai@suse.de>
 <157225086749.26808.5121664839140883561@skylake-alporthouse-com>
 <s5h8sp5mg67.wl-tiwai@suse.de> <s5h1ruxt9cz.wl-tiwai@suse.de>
In-Reply-To: <s5h1ruxt9cz.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2019-10-28 12:09, Takashi Iwai wrote:
> Thinking over this again, the patch below should cover this kind of
> races (hopefully).  I'm going to queue this together with the revert.
>=20
> [...]
>=20
> From: Takashi Iwai <tiwai@suse.de>
> Subject: [PATCH] ALSA: hda - Fix pending unsol events at shutdown

I tested your current for-next branch up until commit
91636a82044a2821201b54faac4d1d2425260842, which includes this commit as
well as the revert of caa8422d01e983782548648e125fd617cadcec3f. Shutdown
and reboot worked as expected on my system.

Cheers,
Jonas


--P0wQbuHDUrKr2mb3bSBGNit9ToIlIqoUo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE0ZGnjxiB84R1PJZ+aGsGOsS8DskFAl23MPEACgkQaGsGOsS8
DsmpHRAAjVmqKBopVLWSAy+DrKnqzwj2kheEU138HEP7wtaDhwq5YP+vunIWQoOH
l/c9KQUd4ye3ZiUlxFfu7rnH3UzqFNOdgSrRTi+JB6NTBLbw9V3bE1psPD7EO14u
KccHf4sdi6PzIdzKEuw0N3OUN7kI9+ZMETHdAFnRHXvSeWdXp9DC8TarCQ9YQnOX
AVynFXtolZJ0WOi4beS2dnSVqcqS3gbCrdaOFwi7hgQzPUXvdriqYbUo5Ex1ILUF
SRI2pRcIzKuu9WQOu8c9nCKbY4coAc3v9FBJMi3PmBaiOQA/8lEYNZEHSjWS/sXk
/lmgGDB1IbacGZ6lH4BxuGpmYleHTSH/p+B/lClupr4Rf6eZ5QTZ14k0PxS7FHLs
Bvm1UOU7C7ZcbX1xHxlC5hrfWDJQR2y/unFvQI0eDww2eqDxBGC9xGG+pBEUIYf3
S5YKGQHkwMIvLhlYeIKUv1hkthK6/j8TWsU42SteCHd72uPg3KdcRS1RyD3c/jhT
MdDaedGdlMMCbAEM+gnjAvnAZnE4wAll415ydakNcVrUe8LnKzVeywLgUolD7m+k
o6iJsvooYPYsyafoGHNKxWcaGs0cMamIDW6RPxc1V9urf2Wx06kjYXQvkbrU/Eyf
L7h7H3BBwP+qDwWkMFFpvcpVuwaHVKoDc+6dzAlCk8wpOUyCDi4=
=4c7d
-----END PGP SIGNATURE-----

--P0wQbuHDUrKr2mb3bSBGNit9ToIlIqoUo--

--===============3715022766366331271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3715022766366331271==--
