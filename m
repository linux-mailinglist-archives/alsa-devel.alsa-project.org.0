Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A9D63C70A
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 19:10:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88B211F0;
	Tue, 29 Nov 2022 19:09:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88B211F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669745404;
	bh=6tXxDqzaCsbud+v5SEAgblRZWiVBpuwVcPW35Z6aN9E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ge35jJG6bCzHT/ODT79TsCukWZIcjxgJlrPrKiL5s0AgJlB5NHEmqoRIiipXvrx4z
	 ZkvGRapCbgLi5VcC7SgOlkPwBfefgZys+JEtKpu2b4xU9vgqgWVbXvRzA7LATMK+eL
	 PMcFO69tcpifJ0nguKYyCwRo22qVHAyEGnZWv3Jk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EA48F80212;
	Tue, 29 Nov 2022 19:09:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1139F801F7; Tue, 29 Nov 2022 19:09:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 535ADF80166
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 19:09:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 535ADF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FFU5FibY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5100461727;
 Tue, 29 Nov 2022 18:08:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6876EC433D6;
 Tue, 29 Nov 2022 18:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669745337;
 bh=6tXxDqzaCsbud+v5SEAgblRZWiVBpuwVcPW35Z6aN9E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FFU5FibYn3UcrkFKwGoDHpB2eD0rHdmOWabtzHGzhGCvdury9WVgcFeJZrJIZD0Ep
 QJqUAr+a8OaeP8KDSeW+Duk0sAwuTiek+jhssmfbo5pigzHJQovUWZcHhpHUtejV5q
 RIe/w60Qdug9uW3DhUWlLR/IPKUNCxQtBlqdClJwtDVy/6QouayFZoPkgQly2aNKcf
 Rem+9AGiA2xxU0FEXxJ5DSWUFFb1khnlHVu/N9pUgOE/ovEb2l6CGuGrnAQosQnPtK
 JLAqyKzVvuyHtqUg2xDvv8pVpKNFYey7/VERQ+BBWPDCibJ+gUX+WLfCARujaFa2qe
 cz26Ub+fDHYqA==
Date: Tue, 29 Nov 2022 18:08:51 +0000
From: Mark Brown <broonie@kernel.org>
To: wangweidong.a@awinic.com
Subject: Re: [patch v5 1/5] ASoC: codecs: Add i2c and codec registration for
 aw883xx and their associated operation functions
Message-ID: <Y4ZKs21o4TfcWvqL@sirena.org.uk>
References: <20221115022423.6437-2-wangweidong.a@awinic.com>
 <20221125092727.17414-1-wangweidong.a@awinic.com>
 <20221125092727.17414-2-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="h2wUVeElwoPuge/f"
Content-Disposition: inline
In-Reply-To: <20221125092727.17414-2-wangweidong.a@awinic.com>
X-Cookie: An apple a day makes 365 apples a year.
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com, tanureal@opensource.cirrus.com,
 duanyibo@awinic.com, liweilei@awinic.com, tiwai@suse.com, zhaolei@awinic.com,
 cy_huang@richtek.com, yijiangtao@awinic.com, robh+dt@kernel.org,
 zhangjianming@awinic.com, krzysztof.kozlowski+dt@linaro.org,
 quic_potturu@quicinc.com
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


--h2wUVeElwoPuge/f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 25, 2022 at 05:27:23PM +0800, wangweidong.a@awinic.com wrote:

> +static int aw883xx_fade_time_info(struct snd_kcontrol *kcontrol,
> +					struct snd_ctl_elem_info *uinfo)
> +{
> +	/* set kcontrol info */
> +	uinfo->type =3D SNDRV_CTL_ELEM_TYPE_INTEGER;
> +	uinfo->count =3D 1;
> +	uinfo->value.integer.min =3D 0;
> +	uinfo->value.integer.max =3D 1000000;

This info callback reports bounds on the value...

> +static int aw883xx_set_fade_in_time(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =3D snd_soc_kcontrol_component(kcon=
trol);
> +	struct aw883xx *aw883xx =3D snd_soc_component_get_drvdata(component);
> +	struct aw_device *aw_dev =3D aw883xx->aw_pa;
> +
> +	if ((ucontrol->value.integer.value[0] > FADE_TIME_MAX) ||
> +		(ucontrol->value.integer.value[0] < FADE_TIME_MIN)) {

=2E..which aren't the same as the values being validated on put.  It'd
also help if the callbacks included the name of the op they're
implementing, it'd make things eaiser to follow.

> +		dev_err(aw883xx->dev, "set val %ld overflow %d or  less than :%d",
> +			ucontrol->value.integer.value[0], FADE_TIME_MAX, FADE_TIME_MAX);

Userspace can use this to spam the logs, just return the error.


> +		return -1;

Return a real error code like -EINVAL.

> +	aw883xx_dev_set_fade_time(ucontrol->value.integer.value[0], true, aw_de=
v);
> +
> +	dev_dbg(aw883xx->dev, "step time %ld", ucontrol->value.integer.value[0]=
);
> +	return 1;
> +}

This will always report a change, generating spurious events.  Test with
the mixer-test kselftest to make sure everything is fine.

> +static int aw883xx_dynamic_create_controls(struct aw883xx *aw883xx)
> +{
> +	struct snd_kcontrol_new *aw883xx_dev_control =3D NULL;
> +	char *kctl_name =3D NULL;
> +
> +	aw883xx_dev_control =3D devm_kzalloc(aw883xx->codec->dev,
> +			sizeof(struct snd_kcontrol_new) * AW_KCONTROL_NUM, GFP_KERNEL);
> +	if (!aw883xx_dev_control)
> +		return -ENOMEM;
> +
> +	kctl_name =3D devm_kzalloc(aw883xx->codec->dev, AW_NAME_BUF_MAX, GFP_KE=
RNEL);
> +	if (!kctl_name)
> +		return -ENOMEM;
> +
> +	snprintf(kctl_name, AW_NAME_BUF_MAX, "aw_dev_%u_prof",
> +		aw883xx->aw_pa->channel);
> +
> +	aw883xx_dev_control[0].name =3D kctl_name;
> +	aw883xx_dev_control[0].iface =3D SNDRV_CTL_ELEM_IFACE_MIXER;
> +	aw883xx_dev_control[0].info =3D aw883xx_profile_info;
> +	aw883xx_dev_control[0].get =3D aw883xx_profile_get;
> +	aw883xx_dev_control[0].put =3D aw883xx_profile_set;

As far as I can see this dynamic creation stuff is being done so that
channel (which I can't find the initialisation for?) can be put into the
control names.  I can't tell why, if this is to distinguish multiple
instances of these devices in the same system the core already has
name_prefix which exists for this purpose and allows systems to provide
meaningful names.

> +	memcpy(aw883xx->aw_cfg->data, cont->data, cont->size);
> +	ret =3D aw883xx_dev_load_acf_check(aw883xx->aw_cfg);
> +	if (ret < 0) {
> +		dev_err(aw883xx->dev, "Load [%s] failed ....!", AW883XX_ACF_FILE);
> +		vfree(aw883xx->aw_cfg);
> +		aw883xx->aw_cfg =3D NULL;
> +		release_firmware(cont);
> +		return ret;
> +	}
> +	release_firmware(cont);

We could just release the firmware immediately after the memcpy().

> +static const struct snd_soc_dapm_widget aw883xx_dapm_widgets[] =3D {
> +	 /* playback */
> +	SND_SOC_DAPM_AIF_IN("AIF_RX", "Speaker_Playback", 0, SND_SOC_NOPM, 0, 0=
),
> +	SND_SOC_DAPM_OUTPUT("audio_out"),
> +	/* capture */
> +	SND_SOC_DAPM_AIF_OUT("AIF_TX", "Speaker_Capture", 0, SND_SOC_NOPM, 0, 0=
),
> +	SND_SOC_DAPM_INPUT("iv_in"),
> +};

Generally the inputs and outputs should correspond to the names of the
physical pins on the device so they can be used in the DT bindings to
connect things to them.

> +static int aw883xx_add_widgets(struct aw883xx *aw883xx)
> +{
> +	struct snd_soc_dapm_widget *aw_widgets =3D NULL;
> +	struct snd_soc_dapm_route *aw_route =3D NULL;
> +	struct snd_soc_dapm_context *dapm =3D snd_soc_component_get_dapm(aw883x=
x->codec);
> +
> +	/*add widgets*/
> +	aw_widgets =3D devm_kzalloc(aw883xx->dev,
> +				sizeof(struct snd_soc_dapm_widget) *
> +				ARRAY_SIZE(aw883xx_dapm_widgets),
> +				GFP_KERNEL);
> +	if (!aw_widgets)
> +		return -ENOMEM;
> +
> +	memcpy(aw_widgets, aw883xx_dapm_widgets,
> +			sizeof(struct snd_soc_dapm_widget) * ARRAY_SIZE(aw883xx_dapm_widgets)=
);
> +
> +	snd_soc_dapm_new_controls(dapm, aw_widgets, ARRAY_SIZE(aw883xx_dapm_wid=
gets));

I'm not sure why we're doing the alloc and copy here?

> +static ssize_t rw_store(struct device *dev,
> +				struct device_attribute *attr, const char *buf,
> +				size_t count)
> +{
> +	struct aw883xx *aw883xx =3D dev_get_drvdata(dev);
> +	unsigned int databuf[2] =3D { 0 };
> +
> +	if (sscanf(buf, "%x %x", &databuf[0], &databuf[1]) =3D=3D 2) {
> +		aw883xx->reg_addr =3D (uint8_t)databuf[0];
> +		if (aw883xx->aw_pa->ops.aw_check_rd_access(databuf[0]))
> +			regmap_write(aw883xx->regmap, databuf[0], databuf[1]);
> +	} else {
> +		if (sscanf(buf, "%x", &databuf[0]) =3D=3D 1)
> +			aw883xx->reg_addr =3D (uint8_t)databuf[0];
> +	}
> +
> +	return count;
> +}

Remove all this, if there's a need for this for debug purposes then
there's code in the regmap core to provide direct regmap read/write via
debugfs.  For production use provide ALSA controls for whatever needs
controlling.  We shouldn't have userspace able to do uncontrolled
register writes, that means it can trivially do things which conflict
with what the kernel is doing - we've got no real idea what state the
device is in.=20

All this sysfs stuff looks like it should go, or at least be in separate
clearly explained patches.

> +static ssize_t fade_enable_show(struct device *dev,
> +	struct device_attribute *attr, char *buf)
> +{

This is something that's already exposed via the ALSA API.

--h2wUVeElwoPuge/f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOGSrIACgkQJNaLcl1U
h9CW8gf+Jm6JUjdetHenNZdaMs5ANxO0e/SeVe0mBhQ4P+nssEyWtWZXM4xJ3+ez
6fRMtSeLvNPm/b+u3mmfNrvEsdjXmdVoYpGNnyH8nmByjfja1CcpxPT3KfA7BWW2
y3Whg94Jo9JkEFECPDPmOkuak29YDlI0xRM7uuIIEMqr4fCG2c3nJx1kfYoOOhzU
kys25WSe0eDh+gfPE3YrxDMFrwFDd6fVQT+wDEUOKgSYqUhVQQTKcbqKZF38NrDq
F/MKuF2waDnBA4qRfKh5fhaZdek0oHktjar8weVcJ0DjNwylgQta5c8Kqv98RBbf
XF2MutQ+BiJ92HhOtiCWzZc+QVTiMQ==
=gG4h
-----END PGP SIGNATURE-----

--h2wUVeElwoPuge/f--
