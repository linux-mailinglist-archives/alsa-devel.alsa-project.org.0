Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6232E4734AA
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Dec 2021 20:08:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B923B17E9;
	Mon, 13 Dec 2021 20:07:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B923B17E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639422523;
	bh=Qbp2eICTToaSxtjyYfWMYjIJzntY9rzrnEuUgDPk8Mw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LjnOBY9DLoe4lBuoYq+9lxVgEVULDwddr1owT3lnsFCloFzUb/n4pFuRDGBUbA1aB
	 p19xULX9w/Pv3xQlmVZtr6cN5uRnBz6tqjdjYGcjQFVzKZIGCqDsB4yKsOiPbGwZ5p
	 VPedpJt0iRdT/UeyD7+ioW5/pXKsOTOOXS/OQUi8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E490F8025F;
	Mon, 13 Dec 2021 20:07:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 303DAF8025D; Mon, 13 Dec 2021 20:07:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E675F8016A
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 20:07:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E675F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ISWWnCKr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2E7FB6111F;
 Mon, 13 Dec 2021 19:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E08FC34600;
 Mon, 13 Dec 2021 19:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639422437;
 bh=Qbp2eICTToaSxtjyYfWMYjIJzntY9rzrnEuUgDPk8Mw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ISWWnCKrf7ouAAL7UTOpFImPRE/RrSvPvD21XQQRFifVFLyqLvbiWVhkQO4Zgd4zW
 jPIaVGnUaKm5A1rIHjGJ4Pypq4W1rD/aFSHYZ1hnG7Tx3nomn+rxeTNgwtus3ZloI1
 QnwbYUhd0PM+G9X25vqSRlIlKirjw0MPs95c37aOX0m17VNHKttXIBpjiHaTfh2CqS
 T4A8I7uzLRHWWkZGVTjlm4czJuT2wsGLtPjkgvH/9fr/sYz+vudGqwvhLSH4gk64Iy
 bsmtifu9Nos99/C9LHHPPiS/lDyBF9Idmn9QkJlF05TptfEvMnRCi5PB3eqHU2Q5wv
 1/uXvDfaA4FEg==
Date: Mon, 13 Dec 2021 19:07:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Vincent Knecht <vincent.knecht@mailoo.org>
Subject: Re: [PATCH 2/2] ASoC: Add AK4375 support
Message-ID: <YbeZ37FLnAsMfrDl@sirena.org.uk>
References: <20211213155914.2558902-1-vincent.knecht@mailoo.org>
 <20211213155914.2558902-2-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Z8gbhBTXw3+IVEpf"
Content-Disposition: inline
In-Reply-To: <20211213155914.2558902-2-vincent.knecht@mailoo.org>
X-Cookie: No solicitors.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 obayerd@eurocomposant.fr, phone-devel@vger.kernel.org, stephan@gerhold.net,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, ~postmarketos/upstreaming@lists.sr.ht
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


--Z8gbhBTXw3+IVEpf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 13, 2021 at 04:59:12PM +0100, Vincent Knecht wrote:

> AK4375 is a 32-bit stereo DAC with headphones amplifier.
> There's no documentation for it on akm.com, and only a brief
> datasheet can be found floating on the internets [1].

This driver looks relatively clean but it's in *serious* need of
modernisation, there's issues here that haven't been present upstream
for a very long time.  Fortunately they're mostly style things so it
should be relatively easy to handle.

> +	struct ak4375_priv *ak4375 =3D snd_soc_component_get_drvdata(component);
> +	int value =3D gpiod_get_value_cansleep(ak4375->pdn_gpiod);
> +
> +	if (value < 0)
> +		dev_err(ak4375->dev, "unable to get pdn gpiod: %d\n", value);

You should cache the value set on the GPIO, there's no guarantee that
reads are supported when in output mode or that the value will
correspond to the value present on the pin. =20

> +static const struct soc_enum ak4375_dac_enum[] =3D {
> +	SOC_ENUM_SINGLE(AK4375_0B_LCH_OUTPUT_VOLUME, 7,
> +			ARRAY_SIZE(ak4375_ovolcn_select_texts), ak4375_ovolcn_select_texts),

Magic indexes into an array of enums are error prone and unreasonably
hard to read.  Declare individual variables for each enum like other
CODEC drivers do.

> +static const char * const pdn_on_select[] =3D { "OFF", "ON" };
> +
> +static const struct soc_enum ak4375_pdn_enum =3D
> +	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(pdn_on_select), pdn_on_select);

Given that the driver is actively managing this GPIO at runtime with no
coordination with this control this just shouldn't be exposed to
userspace at all, I can't see how userspace can use this control without
breaking the operation of the driver and any time the driver code kicks
in it will just overwrite the current state.

> +static const struct snd_kcontrol_new ak4375_snd_controls[] =3D {
> +	SOC_SINGLE_TLV("AK4375 Digital Output VolumeL",
> +		       AK4375_0B_LCH_OUTPUT_VOLUME, 0, 0x1f, 0, ovl_tlv),
> +	SOC_SINGLE_TLV("AK4375 Digital Output VolumeR",
> +		       AK4375_0C_RCH_OUTPUT_VOLUME, 0, 0x1f, 0, ovr_tlv),

These should be a standard stereo control - SOC_DOUBLE_R_TLV.

> +	SOC_SINGLE_TLV("AK4375 HP-Amp Analog Volume",
> +		       AK4375_0D_HP_VOLUME_CONTROL, 0, 0x1f, 0, hpg_tlv),

As with other CODEC drivers there is no need to put the name of the
CODEC in every control name.

> +	SOC_ENUM("AK4375 HPL Power-down Resistor", ak4375_dac_enum[6]),
> +	SOC_ENUM("AK4375 HPR Power-down Resistor", ak4375_dac_enum[7]),

These don't sound like things that would vary at runtime, should this be
controlled via DT?

> +static const struct snd_kcontrol_new ak4375_hpl_mixer_controls[] =3D {
> +	SOC_DAPM_SINGLE("LDACL", AK4375_07_DAC_MONO_MIXING, 0, 1, 0),
> +	SOC_DAPM_SINGLE("RDACL", AK4375_07_DAC_MONO_MIXING, 1, 1, 0),
> +};

The names of on/off switches should end with Switch - see
control-names.rst.

> +static int ak4375_set_pllblock(struct snd_soc_component *component, int =
fs)
> +{
> +	struct ak4375_priv *ak4375 =3D snd_soc_component_get_drvdata(component);
> +	int mclk, pllclk, refclk, pldbit, plmbit, mdivbit, divbit;
> +	u8 mode;

This should be being exposed as a set_pll() operation, or the input to
the PLL configured using set_sysclk().  The input clock to the PLL is
going to be system dependent.

> +static const unsigned int ak4375_rates[] =3D {
> +	8000, 11025, 16000, 22050,
> +	32000, 44100, 48000, 88200,
> +	96000, 176400, 192000,
> +};
> +
> +static const struct snd_pcm_hw_constraint_list ak4375_rate_constraints =
=3D {
> +	.count =3D ARRAY_SIZE(ak4375_rates),
> +	.list =3D ak4375_rates,
> +};
> +
> +static int ak4375_startup(struct snd_pcm_substream *substream,
> +			  struct snd_soc_dai *dai)
> +{
> +	return snd_pcm_hw_constraint_list(substream->runtime, 0,
> +					  SNDRV_PCM_HW_PARAM_RATE,
> +					  &ak4375_rate_constraints);
> +}

These are all standard rates, just set the supported rates in the DAI
description rather than using _KNOT.

> +static void ak4375_power_off(struct ak4375_priv *ak4375)
> +{
> +	gpiod_set_value_cansleep(ak4375->pdn_gpiod, 0);
> +	usleep_range(1000, 2000);
> +
> +	if (!IS_ERR(ak4375->avdd_supply))
> +		regulator_disable(ak4375->avdd_supply);

Unless the device is capable of operating without AVDD which doesn't
seem entirely likely use of AVDD should be unconditional.  If that were
the case I'd expect to see some configuration of the device for
operation without the supply which I don't see.

Probably also worth using the _bulk APIs unless the ordering is
important here.

> +	regulator_disable(ak4375->tvdd_supply);
> +
> +	usleep_range(3000, 4000);

What is this sleep doing?

> +	ak4375->pdn_gpiod =3D devm_gpiod_get_optional(ak4375->dev, "pdn", GPIOD=
_OUT_LOW);
> +	if (IS_ERR(ak4375->pdn_gpiod))
> +		return PTR_ERR(ak4375->pdn_gpiod);
> +
> +	ret =3D ak4375_power_on(ak4375);
> +	if (ret < 0)
> +		return ret;

We never unwind this power on - why not just remove the component level
probe/remove?

> +	ret =3D devm_snd_soc_register_component(ak4375->dev, drvdata->comp_drv,
> +					      drvdata->dai_drv, 1);
> +	if (ret < 0) {
> +		dev_err(ak4375->dev, "Failed to register CODEC: %d\n", ret);
> +		return ret;
> +	}
> +
> +	pm_runtime_enable(&i2c->dev);

Enable runtime PM before probing the component, a card may be
instantiated during component probe and userpace could start using the
card.

--Z8gbhBTXw3+IVEpf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmG3md4ACgkQJNaLcl1U
h9DXEwf/aj3cRhvwUT2EKDBrbjP2lbNdtl86ISKNhKD82pTyOMDHCisZhMzy1twO
jtnvCggiVp5qQ0MJlbDgZBhcWmd7gimzdqJamR8Gk8bJxOcNv2YEPi/NM2CXo5IT
2Dtd34ngk5ps1BlEB8eT0JNHoqgmdWyp/tGVN5ssOLDaDqKZ4A+CQINeppvbklOv
4F1oTbyXUMOYIizDwMP/PfPwmwfGKycCYmGtKhSmxqC15mMr3OQDYkmketz3ER/a
HFg56N2dvPhzH02xga+QjZ/chZZmpZtZ1DVqStI1AoKmZnK0N1o71C1zx9h/vnSl
THUY9OJ3/CGktzmQvLYftRvcsYXDjA==
=iQo2
-----END PGP SIGNATURE-----

--Z8gbhBTXw3+IVEpf--
