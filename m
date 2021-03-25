Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D65349373
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 14:57:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D9D1167A;
	Thu, 25 Mar 2021 14:56:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D9D1167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616680643;
	bh=YYZNRoPN/jmxzdTbDEQN0oeF8/NrSLnA/0A2tLeOUW4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DLPfIWXsJSSK3mTVI0elByplG9ie/M1DNj0Duho1I1qzwoK9ouXaQv2Sb4loEGk63
	 O9BZgN001medjwIwZp2u+zzf3p3F6sWuTl09Vn8A8ePdITBSpQtmgYbRensMc1kZja
	 3PF7Bul2eiwvD71OLXUQxbcoM9IGbxNxoStsqcXM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BDA5F8026F;
	Thu, 25 Mar 2021 14:56:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD793F8026F; Thu, 25 Mar 2021 14:56:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A1F3F80104
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 14:56:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A1F3F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="naRuhFDK"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5C5A861A21;
 Thu, 25 Mar 2021 13:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616680581;
 bh=YYZNRoPN/jmxzdTbDEQN0oeF8/NrSLnA/0A2tLeOUW4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=naRuhFDKxzimba8c3HCpZSwtzpmAe+2NZ8NbE1OZZE25TquPpWWDq/iSeLW+/EcUc
 CkjOvkOdgkUSkjn6bOr6k5U5k2NG2Zm/XFFR0TWjU6bAB+cYgHYhVEkH9cwWO2yxjS
 Kl03g6SueMbTPA6Td6Es7nB0Tn90BKvsj46iQsJO2H5AkITjnSisYOWavYe0u8BX+Z
 YtvLFxLFxL9G3/KPpY64WJB1FRHFZ4wjXqdvHyV6OSv22EldNf1zQn2spqJe1bVtyU
 wZd8lVy5AQWy0ylwn7tYwd02uWl9Q9Ro2Zx0Kw+TnzoURTFUXrAJ4PeC/NXXNgUlrb
 qbyFJ7ZAQvylg==
Date: Thu, 25 Mar 2021 13:56:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Ryan Lee <ryans.lee@maximintegrated.com>
Subject: Re: [PATCH 1/3] ASoC:codec:max98373: Changed amp shutdown register
 as volatile
Message-ID: <20210325135613.GA7767@sirena.org.uk>
References: <20210325033555.29377-1-ryans.lee@maximintegrated.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline
In-Reply-To: <20210325033555.29377-1-ryans.lee@maximintegrated.com>
X-Cookie: Where does it go when you flush?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, guennadi.liakhovetski@linux.intel.com,
 judyhsiao@google.com, ryan.lee.maxim@gmail.com, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com, rander.wang@linux.intel.com,
 yong.zhi@intel.com
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


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 24, 2021 at 08:35:53PM -0700, Ryan Lee wrote:
> 0x20FF(amp global enable) register was defined as non-volatile,
> but it is not. Overheating, overcurrent can cause amp shutdown
> in hardware.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBcln0ACgkQJNaLcl1U
h9Bh/wf/RG83rstR6bo+AlX4NLRZ8HuB7MxCJnyIXLn/hpEb7bqWlZZ8ElY87dvr
XJaKM1r66iGNIrJvSH1ZV+1sgO8qsE/epXksXuLfaw5S4VDFQpRMksdNOfYgop75
oYGULg/nw5rMZkAezpe4iOVtEwGXMBT1m7J29BaBzKY05YHxTnb/7/KkHnnBq5LF
nXf7VdRnYL14QhT2KcnBZh2XLYVxoKykWe1JV4orM4XiXO5iaJOBELgJuatpI4a0
fi6HSiROoHcXS/1rVZpB9nDdC5CY4/FJUcTdNRJsI+oYwxpkzLVMkoPjTrZp3jdR
0Z1e+64uqE1ONQkJqywOVR8C5VB5cg==
=c2+i
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
