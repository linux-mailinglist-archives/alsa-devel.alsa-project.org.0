Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6AE94FFED
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2024 10:33:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 877882358;
	Tue, 13 Aug 2024 10:33:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 877882358
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723538017;
	bh=o6OmeuKsL9pDus+iBeUhP02BPehZcWu18YM9dAEDlVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mkKZ4uPFWLF7UO4Q8KDlxpiorsaGg4AirDCVnhR6qo/FaKT+0pyJRpiByFedpDUxe
	 VxIa5ahttbsSMRasctQ3c0V2x5X6KLKD8sHsXqx5AaUe8Et0UMuTlxzzo+vXW2sAZS
	 FUtMieyuuwPgxVVTcrOzNen6H8SwLSSH1EybssyM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 362C0F805F1; Tue, 13 Aug 2024 10:32:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BE3D4F805E0;
	Tue, 13 Aug 2024 10:32:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CDB7F80423; Tue, 13 Aug 2024 10:28:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,TIME_LIMIT_EXCEEDED,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EF410F8016E
	for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2024 10:23:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF410F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=AqBpj/ls
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723537419; x=1755073419;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=o6OmeuKsL9pDus+iBeUhP02BPehZcWu18YM9dAEDlVM=;
  b=AqBpj/lsNXD/0BAYoTbrjl3sZvd5L7mGZr2deqp/aMf/wDYpqurI6s3E
   X+x8RoaHz9WwkZdWSa6vp8ggI6N3XNIUUiG2WZg2TCO1JW8rT6+dgFw2P
   0Ra3eDN6pLpoqhpdac52teMQM5DGFMKz6Nbg0biAhaoq11woAD94RqmDa
   zg69qkw1OFcReY/kX+yuWYrGWqaQG5ckeH+DT80Xhxx3CEMX3rWBpjQB/
   LUAvDHc25it+x67kswgoN8QjHVYCDaeeqBrr8gL47Ig0OxSynWokszAgh
   CAKefRZp0w2Iqda4g16mHStc1avn14SlR6EA+3fcot9f/b+kCH+d+y2Ur
   Q==;
X-CSE-ConnectionGUID: OvILja0ATImYUEao/RKqQA==
X-CSE-MsgGUID: Q+sMCDF2TGmJ7xQqgkohpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21553632"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800";
   d="scan'208";a="21553632"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 01:23:33 -0700
X-CSE-ConnectionGUID: k4lzmBiNTcWZlLh4mvx9Rw==
X-CSE-MsgGUID: qnhV2EIeRqCcopm89Krc4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800";
   d="scan'208";a="58520574"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 01:23:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sdmoQ-0000000EeqR-1GSO;
	Tue, 13 Aug 2024 11:23:26 +0300
Date: Tue, 13 Aug 2024 11:23:26 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, 13564923607@139.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	liam.r.girdwood@intel.com, cameron.berkenpas@gmail.com,
	tiwai@suse.de, baojun.xu@ti.com, soyer@irl.hu, Baojun.Xu@fpt.com,
	robinchen@ti.com
Subject: Re: [PATCH v2] ALSA: ASoC/tas2781: fix wrong calibrated data order
Message-ID: <ZrsX_ry6bgDZB6bB@smile.fi.intel.com>
References: <20240813043749.108-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813043749.108-1-shenghao-ding@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: AUSDCLY4WFBTO3FIIARUR4AJVN7NJEIJ
X-Message-ID-Hash: AUSDCLY4WFBTO3FIIARUR4AJVN7NJEIJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AUSDCLY4WFBTO3FIIARUR4AJVN7NJEIJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Aug 13, 2024 at 12:37:48PM +0800, Shenghao Ding wrote:
> From: Baojun Xu <baojun.xu@ti.com>
> 
> Wrong calibration data order cause sound too low in some device.
> Fix wrong calibrated data order, add calibration data converssion
> by get_unaligned_be32() after reading from UEFI.

...

>  			rc = tasdevice_dev_bulk_write(tas_priv, i,
>  				TASDEVICE_REG(0, page_array[j], rgno_array[j]),
> -				&(data[4 * j]), 4);
> +				(unsigned char *)&data, 4);

Casting is not needed if the helper is written in a way how regmap IO accessors
done.

In any case, 4 is sizeof(data)

> +			offset += 4;

Ditto.

-- 
With Best Regards,
Andy Shevchenko


