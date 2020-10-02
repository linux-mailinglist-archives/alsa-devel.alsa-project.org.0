Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D58281A07
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 19:47:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06C4F1F37;
	Fri,  2 Oct 2020 19:46:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06C4F1F37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601660846;
	bh=2HxenRW4gdLpgbbdbdk/sterVW8S3ZFsT0PaZy80xEY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OYeIgX9vNhDrgKW2rPbVPIwwr28vEonCYKCKNfBonv/UzTmc2aNSEd2aWAAwXrIjF
	 OZpLCiUc706/Ya6yAFfBHrtEuq5OpHb7KCpBtwcC+Tr/iejv1dOKTdxW7risyL8tOH
	 U6SkbXxISM6SYF5ahVjQizisRD2KRfmG1LmISjKs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17A96F801A3;
	Fri,  2 Oct 2020 19:45:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91467F801F9; Fri,  2 Oct 2020 19:45:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89937F801A3
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 19:45:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89937F801A3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kLVXtzzT"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 27C98206A5;
 Fri,  2 Oct 2020 17:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601660735;
 bh=2HxenRW4gdLpgbbdbdk/sterVW8S3ZFsT0PaZy80xEY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kLVXtzzTmdMVYSkIj235RiV5JEZe/nriY799KBMMvKCG+HoWdT+5D/MVFwgKBqg7Z
 WSRlksl/KsdVDEJbgxgJbZiPxqQbNkXks3ir0VP+gftDWH0N9KUmSVf3ymVvy0wMmB
 qDAYrFBmd/E4wmd2kCTjQlU4JYHRAs+CrrdR0bxo=
Date: Fri, 2 Oct 2020 18:44:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Message-ID: <20201002174435.GF5527@sirena.org.uk>
References: <20201001160316.GL6715@sirena.org.uk>
 <20201001181624.GC3598943@kroah.com>
 <DM6PR11MB2841EB2B3699578E9FE2AB7BDD300@DM6PR11MB2841.namprd11.prod.outlook.com>
 <20201001193846.GW6715@sirena.org.uk>
 <DM6PR11MB28412198BCF01BC861BCBE14DD300@DM6PR11MB2841.namprd11.prod.outlook.com>
 <20201001201718.GZ6715@sirena.org.uk>
 <20201002004740.GF816047@nvidia.com>
 <20201002111932.GA5527@sirena.org.uk>
 <DM6PR11MB28417402C0F65B993C6E7E8CDD310@DM6PR11MB2841.namprd11.prod.outlook.com>
 <20201002172558.GL816047@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+ts6NCQ4mrNQIV8p"
Content-Disposition: inline
In-Reply-To: <20201002172558.GL816047@nvidia.com>
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


--+ts6NCQ4mrNQIV8p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2020 at 02:25:58PM -0300, Jason Gunthorpe wrote:
> On Fri, Oct 02, 2020 at 05:23:53PM +0000, Ertman, David M wrote:

> > Would you recommend adding two elements to the ancillary_device like:
> > 	void *ancillary_data;
> > 	u32 ancildata_size;
> > like the platform_device uses?

> That doesn't seem useful here, the intent is to use container_of, if
> the creator wants to pass private data then it should be structured
> into the containing struct.

> platform_devices/etc don't use container_of so have this side band way
> to pass more data.

The other thing platform_data lets you do is keep constant data separate
=66rom dynamic data - if you have to use container_of() then you need to
either allocate a pointer to any constant data in the container or copy
it into the container.  Since the platform_data is in struct device it's
going to be there anyway and may as well get used.

--+ts6NCQ4mrNQIV8p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl93ZwIACgkQJNaLcl1U
h9DQpwf9HVXeD5O7cYZFLLBd20KIuG87g4ubMJHvFPOqz3K8Dy/342gu661sbDyx
Ei+s2xvA/pN3JkdYDfUp9op6TWWAVdZ/gXS67e6Y6IAMRgJAK0ITL2dA49W3nMbk
vnstiJpL+COkyuqjlpbx07opTwZxu5NhiF655qA63gl83lkHrGE9ZhiA6H3UEVEc
cpI1t8gTK50O67u6m4GyA1lFqA4g1HX4NofCendevAUWQ+p1ZFemvGLZPuzI+hly
afOpGl4aLHhyjuj92JydDTF82ZpL7BF9dDCu1vZUCLdSPm6rZho9Jm0IVhqiSk9e
+8KD02KKnKub876HgFPTdp72xCL/wA==
=xyTa
-----END PGP SIGNATURE-----

--+ts6NCQ4mrNQIV8p--
