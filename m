Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DD82A0C0C
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 18:03:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EB341657;
	Fri, 30 Oct 2020 18:02:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EB341657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604077424;
	bh=thwyGLEm4QiHSUYxEzQuu9UgKpF/qQOjUSxHK4o2wTk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GBJBqwO3FLYVrofjjNaGGen7plTb/baCh3pFYBQjv2u6HGnG13wDmUCVMLiOVmFZ3
	 0CLjnOfSA6UnRp6aWXL22UxSIDe2FTKljEfNJYrJYgcApQpM2Ej108ccXprVWfi20d
	 JTmSgFbXVQKgtObvA1lKO7Dhv/1NXwKEDIyGfBvY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D680F80249;
	Fri, 30 Oct 2020 18:02:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1D7CF80212; Fri, 30 Oct 2020 18:02:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C59F5F800FF
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 18:02:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C59F5F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="2ZEhx0g0"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5D6BD2075E;
 Fri, 30 Oct 2020 17:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604077324;
 bh=thwyGLEm4QiHSUYxEzQuu9UgKpF/qQOjUSxHK4o2wTk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2ZEhx0g09DBf1d8fdkG/MFXgVasXBurxJ7QkWWlv89l7Fe4GB+iaF/3bmw42X49Bx
 Kul72KIfFdo099hGDKsz/86Z+lK0C9GzMbGAREk0BNicTwp6bkfw34B7+Vzac+aTmF
 FbmLceXnbVquFqk86Vm1StP/qG+Z4mtM42pWVXLw=
Date: Fri, 30 Oct 2020 17:01:56 +0000
From: Mark Brown <broonie@kernel.org>
To: "Lu, Brent" <brent.lu@intel.com>
Subject: Re: [PATCH 2/2] ASoC: intel: sof_rt5682: Add quirk for Dooly
Message-ID: <20201030170156.GH4405@sirena.org.uk>
References: <20201030063654.25877-1-brent.lu@intel.com>
 <20201030063654.25877-3-brent.lu@intel.com>
 <c83b3f20-2afd-12da-c349-31f35f8f6aa5@linux.intel.com>
 <DM6PR11MB3642F7AB13991ACF8A32B1DE97150@DM6PR11MB3642.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gTtJ75FAzB1T2CN6"
Content-Disposition: inline
In-Reply-To: <DM6PR11MB3642F7AB13991ACF8A32B1DE97150@DM6PR11MB3642.namprd11.prod.outlook.com>
X-Cookie: Blow it out your ear.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jason Yan <yanaijie@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, "Nujella,
 Sathyanarayana" <sathyanarayana.nujella@intel.com>, "Wang,
 Rander" <rander.wang@intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 "Zhi, Yong" <yong.zhi@intel.com>
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


--gTtJ75FAzB1T2CN6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 30, 2020 at 04:44:17PM +0000, Lu, Brent wrote:
> , Brent Lu wrote:

> > Wondering if patch1 would be enough?

> Dooly has DMI family string " Google_Hatch" so the DMI quirk will overwrite the
> driver_data. I asked google but they prefer not removing this string so it seems to
> me that one extra DMI quirk is needed.

I think this needs at least a comment otherwise someone might come along
later and clean it up.

> The other way is using acpi_dev_present() in probe to update the quirk with correct
> codec setting. Which one do you think is better?

I don't have a strong opinion either way.

--gTtJ75FAzB1T2CN6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+cRwMACgkQJNaLcl1U
h9DcZgf/Qof6PGRurGnpQ2XocAW1wp2HhEjd7S7B/IAYbKmBkwbI06mg6nhYV49v
38OE3/ESsSQ7+9T0rdFp6SAfYXMBb0vvfXVeYh9eF7v8m4g9fnWmC4UUHc6d022B
qQ+mboj7lpV54GTPr+5Y2xlpQ7azr/e33gz2TOh8cio7LGO2cbWyMLOlWBmtRrvg
9dxsKUXYFfIDd+D7chU5idKR/YQFgH2mSiQo6xiiuIzpjTPnC51BUP3w94iXdLfm
1Dohd/zMFnieeAilSo1rTmPMzkDBvGt6hHliXTo6hNlecNVldek4ucgVWv771sRb
OhCdZhVvfNdOLN4YEc7M/iEoQFwymg==
=NzJb
-----END PGP SIGNATURE-----

--gTtJ75FAzB1T2CN6--
