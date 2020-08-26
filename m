Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D283F253589
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 18:55:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67C8C178B;
	Wed, 26 Aug 2020 18:54:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67C8C178B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598460933;
	bh=yvbxB/dXm+wxQXgZYoFFZEVL9w4GvstjJ1BXu6Uy/Hc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rGXYoHcp9qdpJRrL2KEcHd5j8fA8oVx4OD7Sx4BAFJocm/XrZYBMLTZvQH8NgoCzU
	 FWBSeQ5XrbuHe9ZBeK42ysqaVJg776WHoZl70sbIEwQz0K9cTDDbvVKXl67s0GJfLP
	 9/NNObDrW6IOBYGuLC9eG8s98U/JZdBgh89fGp3Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D247F80257;
	Wed, 26 Aug 2020 18:53:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51439F801EC; Wed, 26 Aug 2020 18:53:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC71AF801EC
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 18:53:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC71AF801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="G+EeWxWl"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E1DD32078B;
 Wed, 26 Aug 2020 16:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598460824;
 bh=yvbxB/dXm+wxQXgZYoFFZEVL9w4GvstjJ1BXu6Uy/Hc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G+EeWxWlvWkzBLDIG4YwXEVSUsPzaMdlqtMCM2GTdCgivysepguirOTd+5lMVVyNl
 i9dtROwHC76N4bjFqFddps3JLinWLMBAsEFpP1G3l7IiTW4xAaIG1kIJy28biGFpXk
 WCvP/u2YDSt5umUXhfoBNoy72IC0sT2M2Ob2p7Ns=
Date: Wed, 26 Aug 2020 17:53:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Tang Bin <tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: fsl_spdif: Fix unnecessary check in
 fsl_spdif_probe()
Message-ID: <20200826165308.GJ4965@sirena.org.uk>
References: <20200826150918.16116-1-tangbin@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="W/D3X8sky0X3AmG5"
Content-Disposition: inline
In-Reply-To: <20200826150918.16116-1-tangbin@cmss.chinamobile.com>
X-Cookie: Should I do my BOBBIE VINTON medley?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, linux-kernel@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org,
 Zhang Shengju <zhangshengju@cmss.chinamobile.com>
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


--W/D3X8sky0X3AmG5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 26, 2020 at 11:09:18PM +0800, Tang Bin wrote:
> The function fsl_spdif_probe() is only called with an openfirmware
> platform device. Therefore there is no need to check that the passed
> in device is NULL.

Why is this an issue - the check will make things more robust if someone
manages to load the driver on a non-DT system and otherwise costs us a
couple of instructions?

--W/D3X8sky0X3AmG5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9Gk3MACgkQJNaLcl1U
h9AXowf+OVsKdeEZ3BjfcRZvF73cSt5ZNgBH2LZFoif+p5duvwFhYWYpiM838REI
CFWQz5uaMwq5pzA8Hx+iJA+HyEhiucpXw3yxW5Xs0j1nd/BgiSGKdyHlTXZ3RqD4
Gr2QdQXO17esiaT11+ZLFIwecynN29JLQ8GThARSMc7tGfmaXy5JQJkOy5c4nOFX
ycF3dds18vEua7ajqC3wFLTDygdqE6gv41YqIJgU3J9X/tAugKh1jtTa4k1eh/6M
ydH9ezNoA3havqWqAAhAGbW3kbLBCQFKsndWnZbYPU0VHZw5shBWTrx2+x6z8F68
YM/0TyIgmkvB07oBBF6wkjb5sD0hZA==
=6aKW
-----END PGP SIGNATURE-----

--W/D3X8sky0X3AmG5--
