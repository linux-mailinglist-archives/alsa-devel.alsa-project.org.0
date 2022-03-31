Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 324704ED9B4
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 14:35:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1F6417B5;
	Thu, 31 Mar 2022 14:34:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1F6417B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648730144;
	bh=RsQR6UjFWzyPEHFbDeMqA0h1nKTqnLcrPhy4Z1sufr8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lXq7TUUKAenb79y66p3ZQoXF0VfyHIK510ntv1jBBm0VXQ/KI64X40UBP2a163ItC
	 2TprmZBTPH1MRMPcsjwqV9HeFfwfHGrgxYakeQRFiu5XEceMCt1fBsz0CAcAmMk+Ze
	 1g0QajQIDhMvwFK8NUfDjowRu4kGfNrENMkoMCEE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F6ACF80238;
	Thu, 31 Mar 2022 14:34:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 022F6F80227; Thu, 31 Mar 2022 14:34:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6EBDF80100
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 14:34:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6EBDF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GpbWsMyd"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8FF9A61811;
 Thu, 31 Mar 2022 12:34:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A1CEC340EE;
 Thu, 31 Mar 2022 12:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648730068;
 bh=RsQR6UjFWzyPEHFbDeMqA0h1nKTqnLcrPhy4Z1sufr8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GpbWsMyd5SCgjUxFmcZWvbXkh35ejpYCRk0oMjvUbK4aeUKC0k8GcCAU02vbXjsXz
 0bnz/E2sF7brvDyzxg+B8D15PRCQzQmj3J8+DaFS1l4mxk9Rhev8Gqq4ZvXSKgR/K0
 pdhvYEI0pGVCw44PetsD7eqms/EmkrP432hH5cuvCSJOeI/lT1VjcYoNIUPOmFqd3S
 e3y8M/n8tVTEm24rNGBfqj+KWwXcL9rcOrr9AmX+GOyn1ukO3+aY8ZFvAoe9gDMy5v
 5MkwTXUHlF00zBbvrXn7U9dlej4FZw59t6h0PbhBzdC/em55buBD3efZtVHg+MrntJ
 sQFyQrf3Q9ZxA==
Date: Thu, 31 Mar 2022 13:34:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: Re: [RFC PATCH 0/5] Apple Macs machine-level ASoC driver
Message-ID: <YkWfziQzprEsWL72@sirena.org.uk>
References: <20220331000449.41062-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3w0XWtrOW4Hfhq/l"
Content-Disposition: inline
In-Reply-To: <20220331000449.41062-1-povik+lin@cutebit.org>
X-Cookie: Reunite Gondwondaland!
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sven Peter <sven@svenpeter.dev>, linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Kettenis <kettenis@openbsd.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
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


--3w0XWtrOW4Hfhq/l
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2022 at 02:04:44AM +0200, Martin Povi=C5=A1er wrote:

> I put together a machine-level ASoC driver for recent Apple Macs (the
> ones with ARM64 SoCs) and want to gauge opinions.

This would be a bit easier to review with a description of the hardware.

> Commit 2 adds a new ASoC card method (filter_controls) to let the card
> prevent some codec kcontrols from being visible to userspace. For example
> the TAS2770 speaker amp driver would be happy to expose TDM slot selection
> and ISENSE/VSENSE enables which is ridiculous. I am all ears on how to
> make the patch acceptable to upstream.

The broad issue here is that what you consider ridiculous someone else
might have some bright ideas for configuring dynamically - if things are
being exposed for dynamic configuration it's probably because someone
wanted them, if the control is genuinely useless then it should just be
removed.  Rather than getting in the way of people's policy arguments
about how to set things we expose them to userspace and let userspace
worry about it, usually with the help of UCM files.  The general
userspace model is that people interact with their sound server more
than the hardware card.  This is also helpful for people developing use
cases, it means they're not having to get the kernel rebuilt to tune
things.

The TDM swap thing you're mentioning looks like it's a left/right
selection which people do use sometimes as a way of doing mono mixes and
reorientation.  The ISENSE/VSENSE is less obvious, though it's possible
there's issues with not having enough slots on a heavily used TDM bus or
sometimes disabling the speaker protection processing for whatever
reason.

--3w0XWtrOW4Hfhq/l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJFn80ACgkQJNaLcl1U
h9AgOggAhaQ6MuCNl7L/md1tarO7n6iReHCzBcOCtSc6T8vIiDTatsSdqb4mHmkZ
jeeF4LCTvo+tb01vzCqHVStd4Pz5dMRv+3F8lI6ODG3g16Tv+E1CKQeIGkVM6VJN
IwzoRsgTtDkz0h0Qi/6t0P4hSu/sobPGHwV8KYBGi4RjuuNl62tQzyUJOYmYah18
Xaz6IbrYmtSc8zgq8tytUxG1j3HRO1icmWWM9jkpqMtGD+CESPbAJV2yWZUTywtl
VjJf6JjiiXmMrAZLY0PlRZON2ePlsyARsJFPy9TDrhaErq2rSLhPI+FMaL6dssH2
YOHlHOpxBEp1DEl5HsKaxiDhyA2x4A==
=BnTH
-----END PGP SIGNATURE-----

--3w0XWtrOW4Hfhq/l--
