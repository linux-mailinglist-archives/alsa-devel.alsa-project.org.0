Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7055A8350
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Aug 2022 18:37:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 495A716D7;
	Wed, 31 Aug 2022 18:36:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 495A716D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661963861;
	bh=KgZnsso7kF6aHFGnSIJef18Uvd0pNC/m6XSGxGYBwGA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=beQWf699HfIxamediglbfsGnDzI9rvpG7/amZOM4IBKguwWFsmZjF632i+RXsM8x3
	 eUU6AEkBcP/msJyyXOPnmMFqRdmHDwgrtUt5m+BZC+u/Sy9WAloPlMmd/daV9TiG99
	 9EPcmngjinNVBQT7Ehl3nqaHTeW5ftINmlxRq59c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B842CF80448;
	Wed, 31 Aug 2022 18:36:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4526CF8042F; Wed, 31 Aug 2022 18:36:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6452CF80128
 for <alsa-devel@alsa-project.org>; Wed, 31 Aug 2022 18:36:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6452CF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Sz1XKawN"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 84773619BF;
 Wed, 31 Aug 2022 16:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293EEC433C1;
 Wed, 31 Aug 2022 16:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661963791;
 bh=KgZnsso7kF6aHFGnSIJef18Uvd0pNC/m6XSGxGYBwGA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sz1XKawN2B5HHP/sZItd+rAzx2tmHhNRckLdU7Z0JxA6uEHvfmFFvLKnsQ68F3W/i
 SRaqC9SoHRlpYUBcOFkREKq3ZrFt/AevhKdNyluFpx4Tm0sJlXIsBePzkb6yoPvuuH
 MAbJkzFu/3e0WZitiB9kDH7Xk8M+oEbw+Yp3LAaxCV9+14SmHgt853Fhg7+vo7oeYK
 IEZTCDAu++Jk4o5/obZW6houyO9FPyQ3gXIkH6LL0UtByLXf/Bhgv+691IBgxjbExG
 ic7F2diU4ZSYka8M+XnlpjkJjvlFerCQf2W6MNDVudmQ8+WZz850jyCzzRSr5m44Rc
 UjAbG7g9a3vXw==
Date: Wed, 31 Aug 2022 17:36:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Steve Lee <steve.lee.analog@gmail.com>
Subject: Re: [PATCH] ASoC: max98390: Remove unnecessary amp on/off conrtol
Message-ID: <Yw+OCnOgYUOWdIEx@sirena.org.uk>
References: <20220826023504.6183-1-steve.lee.analog@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="52dw3Ph+pKqVOnNd"
Content-Disposition: inline
In-Reply-To: <20220826023504.6183-1-steve.lee.analog@gmail.com>
X-Cookie: It's later than you think.
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


--52dw3Ph+pKqVOnNd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 26, 2022 at 11:35:04AM +0900, Steve Lee wrote:

>  The Amp is already control in userspace before trigger calibrate function.
> Remove unnecessary control in calibrate function.

I can't see anything which ensures that this is the case?  Should there
be a check which returns an error if the output is not enabled, or
should the function check the current state and preserve it at the end?
I can see that this would fix problems with it being disabled when
callibrating.

--52dw3Ph+pKqVOnNd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMPjgoACgkQJNaLcl1U
h9C4ZAgAhg2+SIaK5IfZY+hTm2eRhD88hpYBfBw5lrXth3VHn8iRgUorzGgiqSle
VbE+t7hq4C4q11alwzR+ZdtZgfuHBb7Y3w8Xx+Dk0SxJQ9bptDT4/nb6+Y9Uogwn
Fd07GAC8YzMUZnIjOK4VzL70N/iTLSXroGUb3MoMYWwFWnN5VeaR5eZSHa8ntyt/
S62LthzfBXoNaqrrpx+jeXqzEYzOPfQKfNDAXVW2Imj+D00hp5W4zSvDYGofI4qR
zfLUl6afqUqTCp/MHUncBPafhQJ1QBJVRYRTDRyvxdgFSIcBQvsZSJ4wRZhk86ot
90friYxGNtUu2Q/VBaInZN//VEIeLQ==
=yjS4
-----END PGP SIGNATURE-----

--52dw3Ph+pKqVOnNd--
