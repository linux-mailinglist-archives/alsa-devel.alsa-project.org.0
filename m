Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2982E7DA794
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Oct 2023 16:41:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82A03850;
	Sat, 28 Oct 2023 16:40:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82A03850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698504082;
	bh=gBoukgwbnv7kdvEE2dKfEoMAGNoyvArZrw3HanBJXC4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pKctjlgwybhjXwwYGda502ecdm7gdC00Syj+scQ29VibbpWxlLsdec8cRDDPVvv4k
	 H98E4pEcYHcpf52B3C4ww0pg/7NeSktRQ//cXDcJk01JZQ22elEcuqR0FxtN4ezSok
	 KWhQdKlrvcxdfxC05SJMIJi5B1TqfY+xXxzCqANI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03B2CF8010B; Sat, 28 Oct 2023 16:40:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44485F80165;
	Sat, 28 Oct 2023 16:40:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E704F8019B; Sat, 28 Oct 2023 16:40:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr
 [80.12.242.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE9D9F80152
	for <alsa-devel@alsa-project.org>; Sat, 28 Oct 2023 16:40:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE9D9F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=frxD7G+C
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id wkTtqYVzL63GJwkTtqx2Mj; Sat, 28 Oct 2023 16:40:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1698504013;
	bh=fZsYqi1cjBvv75ObEJzpj+1QWMKsFp+bnhc9R56akr0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=frxD7G+C3qIOVHy1swtNrmKpHX26yH7tcVm4x9ang1jSGycdJ9vJod9dSPU4l05/r
	 lem+5u6EtByIJsEJwMs+sYX0VpU+KmhWH+JgaDaAICVITlNOJX04tl3oo8Bg7vViM8
	 9KRKV2QSUODp0zAZUvecf7aQsdKNGJcF+FAmrACuSwlnBJEPVXvEw/FwwgCCr5qVs0
	 1EKs9Jwakk7VwBzZWEmiOPbAAaKwg9Wpen2mtUTs67UEBamBCicfTm/vjqwY8+zumn
	 K/WO6LY8ifMNf7Eidk1NRHUJvq3/7Lx2g/t3jK8rb+hup33mSG/O/Y7cDLzHfcQrQe
	 OGexkDoFToFVw==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 28 Oct 2023 16:40:13 +0200
X-ME-IP: 86.243.2.178
Message-ID: <62e7f3c6-5726-4c52-9e87-2694f5fe2fd8@wanadoo.fr>
Date: Sat, 28 Oct 2023 16:40:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ASoC: tas2783: Add source files for tas2783 driver.
To: Baojun Xu <baojun.xu@ti.com>, broonie@kernel.org, lgirdwood@gmail.com,
 perex@perex.cz
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, kevin-lu@ti.com, shenghao-ding@ti.com,
 peeyush@ti.com, navada@ti.com, tiwai@suse.de
References: <20231028092409.96813-1-baojun.xu@ti.com>
Content-Language: fr
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20231028092409.96813-1-baojun.xu@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VHRZZ5B45JJVPPMMYC33L63EWJJGJ5X5
X-Message-ID-Hash: VHRZZ5B45JJVPPMMYC33L63EWJJGJ5X5
X-MailFrom: christophe.jaillet@wanadoo.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VHRZZ5B45JJVPPMMYC33L63EWJJGJ5X5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Le 28/10/2023 à 11:24, Baojun Xu a écrit :
> Add source file and header file for tas2783 soundwire driver.
> Also update Kconfig and Makefile for tas2783 driver.
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> ---

Hi,
some nit and on fix below.

CJ

...

> +static int tas2783_digital_getvol(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component
> +		= snd_soc_kcontrol_component(kcontrol);
> +	struct tasdevice_priv *tas_dev =
> +		snd_soc_component_get_drvdata(component);
> +	struct soc_mixer_control *mc =
> +		(struct soc_mixer_control *)kcontrol->private_value;
> +	struct regmap *map = tas_dev->regmap;
> +	int val = 0, ret;
> +
> +	if (!map || !ucontrol) {

'map' can't be NULL if the probe succeeds.

> +		dev_err(tas_dev->dev, "%s, wrong regmap.\n", __func__);
> +		return -EINVAL;
> +	}
> +	/* Read current volume from the device. */
> +	ret = regmap_read(map, mc->reg, &val);
> +	if (ret) {
> +		dev_err(tas_dev->dev, "%s, get digital vol error %x.\n",
> +			__func__, ret);
> +		return ret;
> +	}
> +	ucontrol->value.integer.value[0] =
> +		tasdevice_clamp(val, mc->max, mc->invert);
> +
> +	return ret;
> +}
> +
> +static int tas2783_digital_putvol(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component
> +		= snd_soc_kcontrol_component(kcontrol);
> +	struct tasdevice_priv *tas_dev =
> +		snd_soc_component_get_drvdata(component);
> +	struct soc_mixer_control *mc =
> +		(struct soc_mixer_control *)kcontrol->private_value;
> +	struct regmap *map = tas_dev->regmap;
> +	int val, ret;
> +
> +	if (!map || !ucontrol) {

'map' can't be NULL if the probe succeeds.

> +		dev_err(tas_dev->dev, "%s, wrong regmap.\n", __func__);
> +		return -EINVAL;
> +	}
> +	val = tasdevice_clamp(ucontrol->value.integer.value[0],
> +		mc->max, mc->invert);
> +
> +	ret = regmap_write(map, mc->reg, val);
> +	if (ret != 0) {
> +		dev_dbg(tas_dev->dev, "%s, Put vol %d into %x %x.\n",
> +		__func__, val, mc->reg, ret);
> +	}
> +
> +	return ret;
> +}
> +
> +static int tas2783_amp_getvol(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component
> +		= snd_soc_kcontrol_component(kcontrol);
> +	struct tasdevice_priv *tas_dev =
> +		snd_soc_component_get_drvdata(component);
> +	struct soc_mixer_control *mc =
> +		(struct soc_mixer_control *)kcontrol->private_value;
> +	struct regmap *map = tas_dev->regmap;
> +	unsigned char mask = 0;
> +	int ret = 0, val = 0;

Useless initialisation of ret.

> +
> +	if (!map || !ucontrol) {

'map' can't be NULL if the probe succeeds.

> +		dev_err(tas_dev->dev, "%s, wrong regmap.\n", __func__);
> +		return -EINVAL;
> +	}
> +	/* Read current volume from the device. */
> +	ret = regmap_read(map, mc->reg, &val);
> +	if (ret != 0) {
> +		dev_err(tas_dev->dev, "%s get AMP vol from %x with %d.\n",
> +			__func__, mc->reg, ret);
> +		return ret;
> +	}
> +
> +	mask = (1 << fls(mc->max)) - 1;
> +	mask <<= mc->shift;
> +	val = (val & mask) >> mc->shift;
> +	ucontrol->value.integer.value[0] = tasdevice_clamp(val,	mc->max,
> +		mc->invert);
> +
> +	return ret;
> +}
> +
> +static int tas2783_amp_putvol(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component
> +		= snd_soc_kcontrol_component(kcontrol);
> +	struct tasdevice_priv *tas_dev =
> +		snd_soc_component_get_drvdata(component);
> +	struct soc_mixer_control *mc =
> +		(struct soc_mixer_control *)kcontrol->private_value;
> +	struct regmap *map = tas_dev->regmap;
> +	unsigned char mask;
> +	int val, ret;
> +
> +	if (!map || !ucontrol) {

'map' can't be NULL if the probe succeeds.

> +		dev_err(tas_dev->dev, "%s, wrong regmap.\n", __func__);
> +		return -EINVAL;
> +	}
> +	mask = (1 << fls(mc->max)) - 1;
> +	mask <<= mc->shift;
> +	val = tasdevice_clamp(ucontrol->value.integer.value[0], mc->max,
> +		mc->invert);
> +	ret = regmap_update_bits(map, mc->reg, mask, val << mc->shift);
> +	if (ret != 0) {
> +		dev_err(tas_dev->dev, "Write @%#x..%#x:%d\n",
> +			mc->reg, val, ret);
> +	}
> +
> +	return ret;
> +}

...

> +static void tas2783_apply_calib(
> +	struct tasdevice_priv *tas_dev, unsigned int *cali_data)
> +{
> +	struct regmap *map = tas_dev->regmap;
> +	u8 *reg_start;
> +	int ret;
> +
> +	if (!map) {

'map' can't be NULL if the probe succeeds.

> +		dev_err(tas_dev->dev, "%s, wrong regmap.\n", __func__);
> +		return;
> +	}
> +	if (!tas_dev->sdw_peripheral) {
> +		dev_err(tas_dev->dev, "%s, slaver doesn't exist.\n",
> +			__func__);
> +		return;
> +	}
> +	if ((tas_dev->sdw_peripheral->id.unique_id < TAS2783_ID_MIN) ||
> +		(tas_dev->sdw_peripheral->id.unique_id > TAS2783_ID_MAX))
> +		return;
> +	reg_start = (u8 *)(cali_data+(tas_dev->sdw_peripheral->id.unique_id
> +		- TAS2783_ID_MIN)*sizeof(tas2783_cali_reg));
> +	for (int i = 0; i < ARRAY_SIZE(tas2783_cali_reg); i++) {
> +		ret = regmap_bulk_write(map, tas2783_cali_reg[i],
> +			reg_start + i, 4);
> +		if (ret != 0) {
> +			dev_err(tas_dev->dev, "Cali failed %x:%d\n",
> +			tas2783_cali_reg[i], ret);
> +			break;
> +		}
> +	}
> +}

...

> +static void tasdevice_rca_ready(const struct firmware *fmw, void *context)
> +{
> +	struct tasdevice_priv *tas_dev =
> +		(struct tasdevice_priv *) context;
> +	struct tas2783_firmware_node *p;
> +	struct regmap *map = tas_dev->regmap;
> +	unsigned char *buf = NULL;
> +	int offset = 0, img_sz;
> +	int ret, value_sdw;
> +
> +	mutex_lock(&tas_dev->codec_lock);
> +
> +	if (!map) {

'map' can't be NULL if the probe succeeds.

> +		dev_err(tas_dev->dev, "%s, wrong regmap.\n", __func__);
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +	if (!fmw || !fmw->data) {
> +		/* No firmware binary, devices will work in ROM mode. */
> +		dev_err(tas_dev->dev,
> +		"Failed to read %s, no side-effect on driver running\n",
> +		tas_dev->rca_binaryname);
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +	buf = (unsigned char *)fmw->data;
> +
> +	img_sz = le32_to_cpup((__le32 *)&buf[offset]);
> +	offset  += sizeof(img_sz);
> +	if (img_sz != fmw->size) {
> +		dev_err(tas_dev->dev, "Size not matching, %d %u",
> +			(int)fmw->size, img_sz);
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	while (offset < img_sz) {
> +		p = (struct tas2783_firmware_node *)(buf + offset);
> +		if (p->length > 1) {
> +			ret = regmap_bulk_write(map, p->download_addr,
> +			buf + offset + sizeof(unsigned int)*5, p->length);
> +		} else {
> +			ret = regmap_write(map, p->download_addr,
> +			*(buf + offset + sizeof(unsigned int)*5));
> +		}
> +		if (ret != 0) {
> +			dev_dbg(tas_dev->dev, "Load FW fail: %d.\n", ret);
> +			goto out;
> +		}
> +		offset += sizeof(unsigned int)*5 + p->length;
> +	}
> +	/* Select left-right channel based on unique id. */
> +	value_sdw = 0x1a;
> +	value_sdw += ((tas_dev->sdw_peripheral->id.unique_id & 1) << 4);
> +	regmap_write(map, TASDEVICE_REG(0, 0, 0x0a), value_sdw);
> +
> +	tas2783_calibration(tas_dev);
> +
> +out:
> +	mutex_unlock(&tas_dev->codec_lock);
> +	if (fmw)
> +		release_firmware(fmw);
> +}

...

> +static int tasdevice_mute(struct snd_soc_dai *dai, int mute,
> +	int direction)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct tasdevice_priv *tas_dev =
> +		snd_soc_component_get_drvdata(component);
> +	struct regmap *map = tas_dev->regmap;
> +	int ret;
> +
> +	if (!map) {

'map' can't be NULL if the probe succeeds.

> +		dev_err(tas_dev->dev, "%s, wrong regmap.\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	if (mute == 0) {/* Unmute. */
> +		/* FU23 Unmute, 0x40400108. */
> +		ret = regmap_write(map, SDW_SDCA_CTL(1, 2, 1, 0), 0);
> +		ret += regmap_write(map, TASDEVICE_REG(0, 0, 0x02), 0x0);
> +	} else {/* Mute */
> +		/* FU23 mute */
> +		ret = regmap_write(map, SDW_SDCA_CTL(1, 2, 1, 0), 1);
> +		ret += regmap_write(map, TASDEVICE_REG(0, 0, 0x02), 0x1a);
> +	}
> +	if (ret) {
> +		dev_err(tas_dev->dev, "Mute or unmute %d failed %d.\n",
> +			mute, ret);
> +	}
> +
> +	return ret;
> +}

...

> +static void tas2783_reset(struct tasdevice_priv *tas_dev)
> +{
> +	struct regmap *map = tas_dev->regmap;
> +	int ret;
> +
> +	if (!map) {

'map' can't be NULL if the probe succeeds.

> +		dev_err(tas_dev->dev, "Failed to load regmap.\n");
> +		return;
> +	}
> +	ret = regmap_write(map, TAS2873_REG_SWRESET, 1);
> +	if (ret) {
> +		dev_err(tas_dev->dev, "Reset failed.\n");
> +		return;
> +	}
> +	usleep_range(1000, 1050);
> +}

...

> +static void tasdevice_remove(struct tasdevice_priv *tas_dev)
> +{
> +	snd_soc_unregister_component(tas_dev->dev);

Is it needed?
In tasdevice_init(), devm_snd_soc_register_component() is used.

> +
> +	mutex_destroy(&tas_dev->codec_lock);
> +}
> +
> +static int tasdevice_sdw_probe(struct sdw_slave *peripheral,
> +	const struct sdw_device_id *id)
> +{
> +	struct device *dev = &peripheral->dev;
> +	struct tasdevice_priv *tas_dev;
> +	int ret;
> +
> +	tas_dev = devm_kzalloc(dev, sizeof(*tas_dev), GFP_KERNEL);
> +	if (!tas_dev) {
> +		ret = -ENOMEM;

A direct return -ENOMEM; would be cleaner IMHO...

> +		goto out;
> +	}
> +	tas_dev->dev = dev;
> +	tas_dev->chip_id = id->driver_data;
> +	tas_dev->sdw_peripheral = peripheral;
> +	tas_dev->hw_init = false;
> +
> +	dev_set_drvdata(dev, tas_dev);
> +
> +	tas_dev->regmap = devm_regmap_init_sdw(peripheral,
> +		&tasdevice_regmap);
> +	if (IS_ERR(tas_dev->regmap)) {
> +		ret = PTR_ERR(tas_dev->regmap);
> +		dev_err(dev, "Failed devm_regmap_init: %d\n", ret);

Mater of taste, but dev_err_probe() could be used

> +		goto out;
> +	}
> +	ret = tasdevice_init(tas_dev);
> +
> +out:
> +	if (ret < 0 && tas_dev != NULL)

... it would also save the "&& tas_dev != NULL" test here.

> +		tasdevice_remove(tas_dev);
> +
> +	return ret;
> +}
> +
> +static int tasdevice_sdw_remove(struct sdw_slave *peripheral)
> +{
> +	struct tasdevice_priv *tas_dev = dev_get_drvdata(&peripheral->dev);
> +
> +	if (tas_dev) {

If I'm correct, 'tas_dev is known' to be not-NULL, if 
tasdevice_sdw_remove() is called.

This test can be removed.

> +		pm_runtime_disable(tas_dev->dev);
> +		tasdevice_remove(tas_dev);
> +	}
> +
> +	return 0;
> +}
> +

...

