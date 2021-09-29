Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9807A41C76B
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 16:54:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38F1216CE;
	Wed, 29 Sep 2021 16:53:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38F1216CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632927276;
	bh=ZXFeAykbe3FWDJHs3l07s5lyMtmL1ik905y6YTUAdNY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ryWYzfb29LURskYjtz+NKqbVX1rq4VrRg6Ve+Vinxos63P8HqQaFb7gSvPaa3F3yg
	 KjuVJPhoiNIoQq0tiSzo1Q/3hyqPRBZhyOs44cR4ilwVIZz4ba7kOqW0DV9EaaOps4
	 8Uq535kd06Wv7jdGA4IB4vD8fgunvOVlWqKfG+Ns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8357F8026D;
	Wed, 29 Sep 2021 16:53:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B0E7F80227; Wed, 29 Sep 2021 16:53:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2175F80113
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 16:53:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2175F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="O5WH2Fzw"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26F716108F;
 Wed, 29 Sep 2021 14:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632927192;
 bh=ZXFeAykbe3FWDJHs3l07s5lyMtmL1ik905y6YTUAdNY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O5WH2FzwlbnIS26FrCLvV1Ue7B7uJLnZiLu5E+PDWI/pjjZlFm+dIDbeNMansdXOM
 3x+2Dp/nv4IN+/ct0CRn4oBM9JZ6EjOyQnlcNcubUnRVhkJmhJ/ljbhaFweqLJ8wlA
 cmSK+9sEWTsI2AsRt+hKhl99cCtTr/1PBQp2rx8f2ZVp2vhSmluDRXswcYTBtALvY5
 /jACyU5Ia/jF9x2CFJq/MEFAYlSioLpNcuLRaVLwJJjH+Z4Q6mYiGaYvRDS8qctIty
 ssibvFEZCyT2HL+qEqmO+IC/CyyR2UBJ52BLuYbzpw5fGfOfML/OJcMxXgpP2BPIYY
 RsNrxHVSNPorA==
Date: Wed, 29 Sep 2021 15:52:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Simon Trimmer <simont@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm_adsp: Fix compilation when debugfs is disabled
Message-ID: <20210929145222.GR4199@sirena.org.uk>
References: <20210929145040.793252-1-simont@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5xr6Gr0irOxp3+3c"
Content-Disposition: inline
In-Reply-To: <20210929145040.793252-1-simont@opensource.cirrus.com>
X-Cookie: 98% lean.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 kernel test robot <lkp@intel.com>, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org
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


--5xr6Gr0irOxp3+3c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 29, 2021 at 03:50:40PM +0100, Simon Trimmer wrote:

> +#if IS_ENABLED(CONFIG_DEBUG_FS)
>  	cs_dsp_init_debugfs(&dsp->cs_dsp, component->debugfs_root);
> +#endif

The more common pattern is to declare a static inline stub function
instead of the prototype if debugfs is disabled.

--5xr6Gr0irOxp3+3c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFUfaYACgkQJNaLcl1U
h9BWVAf/cHwn2KpyrGKblOiTYsbswKKh0yuTZvFgjjc17LMet2Y4XSv+dV1NDVnO
9JJt1mhlTU70VtE9lgVP5e1nmQNMSoGKgPBgg9FvgITYXDLEEC14tjhd5MQOynld
INPOk+XVQRWSejSrdkm+OTRbe6HyoDtbi2xnEcOhuwdEew5aidefO20IxpReCN00
iFTebQGL43HZuzy+8km4YvwUpGbwNrB4OhKIvr1wmycq9BSr5Rsnaz8F/fTy6fJn
tr+cuySzDXT4Rzw/My4Q3s0H/cVqDVYyhF6pYgI9tr+Gg91P/I0VJEFkGTt06MWo
su8Dk2aTjTZ0Z8Ud9bEfRzaLzI++4g==
=xvyI
-----END PGP SIGNATURE-----

--5xr6Gr0irOxp3+3c--
