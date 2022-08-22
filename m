Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9406359C45C
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 18:49:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F51915E2;
	Mon, 22 Aug 2022 18:48:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F51915E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661186948;
	bh=fCmvmkNwWLezHUtHY42XD358CdxGvwvEzwjAdEzIQEU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e8v/rLLx4qbBJsi6V506qdCmjk454vRpNZRz8H95lKDuw746g/jnbLbWL4KkSu0Hd
	 iEGJYvg+omvx4kBbugcllupmOJ3WT6MQHRnJhHlZ392fMihbvHFUMj1b+EkNnryzL8
	 N4r/bD4AcNuIyg9ssmtf5+4+4Z1oeDTaylioa+As=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84091F8026D;
	Mon, 22 Aug 2022 18:48:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 822C1F8026A; Mon, 22 Aug 2022 18:48:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8B62F800ED
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 18:48:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8B62F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Mhgb89XW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9EB0061207;
 Mon, 22 Aug 2022 16:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FBEBC433D6;
 Mon, 22 Aug 2022 16:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661186880;
 bh=fCmvmkNwWLezHUtHY42XD358CdxGvwvEzwjAdEzIQEU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mhgb89XWK7zfFT/B0H57acLP4sSTtkpKn8OSAfvt8GMI7hDFw0hQxjoMHEG0ltoYl
 F6mUq8Nhalc+poNaBu7rFaJVgILdlzmRl+BndWFyjvKpyON1zINQEC9kR3MG/iSEpB
 mBDqelp0f+UB4cdFG/hVtTOhDpFzEhOe8lUb6H4qWIyeD3ggzo67gdA4TJy4Ti1rVT
 TJuxc+nr4LesgsnN1mX7Qlc0r04Pc9hhcuF+gpFDbLY4mDWTqqWPcpz2QZ4V3RWgIZ
 wioMMfrgQXEWXgfafqTFyD8H0sZ3awGHO3b6wKzODpK8yBSUV7f46nzKQs31EM2E02
 4jvDhMccqpe0g==
Date: Mon, 22 Aug 2022 17:47:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: Re: [PATCH] ASoC: ops: Don't modify the driver's plaform_max when
 reading state
Message-ID: <YwOzO3stwzy0CJti@sirena.org.uk>
References: <20220603112508.3856519-1-broonie@kernel.org>
 <4507B606-8424-4820-A8CE-F79BEDE5181D@cutebit.org>
 <YwAQ2+OLowhA+14d@sirena.org.uk>
 <1329B1B6-EA75-481C-A625-058F21D62C3D@cutebit.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="t2vAMT5XQ/ppLm6V"
Content-Disposition: inline
In-Reply-To: <1329B1B6-EA75-481C-A625-058F21D62C3D@cutebit.org>
X-Cookie: Do not write in this space.
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
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


--t2vAMT5XQ/ppLm6V
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 20, 2022 at 03:10:51AM +0200, Martin Povi=C5=A1er wrote:
> > On 20. 8. 2022, at 0:38, Mark Brown <broonie@kernel.org> wrote:

> >> This commit breaks controls with non-zero minimum.

> > Could you specify more exactly how it does that, and indeed where we
> > have non-zero minimums - all the info callbacks report 0 as a minimum as
> > far as I can see?  Life would be a lot simpler if the controls had all
> > been defined to just be the register values, I've never been able to
> > figure out why they're anything else since the ABI for controls supports
> > negative values just fine.

> Sure. What I meant are non-zero register value minimums, especially
> negative ones, and the breaking was in interaction with the default
> platform_max values from SOC_SINGLE_*/SOC_DOUBLE_*.

Ah, you mean the register field side - like I say the actual controls
themselves are always zero referenced.

> Taking for example

>     SOC_SINGLE_S8_TLV("ADC Volume", CS42L42_ADC_VOLUME, -97, 12, adc_tlv),

> of codecs/cs42l42.c, platform_max was set to 12 and the register value
> was then clipped to -97..-85.

> So this should be fixed by the removal of the default platform_max,
> leaving us with few discrepancies that only manifest if platform_max
> is being actively used (and in that only on controls with non-zero
> register minimum).

But only for controls using snd_soc_info_volsw(), not for controls in
general.  We need to figure out if we want platform_max to be a the
register or user facing value since that's the confusion here and bring
things into line.  Looking at the info callbacks _info_volsw() is
currently handling platform_max relative to the user visible control,
_info_volsw_sx() is too in that it doesn't support a non-zero register
minimum and _xr_sx() doesn't do platform_max at all which is fun. =20

We also still have snd_soc_info_volsw_range() modifying the control's
platform_max which ought to be fixed, it doesn't support non-zero
register minimums either.

I'm in two minds here, user facing feels cleaner but we had a long time
where the code was mostly doing register values and I think some out of
tree Qualcomm stuff that assumed that (not just machine drivers but core
changes) were using that.  The usuability does feel like a bit of a toss
up.

--t2vAMT5XQ/ppLm6V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMDszoACgkQJNaLcl1U
h9Dyawf/Yxqd9Jks/P9k6V+XMdcxqa1/sz0uVQHvGmJQcE1GeZ0N2ylqJ7fvPR+r
oeEd80qb3tlzeNlmWQk5ddqEpjku6d9TuzJCWl9mkdqi43TRrE3KA+rqege5A8Jq
1Rqk74fH/ryltoonYbzu2LRdf22S+2Cc39aAbk61uPMisGeqXw8i5bwiOwK9F75/
AhXlO5lb54HUiT60lyG7N+R9vTvCx+ObXrF868C69XZZJfBIlYBM4SPJv43+Vy4w
vtFUCRgDoAt27BTTl71cgZdf7KzbOcKdQA5o16XMdcQ7YQebLSLVczqMS2hgp6Wb
eBD4AU4fpNF+PzxzU6LeO2Iwz9SC0w==
=Z9Nh
-----END PGP SIGNATURE-----

--t2vAMT5XQ/ppLm6V--
