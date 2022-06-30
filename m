Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1165618C8
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 13:11:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6542C16C0;
	Thu, 30 Jun 2022 13:11:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6542C16C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656587511;
	bh=Ocbgb/7jtbPf5c7P3Qu4IS2stjMJzDoFkyyY73hHr2Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kCwZ4kivOuPLcHWIceK6hfpo/uPwU2YfKtkShjDcxlB1R6ElbeZYxRtmmdTowCh5V
	 OyxSNJ/vwMIhac3dfB7ruLoh5iAsJSSeu6NlrW8ZGKolHchx2yT4qLsM8hqyCHkx86
	 yLP1Gb/q/Mo4oFzrT3Z4ZAk/rGj3CWYcnkxMiTcE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8695F8014E;
	Thu, 30 Jun 2022 13:10:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69AFAF804D8; Thu, 30 Jun 2022 13:10:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08D7FF8014E
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 13:10:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08D7FF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KwZCxI1Q"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 43436622AC;
 Thu, 30 Jun 2022 11:10:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 229ECC34115;
 Thu, 30 Jun 2022 11:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656587441;
 bh=Ocbgb/7jtbPf5c7P3Qu4IS2stjMJzDoFkyyY73hHr2Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KwZCxI1QdcIf76JP3BhOMJdxLR4B6uWo/VApAlYCAbryYteKxpiJDv8mks3WPbn/t
 PN0nmyRcKqUNvQWLX0i4UeGSFYMJg/aJRPtIItPf5ZbGJFlTgo921PPtaBAkcMOfwS
 EAviKJu/LaVJQnqEAMkfWG8YsiYjdWOBiCPVkp3jUSN7a/BNoE2dxQcvi6boI8iEE1
 kG+kDnIwIwvKk2KA7/GI7v7uXdSJUVryiLAvAUno8r+dGCAjnpQrQrIbdvT7znkem2
 wtbsma0gtl/xN3EfCxjcGT59nTF9hSZ+cjUmMY3rJQ3yjQ16RK16uPcLGCXgC6hRkT
 fUVm+4Tup/Uiw==
Date: Thu, 30 Jun 2022 12:10:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 4/5] ASoC: amd: add Machine driver for Jadeite platform
Message-ID: <Yr2Eq0BUmi6mZsRY@sirena.org.uk>
References: <20220630031755.1055413-1-Vijendar.Mukunda@amd.com>
 <20220630031755.1055413-5-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VaXjt56hsiVkurul"
Content-Disposition: inline
In-Reply-To: <20220630031755.1055413-5-Vijendar.Mukunda@amd.com>
X-Cookie: Today is what happened to yesterday.
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alexander.Deucher@amd.com, zhuning@everest-semi.com
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


--VaXjt56hsiVkurul
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 30, 2022 at 08:47:54AM +0530, Vijendar Mukunda wrote:

> +static int st_es8336_hw_params(struct snd_pcm_substream *substream,
> +			       struct snd_pcm_hw_params *params)
> +{
> +	int ret = 0;
> +	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
> +	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> +
> +	ret = snd_soc_dai_set_sysclk(codec_dai, 0, params_rate(params) * 256, SND_SOC_CLOCK_IN);
> +	if (ret < 0) {
> +		dev_err(rtd->dev, "can't set codec sysclk: %d\n", ret);
> +		return ret;
> +	}
> +	return ret;
> +}

> +static const unsigned int st_channels[] = {
> +	DUAL_CHANNEL,
> +};
> +
> +static const unsigned int st_rates[] = {
> +	48000,
> +};

If the clock rate is fixed why not just set the sysclk once at startup
too?

--VaXjt56hsiVkurul
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK9hKoACgkQJNaLcl1U
h9D6iQf/cdNWEk90vyAVgMDGpqVrhhgGkycVyqRydGaLYCrCQXsnLdtPqtSpQCyB
doEqq9MwQGoj/8uz5i/0althh56A2dV2L6k/81LuXbX685XrtdvosvEv9m37y+ru
ZebtRcmQ668WOgeLYHmthArmVUwjPmUtcOkZ1K7dibKXWm7Elhv0kkXZLTM+UyQs
MoFY3kjXWMu3vEm+ZTogS+YhilD8EE5Vl3pvGJKZ8NKJxDMrXQbNlO5XMkY+9IaR
O1U0u8iVoirNM0GWyHbVCwqOPQCIbhqc2g89N1teq8Qs+1WTf8MRAfuo1gnGfbrg
c0/bwEED3n4t0Rgqqhau7Dq1qPLViA==
=9h7K
-----END PGP SIGNATURE-----

--VaXjt56hsiVkurul--
