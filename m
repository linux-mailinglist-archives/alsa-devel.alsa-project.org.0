Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFD72804D7
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 19:13:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 167711934;
	Thu,  1 Oct 2020 19:12:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 167711934
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601572395;
	bh=qqgcTsNaKl0py1flBRd5OE8uMUO5leiExORKOl6mcD4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aa17YR0IaVs1ShQq0FiQ8LRJrPJCx9wmJzG2bl8g1ZZ0fwM1DKb3e6zgUCh7LGdti
	 hN42fDS5vMiQFEP4RwGexMv4Locplki6Dyv1/iG5eJtPBsAvxZIqs2I/F1DLu4xCeG
	 QiB5afrAL4LXcgrUItKRvT+7TpOLAVC1k8RhxFvs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36D52F801DB;
	Thu,  1 Oct 2020 19:11:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5ABFFF801F5; Thu,  1 Oct 2020 19:11:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A26BF801D8
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 19:11:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A26BF801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IH7uorkQ"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EE7E12085B;
 Thu,  1 Oct 2020 17:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601572281;
 bh=qqgcTsNaKl0py1flBRd5OE8uMUO5leiExORKOl6mcD4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IH7uorkQtQ5CCzN2BuKbr6BTYU0EpT/wVx8p09pSJ5ex3u9B2CIxYkN99Wp9q+GCY
 Y0bsvyHDp0MyYbBDOFGHm9I1ILbjyWXA5iiXvhl+YQdpn3gUoT2XQcUs3LDOrCKKkr
 FcawtljlyV8wX+T+Mhuh7sLW2m+15COow7i+pJIY=
Date: Thu, 1 Oct 2020 18:10:22 +0100
From: Mark Brown <broonie@kernel.org>
To: "Ertman, David M" <david.m.ertman@intel.com>
Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
Message-ID: <20201001171022.GS6715@sirena.org.uk>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20201001125038.GC6715@sirena.org.uk>
 <ddb019b8-4370-eca8-911f-38adf0531076@linux.intel.com>
 <DM6PR11MB28417E157FB2144BC5C99ED2DD300@DM6PR11MB2841.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="r7tUYVWcdYzDJoZW"
Content-Disposition: inline
In-Reply-To: <DM6PR11MB28417E157FB2144BC5C99ED2DD300@DM6PR11MB2841.namprd11.prod.outlook.com>
X-Cookie: Stay away from flying saucers today.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.de" <tiwai@suse.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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


--r7tUYVWcdYzDJoZW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 01, 2020 at 04:50:26PM +0000, Ertman, David M wrote:

> > >> are controlled by DT/ACPI. The same argument applies for not using MFD
> > >> in this scenario as it relies on individual function devices being
> > >> physical devices that are DT enumerated.

...

> The MFD bus also uses parts of the platform bus in the background, including
> platform_data and the such.  We submitted a version of the RDMA/LAN solution
> using MFD and it was NACK'd by GregKH.

That does not mean that it's a good idea to write documentation that
says things that are not true.  It would be better to just not say
anything here rather than mislead people.

--r7tUYVWcdYzDJoZW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl92DX0ACgkQJNaLcl1U
h9DuFAf/QddQJAg+euwIC88edlGSGVLlnzm8giO4iA7oKi0eB/xYJn0i/51Xw1A5
2UK6WUDLpXMuXuKONj5yVjgX5cJXtKJanqHEk0swL5BwbDXPiamX+65k5AEX9/lx
oTVBektoqYl2VhLO8MCDCCkBGHPZhoA83LKj4BYu8weoK4EFhPooA19Ufwc+dWUo
ixzXDnrQ1flMtvbCn83H9LEkrz64ZoJJH96+CHoTvI5D3t5G68NTJI8PSd//AWmd
qPIIAa/LQb2d/CN5BRkVQzDP8Zf7qXg7Y/aXC3tK/oWDkW2D9jX2Sn2xJWD6MgCp
oeH5nNM79yoH5hcufuWQMbsvd229JQ==
=n0IN
-----END PGP SIGNATURE-----

--r7tUYVWcdYzDJoZW--
