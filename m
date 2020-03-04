Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F94D179493
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Mar 2020 17:11:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72FDE166F;
	Wed,  4 Mar 2020 17:10:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72FDE166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583338266;
	bh=s3TF4WL3MaslzgAqaQFrV3WsMgeYgAAuiMDowInkXbI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oU8FXixfRMnOSXmrUu30zusr5zeAuGQp1ypCe0oaGgjcLn9O2mQTzqjX+sVYvmjRj
	 D1KaFT4qy4e6AFzZzevtBVk9Gv/VulUyDvHPG5ATrgAX3B/O/5y6o7r4fbKwr0HWfS
	 7o0C/0WU68xHVlTMkC9SVQ9wkabWC8YdlvraIG7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37418F801F5;
	Wed,  4 Mar 2020 17:09:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D71C1F801ED; Wed,  4 Mar 2020 17:09:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS
 autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 791D5F8011C
 for <alsa-devel@alsa-project.org>; Wed,  4 Mar 2020 17:09:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 791D5F8011C
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5408031B;
 Wed,  4 Mar 2020 08:09:18 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C8AED3F6CF;
 Wed,  4 Mar 2020 08:09:17 -0800 (PST)
Date: Wed, 4 Mar 2020 16:09:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: 5.5.y - apply "ASoC: intel/skl/hda - export number of digital
 microphones via control components"
Message-ID: <20200304160916.GC5646@sirena.org.uk>
References: <147efa37-eb57-7f17-b9eb-84a9fe5ad475@perex.cz>
 <20200304154450.GB5646@sirena.org.uk>
 <a6d57c14-0794-77d0-5c6f-c0c897d254b5@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lMM8JwqTlfDpEaS6"
Content-Disposition: inline
In-Reply-To: <a6d57c14-0794-77d0-5c6f-c0c897d254b5@perex.cz>
X-Cookie: Tomorrow, you can be anywhere.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Sasha Levin <sashal@kernel.org>, Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Pierre-louis Bossart <pierre-louis.bossart@linux.intel.com>,
 stable@vger.kernel.org
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


--lMM8JwqTlfDpEaS6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 04, 2020 at 04:53:27PM +0100, Jaroslav Kysela wrote:
> Dne 04. 03. 20 v 16:44 Mark Brown napsal(a):

> > This looks more like a new feature than a bug fix and I've been trying
> > to get the stable people to calm down with the backports, there's been
> > *far* too many regressions introduced recently in just the x86 stuff
> > found after the fact.  Does this fix systems that used to work?

> The released ALSA UCM does not work correctly for some platforms without
> this information (the number of digital microphones is not identified
> correctly).

That's not the question I asked - have these platforms ever worked with
older kernel versions?

> The regression probability is really low for this one and we're using it in
> Fedora kernels for months without issues (in this code).

It's partly the principle of the thing, if it were just patches that
had individually been identified as being good for stable by someone
with some understanding of the code (like this one :/ ) that were being
backported I'd be a lot less concerned but the automated selections are
missing dependencies or other context and people are reporting problems
with them so I'm inclined to push back on things.

--lMM8JwqTlfDpEaS6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5f0qsACgkQJNaLcl1U
h9BadQf+O1EQDc7YktVj1dC5/GTJz8ZI39rao4i3XGtN7dx08fwW2RXYC18WBt+x
riZeag6zydhoqeV55meXCXfC2jLybdLPqmVmVaRd6nKm1oTeaounn0gs7ftCGkz4
gWcnYcKpOuDbKFRqY8BDZX9f0LwO0huWXRm8+AAaflC0504sJuIerJXZcX3feFmG
e5ISl0zjH1CUYglUmhpDc/KCuEBF2V+o6zz54klclEgmGYlSJe3eC6JJOX3XrO/p
N3Tp0rgUVpgF2bcskQtdDx8KeOyejo8wf8a7MV+fG9daHi0Wr4HPBsCcHSvd1OHy
phspjKXc1sWogPFibsNvaF22PQWA0g==
=1QQV
-----END PGP SIGNATURE-----

--lMM8JwqTlfDpEaS6--
