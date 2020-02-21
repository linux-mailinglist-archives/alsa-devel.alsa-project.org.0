Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE827167E6B
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Feb 2020 14:22:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EC2F1690;
	Fri, 21 Feb 2020 14:22:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EC2F1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582291376;
	bh=7jBCZFzRAMGvkjduzvrnNgKG2uWZV8YyKE222d9XAbk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lv8NbTbVvcLb648IIA951BgXT+22w+3dmrqR45VvuOJAI6vshZPhTzhovYECE9wEP
	 hJ0jhqxLg94Sk5dmEo1J4RTm4xSitfRYa2Zb8OWo6qEw4Xue8ciETqQFTV/GDvades
	 2vIGezynf00XmfXBBGronrYxTjfj4J5hPEFh8vV4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20C0FF8011D;
	Fri, 21 Feb 2020 14:21:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D09BEF80276; Fri, 21 Feb 2020 14:21:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 73617F80240
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 14:21:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73617F80240
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CD1630E;
 Fri, 21 Feb 2020 05:21:30 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D526C3F703;
 Fri, 21 Feb 2020 05:21:29 -0800 (PST)
Date: Fri, 21 Feb 2020 13:21:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v3 04/10] ASoC: tegra: add Tegra210 based I2S driver
Message-ID: <20200221132128.GE5546@sirena.org.uk>
References: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
 <1582180492-25297-5-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="FEz7ebHBGB6b2e8X"
Content-Disposition: inline
In-Reply-To: <1582180492-25297-5-git-send-email-spujar@nvidia.com>
X-Cookie: Dead?	No excuse for laying off work.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, jonathanh@nvidia.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, robh+dt@kernel.org, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org, digetx@gmail.com, rlokhande@nvidia.com,
 mkumard@nvidia.com, dramesh@nvidia.com
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


--FEz7ebHBGB6b2e8X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 20, 2020 at 12:04:46PM +0530, Sameer Pujar wrote:

> @@ -0,0 +1,938 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * tegra210_i2s.c - Tegra210 I2S driver
> + *

All C++ please.

> +static void tegra210_i2s_set_data_offset(struct tegra210_i2s *i2s,
> +					 unsigned int data_offset)
> +{
> +	unsigned int mask = I2S_CTRL_DATA_OFFSET_MASK;
> +	unsigned int shift = I2S_DATA_SHIFT;
> +	unsigned int reg;
> +
> +	reg = TEGRA210_I2S_TX_CTRL;
> +	regmap_update_bits(i2s->regmap, reg, mask, data_offset << shift);
> +
> +	reg = TEGRA210_I2S_RX_CTRL;
> +	regmap_update_bits(i2s->regmap, reg, mask, data_offset << shift);

The way this is written is *weird*, especially the use of reg - it'd
probably be clearer to just use the values directly rather than have
these intermediate temporary values.

> +static int tegra210_i2s_get_control(struct snd_kcontrol *kcontrol,
> +				    struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *compnt = snd_soc_kcontrol_component(kcontrol);
> +	struct tegra210_i2s *i2s = snd_soc_component_get_drvdata(compnt);
> +	long *uctl_val = &ucontrol->value.integer.value[0];
> +
> +	if (strstr(kcontrol->id.name, "Loopback"))
> +		*uctl_val = i2s->loopback;
> +	else if (strstr(kcontrol->id.name, "Sample Rate"))
> +		*uctl_val = i2s->srate_override;
> +	else if (strstr(kcontrol->id.name, "FSYNC Width"))
> +		*uctl_val = i2s->fsync_width;
> +	else if (strstr(kcontrol->id.name, "Playback Audio Bit Format"))
> +		*uctl_val = i2s->audio_fmt_override[I2S_RX_PATH];
> +	else if (strstr(kcontrol->id.name, "Capture Audio Bit Format"))
> +		*uctl_val = i2s->audio_fmt_override[I2S_TX_PATH];

Same issue as the DMIC driver, these really shouldn't be exposed to
userspace as regular controls.

> +	/*
> +	 * For playback I2S RX-CIF and for capture TX-CIF is used.
> +	 * With reference to AHUB, for I2S, SNDRV_PCM_STREAM_CAPTURE stream is
> +	 * actually for playback.
> +	 */
> +	path = (substream->stream == SNDRV_PCM_STREAM_CAPTURE) ?
> +	       I2S_RX_PATH : I2S_TX_PATH;

Please write normal conditional statements, it makes things easier to
read.

--FEz7ebHBGB6b2e8X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5P2VcACgkQJNaLcl1U
h9D/awf/U2ZCR7nNWNrI95I8xTMDKuA/JDQe0xYLuDIfs3GKQSPQMpUDhki+WZMN
DqFveacFKjMaU6kxGpoFWONkDSLzRjWguMjv0+SwXJPDbwYmJFsfOFNPc8AjXIDc
YsgXv6n/zHWQGC9w7tU3/Goy7n87FGWsBIKsBAQF2K4ZhubTgA9zggVBKLArj7J1
WpidsKFtr0DqBk/BKpQfERYQIQqND2xScFnTkrp80A55wu0rzNW2wP4XXWcOkPbS
jYoVHY81EV3ExQzN3T7FbOO6PWfXZMPwUw+UwfODLvFCbpmQJSkiMiv5x4qXJDrS
wxx80JuxpcjWr6qKYltb4t/R/+AgZg==
=0K47
-----END PGP SIGNATURE-----

--FEz7ebHBGB6b2e8X--
