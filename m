Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5317E1C77D8
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 19:27:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1D02179E;
	Wed,  6 May 2020 19:26:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1D02179E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588786043;
	bh=S2TlQ49fNmSbg1vPgENmKxWm8+lXEwLINISJPrm4mpc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F4ZCcVl6iSnTkOMGOuN2ej5b8e5cKNOaRCshX12bJlPDBD/mTHS/U6Q+Cpgzskczj
	 7BzQJrJ3MtOO1A94c3E31Bdee9B02YepS2MdYTrJzbU7z+8lP9ziC5WNcnkI53Hhpj
	 UX0uY0Im8sqHsEPLBFenkzd4hSDMbQ1PfTAG2rQ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0402F80253;
	Wed,  6 May 2020 19:25:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CEB9F800DE; Wed,  6 May 2020 19:25:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 042F4F800DE
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 19:25:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 042F4F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VdkmFPqC"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2669F20746;
 Wed,  6 May 2020 17:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588785921;
 bh=S2TlQ49fNmSbg1vPgENmKxWm8+lXEwLINISJPrm4mpc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VdkmFPqCLwRRIStXOo+qN6MBvOnKOjWa/RagbNbJ+ov9iujcoST8q+H5h/ro26MAx
 1M4C/Cr8o2ymB/2lPlf6pENU5dSTK/EWSMHZVbq0dkf8g1/P9KUbijqUhKs8vg7JJK
 zvWvDRWp0nEGwZJbfImCzm3XR7V57wh0xF4tnkMY=
Date: Wed, 6 May 2020 18:25:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 14/14] ASoC: amd: enable build for RN machine driver
Message-ID: <20200506172519.GJ5299@sirena.org.uk>
References: <20200505205327.642282-1-alexander.deucher@amd.com>
 <20200505205327.642282-15-alexander.deucher@amd.com>
 <2a8891ec-d162-77ed-8093-6c7072b6b8f7@linux.intel.com>
 <20200506162656.GH5299@sirena.org.uk>
 <DM6PR12MB2633B92B19B337A72B64D0B397A40@DM6PR12MB2633.namprd12.prod.outlook.com>
 <20200506164345.GI5299@sirena.org.uk>
 <2061b12a-cc4b-558f-6fc1-b6bf548e7603@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="I/5syFLg1Ed7r+1G"
Content-Disposition: inline
In-Reply-To: <2061b12a-cc4b-558f-6fc1-b6bf548e7603@linux.intel.com>
X-Cookie: Not recommended for children.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Alex Deucher <alexdeucher@gmail.com>, "tiwai@suse.de" <tiwai@suse.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>
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


--I/5syFLg1Ed7r+1G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 06, 2020 at 12:17:03PM -0500, Pierre-Louis Bossart wrote:
> On 5/6/20 11:43 AM, Mark Brown wrote:

> > What you've got should be fine then, you should test with a !GPIOLIB
> > build just to be sure though and ideally submit a patch fixing the
> > SND_SOC_DMIC Kconfig.

> if you don't care about gpios, then the only reason to use the dmic codec
> would be the modeswitch and wakeup delays properties. If you don't care then
> a dummy codec would be just fine.

Yes, it just decays to a dummy eventually if you don't use enough of the
features - the constraints aren't particularly useful here.  Still it
doesn't hurt to explicitly say what the device is.

--I/5syFLg1Ed7r+1G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6y8v4ACgkQJNaLcl1U
h9DpLgf/Tk+reGdQWxJuWa7/0gxj+Ezvr5YTW1FM9P3+DWkyXeO3+m9BCqtEgmHl
9JltvCZH0OJLVNEmuGKxoT1raLvDs2YXS52HtZCFxql3vVAPJNabqi1JsSooFvy1
NEnYgGvZm8mLdk0+0OWR3+um+J3NAjvCe7NgnxNSAvsW3q0T24+0sYj0Gq9UiWjE
nxS0ipkXZd6S9lmsKbqA8pHEYqD/EymX4zPINyR9DVGEym6LRXs/Wd/mLmjkFfJb
LKhvho2VObBaeJpDlIFYvYQncJOGb4hSztviLuCGa3OtEa2py7YdFeC5mEU1gLJs
+rSOX00qK1oZhQieQWYvL6DwIuxMgg==
=1mAe
-----END PGP SIGNATURE-----

--I/5syFLg1Ed7r+1G--
