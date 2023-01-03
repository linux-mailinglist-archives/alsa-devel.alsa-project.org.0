Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9634865C5CB
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 19:10:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 241FA5F54;
	Tue,  3 Jan 2023 19:09:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 241FA5F54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672769434;
	bh=M+guTx9/MFdaM/g9JD7GIaQjt1whUIAEus/BUJ/qVW0=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=tPqFXMRrYYrfcR5KoX21ViFZKs6Fol6JgMkcsKW129qBNXoD2goaQKEoy/0pK4exa
	 d9Dd3HL9W9UlMy+rR4kzpG/SteTGzSg2Rukk9tzslxHMb8jqABZenM+a0Pfat2H4MZ
	 frcaNcDVNKd7TP8q+LF/1dZ4yDhxkFAOsN+XVhSc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA5F1F8003C;
	Tue,  3 Jan 2023 19:09:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94D98F804AA; Tue,  3 Jan 2023 19:09:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 000AEF8003C
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 19:09:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 000AEF8003C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aK/PvWiJ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5D20C614B4;
 Tue,  3 Jan 2023 18:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEB81C433D2;
 Tue,  3 Jan 2023 18:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672769368;
 bh=M+guTx9/MFdaM/g9JD7GIaQjt1whUIAEus/BUJ/qVW0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aK/PvWiJ0IC/szabV2T3ucI2bbelhC5VEhUGImiCMvL4xSd7gEP89zAHFKL56PGvK
 kgOiX+0uePgsZ8B3qX+GL2Fwpd2qvd2POGDAgoein1yukl4H5Lr4/2uIjTiJVfWKoK
 Dmyr3gLhNUxH6/xObRVsiw3/xIt7ddUn0NDaep9ozLf+PUu1fPd3n4+M8SPBSDkeX1
 KJa7JONexbyP+Q3JjghGzMcP3nTw1OLOWFgqFfU1C7/bvX/CFAf1j4uk+v8y93u5tB
 RmbmkFbnJRNPJGYuSAnnrKSwajaRUJcZTmZ5wLGW877H987VgYXREW9XQC3vujh4OP
 MaJC32NLQAc1w==
Date: Tue, 3 Jan 2023 18:09:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
Subject: Re: [PATCH v2 2/5] ASoC: samsung: i2s: add support for FSD I2S
Message-ID: <Y7RvUlIuXQLUHEna@sirena.org.uk>
References: <20230103045613.100309-1-p.rajanbabu@samsung.com>
 <CGME20230103045655epcas5p1af06a83208190c471e8cd891ef4760f3@epcas5p1.samsung.com>
 <20230103045613.100309-3-p.rajanbabu@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gcxAJ25eGCCq6ZtM"
Content-Disposition: inline
In-Reply-To: <20230103045613.100309-3-p.rajanbabu@samsung.com>
X-Cookie: So many men
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rcsekar@samsung.com, aswani.reddy@samsung.com, pankaj.dubey@samsung.com,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 alim.akhtar@samsung.com, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--gcxAJ25eGCCq6ZtM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 03, 2023 at 10:26:10AM +0530, Padmanabhan Rajanbabu wrote:

> +void fsd_i2s_fixup_early(struct snd_pcm_substream *substream,
> +		struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
> +	struct i2s_dai *i2s = to_info(asoc_rtd_to_cpu(rtd, 0));
> +	struct i2s_dai *other = get_other_dai(i2s);
> +
> +	if (!is_opened(other)) {
> +		i2s_set_sysclk(dai, SAMSUNG_I2S_CDCLK, 192, SND_SOC_CLOCK_OUT);
> +		i2s_set_sysclk(dai, SAMSUNG_I2S_OPCLK, 0, MOD_OPCLK_PCLK);
> +	}
> +}

This looks like we're just hard coding to 192kHz?

--gcxAJ25eGCCq6ZtM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmO0b1EACgkQJNaLcl1U
h9Dtpwf/QBcLyOstOlusyhiszKaJsdbQq5jWmUNMELBJe4e8mvmusHElUqb3+OoE
jY2c7i7PWNP3Oi/MeieAOfGJeAB8W4MMyIqVor6A/rpdG4Rpi8oqrjDuO6T94nBJ
staf9152tPNf3feG+I1WMH7K4wHkuSuByqwfES2Gd/AC5CLW5mAsJ7LdCA9isCwB
60ZM6zs3NIOBTTOfTx6Hpr5WCKYLUOCVCBfQ5BfvncrS2Hygd+fgfFaEPCN5Q5vQ
2NuVyFfIToDz6VYW4dJ2C/NKS4UG8633qDg2KZHA/u94L7FzPZLDlHExBIbQARX0
nFuJFOwzX7ip//+J74ftTHpOUeFPqA==
=GVZ8
-----END PGP SIGNATURE-----

--gcxAJ25eGCCq6ZtM--
