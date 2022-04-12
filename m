Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A36474FE091
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 14:40:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 095481745;
	Tue, 12 Apr 2022 14:39:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 095481745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649767221;
	bh=r2ozEyixlXEDZat/EBQhfhK+ZomNGZGTkYgMhu0q//o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CZN2X6sOF9W6Jia+9e1dvUWoGQhiEW97Nq8La/evILuN8kVMiOE+5QHY0aEYdTXVh
	 R2oWq/TVFjPA2ztjGlGRlJq8acn/SYj4kNWP0GQdwJUBGmh/rS+Lk/s0TMaFxcon4v
	 CxAGxVw//Sb9Qfhud6ntskd6uGSL3fXDEtaScSzw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69317F80245;
	Tue, 12 Apr 2022 14:39:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 442BBF80154; Tue, 12 Apr 2022 14:39:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F757F80109
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 14:39:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F757F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tICf7t/u"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 632FAB81B40;
 Tue, 12 Apr 2022 12:39:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A2E3C385A5;
 Tue, 12 Apr 2022 12:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649767152;
 bh=r2ozEyixlXEDZat/EBQhfhK+ZomNGZGTkYgMhu0q//o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tICf7t/usfMJ3yYnlwiUXvo2DF7Ir2NQvHctzBOGx9VT1QWTJTGwyd0vh20t+G1R3
 PQUzUs8wtg/wGOk40U9mv5kBJTmOzy+MkaoZaEikB7WIO1//gpBd2COJ6mUC1oMzHc
 8WJ1jI+wZyA89GRepoT6oLrif0LehgCcGgIi0LCXehaLse62X4lQayHTo+TYHtwI31
 kQaAumEWDrmUoiIkfYoP9yno2R+lFVCoYwD03P+GpyR0xcaw4g3Fseh+SSA7tgldFt
 TrcNtJXSNPvCTilN2+i27EToYjuOlH8GLVbyHSZVxard92WHC/mszVRl7dHSES+HkD
 kW8765DMjFVRQ==
Date: Tue, 12 Apr 2022 13:39:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: wm8524: remove rate constraint for FE-BE case
Message-ID: <YlVy6tAPMw+MHq/f@sirena.org.uk>
References: <1649754826-2651-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="LwWF2GkpX7AfLGu/"
Content-Disposition: inline
In-Reply-To: <1649754826-2651-1-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Approved for veterans.
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, tiwai@suse.com,
 lgirdwood@gmail.com, shengjiu.wang@gmail.com, linux-kernel@vger.kernel.org
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


--LwWF2GkpX7AfLGu/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 12, 2022 at 05:13:46PM +0800, Shengjiu Wang wrote:
> The constraint is propagate to Front End Bitstream
> for Front End and Back End share same snd_soc_pcm_runtime.

> The constraint is not needed for Back End Bitstream
> when there is be_hw_params_fixup() defined.

> -	snd_pcm_hw_constraint_list(substream->runtime, 0,
> -				   SNDRV_PCM_HW_PARAM_RATE,
> -				   &wm8524->rate_constraint);
> +	if (!rtd->dai_link->be_hw_params_fixup)
> +		snd_pcm_hw_constraint_list(substream->runtime, 0,
> +					   SNDRV_PCM_HW_PARAM_RATE,
> +					   &wm8524->rate_constraint);

This applies in general to constraints set by the CODEC, it's not
something that should be fixed at the driver level.  Peering into the
runtime to see if DPCM is doing anything isn't a great solution here,
nor is having to open code it into the driver.  I already had it in the
back of my head to generalise the set constraints based on sysclk
pattern into the core, that might be productive here.

--LwWF2GkpX7AfLGu/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJVcukACgkQJNaLcl1U
h9DK0gf8CiRXWJm7/sW3H5tgx0lkpjF5i+wEkbvG0c1jAoEOwr5nKr3568cS0R4L
4E8czDxBzq2KOgznS7d8uoIylxzFppv/nJaWh6E+qCuOwhIOPmvQnPa7Vce5M4JW
hZa82ypUj3Nn3ZfCYh4L0Re3I4pS2OT6meuXBroHso0+hUmjVtWLpU64+yHlH2YI
C49SoR3GdWwcWHcccdmkAlojQuhqn2Y/OCNww0ptvxiw/rRoRnYyxKmKUd6O9bRw
pIaIxQAn9263ywhW4uhTfLnB1uXQd0XiXGKllIIb45ifASOIm6nUDBdnvembqVxc
V7QB5yNHTY07UQ8vpynHiAGfqS+pYQ==
=Sl43
-----END PGP SIGNATURE-----

--LwWF2GkpX7AfLGu/--
