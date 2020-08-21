Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DB724D5C1
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 15:05:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FDC61689;
	Fri, 21 Aug 2020 15:04:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FDC61689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598015129;
	bh=nfD1siaSi/wny0BuOM8v72hbcN5l+kNjYRXFb5+v4r4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sHqcDxsGKeWlWnSmUkyv629KmwLCND++FO/QSyxJFUHjHq4rEKLswq09wS4jvSP4y
	 DYv+L5i8PVNMMLhq/WuE+s3JzuJEU+tKxC8b/3TWkmMxtxdHCMInHXQkSwibI1GdKV
	 jLVEsBZrU6nh++VHvbISxumxff9TUyf2/Fxi5138=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E2F4F80216;
	Fri, 21 Aug 2020 15:03:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59FAFF80218; Fri, 21 Aug 2020 15:03:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F20FF800D2
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 15:03:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F20FF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hIYkOEmz"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 39C0C207BB;
 Fri, 21 Aug 2020 13:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598015011;
 bh=nfD1siaSi/wny0BuOM8v72hbcN5l+kNjYRXFb5+v4r4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hIYkOEmztbVfYTLJa6rNuVPRKy2P3HWXeZUjZ4YFNi6650Bcua6lJ8sJB0mzKx1L/
 UShfDvoKbYHRJX1mrgXYO7VpKy6b2XPsDEMhrr2HLpU44fE8MD0ydib13i0tY3GZZF
 szXcnFNSGcQb/omIyOsiVVeVJaUynNp8vFzQCCuU=
Date: Fri, 21 Aug 2020 14:02:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: More Generic Audio Graph Sound Card idea
Message-ID: <20200821130258.GG4870@sirena.org.uk>
References: <87k0xszlep.wl-kuninori.morimoto.gx@renesas.com>
 <097e3fc4-4a84-e101-e6b6-045c3e9e5bfc@nvidia.com>
 <87imdczd4i.wl-kuninori.morimoto.gx@renesas.com>
 <7ceb0e77-fdf5-dd62-f1f6-660c4ed43e89@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Fnm8lRGFTVS/3GuM"
Content-Disposition: inline
In-Reply-To: <7ceb0e77-fdf5-dd62-f1f6-660c4ed43e89@nvidia.com>
X-Cookie: divorce, n:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, jonathanh@nvidia.com
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


--Fnm8lRGFTVS/3GuM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 21, 2020 at 01:58:15PM +0530, Sameer Pujar wrote:

> For example, SRC (sample rate converter) can change 'rate' info coming from
> hw_param(). Similarly 'mux/demux' can change channel info. Fixing one set of
> configuration in DT will limit the usage. If this is configurable from user
> space, then it would be lot more easier.

We shouldn't be fixing the configuration in DT unless it's fixed in the
hardware, in which case we should be able to figure this out through
constraints at runtime anyway and not need to expose anything to
userspace.  This covers an awful lot of SRC and other conversion use
cases, they're often there because there's some fixed DAI that means
there's only one possible setting on one side of the convertor.  A lot
of the other cases where there's more flexibility can probably be
handled in a similar fashion with something other than the SRC itself
being configured - normally the goal is to fix a link in a particular
configuration through software policy and we can work back to setting up
the SRC in the same way as if it was a hardware constraint.

--Fnm8lRGFTVS/3GuM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8/xgIACgkQJNaLcl1U
h9Bzmwf/aIMRieL9c+IwbhxpIOaWnq97M5dA8PHTu0So1hvkBXfkzVK54+RW4JKT
TUKJEaXtyJgCZSLoFXlekNARDvygkX9ilnBOsMt526bXEsscVFcrihzpVegJPbPu
37P95DUPFIbY2NP3oamvK/K44GfjReq2A7NX9y5elSTawCMNyyPAiqesTqRoRNXR
CGm7k1fPQq7YA5vOSXAHWQReYuxpLHyiyBGQzpG0c2BJINfMmKk0hMMiFYzX59nX
hPte9vF7SaHagLWcJ9HHM6l6a/L3LmcvlPBWj69TUOvBEPxxuYy+LGJ+4MK97nz7
dkODiIR+ZPam2qqh2aFZKD0SE5OmTA==
=zX0Z
-----END PGP SIGNATURE-----

--Fnm8lRGFTVS/3GuM--
