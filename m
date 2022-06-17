Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 248EE54F2C6
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 10:24:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AA081AA8;
	Fri, 17 Jun 2022 10:23:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AA081AA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655454270;
	bh=ZG1PRw5VnASc89o/sYJOq7OiWVJgsMuC9yddKS4CDrA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E9hRxm+GZXyJmk13lRRFn/sSWylg6Nfsoj5DBm0Xcd6Ddd8tVPyAqNMLIJZ6OB5dV
	 iJeoeLhe0vBMc9SzXT0taPYQHWfrwiiwASo4sa1QnS23fM7RosnxIQKRoZJPrTP9ic
	 JMA7gaOgybITdLbRMhPG/pEIP9k8H6tEB9Wgca1k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1740F8019D;
	Fri, 17 Jun 2022 10:23:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 154CFF800B0; Fri, 17 Jun 2022 10:23:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0EDBF800B0
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 10:23:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0EDBF800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lT4Ro3kc"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 78F1FB8213C;
 Fri, 17 Jun 2022 08:23:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20996C3411F;
 Fri, 17 Jun 2022 08:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655454198;
 bh=ZG1PRw5VnASc89o/sYJOq7OiWVJgsMuC9yddKS4CDrA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lT4Ro3kc+A+y+QX6qf1iKCZL6VGsTamd7TWyXJxZ2TgoTwfV5oSwsiZ05/Bq3z9IC
 2uNbFIfQvVNRYjJkhVFsY2BWsYBvW3xuP9vMO9+85A0paewaFf0eXvtE+dLv59lF/i
 KU3d1/XThv0zX0yeZ0/g47Y7eAIgVru13ITMzQYfhXy45s0giDW8i8MvMj8LAtTck+
 cd3I++eF16H73f81p1ss27mLF6cf1fcCqRGxSsVhFVR/qZSO4fWgnjJsdhv0DVrOnE
 iUIlBWlrsurY4mh7jG3/giMqgCMcoDTIoUsfJKtC9I7e0yzq2Cv+NACt0wYW3+LrpB
 Fv6MAEBlZtZjA==
Date: Fri, 17 Jun 2022 09:23:12 +0100
From: Mark Brown <broonie@kernel.org>
To: David Owens <daowens01@gmail.com>
Subject: Re: [PATCH v3] ASoC: ti: omap-mcbsp: duplicate sysfs error
Message-ID: <Yqw58Jt9Pky/mYdc@sirena.org.uk>
References: <20220616202645.1645972-1-dowens@precisionplanting.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xbvFMKB/P2J9t+zG"
Content-Disposition: inline
In-Reply-To: <20220616202645.1645972-1-dowens@precisionplanting.com>
X-Cookie: 98% lean.
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Owens <dowens@precisionplanting.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
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


--xbvFMKB/P2J9t+zG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 16, 2022 at 03:26:45PM -0500, David Owens wrote:

> sysfs: cannot create duplicate filename '/devices/platform/68000000.ocp/4=
9022000.mcbsp/max_tx_thres'
>=20
> Signed-off-by: David Owens <dowens@precisionplanting.com>
> ---

Please carry forward tags like acks unless you make changes to the patch
which would invalidate them.  No need to resend for this alone.

--xbvFMKB/P2J9t+zG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKsOfAACgkQJNaLcl1U
h9AURwf/f6I/e2bDkIEEwNwEPBB1bwhn2Ume/aTTU7/TGFfAbhYa83++IgU/cF7B
AQHpwlpoktSXH+1RkSCKAcyEyGUPqTZ1eCkvQKz+jWwY/SkVBkBCfDyol1nwkemY
lLjSMOqiHyD3f1APtYct9T394Ds92LRQoobqwxB8cQoOjbjIIEpODoUCvexMGRMC
YnQLl4E0CLydjipC3buAjqYF3oR7z2E4ntVVhYUGUID5pDgCqE+ELWluwwUf+tL1
jCtSMlGORLrIojhA8G8+eYzFy6X0niIbWBRfHaD5XC1wkX1S5BqsbXLgoaSvOHpX
hkIjUyYdMzPeGTUy3TNzBlGZ5hFqdA==
=rwQu
-----END PGP SIGNATURE-----

--xbvFMKB/P2J9t+zG--
