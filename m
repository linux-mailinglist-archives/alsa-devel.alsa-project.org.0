Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F33561820
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 12:38:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B78216C3;
	Thu, 30 Jun 2022 12:37:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B78216C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656585518;
	bh=iIKs3rpaYPtUZ0eaoQBogoq+V5pKpR1jkSxXnpou/3M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UBBF++2fSKt0sOopMlQfb4DsgWtSpuqBiPa7g+xThjd4gDTDfkUnbmNfYk6RPSofS
	 7+6KVAO3QnKxegZ1rsfnlcUlEX4wdecqH+MWEuqsniD+MHVE9ZuOK6ufXPmciOrUN2
	 oI7KzrenqzoqgmAcscc4mzVhvRgp6jSwL3l6pK28=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89880F8014E;
	Thu, 30 Jun 2022 12:37:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB639F804D8; Thu, 30 Jun 2022 12:37:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 804B5F8014E
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 12:37:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 804B5F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ke/h3lcP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BCF3EB82A24;
 Thu, 30 Jun 2022 10:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E296C341C8;
 Thu, 30 Jun 2022 10:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656585449;
 bh=iIKs3rpaYPtUZ0eaoQBogoq+V5pKpR1jkSxXnpou/3M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ke/h3lcPOMIcjmkXSDygaQX/fBnyA5e1eEEUNs8qdP9Dwt+FEhhFsyDc8q1vNT0Wi
 ZIAz4B4huhN4ynq/IVmE8WlnX4UCtgS1koYpNof7PCbUhFM8wlBkAcGs/ex+wRYFRM
 S92Z1bjJKrpgkGsSruKC+H++8Nm4+A5xlLWUnqFMDshpvkdFrdj8wqY1Lf0kJwYwFB
 C3zKHGEVhlMmTkVPMtdbUdFuXQhh/6kNFUq5m0b8uTvTMmZfw96hg/3oUfCHHasld3
 Ve3kCsGl/H4yqXC4WwkFjIVNwlEYa8smOf70ranpv+Vgr465CwFtphi5HVMHjQx4rM
 eyCO2Y7pbAvcQ==
Date: Thu, 30 Jun 2022 11:37:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 3/6] ASoC: fsl_micfil: Add support for PLL switch at
 runtime
Message-ID: <Yr1842e42P4piYnE@sirena.org.uk>
References: <1656567554-32122-1-git-send-email-shengjiu.wang@nxp.com>
 <1656567554-32122-4-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="SDyGFineERFKDrrR"
Content-Disposition: inline
In-Reply-To: <1656567554-32122-4-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Today is what happened to yesterday.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
 tiwai@suse.com, lgirdwood@gmail.com, nicoleotsuka@gmail.com,
 robh+dt@kernel.org, krzk+dt@kernel.org, shengjiu.wang@gmail.com,
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


--SDyGFineERFKDrrR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 30, 2022 at 01:39:11PM +0800, Shengjiu Wang wrote:

> +static int fsl_micfil_reparent_rootclk(struct fsl_micfil *micfil, unsigned int sample_rate)
> +{
> +	struct device *dev = &micfil->pdev->dev;
> +	u64 ratio = sample_rate;
> +	struct clk *clk;
> +	int ret;
> +
> +	/* Reparent clock if required condition is true */
> +	if (!micfil->pll8k_clk || !micfil->pll11k_clk)
> +		return 0;
> +
> +	ratio = do_div(ratio, 8000) ? CLK_11K_FREQ : CLK_8K_FREQ;
> +
> +	/* Get root clock */
> +	clk = micfil->mclk;
> +	if (IS_ERR_OR_NULL(clk)) {
> +		dev_err(dev, "no mclk clock in devicetree\n");
> +		return PTR_ERR(clk);
> +	}
> +
> +	/* Disable clock first, for it was enabled by pm_runtime */
> +	clk_disable_unprepare(clk);
> +	fsl_asoc_reparent_pll_clocks(dev, clk, micfil->pll8k_clk,
> +				     micfil->pll11k_clk, ratio);
> +	ret = clk_prepare_enable(clk);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}

Seems like more of this logic could be factored out into the reparent
function if the target sample rate is passed in?

--SDyGFineERFKDrrR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK9fOIACgkQJNaLcl1U
h9C68Qf/YX1eL795b+XK2iAIiNLwaLomwMbw0JjNUWxPZS3+wkMhyqOfDxWfq52s
WZkSoJ7vyDPSIr7R5nCH7QFdwdgdLqck/2GSAaPUndpELFvuLqME+nElf2OlYx6l
nq33cMqc0OZlIpM757VsPYN6IPPq87rPXI030XM4lmOxzhvV1gE0195pRFSiyiCl
dWiddG47/R+cRgjm6LaGN0kkVTLWdj16f5E7zlz2VDse8I/CR5w7/U9hQ0yfE/Rr
oJtQi+ybrw26ELGPHDP/2yljgWzaCuc/+BllHMwQeoTYgjuu+nxpX8m6B5ToffUT
RpPmDmKDRpeFSTwxqqUVNwCPjHNjqQ==
=Zj5G
-----END PGP SIGNATURE-----

--SDyGFineERFKDrrR--
