Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EFA6044B6
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 14:11:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1498A14A;
	Wed, 19 Oct 2022 14:11:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1498A14A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666181514;
	bh=GWr+pXdg4KAo4cm6ndECUvEjk2iIp9Udlw6HdytD74s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g24BKMyrlapD6J328xAxmpB1BsfnYA+fg8KLxQeACq0wcYVc1dBd7wOn+eXIizXpX
	 BoK5uEBCjZFjsAmMTfl5eTjbffo7RfxcR07jG3NZcUmMFPFjDDo1WrTNeiQk8Htrfw
	 l+Zjch4AfIhb0Om2VeQjsTvxVeUA8y2HflG8wnkc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42BD8F804E0;
	Wed, 19 Oct 2022 14:11:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16F85F80087; Wed, 19 Oct 2022 14:10:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00E57F80087
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 14:10:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00E57F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OjRgwK82"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C04CCB822CC;
 Wed, 19 Oct 2022 12:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88008C433D7;
 Wed, 19 Oct 2022 12:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666181454;
 bh=GWr+pXdg4KAo4cm6ndECUvEjk2iIp9Udlw6HdytD74s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OjRgwK82xNTsABYyqlr8BKxalnQQsibfZTFAOamdK5hDwR/68+Cx2S/zX6i0MRQxp
 T0crx1/UCoUvIBNb08r6YB6S4aOpA66cGj52RwxQ+sJvET2GGqMSuAUuvmXNiVG3s9
 aTeXZ09DXkIm0Dzuy1OdMxVuMRQtL+f1fG1jaMUGy0nraMtyM1UNyQEaJPyahI4Rvz
 F5IHTKOhmBdG8PqB7zX5baQBOCj/Kg/fJCl9rUVecEFATYO+YzWltUuLB1vZ9FWG7w
 fN2ccE5iOoMFtTTcFjTAMxbjneGFbgD5mMaSvT/GYdNPn+MkRjLoedlJMPoYg6wLc3
 j9FS/IlvurxGg==
Date: Wed, 19 Oct 2022 13:10:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Colin Ian King <colin.i.king@gmail.com>
Subject: Re: [PATCH][next][V2] ASoC: codecs: jz4725b: Fix spelling mistake
 "Sourc" -> "Source", "Routee" -> "Route"
Message-ID: <Y0/pSVbueZYXBsmA@sirena.org.uk>
References: <20221019071639.1003730-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="RSRYBU1FRm2IiFjJ"
Content-Disposition: inline
In-Reply-To: <20221019071639.1003730-1-colin.i.king@gmail.com>
X-Cookie: I like your SNOOPY POSTER!!
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-mips@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Paul Cercueil <paul@crapouillou.net>
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


--RSRYBU1FRm2IiFjJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 19, 2022 at 08:16:39AM +0100, Colin Ian King wrote:
> There are two spelling mistakes in codec routing description. Fix it.

Bit disappionting that people didn't notice the errors during boot
there...

--RSRYBU1FRm2IiFjJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNP6UgACgkQJNaLcl1U
h9AMAAf/QC3eZNYr9/3n2kIr05IslQ40odVk7BW7aJxsPlGbyo3UWe9aVyLNxPFg
ButRyaxZyFUaLjORA4747at7NxfUw6dkCBeq9WxQvLkOryJVmZIWVNhIDPDnquqP
Ze6pexDoUZsvlEaVkJXd28PXKgQSjI6tLyQTG0y+wM4Xv5L05ISaSZtku0eZM28z
DmG8fGdquHZFUZOVKQWu+Ny1G3sSkdrBkBUJcSkGVdn7TWIklLVqNuy4w3pq+0RF
rviZ2Wo0NMzE5ksTXv2+t/UIYzNWjv/K0jcNVB16EnEqfI1pFDQJZyrKDrF1YyQu
6Up7a5YP6VPCJgs3A3yWVpWcFahADw==
=c0mZ
-----END PGP SIGNATURE-----

--RSRYBU1FRm2IiFjJ--
