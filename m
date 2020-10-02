Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78346281120
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 13:22:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8ABD1F0F;
	Fri,  2 Oct 2020 13:21:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8ABD1F0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601637749;
	bh=IMH9pybNY6Z8AvzWBQgu+DGePwDHfA+ZcY3YZrlZigU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=COdgevtZ0NkGUNsO3QpyMkAaDw4tHRiKRZucmOk4MQ5MFRu2MUigFnVzefuw3MsjT
	 F7a7AUT6uGW5VXbpxQ//HTFkb4QJlc2dGeUm7THF5G4bpOADV8N+vaKCwnNNsSjPpD
	 Uj4r/bf6ChnU/ySfP5qG10RXkAlZcN96XDRTpq1E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66B4CF801A3;
	Fri,  2 Oct 2020 13:20:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6023EF801F9; Fri,  2 Oct 2020 13:20:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84D8BF800E5
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 13:20:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84D8BF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="M2CCT4ST"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3E353206C3;
 Fri,  2 Oct 2020 11:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601637632;
 bh=IMH9pybNY6Z8AvzWBQgu+DGePwDHfA+ZcY3YZrlZigU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M2CCT4STUgZKvxFoZFTOft242mYU31LqqyKR1ZMJF1NLzv6s78+RiQtTEx183w0Z2
 B75A6yoiQfbMzCx4Vi2r/NFbfaRTBe9N90u1t8tfPK3PKjF0yjwevrcPoy4RXzvOUd
 Fi7lknvrZlb66vd1CIDFqF1YTiqjRp9qBbcJVv2w=
Date: Fri, 2 Oct 2020 12:19:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Message-ID: <20201002111932.GA5527@sirena.org.uk>
References: <20201001131252.GA2382269@kroah.com>
 <20201001144019.GJ6715@sirena.org.uk>
 <20201001153207.GA2414635@kroah.com>
 <20201001160316.GL6715@sirena.org.uk>
 <20201001181624.GC3598943@kroah.com>
 <DM6PR11MB2841EB2B3699578E9FE2AB7BDD300@DM6PR11MB2841.namprd11.prod.outlook.com>
 <20201001193846.GW6715@sirena.org.uk>
 <DM6PR11MB28412198BCF01BC861BCBE14DD300@DM6PR11MB2841.namprd11.prod.outlook.com>
 <20201001201718.GZ6715@sirena.org.uk>
 <20201002004740.GF816047@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline
In-Reply-To: <20201002004740.GF816047@nvidia.com>
X-Cookie: Words must be weighed, not counted.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>, Greg KH <gregkh@linuxfoundation.org>,
 "Sridharan, Ranjani" <ranjani.sridharan@intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "parav@nvidia.com" <parav@nvidia.com>, "Ertman,
 David M" <david.m.ertman@intel.com>
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


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 01, 2020 at 09:47:40PM -0300, Jason Gunthorpe wrote:
> On Thu, Oct 01, 2020 at 09:17:18PM +0100, Mark Brown wrote:

> Instead of making ancillary bus giant, it might be interesting to use
> a library technique to avoid the code duplication you are talking
> about, eg

>  struct my_ancillary_data {
>       struct ancillary_device adev;
>       struct ancillary_resource resources;
>  }

> Then each user can access the facets they need.

The way most of this stuff works already it's not a table in the device
itself, it's an array of resources with type information.  Your second
struct there is presumably just going to be the pointer and size
information which you *could* split out but I'm really not sure what
you're buying there.

The interesting bit isn't really the data in the devices themselves,
it's the code that allows devices to just supply a data table and have
things mapped through to their child devices.  That isn't particularly
complex either, but it's still worth avoiding having lots of copies of
it.  *None* of this bus stuff is hugely complex but we still don't want
each device with children having to open code it all when they could
just do something data driven.

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl93DMEACgkQJNaLcl1U
h9AO2Af9GrWLCqqHKTAj+7wm2zZT1fdzh0Sw2SDm/n6B2xHU0L5grsRGtk/5q2QU
oobWGs/CXSoOmfgLiFqe0AiGmDqZxSFIDz1cefjNooUEy2jt/20OuycvtfBWPLK0
v1s/2KkxbAFv0LGp2JWS/5H5aRvJhGefxoJmhVFuWOshyTqI1PRlAtxREAVY+po7
PxTWXKZdJBtVrdxMZwIIjSZdW/IdiXKcfXNIybHnAqJ3Wnt4y1a3AllDik9bDyId
ZlsYVID083+TcLYSjlctCx2/DbenN3wxVjsjbLhU+XD2AL03QFS7XdOhxD6mgE6s
99MyjBGGuzW0Ynd9DDI8UV2+j5t3vA==
=wKwV
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
