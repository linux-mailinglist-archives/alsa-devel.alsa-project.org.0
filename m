Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEF54D322F
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 16:51:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C49F16E7;
	Wed,  9 Mar 2022 16:50:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C49F16E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646841070;
	bh=xnII2Pur9VH4WcRCnbTdGUOzS2gC0Gmmix7TPSqSkYU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ttIshBSEExtrAzlhVsDwKBseskcBulZ8RteQ3/+jQ2HgCRVIaxlK2wslkQa2XDURb
	 bP2ZXmXKLwa6GChLmLyRVsMUttF4MHojRMxjCVUb0MQcaAqtLITw9d35zIhbh/YykQ
	 Azl/0JJhtpLS6GX1ns86fEwsMFc7BBMY7DjVfvoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10A60F80236;
	Wed,  9 Mar 2022 16:50:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A177F8016C; Wed,  9 Mar 2022 16:50:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9E14F800D2
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 16:50:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9E14F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VjwI1va6"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 85C63B8220A;
 Wed,  9 Mar 2022 15:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B4ECC340E8;
 Wed,  9 Mar 2022 15:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646840998;
 bh=xnII2Pur9VH4WcRCnbTdGUOzS2gC0Gmmix7TPSqSkYU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VjwI1va6NJxBOfmjn2Wc8LvAzFDs71WWOyh6cuGWxnbyCQCLjcIo/WEBxn+pSbMAJ
 jMi+P/DWdYozQIuZzZUmXVXkAR19LeEDCGjpU/GH+mD/4zDe45KCoemhAAEMHT3xU2
 yhRExRcigcMIDCuJqwNjcy8bZm7zKUM/dVeCgPQwMBAzyQcM8Z11aDS+D/5PFyMtcp
 VeddFR/gkVh1oBUjf9JQR2BzuVpyiZDwuY1gEJ+kM97lb9yay1PAZOgxwlUxUXUjkz
 zyab2UPicYTlb+lX0Q8oh6fEuwNmr3mdA6eeYuDI2/xaMjxlo3FJXSMd7hvCZBqfFe
 FfA7Gd1fB28Cg==
Date: Wed, 9 Mar 2022 15:49:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [PATCH v2 00/18] Clean ups and preparation for IPC abstraction
 in the SOF driver
Message-ID: <YijMoCDCifqkMzw8@sirena.org.uk>
References: <20220308164344.577647-1-ranjani.sridharan@linux.intel.com>
 <2d2f89b9ef32ec1e49d8d5c4025598047e30172c.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="XWtPEyLcpCFmbwE5"
Content-Disposition: inline
In-Reply-To: <2d2f89b9ef32ec1e49d8d5c4025598047e30172c.camel@linux.intel.com>
X-Cookie: You will inherit millions of dollars.
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 amadeuszx.slawinski@linux.intel.com
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


--XWtPEyLcpCFmbwE5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 09, 2022 at 07:44:52AM -0800, Ranjani Sridharan wrote:

> I see that you have applied the v1 of this series. Please disregard
> this series and I will send the changes in v2 as a separate patch.
> Also, I noticed that your for-next and for-5.18 branches only contain
> 12 of the 18 patches in this series. Should I resend the ones that got
> missed?

If it's just resends don't bother it's queued already.  I applied the
patches up to the one that got review comments from v1 and have queued
the rest from v2.

--XWtPEyLcpCFmbwE5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIozJ8ACgkQJNaLcl1U
h9Av/Af8DHkH+UbQiuvRL3AApZeLXSw3dQ2VI4PzVFShv5YFpzuVeo+sNPGOIy6J
1qLvo1Dlru7dCNAiy59itD3OQv2XYunGkJt2F/WpemcFHLEuPfnG4VDRkmDeHnzB
3xblY/wO4sqQ0u4lwyGJH4EJrr7+kMY7I6RjphqmRTg/3Z7DFj2qe/p4yN7kHPZN
0vIdLoDS0aL14V5P0htD7dbfOJMeqoeQQrXYSCbIqs1MY5N3kChl799ty2xFWVQu
gmBnjf+D9uFFhN1A8FAUQSvF8zZuMAepqt4dWrwaeJytrs8OMk0SkF1fQJ+hN3On
Ldtcful0jNBjJfYPCmDTB56lqX2PwQ==
=LYrl
-----END PGP SIGNATURE-----

--XWtPEyLcpCFmbwE5--
