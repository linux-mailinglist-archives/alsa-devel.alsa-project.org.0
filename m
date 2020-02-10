Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB204157C3E
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 14:36:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73FC61673;
	Mon, 10 Feb 2020 14:35:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73FC61673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581341769;
	bh=//Nxno+RwLaNVF3MmPme5tVlqRPk7DPi/yeJJhQb1g8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V76tEiavpQHzNT9d2lTv3WrB2U6dTLjT80j4tyclCRkjo9wVjDNaAHZnZW3HD2yEI
	 DPvr9dcIwQm/I7Nn45UbZUNhdwMQRdQ4nrvJOz9IUwVCUuls56DSWSZ4cb9M2ioAF6
	 vU2qOF/w3rhT/Wi2HgTFa28uZTRk0vnbF4mcMrwo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47E91F80118;
	Mon, 10 Feb 2020 14:34:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44262F80158; Mon, 10 Feb 2020 14:34:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 9355FF80118
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 14:34:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9355FF80118
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96CA41FB;
 Mon, 10 Feb 2020 05:34:18 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B98A3F68E;
 Mon, 10 Feb 2020 05:34:17 -0800 (PST)
Date: Mon, 10 Feb 2020 13:34:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Adam Serbinski <adam@serbinski.com>
Message-ID: <20200210133416.GH7685@sirena.org.uk>
References: <20200207205013.12274-1-adam@serbinski.com>
 <20200209154748.3015-1-adam@serbinski.com>
 <20200209154748.3015-4-adam@serbinski.com>
MIME-Version: 1.0
In-Reply-To: <20200209154748.3015-4-adam@serbinski.com>
X-Cookie: Avoid gunfire in the bathroom tonight.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 3/8] ASoC: qdsp6: q6afe-dai: add support
 to pcm port dais
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
Content-Type: multipart/mixed; boundary="===============1930086383437485144=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1930086383437485144==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rCwQ2Y43eQY6RBgR"
Content-Disposition: inline


--rCwQ2Y43eQY6RBgR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 09, 2020 at 10:47:43AM -0500, Adam Serbinski wrote:

> +static int q6pcm_hw_params(struct snd_pcm_substream *substream,
> +			   struct snd_pcm_hw_params *params,
> +			   struct snd_soc_dai *dai)
> +{
> +	struct q6afe_dai_data *dai_data = dev_get_drvdata(dai->dev);
> +	struct q6afe_pcm_cfg *pcm = &dai_data->port_config[dai->id].pcm_cfg;
> +
> +	pcm->sample_rate = params_rate(params);
> +

This and set_fmt() don't do any validation of the value being set.

>  static const struct snd_soc_dai_ops q6tdm_ops = {
>  	.prepare	= q6afe_dai_prepare,
>  	.shutdown	= q6afe_dai_shutdown,
> -	.set_sysclk	= q6afe_mi2s_set_sysclk,
> +	.set_sysclk	= q6afe_tdm_set_sysclk,
>  	.set_tdm_slot     = q6tdm_set_tdm_slot,
>  	.set_channel_map  = q6tdm_set_channel_map,
>  	.hw_params        = q6tdm_hw_params,

This looks like a separate bug fix that should be split out?

> +	}, {
> +		.playback = {
> +			.stream_name = "Primary PCM Playback",
> +			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000,
> +			.formats = SNDRV_PCM_FMTBIT_S16_LE |
> +				   SNDRV_PCM_FMTBIT_S24_LE,
> +			.rate_min =     8000,
> +			.rate_max =     16000,
> +		},

It is surprising to see rate_min and rate_max specified when we're not
using _KNOT, and again there's weird formatting here with the tabs
before the rate values.

--rCwQ2Y43eQY6RBgR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5BW9cACgkQJNaLcl1U
h9Dh8wf9GPgsAk8A8fx5UolrgGZJ4NvmqNg6lr8kiZW80V0qguFTuNNYITV/GtSe
3hR5xFD6RWuu3W60mOEK6zra9dWXC++UUK9zROYY3AHiDqmJAfsPQRx9Pi6SoJSf
sHWco6VGMY308dMXp9ebWYAWHYjTHE/oKkbuCcjmwg/4qdgknwITb45vKDsGOk7U
KDq0QvV0RUTw3jtXPiwP93+UGwFOVHTnGPkYQVQPQiUi2N9/f41iWwry69B09wOW
GT/OYTl2NMH+pjmW+/XWcPwhp2cVaJa7c8v4JNl8QvYgIyEzyYwY945J7AxzhzXT
o4oM+MZSKad4PBHQ3/tbxddygF5rKg==
=fc13
-----END PGP SIGNATURE-----

--rCwQ2Y43eQY6RBgR--

--===============1930086383437485144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1930086383437485144==--
