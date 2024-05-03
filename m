Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5998BB069
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2024 17:53:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 356B7E80;
	Fri,  3 May 2024 17:53:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 356B7E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714751633;
	bh=sc4C0K4F3XTmWdl75AnpnLYNRwZvYCekBch4PLnPnEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YEDc+r4ibqUaCl3R0N8AMrR8YGSYsAuOhHPt9QybNOLvk+KP1pg/6YnTYlOe97kbU
	 EBuzvUo3Ob8QuneU8fCgaRLs6IUQtYZG/PapOTDFJSgcFMGMMu+YIjgJl5K7Hwau/x
	 VfJnEf9D3wyuqY7T/+vpqRgR7gpRpaeFXOilS4cQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA068F8057A; Fri,  3 May 2024 17:53:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 315F2F8057F;
	Fri,  3 May 2024 17:53:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 607A9F80266; Fri,  3 May 2024 17:53:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5AC0DF8023A
	for <alsa-devel@alsa-project.org>; Fri,  3 May 2024 17:53:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AC0DF8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cilznvfm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714751592; x=1746287592;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sc4C0K4F3XTmWdl75AnpnLYNRwZvYCekBch4PLnPnEk=;
  b=cilznvfmNL4d70A5eQdNHIdy1wYMmh3K+LOVceEIIcq5h1yU8Yczccwq
   AfY+vorFnBNf6PGa3+ty2z3Jtv1dAz64ODLB1cPytnLmpvowyVKgV9iHr
   k3L1s71Ny1s9l98piTEHB+zctV1hPegkUVWCJ/9gDWelJefxRp3h6Q3u2
   oiZMht5i78uAwwE8tlc+tw+Bekcrcd+OsameR8Mz1OsstjQ2aaWkoq1zj
   LSuunIUiktm0I460yXxnl+RLoTmf03tNKkQw/pWs+BR/46+JupgTSWohf
   CIWUFzYfie1nVM7tJ7GYeEbvW3yjL1dMtCXvulY9qymTeMVXC/B1YZIna
   Q==;
X-CSE-ConnectionGUID: n8ES4Sj3QsqpAE93a5npig==
X-CSE-MsgGUID: lUMwAokbTzGgyNzBJyCrhw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14380757"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="14380757"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 08:53:09 -0700
X-CSE-ConnectionGUID: NxmVgb00QnylCsGnoo2E3w==
X-CSE-MsgGUID: pIEK1+KDQQup5ePDCpig+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="27511938"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 08:53:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s2vDX-00000003h8U-3nrd;
	Fri, 03 May 2024 18:52:59 +0300
Date: Fri, 3 May 2024 18:52:59 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	liam.r.girdwood@intel.com, bard.liao@intel.com,
	yung-chuan.liao@linux.intel.com, kevin-lu@ti.com,
	cameron.berkenpas@gmail.com, tiwai@suse.de, baojun.xu@ti.com,
	soyer@irl.hu, Baojun.Xu@fpt.com
Subject: Re: [PATCH v3] ALSA: ASoc/tas2781: Fix wrong loading calibrated data
 sequence
Message-ID: <ZjUIW3wMtib9KIKv@smile.fi.intel.com>
References: <20240502232450.484-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240502232450.484-1-shenghao-ding@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: 5EKX6QLVRKHVC5FYPPNHSNKQWVPH2ULT
X-Message-ID-Hash: 5EKX6QLVRKHVC5FYPPNHSNKQWVPH2ULT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5EKX6QLVRKHVC5FYPPNHSNKQWVPH2ULT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, May 03, 2024 at 07:24:49AM +0800, Shenghao Ding wrote:
> Calibrated data will be set to default after loading DSP config params,
> which will cause speaker protection work abnormally. Reload calibrated
> data after loading DSP config params.

...

> +static void tasdev_load_calibrated_data(struct tasdevice_priv *priv, int i)
> +{

> +	struct tasdevice_fw *cal_fmw = priv->tasdevice[i].cali_data_fmw;
> +
> +	if (cal_fmw) {

Better variant is

	struct tasdevice_calibration *cal;
	struct tasdevice_fw *cal_fmw;

	cal_fmw = priv->tasdevice[i].cali_data_fmw;
	if (!cal_fmw)
		return;

> +		struct tasdevice_calibration *cal = cal_fmw->calibrations;
> +
> +		if (cal)
> +			load_calib_data(priv, &cal->dev_data);
> +	}

In the similar way

	cal = cal_fmw->calibrations;
	if (!cal)
		return;

	load_calib_data(priv, &cal->dev_data);

> +}

The result is much easier to read and understand and maintain, as it makes
harder to squeeze the code between initialization and use and breaking things.

...

> +			if (tas_priv->tasdevice[i].is_loaderr == false
> +				&& tas_priv->tasdevice[i].is_loading == true)
>  				tas_priv->tasdevice[i].cur_prog = prm_no;

While at it, make it better (fix the indentation and move operator to
the previous line):

			if (tas_priv->tasdevice[i].is_loaderr == false &&
			    tas_priv->tasdevice[i].is_loading == true)
				tas_priv->tasdevice[i].cur_prog = prm_no;

...

>  			if (tas_priv->tasdevice[i].is_loaderr == true) {
>  				status |= 1 << (i + 4);

Side note: Use BIT()

>  				continue;

...

> +			if (tas_priv->tasdevice[i].is_loaderr == false
> +				&& tas_priv->tasdevice[i].is_loading == true) {

As per above.

> +				tasdev_load_calibrated_data(tas_priv, i);
>  				tas_priv->tasdevice[i].cur_conf = cfg_no;
> +			}

-- 
With Best Regards,
Andy Shevchenko


