Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7063A804353
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Dec 2023 01:24:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 703AE857;
	Tue,  5 Dec 2023 01:24:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 703AE857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701735876;
	bh=YDqeFlsgdFWx7XOEAsHImKa3aTbzoQWa4OZlwEWjj+Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ha8FyIvjAgwIxLfD4EF6roW34b0bQW6a85mnY91e0NGDKxQPeqHTcecaIS8+3cVVr
	 h69ABhz+uCoGZSTuoFgjfhhp4ehxCgtc02KmBxRLdCn7arxqzY7/BBySL5SmVEf/mm
	 TYT3RlE8ISB0k7WfkXmr5tt07M5FrpfWLAvr4sqo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41C69F805CB; Tue,  5 Dec 2023 01:23:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78D07F805BA;
	Tue,  5 Dec 2023 01:23:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0AC18F8055A; Tue,  5 Dec 2023 01:23:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F882F800F5
	for <alsa-devel@alsa-project.org>; Tue,  5 Dec 2023 01:23:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F882F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dVgILYr9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701735811; x=1733271811;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YDqeFlsgdFWx7XOEAsHImKa3aTbzoQWa4OZlwEWjj+Q=;
  b=dVgILYr9jWOJLlfZwwDZh8skHimSBTV0LgzmvqM/ytTxg7TzFPM3olu2
   OqfB7+CuSW41m1BFja17nDldyl11Agx9l7t8ts14pL6qGfmQNh3cwzbfM
   IzNFjKHKeyzC+cojOj2KawfnhI8Ysd3QKfA0VHP0hZ4N5zEdy9FwvBZ9V
   Nf6uYGZ2UzOjfSaXce0qha4Uc5GL3KpFsRcCZc0gUDn/vexO+pP6H9FCQ
   tNOv7p/keqiLshcHIjpKZWa/H7wBCvslyc2J2ti4CPyXEcqFC/dSLQ6zX
   ASAq6WSxuZpVmolC44jtXmylDW4/idlh2y2LlVuNFRYd48UUclZNVaVAr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="691541"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600";
   d="scan'208";a="691541"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 16:23:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="720499136"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600";
   d="scan'208";a="720499136"
Received: from akashams-mobl.amr.corp.intel.com (HELO [10.255.231.189])
 ([10.255.231.189])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 16:23:22 -0800
Message-ID: <90765ee0-a814-4852-9b2a-020cda98d930@linux.intel.com>
Date: Mon, 4 Dec 2023 18:22:02 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ALSA: hda/tas2563: Add tas2563 HDA driver
Content-Language: en-US
To: Gergo Koteles <soyer@irl.hu>, Shenghao Ding <shenghao-ding@ti.com>,
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
References: <cover.1701733441.git.soyer@irl.hu>
 <4a2f31d4eb8479789ceb1daf2e93ec0e25c23171.1701733441.git.soyer@irl.hu>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: 
 <4a2f31d4eb8479789ceb1daf2e93ec0e25c23171.1701733441.git.soyer@irl.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HREQT73J6OCRWCPZTDMDY4BKHPWM7ND4
X-Message-ID-Hash: HREQT73J6OCRWCPZTDMDY4BKHPWM7ND4
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HREQT73J6OCRWCPZTDMDY4BKHPWM7ND4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>




> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index 9677c09cf7a9..1d3e9f77c9d4 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -6770,7 +6770,7 @@ static int comp_match_cs35l41_dev_name(struct device *dev, void *data)
>  	return !strcmp(d + n, tmp);
>  }
>  
> -static int comp_match_tas2781_dev_name(struct device *dev,
> +static int comp_match_tas2xxx_dev_name(struct device *dev,
>  	void *data)
>  {
>  	struct scodec_dev_name *p = data;
> @@ -6823,7 +6823,7 @@ static void cs35l41_generic_fixup(struct hda_codec *cdc, int action, const char
>  	}
>  }
>  
> -static void tas2781_generic_fixup(struct hda_codec *cdc, int action,
> +static void tas2xxx_generic_fixup(struct hda_codec *cdc, int action,
>  	const char *bus, const char *hid)
>  {
>  	struct device *dev = hda_codec_dev(cdc);
> @@ -6841,7 +6841,7 @@ static void tas2781_generic_fixup(struct hda_codec *cdc, int action,
>  		rec->index = 0;
>  		spec->comps[0].codec = cdc;
>  		component_match_add(dev, &spec->match,
> -			comp_match_tas2781_dev_name, rec);
> +			comp_match_tas2xxx_dev_name, rec);
>  		ret = component_master_add_with_match(dev, &comp_master_ops,
>  			spec->match);
>  		if (ret)
> @@ -6888,7 +6888,13 @@ static void alc287_fixup_legion_16ithg6_speakers(struct hda_codec *cdc, const st
>  static void tas2781_fixup_i2c(struct hda_codec *cdc,
>  	const struct hda_fixup *fix, int action)
>  {
> -	 tas2781_generic_fixup(cdc, action, "i2c", "TIAS2781");
> +	 tas2xxx_generic_fixup(cdc, action, "i2c", "TIAS2781");
> +}

this sort of rename should be part of a separate patch IMHO, it'd be
easier to review.

> +
> +static void tas2563_fixup_i2c(struct hda_codec *cdc,
> +	const struct hda_fixup *fix, int action)
> +{
> +	 tas2xxx_generic_fixup(cdc, action, "i2c", "INT8866");

Any specific reason to use an Intel ACPI identifier? Why not use
"TIAS2563" ?

> +#define TAS2563_REG_INIT_N 12

newline

> +static const struct reg_default tas2563_reg_init[TAS2563_MAX_CHANNELS]
> +	[TAS2563_REG_INIT_N] = {
> +	{
> +		{ TAS2562_TDM_CFG2, 0x5a },
> +		{ TAS2562_TDM_CFG4, 0xf3 },
> +		{ TAS2562_TDM_CFG5, 0x42 },
> +		{ TAS2562_TDM_CFG6, 0x40 },
> +		{ TAS2562_BOOST_CFG1, 0xd4 },
> +		{ TAS2562_BOOST_CFG3, 0xa4 },
> +		{ TAS2562_REG(0x00, 0x36), 0x0b },
> +		{ TAS2562_REG(0x00, 0x38), 0x21 },
> +		{ TAS2562_REG(0x00, 0x3c), 0x58 },
> +		{ TAS2562_BOOST_CFG4, 0xb6 },
> +		{ TAS2562_ASI_CONFIG3, 0x04},
> +		{ TAS2562_REG(0x00, 0x47), 0xb1 },

> +/* Update the calibrate data, including speaker impedance, f0, etc, into algo.

update the calibration data,

> + * Calibrate data is done by manufacturer in the factory. These data are used

The manufacturer calibrates the data in the factory.

> + * by Algo for calucating the speaker temperature, speaker membrance excursion

calculating

membrane


> +static int tas2563_hda_i2c_probe(struct i2c_client *client)
> +{
> +	struct tas2563_data *tas2563;
> +	int ret;
> +
> +	tas2563 = devm_kzalloc(&client->dev, sizeof(struct tas2563_data),
> +		GFP_KERNEL);
> +	if (!tas2563)
> +		return -ENOMEM;
> +	tas2563->dev = &client->dev;
> +	tas2563->client = client;
> +
> +	dev_set_drvdata(tas2563->dev, tas2563);
> +
> +	ret = tas2563_read_acpi(tas2563);
> +	if (ret)
> +		return dev_err_probe(tas2563->dev, ret,
> +			"Platform not supported\n");
> +
> +	for (int i = 0; i < tas2563->ndev; ++i) {
> +		struct tas2563_dev *tasdev = &tas2563->tasdevs[i];
> +
> +		ret = tas2563_tasdev_read_efi(tas2563, tasdev);
> +		if (ret)
> +			return dev_err_probe(tas2563->dev, ret,
> +				"Calibration data cannot be read from EFI\n");
> +
> +		ret = tas2563_tasdev_init_client(tas2563, tasdev);
> +		if (ret)
> +			return dev_err_probe(tas2563->dev, ret,
> +				"Failed to init i2c client\n");
> +
> +		ret = tas2563_tasdev_init_regmap(tas2563, tasdev);
> +		if (ret)
> +			return dev_err_probe(tas2563->dev, ret,
> +				"Failed to allocate register map\n");
> +	}
> +
> +	ret = component_add(tas2563->dev, &tas2563_hda_comp_ops);
> +	if (ret) {
> +		return dev_err_probe(tas2563->dev, ret,
> +			"Register component failed\n");
> +	}

I wonder how many of those tests actually depend on deferred probe, and
if this isn't a case of copy-paste "just in case"?

> +
> +	pm_runtime_set_autosuspend_delay(tas2563->dev, 3000);
> +	pm_runtime_use_autosuspend(tas2563->dev);
> +	pm_runtime_mark_last_busy(tas2563->dev);
> +	pm_runtime_set_active(tas2563->dev);
> +	pm_runtime_get_noresume(tas2563->dev);
> +	pm_runtime_enable(tas2563->dev);
> +
> +	pm_runtime_put_autosuspend(tas2563->dev);

the sequence get_noresume/enable/put_autosuspend makes no sense to me.
doing a get_noresume *before* enable should do exactly nothing, and
releasing the resource would already be handled with autosuspend based
on the last_busy mark.

> +
> +	return 0;
> +}
> +
> +static void tas2563_hda_i2c_remove(struct i2c_client *client)
> +{
> +	struct tas2563_data *tas2563 = dev_get_drvdata(&client->dev);
> +
> +	pm_runtime_get_sync(tas2563->dev);
> +	pm_runtime_disable(tas2563->dev);
> +
> +	component_del(tas2563->dev, &tas2563_hda_comp_ops);
> +
> +	pm_runtime_put_noidle(tas2563->dev);

that pm_runtime sequence also makes no sense to me, if you disable
pm_runtime the last command is useless/no-op.

> +}
> +
> +static int tas2563_system_suspend(struct device *dev)
> +{
> +	struct tas2563_data *tas2563 = dev_get_drvdata(dev);
> +	int ret;
> +
> +	dev_dbg(tas2563->dev, "System Suspend\n");
> +
> +	ret = pm_runtime_force_suspend(dev);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int tas2563_system_resume(struct device *dev)
> +{
> +	int ret;
> +	struct tas2563_data *tas2563 = dev_get_drvdata(dev);
> +
> +	dev_dbg(tas2563->dev, "System Resume\n");
> +
> +	ret = pm_runtime_force_resume(dev);
> +	if (ret)
> +		return ret;
> +
> +	for (int i = 0; i < tas2563->ndev; ++i)
> +		tas2563_tasdev_setup(tas2563, &tas2563->tasdevs[i]);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops tas2563_hda_pm_ops = {
> +	SYSTEM_SLEEP_PM_OPS(tas2563_system_suspend, tas2563_system_resume)

where's the pm_runtime stuff?

> +};

