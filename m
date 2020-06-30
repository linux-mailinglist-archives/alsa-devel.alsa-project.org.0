Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DFD20FFC1
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 23:59:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06CFC1615;
	Tue, 30 Jun 2020 23:58:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06CFC1615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593554374;
	bh=CzBx6x00VbHMHS4DcAYU1yThrTZSIpRMWNsv23BXRPs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vW0h5Y/XbkdYLWfbgq/tc6dHP3My4T1rDOPpEEbjFXPJF6Kt/YuvqZqoO7xdGH5hG
	 v7juigr5O/6x7eArTfqazYgn6xwR+4FBRlBzqasJ9vZ7WV09spDbJKmpCbMQRcxcD6
	 bUMjLUitESxDMhOXBf4UN2ogJ65r9js8l1kP8Aeg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D15EF80135;
	Tue, 30 Jun 2020 23:57:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D420F801F2; Tue, 30 Jun 2020 23:57:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02576F8013E
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 23:57:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02576F8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="1oNgD8S6"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 067E4206B6;
 Tue, 30 Jun 2020 21:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593554262;
 bh=CzBx6x00VbHMHS4DcAYU1yThrTZSIpRMWNsv23BXRPs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1oNgD8S6Xyn8aq/Y9CFhNwnBwDz+MhMQXIKUnw1RiGZR7yGSDUNMy3scILBP4vI6/
 /rSXJB9w49IGm455kc1/cI2VYSKXaD31YUbMPhi8CfEJPxlbkcjEZ9lSCTyOA+5f2Y
 A3JyCEvSKkAvVMOOERKezcFug3Jbzj2ZUz/FPVWc=
Date: Tue, 30 Jun 2020 22:57:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] ASoC: Intel: KeemBay: Fix header guard
Message-ID: <20200630215739.GN5272@sirena.org.uk>
References: <20200617010232.23222-1-natechancellor@gmail.com>
 <20200630210441.GA3710423@ubuntu-s3-xlarge-x86>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kK1uqZGE6pgsGNyR"
Content-Disposition: inline
In-Reply-To: <20200630210441.GA3710423@ubuntu-s3-xlarge-x86>
X-Cookie: Walk softly and carry a megawatt laser.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.org,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 Sia Jee Heng <jee.heng.sia@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 clang-built-linux@googlegroups.com
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


--kK1uqZGE6pgsGNyR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2020 at 02:04:41PM -0700, Nathan Chancellor wrote:

> Ping? This is a rather trivial patch.

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--kK1uqZGE6pgsGNyR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl77tVIACgkQJNaLcl1U
h9C7WAf+JjcaYs5BFK44gTZgBmWsKTiCopbq3uQWJFLJ+feviYWrqG3/X2GpjxYn
YidHVwaQU0nI0uAbrHUyM+RILZ5ocezuzQ1ydnolNLS0Y4k6s57DV9SA6AthD6a3
mVDj1kV3r2IxSs6dEGLV57Nncs5jP4bvaV1lqt/2vvQXgECZFlVNWZmcY7m2OLep
AUjPC6mn5pfN4ekDOXcEDh6D5RgWzgw0iGg/sgMCkiIqbQjvVo1Vb6wdkl/7q0yC
fRijXM94eslYKA7dzh6Wwy5rlOBQWdfkdsbR9CMOMLdPO1zwozXCu7liK66b9Q3M
WMxtYJBX2NejwkxkRJGcleYW+miaiQ==
=Xj8M
-----END PGP SIGNATURE-----

--kK1uqZGE6pgsGNyR--
