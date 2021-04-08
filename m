Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D593589A7
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 18:24:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66101165E;
	Thu,  8 Apr 2021 18:23:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66101165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617899084;
	bh=D+tn/w5l8O3tzKKSCtjZ9l9a89ybtpqG9X6D8wuuI04=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h1WM+URKDLJPtn8oQAQjKd5Mj1d4Q4g/281GFTvLRVu4zyy3hyAzbzmiBFGs/iUz+
	 4vXUun16FbbDTXz0esBrA6rSXzufQUJpjf3VO9kJOflpN4ZI0G24qDkCnkJ+K2A4c3
	 +joGmv5y+rJJEm43k/X83edjsF9X+C6rNITh1dkA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAB1DF80246;
	Thu,  8 Apr 2021 18:23:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1E93F8020B; Thu,  8 Apr 2021 18:23:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE911F800BD
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 18:23:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE911F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Gre8jTt4"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 50EC0610D1;
 Thu,  8 Apr 2021 16:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617898989;
 bh=D+tn/w5l8O3tzKKSCtjZ9l9a89ybtpqG9X6D8wuuI04=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gre8jTt4q3taR2BiZ32yWDgbbKiysFGI2eVems+oo39X1K6oY96DDM2WaoXJLRasu
 4NgDw5XTMfeLLwHjpAyTD3lbv1CL9LmwzscEzafA5G0/iB1iSo0Fr3YAzvpoKp3xwC
 N+6TgXy75raBCzlZZbbpMM3qqab+ewbdf4mbPomAsWa5d8DXgTxU4TlqH0S3mG0uFT
 0kcg8sN5vRZLMbltd8i1KAE+68feolTKCrxYetQ4XriTMOSM0SjDaIcTm/fDPi/PYS
 vSASmEBvZ5dybxaapeVC88sDLR2nerf7vSM0uuxclhAYA04fZGCbPRG4E8+70ia/uW
 GlZ+JHFIawhRQ==
Date: Thu, 8 Apr 2021 17:22:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH] ALSA: core - add more card sysfs entries
Message-ID: <20210408162250.GN4516@sirena.org.uk>
References: <20210408094314.1322802-1-perex@perex.cz>
 <20210408103819.GA40407@workstation> <s5h35w182a5.wl-tiwai@suse.de>
 <45acc908-3603-3479-9fb2-5206339a9ace@perex.cz>
 <20210408120502.GA4516@sirena.org.uk>
 <s5hpmz47w3i.wl-tiwai@suse.de>
 <56c874ae-e801-63df-19fa-a1325f6104ca@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FhKpTYimqQF2+bfE"
Content-Disposition: inline
In-Reply-To: <56c874ae-e801-63df-19fa-a1325f6104ca@perex.cz>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Pierre-louis Bossart <pierre-louis.bossart@linux.intel.com>
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


--FhKpTYimqQF2+bfE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 08, 2021 at 05:01:14PM +0200, Jaroslav Kysela wrote:

> There are two things to consider (please, don't concentrate to UCM here):

> 1) the card identification
> 2) the user experience

> Actually, the generic ASoC drivers are too much generic and they didn't
> provide a solid information about the hardware.

So if the information provided through the driver is too generic then we
should ideally be fixing those drivers/systems to do something sensible.
For the DT systems the generic cards have properties that let the system
just specify names directly so it will just be a case of setting them
properly and it should just be the x86 systems that are a problem.  ACPI
is a bit of a lost cause here, most of the systems aren't interested in
supporting Linux in the first place and the idioms there aren't great,
but for DT it's reasonably tractable to push back on people if there's
issues and it's much more scalable to do that than telling individual
users to do that.

> As you can see, the information for both drivers is quite inaccurate and users
> (including me) may want some flexibility to change those strings to something
> else. It may resolve some UCM problems, but it's just one small piece of the
> issue.

It feels like if we're conflating end user configuration and what we're
reporting to userspace for userspace to key off we're going to end up
causing confusion and/or tying ourselves in knots when people update
both places, for example if you're trying to figure out which
configuration was used but the values used to select the configuration
that was used have changed.

> Another issue is when the udev driver loader can change some parameters which
> modifies the driver behaviour and sound device structure for the given card
> (as discussed in another thread).

Not sure I've seen that thread, I've certainly not seen anything on
github.

> When we have a common standard layer for the plug-and-play handling (udev), we
> should concentrate to allow changing / refining of this information there.
> Those strings are not used for anything else than the user space. So from my
> view, there's no reason to create another mechanism to handle the overrides.
> It should be a safe, fast, flexible and _optional_ solution. The udev can
> alter the sysfs attributes directly without any hassle with the file
> modifications or looking for another way to pass / store this information
> somewhere.

We could add a new sysfs file for user overrides, or alternatively have
a new non-overridable file which contains whatever the kernel would set
by default so it's always available in case things start to get
confused (ie, you can always look at the original value even if it's
been overwritten later)?

> > Didn't we discuss in the past about the possibility to store the
> > profile name in the card component string?

> It's already possible to extract any information from the components string.
> The current UCM is very flexible, but it does not allow to use a missing
> information.

> The main questions is: Can we make those strings writable or not? What
> prevents us to not allow that?

Like I say I'm nervous about potential confusion if we allow people to
change things that were already set and used by the kernel, plus the
general desire to encourage better quality of implementation from
firmware where we can.

--FhKpTYimqQF2+bfE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBvLdkACgkQJNaLcl1U
h9COXAf/bg8BTnPPwBGQdfqQ1oJPB5T5CSxPOyzRzTUQW7maS2BLgGZdfj+QQN5u
IgXoAw6ivEG0MHue7TGAsR9inJuVbESkovhoA3R1OGLkWTnzxpkcudGEDow6XHuD
XDBMMV+PHeFtW5DOabYivIEtTaT6mMdieGzdsohYm0L1oNtHrrXtUbgkWnEk7opX
KzOfhEyfUGCclxuhvhE/oa5A+0yWouqBw9B4HVFkkNnySGK3EuT/Iy+VfHyaSZHv
/26mONas/dKsFB9amX9iBVhNFM3bkhP/L73CC/mn8q0rytG0wFC/aSG/FfhOMQpm
ffY3NFHt5piBJIS2AGDOwbRzG8ddOw==
=kaPQ
-----END PGP SIGNATURE-----

--FhKpTYimqQF2+bfE--
