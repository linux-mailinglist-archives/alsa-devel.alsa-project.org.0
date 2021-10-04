Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1652E4209F7
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 13:19:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FFA8168F;
	Mon,  4 Oct 2021 13:18:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FFA8168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633346374;
	bh=0wgu5iuPepCxFxpreyphFnKy/ixxODTBfmJn7/Iu3yE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RVRL/XX59zRaGoJJoUxlaZW/Oduc3L6F6jJ2SdfyE0ytjyMPsRGQ9aHWBZc7o62s6
	 3jGF4xdoCK1IjpebEWswyHa26+zTb+IiN1gHTiTHRZgT/SFf8lb1CZ9eSMryE/e2hJ
	 KroMrf+AKeRKtNtVU4tg7sL52VLtlzP+pE3BKeJc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AF0DF800BA;
	Mon,  4 Oct 2021 13:18:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DE49F80240; Mon,  4 Oct 2021 13:18:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DD6AF80171
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 13:18:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DD6AF80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cwCo+BFK"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1879A60FD8;
 Mon,  4 Oct 2021 11:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633346282;
 bh=0wgu5iuPepCxFxpreyphFnKy/ixxODTBfmJn7/Iu3yE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cwCo+BFKqVLQ1SvbSEXurrDxAkESGjOPahwmc/v7dYUl0nSGUvMWYYAUlrHK6wA72
 Tl7bt+KLft1VY8XcW1uQjMzTu7Bxy59KjyIzKpvZYczVvEF/33IVmVS0K0d5ynNmEm
 hznHSZlQgPPfQ6JeEaOqcq6G4F3dLSk2yzo0FQDZhX/moMnybr32CuCZraBLrdCRkD
 y/e7EyNF1zIsI6wgWRosuIFHfsqMoaTezQj+yW5ZtKZ7QXVOkayKfxx7wdX5x7vKB/
 Km4QA+LvwmGmPj7/JZZau4x0NY/m9gsfr8qoRM1+pkwNxJilYnb8DW7rlc3YJD/uuu
 ELy4g7gdn652g==
Date: Mon, 4 Oct 2021 12:18:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [RFC PATCH v1 0/1] ASoC: meson: aiu: HDMI codec control
 questions and issues
Message-ID: <YVri6Plus1oaX248@sirena.org.uk>
References: <20211002234313.3209294-1-martin.blumenstingl@googlemail.com>
 <YVk77/SIxr8Vt8TQ@geday>
 <494D4A30-F230-4B64-AFA9-319FFC4C69DA@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5TFB1rwqMxtqYHgE"
Content-Disposition: inline
In-Reply-To: <494D4A30-F230-4B64-AFA9-319FFC4C69DA@gmail.com>
X-Cookie: If it heals good, say it.
Cc: alsa-devel@alsa-project.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 LKML <linux-kernel@vger.kernel.org>, tiwai@suse.com, lgirdwood@gmail.com,
 Geraldo Nascimento <geraldogabriel@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
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


--5TFB1rwqMxtqYHgE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 03, 2021 at 11:00:15AM +0400, Christian Hewitt wrote:
> > On 3 Oct 2021, at 9:13 am, Geraldo Nascimento <geraldogabriel@gmail.com=
> wrote:

> > It doesn't sound like a machine gun noise to me :)

> > More like brown noise, but anyway what I'd like to note to
> > everyone involved is that this one is a major dealbreaker.

> I=E2=80=99m the origin of most reports that Google will eventually discov=
er. I
> was told elsewhere that this is known as MGN so I=E2=80=99ve described it=
 as
> such, but that could be wrong. For clarity this is the noise
> (triggered, and with AVR volume deliberately right down) followed by
> some navigation in the Kodi GUI to change output:

> https://chewitt.libreelec.tv/testing/wp2_audio_noise.mov

Right, I would just call that static.

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--5TFB1rwqMxtqYHgE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFa4ucACgkQJNaLcl1U
h9AGmwf/fxBw23uJPAC92OR7QsFhST90SG2lccRXbEC0+OXrQX3FyehcnLk6aURp
2BV7EWeP8mpFG9VmfR0uQIKAClPMChSO+23XieDPF5Nmk4HQc7foEnu3OJIkDhvK
cmjlDh29FKmSfIR+Ky8BN5EUhVd+Wj1FzYjbyGgMhfm2d6kZq8OzpJHVG9Ddet8t
E/xCVh8IsaEp5aGSPdty096Q0xC1v5ApLnStlCjzFCcqGVRYVCwUrZm4MARyTWIC
b00uBIwlKMSkV9Qh/K3a0umgcl/zGNjIO8n2edAOXtrw5EJIdmCboupoKpNLjLDC
CxWhMmWFJlsXDz0qSGAiSJaI30OMMg==
=gPaQ
-----END PGP SIGNATURE-----

--5TFB1rwqMxtqYHgE--
