Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C91486488
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jan 2022 13:43:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD2901913;
	Thu,  6 Jan 2022 13:42:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD2901913
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641473018;
	bh=wT/ZPqBkBaMheLCzIx+SiOVsTngrky5n/j5QT5DX82c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mQbsk7h78+y/npzxA2C+ewe0aNllDnkdwaTauIzkkzoy2HKYm4uGH77tal/HC6A3x
	 dFHaEBhX3DNQXWdFPT7C+Em+WGopzrLQvrA/lLw0A/CD4HRbBQLCLDeMp7vqYGDBij
	 GBIIFBcvcK4CtH+O+L/FFgndeKDbfux//A5jzAzs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0E26F8016D;
	Thu,  6 Jan 2022 13:42:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09848F80163; Thu,  6 Jan 2022 13:42:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82F7FF80161
 for <alsa-devel@alsa-project.org>; Thu,  6 Jan 2022 13:42:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82F7FF80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="caimkpIu"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0B250B82104;
 Thu,  6 Jan 2022 12:42:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FBF0C36AE3;
 Thu,  6 Jan 2022 12:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641472934;
 bh=wT/ZPqBkBaMheLCzIx+SiOVsTngrky5n/j5QT5DX82c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=caimkpIutlOCoOP0CBzGK2XgIeJfzboEd4LqeVnp7jNJcEXCDMB/KR/eALG7IT/Jr
 7iQushwNOrobePTMmrh70Rr/UxU8+KYSOxZTAf7qJakQbJ6dd4eB0zwq38kJDk6aqs
 Txtu336IEPAFyGtQXppZQ0kfv3Izy7l/xFQ+Tl+JRr9z3GkTQGLMoAF/r01GOlnrpM
 MOyFxS4xGAZ7mcBtikjzPUOclZitvxPZ7RMmtmURpuUbsaLK85a/VuwKt4k2HirPwO
 hhLd63V4wBRr0At++gIkpmsVLvxGyQCmfiSLPt9gaB1N1tnezf6zi8Gt0JjdW+N0IG
 1qfg6ziAN6oXg==
Date: Thu, 6 Jan 2022 12:42:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Robert Hancock <robert.hancock@calian.com>
Subject: Re: [PATCH 3/5] ASoC: xilinx: xlnx_i2s.c: Handle sysclk setting
Message-ID: <YdbjoQGKGedGLl/d@sirena.org.uk>
References: <20220105225146.3517039-1-robert.hancock@calian.com>
 <20220105225146.3517039-4-robert.hancock@calian.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pehtLVQtJEeR8N3c"
Content-Disposition: inline
In-Reply-To: <20220105225146.3517039-4-robert.hancock@calian.com>
X-Cookie: I think we're in trouble.
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 michal.simek@xilinx.com, maruthi.srinivas.bayyavarapu@xilinx.com,
 tiwai@suse.com
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


--pehtLVQtJEeR8N3c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 05, 2022 at 04:51:44PM -0600, Robert Hancock wrote:

> +	unsigned int last_sysclk;

Same naming issue.

> +	if (drv_data->last_sysclk) {
> +		unsigned int bits_per_sample =3D drv_data->is_32bit_lrclk ?
> +					       32 : drv_data->data_width;

Please write normal conditional statements, it improves legibility.

> +		unsigned int sclk =3D params_rate(params) * bits_per_sample *
> +				    params_channels(params);

snd_soc_params_to_bclk().

> +		unsigned int sclk_div =3D DIV_ROUND_CLOSEST(drv_data->last_sysclk, scl=
k) / 2;

Same issue with _ROUND_CLOSEST()

> +
> +		if (!sclk_div || (sclk_div & ~I2S_I2STIM_VALID_MASK)) {
> +			dev_warn(i2s_dai->dev, "invalid SCLK divisor for sysclk %u and sclk %=
u\n",
> +				 drv_data->last_sysclk, sclk);
> +			return -EINVAL;
> +		}

This indicates that we should be setting some constraints on sample rate
based on sysclk.

> +		writel(sclk_div, drv_data->base + I2S_I2STIM_OFFSET);
> +	}

Does the device actually support operation without knowing the sysclk?

> @@ -56,18 +90,18 @@ static int xlnx_i2s_hw_params(struct snd_pcm_substrea=
m *substream,
>  static int xlnx_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
>  			    struct snd_soc_dai *i2s_dai)
>  {
> -	void __iomem *base =3D snd_soc_dai_get_drvdata(i2s_dai);
> +	struct xlnx_i2s_drv_data *drv_data =3D snd_soc_dai_get_drvdata(i2s_dai);
> =20
>  	switch (cmd) {
>  	case SNDRV_PCM_TRIGGER_START:
>  	case SNDRV_PCM_TRIGGER_RESUME:
>  	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> -		writel(1, base + I2S_CORE_CTRL_OFFSET);
> +		writel(I2S_CORE_CTRL_ENABLE, drv_data->base + I2S_CORE_CTRL_OFFSET);
>  		break;
>  	case SNDRV_PCM_TRIGGER_STOP:
>  	case SNDRV_PCM_TRIGGER_SUSPEND:
>  	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> -		writel(0, base + I2S_CORE_CTRL_OFFSET);
> +		writel(0, drv_data->base + I2S_CORE_CTRL_OFFSET);
>  		break;

Please split the change to have a struct for driver data out into a
separate change, it's a large reformatting and is big enough to justify
it - more of the diff is that than the change described in the changelog
which doesn't mention this at all.

--pehtLVQtJEeR8N3c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHW46AACgkQJNaLcl1U
h9AKyAf+LqvHZw9x6iS4JqwAQS2C1VkjpCr80QreCvyk1FPpJJbXxqZECJQGFCEE
ewMJzdW3/wJrwqQBV1WUjf4cKfpJv4znf+etaDrUqD42vEgplv/AeLX8wn+dhC79
GmAJXjSqlPMhsz/I8oJLlC0VQ4PVUAh4je6IZPYFdaDjQeiBw7OSeFYFFEosgLND
Ng8XhTmlBEvoIqCosp0ml4+LtQMbM1CYz5CkfKj/39Za7n3zTg3aOnQ2z1rXZc7g
kBwbP5EVrYmqPC6wFAx5DQSoB2Zt057CkR5Jn9yJvEYlpaSSVR9vyG7x/BGCHltV
ejwVbEixJoOfBsrc3TP6/+Y1YJxy8g==
=7CG0
-----END PGP SIGNATURE-----

--pehtLVQtJEeR8N3c--
