Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C26222B6493
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 14:50:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4980F174B;
	Tue, 17 Nov 2020 14:49:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4980F174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605621010;
	bh=OS86M0fSuRYOLM26EPZccF7FmZm2Eb5pCK+q9/AU8CA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nrDaE/sYosCUjVdD/9CcqsLBUonh/Qj8g/JDC+Bk0EwexZUX0ZWFD92SOmUGGHFrL
	 r+2DoEgu4A9M5VWfjtNquua64vANXCgpibQ/MQ3MX3n40DX4aoi76Ht+XQIjnYCUYk
	 3gzONoMdwS4E9epxRnFlZtz3QbcHiXrsgMxRaQAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1432F801F9;
	Tue, 17 Nov 2020 14:48:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09B35F800FE; Tue, 17 Nov 2020 14:48:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD5E9F800FE
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 14:48:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD5E9F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bDyIDhCv"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 823E7221F8;
 Tue, 17 Nov 2020 13:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605620908;
 bh=OS86M0fSuRYOLM26EPZccF7FmZm2Eb5pCK+q9/AU8CA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bDyIDhCvTB2jn19fp4cy1NAMyTUIp5sxOJXlNeSHlcH+YOQbGdBMkDvJrB3HVOIZe
 419kmajtMLDjUGsw6kR1ONgE3AgGYRT7kNIWr6/smOilauicF5hTuYyBGrG8RTeZTu
 N8ugy3Vbd/JkPQ7ZMA6Oa5MR2F9Pf4/ZDPSictZo=
Date: Tue, 17 Nov 2020 13:48:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Leon Romanovsky <leonro@nvidia.com>
Subject: Re: [PATCH v4 01/10] Add auxiliary bus support
Message-ID: <20201117134808.GC5142@sirena.org.uk>
References: <20201113161859.1775473-1-david.m.ertman@intel.com>
 <20201113161859.1775473-2-david.m.ertman@intel.com>
 <20201117053000.GM47002@unreal>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="H8ygTp4AXg6deix2"
Content-Disposition: inline
In-Reply-To: <20201117053000.GM47002@unreal>
X-Cookie: Pause for storage relocation.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, kuba@kernel.org, parav@mellanox.com,
 tiwai@suse.de, gregkh@linuxfoundation.org, ranjani.sridharan@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, fred.oh@linux.intel.com,
 linux-rdma@vger.kernel.org, dledford@redhat.com, jgg@nvidia.com,
 netdev@vger.kernel.org, Dave Ertman <david.m.ertman@intel.com>,
 dan.j.williams@intel.com, shiraz.saleem@intel.com, davem@davemloft.net,
 linux-kernel@vger.kernel.org, kiran.patil@intel.com
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


--H8ygTp4AXg6deix2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 17, 2020 at 07:30:00AM +0200, Leon Romanovsky wrote:
> On Fri, Nov 13, 2020 at 08:18:50AM -0800, Dave Ertman wrote:

> > Add support for the Auxiliary Bus, auxiliary_device and auxiliary_driver.
> > It enables drivers to create an auxiliary_device and bind an
> > auxiliary_driver to it.

> This horse was beaten to death, can we please progress with this patch?
> Create special topic branch or ack so I'll prepare this branch.

It's been about 2 working days since the patch was last posted.

--H8ygTp4AXg6deix2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+z1JcACgkQJNaLcl1U
h9DrPAgAhoKtJY3JUvyt5umyqYMB91rbKCdWbOcvmCUH3Onp6sIN6bjvKLZEieE3
yGf9wpM7/qbfovb2WB+pv2sk+V4T6q/eEKqB9ggRpnRHGH4xLqQP3UHMWPpXYOsY
3+SemZd6NgGXAVfbOXdZWeuikkj4X9xP48T5h4YuVLFqUIjKx58grErSkvNe16hp
mbeQkw/Wobr4XZr2nFxMupK6+IcpQP34roZRYX62FAx1Gp1+322QlTRn3rboC1Hn
3B3uf6qq2HC29TmYGBS2BOntIuOVyQOKrFn8u6oKPZ73OXr+vPU2wLjs83sXJjy5
Uc/MykNHE2TvTYJXkoVnE5i1t4bryg==
=Xd9v
-----END PGP SIGNATURE-----

--H8ygTp4AXg6deix2--
