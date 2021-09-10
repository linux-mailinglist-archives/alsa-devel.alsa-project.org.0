Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3994069F3
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Sep 2021 12:18:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25B561696;
	Fri, 10 Sep 2021 12:17:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25B561696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631269085;
	bh=DY9aUAMbBWXj6/6sstLfJLZSxcBTc37Ktwo5jblB5ac=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pyejMnFsAxDO2zqwVh1PfVRTVWCF8BH7sBRV9uon3zoiDo7dVxBrGzV1sCyuoxCY5
	 e3lAAQ8/2Abs1qJPVpFEMDodo7iQRCtuKl0KRC5vmRI6NAysTvFMEMF4aQPhUGQmap
	 PYVwbglLPVkFCh4io5wHUFhxm8E6LVskpetykf5Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75DDCF8049C;
	Fri, 10 Sep 2021 12:16:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3EDEF802E7; Fri, 10 Sep 2021 12:16:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BFB2F800FC
 for <alsa-devel@alsa-project.org>; Fri, 10 Sep 2021 12:16:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BFB2F800FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="c0EJ5RdG"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A9346103D;
 Fri, 10 Sep 2021 10:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631268998;
 bh=DY9aUAMbBWXj6/6sstLfJLZSxcBTc37Ktwo5jblB5ac=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c0EJ5RdGelCNfqbVedB9LASXFUKnF5Fj99u2lkKeBiKwH8aotzLwyA9jXOFCQGNXR
 mDKshJW5sAKtcRjGLg5qVttQAdQ+mrvCafQ7D8kKzu3X6EqMvnqT7ZP5rUtKHq44UQ
 AnkQe9J2va7gDW2lNSBrCd32TGIEszuj3hxEM36biyod2oa3xxN01f1Gopu6Vp9OD8
 sMpcqbaCrOrHJbX4jzqLC8ZT++/1LmxujNnA/yNFzFi6hCZPuANbNreWK8kE9ThEFO
 hZUs892f1Z5SmSIyVe3Qbu7XIbE7q9qHPFF11ll50TXaOl3SHWA4juTyyx+Mj0ccQe
 69rlzRlA6S5zw==
Date: Fri, 10 Sep 2021 11:16:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH for-5.15 0/5] ASoC: fsl: register platform component
 before registering cpu dai
Message-ID: <20210910101601.GB4474@sirena.org.uk>
References: <1630665006-31437-1-git-send-email-shengjiu.wang@nxp.com>
 <20210906114701.GC4309@sirena.org.uk>
 <CAA+D8APjyq74FECmH6ZzyVKHOz6MEV0bt+D4-Xkfc-6C5n9hZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="IrhDeMKUP4DT/M7F"
Content-Disposition: inline
In-Reply-To: <CAA+D8APjyq74FECmH6ZzyVKHOz6MEV0bt+D4-Xkfc-6C5n9hZg@mail.gmail.com>
X-Cookie: You are standing on my toes.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
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


--IrhDeMKUP4DT/M7F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 07, 2021 at 10:43:26AM +0800, Shengjiu Wang wrote:

> It is hard to add conditions here for defer probe.  And maybe
> some drivers need the same components for cpu and platform.
> Do you have any suggestions?

I would expect that in this situation the same component would be able
to fill both roles.

--IrhDeMKUP4DT/M7F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmE7MGAACgkQJNaLcl1U
h9BmyAf+LFLU0qRNu/j0JR6PE/8Cy8MmuyW9DYr0CDki8qhipKQWJLaE5/l9diiL
W6V5q2giENDxPZKAyyHs08abuAq9JD0EEQu7z03P9x2UWrLxhcJ8itPNJZixH3KX
hpfg66wdAFS6QoqdQ0qLaFYzsnXMe2Zv6x6O70ddG9hLbUT6d5OfYVPWJHvKh1+U
xM/cI74vCSkZ0LG1PvEirEPw2qGWIyS610sqjZcWNUxLTtG8s+clPXy+hsNc/Mbm
jiDFUf2Ixz5TgZDlgfJElBOz9x2QHypCVsatoXe2XW50T1TYLdUAGpvmRD2F4Y/d
cvlkwzMtFFP3/6IRvYPYReyYl2Lc6w==
=EL+Z
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--
