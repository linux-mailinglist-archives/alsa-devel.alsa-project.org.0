Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F76CA707E
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2019 18:40:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 123F51693;
	Tue,  3 Sep 2019 18:39:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 123F51693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567528825;
	bh=PWwCw/Vqa9Y3cr0M4VPe93iV+oIUIpGhOlpcK37qTcc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t2P5jcn/GN+oyXDY4HoEHKg3yXWI3RTiZWANt/BjHwSlSBQJNnu1PEaakCROxDKcd
	 Fk9/eg0OFSpq/RYOSyqmEtbV1J4oFXjKE+MwRim4DWn8GNetCmyeWSO11sO0CAL2Mg
	 4BzPT7WB9DGm2eqdUiV56kETOlS61TzjfCuNkwwc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99CBAF80228;
	Tue,  3 Sep 2019 18:38:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55F13F8011E; Tue,  3 Sep 2019 18:38:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_72,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 013B6F8011E
 for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2019 18:38:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 013B6F8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="APOdbs66"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SJ8sp8FvDRuyze29OLcsHkJ1fO3LZuMK56azmXlvfRM=; b=APOdbs66SGlqWMxcn+FKIVqGD
 tpbvxPtv+sFs7ndBggj7ezK7Mrix3mSgR/vgyiXmz5V5wCSEnj9fAuriGJY0xtnxbG/nbbMAPIoBZ
 OS5/sm/FO0LZp0EflXUnHsjTqHjyK3+V6ExMsM0RClrjcL3uRHOucUulOjdhVNPklxobo=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i5Bp8-0000lg-QW; Tue, 03 Sep 2019 16:38:30 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 5A9D62740A95; Tue,  3 Sep 2019 17:38:29 +0100 (BST)
Date: Tue, 3 Sep 2019 17:38:29 +0100
From: Mark Brown <broonie@kernel.org>
To: richtek.jeff.chang@gmail.com
Message-ID: <20190903163829.GB7916@sirena.co.uk>
References: <1567494501-3427-1-git-send-email-richtek.jeff.chang@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1567494501-3427-1-git-send-email-richtek.jeff.chang@gmail.com>
X-Cookie: You will pass away very quickly.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH] [MT6660] Mediatek Smart Amplifier Driver
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
Content-Type: multipart/mixed; boundary="===============3214463568542186427=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3214463568542186427==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UHN/qo2QbUvPLonB"
Content-Disposition: inline


--UHN/qo2QbUvPLonB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 03, 2019 at 03:08:21PM +0800, richtek.jeff.chang@gmail.com wrote:

> --- /dev/null
> +++ b/sound/soc/codecs/mt6660.c
> @@ -0,0 +1,802 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + */

Please make the entire comment block a C++ comment so things look more
consistent.

> +struct reg_size_table {
> +	u32 addr;
> +	u8 size;
> +};

> +static const struct reg_size_table mt6660_reg_size_table[] = {
> +	{ MT6660_REG_HPF1_COEF, 4 },
> +	{ MT6660_REG_HPF2_COEF, 4 },
> +	{ MT6660_REG_TDM_CFG3, 2 },
> +	{ MT6660_REG_RESV17, 2 },
> +	{ MT6660_REG_RESV23, 2 },
> +	{ MT6660_REG_SIGMAX, 2 },
> +	{ MT6660_REG_DEVID, 2},
> +	{ MT6660_REG_TDM_CFG3, 2},
> +	{ MT6660_REG_HCLIP_CTRL, 2},
> +	{ MT6660_REG_DA_GAIN, 2},
> +};

Please talk to your hardware designers about the benefits of consistent
register sizes :/

> +static int32_t mt6660_i2c_update_bits(struct mt6660_chip *chip,
> +	uint32_t addr, uint32_t mask, uint32_t data)
> +{

It would be good to implement a regmap rather than open coding
*everything* - it'd give you things like this without needing to open
code them.  Providing you don't use the cache code it should cope fine
with variable register sizes.

> +
> +static int mt6660_i2c_init_setting(struct mt6660_chip *chip)
> +{
> +	int i, len, ret;
> +	const struct codec_reg_val *init_table;
> +
> +	init_table = e4_reg_inits;
> +	len = ARRAY_SIZE(e4_reg_inits);
> +
> +	for (i = 0; i < len; i++) {
> +		ret = mt6660_i2c_update_bits(chip, init_table[i].addr,
> +				init_table[i].mask, init_table[i].data);
> +		if (ret < 0)
> +			return ret;

Why are we not using the chip defaults here?

> +static int mt6660_chip_power_on(
> +	struct snd_soc_component *component, int on_off)
> +{
> +	struct mt6660_chip *chip = (struct mt6660_chip *)
> +		snd_soc_component_get_drvdata(component);
> +	int ret = 0;
> +	unsigned int val;
> +
> +	dev_dbg(component->dev, "%s: on_off = %d\n", __func__, on_off);
> +	mutex_lock(&chip->var_lock);
> +	if (on_off) {
> +		if (chip->pwr_cnt == 0) {
> +			ret = mt6660_i2c_update_bits(chip,
> +				MT6660_REG_SYSTEM_CTRL, 0x01, 0x00);
> +			val = mt6660_i2c_read(chip, MT6660_REG_IRQ_STATUS1);
> +			dev_info(chip->dev,
> +				"%s reg0x05 = 0x%x\n", __func__, val);
> +		}
> +		chip->pwr_cnt++;

This looks like you're open coding runtime PM stuff?  AFAICT the issue
is that you need to write to this register to do any I/O.  Just
implement this via the standard runtime PM framework, you'll need to do
something about the register I/O in the controls (ideally in the
framework, it'd be a lot easier if you did have a cache) but you could
cut out this bit.

> +static int mt6660_component_set_bias_level(struct snd_soc_component *component,
> +	enum snd_soc_bias_level level)
> +{
> +	struct snd_soc_dapm_context *dapm =
> +		snd_soc_component_get_dapm(component);
> +	int ret;
> +	unsigned int val;
> +	struct mt6660_chip *chip = snd_soc_component_get_drvdata(component);
> +
> +	if (dapm->bias_level == level) {
> +		dev_warn(component->dev, "%s: repeat level change\n", __func__);

This shouldn't be a warning.

> +static const struct snd_kcontrol_new mt6660_component_snd_controls[] = {
> +	SOC_SINGLE_EXT_TLV("Volume_Ctrl", MT6660_REG_VOL_CTRL, 0, 255,
> +			   1, snd_soc_get_volsw, mt6660_component_put_volsw,
> +			   vol_ctl_tlv),
> +	SOC_SINGLE_EXT("WDT_Enable", MT6660_REG_WDT_CTRL, 7, 1, 0,
> +		       snd_soc_get_volsw, mt6660_component_put_volsw),

These control names should all use standard ALSA control names - on/off
switches should end in Switch, volume controls in Volume.

> +	SOC_SINGLE_EXT("I2SLRS", MT6660_REG_DATAO_SEL, 6, 3, 0,
> +		       snd_soc_get_volsw, mt6660_component_put_volsw),
> +	SOC_SINGLE_EXT("I2SDOLS", MT6660_REG_DATAO_SEL, 3, 7, 0,
> +		       snd_soc_get_volsw, mt6660_component_put_volsw),
> +	SOC_SINGLE_EXT("I2SDORS", MT6660_REG_DATAO_SEL, 0, 7, 0,
> +		       snd_soc_get_volsw, mt6660_component_put_volsw),

What do these controls do?

--UHN/qo2QbUvPLonB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1ulwQACgkQJNaLcl1U
h9DsxAf8DiH9juppC2atx8j+pwupdXbxOIeEil91IOqQMEBBSSJ1oa1nPDIz1HkH
yJY7jq4QIijIkqA0b5Op3zEXSHIve3j3ZoUnN/Wrj6ODeyzrDXSvsDm/gB2/G3xJ
AQYMGCGEaL3i0OmnFBf3LKCqG/FceKjOmg7QqcuNMGqLkdHdwiNMguc+5QkuSamM
dvb3ZKnicrimjhMSocpe38qRFfcld4gJp6psfeDIQ8z2A1V8dtiNNrAbza/ArDUB
kfUE1VkdWMTs1kOrjrTZl067ZzOTLBbSiulfxzDtM1UjB3LSteshyCkoVI5K+QBW
qJJLfLqnH76e09UCIYvXbbV1J/oeRw==
=1Pf1
-----END PGP SIGNATURE-----

--UHN/qo2QbUvPLonB--

--===============3214463568542186427==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3214463568542186427==--
