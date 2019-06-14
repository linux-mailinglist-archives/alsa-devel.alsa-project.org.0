Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9B946479
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2019 18:39:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA9F6187E;
	Fri, 14 Jun 2019 18:38:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA9F6187E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560530367;
	bh=RL1W+6g+rHSZroQWFYzY6sL0xHxyxOimOsa8R8uJtGw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gHi2b5ZBUejvbIEkgYeMRriTyPI33p5OaHi3x8HY0SZ8AVTSbFNnU0VkvA7b+Gz1N
	 PztzfqzIFCuxvbqLShpdzsZ/jpsYw1//drN8ECj24UBmKFMYI0paALx4Eq2tRTnweb
	 yHaIc5Vk6l4vNcfA9ND5v8BwcEZl0phwz7dqblJI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76652F896E3;
	Fri, 14 Jun 2019 18:37:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC47EF896E0; Fri, 14 Jun 2019 18:37:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB505F80794
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 18:37:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB505F80794
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="r83EcR05"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nhL7Pe+vtxSmMIOy2ZjlKJGyJRQn/3Ic9kfvsEMtYos=; b=r83EcR05/OUvRji2johtiRoc0
 kFw/Cn0elQ91ZobPgiBiJh1rX3NrdYDbrExoY9M5n4STHwVp0J/aSxATtK8W8ce4xTvURSdcKrcKN
 tSr1kIZRMCNR4+y8Jcx6U4oUtSdUeB0iZjscRu4VXpTzhb+kIaEHaOP3RQL+Rmx0di2No=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hbpCq-0008Nz-Bh; Fri, 14 Jun 2019 16:37:36 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id AC3B9440046; Fri, 14 Jun 2019 17:37:35 +0100 (BST)
Date: Fri, 14 Jun 2019 17:37:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20190614163735.GE5316@sirena.org.uk>
References: <20190614094756.2965-1-gregkh@linuxfoundation.org>
 <20190614151410.GC5316@sirena.org.uk>
 <20190614152704.GB18049@kroah.com>
MIME-Version: 1.0
In-Reply-To: <20190614152704.GB18049@kroah.com>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/5] sound: SoC: sof: no need to check
 return value of debugfs_create functions
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
Content-Type: multipart/mixed; boundary="===============3011803621628023914=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3011803621628023914==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xnH/NIbSm9ew9GxF"
Content-Disposition: inline


--xnH/NIbSm9ew9GxF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 14, 2019 at 05:27:04PM +0200, Greg Kroah-Hartman wrote:
> On Fri, Jun 14, 2019 at 04:14:10PM +0100, Mark Brown wrote:
> > On Fri, Jun 14, 2019 at 11:47:52AM +0200, Greg Kroah-Hartman wrote:

> > >  			dev_err(sdev->dev,
> > > -				"error: debugfs entry %s cannot be read in DSP D3\n",
> > > -				dfse->dfsentry->d_name.name);
> > > +				"error: debugfs entry cannot be read in DSP D3\n");

> > This appears to be an unrelated change with no description in the
> > changelog, please split it out into a separate change with a description
> > of the change.

> The whole "dfsentry" variable is now gone, so it is very related.  Why
> split this out?

The removal of the variable isn't mentioned in the changelog at all or
otherwise explained in what *should* be a mostly mechanical change.
When a patch is doing something that doesn't match the changelog that
sets off alarm bells, and when there's something that's mostly lots of
repetitive mechanical changes with some more other reorganization
mixed in it's a lot easier to review if those other changes are split
out.

> > I might be missing something but I can't see any error logging in
> > debugfs_create_file() so this isn't equivalent (though the current code
> > is broken, it should be using IS_ERR()).  Logging creation failures is
> > helpful to developers trying to figure out what happened to the trace
> > files they're trying to use.

> There is no need to log anything in in-kernel, working code.  If a
> developer wants to do this on their own when writing the code the first
> time and debugging it, great, but for stuff we know works, there's no
> need for being noisy.

If it helps maintainability for people to get diagnostics I'm all for
it; it's not like this is a hot path or anything.

> Also, the check is incorrect, there's no way for this function to return
> NULL, so that code today, will never trigger.  So obviously no one
> counted on this message anyway :)

I went and checked into this having seen that the core code (which I
definitely know used to trigger) also checks for NULL and discovered
that the reason this happens is that in January you applied a commit
which changed the return value from NULL to an error pointer which broke
any caller doing error checking.  That's not exactly the same thing as
nobody ever finding something useful.

> Just call the function and move on, like the rest of the kernel is being
> converted over to do.

This is something you've unilaterally decided to do.

--xnH/NIbSm9ew9GxF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0DzU4ACgkQJNaLcl1U
h9DyXwf/YZPRQKYmpAxv9K/g5bazQeVf93sBE2bjR67odekWDPeg60MhIe45VABA
AYpn2tuwfxIbNM0lkJB8vYKk0HN9q7rW/zUt0HdVKShIU3nG303zUXO5sCTkmvGb
J9eqW3OnWAL0EVYv9cO0rq4Rxn+I8lRZZ2mLVZEJE5RgdsWWz6AzKkG/IakbZlD7
oCY3M/HJg2dwsgLfCarEinIIQ2vf34A8C34VMfdVTdYYXBcOROOc3sPdmcTsf4wN
s6QdWzWkYhim8OVz2kSpQM8mP+iMK8i5GtM5ph7+6mCGrq1n4DWXz8ZrcF2aDhTa
BnAtfVALq76cTgJ36szcCic/wrh1Pw==
=rmtG
-----END PGP SIGNATURE-----

--xnH/NIbSm9ew9GxF--

--===============3011803621628023914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3011803621628023914==--
