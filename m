Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3230519DB72
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Apr 2020 18:23:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4AD71685;
	Fri,  3 Apr 2020 18:22:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4AD71685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585930981;
	bh=Xi6W5kizL9E//fNUzc3eLhnxFmZfB2cQpzcwT5R5VBQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QFMKy9w3jOF17OXTFI7HnfB5UwQV9eV0iIAzBesemMYYZc4DwGqNaNiCnKB+aLqQj
	 FPSqH3Y4U1GPh+CKfd1x+vb1kwOEF6PMOiv+EVCHVT4yyNoj8T47EbFpFLhD2+F3ZQ
	 3pY7ASDlZIGk7YeYi7i+8f5tXaSWP+u0/f7uVcYc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8605F800C2;
	Fri,  3 Apr 2020 18:22:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1B48F801A3; Fri,  3 Apr 2020 18:22:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0429F8014B;
 Fri,  3 Apr 2020 18:21:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0429F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GfZLrt5/"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 61F892073B;
 Fri,  3 Apr 2020 16:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585930916;
 bh=Xi6W5kizL9E//fNUzc3eLhnxFmZfB2cQpzcwT5R5VBQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GfZLrt5/iBqYoAcJNJVbvAf2nJIwp9T82a4TZdMqpaB7I6DOy6XGgS+PYe6dAhw7d
 axLPCqudEwExgrbrvMRifczJ0rBPU2GVennslTCODOKy7/JDQ/t8t+9PPOM85TAJKq
 qLmPkJmeVl1YNn7JFA/FUohnmh8Ei2sCeW8Wjzro=
Date: Fri, 3 Apr 2020 17:21:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Subject: Re: [Sound-open-firmware] [PATCH v2 00/12] [RESEND] ASoC: SOF DSP
 virtualisation
Message-ID: <20200403162154.GG4286@sirena.org.uk>
References: <20200403091406.22381-1-guennadi.liakhovetski@linux.intel.com>
 <20200403092842.GB4286@sirena.org.uk>
 <20200403110404.GA23734@ubuntu>
 <29be8be8d9b8700588da693d93b9f10adbb10016.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9Iq5ULCa7nGtWwZS"
Content-Disposition: inline
In-Reply-To: <29be8be8d9b8700588da693d93b9f10adbb10016.camel@linux.intel.com>
X-Cookie: Use other side for additional listings.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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


--9Iq5ULCa7nGtWwZS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 03, 2020 at 05:10:20PM +0100, Liam Girdwood wrote:

> 3) rpmsg integration. The SOF IPC will use rpmsg virtio transport
> between host and guests.

> This series does not mandate a DSP IPC standard, since this may differ
> between DSP vendors, but it will use OASIS standards for virtio-snd,
> DMA buffers and rpmsg.

This sounds good, I think rpmsg bit was the initial part of this that I
was missing (but that will then lead into requiring the others) - this
is essentially VFIO for a software defined component so it's clear that
there's value in standardization on the discovery and transport parts of
things but I agree that the actual messages are just a vendor thing and
don't need an OASIS standard.

--9Iq5ULCa7nGtWwZS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6HYqEACgkQJNaLcl1U
h9AB2Qf+O2phCUV8bBr9nBaVsgwkDjLpik9KeYqXKL+iDdYqOubu0aV7vGFheuXG
dCIq3KTTb9cxuoxDWjS8XdJe2IInWT4AMkJ2ZPwVmgkJsAJMa/m8/SZ6/v5cxzLX
LwXLvwOkOJbr+laDAEmSaFYBKoZDsJPvXZ2T+6q1ggvs7kLytYzwcHg4cOPmB3OS
QRPQedFUW3CGYsPNytB1FnjFhwwkw7mydOvRFwwg3UtThrtTfFwe24FYBkunjoeO
UTA4j1aWg5JkXXBvZHktlFoFSLxMVCubgvYu/RKER7HCS/LoE+3AhnUs35ln0uJ9
f5z7svXLwnZpa/BmOck6WmP+kPqNHw==
=3tOd
-----END PGP SIGNATURE-----

--9Iq5ULCa7nGtWwZS--
