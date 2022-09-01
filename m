Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FCC5A9527
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Sep 2022 12:55:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6A2A1607;
	Thu,  1 Sep 2022 12:54:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6A2A1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662029742;
	bh=3yd6ra6HeRbyp75OC+9QeS3r0P/aVZwXcQT0DOYQW/8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kr3mqriSg9u5v2AkJElf3MOmEx9V4FvHQ36gfK9O4Sjpn9C5bDZ/Agw2ebHiI1HW1
	 dpmAHe0x55oTlTClkTAA444IhrxwWi5SmC3JWbW62X8XcybcawlS9wWYOtwMHHjuPu
	 T0ytMuAd9rJeQgIYqQ/YlPIRoBwsVR/nBylTpicE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D76AF804A9;
	Thu,  1 Sep 2022 12:54:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DA08F8026D; Thu,  1 Sep 2022 12:54:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCBBBF800EB
 for <alsa-devel@alsa-project.org>; Thu,  1 Sep 2022 12:54:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCBBBF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gO27tA/N"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3830561D46;
 Thu,  1 Sep 2022 10:54:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B80C433C1;
 Thu,  1 Sep 2022 10:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662029670;
 bh=3yd6ra6HeRbyp75OC+9QeS3r0P/aVZwXcQT0DOYQW/8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gO27tA/NvMCyftcMv/ycmh1rfMdMU/8TJIGvcF0k+tZn2xzciubBUbXGtEyrp3SkR
 VWhoaMVDsJn+MQLy/RRNf2C5BE+tUHuu1GoL8YiBb9zZ3TPjGUbad3Vco5tB6waqt9
 SOsR6TIzA5Or6YRva3rcjbTMsm9WVSZLh8rbGcbpStlDGXKFHJDPUMGRX79eberaRg
 mhj9m+kBC1OsPU4AkfhEuH8dtoUGPgePG3mCLiW9o9ayfX0pn8/R21/drjRJFd95jU
 6pdL6vhvsP+3ZGGxchD3dVHj5mETS9waNIE+Sam694W61mMOs0OiVcBlxbJJiXKiNj
 V4GiPQ+PRFirA==
Date: Thu, 1 Sep 2022 11:54:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Lee Steve <steve.lee.analog@gmail.com>
Subject: Re: [PATCH] ASoC: max98390: Remove unnecessary amp on/off conrtol
Message-ID: <YxCPYbPsEyZmuHOI@sirena.org.uk>
References: <20220826023504.6183-1-steve.lee.analog@gmail.com>
 <Yw+OCnOgYUOWdIEx@sirena.org.uk>
 <CA+Fz0PZStYOZhNpRQCCVKxaDmPPq_PwvWrxfWbq=sBNKrZzzNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Cck+RFJ0eKZVFr+e"
Content-Disposition: inline
In-Reply-To: <CA+Fz0PZStYOZhNpRQCCVKxaDmPPq_PwvWrxfWbq=sBNKrZzzNg@mail.gmail.com>
X-Cookie: This bag is recyclable.
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, krzk@kernel.org, tiwai@suse.com,
 ryans.lee@analog.com
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


--Cck+RFJ0eKZVFr+e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 01, 2022 at 02:57:19PM +0900, Lee Steve wrote:
> On Thu, Sep 1, 2022 at 1:36 AM Mark Brown <broonie@kernel.org> wrote:

> > I can't see anything which ensures that this is the case?  Should there
> > be a check which returns an error if the output is not enabled, or
> > should the function check the current state and preserve it at the end?
> > I can see that this would fix problems with it being disabled when
> > callibrating.

>  As your comment, this can fix amp being disabled when calibrating.
> And this also fix the case that music play right after calibration.
> Actually, calibration process should start mute playback before
> trigger this function.
> AMP disable/enable control in calibration function can break sync with
> userspace enable/disable control.

Right, so that sounds like there should be something which checks the
current state and doesn't start callibration unless the device is in a
sensible state.

--Cck+RFJ0eKZVFr+e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMQj2AACgkQJNaLcl1U
h9DP7wf9GATVAcXHSK80KY9ZOA+wsUyGyhrWjapV4h1Cs8h62KfnYLN+9v64Qkfj
j1pfKF+FSvEmfd7UglMjhIxPLvpY6nkBrprGFxGonBKJkPN/B6eQXpHJropn0hgU
zSgyVWNexi/JQCdRZlzGKq2eZasgSUr30XbmTo+IS0+ZOVjnYpbOu6bQgWw7Xcpb
CiwCyQympPrbatTJjcksnqpxIILphXddI854GV+6JDro0Ff+sVwh/Wy9KlpmJTmO
zQ3UeW/1ikooxqlk1nuAXmUQbwF71zaF4MBXfwih1ZOiuRCRUqHOSatHwXQDyfjY
iXLCGJBx6yVVMbRp0emPUWNdN3Vu/A==
=O3of
-----END PGP SIGNATURE-----

--Cck+RFJ0eKZVFr+e--
