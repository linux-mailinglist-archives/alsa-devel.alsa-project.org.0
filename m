Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E00D280855
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 22:20:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F235A1ABE;
	Thu,  1 Oct 2020 22:19:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F235A1ABE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601583610;
	bh=MTEKAcEF/oYmyDCKPCHFTk/TX9x66KT8Q1w0KMarPNo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MOm7Kf/AqFhi4DbEhQJLgYq+QjJ7bnoigGnB6aDLQxl+vxqYZmqC3ukant5g2n/b2
	 WH1Gqtst8v24+LCTfGwMW7Lm4wXyo54Pa8gcObskO5OkeqjePOKIWGVcZq6t1zp84h
	 CZIaTdSwybfokRHKDYRe/nowb+8d/A5O83FsSn1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A185F800AB;
	Thu,  1 Oct 2020 22:18:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 956FAF801F5; Thu,  1 Oct 2020 22:18:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0775F801D8
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 22:18:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0775F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="B+iKfUiE"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 877502074B;
 Thu,  1 Oct 2020 20:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601583498;
 bh=MTEKAcEF/oYmyDCKPCHFTk/TX9x66KT8Q1w0KMarPNo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B+iKfUiEiKJ1eRepYpARa7sX0gfDtDeA6Ubc1Iv2+5pX6CspYdsx7+J/wFxUaENxq
 SKpSXpmnaeF4pNiTy1CAOdCR3ZrIHqcAFWniKn/M1ZHil4YHJ8GqbzUTuEFd3OkTgV
 TKWlmPHVgty0eh+m5U8Rl3GJknUEIfP/FwI0VO+4=
Date: Thu, 1 Oct 2020 21:17:18 +0100
From: Mark Brown <broonie@kernel.org>
To: "Ertman, David M" <david.m.ertman@intel.com>
Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Message-ID: <20201001201718.GZ6715@sirena.org.uk>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20201001125038.GC6715@sirena.org.uk>
 <20201001131252.GA2382269@kroah.com>
 <20201001144019.GJ6715@sirena.org.uk>
 <20201001153207.GA2414635@kroah.com>
 <20201001160316.GL6715@sirena.org.uk>
 <20201001181624.GC3598943@kroah.com>
 <DM6PR11MB2841EB2B3699578E9FE2AB7BDD300@DM6PR11MB2841.namprd11.prod.outlook.com>
 <20201001193846.GW6715@sirena.org.uk>
 <DM6PR11MB28412198BCF01BC861BCBE14DD300@DM6PR11MB2841.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eUqGrSc0O7wKBRnC"
Content-Disposition: inline
In-Reply-To: <DM6PR11MB28412198BCF01BC861BCBE14DD300@DM6PR11MB2841.namprd11.prod.outlook.com>
X-Cookie: Stay away from flying saucers today.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>, Greg KH <gregkh@linuxfoundation.org>,
 "Sridharan, Ranjani" <ranjani.sridharan@intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "parav@nvidia.com" <parav@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>
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


--eUqGrSc0O7wKBRnC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 01, 2020 at 07:54:26PM +0000, Ertman, David M wrote:

> > This means that every device has to reinvent the wheel for common
> > resources like interrupts, including things like looking them up by name
> > and so on.  That doesn't seem ideal.

> It's a shared header file between the device and driver implementer.  If they
> want to share a "struct irq_data *irq" as an element in  the shared data, that is
> fine, but not everyone will need to include that.  This is why we left what is shared
> up to the implementer, so that we don't impose a debt on some other
> implementation that doesn't need it.

Realistically I think you're saying this because this has taken so long
already and you're being asked for more changes rather than because it's
a good design decision.  That is entirely understandable and reasonable
but I'm not sure it's the best decision when we have so many common
patterns between devices, one of the things that the current situtation
handles well is allowing lots of common stuff to just be data
definitions rather than code - there used to be a lot more open coding
of resource sharing.

One thing we should agree here is that we don't actually have to
implement everything right now, we just need to understand what the
design and direction of travel are.  That means that at this point it's
probably just a fairly quick documentation update rather than
substantial code changes.

> I suppose it is not the end of the world adding elements to the definition of
> struct ancillary_device, but what would be a "universal" element to add?
> Where do you draw the line on what you allow into the bus internals?  The
> overriding goal was to make a subsystem agnostic bus that doesn't impose
> implementation specific details from any single subsystem.

I think that this needs to grow everything that platform and MFD have so
that we can avoid using platform devices to represent things that are
not in the very strictest sense platform devices (which I interpret to
be memory mapped devices that can't be enumerated in some fashion).  My
understanding here is that the goal is an abstraction cleanup, it's
possible I've misunderstood though.

--eUqGrSc0O7wKBRnC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl92OU0ACgkQJNaLcl1U
h9AVGgf/V1Nkn3k93imlvscHkOO9exHEwzievKl9dpxHGgLsX8N6ZQsrYFORYSDs
Hi7+jgjJykOdXlhPiIbp9wKw0Ix72bteUViGdpUYEI7Kj4YciUkuIkhKYHUy6Q7A
sJnK9MenA9xVDBo4l2IQkFOcqFFzyhCWsBPFQPHoAMgVLHAb0D8aGcshoyN+ofhP
8GSd5ZvSfeYzv55u4rppHLRAih6aXmYHmmwCGZuNC1LdgyS2/RK5BzXSUf8mNVhc
b9A3DYlmDmJlx5dE5eaK85vXyjnHtSkvsDR/S6aG2h+T2/OOQwpO1mNG2TjmszFH
2EfD6bBGoev9PHd8np2PB5CWLT1spA==
=SMey
-----END PGP SIGNATURE-----

--eUqGrSc0O7wKBRnC--
