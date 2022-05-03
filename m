Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8919A518BF6
	for <lists+alsa-devel@lfdr.de>; Tue,  3 May 2022 20:11:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01393100;
	Tue,  3 May 2022 20:10:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01393100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651601508;
	bh=/7HssWbTMIp+Dc13U+bYVgWGdJSwUQagx9R3fhX+40M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nXxHKc0KVH8+Xhq1BFtvcWfnNGcvue7oWvKWbSsTEFv2rAidUifNm9MAbhzssuyrZ
	 gEWxj8tli+wfI5FNmFugLjlJsoLvgzWGDnZzKAPGmN7J/Fg65Fr822lXOHiw8FOKjY
	 IpePW5YYu7ZzCvma7xYXZG9zbrGxlu3uNaJ/Oqck=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 621F7F8025E;
	Tue,  3 May 2022 20:10:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2710F80236; Tue,  3 May 2022 20:10:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C120BF80129
 for <alsa-devel@alsa-project.org>; Tue,  3 May 2022 20:10:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C120BF80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="l5T28FB1"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4D08361877;
 Tue,  3 May 2022 18:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57EADC385A9;
 Tue,  3 May 2022 18:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651601438;
 bh=/7HssWbTMIp+Dc13U+bYVgWGdJSwUQagx9R3fhX+40M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l5T28FB1dDCfRPi1/f5M9FSBECr/BpZouZArwmdKcO9ijtoWBjY02EAZrF8otc2Sa
 E/5+kqSC/hd74m6/2xUCyZI0xdKeQ9TZGLgAE+urw3EUXPHYoms3PMX6TTwlyrz419
 8drEp/SV8vdv9ENkOhL66AFEYVo7x7jgyyZYFWjhinPZrMRV+uCvhHFxQ9a0/t0VCf
 yuc92iMNZr6VnCAfOoQcwI/IgT/Vw26mZymXTDcxVMIw5QJspH0jCoN4EIfO94JnPH
 PL0MifR/CxkG4C7RugoVqrIu+xGnP2plW0XPPEygAt7uJEao0sA3J2TGyisVUJwZ7b
 jP3V3Fcg7VBjQ==
Date: Tue, 3 May 2022 19:10:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: ASoC component/card relationship
Message-ID: <YnFwGJBjVGrsMJWR@sirena.org.uk>
References: <d9c3fed4-de6a-2cd8-acb6-7f3d2ad46b70@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="KBbepe4hUut5mCZN"
Content-Disposition: inline
In-Reply-To: <d9c3fed4-de6a-2cd8-acb6-7f3d2ad46b70@linux.intel.com>
X-Cookie: Drop that pickle!
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Curtis Malainey <cujomalainey@google.com>,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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


--KBbepe4hUut5mCZN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 29, 2022 at 04:55:18PM -0500, Pierre-Louis Bossart wrote:

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

> In the existing ASoC code, there is a fixed mapping between ASoC card
> and component. A component relies on a ->card pointer that is set
> during the probe. A component cannot be used by or "bound to" more
> than one card [1]

> This has interesting impacts on how a codec or DSP driver need to be
> implemented.

> In the AVS series posted this week, multiple components are registered
> by the DSP driver, following an interface-based split. There's in
> addition a second-level split, where the logic is pushed further: the
> DSP driver partitions the SSP DAIs in different set of 'dai_driver's
> used by different components, which are in turn used by different
> cards. What is done in these patches is not wrong, and is probably the
> only solution to support a real-world platform with the existing ASoC
> code, but are the framework assumptions correct? In this example, the
> board-level information on which interface is used for what
> functionality trickles down to the lowest level of the DSP driver
> implementation.

I'm unclear as to why this is the only mechanism for supporting a
platform - it's the only way currently to achieve multiple cards with
the current code but there's an assumption there that we need to do so.
If we start from the assumption that we have to split a given bit of
hardware between cards then it currently follows that the driver for
that card is going to have to register multiple components, but that's a
bit of an assumption.

> I believe this breaks to some extent the 'clean' split between
> platform and machine driver(s), and it's not quite aligned with the
> usual notion of register/probe used across frameworks, be it for
> drivers/clocks/you name it.

This is something which does cause issues for these other frameworks,
and it's something which we were having some trouble with in ASoC when
components were added.  Where there's interlinks between parts of a
device something needs to know about them and coordinate to avoid or
resolve any conflicts in requirements.  This was causing issues for ASoC
when DAIs didn't know about things like shared clocking - drivers ended
up having to invent components for themselves.

> A similar case could happen in a codec driver, if independent
> functionality such as headset and amplifier support was exposed by
> separate cards, that would in turn mandate that the codec driver
> exposed N components, each handling different functionality but the
> same type of DAI.

If a device genuinely had a bunch of completely independent blocks that
just happened to be packaged together I think that would be a completely
sensible implementation TBH, it's just a MFD at that point so there's
very little reason for the different components to even be the same
Linux device other than a presumably shared control interface.

> An alternative approach would be that the DSP driver exposes all the
> possible DAIs that can be used, and the binding is refined to allow
> for more flexibility. I think it's really the individual DAI that
> cannot be used by more than one card.

There's a bit more going on than just that DAIs can't be shared (and
indeed one might ask questions about splitting bits of a DAI up, for
example do playback and capture *really* need to go to the same card?).
It's also that the clocking and routing within the component need to be
coordinated and if multiple cards are talking to the same component both
the machine drivers and DAPM are going to need to understand this and
handle it in some sensible fashion.  At some point you then end up with
something that's got the internals of a single card providing muliple
cards to userspace only with a more complicated implementation.

This means we get back to the assumption we started off with - what are
we gaining by partitioning things into cards when that's not really
what's going on with the hardware?

--KBbepe4hUut5mCZN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJxcBgACgkQJNaLcl1U
h9Dq8gf/e6YqM4/LpW41o2d+FufHfFIkDVhVG3ZelzSlnyUj9+2GWWV6TDU67wMO
99fRRylTigPltwZK7DlSTJAtK+ktBpTlQuLQ40wmE2a0WEBxzM2HcWTJJB819Oyl
bRRz8T4ss5ZzLYpon8V2HC4GCdhHK1uyOoXnZW0qZJBvswTKjf5uaAtwy8ZB3RR5
/VSf/XJZcSnrVbzDAm+TD2pdsFX/BOv6HaJCr1xtqJfdsCHOaCmHp4Fclh86HIko
7GEW67G7++5P9lcTCaHG7GaPEw1zBkXuEHW/Nl5+nZJ2qvLXKAWhPT7hr1UF2ruD
V/rNrDcpfqhojfx47WoYxdsUNY+j/Q==
=hg7N
-----END PGP SIGNATURE-----

--KBbepe4hUut5mCZN--
