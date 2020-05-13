Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8631D104D
	for <lists+alsa-devel@lfdr.de>; Wed, 13 May 2020 12:53:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A813F165E;
	Wed, 13 May 2020 12:52:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A813F165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589367217;
	bh=FL+28LkNQoD75GVysexp8B1GX+IVYhv26EcjeQpqLJQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Oz+xeGsVPWkSHJ8W5BOR8yOXXOzZxnvy1j9UpCM6p8UziQoG1JT1A3p2QgBRq1cGH
	 xovQzgXjfiowCEfgylMuCHecoB7dxpSNX6dre1AGG9eBDCVeP2PakcOj0+9O64lDWg
	 r9CAPWhlMZJGmnbhMc1Abx7tKlHQYNxMGyOoRbLg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9BC9F800E3;
	Wed, 13 May 2020 12:51:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39B47F80247; Wed, 13 May 2020 12:51:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F051F800E3
 for <alsa-devel@alsa-project.org>; Wed, 13 May 2020 12:51:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F051F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="k+bv5PN8"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 351AF20675;
 Wed, 13 May 2020 10:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589367106;
 bh=FL+28LkNQoD75GVysexp8B1GX+IVYhv26EcjeQpqLJQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k+bv5PN8O7fdV9WyaB3O2NkdA5XTQcKoJ1dPJV95CqgXoiC4lch8+CW2PhlDX0GJg
 P+xgomodWAWLKo566SxMQf3LryNQj27sl5X8fCWDYHe1gMrAKl0qO2CJ57f2AnC2Hs
 i/Wv4HZmNXs0qreisS/ojZ20AVgYV1r+QDfYM9rk=
Date: Wed, 13 May 2020 11:51:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Steve Lee <steves.lee.maxim@gmail.com>
Subject: Re: [V3 PATCH 2/2] ASoC: max98390: Added Amplifier Driver
Message-ID: <20200513105144.GC4803@sirena.org.uk>
References: <20200513074523.21086-1-steves.lee@maximintegrated.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="c3bfwLpm8qysLVxt"
Content-Disposition: inline
In-Reply-To: <20200513074523.21086-1-steves.lee@maximintegrated.com>
X-Cookie: Long life is in store for you.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org, ryan.lee.maxim@gmail.com,
 ckeepax@opensource.cirrus.com, ryans.lee@maximintegrated.com,
 steves.lee@maximintegrated.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 krzk@kernel.org, lgirdwood@gmail.com, nuno.sa@analog.com, geert@linux-m68k.org,
 dmurphy@ti.com, shumingf@realtek.com, srinivas.kandagatla@linaro.org,
 rf@opensource.wolfsonmicro.com
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


--c3bfwLpm8qysLVxt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2020 at 04:45:23PM +0900, Steve Lee wrote:

> Changes since V2:
> 	* Removed warn massage in max98390_dsm_calib_get func=20
> 	  and add comment.

The problem isn't the warning, the problem is that you have an empty
operation.  You should either implement the function (eg, by caching the
value written) or remove it and fix whatever problems you were running
into further up the stack when it's missing.

--c3bfwLpm8qysLVxt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl670T8ACgkQJNaLcl1U
h9AjZQf8DB8kAssj3tu4IkLMijV1aFweTzAeMyn08L7i45ykX2//t7+LU7aFgxPF
AI0vHc3UxL9odhba6fd4B0NjK5tMcNcw8x5HFrpNaOOv12q4qxTdqksEs//iiy6W
gP0Vpvgd1FlxXkVRyKN5CbbyiVMpM6wml100f7e8pFtxvOCy0m7J/C38iqre+NX1
rwiqCuQsAlN88+lYzGumpUkWioo4SXLOWkxd5KrtOj6E2X0iJ91x98661CSIZ+1F
bINPSn2bRMJFg6md27V9DiVf3qzkWimna3uLD+GKaT6lyRi4kCMJ0G0jp7LY8h4t
GDMtTt4CQ0iORk0Ep+rD17LsJNuAzw==
=wU/c
-----END PGP SIGNATURE-----

--c3bfwLpm8qysLVxt--
