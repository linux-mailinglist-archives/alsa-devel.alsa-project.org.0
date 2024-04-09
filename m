Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 841AE89DA36
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Apr 2024 15:27:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FA332BB0;
	Tue,  9 Apr 2024 15:27:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FA332BB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712669261;
	bh=bjUWsJGJ49GWkXT/l3XmkoDvoj1OV3m8mUAmjwQeaBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eksiQcHmhnBqxxJ/7oCENImxjAvtqzDEMoQuZecp8F5+5bg5o4GzDUqKqQ8Mg2Zqh
	 81xDPn+E9ffCfgEqJnOot1O1TEYx9IX2gcJLT/HmdN3c4/1o/aane5UGfCmWtOlKAA
	 vDhlYACyo1Jw18lzTaOwpjKun3fxBIDqUr9vt/ZE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 907BDF80589; Tue,  9 Apr 2024 15:27:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DA7AF8057A;
	Tue,  9 Apr 2024 15:27:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47046F8026D; Tue,  9 Apr 2024 15:27:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 48B0CF800C9
	for <alsa-devel@alsa-project.org>; Tue,  9 Apr 2024 15:27:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48B0CF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZQpRbe34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712669223; x=1744205223;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bjUWsJGJ49GWkXT/l3XmkoDvoj1OV3m8mUAmjwQeaBE=;
  b=ZQpRbe34Kb5MAoSbD7BW+aQCeSFLGhs69wG+UgzGMxKEAl4En/rJRkH7
   IFh5PivMEJ7tlm7OFGn+VP49IHGBLQJcwvmQDfO86ygkvXv9mv/HKPIRW
   tqLntFEXRc+NRiAL4FkvGW1TpqEoQ0QhRLAg4rdsrgVKDPi1or/sk+AuS
   b0xFfHLjmVqmtThoCfNL9x5/x73aORu+WMQK7j8oEt1rI9uGs4Pj9PX7Z
   IRt6kmb5u8Zvk8RE2tozsE2rULrg7GBvsWuWmeQzkaQsgThlra33udukS
   F6SkPy1rcwnHMxciGxyl7E3wFy6x8pFogKkoblsQaYw/MbTtGG0ABmhkB
   Q==;
X-CSE-ConnectionGUID: AH8yIMoKR0OfspI/wPH6Eg==
X-CSE-MsgGUID: E/cME+RSTy2GS3fm5+pdFA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11776266"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000";
   d="scan'208";a="11776266"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 06:26:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="915399802"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000";
   d="scan'208";a="915399802"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 06:26:55 -0700
Received: from andy by smile with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ruBUy-00000002oWi-2L30;
	Tue, 09 Apr 2024 16:26:52 +0300
Date: Tue, 9 Apr 2024 16:26:52 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, robh+dt@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, kevin-lu@ti.com,
	shenghao-ding@ti.com, navada@ti.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com,
	yung-chuan.liao@linux.intel.com, broonie@kernel.org, soyer@irl.hu
Subject: Re: [PATCH v2 3/3] ALSA: hda/tas2781: Firmware load for tas2781
 driver for SPI
Message-ID: <ZhVCHJrjKDVOP5ji@smile.fi.intel.com>
References: <20240409024816.1180-1-baojun.xu@ti.com>
 <20240409024816.1180-4-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240409024816.1180-4-baojun.xu@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: YCN3QQ5U6L2CLA3WJWOIWCXM4DCBY5LR
X-Message-ID-Hash: YCN3QQ5U6L2CLA3WJWOIWCXM4DCBY5LR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YCN3QQ5U6L2CLA3WJWOIWCXM4DCBY5LR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Apr 09, 2024 at 10:48:15AM +0800, Baojun Xu wrote:
> Firmware download and parser lib for tas2781, it work for spi
> device with a single firmware binary file.

I believe this also can benefit from comments given against previous patches.

...

> +		im = &(calibration->dev_data);

Unneeded parentheses.

> +
> +		if (!im->dev_blks)
> +			continue;
> +
> +		for (blks = 0; blks < im->nr_blk; blks++) {
> +			block = &(im->dev_blks[blks]);
> +			if (!block)
> +				continue;
> +			kfree(block->data);
> +		}
> +		kfree(im->dev_blks);
> +	}
> +	kfree(tas_fmw->calibrations);
> +out:
> +	kfree(tas_fmw);

It may gain if you use cleanup.h from day 1.

> +}
> +
> +void tasdevice_spi_calbin_remove(void *context)
> +{
> +	struct tasdevice_priv *tas_priv = (struct tasdevice_priv *) context;

Casting is not needed.

> +	struct tasdevice *tasdev;

> +	if (!tas_priv)
> +		return;

How is this not a dead code?

> +	tasdev = &(tas_priv->tasdevice);
> +	if (tasdev->cali_data_fmw) {
> +		tas2781_clear_calfirmware(tasdev->cali_data_fmw);
> +		tasdev->cali_data_fmw = NULL;
> +	}
> +}

...

> +void tasdevice_spi_config_info_remove(void *context)
> +{
> +	struct tasdevice_priv *tas_priv = (struct tasdevice_priv *) context;
> +	struct tasdevice_rca *rca = &(tas_priv->rcabin);
> +	struct tasdevice_config_info **ci = rca->cfg_info;
> +	int i, j;
> +
> +	if (!ci)
> +		return;
> +	for (i = 0; i < rca->ncfgs; i++) {
> +		if (!ci[i])
> +			continue;
> +		if (ci[i]->blk_data) {
> +			for (j = 0; j < (int)ci[i]->real_nblocks; j++) {

Oh, explicit castings should be _rarely_ used. What's the problem with making j
to be the same type as real_nblocks?

> +				if (!ci[i]->blk_data[j])
> +					continue;
> +				kfree(ci[i]->blk_data[j]->regdata);
> +				kfree(ci[i]->blk_data[j]);
> +			}
> +			kfree(ci[i]->blk_data);
> +		}
> +		kfree(ci[i]);
> +	}
> +	kfree(ci);
> +}

...

> +	if (cfg_no >= 0
> +		&& (tas_priv->tasdevice.cur_conf != cfg_no)
> +		&& (cfg_info[rca_conf_no]->active_dev & 1)
> +		&& (tas_priv->tasdevice.is_loaderr == false)) {

This is unparsable. Please, use postfix style and proper indentation.

	if (foo &&
	    bar ...) {
		...stuff...;
	}

> +		status++;
> +		tas_priv->tasdevice.is_loading = true;
> +	} else {
> +		tas_priv->tasdevice.is_loading = false;
> +	}

...

> +	if (state == 0) {
> +		if (tas_priv->cur_prog < tas_fmw->nr_programs) {
> +			/*dsp mode or tuning mode*/
> +			profile_cfg_id = tas_priv->rcabin.profile_cfg_id;
> +			tasdevice_spi_select_tuningprm_cfg(tas_priv,
> +				tas_priv->cur_prog, tas_priv->cur_conf,
> +				profile_cfg_id);
> +		}
> +
> +		tasdevice_spi_select_cfg_blk(tas_priv, profile_cfg_id,
> +			TASDEVICE_BIN_BLK_PRE_POWER_UP);
> +	} else
> +		tasdevice_spi_select_cfg_blk(tas_priv, profile_cfg_id,
> +			TASDEVICE_BIN_BLK_PRE_SHUTDOWN);

Out of a sudden different style (no {} in 'else' branch). Try to be consistent
in style everywhere.

-- 
With Best Regards,
Andy Shevchenko


