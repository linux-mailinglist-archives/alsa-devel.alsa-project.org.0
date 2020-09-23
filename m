Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A68275C71
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Sep 2020 17:54:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1023B1754;
	Wed, 23 Sep 2020 17:53:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1023B1754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600876479;
	bh=+7ByMTj8FlYNE7VGGp3fA9NtzySfAdboCzVSLNd4GmI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A4dlJDWTyE9kPuCqQ4TcL2ruSStkfgPwupjRzyoRhORfd83xf9h+tXVcnxfST/1TA
	 /cb1dutc6AVg6AKNCOrrGm24qwdI1fyO12OIhi2NLzo+dU47VRlEqzVdZMad52R0CJ
	 SLOFyTkQGxB7arExn/x2LllfMmr84frn4fO+blN4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F14AF801EB;
	Wed, 23 Sep 2020 17:52:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B572F80171; Wed, 23 Sep 2020 17:52:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B4F4F8010A
 for <alsa-devel@alsa-project.org>; Wed, 23 Sep 2020 17:52:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B4F4F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hWNzjseY"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CBFB72223E;
 Wed, 23 Sep 2020 15:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600876360;
 bh=+7ByMTj8FlYNE7VGGp3fA9NtzySfAdboCzVSLNd4GmI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hWNzjseYuvFRQCZYPyJzSd5BrxZeefHQtk2bRrIaBkF09s7rOdeTIUvx2Zci1zM3w
 H0aNR9PD2KAv0Ujsfx9yd9PBWlyijB9sWO9Hx+PtlzV3xiz23bYaADIG5Sv9zDGsw1
 h5fSatR9p04g0qrFIeCSXgfkuyo7871FdFkGsGzg=
Date: Wed, 23 Sep 2020 16:51:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 4/6] dt-bindings: tas2770: Remove ti,asi-format property
Message-ID: <20200923155145.GD5707@sirena.org.uk>
References: <20200923132600.10652-1-dmurphy@ti.com>
 <20200923132600.10652-4-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="M38YqGLZlgb6RLPS"
Content-Disposition: inline
In-Reply-To: <20200923132600.10652-4-dmurphy@ti.com>
X-Cookie: This report is filled with omissions.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org
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


--M38YqGLZlgb6RLPS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 23, 2020 at 08:25:58AM -0500, Dan Murphy wrote:
> Remove the property ti,asi-format as the driver only reads this property
> and performs no action against it.

We should probably leave the property as documented and move it to
deprecated rather than delete the documentation entirely.

--M38YqGLZlgb6RLPS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9rbxAACgkQJNaLcl1U
h9DWogf+N7wq2sJT/UoUOg+Xwc+9JTtl34Hw1R9U48+KUz4ZZEGy22qXTrfQaJAC
5SPFzfGTdNHshXfQOh/HzomFSGyvN4tIMIrakmNyih494n5luYcduK7t9P+za/T/
fVbXObc9K9JPZbr+FqcQ7Q6grJHttMweCeU5ur4A31fEbe+1u4gTYnMTyVyAWMpd
giwjBF4WbJqhFdqQH/eTcG7oF/qC8UC1ku79ijTuzF/xnKOcbWiFWEMlldpfck0j
3y2+NPeUeBWhKquhkilspHS33Lpj08sRz/GlT0vSmTSC6ZdvFzfWTzyEJ/B0et5s
wgicD0fcnoWInmkimjomae/sHXZKpA==
=nmCG
-----END PGP SIGNATURE-----

--M38YqGLZlgb6RLPS--
