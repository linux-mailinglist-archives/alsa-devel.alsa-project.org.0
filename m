Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BAA62C23D
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 16:18:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 133DD1692;
	Wed, 16 Nov 2022 16:17:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 133DD1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668611889;
	bh=GxgQqdI9rHqfRyAbWa77Kb+AvDoTyqIXkLzP8ZDJvUc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vpBO9sHqVDK5KBYyqzK2ll8rlceCG6VYi18iEr65tqpL2dideBO69tgmPrkZzO3PD
	 lkjmR9iLLQCKosBr12WSP1JXkwqrNPefEk/jWx7esNZ4Fe0K3fxPjuVqo8nuZkVIuc
	 7zBTT//mDbly6KFzcLAVuQ2RJ5/LX/8i1v5fRWhM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFFB7F80238;
	Wed, 16 Nov 2022 16:17:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00446F800B5; Wed, 16 Nov 2022 16:17:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09077F800B8
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 16:17:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09077F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FuqrquaO"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BFBAEB81DC1;
 Wed, 16 Nov 2022 15:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 018B9C433D6;
 Wed, 16 Nov 2022 15:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668611824;
 bh=GxgQqdI9rHqfRyAbWa77Kb+AvDoTyqIXkLzP8ZDJvUc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FuqrquaONTbolhFEEccmurd0tUPv0xO45Izry8lWgeDSINThxRvtnEO1k82ByCK4X
 XtCOap20zR5zhCxO+fw4yHyb7o+CljZ0YtWQZ2AQyP0/ZCdvPeZvk7HzELNbH1F7D6
 k4uArGj2+ry2kYPWFPhBfu+u7BE2pEtLEvVNFcuEPPFThf5PWPnlPut6t+jeZEl8z1
 dDR8sCgfWRFnGv9bEhhIwmSy5BKeLuP1c4FjTekMczGWM2bkPxujIHiJrO367Y0c2i
 qijMsph6P/yqN031M65bKnCkVI1IlNHuXMzNBNCoEo/3+OUd8T7ehIkM4THbVoebPX
 FxXD3tauqyHdA==
Date: Wed, 16 Nov 2022 15:17:00 +0000
From: Mark Brown <broonie@kernel.org>
To: wangweidong.a@awinic.com
Subject: Re: [PATCH V4 1/6] ASoC: codecs: Add i2c and codec registration for
 aw883xx and their associated operation functions
Message-ID: <Y3T+7JwwfxlXSkte@sirena.org.uk>
References: <1668165992-6493-2-git-send-email-wangweidong.a@awinic.com>
 <20221115022423.6437-1-wangweidong.a@awinic.com>
 <20221115022423.6437-2-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wqhH9OGoWLqIRYp1"
Content-Disposition: inline
In-Reply-To: <20221115022423.6437-2-wangweidong.a@awinic.com>
X-Cookie: Ego sum ens omnipotens.
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


--wqhH9OGoWLqIRYp1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 15, 2022 at 10:24:18AM +0800, wangweidong.a@awinic.com wrote:

> +/*
> + * aw883xx distinguish between codecs and components by version
> + */
> +static struct aw_componet_codec_ops aw_componet_codec_ops = {
> +	.kcontrol_codec = snd_soc_kcontrol_component,
> +	.codec_get_drvdata = snd_soc_component_get_drvdata,
> +	.add_codec_controls = snd_soc_add_component_controls,
> +	.unregister_codec = snd_soc_unregister_component,
> +	.register_codec = snd_soc_register_component,
> +};

I've started looking at this a few times but keep stopping due to
this bit.  CODECs and components (note the spelling BTW) are both
ASoC level concepts but this looks like the driver is trying to
define it's own abstraction using the same terms.  There's
nothing in the commit log or anything that explains this so it's
a bit of work to try to figure out what's going on which makes it
hard to follow.  It would really help to have some explanation of
what's going on rather than having to reverse engineer it from
the patches.

> +	mutex_lock(&aw883xx->dsp_lock);
> +	if (data_type == AW_DSP_16_DATA) {
> +	} else if (data_type == AW_DSP_32_DATA) {
> +	} else {
> +	}

This looks like it should be written as a switch statement.

> +	if ((ucontrol->value.integer.value[0] > FADE_TIME_MAX) ||
> +		(ucontrol->value.integer.value[0] < FADE_TIME_MIN)) {
> +		pr_debug("set val %ld overflow %d or  less than :%d",
> +			ucontrol->value.integer.value[0], FADE_TIME_MAX, FADE_TIME_MAX);
> +		return 0;
> +	}

Invalid values should report an error.

> +	pr_debug("step time %ld", ucontrol->value.integer.value[0]);

Use dev_ prints where possible.

> +	if (!aw883xx->dbg_en_prof) {
> +		dev_info(codec->dev, "profile close");
> +		return 0;
> +	}

This should be a debug print at most.

> +	/* check value valid */
> +	ret = aw883xx_dev_check_profile_index(aw883xx->aw_pa, ucontrol->value.integer.value[0]);
> +	if (ret) {
> +		dev_warn(codec->dev, "unsupported index %ld",
> +					ucontrol->value.integer.value[0]);
> +		return 0;
> +	}

No error messages from control sets, an application could make a
lot of noise in the logs.

> +static int aw883xx_volume_set(struct snd_kcontrol *kcontrol,
> +				struct snd_ctl_elem_value *ucontrol)
> +{

> +	vol_desc->ctl_volume = value;
> +
> +	/*get smaller dB*/
> +	compared_vol = AW_GET_MAX_VALUE(vol_desc->ctl_volume,
> +		vol_desc->monitor_volume);
> +
> +	aw883xx_dev_set_volume(aw883xx->aw_pa, compared_vol);

Why is there this extra soft limit on volume?  This looks
confusing.

> +static void aw883xx_fw_wrok(struct work_struct *work)
> +{

wrok?

> +static int aw883xx_gpio_request(struct aw883xx *aw883xx)
> +{
> +	int ret = 0;
> +
> +	if (gpio_is_valid(aw883xx->reset_gpio)) {
> +		ret = devm_gpio_request_one(aw883xx->dev, aw883xx->reset_gpio,
> +			GPIOF_OUT_INIT_LOW, "aw883xx_rst");
> +		if (ret) {
> +			dev_err(aw883xx->dev, "rst request failed");
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}

Use gpiod_ APIs please for new code, the numeric GPIO API is
being phased out.

> +/*
> + * sys group attribute: reg
> + */
> +static ssize_t reg_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	int reg_num = aw883xx->aw_pa->ops.aw_get_reg_num();
> +	ssize_t len = 0;
> +	uint8_t i = 0;
> +	unsigned int reg_val = 0;
> +
> +	for (i = 0; i < reg_num; i++) {
> +		if (aw883xx->aw_pa->ops.aw_check_rd_access(i)) {
> +			regmap_read(aw883xx->regmap, i, &reg_val);
> +			len += snprintf(buf + len, PAGE_SIZE - len,
> +					"reg:0x%02x=0x%04x\n", i, reg_val);
> +		}
> +	}
> +
> +	return len;
> +}

regmap already provides a debugfs interface for you.

> +static ssize_t reg_store(struct device *dev,
> +				struct device_attribute *attr, const char *buf,
> +				size_t count)
> +{
> +	struct aw883xx *aw883xx = dev_get_drvdata(dev);
> +	unsigned int databuf[2] = { 0 };
> +
> +	if (sscanf(buf, "%x %x", &databuf[0], &databuf[1]) == 2)
> +		regmap_write(aw883xx->regmap, databuf[0], databuf[1]);
> +
> +	return count;
> +}

It's not OK to provide a raw register write interface to
userspace, this allows userspace to just go around the back of
the driver and do whatever which makes it impossible to guarantee
that the state of the hardware matches what the driver thinks is
going on.  Needed functionality should go via some abstracted
kernel interface.  For debug use there is a regmap interface
which can do register writes for debug purposes if the kernel is
specially built for it.

Just remove all this debugfs code.

> +static ssize_t fade_step_store(struct device *dev,
> +	struct device_attribute *attr, const char *buf, size_t count)
> +{

Controls should go through the ALSA APIs, not sysfs.

--wqhH9OGoWLqIRYp1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN0/usACgkQJNaLcl1U
h9B8Hwf+JTOK3PftMqUnfrSm6bhS9j1h/ki0D7/xug6MeAS8cej//DYDilpXfptt
Xy+3zaipN/T8Nxzf+0JsviJCHO/hzhHJTKb1s42bWESQtQKBGGC12ovb6nVLYDlz
o4I3VXC5dnjJ4/6stbmfX5IFJQ1M65M8ITsE4B8S06yBePqFzuRgbzTM04NwHBko
fZXEAOSfJXy4J6uvLkpul6gPR6McXu1z3lGjBZ7Ue5gl3kyHlvc9TG4lP+Wk0JVe
97e+4Ool1oH7mwBMbpuybR5bgQas5mARbJuOqkLQUK+8VxwM95ap03gbuA0LHhtm
fLPmCF/h+Ru7A8JLfmF1mv0fHHhOpQ==
=P6iw
-----END PGP SIGNATURE-----

--wqhH9OGoWLqIRYp1--
