Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B8B126E2
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2019 06:30:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B74A41875;
	Fri,  3 May 2019 06:29:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B74A41875
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556857827;
	bh=rBlQAK2B0uOXJCs2ywvaJ/uB/d1BEG82u4O9kh9MPs0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=umeYqQ7hPiuI3LCaeL40T6CSbGUbH/IS5RdNxCa8qde2+Q+FF7GtEHnBBfFWjZrTJ
	 MgPPAhjPEGnRwejx0EK1tYs8eTYQ7S3FDS6Nj8MV4p5C+CBNhAR9lzJDoDdIdn2+da
	 ijJjHTY3Y63YyOZjV8saEVcZSty8ot1JwUBo6s7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4A04F896B9;
	Fri,  3 May 2019 06:29:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6C61F896B9; Fri,  3 May 2019 06:29:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 635F5F8075A
 for <alsa-devel@alsa-project.org>; Fri,  3 May 2019 06:29:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 635F5F8075A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="UnYwBHg6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1CwCS6t9nKt0+5Y++vpqJKL3QdA5l37XORC60HSitYc=; b=UnYwBHg6IP9hrXnokKPRkEfe6
 r6KyISxLkg0uWYUyDmKcFFSGHnHKyqwtoqpyQMnrPba8XBPWtS9XE0L01YTF4yLgmToO68bEvg7/U
 AKcQ/608fl/ERzEcKc2CwaxNMSJMxVpWYUIsTN7UWyG0aJWl+UN+R+3kraf7gW9ztLVUk=;
Received: from [42.29.24.106] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hMPox-0000M5-MG; Fri, 03 May 2019 04:29:16 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 50BE4441D3C; Fri,  3 May 2019 05:29:03 +0100 (BST)
Date: Fri, 3 May 2019 13:29:03 +0900
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Message-ID: <20190503042903.GY14916@sirena.org.uk>
References: <20190430080107.113871-1-tzungbi@google.com>
MIME-Version: 1.0
In-Reply-To: <20190430080107.113871-1-tzungbi@google.com>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, dgreid@google.com, tiwai@suse.com,
 cychiang@google.com
Subject: Re: [alsa-devel] [RFC PATCH] ASoC: max98357a: manage GPIO for
	component rebinding
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
Content-Type: multipart/mixed; boundary="===============4944152721041089040=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4944152721041089040==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m8yuz6kcWj4yJ5vq"
Content-Disposition: inline


--m8yuz6kcWj4yJ5vq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 30, 2019 at 04:01:07PM +0800, Tzung-Bi Shih wrote:

> The patch changes devm to non-devm API, because we don't have equivalent
> API for ASoC components (e.g. compm_).

Don't do this, if you're missing a needed API then add it.

--m8yuz6kcWj4yJ5vq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzLw44ACgkQJNaLcl1U
h9Aluwf+KeFXrcGCCW0XtpzMGsFElg8Yk32enWwFClNcq9QwXfoeB6T/cNNLDCH9
WUT9IUMGyyjkfCBOG/hd9Af7OJqZKjcbBm17lRcoKpyVNyBXUZDjx7W6wPtFHaJu
+xN7UcxiqiY1iHfjcF7t8rquFeOxRQQOOr8ddxRyz3RMxkjTuM+ZkHQJpGr6v5LT
54hT/qzXUne5RhSYWxMkou3k69lwxFedvOvh0aCvsTFLgchzLwv2VV+CwSnaLXly
je5NJuXMC7eb1nz3ztuReqLQNu/xtKZ96vCgvbjxp1+Yu/0G5YtyDVPOmgCrywiA
t73ZsnybCbhFeRSGPg2GL7tnp4FJKg==
=dBZL
-----END PGP SIGNATURE-----

--m8yuz6kcWj4yJ5vq--

--===============4944152721041089040==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4944152721041089040==--
