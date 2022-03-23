Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC27F4E599E
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Mar 2022 21:13:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F9A915CA;
	Wed, 23 Mar 2022 21:12:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F9A915CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648066398;
	bh=7ByDWDyS+LCqRXdsbKp6cLG4X3/H3svbbyMaS6YXycA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c0kfw+1tF2Ksfk+PpXU6MsTjSUwm7lQjx9JvVpxraGLX+efCLmRc/8kvQh2s/51Mu
	 507tXvzZdJtAh03cOTCA9IlukYk79/bflbt63P7SidcgMEO+I3oXg6O7BzT5FJ76zC
	 xdq5Vb5k830yMFmK4hqrS8wQjFzVUapFmwlq0ocE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9A20F80310;
	Wed, 23 Mar 2022 21:12:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D84DF802DB; Wed, 23 Mar 2022 21:12:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E9EBF800AA
 for <alsa-devel@alsa-project.org>; Wed, 23 Mar 2022 21:12:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E9EBF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="r5WvsuU7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6DC75615AC;
 Wed, 23 Mar 2022 20:12:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F9D4C340E8;
 Wed, 23 Mar 2022 20:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648066323;
 bh=7ByDWDyS+LCqRXdsbKp6cLG4X3/H3svbbyMaS6YXycA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r5WvsuU7sTh4lZioOOjEfVNNFSdwhe9JVqzBDFKeDO4KtA63jrKx7CNQEJ0aAWqYL
 s4uVgaRlum7d5EycqsElwaYtHA+faCpxHmEM/MZ1/Z6xT4D0DEdL6rXCOOAmLyJFPE
 Gg5tcHZrJdbLUUdqV6LqLFhxnnE9UzADSCgnSAjjFCYlF0nQLSHnaNf6ICIhxPj7bc
 n1nz9Ck0fWbGSJBOT+6WQkF8Xe2abnH9lCAmjgUTK5S1HVHKG+Iyi+0+5ZnA//XYXP
 Q8Y7FVGN8F3ych09XOv2a2ONpLC3aDyil5i8xR07iOKkCssN56dy/VBU+AfMQ1XcBm
 W7TPili0Tw5Aw==
Date: Wed, 23 Mar 2022 20:11:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: Conceptual bug on SoundWire probe/remove?
Message-ID: <Yjt/DrGegbQHl76U@sirena.org.uk>
References: <d0559e97-c4a0-b817-428c-d3e305390270@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VLUwqOQObN1wGNIg"
Content-Disposition: inline
In-Reply-To: <d0559e97-c4a0-b817-428c-d3e305390270@linux.intel.com>
X-Cookie: Nice guys get sick.
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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


--VLUwqOQObN1wGNIg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 23, 2022 at 02:45:59PM -0500, Pierre-Louis Bossart wrote:

> The last line is the problematic one. If at some point, the user does an
> rmmod and unbinds the SoundWire codec driver, the .remove will be called and
> the 'drv' will no longer be valid, but we will still have a reference to
> drv->ops and use that pointer in the bus code, e.g.

...

> where I force-reset this slave->ops pointer, but it is likely to be very
> racy.

> We probably need to avoid such references, or have a clean mechanism to
> unbind, e.g. with all commands and interrupts stopped while the codec driver
> .remove routine is handled.

Your analysis seems pretty much spot on - you'll need locking or other
measures to make sure there are no live callbacks from the bus while the
device is being removed.  It's a fairly standard problem unfortunately.

--VLUwqOQObN1wGNIg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmI7fw4ACgkQJNaLcl1U
h9AyMwf/Q3P6d2dQv4p0W8VwjJWKCPuKfkgL5UfuxOmypjnTKGPiT2DpNLtm2szg
z+Q1ExYoO6ahRtmXZujWaE2i8Lzin6OIGuQrvOwhZoGiGqmrsQ9YfB3Lc3m75YIe
JGm1ap41mKaF7hwqg8a0cRJWz0/R7e4tkN+AFcN5i/Hd+Xl0COepxE99imNeIDMG
/2brFhnV9UMkH/KYzc7h7nfN6fEfFpkhaSUTsJAR89nnmxKbyzu6Jt3INsnppAxk
MwaQRwf4hn3BJ8IXk+IDQ4dKNtnSUHkZzPYo72Wxl+VVAOXB9xLmtjU/XedTwb0g
26OP6Us6aS8JNbmpDOP4ci6gsyqw+Q==
=/t/Y
-----END PGP SIGNATURE-----

--VLUwqOQObN1wGNIg--
