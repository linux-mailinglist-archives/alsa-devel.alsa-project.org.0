Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7012C518EDD
	for <lists+alsa-devel@lfdr.de>; Tue,  3 May 2022 22:33:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBE9C828;
	Tue,  3 May 2022 22:32:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBE9C828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651609981;
	bh=wtmL4i7gYJWpDDK/qD9qpyrpIl/02t/QmJpUx6w7VbU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VjbatfMMQnN2cqPaNNELJDz0v+9iWj4NRsOJzyriF0qXlTgNFgFlVD9/rYnYkhn3h
	 NvS1mQAJY9jlXnsXjVPc9zyOjoE6MgD4+huXCVJUxe0HLAgLAJZ8bwttQor6MOrGCG
	 uQ9blnL1lUV6AGmz3qS3IYhnVjm6BX1b/JnD935Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69E82F8025E;
	Tue,  3 May 2022 22:32:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78398F80236; Tue,  3 May 2022 22:32:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EDF2F80129
 for <alsa-devel@alsa-project.org>; Tue,  3 May 2022 22:31:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EDF2F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EI7OwlHp"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5C81360A50;
 Tue,  3 May 2022 20:31:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B37C385A9;
 Tue,  3 May 2022 20:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651609914;
 bh=wtmL4i7gYJWpDDK/qD9qpyrpIl/02t/QmJpUx6w7VbU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EI7OwlHpyTF+m9zWy0BXyHVejDJKc7MfFA1X/9YXXgaL21R61xisHFw3p/Xws/Wp+
 1ZrjjEM1+JMP0XN6+Bi3N6VVZ7+heaHkMIsquqFweiK64xb9gLMwcZHxpAzXxwD9rW
 Nb+ywM6YzeMYWhwk0fd/hl/GMj8mVQhuTRRKlEqlve8vRry+LE5Wcoa2rFJLD4S5fC
 SFDKPPDv30RSu8+D6XrzfINxuvcdjeSdtwVbrwQHIQWocjANwmE4zr+qutf+JI2dVZ
 WHRBAE2t2DsHMGL3lCZUzaG6k9Hg9YHsv5i+sGAKqnVALcgcWtnmD3lBM/+iWQg/oK
 mrVO4RUhUe51A==
Date: Tue, 3 May 2022 21:31:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: ASoC component/card relationship
Message-ID: <YnGRNfaempsFG9/M@sirena.org.uk>
References: <d9c3fed4-de6a-2cd8-acb6-7f3d2ad46b70@linux.intel.com>
 <YnFwGJBjVGrsMJWR@sirena.org.uk>
 <6dea4606-cb5e-1224-bf98-d1da1484ebfd@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="n9IfuD2NZGjpkhQ0"
Content-Disposition: inline
In-Reply-To: <6dea4606-cb5e-1224-bf98-d1da1484ebfd@linux.intel.com>
X-Cookie: Drop that pickle!
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Curtis Malainey <cujomalainey@google.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
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


--n9IfuD2NZGjpkhQ0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 03, 2022 at 01:59:54PM -0500, Pierre-Louis Bossart wrote:

> > This means we get back to the assumption we started off with - what are
> > we gaining by partitioning things into cards when that's not really
> > what's going on with the hardware?

> The main benefit is reuse of 'generic' cards.

> Take for example HDMI support, it's typically exactly the same from one
> board to the other - it's completely standard. And yet, for every card,
> we have to add a path in the topology and the machine driver to
> represent exactly the same information multiple times. see below how
> many times we add the same 'late_probe' callback for HDMI support in
> machine drivers.

> BT audio is a similar case, the interface configuration and settings are
> defined by profiles, so there's almost no variation from one board to
> the other except for which I2S number is used.

> A peripheral directly attached to an SOC or chipset, such as digital
> microphones, is a similar case.

> The point is really to try to split what will be variable from board to
> board due to different choices of headset codecs, amplifiers,
> microphones, from what is generic and reusable.

There's a reusability thing here which does seem somewhat valid, but it
does feel to me like separate cards is a bit of a case of having a
hammer so everything looks like a nail kind of solution to the issue.
The issue you've got is not that these are disconnected bits of hardware
which operate independently, it's that you don't have a good way of
dropping the board variations into a template machine driver or
otherwise customising one.

Off the top of my head you could probably get some way with this if
there were a way to tell the core to skip over some links during
instantiation, that might help keep a common core of these bits you wan
to split out into cards more static.  Perhaps also being able to add
multiple sets of DAIs to a component rather than having to compose the
full list and then add everything in one shot?

> The logic can be pushed further, as done in the AVS patch series, to
> split the card by codec type. This would avoid having to deal with the
> permutations that we have to handle in machine drivers. See e.g. how
> complicated the initially generic sof-rt5682 machine driver has become,
> it now supports rt5682s, rt1011, rt1015, rt1015p, max98373 and
> max98360a. I will accept this comes from ACPI limitations, but if we
> could split cards it would also reduce the machine driver complexity.

If you want to split the cards up more as things stand there's nothing
really standing in your way there.  As you say though I do think this is
just that your firmware doesn't describe most of the hardware and so you
end up with a large element of bikeshedding the deckchairs on the Titanic
which limits how good things can get.  I do wonder what happens if we
split things into cards and then get better at letting userspace
dynamically manage what the DSP is doing rather than relying so much on
fixed topologies...

> In terms of functionality, I don't think there will be any performance
> or power improvement coming from a multi-card solution, it's mostly a
> maintenance simplification: less duplicated code, more reuse.

> One key point is "who defines the split". That's really one of the main
> problems and different people could have different opinions - Cezary and
> I have a shared goal of enabling multiple cards but different takes on
> what the 'optimal' split might be.

> My take is that the integrator for a given hardware is responsible for
> making the decision - not the provider of a DSP driver. In case you have
> coupling between interfaces, playback or capture, it can become really
> difficult to define a split that will work for all cases, or conversely
> if you don't have 'self-contained' cards that can be tested
> independently then splitting the functionality was probably a really bad
> idea. If one needs to add dependencies and quirks for a local device,

Looks like something got dropped here.  It does sound a bit concerning
that the split into machine drivers could be done using quirks.

> In other words, I think we need to agree on the means to create and
> expose multiple cards, and agree not to debate on what the functionality
> of individual cards might be.

> Hope this helps clarify the ask?

It's still not clear to me if the problem you're facing couldn't be
addressed as well with better interfaces for adding dai_links to the
card, that (mainly around BEs) seems to be the main thing you're having
trouble with as far as I can see?

--n9IfuD2NZGjpkhQ0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJxkTQACgkQJNaLcl1U
h9CPRwf/SfM0zi91lr40icYLaMhjbgFpQ+vQQBltuC5T9jhq0rQ5lKmMx4mqEhxI
uodY5QoRq3ckSZTXt2CU0GmxgHP8So9HNHE7npEEG7elDqVLMZOa6kRE4OXzWe6P
CtWth2ktASNdgStMWq0APMtwvfqUDlL/6B5+AS23NBKRcH6+kXH5VKt+4iQvwtQ3
PxYQd9y6rOuJyCnz+M45BcNAZql+44NfH8YRjZseN5IBezo0L0qyHSGUTDJSFzjV
ebIYdNFYz339SMf4ecMjYYqIQSHD647O8RgZe8qR31pW5EGsb6T+FFxQF80+op4H
DDbeX6hn8HsOqG6cskBWantoVKU/Gg==
=0qN0
-----END PGP SIGNATURE-----

--n9IfuD2NZGjpkhQ0--
