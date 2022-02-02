Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A684A7366
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Feb 2022 15:42:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5259B16D7;
	Wed,  2 Feb 2022 15:41:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5259B16D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643812959;
	bh=V+7FtyxQORUL16raB2ZOJzrcEcDaRVfLi210qqcPKeQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KU47sB6ZdWsfd678xweRMWf9IrDjG/v2thH40uj85JFMUxbiVEcJba/Yoyc5Qf2Pi
	 tOjPT1isUZJe/+FwhefEhbMIoheCrF2Pyfit91ZZwMhoQ7xZ1yCwMP2q0mZT1pgCki
	 WtTUPyGxs6LO59BG38obS+JVFgwH/Rq0RtGitkkU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEEE9F804B1;
	Wed,  2 Feb 2022 15:41:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F7D6F804B0; Wed,  2 Feb 2022 15:41:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_155,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1F27F80130
 for <alsa-devel@alsa-project.org>; Wed,  2 Feb 2022 15:41:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1F27F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jQLQwsyR"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B0517B830B5;
 Wed,  2 Feb 2022 14:41:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71206C340EB;
 Wed,  2 Feb 2022 14:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643812884;
 bh=V+7FtyxQORUL16raB2ZOJzrcEcDaRVfLi210qqcPKeQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jQLQwsyRyUhq6lIQSqbCXFfkSTorAcPL/3i3NkldaTBm7SnGKHhcFKYVQW5er0WwU
 dIh9GwcreU9pB6Jwe/oja4+oBRiI0m4Kp0LfuCM7CIhfV0hI1b66Gp+PFBp7usgTb2
 hbj+vNcp9fCoqqao8hIBHFkCF2jSxFICxUxUhzA2lStqInlGTTo4xPTi2Czo2QklQA
 lUbi1CLbUyDVHEJPREPZChvk+5SvROsjmI5BsZO4P1YWJUzsTd9Bhlt8bKn5GLBW4P
 hKTcUhgVRbsWa1d4VuTQzfiYvajF9W5XjeW6rBl1ZEyJZTchP/IDvJSZwaDjAuFRqJ
 /1TdHIgKjkJtA==
Date: Wed, 2 Feb 2022 14:41:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [RFC 00/37] ASoC: Intel: AVS - Audio DSP for cAVS
Message-ID: <YfqYDkXQsyLOzfdp@sirena.org.uk>
References: <20211208111301.1817725-1-cezary.rojewski@intel.com>
 <YcXFwTmP6k1Zfbw9@sirena.org.uk>
 <fecf5a0a-c2b6-f4a0-b4b1-d8243ea324a0@intel.com>
 <YfQhIoXTkzO9AEQc@sirena.org.uk>
 <ccb2f9f0-e9fa-3215-f623-bac58b4c9633@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="OfUjiIDbzR2HSU5S"
Content-Disposition: inline
In-Reply-To: <ccb2f9f0-e9fa-3215-f623-bac58b4c9633@intel.com>
X-Cookie: I will never lie to you.
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, harshapriya.n@intel.com,
 yung-chuan.liao@linux.intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, peter.ujfalusi@linux.intel.com, lma@semihalf.com
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


--OfUjiIDbzR2HSU5S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 30, 2022 at 08:15:26PM +0100, Cezary Rojewski wrote:
> On 2022-01-28 6:00 PM, Mark Brown wrote:

> > AIUI the firmware itself has a bunch of DSP modules that can be
> > dynamically instantiated and what the path stuff is doing is providing
> > fixed sets of instantiations that can be switched between.  It seems
> > like it should be possible to pull out the bit where we have sets of
> > modules we can instantiate from the mechanics of knowing what modules
> > are there and actually setting them up and tearing them down, other DSP
> > implementations would probably be able to benefit from that (at least
> > the larger ones) and I imagine more advanced users would find it useful
> > to be able to reconfigure the DSP pipelines separately from getting
> > firmware releases.

> There is also a notion of 'pipeline'. In cAVS ADSP case, almost all modules
> require parent pipeline in order to be instantiated. Mentioning this as
> modules alone are insufficient to create an audio stream.

> 'avs_path' is a runtime representative.
> 'avs_path_template' is a recipe for avs_path. All templates are created
> during topology load procedure.
> No modules or pipelines exist on DSP side until driver begins the
> (CREATE_PIPELINE + INIT_INSTANCE) IPC sequence. That happens during
> ->hw_params() callback of a DAI.

That doesn't sound like a particularly unsurprising requirement for
firmware to have TBH - I'd expect we'd need generic handling for
partially constructed paths, including only actually instantiating them
when they're complete (in a similar manner to only powering on analogue
paths when everything is joined up).

> So, avs_path_template provides a fixed set of recipes to create concrete
> avs_path what effectively creates modules and pipelines on DSP side.

Sure, I get that that's what it's doing.

> path-API found in path.h is limited and maps nicely to DAI operations:

> avs_path_create()
> avs_path_bind(struct avs_path *path)
> 	used during DAI's ->hw_params()

> avs_path_free(struct avs_path *path)
> avs_path_unbind(struct avs_path *path)
> 	used during DAI's ->hw_free()

> avs_path_reset(struct avs_path *path)
> avs_path_pause(struct avs_path *path)
> avs_path_run(struct avs_path *path, int trigger)
> 	state setters, used during DAI's ->prepare() and ->trigger()

> given this picture, one could say that there are framework elements that
> allow driver writer to implement whatever is needed for DSP-capable driver.

Right, which points towards pulling bits of it that can be made generic
out of the driver and shared with other DSP implementations.

> And now back to the _full picture_ that I'm clearly not seeing yet. How do
> you envision interfaces that should be added to the ASoC framework? Are we
> talking about soc-path.c level of a change? It would be helpful to have even
> a single operation (from the list above) drawn as an example of what is
> expected.

I don't have an off the shelf answer for you here, like I said half the
thing here is to split this out from the rest of the series so it can be
considered separately.  The digital domain stuff is obviously key here,
the main extra bit for any sort of dynamic DSP routing seems to be
working out a way for userspace to set up and remove new paths - that's
probably new userspace ABI.  Perhaps that's a runtime thing with initial
setup in UCM.  Or perhaps it's better to have something closer to what
you have done but split out like topology is so that the bulk of the
code is reusable with other firmwares and there's a thinner layer with
the firmware specific bits in it.

--OfUjiIDbzR2HSU5S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmH6mA0ACgkQJNaLcl1U
h9Aiywf/dz4Gjqo7zbgkJrhm+MpDjvXoQALeBbq0fsnJqqe9Vx0PHOItynhDpVBX
4Eh/q9mWRd9A+hCaEgukm4zp4fqfz1kYnaal+dfhU8vwexHBfzXwaWXXKIBCW/me
TsjgTWlGbG3kS1zOqydOI1VQ/2S8Vn/3KIyuebTE+lVdrMny+75vaZq6LqeetAWE
FvgnYsB3qojlSxbIxWuRr6vFRpqGhgaUjAesyvo2rA7w5fb6mceF2BV3ninmd74m
2vztR5ERv9pgocQQeFjtPeoNu4sS/Cw6EAc3Cpb6VUi1X0hiour4sLskkkyJ7kCj
pzkhpAq2Ia0tcIiaMYQpw+C+aXxPTQ==
=qEqN
-----END PGP SIGNATURE-----

--OfUjiIDbzR2HSU5S--
