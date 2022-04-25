Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E18550E0DC
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 14:56:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D53A172B;
	Mon, 25 Apr 2022 14:55:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D53A172B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650891402;
	bh=HkfcpCc1eqbiLwGyeTmgQdMI4j+rgg6rvsaSC4eQ5IA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cI//Kf4e6WN+f4ypOCg0sITMC6BDtKTMQ5Y2D1n+8voVoM7Q1au+swfFaXMZr/yuI
	 t33wQ84rAkYvT9Qkrz89LWK6L+iME9Tk405iVvDqysTwolssYTOlpEpsokmM58vNox
	 +HW6wCVBpSkagm23FvOPhNKx939JuvqYg/07OEGc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F573F8016B;
	Mon, 25 Apr 2022 14:55:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 680ABF8016A; Mon, 25 Apr 2022 14:55:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97B49F800FA
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 14:55:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97B49F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HnRk+psz"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 131A1CE1320;
 Mon, 25 Apr 2022 12:55:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9287CC385A7;
 Mon, 25 Apr 2022 12:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650891331;
 bh=HkfcpCc1eqbiLwGyeTmgQdMI4j+rgg6rvsaSC4eQ5IA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HnRk+psz8v1zx0VWCDqtiKUsIUhuHir+2OLLtUzHdXMQoKT1OTp29AKJtqiTBc9RH
 Wxhj7GhbEkaD7JrhP6P8L70oos0BwM5CaxhCrTvJ6NOsBnDJ5byl7PgoxBHcuyQ3iy
 AWOgIjAPo0glLjQdDJtt2oGa57B/TAs4nXFAdORYVulc2Dqnu+I51ADvdDHjDymhI5
 WHauj0zBcdDceGsp6AWPEf4882AImysACZIP29oRLvVFvl+b/KWPkblFV3pofeGm7N
 3U0QYOsC2GMUQLBr7ywyW3RuCV6QkpBPtY8oHP2rO53dQOqY9ZlkDawIusF89P3BEX
 UmJwJ+mBCirGw==
Date: Mon, 25 Apr 2022 13:55:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik@cutebit.org>
Subject: Re: [RFC PATCH 3/5] HACK: ASoC: Tolerate N-cpus-to-M-codecs links
Message-ID: <YmaaPa8A03rWV7HE@sirena.org.uk>
References: <20220331000449.41062-1-povik+lin@cutebit.org>
 <20220331000449.41062-4-povik+lin@cutebit.org>
 <YkrkbBNYULLgeS5w@sirena.org.uk>
 <904EB8A1-5561-4555-8030-B85703E24F2E@cutebit.org>
 <YmaTHTKWAfM7FCcY@sirena.org.uk>
 <9F8BCBA8-5EE3-4F87-9518-91CB7AB4E077@cutebit.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="O7wLMv3y86gLGqlc"
Content-Disposition: inline
In-Reply-To: <9F8BCBA8-5EE3-4F87-9518-91CB7AB4E077@cutebit.org>
X-Cookie: An apple a day makes 365 apples a year.
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


--O7wLMv3y86gLGqlc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 25, 2022 at 02:34:33PM +0200, Martin Povi=C5=A1er wrote:
> > On 25. 4. 2022, at 14:25, Mark Brown <broonie@kernel.org> wrote:

> > If you register two separate DAIs (well, links) with the API without
> > doing anything else the API will just expose them to userspace as two
> > separate things with no indication that they're related.

> Sure, but what I am addressing here is a single DAI link with multiple
> CPU DAIs, invoked in DT like this:

> 	dai-link@0 {
> 		link-name =3D "Speakers";
> 		mclk-fs =3D <256>;
>=20
> 		cpu {
> 			sound-dai =3D <&mca 0>, <&mca 1>;
> 		};
> 		codec {
> 			sound-dai =3D <&speaker_left_woof1>,
> 				<&speaker_right_woof1>,
> 				<&speaker_left_tweet>,
> 				<&speaker_right_tweet>,
> 				<&speaker_left_woof2>,
> 				<&speaker_right_woof2>;
> 		};
> 	};

You could parse this into two separate links for the benefit of the
framewokr if you're using a custom machine driver (which I suspect you
probably have to).

> >> What about this interim solution: In case of N-to-M links we put in
> >> the most restrictive condition for checking capture/playback stream
> >> validity: we check all of the CPU DAIs. Whatever ends up being the
> >> proper solution later can only be less restrictive than this.

> > That's not the issue here?

> Well to me it looks like it is. Because if I invoke the DAI link like
> I quoted above, and the platform driver supports it, the playback/capture
> stream validity check is the only place it breaks down. Notwithstanding
> this may be the wrong API as you wrote.

I am surprised that doesn't otherwise explode TBH - at the very least
I'd expect it to show two PCMs to userspace which if I'm understanding
your description correctly isn't really what's going on.

--O7wLMv3y86gLGqlc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJmmjwACgkQJNaLcl1U
h9ARDQf/Vj3omBxQfzF9VW1hJ6eknKjHUHK3xR8JtMc6NNBVbLKwOHLwte5cwTT6
Fyi8T+yuuIC8qEXbIR0UYYTPHK3oBqj+tqL+BCqbjJM47ZzpwOIJuBcdn6fU/QpC
umLT2bIQOsVpkGmlvn9UH+U/dESOzPv8PjiSruIXiRGYam0j8H/jh8hiTQi6n6BZ
yRy+GgjLdF9Ws9aB//xps5zY7RvauQ5CmnOYz0++56JITDTrWV1xXdZNEs7PXmCe
UN4KxiMDwLX0nfce0k8S7Gyb8yE8PaZ5AQ66QCBKY7c1tI/qliUdrEhWieaCzt9/
K78aAw2cGspFrQODHj8LAnpKCacFiQ==
=QJEI
-----END PGP SIGNATURE-----

--O7wLMv3y86gLGqlc--
