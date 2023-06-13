Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD6472E9CE
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 19:30:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8D4CEAA;
	Tue, 13 Jun 2023 19:29:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8D4CEAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686677427;
	bh=iUzj7k10YTg83S+wBJGVDKpPVzNghGpvuz+AjNuWW7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HpsJRAKqv36fB69hM0j0ZWFs1La5Q/6+zrEILURduh7BsYAKZPDTPhcTFQh8ocXLr
	 vMInUdDikQxnBgWyEb7MzzNPk9bSQcw89Rgmr7ZWs4GLxu1x7CNpWm7JGy11vPdZLC
	 gJwJ51wCMX2mEwgDuOc3J8rfyBA5xQbXQLKbGmSg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AAC2F80132; Tue, 13 Jun 2023 19:29:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49FD6F80132;
	Tue, 13 Jun 2023 19:29:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 265CDF80149; Tue, 13 Jun 2023 19:29:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 098DBF80130
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 19:29:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 098DBF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hlfE+8v8
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0FD4263319;
	Tue, 13 Jun 2023 17:29:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 398A9C433D9;
	Tue, 13 Jun 2023 17:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686677364;
	bh=iUzj7k10YTg83S+wBJGVDKpPVzNghGpvuz+AjNuWW7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hlfE+8v8EkiRGkP+igy4lwShxYw3Vp0o5/DRLgkuVIiZMRvAZuUfsqg2yY5hr5P25
	 j02w3EU/54Kv7ndjtLg8NTG+m1c/ZDQojifnhyZj1v2/r+MOeoHOBUqmBl43b7kOLF
	 QuajYiRpgF64HW48cVIgNGOFOc/fGH3ZFy0ZibXDscPKUkRxtEHnptPZgPTmwNAlR2
	 AS6C8pOItxNBf0G47WsO/8H27ill+Bge5YVi1qJu0avbrWuZSu5tUk9qqEzAhe58/D
	 eCyXzhmZdTslsl8jxiTZ5IOgAiBI0fhMOotVDeG+S1Zlpz00fhDpFupsNWVI5NEG4m
	 F2xWrotYhMSyA==
Date: Tue, 13 Jun 2023 18:29:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: Use maple tree register cache
Message-ID: <34b7d114-af69-459e-8a22-2a93a1e43e94@sirena.org.uk>
References: <20230609-alsa-hda-maple-v1-1-a2b725c8b8f5@kernel.org>
 <87v8fua1qm.wl-tiwai@suse.de>
 <877cs7g6f1.wl-tiwai@suse.de>
 <e48bbd3b-544d-43d5-82a1-8fbbcb8cd1a4@sirena.org.uk>
 <87v8frcueb.wl-tiwai@suse.de>
 <60f70667-16b0-4071-aa0f-a83e43bbf2a0@sirena.org.uk>
 <87a5x3cp9r.wl-tiwai@suse.de>
 <18bcfcba-a6ce-4595-bd2b-4d4ba761fd58@sirena.org.uk>
 <874jnbcmy6.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U5ZQrDXad9z9/cVp"
Content-Disposition: inline
In-Reply-To: <874jnbcmy6.wl-tiwai@suse.de>
X-Cookie: Not a flying toy.
Message-ID-Hash: 65PTPWYJYCBPXKOQ7QMCGBJ3AYPUPPHE
X-Message-ID-Hash: 65PTPWYJYCBPXKOQ7QMCGBJ3AYPUPPHE
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/65PTPWYJYCBPXKOQ7QMCGBJ3AYPUPPHE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--U5ZQrDXad9z9/cVp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 13, 2023 at 07:05:21PM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> > > Oh, I'm afraid that we're seeing different things.  The code there is
> > > rather to *set* some initial value for each amp register (but only
> > > once), and it's not about optimization for writing a same value
> > > again.

> > > That is, the function helps to set an initial (mute) value on each amp
> > > when the driver parses the topology and finds an amp.  But if the
> > > driver already has parsed this amp beforehand by other paths, it skips
> > > the initialization, as the other path may have already unmuted the
> > > amp.

> > So it is possible that we might set two distinct values during setup
> > then and we're doing this intentionally?  It's not obvious that this
> > might happen.  A comment wouldn't hurt, and a big part of this is
> > confusing is that in the non-regmap case all we're doing is suppressing
> > duplicate writes, in that path it's just checking for changes in the
> > register value.

> > None of this is what the non-regmap path does, it just suppresses noop
> > writes to the hardware.

> Actually, many of HD-audio codec driver code heavily relies on the
> regmap, more or less mandatory.  The snd_hda_codec_amp_init() is one
> of such.  You may write a codec driver without the regmap, but some
> helpers won't work as expected.

Sounds like it might be so thinly used it's becoming mandatory to have a
regmap in order to avoid gotchas like there might be with things getting
muted?

--U5ZQrDXad9z9/cVp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSIp28ACgkQJNaLcl1U
h9D6iAf/YuE/ekMh7Ju3OxD7fiNwknQJlxztDugOKoOOz6W1IKuXHZQ6VmfOKEvv
QY/hF7MXheC9rR3Ao2lkidhuDGxEBGWw8jizSEjg9OdMI3ciXJiRtH80XVVDnbGr
r1TPDuleLgg8GcmVPoJfmZlOqdAuHxKxFXXIwaInYqWiaegh1k+4NG+R9AdqvjtD
QE8LWM3ybcftlP8KN00cjVhE5JznwCeNmNkljRta+eU4BaV1NxhnbnH+Tox0Amss
jPEmR5iimfW5AyagShLSzvEYxEnFVcxZxTz+s9d9T8z10CbuhOKsXAiz0WGQpAc+
w6gga3FMjiQWOoiJN9r8laLc8yusjA==
=1mK9
-----END PGP SIGNATURE-----

--U5ZQrDXad9z9/cVp--
