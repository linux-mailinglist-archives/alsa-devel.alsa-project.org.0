Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E87A41797A0
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Mar 2020 19:13:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8250B1655;
	Wed,  4 Mar 2020 19:12:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8250B1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583345585;
	bh=vA7g5dPLXq3EmuUTwr5RPlrZ43zj+w9feEjuGKs2yIQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gr9d1FZOG34CMOag2cNVi5INtxMUDlBbqNMnfxnkmmo2g/hxLGYYHSA+AV9MMGFrc
	 b/HAXM5vAG3U+G+eNdJhij1h93CJMc0C54vcwuIBaKQAE+FbvCPvLy6278RFlRopBE
	 L71IDK5YB7eWhE7WSIle16DUaZmnBXuOXpe7i2PI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94240F801F5;
	Wed,  4 Mar 2020 19:11:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C87F8F801ED; Wed,  4 Mar 2020 19:11:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_30,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 078B5F8011C
 for <alsa-devel@alsa-project.org>; Wed,  4 Mar 2020 19:11:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 078B5F8011C
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1363E31B;
 Wed,  4 Mar 2020 10:11:15 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 89EA13F6C4;
 Wed,  4 Mar 2020 10:11:14 -0800 (PST)
Date: Wed, 4 Mar 2020 18:11:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: 5.5.y - apply "ASoC: intel/skl/hda - export number of digital
 microphones via control components"
Message-ID: <20200304181113.GE5646@sirena.org.uk>
References: <147efa37-eb57-7f17-b9eb-84a9fe5ad475@perex.cz>
 <20200304154450.GB5646@sirena.org.uk>
 <a6d57c14-0794-77d0-5c6f-c0c897d254b5@perex.cz>
 <20200304160916.GC5646@sirena.org.uk>
 <44cf4ff8-120f-79fd-8801-47807b03f912@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zaRBsRFn0XYhEU69"
Content-Disposition: inline
In-Reply-To: <44cf4ff8-120f-79fd-8801-47807b03f912@linux.intel.com>
X-Cookie: Tomorrow, you can be anywhere.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Sasha Levin <sashal@kernel.org>, Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>, stable@vger.kernel.org
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


--zaRBsRFn0XYhEU69
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 04, 2020 at 11:17:41AM -0600, Pierre-Louis Bossart wrote:

> > That's not the question I asked - have these platforms ever worked with
> > older kernel versions?

> Yes in that digital microphones have been enabled for a very long time (5.2
> if I am not mistaken).

> No in that the automatic selection of the SOF driver was only enabled for
> v5.5. In other words before 5.5 the user or distro needed to blacklist the
> legacy snd-hda-intel HDAudio driver to get DMICs to work.

Ugh, so it is actually fixing a regression since older releases would
have been using snd-hda-audio?

> This patch also removes the need for userspace configuration, pulseaudio now
> directly receives the information on the number of microphones. It was
> provided days after the merge window was opened, but the intent was that
> v5.5 was the first release where users don't need to muck with configuration
> files.

If you're sending patches after the merge window has opened you've
obviously missed the boat, things need to be in -next before the merge
window.  If that's a problem for your schedules that's unfortunate for
you but not really relevant upstream, you need to ensure that people
know that getting features depends on upstream review which definitely
isn't going to happen if you don't post the patches before the merge
window.  If things are important you should ensure they're out there
well before the merge window in case there's any issues with review or
the merge window opens sooner than expected for some reason.

> > It's partly the principle of the thing, if it were just patches that
> > had individually been identified as being good for stable by someone
> > with some understanding of the code (like this one :/ ) that were being
> > backported I'd be a lot less concerned but the automated selections are
> > missing dependencies or other context and people are reporting problems
> > with them so I'm inclined to push back on things.

> You are correct that the process can appear confusing, mainly since the
> initial patch was contributed after the merge window on November 26.

I'm sorry but I'm unclear what process confusion you're referring to?

> Looking back at the emails, I didn't see any objections but somehow the
> patch never landed in 5.5 updates. Jaroslav's intentions and work are not
> without merit, we really appreciate his ucm2 work, and I support this
> integration on v5.5-y to make the life of downstream distros simpler.

If something is a fix you need to clearly identify it as a fix when you
submit it upstream.

This thread is the first suggestion I've seen that this is any kind of
bug fix.  There's no Fixes tag and the patch description itself sounds
like it's adding a new feature to enable new functionality in userspace
(autodetection by UCM) and it was posted as part of a series "ASoC: SOF:
initial cleanup for DT and multi-client support" which again doesn't
give any indication that this might be supposed to be a bug fix.  It
looks perfectly fine as a new feature so of course there were no
objections.

> Would it help if we provide a Tested-by tag with 5.5-y + this patch applied?

It won't hurt but that's not really the point here.  Lots of new
features don't actually break things if they're backported.

--zaRBsRFn0XYhEU69
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5f70AACgkQJNaLcl1U
h9DppQf/b8md+uJKsr0+NafbYHSI82VSWEyxU/I9t05+Yy2YBws9VVvlho1EILvB
t1e45VA2+kirbyhO+QKiwgM2JIOgD/XAXwxxnFsE0S2xahcaWT+/g2nACut0pWp7
G5MOwH48WpotWvx2xSIch84GgCTUa5EaBtWQVTUl+X6tcnUmMcRvu3Gn92pYRCWY
z/nbG1roRgz3rzLHs0TFMR21ZxlHPcPn+t9Shdah3ry/VUZx3ULosjzN7ZHF0P5U
sp0ugWReUAsiSO2fi8n+SQDUMvD5tj4N621Nyz34qtsAIjJk3PBKbbeD2VY6lwoa
bFEfGDEQqq7u7btlT8wWe9jU7Wn4ag==
=ONVg
-----END PGP SIGNATURE-----

--zaRBsRFn0XYhEU69--
