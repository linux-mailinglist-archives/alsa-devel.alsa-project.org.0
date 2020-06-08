Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D94C1F1A4F
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jun 2020 15:47:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DAB41661;
	Mon,  8 Jun 2020 15:46:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DAB41661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591624058;
	bh=qiecchmIWbrt0Nxzq9q3HyJJNNZ8ZsZPPg0EEpB3wLU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eWc2Eqx6KsGN0PpCC/GZlO0dQchGzwgpW1mmq3ls8fXFqXbzSGcanUywHNPlgbHlt
	 8/rM6rG2zcqHi4EgFjNvgMsF5VxT0gHBxocJj/Hxs6qF6XzjYNyp3waWDy+qeqwURl
	 /JlELUSFLAhdBxJDdWQ5okUT1wJNO7IZmWa4kYDk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50B44F8021E;
	Mon,  8 Jun 2020 15:45:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78A46F8021C; Mon,  8 Jun 2020 15:45:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C402DF80124
 for <alsa-devel@alsa-project.org>; Mon,  8 Jun 2020 15:45:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C402DF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lrbYsQ4C"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C78C7206C3;
 Mon,  8 Jun 2020 13:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591623949;
 bh=qiecchmIWbrt0Nxzq9q3HyJJNNZ8ZsZPPg0EEpB3wLU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lrbYsQ4C6zf/CNN6TOZLVIAE9nQq2fRWei/vojInFog5x3/u8kGlozX6ZC+9C3RO1
 jtHfURXJTpcE1WHpZ6a9Pr864zofd/5gGsWJFHCMGFh/aD8kPuwLHkXA1X/qTW/7pM
 F+LymKvYvvanScEd5E6LlI2sDrgudip8gRpExMCs=
Date: Mon, 8 Jun 2020 14:45:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Phil Burk <philburk@google.com>
Subject: Re: [PATCH 0/2 v4] ALSA: pcm: anonymous dup implementation
Message-ID: <20200608134546.GG4593@sirena.org.uk>
References: <20190204093910.23878-1-perex@perex.cz>
 <20190326140928.GC10898@sirena.org.uk>
 <s5hva0567vs.wl-tiwai@suse.de>
 <CACL=Q7we61BwO81W7tQFvb9ohkBZkk34DSXL2B-Ky2B6zfWk1A@mail.gmail.com>
 <f5b429c6-803c-b624-6d39-5001c76e892f@perex.cz>
 <s5hd0lcppbn.wl-tiwai@suse.de>
 <CACL=Q7xSpeqyQzDyexCr+Nxs+nf3o9doaHGxiu-y8biK9w_9YQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zGQnqpIoxlsbsOfg"
Content-Disposition: inline
In-Reply-To: <CACL=Q7xSpeqyQzDyexCr+Nxs+nf3o9doaHGxiu-y8biK9w_9YQ@mail.gmail.com>
X-Cookie: I'm rated PG-34!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Baolin Wang <baolin.wang@linaro.org>, Takashi Iwai <tiwai@suse.de>,
 Zach Riggle <riggle@google.com>, Leo Yan <leo.yan@linaro.org>
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


--zGQnqpIoxlsbsOfg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2019 at 01:11:50PM -0700, Phil Burk wrote:
> Hello Takashi,
>=20
> Sorry for the late reply. I got pulled off on some other projects.
>=20
> We will try to test this in-house but we will need Qualcomm's help.
> I will also try to get some of our SOC partners to help with testing.

Did anything ever happen with this testing?  These anonymous mmap
patches never got merged.

--zGQnqpIoxlsbsOfg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7eQQoACgkQJNaLcl1U
h9A7Qwf8DyNjLGP4pPUMoOay1AxSc5YiXWn/ho+W6UpFz0j0We35xmphbHyKYfOd
Ao9UzE6n+3OI/upTIop//jLZJ92Dmwhj+iMJHvQdFRNGlLqLFzs3K7oIacEaI2hx
Cs0z4cZjEmHJVDVbeZU14x9wYN3l/KXPaFafzQZes0w3M8rUChbM6flzzDnIL/a1
8fuQWbxVUkc0efP0dOyKZ2D0g5ajfatwNyVYQlKcYA7qgLTidtAM84B9N4nr93tN
5E5KTpveyREePCqVTY+INBiHyftMe2Ye6WsGpg+sMscMSJaded8Js2MF0O6SGwxg
rQMmsuvXh9NP3gi1PG4WaAsCssysKA==
=sDlO
-----END PGP SIGNATURE-----

--zGQnqpIoxlsbsOfg--
