Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D21E511C7A
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 19:03:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 900B220C;
	Wed, 27 Apr 2022 19:02:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 900B220C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651079005;
	bh=ouO9czTH1hGnxhRnNmCrMytCCUcGkvz2EgFW4yiQlKY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MwLNBD+k2oKiac8YJsDBXnB3XKiUflnIkcA1Zn3qn/CAYBpCNyNI+LlJyckznVKGn
	 De/wNgShyMczFJsxk4vbYlQ6yNNQv+L1/uWX8cf8JGGnuWBW8uxY5CH/f14AN/xTzp
	 4Xr6N/VzKzfyylKgv/3iGG9PpDoxq1pTbDV+0rrc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 112A6F80253;
	Wed, 27 Apr 2022 19:02:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 738D5F8016E; Wed, 27 Apr 2022 19:02:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13B5BF80152
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 19:02:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13B5BF80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="P41MUKbW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 80A3B61DD9;
 Wed, 27 Apr 2022 17:02:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E2B5C385A9;
 Wed, 27 Apr 2022 17:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651078936;
 bh=ouO9czTH1hGnxhRnNmCrMytCCUcGkvz2EgFW4yiQlKY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P41MUKbWcbp+/p4irkEFK7rEw3lVlBg/J/trLlJiHk+9o+VybeWYbjl1vWl0xJ7WF
 axwKtNA3sh6/iPwHybf7RG4lQ2Mk5nQGghluWK+WnMghaRhE2BtOzxFC+wKFf3P77q
 NzX7XfZ2XbTs3qQ4zgcFPD4D8xleg8CaH/+56UvncWtlvCa0duPXZR6mQ3Y3FPJibE
 AHDiKn4FWNUW9EUZyO3xK7E2ZWQe1mFJbnyjQjIymW1xzJGCaxvZBWwm9JKOL3nJ75
 Inv2/YtFcIUPKR+X9V4jm1f4XW70VLmwCzKEwwiI24iCXmHh0uukq8kY/CwdUqVf84
 NBAegH8Jw3AHg==
Date: Wed, 27 Apr 2022 18:02:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: WM8962 crashing on suspend
Message-ID: <Yml3FLb4edRWKwTX@sirena.org.uk>
References: <CAHCN7xJuAuGmSQsmBfg-C6jOdJmf1Li=YWp7Jdi29nU3kk1GcA@mail.gmail.com>
 <20220426174150.GZ38351@ediswmail.ad.cirrus.com>
 <CAHCN7xLqixKxM_L7P9T2BqLpyHoGTYpMODKJotCneXZK+wUEMg@mail.gmail.com>
 <20220427145730.GE38351@ediswmail.ad.cirrus.com>
 <YmlgL+Ur6BeWiUtr@sirena.org.uk>
 <20220427164825.GH38351@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="JBWjWul9bDTCdfX+"
Content-Disposition: inline
In-Reply-To: <20220427164825.GH38351@ediswmail.ad.cirrus.com>
X-Cookie: Buckle up!
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Adam Ford <aford173@gmail.com>
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


--JBWjWul9bDTCdfX+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 27, 2022 at 04:48:25PM +0000, Charles Keepax wrote:

> Yeah in my head snd_soc_suspend would have been called which
> would (assuming the DAI doesn't have ignore_suspend set) shut
> down the DAPM graph for the audio route, causing the runtime
> references to all be released and the CODEC to be suspended
> through runtime_pm. Not sure if I missed something there, and

Runtime suspend won't do anything beyond tracking the reference count
when we're in the middle of system suspend IIRC, it won't actually call
the operations.

> that also allows for systems where the CODEC doesn't suspend
> during system suspend. That said guess there probably arn't
> any use-cases for that on wm8962 and I am more than happy to
> use the force_suspend ops if you are happy with it.

The other option would be to move the runtime PM stuff into the bias
level configuration I guess.

--JBWjWul9bDTCdfX+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJpdxMACgkQJNaLcl1U
h9AiLAf/V0iFrJXSvKhJSN37re/9556nmJM0hkzqFzuDHY0aNA3GXqQuxwzRwZeb
WBG/TfXmzyFOSGFHu2XNzxiA3Q87nVcQIyKoEftz8th7lqC1B5ZZHd6mbN8Seydh
I/zT5enwLnMzObA/cT0xlZduStCptlOfWLXcm5XNzOQrYhYZTsV8+0DcPdu5eZSw
TC+zYtbPM2tNc7DKSf/JipuT595Wh1C3o5g03CDwwoybHqotObIdWz6yN1gwFB1g
vIKyMP2mEOXdQGY/3F7ZoL7e8dVw4CozymEVg/7bbEo0WsGYX70JVN/84TQYGeLe
1gzgl6Az9g5MgsGOCRuA9ZHVXjDr8A==
=dGQx
-----END PGP SIGNATURE-----

--JBWjWul9bDTCdfX+--
