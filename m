Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0626115B0
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 17:17:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D55561F30;
	Fri, 28 Oct 2022 17:16:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D55561F30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666970227;
	bh=AcI+yswH+2IbcHUpYNQ9KmXw7+ZnsTQFzdaCM3sr5zU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YinjLzFIdfy56llKb3lXrPAdaCjo/tfjO4mn1lvjE/X1SRpUclfKSe2V4kQt8M0R7
	 k9f9Fi8F9lCWVXL9npzvLYojnCBnSu5W28cQZCDhM7JQW8F3VY2otwm8dxMhyFnKto
	 slbbRXr3zm6XLIBYzaBV4sd4on7/mDLxzLNYHDSU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43510F8025A;
	Fri, 28 Oct 2022 17:16:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14BFFF8024C; Fri, 28 Oct 2022 17:16:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D56A8F80095
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 17:16:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D56A8F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="q11wdu/k"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 484CD62909;
 Fri, 28 Oct 2022 15:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6307BC433D6;
 Fri, 28 Oct 2022 15:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666970166;
 bh=AcI+yswH+2IbcHUpYNQ9KmXw7+ZnsTQFzdaCM3sr5zU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q11wdu/kZuFgRdKuJnGuJzp2/PsP9miDo3cwvfWcWFLL6T7QPrwNN90pz1Rar9G2r
 F0z8VW4AJckbaBeV7bfAfS7MPFxX/7NBlLcLKJnQ775AHHw0GarOEoPKZZL2bqwRjO
 Gk2hMWVBbMV5HGdkc3vdbzxV26uwBDosGSzFv7whAL8X1rljBpdqjGuGirNr33Oj9m
 2aeHDSvqDCzq1u0xwLea3wuD7dvIAAmRoyOQ88mkMqLwb7n2x3F75WzGeTtPkR2HXX
 /VTdk66bElhVbLzLsNquZQCePtqP4yf19HrMU3FY6nsrzqrTNW+kVNw89zQBoF/Khl
 gAWcM695Ah8Zg==
Date: Fri, 28 Oct 2022 16:16:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Maarten Zanders <maarten.zanders@mind.be>
Subject: Re: [PATCH] ASoC: fsl_asrc fsl_esai fsl_sai: allow CONFIG_PM=N
Message-ID: <Y1vyMQ8Jj7/smeC6@sirena.org.uk>
References: <20221028141129.100702-1-maarten.zanders@mind.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5YV3kYcAJnGOoxea"
Content-Disposition: inline
In-Reply-To: <20221028141129.100702-1-maarten.zanders@mind.be>
X-Cookie: Life -- Love It or Leave It.
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Fabio Estevam <festevam@gmail.com>,
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


--5YV3kYcAJnGOoxea
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 28, 2022 at 04:11:28PM +0200, Maarten Zanders wrote:

> This commit fixes:
> cab04ab (ASoC: fsl_asrc: Don't use devm_regmap_init_mmio_clk)
> 203773e (ASoC: fsl_esai: Don't use devm_regmap_init_mmio_clk)
> 2277e7e (ASoC: fsl_sai: Don't use devm_regmap_init_mmio_clk)

Please use 12 character hashes for disambiguation.

--5YV3kYcAJnGOoxea
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNb8jAACgkQJNaLcl1U
h9BPkwf+JDWLwUW4JY8Nn+45+cQNp7ekugOkKUUyMa5cWq66XKGMsFYPkbx6YNay
H2eN9b4GeQtYwkLRkf50yidDuVkevyxVQJ7FIX7Tq9+/Th6RPiydXixG1iegEI/Q
4lCMamv4jAigNGi6ZcVFpehuxicesCFLVNISNJscEaM6kY14lP8Bgygw/2YKez/0
B1fq09ZE2oDFerrjUid5+CCEPwOO7DEH4rX4kEuCtSUO6cJfNSgSRF0/qczNbkYM
BXmPfkFUjvBmQEhX0n2dy/LWWEixRiGOJOpKoOK7kQmo3sIrZW/WepTrDGoTQ0GQ
PYMB8pzbp4O270F4CpI7NvUz/FqsYQ==
=UpvD
-----END PGP SIGNATURE-----

--5YV3kYcAJnGOoxea--
