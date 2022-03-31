Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B104EDA04
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 14:57:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A39561901;
	Thu, 31 Mar 2022 14:56:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A39561901
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648731447;
	bh=DfI4w1o+FCYxsAC0rPn+xFaT1PUgndy6Pzulupfti64=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XVJ76Ds5HQDzrtuPDoGGgoTGOu0oJu76DlrAJqOc7EztGDEXRzEs7s2krAX0hFm0p
	 9SEgG5FRLrCl85wCIbkETl6peBDNJOFNamzdtQ5MtJ9PATELrYRIOfrvHz/5Az37Wi
	 hLhloQocLDk1c0e48xX1J+t0HbYwf0hsDWWrKqaE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 018E8F80238;
	Thu, 31 Mar 2022 14:56:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E191F800E4; Thu, 31 Mar 2022 14:56:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B172FF800E4
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 14:56:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B172FF800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="k/1uDpG0"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CAB9B61821;
 Thu, 31 Mar 2022 12:56:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84ED6C340F2;
 Thu, 31 Mar 2022 12:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648731372;
 bh=DfI4w1o+FCYxsAC0rPn+xFaT1PUgndy6Pzulupfti64=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k/1uDpG0COuH/xMycH1jXEnaAzYEpDjT5p7kU8rL4PHWzMMQXC+b+2cYoSf0m2F12
 qxbJx8hW/8ikoGtSzP79VFsft4uHhbHea2hb00KmUMLsNcb/lBaBICgpkEhL1kfrRR
 FhCaLlT9xc5IhKlKDyMom56/wnaMhWeIgHSM72t9LH7QgBaWFcjznoWhPtebcvDsGz
 R1qbHGThUeONUvt2Ahw6SsUmSNlNGcl4G4rEcY8ubwIecE37Y8mMekI9I/iwHiK226
 ueWktgb253XuGKtf35tC2WuDIaiSIUvtbZj123P2me2Gpmf7oaNVeKDksy+TMEQyWt
 z8+yBENsT3S1A==
Date: Thu, 31 Mar 2022 13:56:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik@cutebit.org>
Subject: Re: [RFC PATCH 5/5] ASoC: Add macaudio machine driver
Message-ID: <YkWk5vvBlC/Orpdr@sirena.org.uk>
References: <20220331000449.41062-1-povik+lin@cutebit.org>
 <20220331000449.41062-6-povik+lin@cutebit.org>
 <YkWXs/f7edZwg1+W@sirena.org.uk>
 <4651D426-BA1A-418F-90E5-278C705DA984@cutebit.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2p1SKEdgaX+tzFpw"
Content-Disposition: inline
In-Reply-To: <4651D426-BA1A-418F-90E5-278C705DA984@cutebit.org>
X-Cookie: Reunite Gondwondaland!
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sven Peter <sven@svenpeter.dev>, linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Kettenis <kettenis@openbsd.org>,
 Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
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


--2p1SKEdgaX+tzFpw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2022 at 02:08:51PM +0200, Martin Povi=C5=A1er wrote:
> > On 31. 3. 2022, at 13:59, Mark Brown <broonie@kernel.org> wrote:

> >> +	for_each_rtd_components(rtd, i, component)
> >> +		snd_soc_component_set_jack(component, &ma->jack, NULL);

> > What is the jack configuration this is attempting to describe?  It looks
> > like you have some dedicated speaker driver devices which are going to
> > get attached to jacks here for example.

> We know the speakers will ignore the set_jack call. There=E2=80=99s one j=
ack and
> this way we know the jack codec will attach to it, for speakers it=E2=80=
=99s a no-op.
> (If you prefer I will special-case it to the jack codec.)

It would be better to special case, this looks obviously wrong and will
break if someone adds error handling.

> >> +	return !strcmp(name, pattern);
> >> +}

> > This looks worryingly like use case configuration.

> I go over this in the cover letter! This is fixing the TDM slot selection
> and disabling voltage/current sensing on the speaker amp codecs, which ha=
ve
> no business being exposed to userspace as options. This is not use case,
> this not letting people blow their speakers from userspace.

Your comments in the cover letter are all pretty vague too, that just
says that these controls are "ridiculous" which isn't terribly specific
about what the actual goal is.  If it's just "I can't see why anyone
would want to configure this" then that's a decision you're taking about
what people might want to do which is broadly a use case configuration
and the control should be left there in case someone comes up with an
idea.

--2p1SKEdgaX+tzFpw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJFpOUACgkQJNaLcl1U
h9CYzQf/Y08TIa0AXiiPTKniPzL9m3d7ArsJSmeKBxGOiqTtZ7kzWb4ElKSSGfRR
SQBABq69Qoxq9aWhUfdocdGNf3I/MtDc8k0XUs4bO3MQgKJ0WIivkGNpRPield9D
tbiVirXSxTSN28zrzJHzZZti6MVAFNCRjlrF+qOhAH2K6qKQNwcFwOYSFEjQaGLp
noni9E2T7cwSkwem3gxTP6FDHdT2ivx3fwBArNpZ3WqWwK+3cBrlSD+pMYoPdWVD
PMv8/IfgYHYm+ojMI6ILkAic1KojFLwM1stvNfFtR7fOO8QJEeSfPhKg18zLwvHj
N1ZH9xNFrO4kKrMnwL7uEZAtBTHoGQ==
=khz2
-----END PGP SIGNATURE-----

--2p1SKEdgaX+tzFpw--
