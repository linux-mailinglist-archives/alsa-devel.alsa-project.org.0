Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B193A1E8BB3
	for <lists+alsa-devel@lfdr.de>; Sat, 30 May 2020 01:04:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C8311768;
	Sat, 30 May 2020 01:03:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C8311768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590793468;
	bh=n6ke17m7zdty2XbznaUf/ImP7/BQ3BkiDpHS+eIcMCI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dd8Bye0p1HwRFq2W8DnttEKqvYr22iprmyRbqwWILWCDLYCK2vVaL+8mXYgft2HiE
	 O3Zopi96GYBSeQDy1ivNyrVcnzj7kksulICcP5ecXZSqG4ycHx/LicyKpNm4xiKorM
	 FoO6o7L76sG+amu5cAYfxnSr0Yf6mJUH4RvjveEY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71E9CF8014E;
	Sat, 30 May 2020 01:02:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C8A2F8014E; Sat, 30 May 2020 01:02:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33914F80125;
 Sat, 30 May 2020 01:02:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33914F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="m1BS4OVe"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C987820897;
 Fri, 29 May 2020 23:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590793358;
 bh=n6ke17m7zdty2XbznaUf/ImP7/BQ3BkiDpHS+eIcMCI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m1BS4OVeiGDlr/H54DvJ7vBi6oNU5RfNNAOxReGvn0xII0B8BNWF35D+LZ80Ov9ah
 HUamGoO9AKV20Z5Vb/D7CFZYdSG0we65B7EAyvlmPPydqCRHIHy5WhmRriFExGGiLM
 VmpmUU8UjQ6xcls3wIVKYxZ1jjBoVWVtBfD5ljzs=
Date: Sat, 30 May 2020 00:02:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ASoC: SOF: Intel: byt: fix unused-function warnings
Message-ID: <20200529230234.GZ4610@sirena.org.uk>
References: <20200529200433.19068-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="NJ3GtppTlf/130kA"
Content-Disposition: inline
In-Reply-To: <20200529200433.19068-1-arnd@arndb.de>
X-Cookie: The Killer Ducks are coming!!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Keyon Jie <yang.jie@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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


--NJ3GtppTlf/130kA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 29, 2020 at 10:04:17PM +0200, Arnd Bergmann wrote:

> Several functions in this driver are only referenced for baytrail-class
> configurations and building configurations with only merrifield enabled
> causes a warning:

Pierre fixed this earlier today.

--NJ3GtppTlf/130kA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7RlIoACgkQJNaLcl1U
h9C0egf/S/FcGFYqxnk1QAy8ZfP+uCdN65yW0o7yJJ92rF4YUb7W8lUJvhS+8IHr
Kwjwa8+hIOUAUGSOol/q3HsK6rG7NtKXwa//CnX9oXdHAz0hwXEMwx+eVFBSb322
Nt2T3F6786OaYc10Yd30HrNzJHlOk7hJxJ5APKFrjvjX/21sgbt1f6aAEY2FEo9h
ngZcmmzAANLl6rhMkrgLax97gckP84jE1hr4Y4iKJTSa7mUQ+jDk3znz12IOu/Rr
6PTjhlapK/GjaODdubROW6i4QCxK3z2S/yaVP34NM/r8aZW+BZ5/NEfdviO/5NsI
ewCdBudt31j34yevaZDZNVWLZy2P2Q==
=dPCM
-----END PGP SIGNATURE-----

--NJ3GtppTlf/130kA--
