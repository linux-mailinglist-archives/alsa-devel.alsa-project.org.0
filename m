Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3EF47EEEA
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Dec 2021 14:07:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7402917C7;
	Fri, 24 Dec 2021 14:06:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7402917C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640351249;
	bh=jqDihsWHro9ioRFJxyEE8H4W08vqVGrYWcRp/NdLeK4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tbRi43bmqtYEGPiTKj1597F9WrfhyjnEd4YPzcpeouIFjyYuHpOaHD8wB1C1rimcU
	 aSw5zi0QaSK+bb7Gb0IRWzKFalo9wL6Vg0JrIn7DXNA1rjLkoVf0XPvqlwp+p38S7C
	 0cUyjbxpMNZHDqubcng2ILVvcZFL2bkdl5NSf2DA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7028F8013F;
	Fri, 24 Dec 2021 14:06:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CADAEF800FF; Fri, 24 Dec 2021 14:06:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 835A2F80084
 for <alsa-devel@alsa-project.org>; Fri, 24 Dec 2021 14:06:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 835A2F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Y9B6QkWW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 81F2762043;
 Fri, 24 Dec 2021 13:06:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21E05C36AE8;
 Fri, 24 Dec 2021 13:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640351172;
 bh=jqDihsWHro9ioRFJxyEE8H4W08vqVGrYWcRp/NdLeK4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y9B6QkWWZqja64ZL7MlpZ3A0p2Rso0kUouAx2j7ETC5UxeWe77IjVsDLnx7BKX7nO
 AwEZ6QbsbV8eMudU1Gq8zTWC0Z93cB7HtOIfV7KDIqDLSEjceyoCbOskEnvcDeM0nw
 9DW706p5bmqoy2fTkrzPAeYP+XdjZT8DP80TgNm9c4JRQq40z+hOEPDmHTN/CVNnQk
 SmFXB/IOeSBx+W7ZZxW9lJvp7OcSh39H3k9cScVxyRe37T9LF5sdHnu0HdHjQdr2ao
 hqBWG+YfIhwzxv4oj6LPfFnO2qkKlzhm9N63Vje/TOSlBPCKkM9XD2MgbSUAo3B8+t
 g1QCf/5XhOgNQ==
Date: Fri, 24 Dec 2021 13:06:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [RFC 00/37] ASoC: Intel: AVS - Audio DSP for cAVS
Message-ID: <YcXFwTmP6k1Zfbw9@sirena.org.uk>
References: <20211208111301.1817725-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nUGgKrysvtgJD+av"
Content-Disposition: inline
In-Reply-To: <20211208111301.1817725-1-cezary.rojewski@intel.com>
X-Cookie: I brake for chezlogs!
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


--nUGgKrysvtgJD+av
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 08, 2021 at 12:12:24PM +0100, Cezary Rojewski wrote:

> A continuation of cleanup work of Intel SST solutions found in
> sound/soc/intel/. With two major chapters released last year catpt [1]
> and removal of haswell solution [2], time has come for Skylake-driver.

...

> Note: this series does not add fully functional driver as its size would
> get out of control. Focus is put on adding new code. A

So, I've spent some time looking at this but I think there's just
too much in this patch set for me to get through in a timely
fashion even with the efforts you've noted above in that
direction and that the best thing to do is to look at how to make
things a bit more managable.  It's a big series and the time of
year does mean time for review is a bit more limited.  From that
point of view I think the big thing to do is to reduce the amount
of interesting or new things that are being done and make the
series a simple as possible.  That'd be a limited but hopefully
routine driver which should be much easier to review and would
allow the more interesting bits to be focused on separately
without getting lost in the bulk of code that's more routine.
This applies more to bits at the top of the stack that interface
with the framework than DSP/hardware facing bits (eg, stuff like
the tracing is not really getting in the way).  Tactically the
code is basically fine, there's going to be some issues but
really it's the big picture stuff that needs more consideration.

In terms of things that could be split out there's a couple of
big things that jump out.

One is the paths code which feels like something that should
perhaps be pulled up a level to the framework since it feels like
the problems that it is addressing are general problems that all
DSPs face.  Doing something like hard coding this to some very
simple use case that does minimal to no processing would allow
the driver to load and function, then the path code can get a
proper review separately.

The other thing is the instantiating of multiple machine drivers
on a single system.  That's something I've seen occasionally from
other vendors and I do have concerns about how use cases where
someone wants to route audio in ways that result in cross links
between cards so those ended up being integrated.  The question
here isn't really if it works in testing (no matter how thorough
that testing is), the question is if userspace software doing
generic things will be confused by it and if some combination of
future framework changes and user creativity can turn up issues.
There's also the issue of how quirk handling would work in this
setup, and the issue with needing another set of machine drivers.
It's one point where input from users and distros would be
especially good.  This would be harder to cut out for later since
there's not so much code which supports it directly (TBH this is
part of the concern), one thing might be to just only support a
subset of hardware (eg, HDA only or I2S only) such that only one
machine driver can ever be instantiated on a system.

One more tactical thing is that I did comment on earlier was the
use of atomics - in general atomics are error prone and hard to
reason about, unless you're doing something like transferring the
audio data using PIO it's probably better to use higher level
concurrency primitives.  Any performance difference is unlikely
to register and the maintainability is a lot better.

It'd also be good to get this well enough integrated with the
intel-dsp-config code to avoid the need for the dependency on
SND_SOC_INTEL_SKYLAKE_FAMILY=n.  If both are built then it could
start off with always require a command line override to select
the new driver with a _DSP_DRIVER_AVS constant, this can be
revisited later.  That mechanism is really nice for distros and
users since it allows people to do binary distributions without
having to worry about committing to one driver or another,
reducing the risks for things like breakage on upgrade for some
small subset of machines.

--nUGgKrysvtgJD+av
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHFxb0ACgkQJNaLcl1U
h9Cd9Af/dyrnbwAElC8zHKsfhf0hMWnuhZj4AszTQPafcwCVjZkX+SpKasrYi8AT
vvSA+OCyVwBvDGJsaxcTZITRTADOtDk0hjCWjOQFJvdJe8HI0R5fI2c0w0MA46FQ
SS2FPB9STxo7DQ2eCVeQMjnsnI5EUnsc9W84F6e+q2JhSvj+pJ2sq+u0VGqrXp7s
tf49M97TyebHwn0zYetNuScbGPMLMbmhWSFU9KxVFrd2ZLAjRJAc5RXSTahgkJ2h
x/fkRVFNiyodCT6FlsVjX47saRR5ikVXXxL72ZesRcsm7JvnIjKj7L2UfNGHZaCA
/WJgS6VlFl8e+FCqHPtU6w3u+Lsqjg==
=AWVX
-----END PGP SIGNATURE-----

--nUGgKrysvtgJD+av--
