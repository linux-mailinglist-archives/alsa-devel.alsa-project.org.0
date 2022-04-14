Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF63500B1F
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Apr 2022 12:30:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A520A16CD;
	Thu, 14 Apr 2022 12:29:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A520A16CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649932234;
	bh=NVCX9XRjtVkfZkMq6lnnXLzxuKXz8YkTsns499QHdj8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RiBMDe/QPfo41ucnas6EceOpMHeQ2pvbBOHVjly6krIgANu82SIt8CyiP1HYctKCB
	 0/myPVEkSliIk0fxOvYSBbGEQ84ztMTTutkNrwlq3mtjpKiXxcUef5/UOpgYCdqR9I
	 EhpyWZNPPtez9bdFo2/3IAQGm78ix3L65U0VzIcQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9C21F801F7;
	Thu, 14 Apr 2022 12:29:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C732F80162; Thu, 14 Apr 2022 12:29:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48D5FF80124
 for <alsa-devel@alsa-project.org>; Thu, 14 Apr 2022 12:29:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48D5FF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Tf5Y0i1T"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 8FE25CE294B;
 Thu, 14 Apr 2022 10:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02163C385A5;
 Thu, 14 Apr 2022 10:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649932162;
 bh=NVCX9XRjtVkfZkMq6lnnXLzxuKXz8YkTsns499QHdj8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tf5Y0i1TQR9xlzKJ8ku9Tgdd0Ba8ntqqcTgxb7g4rNsoVaD8MyeylGdx4T6lI411i
 P4X+Pww8YBvmBui6u5YLuVAkpiIcuU/qTxRKtEID1gwrm7VffjNX9+ZsOly2/A4CPK
 /ZF3/Lynz3przf19KYW87UUd/8yxVsEseoBrBLQM7PsvIfWPEgu+vweZSmG5snp/9H
 +popEuLmWAJIx+6FJWap7RN6DTbBuS6waqHtiIc7HpW2+WlW2nxiuhcQTQR0O3/zkH
 HFLLvxw0Lzk3mW7I3sab3PbL0/vY3FP4kzwIkrN9MIsr7crRuKCl1DdiA9N0jctRml
 +Me3awv3prk1w==
Date: Thu, 14 Apr 2022 11:29:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v5 00/21] ASoC: fsl_micfil: Driver updates
Message-ID: <Ylf3fAU5TV/RnHBW@sirena.org.uk>
References: <20220408112928.1326755-1-s.hauer@pengutronix.de>
 <20220414075114.GC2387@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="0MtUBW2crG30UMoy"
Content-Disposition: inline
In-Reply-To: <20220414075114.GC2387@pengutronix.de>
X-Cookie: Available while quantities last.
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
 dmaengine@vger.kernel.org, Shengjiu Wang <shengjiu.wang@gmail.com>
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


--0MtUBW2crG30UMoy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 14, 2022 at 09:51:14AM +0200, Sascha Hauer wrote:

> Ok to apply this series? I just realized that I missed to Cc: you on
> this series. Let me know if I should resend.

Please resend.  What's the plan with the dmaengine bits - it looks like
the ASoC bits are relatively substatantial here?

--0MtUBW2crG30UMoy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJX93sACgkQJNaLcl1U
h9BZqwf/Sz0ZbUHbd7F/7Wkgdp4rn8hEyQE0ytnOC3YYvmgcD9VzWXB5MIaZ+8ln
f4Iiayqh+oeL3fFmMMziTzg/ExD9fq1WzVbKrCavZ7VrbsYwz/5q3FIdt78UL393
+HcMaFb9SCe39Oll78CJuPymVNDqQsiKU6jgr8HxerQJXWOIFkS5AN9wD/Ty4ePr
m52je0qAlUwMt8ghxEPjakD2svtM7aDvl5UxiYZcwCO+hCXI67ZY/M10QsNF4W/r
XamSmp+JeKKYKvbr0jfjtQ9fM0UrlnrJzhW+0fMuHynJy1+cGVTno1gwSqccN16H
X3yos1ltE56mcJ9A5klumtgDLv+nCw==
=EFgn
-----END PGP SIGNATURE-----

--0MtUBW2crG30UMoy--
