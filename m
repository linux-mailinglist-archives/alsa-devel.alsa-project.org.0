Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3138B3B91
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Sep 2019 15:41:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26872166F;
	Mon, 16 Sep 2019 15:40:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26872166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568641284;
	bh=ii7FD/2by1swHRRKLOBInHNjxJ3hrOpM/Se0W2vrk1g=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XPBq8eGwv77MkGAtM5tAyWI+PrYxtPcEcziAw/noNcJDShsk61EKqJtAAj/IdSJfy
	 4mVe0ieULvRL2weEOyZnroNmDXJvY/Qx+viISnnbRsNStO8XdiwPUHvJNS9K2g8YuS
	 GhrnaA5zNqQY2rvgq+++oBiVd3TMH5JfS1i7vXwA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86CB8F80535;
	Mon, 16 Sep 2019 15:39:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54ED4F80506; Mon, 16 Sep 2019 15:39:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C123FF80148
 for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2019 15:39:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C123FF80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="LOLgU7t8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=87btgVCb+GNfVEk0OH6po0CAGY8zXH/2ckX41PZd76s=; b=LOLgU7t853tqdafCT77YlVrU6
 oqd4QoMQoQey0JlveklEYxIzyXDgRQ2xKTfm5ew4pQkzcq7g91IhmZcFdG340hgDTvKwQwgn6bdFV
 H/ZI1Qeb5CohXaEctrCAFGPYBx6IPUY+kZuJWQJumVsshSRZ366Wgs+YmZoivQNFJoV1g=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i9rE1-0004aX-Rh; Mon, 16 Sep 2019 13:39:29 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id E138F2741A0D; Mon, 16 Sep 2019 14:39:28 +0100 (BST)
Date: Mon, 16 Sep 2019 14:39:28 +0100
From: Mark Brown <broonie@kernel.org>
To: shifu0704@thundersoft.com
Message-ID: <20190916133928.GE4352@sirena.co.uk>
References: <1568597881-4093-1-git-send-email-shifu0704@thundersoft.com>
 <1568597881-4093-2-git-send-email-shifu0704@thundersoft.com>
MIME-Version: 1.0
In-Reply-To: <1568597881-4093-2-git-send-email-shifu0704@thundersoft.com>
X-Cookie: Man and wife make one fool.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, navada@ti.com, tiwai@suse.com,
 robh+dt@kernel.org, dmurphy@ti.com
Subject: Re: [alsa-devel] [PATCH v4] tas2770: Add tas2770 smart PA kernel
	driver
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
Content-Type: multipart/mixed; boundary="===============6803796798558825946=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6803796798558825946==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UEWYo9iD5Le5Jrpm"
Content-Disposition: inline


--UEWYo9iD5Le5Jrpm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2019 at 09:38:01AM +0800, shifu0704@thundersoft.com wrote:
> From: Frank Shi <shifu0704@thundersoft.com>
>=20
> Add tas2770 smart PA kernel driver

This is a great improvement, thanks.  There's still some issues though,
including some confusion over the use of bias levels - it seems like
there's fairly poor integration with standard power management, it's not
clear what's going on there.  We do also still have some code that
resets the CODEC which is concerning.

> +#define TAS2770_CHECK_PERIOD	5000	/* 5 second */

We don't need this any more.

> +	case SND_SOC_BIAS_STANDBY:
> +		snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
> +			TAS2770_PWR_CTRL_MASK,
> +			TAS2770_PWR_CTRL_ACTIVE);
> +		tas2770->power_state =3D SND_SOC_BIAS_STANDBY;
> +		break;

We already store the bias level in the component's dapm struct, no need
to duplicate it.

> +	case SND_SOC_BIAS_PREPARE:
> +		snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
> +			TAS2770_PWR_CTRL_MASK,
> +			TAS2770_PWR_CTRL_MUTE);

We shouldn't be muting and unmuting here, leave this to the digital mute
operation.

> +#ifdef CONFIG_PM
> +static int tas2770_codec_suspend(struct snd_soc_component *component)
> +{
> +	int ret;
> +
> +	ret =3D tas2770_set_bias_level(component, SND_SOC_BIAS_OFF);
> +	if (ret)
> +		return -EINVAL;

Pass back error codes you get from functions, however it looks like you
can just set the device as idle_bias_off and have the core do this for
you anyway (plus more at runtime) - there's no appreciable delays I can
see in power on and off.

> +static int tas2770_dac_event(struct snd_soc_dapm_widget *w,
> +			     struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =3D
> +			snd_soc_dapm_to_component(w->dapm);
> +	struct tas2770_priv *tas2770 =3D
> +			snd_soc_component_get_drvdata(component);
> +	int ret;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		ret =3D tas2770_set_bias_level(component,
> +			SND_SOC_BIAS_PREPARE);
> +		if (ret)
> +			goto end;

This is very, very bad - DAPM will control the bias level for the CODEC,
you should not be trying to control it from within DAPM callbacks.  This
will only lead to breakage.  What is this intended to do?

> +static int tas2770_mute(struct snd_soc_dai *dai, int mute)
> +{
> +	struct snd_soc_component *component =3D dai->component;
> +	int ret;
> +
> +	if (mute)
> +		ret =3D tas2770_set_bias_level(component, SND_SOC_BIAS_PREPARE);
> +	else
> +		ret =3D tas2770_set_bias_level(component, SND_SOC_BIAS_STANDBY);
> +
> +	return ret;
> +}

This is more bias level misuse, you are independently setting the bias
level in multiple different ways from many different call sites.  This
can only need to problems, I am surprised this works well for you as
things stand. =20

If the device doesn't have a mute operation it is fine to not have one.

> +	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> +	case (SND_SOC_DAIFMT_I2S):
> +		tdm_rx_start_slot =3D 1;

These brackets around the case statements are not the normal Linux
coding style (this isn't an issue in the rest of the driver...).

> +	case 0:
> +	/* Do not change slot width */
> +		ret =3D 0;
> +	break;

Please align the breaks and comments with the rest of the code inside
the case.

> +static const struct snd_kcontrol_new tas2770_snd_controls[] =3D {
> +	SOC_SINGLE_TLV("Amp Output Gain", TAS2770_PLAY_CFG_REG0,
> +		0, 0x14, 0,
> +		tas2770_digital_tlv),

Volume controls should end in Volume - see control-names.rst

> +static irqreturn_t tas2770_irq_handler(int irq, void *dev_id)
> +{
> +	struct tas2770_priv *tas2770 =3D (struct tas2770_priv *)dev_id;
> +	struct snd_soc_component *component =3D tas2770->component;
> +	unsigned int device_status_1 =3D 0, device_status_2 =3D 0;
> +	int result;
> +
> +	if (tas2770->runtime_suspend)
> +		goto end;
> +
> +	if (tas2770->power_state =3D=3D TAS2770_POWER_SHUTDOWN)
> +		goto end;
> +
> +	result =3D snd_soc_component_write(component, TAS2770_INT_MASK_REG0,
> +				TAS2770_INT_MASK_REG0_DISABLE);
> +	if (result)
> +		goto reload;
> +	result =3D snd_soc_component_write(component, TAS2770_INT_MASK_REG1,
> +				TAS2770_INT_MASK_REG1_DISABLE);
> +	if (result)
> +		goto reload;

The interrupt handler appears to be masking interrupts?  Why?

> +	result =3D snd_soc_component_read(tas2770->component,
> +			TAS2770_LAT_INT_REG0, &device_status_1);
> +	if (!result && (device_status_1 & 0x3)) {

If we fail to do I/O with the device we should report an error.

> +reload:
> +	/* hardware reset and reload */
> +	tas2770_load_config(tas2770);

Why are we doing a hardware reset in the interrupt handler, and how is
this coordinated with anything else that's going on.

> +end:
> +	return IRQ_HANDLED;
> +}

This unconditionally reports the interrupt as handled, this prevents the
interrupt line being shared and stops the interrupt core from doing
error handling if anything goes wrong.

> +	tas2770->dev =3D &client->dev;
> +	tas2770->irq_gpio =3D client->irq;

This isn't a GPIO, it's an interrupt - calling this irq_gpio is very
confusing.

--UEWYo9iD5Le5Jrpm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1/kI8ACgkQJNaLcl1U
h9Btagf/XNf6O/+q/nPwRlfWTROZAyQVmGEjivDA6SEEvGHDqZ4zrVRRjPAVtk+S
GUmNb8XZd+Tc+9YRGW7rtAopeAZDNi0fmHC3RSDW5g7if5V+E0EYG6ApU5KxxvCh
i8PeWaYKZ+aGmxjo5zNACGe/QlCdEwGjSCorXcc9JaNOSNGGfHMZe22KjaWA1O93
1hXnc+9C+XJZFFGp0NwdbxjKUir4/PmeB4UcQgpBlG+NPRRryBGCCosAhzwjM05q
P6pmDUDIABUJVJNmfFI9sRsk54hc7517U6+YzgbtqnJU0AsT74dwryj3wTgP0Fc/
R7vWoZj9PMTUBlI/V4gKeGGLIb4iPQ==
=Jrkx
-----END PGP SIGNATURE-----

--UEWYo9iD5Le5Jrpm--

--===============6803796798558825946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6803796798558825946==--
