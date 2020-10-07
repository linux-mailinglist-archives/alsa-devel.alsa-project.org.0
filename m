Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDFA2863D6
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Oct 2020 18:24:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FD2616CB;
	Wed,  7 Oct 2020 18:23:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FD2616CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602087886;
	bh=3wrrcD3lH8xpx+ROvHVv6b93NZnSzHjbk1/6UsjW6wQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GmuZkOcURACQrzpybkI3hEZ2IVOjMN8Uf74E+TxgLDuM0ZbSiXbfRIf3KoHdo51oG
	 PD6/bDnMbn6kO/6fkOuTJyh9E+HkHcVSh70kgFbYRAxgwp3/wr+FUNZd5d6fo4ZQvX
	 4n+Tji8UPrKS7naClWhUBpF0uyzc2e1+/ZBzxcOQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B948F800EE;
	Wed,  7 Oct 2020 18:23:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 315D0F80087; Wed,  7 Oct 2020 18:23:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32372F80087
 for <alsa-devel@alsa-project.org>; Wed,  7 Oct 2020 18:22:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32372F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ffkm/wdP"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 49BAC215A4;
 Wed,  7 Oct 2020 16:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602087774;
 bh=3wrrcD3lH8xpx+ROvHVv6b93NZnSzHjbk1/6UsjW6wQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ffkm/wdPG/gpHfJFBx2gBgQiTl9tiW37wxu6O+DojB1NIHxNphvaJpfCMfZSJoUgg
 8r9i+FOII/92QwE+YDyL8zqdoDj24CAAyoiEyXCTMEMAKHSnrKgKYRZ8qyMu2HIk+p
 KP9hlUiPnKiB1IDCvFomEicTF5r9oX7KeDgXIxqw=
Date: Wed, 7 Oct 2020 17:22:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Message-ID: <20201007162251.GB5030@sirena.org.uk>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20201001071403.GC31191@kroah.com>
 <DM6PR11MB2841742651F535F0826326CDDD310@DM6PR11MB2841.namprd11.prod.outlook.com>
 <20201003090855.GD114893@kroah.com>
 <c09c7efa75d7ea7c65ba1ac4bbb35f033ee4a9bf.camel@intel.com>
 <20201005112547.GA401816@kroah.com>
 <CAPcyv4gWc4B9U9+RcEgmbFWiZ7VpDK+kFXnhGcOUkDhVc609vQ@mail.gmail.com>
 <20201007091443.GA822254@kroah.com>
 <CAPcyv4hLVF4AdRLq2mTGJ9NBwRHm=_ANerUu0OuUPKk2XBSu_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Content-Disposition: inline
In-Reply-To: <CAPcyv4hLVF4AdRLq2mTGJ9NBwRHm=_ANerUu0OuUPKk2XBSu_w@mail.gmail.com>
X-Cookie: Two heads are more numerous than one.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "parav@nvidia.com" <parav@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
 "Ertman, David M" <david.m.ertman@intel.com>
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


--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 07, 2020 at 09:19:32AM -0700, Dan Williams wrote:
> On Wed, Oct 7, 2020 at 2:14 AM gregkh@linuxfoundation.org

> > "virtual" here means "not real" :)

> Which of these aux device use cases is not a real device? One of my
> planned usages for this facility is for the NPEM (Native PCIE
> Enclosure Management) mechanism that can appear on any PCIE
> bridge/endpoint. While it is true that the NPEM register set does not
> get its own PCI-b:d:f address on the host bus, it is still
> discoverable by a standard enumeration scheme. It is real auxiliary
> device functionality that can appear on any PCIE device where the
> kernel can now have one common NPEM driver for all instances in the
> topology.

Some if not all of the SOF cases are entirely software defined by the
firmware downloaded to the audio DSPs.

--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9961sACgkQJNaLcl1U
h9DlXwgAgDGmylapX/nx3eTwZNpY2SkpDt2dWNb1vUqp7z1c1u/I2SfGxl+fsbGH
iUOET7reLpVaok4ooy8XVeOaJwql/7rRbUb4oY9zWlTp4tw8G8GtCBMtU/Ff2Imm
ItrTGuYg9vhTMplwm3+2gug1mGnDlqzTykeufznPz37VdoAbxR0p+M2SwUNzSYm+
kmhIZqiy6DbFzeTXt9w4u6ZNepQMKGkrQeGK5eO1zj38vCHrvrdrafHkRaIR76nv
cu1GJuEBlx2x+8z7GprFwWl3khil6P/Td75HgIcIYADMqFb9ZENAQh2Pe8/vK/QQ
ZzFir6Rdz9zKwqPHoJMW8iXYTj+BcQ==
=0Bcb
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--
