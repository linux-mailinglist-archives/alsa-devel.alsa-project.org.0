Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A731B591C
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 12:25:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33729169B;
	Thu, 23 Apr 2020 12:24:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33729169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587637513;
	bh=nt6BxUMN9W2eJF7E9nemEDO2szsJjgfFAzjuRjtd3Us=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JmK19uyXcmuSeKefL747A6pgugLMcITsOX7sVYMGoxHO/jXc3Hm+Kg92+yLnO2KJ/
	 XDTFCz+GsRIm654w8lU9uHXt47tFg9KZZuzrRX3NWIX24tjYj80Zrs3YnkXy63fSvl
	 /aHCyXEyfsQdsKym+PMnE6JT6pSNnbjPBeCvMcJw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E061F8014A;
	Thu, 23 Apr 2020 12:23:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03F27F800FF; Thu, 23 Apr 2020 12:22:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEAA3F800FF
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 12:21:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEAA3F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RXnuOrjP"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7603F2074F;
 Thu, 23 Apr 2020 10:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587637279;
 bh=nt6BxUMN9W2eJF7E9nemEDO2szsJjgfFAzjuRjtd3Us=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RXnuOrjPt+5uK+vtmfLy+653zHEpc3aVLTlJHtDE8BsHBf6GvHDeZGYC/NeOPUPcc
 tqdPaMzB0IrldqaQ68oyZw9JFmTNLt/Cjr2EzBMJXL9HtmMmNT916Iw8K8TJRz19Yp
 lI4QiKysCakuUGB7AtME8XJTvTJlipp7CTwHshjk=
Date: Thu, 23 Apr 2020 11:21:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v2 0/3] Add support for different DMIC configurations
Message-ID: <20200423102116.GB4808@sirena.org.uk>
References: <20200422120532.31492-1-mateusz.gorski@linux.intel.com>
 <89873366-c063-5754-0e18-511477c3daa5@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oC1+HKm2/end4ao3"
Content-Disposition: inline
In-Reply-To: <89873366-c063-5754-0e18-511477c3daa5@intel.com>
X-Cookie: This unit... must... survive.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, tiwai@suse.com,
 Mateusz Gorski <mateusz.gorski@linux.intel.com>
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


--oC1+HKm2/end4ao3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 23, 2020 at 11:11:05AM +0200, Cezary Rojewski wrote:
> On 2020-04-22 14:05, Mateusz Gorski wrote:

> > Changes in v2:
> > - removed patch 1/4 swapping machine device and platform device
> >    registration order
> > - alt_tplg_name creation now uses different field to read machine driver
> >    name
> > - including of <sound/soc-acpi.h> moved to different patch

> Ain't change-block supposed to be just below message body?

Only in patches to stop them getting included in the git changelog.

> Don't believe series need to be resend just to fix cosmetics:
> Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>

Well, I don't seem to have a copy of it so it'll need a resend for that
unless it's just held up somewhere and arrives shortly.

--oC1+HKm2/end4ao3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6hbBsACgkQJNaLcl1U
h9Dirgf+Lh2CSaRCl1bWga0HFUsfQzZCrKhSNbCP4aMBl4tuJh9MyGZgBreURDSZ
655sjzS5Axd9BMQVoMZPvGuyG3pYni+od8t898YmQ4HhkRBPQzh6LuKsIjEYbBhz
0h2iyWTK+EYujFpsLQxcJ8zgBw09nEo9qgCj49Uy0G7nn6usP7YAQyli8AijsXUT
gZV/eoQWzSP+HKRGVibO6u5wTBpZq23rEwgYbp+RZzQcDd+xl9VQwCzk+fe1RS0C
tHdcr1OGwEJS3NsBkB5KmOXqwwJw8NO8SvRpPGb4S7syYVcjz4VdoLkWtakvGzmI
+D5OoKdytfVBxWYgpdwesLFft+8CZg==
=QGti
-----END PGP SIGNATURE-----

--oC1+HKm2/end4ao3--
