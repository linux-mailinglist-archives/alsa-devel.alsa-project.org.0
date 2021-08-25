Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8173F7255
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Aug 2021 11:54:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBFC4167A;
	Wed, 25 Aug 2021 11:53:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBFC4167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629885249;
	bh=k4qW2MGVv6lsjTMeqsBszx1sWAWurkEnyKnzQikbJaI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N//HhrwuuvbK1PpOnUB4tFSt9CwXjJ9WNsqsXPAX6rZC31TG2pLLXHVc3ZCOT78ro
	 KoalnzjdQcKsBWCBHUk52ZjkubmksyWEdYIJNM8zWU+jStIlTdLU4uIzlSVYrTUit5
	 YfdT7VrgLG5ZC30UrTvJ7h1q4rdJAuHuGrJRhNz8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23F5FF80171;
	Wed, 25 Aug 2021 11:52:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80FCBF8020C; Wed, 25 Aug 2021 11:52:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CCF0F800C9
 for <alsa-devel@alsa-project.org>; Wed, 25 Aug 2021 11:52:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CCF0F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fiSY+43j"
Received: by mail.kernel.org (Postfix) with ESMTPSA id CCBE561153;
 Wed, 25 Aug 2021 09:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629885161;
 bh=k4qW2MGVv6lsjTMeqsBszx1sWAWurkEnyKnzQikbJaI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fiSY+43j4Yih7SIz3JeRfD7Rgrum1vl+IBCXizvIdRvKFNbHORmNquKph2O/mZFRh
 nfnkwO0kk+g94JiI/lke5bRCFWyWnrIK2d4F+V7PIa8e93uvD2jszET7/qYhjEfpdo
 6RVHYPzGKhojaacCwIneU6t45qN5FSjx/KJ0r6uhLXYutK6/mb6n2iw/s5fKCVVIkJ
 3t5qOjE/JSk0EW0Pu3xauaJjN5JX2mdk9BD9Md6HwFdcwryA36HC+f2ttCR0T4Sz2c
 6zX+eNo+YOTQblU2vYu91g/NBewiko35f4e1YrxSY9K6jEkVvIFv7SueGGGs6gGvSf
 VxQUkq1/zAe6g==
Date: Wed, 25 Aug 2021 10:52:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] kconfig: forbid symbols that end with '_MODULE'
Message-ID: <20210825095214.GA5186@sirena.org.uk>
References: <20210825041637.365171-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Content-Disposition: inline
In-Reply-To: <20210825041637.365171-1-masahiroy@kernel.org>
X-Cookie: MY income is ALL disposable!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 linux-wireless@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Luca Coelho <luciano.coelho@intel.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>
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


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 25, 2021 at 01:16:37PM +0900, Masahiro Yamada wrote:
> Kconfig (syncconfig) generates include/generated/autoconf.h to make
> CONFIG options available to the pre-processor.

Acked-by: Mark Brown <broonie@kernel.org>

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEmEs0ACgkQJNaLcl1U
h9Aq4Af+OUuZSvmzbZyoTGGCofB/L+N5Ehn/9iHBJTZBr46S9ip0Zv7RZXiHqhtu
yJO2Gq1P6j1xVYtqqPCDOvNgaeEghTvLtpukroOGR/uA/S21Xobqhy6F3Tb/jrPm
KTrf5LWtRKS0I2sxbgteQRvOOjPIELQv8Lr0Y2ykO+yL+UEtNDJH4OsuNdXhdbh5
t2jZ7OgZ/Ot/6AB78YWbaZTZZHqfGM/jzeUpWG6kCdItSPXam0Q5LyYheMGn7MBb
6zAG6O+2Napi31AkH6Pyx18+hzh4XhnBLSX9ZPNP8ZM5iRQZjLHt1sYdukoFEATI
zkcxGg7hM8LCp7KGuyMcTafl0ikf4A==
=yeET
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--
