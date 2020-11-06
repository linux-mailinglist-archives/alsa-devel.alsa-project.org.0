Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 033252A9E24
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 20:37:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60EFB1686;
	Fri,  6 Nov 2020 20:36:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60EFB1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604691451;
	bh=gAAMGunkKSJbUJ0jDwiyrsTYQWulMREXYV/jPPdlyhY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rYt2wKKWwaIMqEDlzbmjdCk/7rk7ZkojuuwUwvqCfyVLRZjbabWi1PBVxKYP6j9ri
	 5xJozoBAinPH+l3tMtqM5PsEGcrGvW6pRASIS3ZzoGJoT/ElPcrRrgCClvd/oc9cF1
	 MWrr/T1DAdIaog5Zg6l8Bteg9qjNcZS8bP9SQB4s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A870F800BA;
	Fri,  6 Nov 2020 20:35:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC9EFF80234; Fri,  6 Nov 2020 20:35:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6B8FF80150
 for <alsa-devel@alsa-project.org>; Fri,  6 Nov 2020 20:35:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6B8FF80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="D0Xu+rYt"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AC3A72151B;
 Fri,  6 Nov 2020 19:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604691349;
 bh=gAAMGunkKSJbUJ0jDwiyrsTYQWulMREXYV/jPPdlyhY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D0Xu+rYt9C6Tc+VTC54qKBXq6GLWh08vIeOMccUgOtpRZ/tFEbHtStgv0seBSFBHX
 vHdysUc93O3IVC2DvU28chVdccfrFLheZ6x9cKOxmpHr61t2KFftVtOled9hAF6WKP
 e80nYfp/j0cpijlRtF9bvm0slegS0fhMdzotFDPA=
Date: Fri, 6 Nov 2020 19:35:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH v3 01/10] Add auxiliary bus support
Message-ID: <20201106193537.GH49612@sirena.org.uk>
References: <20201023003338.1285642-1-david.m.ertman@intel.com>
 <20201023003338.1285642-2-david.m.ertman@intel.com>
 <CAPcyv4i9s=CsO5VJOhPnS77K=bD0LTQ8TUAbhLd+0OmyU8YQ3g@mail.gmail.com>
 <DM6PR11MB284191BAA817540E52E4E2C4DDEE0@DM6PR11MB2841.namprd11.prod.outlook.com>
 <BY5PR12MB43228923300FDE8B087DC4E9DCEE0@BY5PR12MB4322.namprd12.prod.outlook.com>
 <CAPcyv4h1LH+ojRGqvh_R6mfuBbsibGa8DNMG5M1sN5G1BgwiHw@mail.gmail.com>
 <BY5PR12MB43222D59CCCFCF368C357098DCEE0@BY5PR12MB4322.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="WRT3RXLOp/bBMgTI"
Content-Disposition: inline
In-Reply-To: <BY5PR12MB43222D59CCCFCF368C357098DCEE0@BY5PR12MB4322.namprd12.prod.outlook.com>
X-Cookie: When does later become never?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Parav Pandit <parav@mellanox.com>, Greg KH <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.de>, Netdev <netdev@vger.kernel.org>,
 Leon Romanovsky <leonro@nvidia.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, linux-rdma <linux-rdma@vger.kernel.org>,
 Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Jakub Kicinski <kuba@kernel.org>, "Ertman, David M" <david.m.ertman@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, "Saleem,
 Shiraz" <shiraz.saleem@intel.com>, David Miller <davem@davemloft.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Patil,
 Kiran" <kiran.patil@intel.com>
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


--WRT3RXLOp/bBMgTI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 05, 2020 at 08:37:14PM +0000, Parav Pandit wrote:

> > > This example describes the mlx5 PCI subfunction use case.
> > > I didn't follow your question about 'explicit example'.
> > > What part is missing to identify it as explicit example?

> > Specifically listing "mlx5" so if someone reading this document thinks to
> > themselves "hey mlx5 sounds like my use case" they can go grep for that.

> Ah, I see.
> "mlx5" is not listed explicitly, because it is not included in this patchset.
> In various previous discussions in this thread, mlx5 subfunction use case is described that justifies the existence of the bus.
> I will be happy to update this documentation once mlx5 subfunction will be part of kernel so that grep actually shows valid output.
> (waiting to post them as it uses auxiliary bus :-)).

For ease of review if there's a new version it might be as well to just
reference it anyway, hopefully the mlx5 code will be merged fairly
quickly once the bus itself is merged.  It's probably easier all round
than adding the reference later, it seems more likely that mlx5 will get
merged than that it'll fall by the wayside.

--WRT3RXLOp/bBMgTI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+lpYgACgkQJNaLcl1U
h9BucQf/eNw6ctPFmmRQVuSB2n3HuUQKEXfBdp/GJzm2Ao34q3WIZJ5mANQN+PsD
1RdlG+KooBtZmSD8LTDhdMB7I75TNfJOZBV6uGJFOSZ1FPmnYGE8sipgOyMlg94b
6tlWmBBWuueK4uA3etjOa8QTVxysmK+x1JkvBLPFk5t43D3zxOvUhdmdYZbEt3z7
U5amclwnzVW5uwMFacm4zhGSVnffO9rD3HCqieFDgAtPfl/QDuBntmA5lbmpTU0R
CiwdqKpuhH2/AX0QHsiFJh6bgxPhEilHcZk7ZZGftB/J+Sc5dxIhXxRTql4R0u0n
zkdYy/19+i8RI7ppfSbIPOr91XQsDg==
=vai3
-----END PGP SIGNATURE-----

--WRT3RXLOp/bBMgTI--
