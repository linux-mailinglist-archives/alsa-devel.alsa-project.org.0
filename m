Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9730E968CD7
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Sep 2024 19:28:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1607184D;
	Mon,  2 Sep 2024 19:28:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1607184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725298124;
	bh=GiU4IMpkQczJ5KWHONcbEElaJ93yt1camchPaYrf4nM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EaPZku3A8AaoTwTJhsiD4cIlA/BY7dX/QeDkhZSHCSk+xldPoc8p3oBYCHAJ4ZMqV
	 ZBx/8Yvto5SJ2ESwEMYgiog+RDSksGUrbFzpSf40hqR1WFnNERCLzXubWU3xSGvE+4
	 EVvwdmA29dovRWp/IaZcZXCRhM2OGl9vHONbL+jQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E695F805BB; Mon,  2 Sep 2024 19:28:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50D9AF805B2;
	Mon,  2 Sep 2024 19:28:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8C6AF80217; Mon,  2 Sep 2024 19:28:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74B0BF80153
	for <alsa-devel@alsa-project.org>; Mon,  2 Sep 2024 19:28:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74B0BF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nGaLK05u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725298086; x=1756834086;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GiU4IMpkQczJ5KWHONcbEElaJ93yt1camchPaYrf4nM=;
  b=nGaLK05ur/6Fbvb4vL0w6WjzTVfCDlpXsboBSVx0DogaKwVb2kkAHjtB
   0JU3zbPocms5omeh/FuXDTTg1gPavE/y8NwND91SjjCmlaJCfad9JDu87
   l4hR8O6ewTWpMeTAoNHqgGbzCTXl/zvx5/LmIn2AKV5KpkYrYD1MLfBjD
   OTbqDXKc+XgbJLdJ1+5Pwi7/Q4+kI3QdBjM2NAoQRzSCtcDGl9jtvWt7z
   cUFFgXJxcEvY9xY5VZxf2fQntWroeYr4aHGUtpT9MKcJrgTuUdXrwE900
   vuAAAcd39Gu4vgTtWqbBrqwosKeFfkh+Xi/zTn++mHwGN/0myEayZ4gvl
   A==;
X-CSE-ConnectionGUID: T8xbthEsSwKPfODtlQOLTw==
X-CSE-MsgGUID: 7PEWG6I+QrO/yqw54E+kVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="23427707"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600";
   d="scan'208";a="23427707"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 05:16:37 -0700
X-CSE-ConnectionGUID: yU6jra/ISyaZF1Pi2DCo1Q==
X-CSE-MsgGUID: nCoiVMpNTkCCvejyOsXnTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600";
   d="scan'208";a="64634009"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 05:16:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sl5ys-00000004M2q-3jpt;
	Mon, 02 Sep 2024 15:16:26 +0300
Date: Mon, 2 Sep 2024 15:16:26 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
	zhourui@huaqin.com, alsa-devel@alsa-project.org, i-salazar@ti.com,
	liam.r.girdwood@intel.com, jaden-yue@ti.com,
	yung-chuan.liao@linux.intel.com, dipa@ti.com, yuhsuan@google.com,
	henry.lo@ti.com, tiwai@suse.de, baojun.xu@ti.com, Baojun.Xu@fpt.com,
	judyhsiao@google.com, navada@ti.com, cujomalainey@google.com,
	aanya@ti.com, nayeem.mahmud@ti.com,
	savyasanchi.shukla@netradyne.com, flaviopr@microsoft.com,
	jesse-ji@ti.com, darren.ye@mediatek.com, antheas.dk@gmail.com,
	Jerry2.Huang@lcfuturecenter.com, jim.shil@goertek.com,
	jeep.wang@goertek.com, will-wang@ti.com
Subject: Re: [PATCH v2] ASoC: tas2781: Add Calibration Kcontrols for
 Chromebook
Message-ID: <ZtWsmmQwxGT87qXL@smile.fi.intel.com>
References: <20240902062029.983-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902062029.983-1-shenghao-ding@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: IRTVA7PUT72QMKLQ47YGXJLYP2RDFYM3
X-Message-ID-Hash: IRTVA7PUT72QMKLQ47YGXJLYP2RDFYM3
X-MailFrom: andriy.shevchenko@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IRTVA7PUT72QMKLQ47YGXJLYP2RDFYM3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Sep 02, 2024 at 02:20:27PM +0800, Shenghao Ding wrote:
> Add calibration related kcontrol for speaker impedance calibration and
> speaker leakage check for Chromebook

Missing grammatical period at the end.

...

It's possible to create a macro and reduce the below _a lot_.

Look at the include/linux/propery.h on how to have a similar one.

> +static const struct bulk_reg_val tas2563_cali_start_reg[] = {

...

> +static const struct bulk_reg_val tas2781_cali_start_reg[] = {
> +	{
> +		.reg = TAS2781_PRM_INT_MASK_REG,
> +		.val = { 0xfe },
> +		.val_len = 1,
> +		.is_locked = false

Please, mind the trailing comma in these cases.

> +	},

> +};

...

> +			rc = tasdevice_dev_bulk_read(tas_priv, i, reg, &dst[1],
> +				4);

This reads much better in a single line.

...

> +static int tasdevice_active_num_put(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *codec = snd_soc_kcontrol_component(kcontrol);
> +	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
> +	int dev_id = ucontrol->value.integer.value[0];
> +	int max = tas_priv->ndev - 1, rc;
> +
> +	dev_id = clamp(dev_id, 0, max);
> +
> +	guard(mutex)(&tas_priv->codec_lock);
> +	rc = tasdev_chn_switch(tas_priv, dev_id);
> +
> +	return rc;

	int dev_id;

	dev_id = clamp(ucontrol->value.integer.value[0], 0, tas_priv->ndev - 1);

	guard(mutex)(&tas_priv->codec_lock);

	return tasdev_chn_switch(tas_priv, dev_id);

> +}

...

> +	rc = snd_soc_add_component_controls(tas_priv->codec, cali_ctrls,
> +		num_controls);

Single line?

...

> +	/*
> +	 * Alloc kcontrol via devm_kzalloc, which don't manually

devm_kzalloc()

> +	 * free the kcontrol

Missing period.

> +	 */

...

> +		/*
> +		 * package structure for tas2781 ftc start:

Package

> +		 *	Pkg len (1 byte)
> +		 *	Reg id (1 byte, constant 'r')
> +		 *	book, page, register for pilot threshold, pilot tone
> +		 *		and sine gain (12 bytes)
> +		 *	for (i = 0; i < Device-Sum; i++) {
> +		 *		Device #i index_info (1 byte)
> +		 *		Sine gain for Device #i (8 bytes)
> +		 *	}
> +		 */

...

> +	rc = snd_soc_add_component_controls(tas_priv->codec, cali_ctrls,
> +		num_controls < i ? num_controls : i);
> +
> +	return rc;

	return snd_soc_add_component_controls(tas_priv->codec, cali_ctrls,
					      num_controls < i ? num_controls : i);

Can num_controls ever be bigger than i?

> +}

-- 
With Best Regards,
Andy Shevchenko


