Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CF019A775
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Apr 2020 10:38:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37352167A;
	Wed,  1 Apr 2020 10:38:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37352167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585730339;
	bh=oNkcy6MCIxLMMKXHzyyc2MBvLh1ZBTsMYqXgnMQF8B4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AJOmNpx9jlrvkedB1wgr2/JWcrljgHzk10g9cLjvtEqc7sYZCErGvBcRw/OxGR38i
	 96UOs6xv6UdcGthLd279VqHE7cj9gdraAD89F+mwQ53c1q5umdI0aJpwYgEyfm9Yxm
	 sFstQT/Px2QESoieOjkSMk2ly6dGLwh8pCVvQ2nI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FC16F80110;
	Wed,  1 Apr 2020 10:37:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DA15F8014B; Wed,  1 Apr 2020 10:37:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 32FC2F80110
 for <alsa-devel@alsa-project.org>; Wed,  1 Apr 2020 10:37:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32FC2F80110
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6756C31B;
 Wed,  1 Apr 2020 01:37:10 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF7CA3F52E;
 Wed,  1 Apr 2020 01:37:09 -0700 (PDT)
Date: Wed, 1 Apr 2020 09:37:08 +0100
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?B?77+9zLDvv73vv73vv70=?= <gt82.lee@samsung.com>
Subject: Re: [PATCH 2/3] ASoC: topology: use name_prefix for new kcontrol
Message-ID: <20200401083708.GA4943@sirena.org.uk>
References: <CGME20200401004223epcas2p2a2b0f54f83ea8fa0c1a1b96660cf4b69@epcas2p2.samsung.com>
 <004c01d607be$68cd8b50$3a68a1f0$@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline
In-Reply-To: <004c01d607be$68cd8b50$3a68a1f0$@samsung.com>
X-Cookie: The Ranger isn't gonna like it, Yogi.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 hmseo@samsung.com, tkjung@samsung.com, pilsun.jang@samsung.com
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


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 01, 2020 at 09:42:23AM +0900, =EF=BF=BD=CC=B0=EF=BF=BD=EF=BF=BD=
=EF=BF=BD wrote:
> Current topology doesn't add prefix of component to new kcontrol.

Please only number patches if you are sending them as part of a patch
series, the purpose of numbering is to make sure that things get handled
in the right order.  Without a series it looks like there are some
missing patches.

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6EUrAACgkQJNaLcl1U
h9A44gf/YID6zxs73bxg9qqZA+lDbazM6OoPj+aQIQAQDpJb61z4CCa8gmzHhzkp
iEUUvkGYTBq9+DjRrAK2CGyWuv3oyeoRe1l3wlwP9KpkbpkTXORXfyI0ZZQK7/K8
UgOw58rHO+/UeAlCtkXO6rVAUgGFJB45Uhy5w3wsPR5sOnn8s/ubiwbmgBCOwJVD
Q+kk4Ga8vKp3HRvBM0Hwmg1hadAnhzwxmYaXU8mkW2F3Mmb9TfDFP052W8NgKKb+
rhGqT/DbzN7+VBdzwpVJFrDTP+fIELWBkKiKjVwhUbpG2ma5mqKsrXF4tAPE4zVz
soK0VmDTQ6/x7HDj2UnaAKQJjfjnDQ==
=xwrp
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--
