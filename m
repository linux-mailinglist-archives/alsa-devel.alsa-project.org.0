Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F34AF298DF2
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 14:31:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 803A9851;
	Mon, 26 Oct 2020 14:31:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 803A9851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603719112;
	bh=47xZnNmgaWb2Nvry34Wr0Gg1IlbyBbZg6E0TRu2Og8U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=esHII0EwfqcC2Z9156eXECPsisOUT326803LapKBGosUcWpIbdk3x9WvSPlkA99c3
	 y+LwXntrydIvCV4IMVkqeUkMrZ2RwTfq3OLALFw9oKfGwa4WL35uBiQKmIO/Jvk7T7
	 YS9pFb22rNlMU77byvMLsCBVcn2Rl93KR1LSdUgg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F27FBF80249;
	Mon, 26 Oct 2020 14:30:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6391F80212; Mon, 26 Oct 2020 14:30:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACBD5F801D5
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 14:30:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACBD5F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sYC1/7QI"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0EB0624641;
 Mon, 26 Oct 2020 13:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603719008;
 bh=47xZnNmgaWb2Nvry34Wr0Gg1IlbyBbZg6E0TRu2Og8U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sYC1/7QI8zplIgXIdmH+wo8zWU0rdI7LtnjUjK9PriIjHJka+pxMljrbGIEGcjpJ0
 HDpl8AcGB6iuB+R8Q1SwfdWqvIymNTn4VmxiY0kDQei4uVUCjqj96VDBcnOv36RiTH
 NlNQV4mCEqg64Iv5xk3NrhwW3oTlHPWK4Ccl+LOY=
Date: Mon, 26 Oct 2020 13:30:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 2/2] ASoC: fsl_aud2htx: Add aud2htx module driver
Message-ID: <20201026133003.GD7402@sirena.org.uk>
References: <1603708855-2663-1-git-send-email-shengjiu.wang@nxp.com>
 <1603708855-2663-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qGV0fN9tzfkG3CxV"
Content-Disposition: inline
In-Reply-To: <1603708855-2663-2-git-send-email-shengjiu.wang@nxp.com>
X-Cookie: Safety Third.
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


--qGV0fN9tzfkG3CxV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 26, 2020 at 06:40:55PM +0800, Shengjiu Wang wrote:

> +static int fsl_aud2htx_hw_params(struct snd_pcm_substream *substream,
> +				 struct snd_pcm_hw_params *params,
> +				 struct snd_soc_dai *cpu_dai)
> +{
> +	struct fsl_aud2htx *aud2htx = snd_soc_dai_get_drvdata(cpu_dai);
> +
> +	/* DMA request when number of entries < WTMK_LOW */
> +	regmap_update_bits(aud2htx->regmap, AUD2HTX_CTRL_EXT,
> +			   AUD2HTX_CTRE_DT_MASK, 0);
> +
> +	/* Disable interrupts*/
> +	regmap_update_bits(aud2htx->regmap, AUD2HTX_IRQ_MASK,
> +			   AUD2HTX_WM_HIGH_IRQ_MASK |
> +			   AUD2HTX_WM_LOW_IRQ_MASK |
> +			   AUD2HTX_OVF_MASK,
> +			   AUD2HTX_WM_HIGH_IRQ_MASK |
> +			   AUD2HTX_WM_LOW_IRQ_MASK |
> +			   AUD2HTX_OVF_MASK);
> +
> +	/* Configur watermark */
> +	regmap_update_bits(aud2htx->regmap, AUD2HTX_CTRL_EXT,
> +			   AUD2HTX_CTRE_WL_MASK,
> +			   AUD2HTX_WTMK_LOW << AUD2HTX_CTRE_WL_SHIFT);
> +	regmap_update_bits(aud2htx->regmap, AUD2HTX_CTRL_EXT,
> +			   AUD2HTX_CTRE_WH_MASK,
> +			   AUD2HTX_WTMK_HIGH << AUD2HTX_CTRE_WH_SHIFT);
> +	return 0;
> +}

This doesn't look like a hw_params operation - it doesn't appear to
reference the params at all, or even containt any conditional
statements.  Shouldn't this be configured just once at driver load?

--qGV0fN9tzfkG3CxV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+Wz1sACgkQJNaLcl1U
h9BRkgf9GJDUVG/3LsgNUi10w457aA3PPnnK/cZnW28xpxfqtNNpZ2+HycVG+ky1
qwJAezTyWBG+OP2aZy3h8F68htNT3KqgkybywSCjdE8/wSqvTT42KTRDbqJuhr1F
Mnx1+Opres2oQkJqcTUqUkcnIc4gSSZYR9vzzUF7oRPgxF6AKTFLwFfDSsve8Nds
b1oJ6xeiAXrNZM+S1+ESvuaSlZzrK3fL00OxgFG0IjELhy+Wcasf+5QKbiego3BK
2PcYrQjRLqXCqXOw9ABpKZWUqruNAf6JuRryoGETL+OPP2uXRuwh5lXIhUKfNosa
tv1qtawmZN4dyUUGxBPWVV44Lf1FPw==
=1hAM
-----END PGP SIGNATURE-----

--qGV0fN9tzfkG3CxV--
