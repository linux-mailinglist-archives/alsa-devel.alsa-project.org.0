Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 695BC52839E
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 13:59:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD2131681;
	Mon, 16 May 2022 13:58:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD2131681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652702349;
	bh=rfFycng6c5zxV0M2PP3i/7r8VQ/4NpWOHpLX5DwKyP4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DKGNR46gUTkPHS49t84ubmbTIMXKDXatnWim2DBsmSHjswaQWfd4lRPJmFKg9knj5
	 gTQWZW7OoVAcHuOXrurPfR2quES9WyNnDGAV9Y8b0gQPPV+11/lu26lEyqROsinNVC
	 0Ovh9w5LJoOtdHJB3D01/5LwbyG00rn12md5jGxk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 352AAF8012F;
	Mon, 16 May 2022 13:58:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EEE7F8014B; Mon, 16 May 2022 13:58:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6791F800F8
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 13:58:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6791F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GuRqau51"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 73CDE6103D;
 Mon, 16 May 2022 11:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DB4FC34115;
 Mon, 16 May 2022 11:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652702283;
 bh=rfFycng6c5zxV0M2PP3i/7r8VQ/4NpWOHpLX5DwKyP4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GuRqau51YuaNMtj9tI9QqGAAIbziDVelJigO4PgSydjpeXjmvGhH4Vq7hCfbpQFLx
 bSQKQfau6yS4R2l6tFNaDB5NQJkrzWRUa7SO9lmHAyhxnBDAxF50GMqfrCTEuLwU2v
 qccqnnmhGkcCiXG6hjPVaOc6fuVYdGk7ssECew3JehrAcCPUlq3HRdNvQ+wwRm7FwY
 tfMsmlUfLG+wceSbVzSTwGUl9Wtqz7QkA0MFh/MxvFzjPJOkyCSKHohBkPDUXIOnnk
 lBFYlwSyHsSJJSirf5FjlZni3XtqmyJihGX3eWix6hfAZMQvwfLZ2rFtnBFNfM4H78
 NhESCBisbTd4A==
Date: Mon, 16 May 2022 12:57:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Subject: Re: [PATCH] ASoC: max98088: add support for reg_4a_cfg_bypass reg
Message-ID: <YoI8RJc17naBOlaO@sirena.org.uk>
References: <20220512074359.446999-1-tommaso.merciai@amarulasolutions.com>
 <YnzdcubW7m+CwnvN@sirena.org.uk>
 <20220512104642.GD649073@tom-ThinkPad-T14s-Gen-2i>
 <YnznExLDOvRpXNVh@sirena.org.uk>
 <20220512110959.GF649073@tom-ThinkPad-T14s-Gen-2i>
 <YnztJxdSFau6SYC5@sirena.org.uk>
 <20220513152055.GI649073@tom-ThinkPad-T14s-Gen-2i>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ceUhA335UWeXMnkR"
Content-Disposition: inline
In-Reply-To: <20220513152055.GI649073@tom-ThinkPad-T14s-Gen-2i>
X-Cookie: May be too intense for some viewers.
Cc: alsa-devel@alsa-project.org, linux-amarula@amarulasolutions.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linuxfancy@googlegroups.com, linux-kernel@vger.kernel.org
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


--ceUhA335UWeXMnkR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 13, 2022 at 05:20:55PM +0200, Tommaso Merciai wrote:
> On Thu, May 12, 2022 at 12:19:03PM +0100, Mark Brown wrote:

> > That sounds exactly like a DAPM control, please make them DAPM controls.

> Sorry again, but I'm quite new on alsa subsystem. I need an help on figur=
ing out
> on how to implements your solution. From what you suggest I got that I ne=
ed to create
> a bypass mixer for every switch (4 -> SPK, REC, MIC2, INA):

It depends how the audio is routed - that would be a fairly unusual
structure for hardware but it's possible.  Often bypass paths feed into
mixers that have other, non-bypass paths.

> After that, I need to route the new control mixers on the switch:

>  {"Out Mixer SPK", "SPK Bypass Switch", "RECN"},
>  {"Out Mixer REC", "REC Bypass Switch", "RECP"},
>  {"Out Mixer MIC", "MIC2 Bypass Switch", "MIC1"},
>  {"Out Mixer INA", "INA Bypass Switch", "INA"},

> Then route the bypass switch to the new output:
>=20
>  {"SPKL", NULL, "SPK Bypass Switch"},
>  {"RECN", NULL, "REC Bypass Switch"},
>  {"MIC2", NULL, "MIC2 Bypass Switch"},
>  {"MIC1", NULL, "INA Bypass Switch"},

> I'm in the right way? What do you think about?

That's pretty much it if they're a bunch of separate things.

> Can you point me a similar bypass switch into the kernel to take as refer=
ence?

If you search for "Bypass" in sound/soc/codecs you'll see a bunch of
examples - a lot of the Wolfson devices have bypass paths for example.
You'll see that for example with wm9713 the bypass paths go into mixers
that have other inputs rather than being totally separate things - I see
that this device has things like "Right SPK Mixer" which look like they
might fit here.

--ceUhA335UWeXMnkR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKCPEMACgkQJNaLcl1U
h9Dw3wf+PoN0Y0CruSm0ULIA40MzPzZAb5sVvY5eRMdgy8F/P6oiUcXEm/CwkunJ
by9BfIUpZ4PQTXUcLH9jzp/fXmHimgPNTLDhZLyzylSj2YfoSNXB2COb/nPs1Lzg
NiewyyWMNdZ2/ojAyDwbJSY1FxXKtSKV8NyErnmA09asUBKg+dIOFr1IlDcb8Xoy
X+LugM2PG01eWLLJE9qbkVoAw12iREQok41v3/BQcqlS55S84jHiO/pbwjZZSQxQ
8z7mfl0dyClBF+nZUeTGooc6TsSjYCllwRczNBZrM265khn6oEYYj3aOw+ZP66nh
IHc6PlU+pbA7OHC+c8kZkYd3rD5Dyw==
=3p9m
-----END PGP SIGNATURE-----

--ceUhA335UWeXMnkR--
