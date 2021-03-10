Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D863343B8
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 17:53:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A810F1766;
	Wed, 10 Mar 2021 17:53:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A810F1766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615395238;
	bh=fblKNntOKs+r+Hk8T8EVXTYLBjqZfnQB55Ec28BK85w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jEGnr7pWkGKCoDt8LG1Bwv9uSLP3ffnDpC6SkDwf6/ebBVmV/CsExSXuyJ8q0zCDI
	 brkturUUec6m7LNGP43wPhwjYFDqhIV9LPAQxFDbMEBEhM+k1y9vT5CcrJmwwA/HXY
	 Vq9Zl70gd6rwdtG8aJbt29MGbAzkIHKca61le2oo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B2D8F801ED;
	Wed, 10 Mar 2021 17:52:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28786F8016C; Wed, 10 Mar 2021 17:52:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77F65F8010D
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 17:52:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77F65F8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UiJhmR9M"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C8B7B64FC3;
 Wed, 10 Mar 2021 16:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615395130;
 bh=fblKNntOKs+r+Hk8T8EVXTYLBjqZfnQB55Ec28BK85w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UiJhmR9Msd4dJcCAI3JQh5cFCa2RPKi+AAUyhajhmxZx/fdhIvPQvMtRG2/3fHHc9
 HqqPR1e1v/DoDIvPFXMiv+G1I1U3bg8GJtKw7Zz5VCHEByz1fZ8H8zLcuxYRH0m3x+
 DU97IXKJGEJxqgmuP1L7UH6zXbKycS2INQ8lm0DL45TiZe/Wo2tHL65iyN6M099JgS
 W1PdxgMnGZBeBES6UvyxgihEtG6h4Xc457fEisSdpRG/Zy4SPIZB/R/Wj1eg6FfafE
 dxUrzuF28JcgGb+BZem0wdPYmtjrQGjeky8kLhVVAtcNVcrJ0Fq0mfz9PHjeNQ+rxc
 +4KyBWZhgC5nQ==
Date: Wed, 10 Mar 2021 16:50:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH V2] ASoC: soc-core: Prevent warning if no DMI table is
 present
Message-ID: <20210310165058.GC28564@sirena.org.uk>
References: <20210303115526.419458-1-jonathanh@nvidia.com>
 <91480f92-a3f5-e71f-acdc-ea74488ab0a1@linux.intel.com>
 <20210310133534.GD4746@sirena.org.uk>
 <6a2352e6-f2b7-def1-de58-52fbeb7846e5@linux.intel.com>
 <20210310161814.GA28564@sirena.org.uk>
 <s5hzgzbvube.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="E13BgyNx05feLLmH"
Content-Disposition: inline
In-Reply-To: <s5hzgzbvube.wl-tiwai@suse.de>
X-Cookie: Yow!  Are we laid back yet?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>
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


--E13BgyNx05feLLmH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 10, 2021 at 05:37:25PM +0100, Takashi Iwai wrote:
> Mark Brown wrote:

> > > did you mean if (!IS_ENABLED(CONFIG_ACPI)) ?

> > Is there a runtime check?

> Well, basically both DMI and ACPI are completely different things, so
> I don't think it's right to check the availability of ACPI as a signal
> of the availability of DMI.

In theory they are only somewhat related, but in practice they're both
part of a holistic system model - ACPI users complain if their system
does not also provide DMI information.

--E13BgyNx05feLLmH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBI+PEACgkQJNaLcl1U
h9AKhwf/TqggBJ9cnL1UX9G9mZNlGaHbKXQez9oZGubvZ8Ejuhu4f1AUQyMXtX97
N7xUBWv6Tk+rVC3eq7ocQki9aEDHy2mSp7Lraw2/7k3Y94C54oO43n5hOzPiJxhk
VoBOVYEGgC1YHuG9Jyulpq7Q6ERCJTT0cxdLVlrgMosofWkw0osp2UGcCCST8Kjt
tRM6ayTyRWhtIJX62WDKFdzV8EBodR2E8h1WA7kMb5yD0N4fxZEXhdWRPBk7DjMU
YvSFWtTsKQMP2cTRTtxSI5q3QfBOGcx069FteBw40uMkCBdYGq3Eieb8wRnQ3Ip3
K1On2WnwhEx9MDLvlqzkRqvM/X6kGQ==
=7qIj
-----END PGP SIGNATURE-----

--E13BgyNx05feLLmH--
