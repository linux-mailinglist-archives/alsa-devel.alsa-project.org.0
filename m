Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E171ECEC2
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jun 2020 13:44:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4736A1665;
	Wed,  3 Jun 2020 13:43:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4736A1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591184672;
	bh=TIfw/cANrvleb6jHvANTUGWscgbEhvD0pcSy7/RQYAM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bu1KFrYD+Japr5qT4Wa7oCRYPIZUExHc7VyJfFSAI9kJNKX+/zp4xDFNe8S5GOjzP
	 vTzw39Ox6mF1DTsiva21eHghJZ+bkkYvIb43URLsXCTdW2m4btrcZqKKfjbya3Y6Ct
	 m5vAgthFY3WB+R9Rka6uOYO773+NZyoWP2KlrX8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CA32F8013D;
	Wed,  3 Jun 2020 13:42:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8615F801ED; Wed,  3 Jun 2020 13:42:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21464F8013D
 for <alsa-devel@alsa-project.org>; Wed,  3 Jun 2020 13:42:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21464F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jsCZ6tqK"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3CB0020738;
 Wed,  3 Jun 2020 11:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591184563;
 bh=TIfw/cANrvleb6jHvANTUGWscgbEhvD0pcSy7/RQYAM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jsCZ6tqKbRWecCFSn/LSHN1jRnCENNTbqogGNkeSCseQG0/CEOEwI2jJlEeB0HISW
 s4vQFI5lnW+0BBE86acH6ViTn2LnaqLi6qnVBmEuVhweUuBCIyQCJNL1XRznU0wji/
 99vYDogaIDn1m5CJAww0lubymqby2iDYMDdlmMj8=
Date: Wed, 3 Jun 2020 12:42:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Steve Lee <SteveS.Lee@maximintegrated.com>
Subject: Re: [PATCH] ASoC: max98390: Fix potential crash during param fw
 loading
Message-ID: <20200603114241.GD5327@sirena.org.uk>
References: <20200603111819.5824-1-steves.lee@maximintegrated.com>
 <20200603113145.GC5327@sirena.org.uk>
 <MWHPR11MB2047B58F4B5E395CB76CCB2392880@MWHPR11MB2047.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="TybLhxa8M7aNoW+V"
Content-Disposition: inline
In-Reply-To: <MWHPR11MB2047B58F4B5E395CB76CCB2392880@MWHPR11MB2047.namprd11.prod.outlook.com>
X-Cookie: Your supervisor is thinking about you.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "jack.yu@realtek.com" <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "ryan.lee.maxim@gmail.com" <ryan.lee.maxim@gmail.com>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 Ryan Lee <RyanS.Lee@maximintegrated.com>,
 "steves.lee.maxim@gmail.com" <steves.lee.maxim@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "krzk@kernel.org" <krzk@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "nuno.sa@analog.com" <nuno.sa@analog.com>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>,
 "dmurphy@ti.com" <dmurphy@ti.com>,
 "shumingf@realtek.com" <shumingf@realtek.com>,
 "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>,
 "rf@opensource.wolfsonmicro.com" <rf@opensource.wolfsonmicro.com>
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


--TybLhxa8M7aNoW+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 03, 2020 at 11:37:44AM +0000, Steve Lee wrote:

> > This is now reading the size out of the header of the file which is good but it
> > should also validate that the file is big enough to have this much data in it,
> > otherwise it's possible to read beyond the end of the firmware file (eg, if it got
> > truncated somehow).  Previously the code used the size of the file read from disk
> > so that wasn't an issue.

>  Thanks for quick comment. Can this case cover by below line?
> +	if (fw->size < MAX98390_DSM_PARAM_MIN_SIZE) {
> +		dev_err(component->dev,
> +			"param fw is invalid.\n");
> +		goto err_alloc;
> +	}

No, that doesn't cover all of it - the case I'm concerned about is the
case where we've got enough data for the header but the payload is
truncated.  You need a check that param_size + _PAYLOAD_OFFSET is less
than fw->size as well.

--TybLhxa8M7aNoW+V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7XjLAACgkQJNaLcl1U
h9CS4gf3SoiQPyfuvGkPPhzguKoHriVvRp+AFejSxVitcpSHlK+guzMZ7TbsUahq
mT9724QlmWXhv3pWStaiWn5BblXL1cw/jLwbWOB9g6J0JoH21c8LsfnaUe1ez9Lm
xfwqJWF6TXjUIU/EVTsB8U1Ic0Sedxz/+QwDUkkxGNKy9JjfB4BhFsci7v4x0nz4
euUPfTgLFjm9iDUkZeNWkz35EPGmcBTW7PcC+uWTw6WTPamU8ilUzFWvJHJ988WL
FdesETMKsTr06Yr1q8raecZPBmeRcQqpdBYiE8Q9JyC/gGRGXlOpC4V8/zTrMzg4
q0nSFTDhbYsZwNROBUbavgArgCVK
=FYh1
-----END PGP SIGNATURE-----

--TybLhxa8M7aNoW+V--
