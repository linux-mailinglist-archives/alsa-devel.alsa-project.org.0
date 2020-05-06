Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C23AE1C77E5
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 19:30:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BD6117AD;
	Wed,  6 May 2020 19:29:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BD6117AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588786226;
	bh=hN5bJYrCoOpKajoFwSU09ScPDyaZRQZHNEdO9ys1e3M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jh3TAXAMnA2B09uTBGL/cmFCvySxLEpezkBaGyJdAHIBZkC3NTw1FiiPLcA7muvF4
	 jIuNk6p1L07NT8pojSB6hYCvtB+j9ddNRM1kGXUfNVa06wXxKOvUrGqGPHm5uOc/YU
	 KhhMrP6jmmx+j0lFDaSQQUZRVxwFENNxL7bG4HA4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58BF4F80253;
	Wed,  6 May 2020 19:28:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13BC6F80258; Wed,  6 May 2020 19:28:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A389CF800DE
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 19:28:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A389CF800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YTUeu5mu"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5C2CD20746;
 Wed,  6 May 2020 17:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588786114;
 bh=hN5bJYrCoOpKajoFwSU09ScPDyaZRQZHNEdO9ys1e3M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YTUeu5mulQRqHeezcMKweC5WEvtzkWSXjSZMTWdggZ4GnkNIPN0B14ySBpwo3wdIE
 b8lbSdhIb827Xes9JzT7sByiZlnLT9hrsOR4wugtBRrRyTHvzule/x0EGLjRulMx+C
 hj+VvgWPymN3zxNiQZ1iCf+gOoFeYa0MRRGbw7U0=
Date: Wed, 6 May 2020 18:28:32 +0100
From: Mark Brown <broonie@kernel.org>
To: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 14/14] ASoC: amd: enable build for RN machine driver
Message-ID: <20200506172831.GK5299@sirena.org.uk>
References: <20200505205327.642282-1-alexander.deucher@amd.com>
 <20200505205327.642282-15-alexander.deucher@amd.com>
 <2a8891ec-d162-77ed-8093-6c7072b6b8f7@linux.intel.com>
 <20200506162656.GH5299@sirena.org.uk>
 <DM6PR12MB2633B92B19B337A72B64D0B397A40@DM6PR12MB2633.namprd12.prod.outlook.com>
 <20200506164345.GI5299@sirena.org.uk>
 <2061b12a-cc4b-558f-6fc1-b6bf548e7603@linux.intel.com>
 <20200506172519.GJ5299@sirena.org.uk>
 <DM6PR12MB2633E5D7857EC3D379F8B3FD97A40@DM6PR12MB2633.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="45wMVEkw4XUbiYON"
Content-Disposition: inline
In-Reply-To: <DM6PR12MB2633E5D7857EC3D379F8B3FD97A40@DM6PR12MB2633.namprd12.prod.outlook.com>
X-Cookie: Not recommended for children.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Alex Deucher <alexdeucher@gmail.com>, "tiwai@suse.de" <tiwai@suse.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
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


--45wMVEkw4XUbiYON
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 06, 2020 at 05:27:37PM +0000, Mukunda, Vijendar wrote:

> > Yes, it just decays to a dummy eventually if you don't use enough of the
> > features - the constraints aren't particularly useful here.  Still it
> > doesn't hurt to explicitly say what the device is.

> Our requirement is more are like instead of going with  a dummy codec driver,
> We want to stick to existing generic dmic driver .

That's good, please do so.

--45wMVEkw4XUbiYON
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6y878ACgkQJNaLcl1U
h9BrMwf+OoS0WB4nxlVQl6jYLbh2Wc+Ec2lCrGRaZaLEcsQX6/SJOS3Azbm4J7+M
5AB0DbE3MUhALOXwXjJJOCim94QivqbfYZNiAAe1XToR8UYbisO51hjmLDyDOkd8
2P5jT8NCXDQdbQ3NMvBxuDBFfwq8iI9zHZdV33tgyGSVvlXPsoAU+BDI/86EIW54
NgENXuObWKWod//Mlz6V1PsWKDPGNT6uf5rhUykHoUW6atVLQQjmzDH2TimXs4xs
GFsGlZ315/hpbn78g2grgeGmO/5N7U1SMmZWxQPjA140psOLkdJLcgJRVCsOhltl
lccql2rKxs+a+tnuR33t4+edS1/F9Q==
=8qrH
-----END PGP SIGNATURE-----

--45wMVEkw4XUbiYON--
