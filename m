Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F471C10C8
	for <lists+alsa-devel@lfdr.de>; Fri,  1 May 2020 12:23:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 819A116A4;
	Fri,  1 May 2020 12:23:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 819A116A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588328631;
	bh=8PiUkTNj8dS4j695LU0tBOc5dYcnMnyHpPrN0SZQOK8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uHRXW4xDKXturG1z2Wl1FPv/wj/K9ptPDI4v5yuA5TBDqOTXLIbII3Y6hWeJiMfZH
	 QuGgoGeS+MzokigXZY7fDZImb0+Q6J+URtBTo7UHhKXmObO8vHrkQLsk5rKy4E7S3a
	 CulqsIjcO20eZaYFt2FwHl22gwW50InTALNgmTkw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A30D2F80232;
	Fri,  1 May 2020 12:22:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46580F8022B; Fri,  1 May 2020 12:22:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96757F800B9
 for <alsa-devel@alsa-project.org>; Fri,  1 May 2020 12:22:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96757F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cOTspiVo"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DD15820787;
 Fri,  1 May 2020 10:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588328521;
 bh=8PiUkTNj8dS4j695LU0tBOc5dYcnMnyHpPrN0SZQOK8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cOTspiVozJzNRZAUtA9SvU4tVEBPMFtj4vbtNeG6j7iIG8fu+SN9CPpX/usVudhHG
 90faFkROucGSYAftqdqz1jipFHOZFG+o8VAZDRm/Jo7UklZnQenp4mycxHsoLer497
 xxaJqhb+0gcSkrvvWXRSjHALoZq3IzqGO6NMEZMU=
Date: Fri, 1 May 2020 11:21:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 2/3] ASoC: fsl_esai: Add support for imx8qm
Message-ID: <20200501102158.GA5276@sirena.org.uk>
References: <cover.1588320655.git.shengjiu.wang@nxp.com>
 <a933bafd2d6a60a69f840d9d4b613337efcf2816.1588320656.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline
In-Reply-To: <a933bafd2d6a60a69f840d9d4b613337efcf2816.1588320656.git.shengjiu.wang@nxp.com>
X-Cookie: Think honk if you're a telepath.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 Xiubo.Lee@gmail.com, lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org,
 tiwai@suse.com, nicoleotsuka@gmail.com, robh+dt@kernel.org, festevam@gmail.com,
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


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 01, 2020 at 04:12:05PM +0800, Shengjiu Wang wrote:
> The difference for esai on imx8qm is that DMA device is EDMA.
>=20
> EDMA requires the period size to be multiple of maxburst. Otherwise
> the remaining bytes are not transferred and thus noise is produced.

If this constraint comes from the DMA controller then normally you'd
expect the DMA controller integration to be enforcing this - is there no
information in the DMA API that lets us know that this constraint is
there?

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6r+EIACgkQJNaLcl1U
h9DfFQf/TcF/ZY/a5ix0r9s1n6xwh2QMqCs8szfQsOfEi3yLY75x5EptEuWovv0O
f0qx5o8tPjQNc6Ta+xw5OLLyOOTRSq5Gh703vik1g4SHjBWt6+Yn3SXovi9Y0j4V
ldBR/b2hTetKB3kxy5Ye0zimM1m/ifUuixaPTe5tfugJDWTAFaC2ZWFBlF1mveIb
5elPV0W1IYhCLo73wQa3Y/5evQCBv/uVMjWQAs44wt0LR/IVENEtBx/C4xkjgfrz
97uSY2xEEUsWDP/xi1fLlI5bU24PGepYE0cfN4N8hKNJGuL16WXZxnZRaN4LBk/A
n0v9+0DGJjzdrSsDZq/KxIk0QOQtsQ==
=RLMk
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
