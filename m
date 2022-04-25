Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C179D50E242
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 15:48:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37C9B1635;
	Mon, 25 Apr 2022 15:47:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37C9B1635
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650894485;
	bh=cnaPGcH4wGvOkYGwNrD3V8c2ZplgPQyr3KVOqiR+sJ8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JWqO7qagwH+kfemcgTZM2ULYJLv/Ifpwm179zlSI9fF5a/7xy1/Bei15MwGBp8ZvJ
	 Zbag29OD68EmXzzfCYRe0rkb/3BpAOnzJr9UpK5H32dfvSnMQ7ayRJYpNBvEMBGi3b
	 +ftTJIDmCikGbhfPjmfVS6B5KA1wAqlXXCjFni74=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E0D7F8016B;
	Mon, 25 Apr 2022 15:47:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B86C2F8016A; Mon, 25 Apr 2022 15:47:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CD4EF8014B
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 15:46:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CD4EF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jA1s0kuS"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7C95361531;
 Mon, 25 Apr 2022 13:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35886C385A4;
 Mon, 25 Apr 2022 13:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650894415;
 bh=cnaPGcH4wGvOkYGwNrD3V8c2ZplgPQyr3KVOqiR+sJ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jA1s0kuSSuLQE2bT8lYq2PPV04y02D7wZ8T7PdJUl0+pIvcQzNQnEkHrKO/VLIdgb
 2m1RDD1iU6fclgB2yt1Cje9fNi0pxMXo9Afs/v7KguWBId5ui/5gXhFdyMHHH8XIRQ
 bOftIFstCxWmSjJHS3lBhWNxeu4gXmX0XXBJbCx4vqu2bqlpY3wW9SyWSPVIMDLzeT
 BX2eE8JH6eajiA+UVHxwl22jmU3zQixvCowQ3xKibegjrsmrkShuAPa1Y4rNBOa55o
 S2JjJmmeYwllM2K1/vcfweK03kM9wQnTiueeD9g3slFnmadjGloilFczuOGhiju7TU
 mzZXT8lv+7Cdw==
Date: Mon, 25 Apr 2022 14:46:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik@cutebit.org>
Subject: Re: [RFC PATCH 3/5] HACK: ASoC: Tolerate N-cpus-to-M-codecs links
Message-ID: <YmamSZKNtNai7KyM@sirena.org.uk>
References: <20220331000449.41062-1-povik+lin@cutebit.org>
 <20220331000449.41062-4-povik+lin@cutebit.org>
 <YkrkbBNYULLgeS5w@sirena.org.uk>
 <904EB8A1-5561-4555-8030-B85703E24F2E@cutebit.org>
 <YmaTHTKWAfM7FCcY@sirena.org.uk>
 <9F8BCBA8-5EE3-4F87-9518-91CB7AB4E077@cutebit.org>
 <YmaaPa8A03rWV7HE@sirena.org.uk>
 <4CF6B0A7-F218-4798-BB21-18D563309D5C@cutebit.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="V5YMDCcjWGsw/lIg"
Content-Disposition: inline
In-Reply-To: <4CF6B0A7-F218-4798-BB21-18D563309D5C@cutebit.org>
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


--V5YMDCcjWGsw/lIg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 25, 2022 at 03:11:14PM +0200, Martin Povi=C5=A1er wrote:
> > On 25. 4. 2022, at 14:55, Mark Brown <broonie@kernel.org> wrote:

> > I am surprised that doesn't otherwise explode TBH - at the very least
> > I'd expect it to show two PCMs to userspace which if I'm understanding
> > your description correctly isn't really what's going on.

> I fill in a single snd_soc_dai_link, it exposes a single PCM and works
> like a charm. That is as long as I patch the playback/capture check in
> question.

> I read that to be the clear intention of ASoC code: a DAI link becomes
> one snd_soc_pcm_runtime.

Yes, so long as you boil it down to a single link it works fine but the
bit on top of the binding where you tie the two CPU DAIs to what is
actually exposed is all in code.  The reason this stuff isn't filled in
is that connecting the thing that applications see to the physical links
isn't at all obvious and needs at least some driver sitting in the
middle to make the links - I'd imagine there's a DSP sitting there which
probably has quite a bit of flexability about how the various hardware
components available are actually related.  This makes figuring out what
to do with the relationship between the multiple CPU DAIs hard.

--V5YMDCcjWGsw/lIg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJmpkkACgkQJNaLcl1U
h9C/GQf+OjJGWvlH5dhjAe5s8YfzoSM40Z2KmKGWDIcK8eWx0PFyUNUbga/WyQfu
/DZp541i+iDNis3n38axj/4MJkr6Fv79zkvqkXcDoJRwvHPN4pUnWuayW4R9dzOD
RCziMyqgTtA4L9aCBI3OW6j6iDy5giYhk1ZGom2XGghdavCGptkPmXnWebvjTP1u
86P8dTNBR5iyhFdxG6ZQXgGOoj+HDKc7wd8GeKmUErNfgDPJhLKe4+2CPyX/l8cp
7yO9I0+h4S/GIOyCjybXqlEfCKLSYk6S7rf+grBcXOfQlb+AUo27WCSS1E2AvH/P
/5nrS6m379X9QqI4rhcsEJOfwZo+1w==
=/H/Q
-----END PGP SIGNATURE-----

--V5YMDCcjWGsw/lIg--
