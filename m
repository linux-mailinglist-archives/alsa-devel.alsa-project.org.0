Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BFC8D3A52
	for <lists+alsa-devel@lfdr.de>; Wed, 29 May 2024 17:09:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6D63852;
	Wed, 29 May 2024 17:09:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6D63852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716995361;
	bh=8NCxyuhk/DvRQZs56hKs9VP7H1rlq6S6aGdBa/JK6V8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BT9EAeRzmZYPS1tDWjYXDK0FqvecSWbQ41tYY5oLXWc6uCAYTHG3J49ll1mMcNb07
	 jVNLY0g11xBBOM0JI6TkKr5HMKxqvviG7qlk2jrMzpnW7nQHLUIbO+zaQpb/zSlEri
	 JdKC5tbh8O9nRqMZ/dGQHgwwj5OsuE4OVg36TBmk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14205F805AD; Wed, 29 May 2024 17:08:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 981E2F8026D;
	Wed, 29 May 2024 17:08:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3231BF80149; Wed, 29 May 2024 17:07:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A510F80051
	for <alsa-devel@alsa-project.org>; Wed, 29 May 2024 17:07:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A510F80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=AQhuw/mJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716995266; x=1748531266;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8NCxyuhk/DvRQZs56hKs9VP7H1rlq6S6aGdBa/JK6V8=;
  b=AQhuw/mJJ9eHVx1P+rIBZf1xuQjRTqoPQUnRDmorMHCs+F8Zv1WMyom5
   IOOyhTiKtmQa5azQbaHxJAH5+D6n+pUCBrgRB1QQ35yHE3tM18HAPQrrt
   i+8LgsOmsMK+5djn7NpkrvNdosWIruR539GebR4rEwdFyFsfQpXj8ziZ7
   cS9WegzFyp4DnJgSLASF78Wvjmlwd8KteWxMMM3mhJXKf+bFgrC9v9eiR
   0hP8I5QjMZRja4TIfzlR4diKaWJ1aGAWdbA9cgFcFjmGq7i/s8p9e76C6
   6iuWoIKn5633ECKN74Oh3IpcxKBdwdsxvQpsDQpC6h324oVz6ZGsg7cOG
   g==;
X-CSE-ConnectionGUID: d3bBud+zT8eOR41OA3uF7Q==
X-CSE-MsgGUID: s9uKuOBLTvOmtuOXkHrGWg==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24819794"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000";
   d="scan'208";a="24819794"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 08:07:40 -0700
X-CSE-ConnectionGUID: bnXjTNTmR+mDKtjNtmNCeA==
X-CSE-MsgGUID: EkBjuKfeSd+OG1JEkKDtyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000";
   d="scan'208";a="40466931"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 08:07:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sCKtl-0000000Bq8n-3YxA;
	Wed, 29 May 2024 18:07:29 +0300
Date: Wed, 29 May 2024 18:07:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
	alsa-devel@alsa-project.org, i-salazar@ti.com,
	linux-kernel@vger.kernel.org, j-chadha@ti.com,
	liam.r.girdwood@intel.com, jaden-yue@ti.com,
	yung-chuan.liao@linux.intel.com, dipa@ti.com, kevin-lu@ti.com,
	yuhsuan@google.com, tiwai@suse.de, baojun.xu@ti.com, soyer@irl.hu,
	Baojun.Xu@fpt.com, judyhsiao@google.com, navada@ti.com,
	cujomalainey@google.com, aanya@ti.com, nayeem.mahmud@ti.com,
	savyasanchi.shukla@netradyne.com, flaviopr@microsoft.com
Subject: Re: [PATCH v3] ASoc: tas2781: Enable RCA-based playback without DSP
 firmware download
Message-ID: <ZldEsZ7aSFbHOhd_@smile.fi.intel.com>
References: <20240529103543.2089-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529103543.2089-1-shenghao-ding@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: OG5RSCNJCJKP67CBKP7OZCD3OA7QMPSV
X-Message-ID-Hash: OG5RSCNJCJKP67CBKP7OZCD3OA7QMPSV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OG5RSCNJCJKP67CBKP7OZCD3OA7QMPSV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, May 29, 2024 at 06:35:41PM +0800, Shenghao Ding wrote:
> In only RCA(Reconfigurable Architecture) binary case, no DSP program will

"...RCA (..."

> be working inside tas2563/tas2781, that is dsp-bypass mode, do not support
> speaker protection, and audio acoustic algorithms in this mode.

Some minor issues below.

...

> -	if (tas_priv->fw_state == TASDEVICE_DSP_FW_FAIL) {
> -		dev_err(tas_priv->dev, "DSP bin file not loaded\n");
> +	/*
> +	 * Only RCA-based Playback can still work with no dsp program running
> +	 * inside the chip?
> +	 */
> +	if (!(tas_priv->fw_state == TASDEVICE_RCA_FW_OK ||

> +		tas_priv->fw_state == TASDEVICE_DSP_FW_ALL_OK)) {

This line has broken indentation and I already pointed out a few times to
such issues. It makes harder to read the code.

> +		dev_err(tas_priv->dev, "No firmware loaded\n");
>  		return;
>  	}

...

>  	scnprintf(tas_priv->coef_binaryname, 64, "%s_coef.bin",
>  		tas_priv->dev_name);
> +

Stray change?

>  	ret = tasdevice_dsp_parser(tas_priv);

...

> +	if (tas_priv->fw_state == TASDEVICE_RCA_FW_OK) {
> +		/*If DSP FW fail, DSP kcontrol won't be created */

Mind spaces in the comment.

>  		tasdevice_dsp_remove(tas_priv);
>  	}

...

> -	if (tas_priv->fw_state != TASDEVICE_DSP_FW_ALL_OK) {
> -		dev_err(tas_priv->dev, "DSP bin file not loaded\n");
> -		ret = -EINVAL;
> +	if (!(tas_priv->fw_state == TASDEVICE_DSP_FW_ALL_OK ||

> +		tas_priv->fw_state == TASDEVICE_RCA_FW_OK)) {

Broken indentation.

> +		dev_err(tas_priv->dev, "Bin file not loaded\n");
> +		return -EINVAL;
>  	}

-- 
With Best Regards,
Andy Shevchenko


