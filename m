Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7602F5BFAFA
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Sep 2022 11:29:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1833C86E;
	Wed, 21 Sep 2022 11:28:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1833C86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663752577;
	bh=WDxuopYgb69Vunh7mtLHaLmL+ZS2lN6XufwXUZ+0EdE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SWipJTNGGAixAx6PN5Kt2rhwSCuaiBzUucSK6kAmG1bD+mY0W9FPmCSZITqX89VxE
	 4iqRfBUB0KvchwUiN8oPkxyZzaPeUqAB6Oj1jZcpHjyTcwvekKxEtPmKDUsjvW68g2
	 ndsCmd2ib68nlTULTD8cNHQMeoQQ4d98mej8Inrs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CFE9F80107;
	Wed, 21 Sep 2022 11:28:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D57EFF80256; Wed, 21 Sep 2022 11:28:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5502F80107
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 11:28:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5502F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bQS4Y46a"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 84AF26295A;
 Wed, 21 Sep 2022 09:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 752F5C433D6;
 Wed, 21 Sep 2022 09:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663752510;
 bh=WDxuopYgb69Vunh7mtLHaLmL+ZS2lN6XufwXUZ+0EdE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bQS4Y46aVDSYt251ORFT3NfRYbbyD56HAS5w7pTjG/XLEflGVaujAE5gyT0ZSbZOl
 F/uAprNsX6ec7il612pHJieVjhd3N57sxPIo+9jKky6PYcCwUzRaaht3UrSUrBqPBL
 uqDuGZQ4RDjYoaL1hEzIeKIu0Bg2Kn8zkptnVVuB7ttjDDE4+TVde0G2v+I8OlWpPD
 9Vlfj+JzAVfGS98q275cX6eSEnHGjl2jHEY8fMdfqdzhSKtLoT3TYM03FbxTpqmL3L
 HGeez7Gsr4WXkiHZPVX2ZFtpmhYFLhAIANPtPYE5Nk4Ggmsby7f/0EaBZkf77oWM7g
 dMd5OfyuKwBFg==
Date: Wed, 21 Sep 2022 10:28:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Zeng Heng <zengheng4@huawei.com>
Subject: Re: [PATCH -next] sound: sunxi: fix declaration compile error
Message-ID: <YyrZIEH+n5UfbFGZ@sirena.org.uk>
References: <20220921033819.2188233-1-zengheng4@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ME3YOqXesqoqS5wH"
Content-Disposition: inline
In-Reply-To: <20220921033819.2188233-1-zengheng4@huawei.com>
X-Cookie: One FISHWICH coming up!!
Cc: alsa-devel@alsa-project.org, fengzheng923@gmail.com, lgirdwood@gmail.com,
 samuel@sholland.org, tiwai@suse.com, jernej.skrabec@gmail.com, wens@csie.org,
 liwei391@huawei.com, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
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


--ME3YOqXesqoqS5wH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 21, 2022 at 11:38:19AM +0800, Zeng Heng wrote:
> Just fix compile error without any logic changes.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--ME3YOqXesqoqS5wH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMq2SAACgkQJNaLcl1U
h9Cvxgf+JwuwCJ3WVh4QQFfxsXemu9L+90kzz98/qFyGvhJAZhpNYajQ49zBNl31
jPkks0Gc2KxpnKmTip+skGzfl+mUYh+KWnZMDnLtRnaXEvxV1Lall1YVFcY+8KI1
vGYktnyhFH44wj03BJ2j0idUJFVb6U7W19jkMUG7PhgT/lHrOVbhe2RnbmINOkco
VRxGq50lphPtVsdZgkF4dX7VsFWoY6JYVlIVHBlR3K536EGAw2XmwxqZCJTzt9zT
Iu7XO9v6uFjTYgLGXzvfu3YmQaQivK/rTyZxTWO2AwiVzSdhVG1dL54KX66C6zXp
tFsU/enYJXkL2ou81XTRyeKXg5LhYw==
=MVeU
-----END PGP SIGNATURE-----

--ME3YOqXesqoqS5wH--
