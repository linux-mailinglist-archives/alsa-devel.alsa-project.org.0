Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AA1262FAA
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 16:19:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 680521709;
	Wed,  9 Sep 2020 16:18:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 680521709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599661183;
	bh=I/szqmOWN3a0w0j4AAM3mWO44oIbYe7IJGp79PPBLMU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RJcjwYD7Dp3baSxu0QydiNdeTy6HqCpcaxHSmrz7Kf9W4dA/wQnCi5kIq3N6DGzsg
	 3SZDpeSTSeK1gnMmhgJ4xQHznhJr8rp1mLDssa7nvxmNYMi93jm0wPvwAAux96psyv
	 712R6zUFdn+QUCrkBuLuAnuZpQofw85l/C/pFIQk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41094F800E9;
	Wed,  9 Sep 2020 16:18:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0ED4BF80227; Wed,  9 Sep 2020 16:17:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7553EF8015F
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 16:17:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7553EF8015F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cBWwo/+5"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 939B522204;
 Wed,  9 Sep 2020 14:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599661065;
 bh=I/szqmOWN3a0w0j4AAM3mWO44oIbYe7IJGp79PPBLMU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cBWwo/+5kl3QB/aVwwP2+l5gIEr/JR89XJjurGCuZB+DTCBOG78gWCE9NkhnO9lGQ
 NUiteUSMikJg2+fr6bm7SoHtk+/QIQ0bg3EC8rsYKs9uTFsyXT0bRNsWiQgoka71kF
 wDWRbAZ9TQDJwVwBANjE6FZJhEmrVab9p0llk4B8=
Date: Wed, 9 Sep 2020 15:16:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 1/3] ASoC: fsl: Replace tasklet with work
Message-ID: <20200909141659.GA55051@sirena.org.uk>
References: <20200903104749.21435-1-tiwai@suse.de>
 <20200903104749.21435-2-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline
In-Reply-To: <20200903104749.21435-2-tiwai@suse.de>
X-Cookie: Question authority.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, alsa-devel@alsa-project.org,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>
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


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 03, 2020 at 12:47:47PM +0200, Takashi Iwai wrote:
> The tasklet is an old API that should be deprecated, usually can be
> converted to another decent API.  In ASoC FSL ESAI CPU DAI driver, a
> tasklet is still used for offloading the hardware reset function.
> It can be achieved gracefully with a work queued, too.

This doesn't apply against current code, please check and resend.

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9Y49oACgkQJNaLcl1U
h9AlHQf8DD5N5N/SvzYVwS3dnjueaMvkpiagWwyG5aZGZQscxsnE5m02ooOeO6cB
QDO0c4/mOeqRPi5+XTBi3eIoyppUNy4ACT2LnAPuiC5IVNoytaJgtt1clTWLFLnM
olRJXrhjFHBqG2lSg2HQc71AsA2XBKCrNcv9cL2ubNys5pxEcgmnTk9epgJvRMFF
F2m+qZXGk6LX6QBxqIdfxzTgYJDcdcvVRmUS4QP19GCU0rSOflyEMGyIG4DKy/dQ
CrZNuPearu6xpmsZexeYD6Q9uz18Gm2ggwC+kXQVo+l0HwENZHfmBzb+QCzM1tuw
swWM8HUu3OvtEsUZsDs21t7oU9oV+Q==
=chR3
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
