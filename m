Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBCE3575D1
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Apr 2021 22:21:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7C551666;
	Wed,  7 Apr 2021 22:20:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7C551666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617826898;
	bh=klyJhD3vxpMCs0DbUyH+uZxCUxbSV7Z/0oACv3TSW+s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EOsFxUu5JZZqKgxt5/Dzq3e8ftd8qrQ8u4bgm0pgSMbUWAL8QvJygOiFaQDGS5+lV
	 Jgq87kYAT81DXXXghQVwZQTrqxCV7bTs5qHBQzyk2J3T+cXjCaP7Foq+nLsdXRRR53
	 BV54kbKtF0Gej7TXiMB08oKwURCSVN8HGZcrAa+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 201A7F80124;
	Wed,  7 Apr 2021 22:20:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4283FF8016A; Wed,  7 Apr 2021 22:20:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE39EF80124
 for <alsa-devel@alsa-project.org>; Wed,  7 Apr 2021 22:20:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE39EF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="m8bB7+l8"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99072611C1;
 Wed,  7 Apr 2021 20:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617826804;
 bh=klyJhD3vxpMCs0DbUyH+uZxCUxbSV7Z/0oACv3TSW+s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m8bB7+l8A7IogkLqEHfrXc4DastEMXjB39TD253sNIbQh7aaBYQME7ZftC4o1uyxc
 2ND731tgF9JldHc5Daz/eYFAtPGKaIfrtN+2tZwP3KK0f9x5eyLK3Ib6+7CR7eir/Q
 bnPrjgBfkl0diyzkzAqceGw9VBSfx51ruR0YJIwQv4yJ2YXmTAP49VKRJLsgZnrgVR
 mJAqea3C6HfYSEuqKSGnPP4+1TQvjGkxV4HjpR5w0E1hMKaw+s41OjDYTcORNLXAi5
 lghm5vNPnJZQljY101UnR6loBF8L2Wakem01VltT92SuMMY9beYfgs7WYvOz4gHyqd
 yCl0Jbm3+Kk4g==
Date: Wed, 7 Apr 2021 21:19:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v5 2/4] ASoC: Add Rockchip rk817 audio CODEC support
Message-ID: <20210407201946.GH5510@sirena.org.uk>
References: <20210319191337.9414-1-macromorgan@hotmail.com>
 <SN6PR06MB534258C507ADE505523E146BA5689@SN6PR06MB5342.namprd06.prod.outlook.com>
 <20210401183258.GP4758@sirena.org.uk>
 <SN6PR06MB53426C77C1EB640CDCE478CEA57B9@SN6PR06MB5342.namprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="9jHkwA2TBA/ec6v+"
Content-Disposition: inline
In-Reply-To: <SN6PR06MB53426C77C1EB640CDCE478CEA57B9@SN6PR06MB5342.namprd06.prod.outlook.com>
X-Cookie: Dry clean only.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, heiko@sntech.de,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com
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


--9jHkwA2TBA/ec6v+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 01, 2021 at 03:18:51PM -0500, Chris Morgan wrote:
> On Thu, Apr 01, 2021 at 07:32:58PM +0100, Mark Brown wrote:

> > This should go after the --- as per submitting-patches.rst.

> Thank you... should I resubmit for this?

It's fine from my point of view, don't know if Lee would want a resend
or not.

--9jHkwA2TBA/ec6v+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBuE+EACgkQJNaLcl1U
h9CYZQf+MBxtOpMg2oZesQ/5AX6Dis15dfrHcl81iz2GsYP855cmKp6m4Jjl/8M/
vOQM494SLGFi5zW1C8mIun2MByH2J4f3h5UgpXPXkvT06/DQaBugvZbc+LzRojH2
1F8u0BaTKcgMjYIWGYOIg2BsyXZAEF63ZX/MSc2gwAfUTLbhdbjRscYtP1VKP2UD
g7JGMMPGxPimZ4bnbqsY2ImE0SxzNPzjklSad90OelBjlIdEtIH3A3SWcdDggLJG
E7RqQ6MP/7xAbdByjgKh1tpkWpmO4cq9FRyO/xEnuB1ifZuUre4U/KDt02F6tLrG
KN1T/eU8iXlfPnLej9Z1zEmHWOiTuA==
=CDTU
-----END PGP SIGNATURE-----

--9jHkwA2TBA/ec6v+--
