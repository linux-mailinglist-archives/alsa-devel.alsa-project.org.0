Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7EB1FF651
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 17:12:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BA9217A2;
	Thu, 18 Jun 2020 17:11:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BA9217A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592493157;
	bh=ilUjh+1fMtsBdASwEcZ/FBsOFEadEcz3dcp1AKOPWRE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mz+PkNkUsSpjIt/k/Sw7AkENBiBeB1ZPq3no7OdYwrbc3MkJDK/Awg3e9E+n5tL6S
	 7Qy/X2fwXkKfBAfvs23xMYjFMRwMuFbf0NV3TXv226iN7fKH2RFjbY2LeDts/HfirL
	 RWcQZv+DV7i5K/mw1atyCTUyEaG2gEXYsfw2Vor4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97BCBF80101;
	Thu, 18 Jun 2020 17:10:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07A51F80116; Thu, 18 Jun 2020 17:10:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97EE3F800EF
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 17:10:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97EE3F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QIgmFzH5"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D1AB320656;
 Thu, 18 Jun 2020 15:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592493048;
 bh=ilUjh+1fMtsBdASwEcZ/FBsOFEadEcz3dcp1AKOPWRE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QIgmFzH5j7oO/i75teOmeK/NTtzkRjFjKx6xIKxO/GP9Uai6qJXPWWBsjj/uKwjp4
 fYHlNsYzf1cqtVN6Eesqka/Cy2HSBWZxxtgsHyVPmPVmIDQOdD4e24NLvt9tdR7WI6
 Rf263Nof9sXPn+8YANlJTO3w89VLoQc6MSI2muCE=
Date: Thu, 18 Jun 2020 16:10:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: codecs: Added MAX98373 Soundwire Driver
Message-ID: <20200618151046.GK5789@sirena.org.uk>
References: <20200617163015.16809-1-pierre-louis.bossart@linux.intel.com>
 <20200618110902.GE5789@sirena.org.uk>
 <d3bb399f-3af9-666d-054d-e4a1dda1dfb4@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="n83H03bbH672hrlY"
Content-Disposition: inline
In-Reply-To: <d3bb399f-3af9-666d-054d-e4a1dda1dfb4@linux.intel.com>
X-Cookie: Androphobia:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Ryan Lee <ryans.lee@maximintegrated.com>,
 tiwai@suse.de, gregkh@linuxfoundation.org, vkoul@kernel.org,
 Naveen Manohar <naveen.m@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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


--n83H03bbH672hrlY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 18, 2020 at 07:42:25AM -0500, Pierre-Louis Bossart wrote:

> > The DT bindings need updating to add SoundWire support.

> Interesting. The properties are the same in I2C and SoundWire mode, so would
> we need a completely different file that just specifies the SoundWire
> DeviceID, e.g.

> properties:
>   compatible:
>     const: sdw10217201000

> What's the process for such dual-mode devices?

I'd hope it could be added to the existing bindings document like for
other dual bus devices.

> > > +	regmap_write(max98373->regmap,
> > > +		     MAX98373_R203D_AMP_DIG_VOL_CTRL,
> > > +		     0x00);
> > > +	regmap_write(max98373->regmap,
> > > +		     MAX98373_R203E_AMP_PATH_GAIN,
> > > +		     0x00);

> > I'd expect these to be chip defaults, especially the volumes.

> The same sequence is already used in the I2C probe. if this needs to change,
> it's got to be applied for both cases.

Yes, it should.

> We should probably cut the common parts out, as done for rt5682. Ryan, can
> you look into this.

Indeed.

--n83H03bbH672hrlY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7rg/UACgkQJNaLcl1U
h9Bz3gf/Y4gNoCL7tKJQ4Q47CVeVvFVeO91LUoOXowzeKhdSCZq9fcjulWbFk5Cn
ddCd3ICTOp9Qfc+KXxHV/y/BJUnNh10tT4dyrwWLEeZ+9AkDa4Pt9BQEywCyHBxV
4r5db+On5gROQzzZgUBpkc6cWRz1XINfb+hu88u0/EaRwiFbN0s/per//s5Vtior
nuw0IU82/4WCEqOcPc8Hnrxwl6Bj8L34uLyrX7p1ARb5fhDcib4qs/bsfMsY/ZxI
9U3v6UQfRhOJ7DHqvr2QhG6yq6dxShJ1DyAoI0Nk8xrOZQl3+3o3K6Zf+o/eoNze
hO+Ut1D6J8iBxDlSz0gNg519I0B6Rw==
=dSXx
-----END PGP SIGNATURE-----

--n83H03bbH672hrlY--
